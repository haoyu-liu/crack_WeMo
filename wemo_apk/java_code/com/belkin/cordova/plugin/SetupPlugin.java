package com.belkin.cordova.plugin;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.cybergarage.wrapper.UpnpDeviceSetup;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RateMe;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.utils.WifiUtil;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.localsdk.WeMoDevice;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.push.IPushNotification;
import com.belkin.wemo.push.impl.PushNotificationFactory;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.upnp.parser.GetIconVersionResponseParser;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SetupPlugin
  extends CordovaPlugin
{
  public static final String TAG = "SetupPlugin";
  Device d = null;
  private JSONArray getEndListArray;
  private BroadcastReceiver mBroadcastReceiver;
  private BroadcastReceiver mBroadcastReceiverGetend;
  private CallbackContext mCallbackContext = null;
  private Context mContext;
  DeviceListManager mDeviceListManager;
  private CallbackContext mLedCallbackContext = null;
  private SDKNetworkUtils mNetworkUtil;
  private String mPassword;
  private PluginResult mPluginResult;
  private SharePreferences mSharePreference;
  private UpnpDeviceSetup mUpnpDeviceSetup;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  private WifiUtil mWifiUtil;
  
  private void GetendThread()
  {
    this.getEndListArray = new JSONArray();
    new Thread(new Runnable()
    {
      public void run()
      {
        Intent localIntent;
        try
        {
          Log.i("SetupPlugin", "GetendThread()");
          SetupPlugin.access$1102(SetupPlugin.this, SetupPlugin.this.mUpnpDeviceSetup.parseGetEndDeviceList());
          Log.d("SetupPlugin", "Thread response: " + SetupPlugin.this.getEndListArray);
          localIntent = new Intent();
          ArrayList localArrayList = new ArrayList();
          int i = 0;
          for (;;)
          {
            int j = SetupPlugin.this.getEndListArray.length();
            if (i < j) {
              try
              {
                localArrayList.add(SetupPlugin.this.getEndListArray.getJSONObject(i).toString());
                i++;
              }
              catch (JSONException localJSONException2)
              {
                for (;;)
                {
                  localJSONException2.printStackTrace();
                }
              }
            }
          }
          localIntent.putStringArrayListExtra("getLedList", localArrayList);
        }
        catch (JSONException localJSONException1)
        {
          localJSONException1.printStackTrace();
          return;
        }
        localIntent.setAction("com.controller.belkin.hybrid.BRIDGE_DEVICES");
        SetupPlugin.this.mContext.sendBroadcast(localIntent);
      }
    }).start();
  }
  
  private boolean getendCallListener(final CallbackContext paramCallbackContext)
  {
    if (this.mBroadcastReceiverGetend != null)
    {
      Log.i("SetupPlugin", "getendCallListener Setup listener already running.");
      paramCallbackContext.error("Setup listener already running.");
      return true;
    }
    Log.i("SetupPlugin", "getendCallListener setup listeners started");
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.controller.belkin.hybrid.BRIDGE_DEVICES");
    this.mBroadcastReceiverGetend = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        Log.i("SetupPlugin", "trying to send positive result :: " + paramAnonymousContext + "  ::  " + paramCallbackContext + " " + paramAnonymousIntent.getStringArrayListExtra("getLedList"));
        if (paramAnonymousIntent.getAction().equals("com.controller.belkin.hybrid.BRIDGE_DEVICES"))
        {
          Log.i("SetupPlugin", "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.BRIDGE_DEVICES");
          JSONObject localJSONObject = new JSONObject();
          try
          {
            localJSONObject.put("listen", "get_end_device_list");
            if ((SetupPlugin.this.getEndListArray != null) && (SetupPlugin.this.getEndListArray.length() > 0)) {
              localJSONObject.put("getLedList", SetupPlugin.this.getEndListArray);
            }
            for (;;)
            {
              Log.i("SetupPlugin", "sendLedStatusIntent changed JSON: " + localJSONObject.toString());
              PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONObject);
              localPluginResult.setKeepCallback(true);
              if (localPluginResult == null) {
                break;
              }
              System.out.println("plugin status:" + localPluginResult.toString());
              paramCallbackContext.sendPluginResult(localPluginResult);
              return;
              localJSONObject.put("getLedList", paramAnonymousIntent.getStringArrayListExtra("getLedList"));
            }
            return;
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
          }
        }
      }
    };
    try
    {
      this.mContext.registerReceiver(this.mBroadcastReceiverGetend, localIntentFilter);
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.NO_RESULT);
      localPluginResult.setKeepCallback(true);
      paramCallbackContext.sendPluginResult(localPluginResult);
      return true;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  private void pushConnectionStatusIntent(String paramString1, String paramString2)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("smartString", paramString1);
    localIntent.putExtra("SSID", paramString2);
    localIntent.setAction("com.controller.belkin.hybrid.CONNECTION_STATUS");
    this.mContext.sendBroadcast(localIntent);
  }
  
  private void saveWiFiCredentials(String[] paramArrayOfString)
  {
    String str = "";
    for (int i = 0; i < paramArrayOfString.length; i++) {
      str = str + paramArrayOfString[i] + '|';
    }
    this.mSharePreference.saveSetupCredential(str);
  }
  
  private void sendStatusIntent(Intent paramIntent, String paramString, String[] paramArrayOfString)
  {
    try
    {
      Bundle localBundle = paramIntent.getExtras();
      if (localBundle == null)
      {
        Log.i("SetupPlugin", "Error, bundle is null");
        return;
      }
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("listen", paramString);
      for (int i = 0; i < paramArrayOfString.length; i++) {
        localJSONObject.put(paramArrayOfString[i], localBundle.getString(paramArrayOfString[i]));
      }
      Log.i("SetupPlugin", "sendStatusIntent changed JSON: " + localJSONObject.toString());
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONObject);
      localPluginResult.setKeepCallback(true);
      System.out.println("plugin status:" + localPluginResult.toString());
      if (localPluginResult != null)
      {
        this.mCallbackContext.sendPluginResult(localPluginResult);
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  private boolean sendWarmupIntent()
  {
    try
    {
      Log.d("SetupPlugin", "sendWarmupIntent mContext: " + this.mContext);
      Intent localIntent = new Intent();
      ArrayList localArrayList = new ArrayList();
      localArrayList.add("0");
      localIntent.putStringArrayListExtra("getLedList", localArrayList);
      localIntent.setAction("com.controller.belkin.hybrid.BRIDGE_DEVICES");
      this.mContext.sendBroadcast(localIntent);
      return true;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  private void setupAsync(final JSONArray paramJSONArray, final boolean paramBoolean)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        String[] arrayOfString1;
        String str2;
        String str3;
        String str4;
        boolean bool1;
        label400:
        int k;
        try
        {
          SetupPlugin.this.mDeviceListManager.setDevicePairingStatus(true);
          if (paramBoolean)
          {
            arrayOfString1 = SetupPlugin.this.mSharePreference.getSetupCredential().split("\\|");
            SetupPlugin.access$402(SetupPlugin.this, SetupPlugin.this.mWiFiSecurityUtil.decrypt(arrayOfString1[2], SetupPlugin.this.mContext));
            String[] arrayOfString3 = SetupPlugin.this.mUpnpDeviceSetup.getMetaInfo(SetupPlugin.this.mContext);
            SetupPlugin.access$402(SetupPlugin.this, SetupPlugin.this.mWiFiSecurityUtil.encrypt(SetupPlugin.this.mPassword, SetupPlugin.this.mContext, 0, arrayOfString3));
            arrayOfString1[2] = SetupPlugin.this.mPassword;
            str1 = SetupPlugin.this.mPassword;
            str2 = paramJSONArray.getString(0);
          }
          for (str3 = arrayOfString1[0]; (SetupPlugin.this.mUpnpDeviceSetup.isSuperSmartSetup()) || (SetupPlugin.this.mUpnpDeviceSetup.isSmartSetup()); str3 = null)
          {
            str4 = SetupPlugin.this.mUpnpDeviceSetup.pairAndRegister(arrayOfString1);
            bool1 = true;
            break label796;
            SetupPlugin.this.pushConnectionStatusIntent("0", str3);
            return;
            arrayOfString1 = new String[paramJSONArray.length()];
            for (int i = 0; i < 5; i++) {
              arrayOfString1[i] = paramJSONArray.getString(i);
            }
            str1 = SetupPlugin.this.mWiFiSecurityUtil.encrypt(paramJSONArray.get(2).toString(), SetupPlugin.this.mContext, 1, null);
            SetupPlugin.access$402(SetupPlugin.this, SetupPlugin.this.mWiFiSecurityUtil.decrypt(str1, SetupPlugin.this.mContext));
            String[] arrayOfString2 = SetupPlugin.this.mUpnpDeviceSetup.getMetaInfo(SetupPlugin.this.mContext);
            SetupPlugin.access$402(SetupPlugin.this, SetupPlugin.this.mWiFiSecurityUtil.encrypt(SetupPlugin.this.mPassword, SetupPlugin.this.mContext, 0, arrayOfString2));
            arrayOfString1[2] = SetupPlugin.this.mPassword;
            str2 = paramJSONArray.getString(5);
          }
          str4 = SetupPlugin.this.mUpnpDeviceSetup.connectHomeNetwork(arrayOfString1);
          bool1 = false;
        }
        catch (JSONException localJSONException)
        {
          String str1;
          SetupPlugin.this.mDeviceListManager.setDevicePairingStatus(true);
          RateMe.doNotShowRatingPopUp(SetupPlugin.this.mContext);
          return;
        }
        arrayOfString1[2] = str1;
        SetupPlugin.this.sleep2s();
        int j = 0;
        if (SetupPlugin.this.mUpnpDeviceSetup.UpnpInitialization()) {
          k = 1;
        }
        for (int m = 0;; m++)
        {
          int n = 0;
          if (m < 30)
          {
            if (!SetupPlugin.this.mNetworkUtil.forceConnectToAP(str2, bool1)) {
              break label621;
            }
            if (SetupPlugin.this.mUpnpDeviceSetup == null) {
              SetupPlugin.access$102(SetupPlugin.this, new UpnpDeviceSetup(SetupPlugin.this.mContext));
            }
            j = SetupPlugin.this.mUpnpDeviceSetup.getNetworkStatus();
            if ((j == 1) || (j == 3))
            {
              if ((paramBoolean) || (!Boolean.parseBoolean(str4))) {
                break label811;
              }
              SetupPlugin.this.saveWiFiCredentials(arrayOfString1);
              SetupPlugin.this.mSharePreference.saveConfigurationStatus(true);
              break label811;
            }
            if (j == 0) {
              break label678;
            }
            n = 1;
            RateMe.doNotShowRatingPopUp(SetupPlugin.this.mContext);
          }
          label621:
          label678:
          label796:
          label811:
          do
          {
            while ((bool1) && (n == 0) && (k == 0))
            {
              SetupPlugin.this.smartSetup(str3);
              return;
              if (bool1)
              {
                boolean bool2 = paramBoolean;
                k = 0;
                n = 0;
                if (!bool2)
                {
                  boolean bool3 = Boolean.parseBoolean(str4);
                  k = 0;
                  n = 0;
                  if (bool3)
                  {
                    SetupPlugin.this.saveWiFiCredentials(arrayOfString1);
                    k = 0;
                    n = 0;
                  }
                }
              }
              else
              {
                try
                {
                  Thread.sleep(2000L);
                }
                catch (InterruptedException localInterruptedException)
                {
                  localInterruptedException.printStackTrace();
                }
              }
            }
            if (str2.equalsIgnoreCase(SetupPlugin.this.mNetworkUtil.getSSID()))
            {
              SetupPlugin.this.pushConnectionStatusIntent("" + j, str3);
              return;
            }
            SetupPlugin.this.pushConnectionStatusIntent("5", str3);
            return;
            SetupPlugin.this.pushConnectionStatusIntent("" + 0, str3);
            RateMe.doNotShowRatingPopUp(SetupPlugin.this.mContext);
            return;
            if (str4 == null) {
              break;
            }
            if (str4 != "") {
              break label400;
            }
            break;
            n = 0;
          } while (!bool1);
        }
      }
    });
  }
  
  private void sleep2s()
  {
    try
    {
      Thread.sleep(2000L);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      localInterruptedException.printStackTrace();
    }
  }
  
  private boolean smartSetup(String paramString)
  {
    Log.i("SetupPlugin", "smartSetup, No longer connected to wemo - Flow B, checking network type till it connects or timeout");
    long l = System.currentTimeMillis();
    int i = 0;
    try
    {
      String str;
      do
      {
        Thread.sleep(10000L);
        str = this.mNetworkUtil.getNetworkType();
        StringBuilder localStringBuilder = new StringBuilder().append("smartSetup, checking network type till it connects or timeout try: ");
        i++;
        Log.i("SetupPlugin", i + " networkType: " + str);
      } while (("No_Network".equals(str)) && (System.currentTimeMillis() - l < 60000L));
      pushConnectionStatusIntent("6", paramString);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException.printStackTrace();
      }
    }
  }
  
  private boolean startSmartSetupListeners(CallbackContext paramCallbackContext)
  {
    if (this.mBroadcastReceiver != null)
    {
      Log.i("SetupPlugin", "startSmartSetupListeners Setup listener already running.");
      paramCallbackContext.error("Setup listener already running.");
      return true;
    }
    Log.i("SetupPlugin", "startSmartSetupListeners setup listeners started");
    this.mCallbackContext = paramCallbackContext;
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.controller.belkin.hybrid.WIFI_STATE_CHANGED");
    localIntentFilter.addAction("com.controller.belkin.hybrid.CONNECTION_STATUS");
    localIntentFilter.addAction("com.controller.belkin.hybrid.SMART_REGISTRATION");
    localIntentFilter.addAction("com.controller.belkin.hybrid.SMART_CHECK_WEMO");
    this.mBroadcastReceiver = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        Log.i("SetupPlugin", "trying to send positive result");
        if (paramAnonymousIntent.getAction().equals("com.controller.belkin.hybrid.WIFI_STATE_CHANGED"))
        {
          Log.i("SetupPlugin", "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.WIFI_STATE_CHANGED");
          String[] arrayOfString4 = { "smartString" };
          SetupPlugin.this.sendStatusIntent(paramAnonymousIntent, "wifi_state_changed", arrayOfString4);
        }
        do
        {
          return;
          if (paramAnonymousIntent.getAction().equals("com.controller.belkin.hybrid.CONNECTION_STATUS"))
          {
            Log.i("SetupPlugin", "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.CONNECTION_STATUS");
            String[] arrayOfString3 = { "smartString", "SSID" };
            SetupPlugin.this.sendStatusIntent(paramAnonymousIntent, "smart_network_stablized", arrayOfString3);
            return;
          }
          if (paramAnonymousIntent.getAction().equals("com.controller.belkin.hybrid.SMART_CHECK_WEMO"))
          {
            Log.i("SetupPlugin", "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SMART_CHECK_WEMO");
            String[] arrayOfString2 = { "smartString" };
            SetupPlugin.this.sendStatusIntent(paramAnonymousIntent, "check_wemo_after_setup", arrayOfString2);
            return;
          }
        } while (!paramAnonymousIntent.getAction().equals("com.controller.belkin.hybrid.SMART_REGISTRATION"));
        Log.i("SetupPlugin", "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SMART_REGISTRATION");
        String[] arrayOfString1 = { "smartString" };
        SetupPlugin.this.sendStatusIntent(paramAnonymousIntent, "smart_registration", arrayOfString1);
      }
    };
    try
    {
      this.mContext.registerReceiver(this.mBroadcastReceiver, localIntentFilter);
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.NO_RESULT);
      localPluginResult.setKeepCallback(true);
      paramCallbackContext.sendPluginResult(localPluginResult);
      return true;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  private boolean stopSmartSetupListeners(CallbackContext paramCallbackContext)
  {
    if (this.mBroadcastReceiver != null) {
      try
      {
        this.mContext.unregisterReceiver(this.mBroadcastReceiver);
        this.mBroadcastReceiver = null;
        this.mPluginResult = new PluginResult(PluginResult.Status.OK);
        this.mPluginResult.setKeepCallback(false);
        this.mCallbackContext.sendPluginResult(this.mPluginResult);
        this.mCallbackContext = null;
        paramCallbackContext.success();
        return true;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Log.e("SetupPlugin", "Error unregistering device listener: " + localException.getMessage(), localException);
        }
      }
    }
    paramCallbackContext.error(1);
    return true;
  }
  
  private boolean stopgetEndSetupListeners(CallbackContext paramCallbackContext)
  {
    if (this.mBroadcastReceiverGetend != null) {
      try
      {
        this.mContext.unregisterReceiver(this.mBroadcastReceiverGetend);
        this.mBroadcastReceiverGetend = null;
        this.mPluginResult = new PluginResult(PluginResult.Status.OK);
        this.mPluginResult.setKeepCallback(false);
        this.mLedCallbackContext.sendPluginResult(this.mPluginResult);
        this.mLedCallbackContext = null;
        paramCallbackContext.success();
        return true;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Log.e("SetupPlugin", "Error unregistering device listener: " + localException.getMessage(), localException);
        }
      }
    }
    paramCallbackContext.error(1);
    return true;
  }
  
  public boolean execute(String paramString, final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.debugLog("SetupPlugin", "SetupPlugin execute method for ACTION = " + paramString + "; Params = " + paramJSONArray + "; Context: " + this.mContext);
    if (paramString.equals("isNetworkConnected"))
    {
      boolean bool6 = this.mNetworkUtil.isNetworkConnected();
      Log.i("SetupPlugin", "is Network Connected: " + bool6);
      if (bool6) {}
      for (String str13 = "true";; str13 = "false")
      {
        paramCallbackContext.success(str13);
        return true;
      }
    }
    String str12;
    if (paramString.equals("isPluginConnected"))
    {
      boolean bool5 = this.mNetworkUtil.isPluginConnected();
      Log.i("SetupPlugin", "is plugin Connected: " + bool5);
      if (bool5)
      {
        str12 = "true";
        paramCallbackContext.success(str12);
      }
    }
    label850:
    do
    {
      for (;;)
      {
        return false;
        str12 = "false";
        break;
        if (paramString.equals("openWifiSettings"))
        {
          this.mContext.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
          return true;
        }
        if (paramString.equals("recreateControlPoint"))
        {
          Log.i("SetupPlugin", "ACTION_RECREATE_CONTROL_POINT_NEW");
          Runnable local1 = new Runnable()
          {
            public void run()
            {
              try
              {
                if (SetupPlugin.this.mDeviceListManager == null) {
                  SetupPlugin.this.mDeviceListManager = DeviceListManager.getInstance(SetupPlugin.this.mContext);
                }
                SetupPlugin.this.mDeviceListManager.recreateControlPoint(true);
                paramCallbackContext.success();
                return;
              }
              catch (Exception localException)
              {
                localException.printStackTrace();
              }
            }
          };
          WeMoThreadPoolHandler.executeInBackground(local1);
          return true;
        }
        if (paramString.equals("setupDeviceDetails"))
        {
          LogUtils.debugLog("SetupPlugin", "setupDeviceDetails");
          Runnable local2 = new Runnable()
          {
            public void run()
            {
              FileStorage.getInstance(null).setReload(true);
              if (SetupPlugin.this.mUpnpDeviceSetup == null) {
                SetupPlugin.access$102(SetupPlugin.this, new UpnpDeviceSetup(SetupPlugin.this.mContext));
              }
              try
              {
                Thread.yield();
                Thread.sleep(4000L);
                SetupPlugin.this.cordova.getThreadPool().execute(new Runnable()
                {
                  public void run()
                  {
                    try
                    {
                      Thread.sleep(15000L);
                      FileStorage.getInstance(null).setReload(false);
                      return;
                    }
                    catch (InterruptedException localInterruptedException)
                    {
                      for (;;)
                      {
                        LogUtils.errorLog("SetupPlugin", "Exception during ACTION_SETUP_DEVICE_DETAILS :: setReload", localInterruptedException);
                      }
                    }
                  }
                });
                localJSONArray = new JSONArray();
                if (SetupPlugin.this.d != null) {}
              }
              catch (InterruptedException localInterruptedException)
              {
                try
                {
                  SetupPlugin.this.d = SetupPlugin.this.mUpnpDeviceSetup.getSetupDevice();
                  String str1 = SetupPlugin.this.mNetworkUtil.getSSID();
                  LogUtils.infoLog("SetupPlugin", "deviceSSID: " + str1);
                  localJSONArray.put(str1);
                  if (SetupPlugin.this.d != null)
                  {
                    localJSONArray.put(SetupPlugin.this.d.getDeviceType());
                    if (!SetupPlugin.this.mUpnpDeviceSetup.isSuperSmartSetup()) {
                      break label570;
                    }
                    localJSONArray.put("SUPER_SMART_SETUP");
                    String str2 = "";
                    if (SetupPlugin.this.d != null)
                    {
                      localJSONArray.put(SetupPlugin.this.d.getFriendlyName());
                      localJSONArray.put(SetupPlugin.this.d.getBrandName());
                      Action localAction = SetupPlugin.this.d.getAction("GetIconVersion");
                      if (localAction == null) {
                        break label613;
                      }
                      String str4 = localAction.postControlAction();
                      if (TextUtils.isEmpty(str4)) {
                        break label603;
                      }
                      int i = new GetIconVersionResponseParser().parseResponse(str4);
                      LogUtils.errorLog("SetupPlugin", "Icon version of setup device: " + i);
                      if (i > 0)
                      {
                        String str5 = "http://" + SetupPlugin.this.d.getIPAddress() + ":" + SetupPlugin.this.d.getPort() + "/icon.jpg";
                        str2 = DeviceListManager.saveIconToStorage(str5, SetupPlugin.this.d.getMacAddress(), String.valueOf(i));
                        LogUtils.debugLog("SetupPlugin", "Downloaded icon from URL: " + str5 + "; UDN: " + SetupPlugin.this.d.getUDN() + "Icon Loc in storage: " + str2);
                      }
                      if (SetupPlugin.this.mDeviceListManager == null) {
                        SetupPlugin.this.mDeviceListManager = DeviceListManager.getInstance(SetupPlugin.this.mContext);
                      }
                      SetupPlugin.this.mDeviceListManager.deviceAdded(SetupPlugin.this.d);
                    }
                    localJSONArray.put(str2);
                    String str3 = "";
                    if (SetupPlugin.this.d != null) {
                      str3 = SetupPlugin.this.d.getUDN();
                    }
                    localJSONArray.put(str3);
                    paramCallbackContext.success(localJSONArray);
                    return;
                    localInterruptedException = localInterruptedException;
                    LogUtils.errorLog("SetupPlugin", "Exception during ACTION_SETUP_DEVICE_DETAILS ", localInterruptedException);
                  }
                }
                catch (Exception localException)
                {
                  for (;;)
                  {
                    JSONArray localJSONArray;
                    localException.printStackTrace();
                    continue;
                    localJSONArray.put("");
                    continue;
                    label570:
                    if (SetupPlugin.this.mUpnpDeviceSetup.isSmartSetup())
                    {
                      localJSONArray.put("SMART_SETUP");
                    }
                    else
                    {
                      localJSONArray.put("");
                      continue;
                      label603:
                      LogUtils.errorLog("SetupPlugin", "GET ICON VERSION Action response is EMPTY.");
                      continue;
                      label613:
                      LogUtils.errorLog("SetupPlugin", "GET ICON VERSION Action not supported by setup device.");
                    }
                  }
                }
              }
            }
          };
          WeMoThreadPoolHandler.executeInBackground(local2);
          return true;
        }
        if (paramString.equals("getFirmwareVersion"))
        {
          Device localDevice3 = this.mUpnpDeviceSetup.getSetupDevice();
          String str11 = "";
          if (localDevice3 != null)
          {
            WeMoDevice localWeMoDevice = WeMoSDKContext.getInstance(this.mContext).getWeMoDeviceByUDN(localDevice3.getUDN());
            if (localWeMoDevice != null) {
              str11 = localWeMoDevice.getFirmwareVersion();
            }
          }
          paramCallbackContext.success(str11);
          return true;
        }
        if (paramString.equals("stopUpNpService"))
        {
          if (DevicePlugin.mWeMoSDKContext != null)
          {
            DevicePlugin.mWeMoSDKContext.stop();
            DevicePlugin.mWeMoSDKContext = null;
          }
          if (this.mUpnpDeviceSetup != null)
          {
            this.mUpnpDeviceSetup = null;
            this.mNetworkUtil.unRegisterNetwork();
          }
          paramCallbackContext.success();
          return true;
        }
        if (paramString.equals("getConfigStatus"))
        {
          if (this.mSharePreference.checkConfigurationStatus()) {}
          for (String str10 = "true";; str10 = "false")
          {
            paramCallbackContext.success(str10);
            Log.i("SetupPlugin", this.mSharePreference.checkConfigurationStatus() + "");
            return true;
          }
        }
        if (paramString.equals("connectToDeafultRouter"))
        {
          Log.i("SetupPlugin", "(action.equals(CordovaConstants.ACTION_CONNECT_TO_DEFAULT_ROUTER)");
          if (this.mSharePreference.getSetupCredential() == null)
          {
            Log.e("SetupPlugin", "setupAsync savedConfig is null");
            paramCallbackContext.error(0);
            return false;
          }
          setupAsync(paramJSONArray, true);
          return true;
        }
        if (paramString.equals("getWiFiAPList"))
        {
          ExecutorService localExecutorService2 = this.cordova.getThreadPool();
          Runnable local3 = new Runnable()
          {
            public void run()
            {
              try
              {
                SetupPlugin.this.mDeviceListManager.setDevicePairingStatus(false);
                paramCallbackContext.success(SetupPlugin.this.mUpnpDeviceSetup.getAllApList());
                return;
              }
              catch (Exception localException)
              {
                localException.printStackTrace();
              }
            }
          };
          localExecutorService2.execute(local3);
          return true;
        }
        if (paramString.equals("postAPPasswordData"))
        {
          Log.i("SetupPlugin", "(action.equals(CordovaConstants.ACTION_POST_AP_PASSWORD_DATA)");
          setupAsync(paramJSONArray, false);
          return true;
        }
        if (paramString.equals("getEndDevicesNew"))
        {
          sendWarmupIntent();
          paramCallbackContext.success();
          return true;
        }
        if (paramString.equals("setFriendlyName"))
        {
          String str9 = paramJSONArray.get(0).toString();
          if (str9 == null)
          {
            paramCallbackContext.success();
            return true;
          }
          JSONObject localJSONObject4 = this.mUpnpDeviceSetup.setFriendlyName(new String[] { str9 });
          if ((localJSONObject4 != null) && (localJSONObject4.getString("ChangeFriendlyName").equalsIgnoreCase("true")))
          {
            Device localDevice2 = this.mUpnpDeviceSetup.getSetupDevice();
            if (this.mDeviceListManager == null) {
              this.mDeviceListManager = DeviceListManager.getInstance(this.mContext);
            }
            this.mDeviceListManager.updateFriendlyName(localDevice2.getUDN(), str9);
          }
          paramCallbackContext.success(localJSONObject4);
          return true;
        }
        if (!paramString.equals("editIconInSetup")) {
          break label850;
        }
        if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
        {
          String str8 = paramJSONArray.getJSONObject(0).getString("icon");
          if (this.mUpnpDeviceSetup.editIcon(str8))
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK));
            return true;
          }
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        }
        else
        {
          LogUtils.errorLog("SetupPlugin", "ACTION_EDIT_ICON_IN_SETUP: inParamArray is NULL or empty");
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        }
      }
      if (paramString.equals("getNetworkStatus"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.networkStatus());
        return true;
      }
      if (paramString.equals("closeAccessPoint"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.closeSetup());
        return true;
      }
      if (paramString.equals("connectWiFiRouter"))
      {
        String[] arrayOfString2 = this.mSharePreference.getSetupCredential().split("\\|");
        if (this.mWifiUtil.connectWiFiNetwork(arrayOfString2)) {}
        for (String str7 = "true";; str7 = "false")
        {
          paramCallbackContext.success(str7);
          return true;
        }
      }
      if (paramString.equals("setConfigStatus"))
      {
        this.mSharePreference.saveConfigurationStatus(paramJSONArray.getBoolean(0));
        paramCallbackContext.success();
        return true;
      }
      if (paramString.equals("setDeviceImage"))
      {
        try
        {
          LogUtils.infoLog("SetupPlugin", "SET_DEVICE_IMAGE: " + Uri.parse(paramJSONArray.getString(0)));
          String str6 = this.mUpnpDeviceSetup.getIconUrl().getString("GetIconURL");
          if ((str6.equals("")) || (str6 == null)) {
            str6 = this.mUpnpDeviceSetup.getSetupDevice().getAbsoluteURL("icon.jpg");
          }
          LogUtils.infoLog("SetupPlugin", "UPLOAD IMAGE TO: " + str6 + " new");
          this.mUpnpDeviceSetup.setIconUsingUri(Uri.parse(paramJSONArray.getString(0)), str6);
          paramCallbackContext.success();
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
          }
        }
        return true;
      }
      if (paramString.equals("getDefaultRouterSSID"))
      {
        String[] arrayOfString1 = this.mSharePreference.getSetupCredential().split("\\|");
        Log.i("SetupPlugin", "configArray[0]" + arrayOfString1[0]);
        paramCallbackContext.success(arrayOfString1[0]);
        return true;
      }
      if (paramString.equals("enableRemoteAccess"))
      {
        ExecutorService localExecutorService1 = this.cordova.getThreadPool();
        Runnable local4 = new Runnable()
        {
          public void run()
          {
            try
            {
              JSONObject localJSONObject = SetupPlugin.this.mUpnpDeviceSetup.enableRemoteAccess();
              String str1 = "";
              int i = 0;
              if (localJSONObject != null)
              {
                int j = localJSONObject.length();
                i = 0;
                if (j > 0)
                {
                  boolean bool1 = localJSONObject.isNull("statusCode");
                  i = 0;
                  if (!bool1)
                  {
                    str1 = localJSONObject.getString("statusCode");
                    i = 0;
                    if (str1 != null)
                    {
                      boolean bool2 = str1.isEmpty();
                      i = 0;
                      if (!bool2)
                      {
                        SetupPlugin.this.mSharePreference.setRemoteAutoEnableNeeded(false);
                        boolean bool3 = str1.equalsIgnoreCase("S");
                        i = 0;
                        if (bool3)
                        {
                          JSONArray localJSONArray = paramJSONArray;
                          i = 0;
                          if (localJSONArray != null)
                          {
                            HashSet localHashSet = new HashSet();
                            String str2 = paramJSONArray.getString(0);
                            localHashSet.add(str2);
                            SetupPlugin.this.mSharePreference.setHomeSSIDs(localHashSet);
                            SetupPlugin.this.mSharePreference.setRemoteAccessSSID(str2);
                            String str3 = localJSONObject.getString("privateKeyPhone");
                            if (!str3.equalsIgnoreCase("NOKEY")) {
                              SetupPlugin.this.mSharePreference.storePrivateKey(str3);
                            }
                            SetupPlugin.this.mSharePreference.storeHomeId(localJSONObject.getString("homeId"));
                            SetupPlugin.this.mSharePreference.setRemoteEnabled(true);
                            i = 1;
                            LogUtils.infoLog("SetupPlugin", "ACTION_ENABLE_REMOTE_ACCESS successful. Registering for Push Notifications...");
                            PushNotificationFactory.getInstance().registerPushNotifications(SetupPlugin.this.mContext, null, null);
                          }
                        }
                      }
                    }
                  }
                }
              }
              if (i != 0)
              {
                paramCallbackContext.success(str1);
                return;
              }
              paramCallbackContext.error("Set Up Plugin Error");
              return;
            }
            catch (JSONException localJSONException)
            {
              localJSONException.printStackTrace();
            }
          }
        };
        localExecutorService1.execute(local4);
        return true;
      }
      if (paramString.equals("startSetupListeners")) {
        return startSmartSetupListeners(paramCallbackContext);
      }
      if (paramString.equals("stopSetupListeners")) {
        return stopSmartSetupListeners(paramCallbackContext);
      }
      if (paramString.equals("startgetendListeners")) {
        return getendCallListener(paramCallbackContext);
      }
      if (paramString.equals("stopgetendListeners")) {
        return stopgetEndSetupListeners(paramCallbackContext);
      }
      if (paramString.equals("openNetwork"))
      {
        Log.i("SetupPlugin", "ACTION_OPEN_NETWORK_SETUP");
        paramCallbackContext.success(this.mUpnpDeviceSetup.openBridgeNetwork());
        return true;
      }
      if (paramString.equals("getEndDevices"))
      {
        GetendThread();
        this.mPluginResult = new PluginResult(PluginResult.Status.OK);
        this.mPluginResult.setKeepCallback(false);
        paramCallbackContext.sendPluginResult(this.mPluginResult);
        paramCallbackContext.success();
        return true;
      }
      if (paramString.equals("closeNetwork"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.closeBridgeNetwork());
        return true;
      }
      if (paramString.equals("addDevice"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.addBridgeDevices(paramJSONArray));
        return true;
      }
      if (paramString.equals("setledstatus"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.setLedDeviceStatus(paramJSONArray.getJSONArray(0), paramJSONArray.getJSONArray(1)));
        return true;
      }
      if (paramString.equals("setAttributes"))
      {
        Log.v("SetupPlugin", ":::::ACTION_SET_ATTRIBUTES::: ");
        JSONObject localJSONObject3 = paramJSONArray.getJSONObject(0);
        return this.mUpnpDeviceSetup.setAttribute(localJSONObject3);
      }
      if (paramString.equals("getAttributes"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.getAttribute());
        return true;
      }
      if (paramString.equals("setCustomizedState"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.setCustomState());
        return true;
      }
      if (paramString.equals("getCustomizedState"))
      {
        paramCallbackContext.success(this.mUpnpDeviceSetup.getCustomState());
        return true;
      }
      if (paramString.equals("2051"))
      {
        Log.i("SetupPlugin", "ACTION_SAVE_REMOTE_REGISTRATION");
        saveRemoteRegistrationData(paramJSONArray);
        paramCallbackContext.success();
        return true;
      }
      if (paramString.equals("CheckAutoNetworkSwitch"))
      {
        LogUtils.infoLog("SetupPlugin", "ACTION CheckAutoNetworkSwitch");
        JSONObject localJSONObject2 = new JSONObject();
        boolean bool3 = isPoorNetworkAvoidanceEnabled(this.mContext);
        boolean bool4 = isScanningAlwaysAvailableEnabled(this.mContext);
        LogUtils.infoLog("SetupPlugin", "isPoorNetworkAvoidanceEnabled:" + bool3 + " " + "isScanningAlwaysAvailableEnabled:" + bool4);
        localJSONObject2.put("isScanningAlwaysAvailableEnabled", bool4);
        localJSONObject2.put("isPoorNetworkAvoidanceEnabled", bool3);
        paramCallbackContext.success(localJSONObject2);
        return true;
      }
      if (paramString.equals("updateZigbeeInCacheDB"))
      {
        LogUtils.infoLog("SetupPlugin", "ACTION_UPDATE_ZIGBEE_IN_CACHEDB");
        LogUtils.infoLog("SetupPlugin", "inParamArray:" + paramJSONArray);
        DeviceListManager.getInstance(this.mContext).initiateScanZigBeeDevice(paramJSONArray.get(0).toString());
        paramCallbackContext.success(new JSONObject().put("success", true));
        return true;
      }
      if (paramString.equals("initControlPoint"))
      {
        LogUtils.infoLog("SetupPlugin", "ACTION_INIT_CONTROL_POINT");
        DeviceListManager localDeviceListManager = DeviceListManager.devListManager;
        if (localDeviceListManager == null) {
          localDeviceListManager = DeviceListManager.getInstance(this.mContext);
        }
        if (localDeviceListManager != null) {
          localDeviceListManager.initControlPoint();
        }
        paramCallbackContext.success();
        return true;
      }
    } while (!paramString.equals("setBinaryStateInSetup"));
    String str1;
    int i;
    PluginResult.Status localStatus2;
    if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
    {
      JSONObject localJSONObject1 = paramJSONArray.getJSONObject(0);
      if (localJSONObject1 != null)
      {
        str1 = localJSONObject1.getString("udn");
        Device localDevice1 = this.mDeviceListManager.getUpnpControl().getDevice(str1);
        if (localDevice1 != null)
        {
          Action localAction = localDevice1.getAction("SetBinaryState");
          if (localAction != null)
          {
            String str2 = localJSONObject1.getString("state");
            String str3 = localJSONObject1.getString("brightness");
            String str4 = localJSONObject1.getString("fader");
            localAction.setArgumentValue("brightness", str3);
            localAction.setArgumentValue("fader", str4);
            localAction.setArgumentValue(com.belkin.wemo.cache.devicelist.UpnpConstants.SET_BINARY_STATE_ARGS[0], str2);
            String str5 = localAction.postControlAction();
            LogUtils.infoLog("SetupPlugin", "SETUP: SetBinaryState action response: " + str5);
            boolean bool1 = TextUtils.isEmpty(str5);
            i = 0;
            if (!bool1)
            {
              boolean bool2 = str5.toLowerCase(Locale.getDefault()).contains("upnperror");
              i = 0;
              if (!bool2) {
                i = 1;
              }
            }
            if (i == 0) {
              break label2192;
            }
            localStatus2 = PluginResult.Status.OK;
          }
        }
      }
    }
    label2192:
    PluginResult.Status localStatus1;
    for (PluginResult localPluginResult = new PluginResult(localStatus2);; localPluginResult = new PluginResult(localStatus1))
    {
      paramCallbackContext.sendPluginResult(localPluginResult);
      return true;
      LogUtils.errorLog("SetupPlugin", "SETUP: SetBinaryState Action is NULL for udn: " + str1);
      i = 0;
      break;
      LogUtils.errorLog("SetupPlugin", "SETUP: SetBinaryState: Control Point device is NULL for udn: " + str1);
      i = 0;
      break;
      LogUtils.errorLog("SetupPlugin", "SETUP: SetBinaryState: JSONObject containing params is NULL");
      i = 0;
      break;
      LogUtils.errorLog("SetupPlugin", "SETUP: SetBinaryState: Input Param array is NULL");
      i = 0;
      break;
      localStatus1 = PluginResult.Status.ERROR;
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    Log.i("SetupPlugin", "SetupPlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    DevicePlugin.mWeMoSDKContext = WeMoSDKContext.getInstance(this.mContext);
    this.mUpnpDeviceSetup = UpnpDeviceSetup.getInstance(this.mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mWifiUtil = new WifiUtil(this.mContext);
    this.mNetworkUtil = new SDKNetworkUtils(this.mContext);
    this.mDeviceListManager = DeviceListManager.getInstance(this.mContext);
  }
  
  @TargetApi(17)
  public boolean isPoorNetworkAvoidanceEnabled(Context paramContext)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    int i;
    if (Build.VERSION.SDK_INT >= 17) {
      i = Settings.Global.getInt(localContentResolver, "wifi_watchdog_poor_network_test_enabled", -1);
    }
    while (i != -1) {
      if (i == 1)
      {
        return true;
        if (Build.VERSION.SDK_INT >= 15) {
          i = Settings.Secure.getInt(localContentResolver, "wifi_watchdog_poor_network_test_enabled", -1);
        } else {
          return false;
        }
      }
      else
      {
        return false;
      }
    }
    if (Build.VERSION.SDK_INT >= 17) {
      try
      {
        Field localField = Class.forName("android.net.wifi.WifiWatchdogStateMachine").getField("DEFAULT_POOR_NETWORK_AVOIDANCE_ENABLED");
        if (!localField.isAccessible()) {
          localField.setAccessible(true);
        }
        boolean bool = localField.getBoolean(null);
        return bool;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        return false;
      }
      catch (NoSuchFieldException localNoSuchFieldException)
      {
        return false;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        return false;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        return false;
      }
    }
    return true;
  }
  
  @TargetApi(18)
  public boolean isScanningAlwaysAvailableEnabled(Context paramContext)
  {
    try
    {
      if (Build.VERSION.SDK_INT >= 18)
      {
        boolean bool = ((WifiManager)paramContext.getSystemService("wifi")).isScanAlwaysAvailable();
        if (bool) {
          return true;
        }
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("SetupPlugin", localException.getMessage());
    }
    return false;
  }
  
  protected void saveRemoteRegistrationData(JSONArray paramJSONArray)
  {
    boolean bool = true;
    try
    {
      String str1 = this.mSharePreference.getSetupCredential();
      Object localObject;
      if (str1 != null)
      {
        localObject = str1.split("\\|")[0];
        if (!((String)localObject).equalsIgnoreCase(this.mNetworkUtil.getSSID())) {
          bool = false;
        }
      }
      for (;;)
      {
        this.mSharePreference.setRemoteAutoEnableNeeded(false);
        String str2 = paramJSONArray.getString(3);
        if (!str2.equalsIgnoreCase("NOKEY")) {
          this.mSharePreference.storePrivateKey(str2);
        }
        this.mSharePreference.storeHomeId(paramJSONArray.getString(2));
        HashSet localHashSet1 = new HashSet();
        localHashSet1.add(localObject);
        this.mSharePreference.setHomeSSIDs(localHashSet1);
        this.mSharePreference.setRemoteAccessSSID((String)localObject);
        if (bool)
        {
          String str3 = this.mNetworkUtil.getArpMac();
          if ((str3 != null) && (str3.length() > 0))
          {
            HashSet localHashSet2 = new HashSet();
            localHashSet2.add(str3);
            this.mSharePreference.setARPMacs(localHashSet2);
          }
        }
        this.mSharePreference.setRemoteEnabled(true);
        Log.i("SetupPlugin", "saveRemoteRegistrationData: HomeId: " + this.mSharePreference.getHomeId() + " PrivateKey: " + this.mSharePreference.getPrivateKey() + " HomeSSID: " + this.mSharePreference.getHomeSSIDs() + " RemoteEnabled: " + this.mSharePreference.isRemoteEnabled() + " setupFallbackRouterSame: " + bool);
        return;
        String str4 = this.mNetworkUtil.getSSID();
        localObject = str4;
      }
      return;
    }
    catch (Exception localException)
    {
      Log.i("SetupPlugin", "saveRemoteRegistrationData Exception: " + localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/SetupPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */