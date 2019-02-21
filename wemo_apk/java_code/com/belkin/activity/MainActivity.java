package com.belkin.activity;

import android.app.AlarmManager;
import android.app.Dialog;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import android.text.TextUtils;
import com.belkin.controller.DeviceListController;
import com.belkin.controller.WidgetController;
import com.belkin.controller.listener.CropImageByUserCallback;
import com.belkin.controller.listener.PhotoRequestedListener;
import com.belkin.controller.listener.SelectPhotoListener;
import com.belkin.controller.listener.TakePictureListener;
import com.belkin.cordova.plugin.DevicePlugin;
import com.belkin.cordova.plugin.SmartDevicePlugin;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RateMe;
import com.belkin.utils.WemoAP;
import com.belkin.wemo.PermListner;
import com.belkin.wemo.PermissionController;
import com.belkin.wemo.PermissionController.PermissionListener;
import com.belkin.wemo.PermissionListners;
import com.belkin.wemo.Permissions;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.broadcastreceiver.PushNotificationOnRemoteAccessListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.push.IPushNotification;
import com.belkin.wemo.push.broadcastreceiver.PushMessageDialogBroadcastReceiver;
import com.belkin.wemo.push.impl.PushNotificationFactory;
import com.soundcloud.android.crop.Crop;
import org.apache.cordova.Config;
import org.apache.cordova.CordovaActivity;

public class MainActivity
  extends CordovaActivity
  implements PhotoRequestedListener, PermissionListners
{
  public static final int REQUEST_CODE_CAPTURE_PHOTO = 101;
  public static final int REQUEST_CODE_IMAGE_CROP = 102;
  public static final int REQUEST_CODE_SELECT_PHOTO = 100;
  private static final String TAG = MainActivity.class.getSimpleName();
  public static Dialog mProgressDialog;
  public static ProgressDialog mRuleProgressDialog;
  private PushMessageDialogBroadcastReceiver broadcastReceiver;
  private Uri cameraImageLocationUri;
  private CropImageByUserCallback cropImageByUserCallback;
  private boolean isAppFromBackground = false;
  private boolean isPhotoRequested;
  private DeviceListManager mDeviceListManager = null;
  private BroadcastReceiver mNetworkChangeBroadcastReceiver = null;
  private SDKNetworkUtils mNetworkUtil;
  private SmartDevicePlugin mSmartDevicePlugin = null;
  private PermissionController mpermissionController;
  private PermListner permListner;
  private PushNotificationOnRemoteAccessListener remoteAccessListener;
  private SelectPhotoListener selectPhotoListener;
  private TakePictureListener takePictureListener;
  
  private void checkIfAppUpgraded()
  {
    try
    {
      int i = getPackageManager().getPackageInfo(getPackageName(), 0).versionCode;
      SharePreferences localSharePreferences = new SharePreferences(this);
      String str = localSharePreferences.getAppVersionCode();
      int j = 0;
      if (str != null)
      {
        int k = str.trim().length();
        j = 0;
        if (k > 0) {
          j = Integer.parseInt(str);
        }
      }
      LogUtils.debugLog(TAG, "currentAppVersionCode: " + i);
      LogUtils.debugLog(TAG, "previousAppVersionCode: " + j);
      if ((j > 60) && (i > j))
      {
        localSharePreferences.setAppVersionCode(Integer.toString(i));
        RateMe.reset(this);
        finish();
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog(TAG, "Exception", localException);
    }
  }
  
  private void initDevManager()
  {
    LogUtils.infoLog(TAG, "initDevManager()");
    if (this.mDeviceListManager == null)
    {
      this.mDeviceListManager = DeviceListManager.getInstance(getApplicationContext());
      this.mDeviceListManager.disableCacheStat(true);
    }
  }
  
  private void logApplicationStartMode()
  {
    if (this.mNetworkUtil == null) {
      this.mNetworkUtil = new SDKNetworkUtils(this);
    }
    if (this.mNetworkUtil.getNetworkType().equalsIgnoreCase("Home")) {
      LogUtils.infoLog(TAG, "ApplicationStart-StartHome");
    }
    while (!this.mNetworkUtil.getNetworkType().equalsIgnoreCase("Remote_WiFi")) {
      return;
    }
    LogUtils.infoLog(TAG, "ApplicationStart-StartRemote_WiFi");
  }
  
  private void registerNetworkChangeBroadcastReceiver()
  {
    if (this.mNetworkChangeBroadcastReceiver == null) {
      this.mNetworkChangeBroadcastReceiver = new BroadcastReceiver()
      {
        public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
        {
          String str = paramAnonymousIntent.getAction();
          LogUtils.infoLog(MainActivity.TAG, "Connectivity: Broadcast Received. Action: " + str);
          if (str.equals("com.wemo.belkin.NETWORK_SWICTHED"))
          {
            if (WemoUtils.isAppInForeground())
            {
              LogUtils.debugLog(MainActivity.TAG, "Connectivity: App in Foreground. RESTARTING WEMO APP.");
              Intent localIntent = new Intent(paramAnonymousContext, MainActivity.class);
              localIntent.addFlags(67141632);
              PendingIntent localPendingIntent = PendingIntent.getActivity(paramAnonymousContext, 1, localIntent, 268435456);
              ((AlarmManager)paramAnonymousContext.getSystemService("alarm")).set(1, 1000L + System.currentTimeMillis(), localPendingIntent);
              System.exit(0);
            }
          }
          else {
            return;
          }
          LogUtils.debugLog(MainActivity.TAG, "Connectivity: App in Background. KILLING WEMO APP.");
          MainActivity.this.finish();
        }
      };
    }
    registerReceiver(this.mNetworkChangeBroadcastReceiver, new IntentFilter("com.wemo.belkin.NETWORK_SWICTHED"));
  }
  
  private void registerPushNotificationDialogReceiver()
  {
    if (this.broadcastReceiver == null)
    {
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE");
      this.broadcastReceiver = new PushMessageDialogBroadcastReceiver();
      registerReceiver(this.broadcastReceiver, localIntentFilter);
    }
  }
  
  private void registerRemoteEnabledEventsReceiver()
  {
    if (this.remoteAccessListener == null)
    {
      LogUtils.infoLog(TAG, "Registering for REMOTE_ENABLE events via OnRemoteEnabledBroadcastReceiver");
      this.remoteAccessListener = new PushNotificationOnRemoteAccessListener(this);
      RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this.remoteAccessListener);
    }
  }
  
  private void unregisterNetworkChangeBroadcastReceiver()
  {
    if (this.mNetworkChangeBroadcastReceiver != null)
    {
      unregisterReceiver(this.mNetworkChangeBroadcastReceiver);
      this.mNetworkChangeBroadcastReceiver = null;
    }
  }
  
  private void unregisterPushNotificationDialogReceiver()
  {
    if (this.broadcastReceiver != null)
    {
      unregisterReceiver(this.broadcastReceiver);
      this.broadcastReceiver = null;
    }
  }
  
  private void unregisterRemoteEnabledEventsReceiver()
  {
    if (this.remoteAccessListener != null)
    {
      LogUtils.infoLog(TAG, "un-registering any broadcastreceiver for REMOTE_ENABLE events via OnRemoteEnabledBroadcastReceiver");
      RemoteAccessBroadcastService.getInstance().removeRemoteAccessListener(this.remoteAccessListener);
      this.remoteAccessListener = null;
    }
  }
  
  public boolean locationPermissionCheck()
  {
    try
    {
      if (this.mpermissionController.canAccessLocation()) {
        return true;
      }
      this.mpermissionController.askLocPermission();
      return false;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    LogUtils.debugLog(TAG, "EDIT ICON: Activity Lifecycle: onActivityResult. Request Code: " + paramInt1 + "; Result Code: " + paramInt2 + "; Camera  Image Location URI: " + this.cameraImageLocationUri);
    if (paramInt1 == 101)
    {
      this.isPhotoRequested = true;
      if (this.takePictureListener != null)
      {
        if ((paramInt2 != -1) || (this.cameraImageLocationUri == null)) {
          break label105;
        }
        this.takePictureListener.onPictureTaken(this.cameraImageLocationUri);
        this.takePictureListener = null;
      }
    }
    label105:
    label196:
    do
    {
      do
      {
        do
        {
          return;
          this.takePictureListener.onTakePictureError("EDIT ICON: Activity result from camera was not ok.");
          break;
          if (paramInt1 != 100) {
            break label196;
          }
          this.isPhotoRequested = true;
        } while (this.selectPhotoListener == null);
        if (paramInt2 == -1) {
          if (paramIntent != null) {
            this.selectPhotoListener.onPhotoSelected(paramIntent.getData());
          }
        }
        for (;;)
        {
          this.selectPhotoListener = null;
          return;
          this.selectPhotoListener.onPhotoSelectionError("EDIT ICON: Intent from gallery didn't contain image uri.");
          continue;
          this.selectPhotoListener.onPhotoSelectionError("EDIT ICON: Activity result from gallery was not ok.");
        }
      } while (paramInt1 != 102);
      this.isPhotoRequested = true;
    } while (this.cropImageByUserCallback == null);
    if (paramInt2 == -1) {
      this.cropImageByUserCallback.onImageCropped(Crop.getOutput(paramIntent));
    }
    for (;;)
    {
      this.cropImageByUserCallback = null;
      return;
      this.cropImageByUserCallback.onCropError("EDIT ICON: Activity result from crop was NOT OK. Result code: " + paramInt2);
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    LogUtils.debugLog(TAG, "Activity Lifecycle: onConfigurationChanged()");
    super.onConfigurationChanged(paramConfiguration);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    LogUtils.infoLog(TAG, "Activity Lifecycle: onCreate");
    super.onCreate(paramBundle);
    initDevManager();
    this.mSmartDevicePlugin = new SmartDevicePlugin(this);
    WidgetController.getInstance(this);
    this.mpermissionController = PermissionController.getInstance(this);
    DeviceListController.getInstance(this).setPhotoRequestListener(this);
    Permissions.getInstance(this).setLocationRequestListener(this);
    registerNetworkChangeBroadcastReceiver();
    if (this.mNetworkUtil == null) {
      this.mNetworkUtil = new SDKNetworkUtils(this);
    }
    Intent localIntent = getIntent();
    String str1 = null;
    if (localIntent != null)
    {
      String str2 = getIntent().getStringExtra("eventCode");
      boolean bool1 = TextUtils.isEmpty(str2);
      str1 = null;
      if (!bool1)
      {
        boolean bool2 = str2.equalsIgnoreCase("overtempon");
        str1 = null;
        if (bool2)
        {
          String str3 = localIntent.getStringExtra("macAddress");
          boolean bool3 = TextUtils.isEmpty(str3);
          str1 = null;
          if (!bool3) {
            str1 = "file:///android_asset/www/devices.html#page/wemo_devices/showOverTempWarning/mac=" + str3;
          }
        }
      }
    }
    if (TextUtils.isEmpty(str1)) {
      str1 = Config.getStartUrl();
    }
    LogUtils.debugLog(TAG, "URL to load into WebView: " + str1);
    loadUrl(str1);
    mProgressDialog = new Dialog(this);
    mRuleProgressDialog = new ProgressDialog(this);
    PushNotificationFactory.getInstance().registerPushNotifications(this, null, null);
  }
  
  public void onCropImageByUser(Uri paramUri, CropImageByUserCallback paramCropImageByUserCallback)
  {
    LogUtils.debugLog(TAG, "EDIT ICON: onCropImageByUser");
    this.cropImageByUserCallback = paramCropImageByUserCallback;
    Crop.of(paramUri, paramUri).asSquare().start(this, 102);
  }
  
  public void onDestroy()
  {
    LogUtils.debugLog(TAG, "Activity Lifecycle: onDestroy");
    if (mProgressDialog != null)
    {
      mProgressDialog.dismiss();
      mProgressDialog = null;
    }
    if (mRuleProgressDialog != null)
    {
      mRuleProgressDialog.dismiss();
      mRuleProgressDialog = null;
    }
    if (DevicePlugin.mWeMoSDKContext != null)
    {
      DevicePlugin.mWeMoSDKContext.stop();
      DevicePlugin.mWeMoSDKContext = null;
    }
    if (SmartDevicePlugin.sDeviceListManager != null)
    {
      SmartDevicePlugin.sDeviceListManager.stop();
      SmartDevicePlugin.sDeviceListManager = null;
    }
    this.mSmartDevicePlugin = null;
    this.mDeviceListManager = null;
    this.isAppFromBackground = false;
    DeviceListController.getInstance(this).setPhotoRequestListener(null);
    Permissions.getInstance(this).setLocationRequestListener(null);
    unregisterNetworkChangeBroadcastReceiver();
    PushNotificationFactory.getInstance().unregisterPushNotifications(this, null, null);
    super.onDestroy();
  }
  
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    setIntent(paramIntent);
  }
  
  protected void onPause()
  {
    super.onPause();
    LogUtils.debugLog(TAG, "Activity Lifecycle: onPause. isPhotoRequested: " + this.isPhotoRequested);
    if (!this.isPhotoRequested)
    {
      WemoUtils.setAppForeground(false);
      this.mSmartDevicePlugin.onPauseDLM();
    }
    this.isAppFromBackground = true;
    unregisterPushNotificationDialogReceiver();
    unregisterRemoteEnabledEventsReceiver();
  }
  
  public void onPermissionCheck(PermListner paramPermListner)
  {
    this.permListner = paramPermListner;
    if (this.mpermissionController.canAccessLocation())
    {
      this.permListner.onPermGranted();
      return;
    }
    this.mpermissionController.askLocationPermission(new PermissionController.PermissionListener()
    {
      public void permissionResult(boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean)
        {
          MainActivity.this.permListner.onPermGranted();
          return;
        }
        MainActivity.this.permListner.onPermDenied();
      }
    });
  }
  
  public void onRequestPermissionsResult(int paramInt, String[] paramArrayOfString, int[] paramArrayOfInt)
  {
    this.mpermissionController.onRequestPermissionsResult(paramInt, paramArrayOfString, paramArrayOfInt);
  }
  
  protected void onResume()
  {
    super.onResume();
    LogUtils.debugLog(TAG, "Activity Lifecycle: onResume. isPhotoRequested: " + this.isPhotoRequested);
    if (!this.isPhotoRequested)
    {
      WemoUtils.setAppForeground(true);
      this.mSmartDevicePlugin.onResumeDLM();
      if (this.isAppFromBackground) {
        RateMe.handleRateMePopup(this, this.mDeviceListManager);
      }
    }
    for (;;)
    {
      registerPushNotificationDialogReceiver();
      logApplicationStartMode();
      try
      {
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().permitNetwork().build());
        registerRemoteEnabledEventsReceiver();
        LogUtils.debugLog(TAG, "Activity Lifecycle: onResume END");
        return;
        this.isPhotoRequested = false;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          LogUtils.errorLog(TAG, "Error setting thread policy :" + localException.getMessage());
        }
      }
    }
  }
  
  public void onSelectPhoto(SelectPhotoListener paramSelectPhotoListener)
  {
    Intent localIntent = new Intent("android.intent.action.GET_CONTENT");
    localIntent.setType("image/*");
    if (localIntent.resolveActivity(getPackageManager()) != null)
    {
      this.isPhotoRequested = true;
      this.selectPhotoListener = paramSelectPhotoListener;
      startActivityForResult(localIntent, 100);
      return;
    }
    paramSelectPhotoListener.onPhotoSelectionError("No activity available to respond to ACTION_GET_CONTENT intent.");
  }
  
  protected void onStart()
  {
    super.onStart();
    LogUtils.debugLog(TAG, "Activity Lifecycle: onStart");
    this.mSmartDevicePlugin.onStartDLM();
  }
  
  protected void onStop()
  {
    super.onStop();
    LogUtils.debugLog(TAG, "Activity Lifecycle: onStop");
    checkIfAppUpgraded();
    RateMe.dismiss();
    WemoAP.dismiss();
  }
  
  public void onTakePicture(TakePictureListener paramTakePictureListener, Uri paramUri)
  {
    LogUtils.debugLog(TAG, "EDIT ICON: onTakePicture: Request received.");
    final Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
    localIntent.putExtra("output", paramUri);
    if (localIntent.resolveActivity(getPackageManager()) != null)
    {
      this.isPhotoRequested = true;
      this.takePictureListener = paramTakePictureListener;
      this.cameraImageLocationUri = paramUri;
      if (this.mpermissionController.canAccessCamera())
      {
        startActivityForResult(localIntent, 101);
        return;
      }
      this.mpermissionController.askCameraPermission(new PermissionController.PermissionListener()
      {
        public void permissionResult(boolean paramAnonymousBoolean)
        {
          if (paramAnonymousBoolean) {
            MainActivity.this.startActivityForResult(localIntent, 101);
          }
        }
      });
      return;
    }
    paramTakePictureListener.onTakePictureError("EDIT ICON: onTakePicture: No activity available to respond to ACTION_IMAGE_CAPTURE intent.");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/activity/MainActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */