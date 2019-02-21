package com.belkin.cordova.plugin;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.text.TextUtils;
import com.belkin.controller.AppController;
import com.belkin.controller.DeviceListController;
import com.belkin.controller.SensorEventChangeController;
import com.belkin.controller.SensorEventChangeListener;
import com.belkin.cordova.plugin.callback.FindBulbCallback;
import com.belkin.cordova.plugin.callback.GetBlobStorageCallback;
import com.belkin.cordova.plugin.callback.HideDeviceCallback;
import com.belkin.cordova.plugin.callback.ResetDeviceCallback;
import com.belkin.cordova.plugin.callback.SetBlobStorageCallback;
import com.belkin.cordova.plugin.runnable.FindBulbRunnable;
import com.belkin.cordova.plugin.runnable.GetBlobStorageRunnable;
import com.belkin.cordova.plugin.runnable.HideDeviceRunnable;
import com.belkin.cordova.plugin.runnable.ResetDeviceRunnable;
import com.belkin.cordova.plugin.runnable.SetBlobStorageRunnable;
import com.belkin.devices.callback.DevicePresetCallBack;
import com.belkin.devices.callback.GetSensorEventFromDBCallBack;
import com.belkin.devices.callback.GetSensorEventHistoryCallBack;
import com.belkin.devices.runnable.BridgeDiscoveryRunnable;
import com.belkin.devices.runnable.DeleteDevicePresetRunnable;
import com.belkin.devices.runnable.GetDevicePresetRunnable;
import com.belkin.devices.runnable.GetSensorEventRunnable;
import com.belkin.devices.runnable.GetSensorEventsFromDBRunnable;
import com.belkin.devices.runnable.SetDevicePresetRunnable;
import com.belkin.devices.runnable.WeMoAppRecoveryRunnable;
import com.belkin.firmware.FirmwareUpdateManager;
import com.belkin.rules.db.RMRulesDBManager;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RateMe;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.ZigBeeDeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager.NotificationListenerDLM;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.impl.WeMoRulesFactory;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SmartDevicePlugin
  extends CordovaPlugin
  implements DeviceListManager.NotificationListenerDLM, DeviceListManagerCallbacksActivity, SensorEventChangeListener, RemoteAccessBroadcastService.RemoteAccessListener
{
  public static final String ACTION_ADD_TO_GROUP = "addToGroup";
  public static final String ACTION_ARE_NEST_FIRMWARE_SUPPORTED = "areNestFirmwareSupported";
  public static final String ACTION_CALIBRATE = "calibrate";
  public static final String ACTION_CALL_EMERGENCY_CONTACT = "callEmeregencyContact";
  public static final String ACTION_CHECK_BOHNJOUR = "checkBohnjour";
  public static final String ACTION_CHOOSE_PHOTO = "choosePhoto";
  public static final String ACTION_COLLECT_EMAILID_API = "collectEmailID";
  public static final String ACTION_CONFIGURE_DIMMING_RANGE = "configureDimmingRange";
  public static final String ACTION_CONFIGURE_HUSHMODE = "configureHushMode";
  public static final String ACTION_DEAUTHORIZE_NEST = "deauthorizeNest";
  public static final String ACTION_DELETE_DEVICE_PRESET = "deleteDevicePreset";
  public static final String ACTION_FIND_BULB = "findBulb";
  public static final String ACTION_GET_BLOB_STORAGE = "getBlobStorageData";
  public static final String ACTION_GET_DEVICE = "getDevice";
  public static final String ACTION_GET_DEVICES = "getDevices";
  public static final String ACTION_GET_DEVICES_INFO = "getDevicesInfo";
  public static final String ACTION_GET_DEVICE_PRESET = "getDevicePreset";
  public static final String ACTION_GET_EVENTS_FROM_DB = "getEventHistoryFromDB";
  public static final String ACTION_GET_EVENT_HISTORY = "getEventHistory";
  public static final String ACTION_GET_NEST_DEVICES = "getNestDevices";
  public static final String ACTION_GET_NIGHT_MODE_CONFIGURATION = "getNightModeConfiguration";
  public static final String ACTION_GET_SENSOR_NOTIFICATIONS_COUNT = "getSensorNotificationsCount";
  public static final String ACTION_GET_SUBDEVICES_COUNT = "getSubDevicesCount";
  public static final String ACTION_HIDE_DEVICE = "hideDevice";
  public static final String ACTION_HIDE_GROUP = "hideGroup";
  public static final String ACTION_NEST_TOKEN_EXIST_FOR_GIVEN_HOME_ID = "nestTokenExistForGivenHomeId";
  public static final String ACTION_REFRESH_DEVICE_LIST = "refreshDevices";
  public static final String ACTION_REFRESH_LONG_PRESS_RULE_DETAILS = "refreshLongPressRuleDetails";
  public static final String ACTION_REMOVE_GROUP = "removeFromGroup";
  public static final String ACTION_RESET_DEVICE = "resetDevice";
  public static final String ACTION_RESET_HOME_NETWORK = "onReset";
  public static final String ACTION_SET_BLOB_STORAGE = "setBlobStorageData";
  public static final String ACTION_SET_BULB_TYPE = "setBulbType";
  public static final String ACTION_SET_DEVICE_PRESET = "setDevicePreset";
  public static final String ACTION_SET_DEVICE_PROPERTIES = "setDeviceProperties";
  public static final String ACTION_SET_DEVICE_STATE = "setDeviceState";
  public static final String ACTION_SET_GROUP_STATE = "setGroupState";
  public static final String ACTION_SET_INSIGHT_DRAWER_STATE = "setInsightDrawerState";
  public static final String ACTION_SET_NIGHT_MODE_CONFIGURATION = "setNightModeConfiguration";
  public static final String ACTION_TAKE_PICTURE = "takePicture";
  public static final String ACTION_WEMO_APP_RECOVERY = "appRecovery";
  public static final String TAG = "SmartDevicePlugin";
  public static RMRulesDBManager rMRulesDBManager;
  public static DeviceListManager sDeviceListManager;
  private ConnectivityManager conMan = null;
  private AppController mAppController;
  private CallbackContext mCallbackContext = null;
  private Context mContext = null;
  private Map<String, CallbackContext> mDeviceCallbacks;
  private DeviceListController mDeviceListController;
  private SDKNetworkUtils mSDKNetworkUtil;
  private SensorEventChangeController mSensorStateChange = null;
  private SharePreferences mSharePreference;
  HashMap<String, String[]> weeklyRecordsHashMap = null;
  
  public SmartDevicePlugin() {}
  
  public SmartDevicePlugin(Context paramContext)
  {
    this.mContext = paramContext;
    this.mSharePreference = new SharePreferences(paramContext);
    this.mSDKNetworkUtil = new SDKNetworkUtils(paramContext);
    this.mDeviceListController = DeviceListController.getInstance(paramContext);
    RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this);
  }
  
  private void addDeviceCallbackContext(String paramString, CallbackContext paramCallbackContext)
  {
    LogUtils.infoLog("SmartDevicePlugin", "addDeviceCallbackContext: udn: " + paramString + "context: " + paramCallbackContext);
    this.mDeviceCallbacks.put(paramString, paramCallbackContext);
  }
  
  private boolean checkCacheClearance()
  {
    boolean bool1 = false;
    for (;;)
    {
      try
      {
        String str1 = this.mSDKNetworkUtil.getSSID();
        str2 = this.mSharePreference.getCacheSSID();
        bool1 = false;
        if ((str2 != null) && (str2.trim().length() != 0))
        {
          boolean bool2 = NetworkMode.isLocal();
          sDeviceListManager.updateLocalMode();
          boolean bool3 = NetworkMode.isLocal();
          LogUtils.infoLog("SmartDevicePlugin", "checkCacheClearance cachedSSID: " + str2 + " currentSSID: " + str1 + " prevIsLocal: " + bool2 + " currentIsLocal: " + bool3 + " isRemoteEnabled: " + this.mSharePreference.isRemoteEnabled());
          bool1 = false;
          if (str2 != null)
          {
            boolean bool4 = str1.equals(str2);
            bool1 = false;
            if (!bool4)
            {
              bool1 = false;
              if (bool3)
              {
                this.mSharePreference.setCacheSSID(str1);
                clearCache();
                bool1 = true;
              }
            }
          }
          sDeviceListManager.onNetworkChange(this);
          if ((str2 == null) && (NetworkMode.isLocal())) {
            this.mSharePreference.setCacheSSID(str1);
          }
          return bool1;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return bool1;
      }
      String str2 = null;
    }
  }
  
  private void clearCache()
  {
    sDeviceListManager.resetHomeNetwork();
    this.mSharePreference.set("BelkinWeMoApp", "deviceCache", "");
    this.mSharePreference.set("BelkinWeMoApp", "ledDeviceCache", "");
  }
  
  private void enableRemoteAccess()
  {
    if (!this.mSharePreference.getRemoteAutoEnableNeeded()) {
      new Timer().schedule(new TimerTask()
      {
        public void run()
        {
          try
          {
            if (SmartDevicePlugin.sDeviceListManager.setRemoteAccess().getBoolean(0)) {
              SmartDevicePlugin.this.mSharePreference.setRemoteAutoEnableNeeded(false);
            }
            return;
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
          }
        }
      }, 10000L);
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (sDeviceListManager != null)
    {
      sDeviceListManager.addNotificationListener(this);
      LogUtils.infoLog("SmartDevicePlugin", "action: " + paramString);
      if (!"getDevices".equals(paramString)) {
        break label166;
      }
      sDeviceListManager.setDevicePairingStatus(false);
      sDeviceListManager.resetInsightDrawerState();
      sDeviceListManager.restartCloudPeriodicUpdate();
      JSONArray localJSONArray3 = this.mDeviceListController.getDevices();
      if ((localJSONArray3 == null) || (localJSONArray3.length() <= 0)) {
        break label156;
      }
      RateMe.handleRateMePopup(this.mContext, sDeviceListManager);
      LogUtils.infoLog("SmartDevicePlugin", "ACTION_GET_DEVICES : deviceList " + localJSONArray3.toString());
      paramCallbackContext.success(localJSONArray3);
    }
    for (;;)
    {
      return true;
      sDeviceListManager = DeviceListManager.getInstance(this, this.mContext);
      sDeviceListManager.addNotificationListener(this);
      break;
      label156:
      paramCallbackContext.error("error fetching device list");
      continue;
      label166:
      if ("getSensorNotificationsCount".equals(paramString))
      {
        LogUtils.infoLog("SmartDevicePlugin", "ACTION_GET_SENSOR_NOTIFICATIONS_COUNT::");
        paramCallbackContext.success(SharePreferences.getSensorEventsCount(this.mContext));
      }
      else if ("callEmeregencyContact".equals(paramString))
      {
        String str5 = paramJSONArray.getJSONObject(0).getString("Number");
        LogUtils.infoLog("SmartDevicePlugin", "Emergency Params: " + str5);
        boolean bool2 = this.mAppController.callEmergencyContact(str5, this.mContext);
        LogUtils.infoLog("SmartDevicePlugin", "Result for callEmergencyContact :: " + bool2);
        if (bool2)
        {
          PluginResult localPluginResult6 = new PluginResult(PluginResult.Status.OK, new JSONObject());
          localPluginResult6.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(localPluginResult6);
        }
        else
        {
          PluginResult localPluginResult7 = new PluginResult(PluginResult.Status.ERROR);
          localPluginResult7.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(localPluginResult7);
        }
      }
      else if ("getDevice".equals(paramString))
      {
        LogUtils.infoLog("SmartDevicePlugin", "Params: " + paramJSONArray.toString());
        if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
        {
          String str4 = paramJSONArray.getJSONObject(0).getString("udn");
          if ((str4 != null) && (!str4.isEmpty()))
          {
            JSONObject localJSONObject13 = this.mDeviceListController.getDevice(str4);
            if (localJSONObject13 != null)
            {
              LogUtils.infoLog("SmartDevicePlugin", "ACTION_GET_DEVICE : device Object " + localJSONObject13.toString());
              paramCallbackContext.success(localJSONObject13);
            }
            else
            {
              paramCallbackContext.error("error fetching device object");
            }
          }
          else
          {
            paramCallbackContext.error("udn is null or empty");
          }
        }
        else
        {
          paramCallbackContext.error("inParamArray is null or empty");
        }
      }
      else if ("setDeviceState".equals(paramString))
      {
        LogUtils.infoLog("SmartDevicePlugin", "Params: " + paramJSONArray.toString());
        try
        {
          if (paramJSONArray.length() < 2) {
            continue;
          }
          this.mDeviceListController.setDeviceState(paramJSONArray.getJSONObject(0), paramJSONArray.getJSONObject(1));
        }
        catch (JSONException localJSONException2)
        {
          LogUtils.errorLog("SmartDevicePlugin", "Exception in setting the state of the device: " + localJSONException2);
          paramCallbackContext.error("Exception in setting the state of the device");
        }
      }
      else if ("setGroupState".equals(paramString))
      {
        LogUtils.infoLog("SmartDevicePlugin", "Params: " + paramJSONArray.toString());
        try
        {
          this.mDeviceListController.setGroupState(paramJSONArray.getJSONObject(0), paramJSONArray.getJSONObject(1));
        }
        catch (JSONException localJSONException1)
        {
          LogUtils.errorLog("SmartDevicePlugin", "Exception in setting the state of the device: " + localJSONException1);
          paramCallbackContext.error("Exception in setting the state of the device");
        }
      }
      else if ("setDeviceProperties".equals(paramString))
      {
        LogUtils.infoLog("SmartDevicePlugin", "Calling action:" + paramString + "; inParamArray: " + paramJSONArray);
        if ((paramJSONArray != null) && (paramJSONArray.length() > 1))
        {
          JSONObject localJSONObject12 = this.mDeviceListController.setDeviceProperties(paramJSONArray.getJSONObject(0), paramJSONArray.getJSONObject(1));
          if (localJSONObject12.has("error"))
          {
            String str3 = localJSONObject12.getString("error");
            LogUtils.errorLog("SmartDevicePlugin", "setDeviceProperties failed due to: " + str3);
            PluginResult localPluginResult5 = new PluginResult(PluginResult.Status.ERROR, str3);
            paramCallbackContext.sendPluginResult(localPluginResult5);
          }
          else
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK));
          }
        }
        else
        {
          LogUtils.errorLog("SmartDevicePlugin", "setDeviceProperties failed as inParamArray is null or empty");
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "null or empty inParamArray"));
        }
      }
      else
      {
        if ("resetDevice".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_RESET_DEVICE, inParamArray: " + paramJSONArray);
          ResetDeviceCallback localResetDeviceCallback = new ResetDeviceCallback(paramCallbackContext);
          if (paramJSONArray != null)
          {
            ResetDeviceRunnable localResetDeviceRunnable = new ResetDeviceRunnable(paramJSONArray, localResetDeviceCallback, DeviceListController.getInstance(this.mContext));
            WeMoThreadPoolHandler.executeInBackground(localResetDeviceRunnable);
          }
          for (;;)
          {
            sDeviceListManager.onResume(this);
            break;
            localResetDeviceCallback.onError("null inParamArray");
          }
        }
        if ("findBulb".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_FIND_BULB: findBulb, inParamArray: " + paramJSONArray);
          FindBulbCallback localFindBulbCallback = new FindBulbCallback(paramCallbackContext);
          if (paramJSONArray != null)
          {
            FindBulbRunnable localFindBulbRunnable = new FindBulbRunnable(paramJSONArray, localFindBulbCallback, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localFindBulbRunnable);
          }
          else
          {
            localFindBulbCallback.onError("null inParamArray");
          }
        }
        else if ("refreshDevices".equals(paramString))
        {
          this.mCallbackContext = paramCallbackContext;
          sDeviceListManager.onResume(this);
          RateMe.handleRateMePopup(this.mContext, sDeviceListManager);
        }
        else if ("hideDevice".equals(paramString))
        {
          HideDeviceCallback localHideDeviceCallback;
          try
          {
            LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_HIDE_DEVICE: hideDevice, inParamArray: " + paramJSONArray);
            RateMe.resetFullSuccessfulDiscoveryCounter(this.mContext);
            localHideDeviceCallback = new HideDeviceCallback(paramCallbackContext);
            if ((paramJSONArray == null) || (paramJSONArray.length() <= 0)) {
              break label1309;
            }
            JSONObject localJSONObject10 = paramJSONArray.getJSONObject(0);
            if (localJSONObject10.has("udn"))
            {
              String str2 = localJSONObject10.getString("udn");
              if (str2 != null)
              {
                JSONObject localJSONObject11 = new JSONObject();
                localJSONObject11.put("udn", str2);
                sendJavascriptCB("window.smartDevicePlugin.onDeviceRemoved('" + localJSONObject11 + "');");
              }
            }
            HideDeviceRunnable localHideDeviceRunnable = new HideDeviceRunnable(paramJSONArray, localHideDeviceCallback, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localHideDeviceRunnable);
          }
          catch (Exception localException)
          {
            LogUtils.errorLog("SmartDevicePlugin", "Exception in SmartDevicePlugin-hideDevice " + localException);
          }
          continue;
          label1309:
          localHideDeviceCallback.onError("null inParamArray");
        }
        else if ("hideGroup".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_HIDE_GROUP. inParamArray: " + paramJSONArray);
          RateMe.resetFullSuccessfulDiscoveryCounter(this.mContext);
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            JSONObject localJSONObject9 = new JSONObject();
            localJSONObject9.put("groupID", paramJSONArray);
            sendJavascriptCB("window.smartDevicePlugin.onGroupRemoved('" + localJSONObject9 + "');");
            this.mDeviceListController.hideGroup(paramJSONArray.getString(0), paramCallbackContext, this);
          }
          else
          {
            PluginResult localPluginResult4 = new PluginResult(PluginResult.Status.ERROR);
            paramCallbackContext.sendPluginResult(localPluginResult4);
          }
        }
        else if ("selectNestDevices".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_SELECT_NEST_DEVICES. inParamArray: " + paramJSONArray);
          JSONArray localJSONArray2 = new JSONArray();
          if (sDeviceListManager != null)
          {
            Iterator localIterator = sDeviceListManager.getDeviceInformation().iterator();
            while (localIterator.hasNext())
            {
              DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator.next();
              JSONObject localJSONObject8 = new JSONObject();
              if ((localDeviceInformation2.getProductType().equalsIgnoreCase("NestThermostat")) && (localDeviceInformation2.getInActive() == 0))
              {
                localJSONObject8.put("friendlyName", localDeviceInformation2.getFriendlyName());
                localJSONObject8.put("udn", localDeviceInformation2.getUDN());
                localJSONObject8.put("ProductName", localDeviceInformation2.getProductName());
                localJSONObject8.put("parentName", localDeviceInformation2.getParentName());
                localJSONArray2.put(localJSONObject8);
              }
            }
          }
          PluginResult localPluginResult3 = new PluginResult(PluginResult.Status.OK, localJSONArray2);
          paramCallbackContext.sendPluginResult(localPluginResult3);
        }
        else if ("getNestDevices".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_GET_NEST_DEVICES. inParamArray: " + paramJSONArray);
          this.mDeviceListController.getNestDevices();
        }
        else if ("deauthorizeNest".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_DEAUTHORIZE_NEST. inParamArray: " + paramJSONArray);
          this.mDeviceListController.deauthorizeNest();
        }
        else if ("nestTokenExistForGivenHomeId".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_NEST_TOKEN_EXIST_FOR_GIVEN_HOME_ID. inParamArray: " + paramJSONArray);
          this.mDeviceListController.nestTokenExists();
        }
        else if ("areNestFirmwareSupported".equals(paramString))
        {
          boolean bool1 = this.mDeviceListController.areNestFirmwareSupported();
          LogUtils.infoLog("SmartDevicePlugin", "Calling action ACTION_ARE_NEST_FIRMWARE_SUPPORTED. inParamArray: " + paramJSONArray + " ;isNestFWSupported- " + bool1);
          PluginResult localPluginResult2 = new PluginResult(PluginResult.Status.OK, bool1);
          paramCallbackContext.sendPluginResult(localPluginResult2);
        }
        else if ("addToGroup".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "IN action ADD TO GROUP");
          LogUtils.infoLog("SmartDevicePlugin", "Params: " + paramJSONArray.toString());
          if (!this.mDeviceListController.addToGroup(paramJSONArray))
          {
            PluginResult localPluginResult1 = new PluginResult(PluginResult.Status.ERROR);
            paramCallbackContext.sendPluginResult(localPluginResult1);
          }
        }
        else if ("removeFromGroup".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", "IN action Remove From Group");
          LogUtils.infoLog("SmartDevicePlugin", "Params: " + paramJSONArray.toString());
          this.mDeviceListController.removeGroup(paramJSONArray);
        }
        else if ("getEventHistory".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", ":: ACTION_GET_EVENT_HISTORY :: 1st param :: " + paramJSONArray.getString(0) + ":: 2nd param ::" + paramJSONArray.getLong(1));
          SharePreferences.resetSensorEventCounter(this.mContext);
          GetSensorEventHistoryCallBack localGetSensorEventHistoryCallBack = new GetSensorEventHistoryCallBack(paramCallbackContext);
          GetSensorEventRunnable localGetSensorEventRunnable = new GetSensorEventRunnable(localGetSensorEventHistoryCallBack, this.mContext, paramJSONArray);
          WeMoThreadPoolHandler.executeInBackground(localGetSensorEventRunnable);
        }
        else if ("getEventHistoryFromDB".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", ":: ACTION_GET_EVENTS_FROM_DB :: ");
          GetSensorEventFromDBCallBack localGetSensorEventFromDBCallBack = new GetSensorEventFromDBCallBack(paramCallbackContext);
          GetSensorEventsFromDBRunnable localGetSensorEventsFromDBRunnable = new GetSensorEventsFromDBRunnable(localGetSensorEventFromDBCallBack, this.mContext);
          WeMoThreadPoolHandler.executeInBackground(localGetSensorEventsFromDBRunnable);
        }
        else if ("setDevicePreset".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", " ACTION_SET_DEVICE_PRESET");
          if ((paramCallbackContext != null) && (paramJSONArray != null))
          {
            DevicePresetCallBack localDevicePresetCallBack3 = new DevicePresetCallBack(paramCallbackContext);
            SetDevicePresetRunnable localSetDevicePresetRunnable = new SetDevicePresetRunnable(paramJSONArray, localDevicePresetCallBack3, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localSetDevicePresetRunnable);
          }
        }
        else if ("getDevicePreset".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", " ACTION_GET_DEVICE_PRESET");
          if ((paramCallbackContext != null) && (paramJSONArray != null))
          {
            DevicePresetCallBack localDevicePresetCallBack2 = new DevicePresetCallBack(paramCallbackContext);
            GetDevicePresetRunnable localGetDevicePresetRunnable = new GetDevicePresetRunnable(paramJSONArray, localDevicePresetCallBack2, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localGetDevicePresetRunnable);
          }
        }
        else if ("deleteDevicePreset".equals(paramString))
        {
          LogUtils.infoLog("SmartDevicePlugin", " ACTION_DELETE_DEVICE_PRESET");
          if ((paramCallbackContext != null) && (paramJSONArray != null))
          {
            DevicePresetCallBack localDevicePresetCallBack1 = new DevicePresetCallBack(paramCallbackContext);
            DeleteDevicePresetRunnable localDeleteDevicePresetRunnable = new DeleteDevicePresetRunnable(paramJSONArray, localDevicePresetCallBack1, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localDeleteDevicePresetRunnable);
          }
        }
        else if ("getSubDevicesCount".equals(paramString))
        {
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0)) {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, this.mDeviceListController.getSubDevicesCount(paramJSONArray.getString(0))));
          } else {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, ""));
          }
        }
        else if ("setBlobStorageData".equals(paramString))
        {
          SetBlobStorageCallback localSetBlobStorageCallback = new SetBlobStorageCallback(paramCallbackContext);
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            SetBlobStorageRunnable localSetBlobStorageRunnable = new SetBlobStorageRunnable(paramJSONArray, localSetBlobStorageCallback, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localSetBlobStorageRunnable);
          }
          else
          {
            localSetBlobStorageCallback.onError("inParamArray null or missing arguments inParamArray" + paramJSONArray);
          }
        }
        else if ("getBlobStorageData".equals(paramString))
        {
          GetBlobStorageCallback localGetBlobStorageCallback = new GetBlobStorageCallback(paramCallbackContext);
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            GetBlobStorageRunnable localGetBlobStorageRunnable = new GetBlobStorageRunnable(paramJSONArray, localGetBlobStorageCallback, this.mContext);
            WeMoThreadPoolHandler.executeInBackground(localGetBlobStorageRunnable);
          }
          else
          {
            localGetBlobStorageCallback.onError("inParamArray null or missing arguments inParamArray" + paramJSONArray);
          }
        }
        else if ("appRecovery".equals(paramString))
        {
          WeMoThreadPoolHandler.executeInBackground(new WeMoAppRecoveryRunnable(this.mContext));
          paramCallbackContext.success("success");
        }
        else if ("onReset".equals(paramString))
        {
          this.mDeviceListController.clearCache();
        }
        else if ("setNightModeConfiguration".equals(paramString))
        {
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            JSONObject localJSONObject7 = paramJSONArray.getJSONObject(0);
            this.mDeviceListController.setNightModeConfiguration(paramCallbackContext, localJSONObject7);
          }
          else
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
          }
        }
        else if ("configureHushMode".equals(paramString))
        {
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            JSONObject localJSONObject6 = paramJSONArray.getJSONObject(0);
            this.mDeviceListController.configureHushMode(paramCallbackContext, localJSONObject6);
          }
          else
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
          }
        }
        else if ("configureDimmingRange".equals(paramString))
        {
          if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
          {
            JSONObject localJSONObject5 = paramJSONArray.getJSONObject(0);
            this.mDeviceListController.configureDimmingRange(paramCallbackContext, localJSONObject5);
          }
          else
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
          }
        }
        else if (!"getNightModeConfiguration".equals(paramString))
        {
          if ("takePicture".equals(paramString))
          {
            this.mDeviceListController.takePicture(paramCallbackContext);
          }
          else if ("choosePhoto".equals(paramString))
          {
            this.mDeviceListController.selectPhoto(paramCallbackContext);
          }
          else if ("refreshLongPressRuleDetails".equals(paramString))
          {
            if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
            {
              JSONObject localJSONObject4 = paramJSONArray.getJSONObject(0);
              this.mDeviceListController.refreshLongPressRuleDetails(localJSONObject4, paramCallbackContext);
            }
            else
            {
              paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            }
          }
          else if ("setBulbType".equals(paramString))
          {
            if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
            {
              JSONObject localJSONObject3 = paramJSONArray.getJSONObject(0);
              this.mDeviceListController.setBulbType(localJSONObject3, paramCallbackContext);
            }
            else
            {
              paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            }
          }
          else if ("calibrate".equals(paramString))
          {
            if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
            {
              JSONObject localJSONObject2 = paramJSONArray.getJSONObject(0);
              this.mDeviceListController.calibrate(localJSONObject2, paramCallbackContext);
            }
            else
            {
              paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            }
          }
          else if ("collectEmailID".equals(paramString))
          {
            LogUtils.infoLog("SmartDevicePlugin", "Collect EmailID API call; Params - " + paramJSONArray.toString());
            this.mDeviceListController.collectEmailIDToCloud();
          }
          else if ("setInsightDrawerState".equals(paramString))
          {
            LogUtils.infoLog("SmartDevicePlugin", "ACTION_SET_INSIGHT_DRAWER_STATE");
            if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
            {
              JSONObject localJSONObject1 = paramJSONArray.getJSONObject(0);
              this.mDeviceListController.setInsightDrawerState(localJSONObject1, paramCallbackContext);
              int i = localJSONObject1.getInt("isOpen");
              String str1 = localJSONObject1.getString("udn");
              DeviceInformation localDeviceInformation1 = sDeviceListManager.getDevice(str1);
              if (localDeviceInformation1 != null)
              {
                SDKLogUtils.errorLog("SmartDevicePlugin", "isOpened: " + i + " :deviceInfo.getState(): " + localDeviceInformation1.getState());
                if (i == 1) {
                  localDeviceInformation1.getInsightData();
                }
              }
            }
            else
            {
              paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            }
          }
          else if ("getDevicesInfo".equals(paramString))
          {
            JSONArray localJSONArray1 = this.mDeviceListController.getDevicesInfo();
            if ((localJSONArray1 != null) && (localJSONArray1.length() > 0))
            {
              LogUtils.infoLog("SmartDevicePlugin", "ACTION_GET_DEVICES_INFO : deviceList " + localJSONArray1.toString());
              paramCallbackContext.success(localJSONArray1);
            }
            else
            {
              paramCallbackContext.error("error fetching device list");
            }
          }
          else if ("checkBohnjour".equals(paramString))
          {
            LogUtils.infoLog("SmartDevicePlugin", "ACTION_CHECK_BOHNJOUR : Bhonjour discovery call ");
            BridgeDiscoveryRunnable localBridgeDiscoveryRunnable = new BridgeDiscoveryRunnable(this.mContext, paramCallbackContext);
            WeMoThreadPoolHandler.executeInBackground(localBridgeDiscoveryRunnable);
          }
        }
      }
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    LogUtils.infoLog("SmartDevicePlugin", "SmartDevicePlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    sDeviceListManager = DeviceListManager.getInstance(this, this.mContext);
    sDeviceListManager.addNotificationListener(this);
    this.mAppController = AppController.getInstance(this.mContext);
    this.mSensorStateChange = SensorEventChangeController.getInstance(this.mContext);
    this.mSensorStateChange.addNotificationListener(this);
    this.mDeviceListController = DeviceListController.getInstance(this.mContext);
    if (this.mSharePreference == null)
    {
      this.mSharePreference = new SharePreferences(this.mContext);
      this.mSDKNetworkUtil = new SDKNetworkUtils(this.mContext);
    }
    this.mDeviceCallbacks = new HashMap();
    this.conMan = ((ConnectivityManager)this.mContext.getSystemService("connectivity"));
    RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this);
  }
  
  public void mustRestartApp()
  {
    sendJavascriptCB("wemoUtil.loadUrl(filePath.INDEX);");
  }
  
  public void onDeviceAdded(DeviceInformation paramDeviceInformation)
  {
    if (paramDeviceInformation == null) {
      return;
    }
    LogUtils.infoLog("SmartDevicePlugin", "in SmartDevicePlugin onDeviceAdded " + paramDeviceInformation.getUDN());
    if (this.mDeviceListController == null) {
      this.mDeviceListController = DeviceListController.getInstance(this.mContext);
    }
    if (this.mDeviceListController != null)
    {
      JSONObject localJSONObject = this.mDeviceListController.addDevice(paramDeviceInformation);
      sendJavascriptCB("window.smartDevicePlugin.onDeviceAdded('" + localJSONObject.toString() + "');");
      return;
    }
    LogUtils.infoLog("SmartDevicePlugin", "DeviceListController is null");
  }
  
  public void onDeviceRemoved(String paramString) {}
  
  public void onDeviceReset(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      LogUtils.infoLog("SmartDevicePlugin", "in SmartDevicePlugin onDevonDeviceReset udn: " + paramString1 + ", resetType: " + paramString2);
      if ((TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString2))) {
        LogUtils.infoLog("SmartDevicePlugin", "Null in onDeviceReset udn: " + paramString1 + ", resetType: " + paramString2);
      }
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("resetType", paramString2);
      localJSONObject.put("udn", paramString1);
      localJSONObject.put("success", paramString3);
      sendJavascriptCB("window.smartDevicePlugin.onDeviceReset('" + localJSONObject.toString() + "');");
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("SmartDevicePlugin", "Exception in onDeviceReset " + localException);
    }
  }
  
  public void onDeviceUpdated(DeviceInformation paramDeviceInformation)
  {
    if (paramDeviceInformation == null) {
      return;
    }
    try
    {
      LogUtils.infoLog("SmartDevicePlugin", "in SmartDevicePlugin onDeviceUpdated " + paramDeviceInformation.getUDN());
      if (this.mDeviceListController == null) {
        this.mDeviceListController = DeviceListController.getInstance(this.mContext);
      }
      if (this.mDeviceListController != null)
      {
        JSONObject localJSONObject = this.mDeviceListController.updateDevice(paramDeviceInformation);
        sendJavascriptCB("window.smartDevicePlugin.onDeviceUpdated('" + localJSONObject.toString() + "');");
        return;
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("SmartDevicePlugin", "Exception in SmartDevicePlugin-onDeviceUpdated " + localException);
      return;
    }
    LogUtils.infoLog("SmartDevicePlugin", "DeviceListController is null");
  }
  
  public void onIconUpdate(String paramString1, String paramString2)
  {
    LogUtils.infoLog("SmartDevicePlugin", "onIconUpdate() udn:: " + paramString1 + " iconURL:: " + paramString2);
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("udn", paramString1);
      localJSONObject.put("icon", paramString2);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void onNetworkChangeDLM()
  {
    LogUtils.infoLog("SmartDevicePlugin", "onNetworkChangeDLM");
    if ((sDeviceListManager != null) && (this.conMan != null) && (this.conMan.getActiveNetworkInfo() != null) && (this.conMan.getActiveNetworkInfo().isConnected())) {
      sDeviceListManager.onNetworkChange(this);
    }
  }
  
  public void onNotify(String paramString1, String paramString2, String paramString3)
  {
    if (sDeviceListManager != null)
    {
      if (!paramString1.equals("add")) {
        break label65;
      }
      LogUtils.infoLog("SmartDevicePlugin", "On Notify Add Device: " + paramString3);
      if (paramString3 != null) {
        onDeviceAdded((DeviceInformation)sDeviceListManager.getDeviceInformationList().get(paramString3));
      }
    }
    label65:
    do
    {
      String[] arrayOfString1;
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  return;
                                  if (!paramString1.equals("update")) {
                                    break;
                                  }
                                  LogUtils.infoLog("SmartDevicePlugin", "On Notify Update Device: " + paramString3);
                                } while (paramString3 == null);
                                onDeviceUpdated((DeviceInformation)sDeviceListManager.getDeviceInformationList().get(paramString3));
                                return;
                                if (!paramString1.equals("remove")) {
                                  break;
                                }
                                LogUtils.infoLog("SmartDevicePlugin", "On Notify remove Device: " + paramString3);
                              } while (paramString3 == null);
                              JSONObject localJSONObject6 = new JSONObject();
                              try
                              {
                                localJSONObject6.put("udn", paramString3);
                                if ((paramString3.contains("WEMO00")) && (!paramString2.equals("remote_disabled")))
                                {
                                  LogUtils.infoLog("SmartDevicePlugin", "Nest Device Removed");
                                  IWeMoRules localIWeMoRules = WeMoRulesFactory.getInstance(this.mContext);
                                  FetchDevicesRulesCallback localFetchDevicesRulesCallback = new FetchDevicesRulesCallback(paramString3);
                                  localIWeMoRules.fetchRules(this.mContext, localFetchDevicesRulesCallback, localFetchDevicesRulesCallback);
                                }
                                sendJavascriptCB("window.smartDevicePlugin.onDeviceRemoved('" + localJSONObject6 + "');");
                                return;
                              }
                              catch (JSONException localJSONException6)
                              {
                                for (;;)
                                {
                                  localJSONException6.printStackTrace();
                                }
                              }
                              if (!paramString1.equals("change_state")) {
                                break;
                              }
                              LogUtils.infoLog("SmartDevicePlugin", "On Notify Change State Device: " + paramString3);
                            } while (paramString3 == null);
                            onDeviceUpdated((DeviceInformation)sDeviceListManager.getDeviceInformationList().get(paramString3));
                            return;
                            if (!paramString1.equals("set_state")) {
                              break;
                            }
                            LogUtils.infoLog("SmartDevicePlugin", "On Notify Set State Device: " + paramString3);
                          } while (paramString3 == null);
                          JSONObject localJSONObject5 = new JSONObject();
                          try
                          {
                            localJSONObject5.put("udn", paramString3);
                            localJSONObject5.put("success", paramString2);
                            if (paramString3.contains("Insight")) {
                              localJSONObject5.put("binaryState", ((DeviceInformation)sDeviceListManager.getDeviceInformationList().get(paramString3)).getBinaryState());
                            }
                            sendJavascriptCB("window.smartDevicePlugin.onDeviceChanged('" + paramString3 + "','" + localJSONObject5 + "');");
                            return;
                          }
                          catch (JSONException localJSONException5)
                          {
                            for (;;)
                            {
                              localJSONException5.printStackTrace();
                            }
                          }
                          if (!paramString1.equals("update_group_state")) {
                            break;
                          }
                          LogUtils.infoLog("SmartDevicePlugin", "On Notify update group state : " + paramString3);
                        } while (paramString3 == null);
                        sendJavascriptCB("window.smartDevicePlugin.onGroupUpdated('" + paramString3 + "','" + paramString2 + "');");
                        return;
                        if (!paramString1.equals("set_properties")) {
                          break;
                        }
                        LogUtils.infoLog("SmartDevicePlugin", "onNotify info on properties: " + paramString3);
                      } while (paramString3 == null);
                      JSONObject localJSONObject4 = new JSONObject();
                      try
                      {
                        localJSONObject4.put("udn", paramString3);
                        localJSONObject4.put("success", paramString2);
                        sendJavascriptCB("window.smartDevicePlugin.onDeviceChanged('" + paramString3 + "','" + localJSONObject4 + "');");
                        return;
                      }
                      catch (JSONException localJSONException4)
                      {
                        for (;;)
                        {
                          LogUtils.errorLog("SmartDevicePlugin", "Exception in onNotify: e:" + localJSONException4);
                        }
                      }
                      if (!paramString1.equals("reset_fn_icon_rules")) {
                        break;
                      }
                      LogUtils.infoLog("SmartDevicePlugin", "on Notify RESET_FN_ICON_RULES udn:" + paramString3);
                    } while (TextUtils.isEmpty(paramString3));
                    onDeviceReset(paramString3, "reset_fn_icon_rules", paramString2);
                    return;
                    if (!paramString1.equals("reset_wifi")) {
                      break;
                    }
                    LogUtils.infoLog("SmartDevicePlugin", "on Notify RESET_WIFI udn:" + paramString3);
                  } while (TextUtils.isEmpty(paramString3));
                  onDeviceReset(paramString3, "reset_wifi", paramString2);
                  return;
                  if (!paramString1.equals("reset_all")) {
                    break;
                  }
                  LogUtils.infoLog("SmartDevicePlugin", "on Notify RESET_ALL udn:" + paramString3);
                } while (TextUtils.isEmpty(paramString3));
                onDeviceReset(paramString3, "reset_all", paramString2);
                return;
                if (!paramString1.equals("reset_usage_data")) {
                  break;
                }
                LogUtils.infoLog("SmartDevicePlugin", "on Notify RESET_USAGE_DATA");
              } while (TextUtils.isEmpty(paramString3));
              onDeviceReset(paramString3, "reset_usage_data", paramString2);
              return;
              if (!paramString1.equals("set_blob_storage")) {
                break;
              }
              LogUtils.infoLog("SmartDevicePlugin", "onNotify info on properties: " + paramString3);
            } while (paramString3 == null);
            JSONObject localJSONObject3 = new JSONObject();
            try
            {
              localJSONObject3.put("udn", paramString3);
              localJSONObject3.put("success", paramString2);
              sendJavascriptCB("window.smartDevicePlugin.onDeviceChanged('" + paramString3 + "','" + localJSONObject3 + "');");
              return;
            }
            catch (JSONException localJSONException3)
            {
              for (;;)
              {
                LogUtils.errorLog("SmartDevicePlugin", "Exception in onNotify: e:", localJSONException3);
              }
            }
            if (!paramString1.equals("get_blob_storage")) {
              break;
            }
            LogUtils.infoLog("SmartDevicePlugin", "onNotify info on properties: " + paramString3);
          } while (paramString3 == null);
          JSONObject localJSONObject2 = new JSONObject();
          try
          {
            localJSONObject2.put("udn", paramString3);
            localJSONObject2.put("success", paramString2);
            localJSONObject2.put("data", ((DeviceInformation)sDeviceListManager.getDeviceInformationList().get(paramString3)).getAttributeList());
            sendJavascriptCB("window.smartDevicePlugin.onDeviceChanged('" + paramString3 + "','" + localJSONObject2 + "');");
            return;
          }
          catch (JSONException localJSONException2)
          {
            for (;;)
            {
              LogUtils.errorLog("SmartDevicePlugin", "Exception in onNotify: e:", localJSONException2);
            }
          }
          if (!paramString1.equals("available_fw_updates")) {
            break;
          }
          LogUtils.infoLog("SmartDevicePlugin", "On Notify AVAILABLE_FW_UPDATES: " + paramString3);
        } while (TextUtils.isEmpty(paramString3));
        JSONObject localJSONObject1 = new JSONObject();
        try
        {
          localJSONObject1.put("response", paramString3);
          localJSONObject1.put("success", "true");
          sendJavascriptCB("window.firmwareUpdatePlugin.onGetAvailableUpdates(" + paramString3 + ")");
          return;
        }
        catch (JSONException localJSONException1)
        {
          for (;;)
          {
            LogUtils.errorLog("SmartDevicePlugin", "Exception in onNotify: e:", localJSONException1);
          }
        }
        if ((paramString1.equalsIgnoreCase("FirmwareUpdateStatus")) || (paramString1.equalsIgnoreCase("SubDeviceFWUpdate")))
        {
          LogUtils.infoLog("SmartDevicePlugin", paramString1 + " status:" + paramString2 + " udn:" + paramString3);
          this.mDeviceListController.updateFwStatus(paramString3, paramString2);
          FirmwareUpdateManager.updateUpgradeStatus(paramString3, paramString2, "");
          sendJavascriptCB("window.firmwareUpdatePlugin.onStatusChange('" + paramString3 + "','" + paramString2 + "');");
          return;
        }
        if (paramString1.equalsIgnoreCase("zigbee_status_done"))
        {
          LogUtils.infoLog("SmartDevicePlugin", "ZIGBEE_STATUS_DONE");
          sendJavascriptCB("window.smartDevicePlugin.onGetZigbeeStatusDone('" + paramString3 + "');");
          return;
        }
        if (paramString1.equals("pluginConnected"))
        {
          LogUtils.infoLog("SmartDevicePlugin", "On Notify PLUGIN_CONNECTED");
          sendJavascriptCB("window.networkPlugin.onWeMoConnected();");
          return;
        }
        if (paramString1.equals("reset_cache"))
        {
          LogUtils.infoLog("SmartDevicePlugin", "On Notify RESET_CACHE");
          sendJavascriptCB("window.smartDevicePlugin.onReset();");
          return;
        }
        if (paramString1.equals("set_remote"))
        {
          LogUtils.infoLog("SmartDevicePlugin", "On Notify SET_REMOTE");
          sendJavascriptCB("window.smartDevicePlugin.onSetRemote('" + paramString2 + "');");
          return;
        }
        if (!paramString1.equals("set_nest_error_code")) {
          break;
        }
        LogUtils.infoLog("SmartDevicePlugin", "On Notify SET_NEST_ERROR_CODE: " + paramString2);
        arrayOfString1 = paramString2.split("&#");
      } while (arrayOfString1.length <= 0);
      String[] arrayOfString2 = arrayOfString1[0].split("_");
      if (arrayOfString2.length > 0)
      {
        sendJavascriptCB("window.smartDevicePlugin.onNestErrorCode('" + arrayOfString2[1] + "','" + arrayOfString1[1] + "','" + arrayOfString1[2] + "');");
        return;
      }
      sendJavascriptCB("window.smartDevicePlugin.onNestErrorCode('" + arrayOfString1[0] + "','" + arrayOfString1[1] + "','" + arrayOfString1[2] + "');");
      return;
      if (paramString1.equals("nest_deauthorization_response"))
      {
        LogUtils.infoLog("SmartDevicePlugin", "On Notify NEST_DEAUTH0RIZATION_RESPONSE");
        this.mSharePreference.setNestDeauthCallbackStatus(Integer.parseInt(paramString2));
        sendJavascriptCB("window.smartDevicePlugin.onNestDeauth('" + paramString2 + "');");
        return;
      }
      if (paramString1.equals("nest_auth_token_existence"))
      {
        LogUtils.infoLog("SmartDevicePlugin", "On Notify NEST_AUTH_TOKEN_EXISTENCE");
        this.mSharePreference.setNestAuthCallbackStatus(Integer.parseInt(paramString2));
        sendJavascriptCB("window.smartDevicePlugin.onCheckNestAuth('" + paramString2 + "');");
        return;
      }
    } while (!paramString1.equals("nest_deauthorized"));
    LogUtils.infoLog("SmartDevicePlugin", "On Notify NEST_DEAUTHORIZED");
    sendJavascriptCB("window.smartDevicePlugin.onNestDeauth();");
  }
  
  public void onPauseDLM()
  {
    LogUtils.infoLog("SmartDevicePlugin", "onPauseDLM");
    if (sDeviceListManager != null) {
      sDeviceListManager.onPause();
    }
  }
  
  public void onRemoteAccessDisabled()
  {
    LogUtils.infoLog("SmartDevicePlugin", "Remote access has been Disabled");
    sendJavascriptCB("window.smartDevicePlugin.onSetRemoteAccess(\"false\");");
  }
  
  public void onRemoteAccessEnabled()
  {
    LogUtils.infoLog("SmartDevicePlugin", "Remote access has been Enabled");
    sendJavascriptCB("window.smartDevicePlugin.onSetRemoteAccess(\"true\");");
  }
  
  public void onResumeDLM()
  {
    LogUtils.infoLog("SmartDevicePlugin", "onResumeDLM");
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    if (sDeviceListManager != null) {
      sDeviceListManager.onResume(this);
    }
    WeMoThreadPoolHandler.executeInBackground(new BridgeDiscoveryRunnable(this.mContext, null));
  }
  
  public void onStartDLM()
  {
    LogUtils.infoLog("SmartDevicePlugin", "onStartDLM");
    if (sDeviceListManager != null) {
      sDeviceListManager.onStart();
    }
  }
  
  public void onZigBeeDeviceAdded(ZigBeeDeviceInformation paramZigBeeDeviceInformation) {}
  
  public void onZigBeeDeviceUpdated(ZigBeeDeviceInformation paramZigBeeDeviceInformation) {}
  
  public void sendJavascriptCB(String paramString)
  {
    if ((this.webView != null) && (this.mAppController != null))
    {
      LogUtils.infoLog("smartDevicePlugin:Native:sendJavascriptCB cb", paramString);
      this.mAppController.sendJSCallBack(this.webView, paramString);
    }
  }
  
  public void sensorEventsCounter()
  {
    if (this.mContext != null)
    {
      String str = "" + SharePreferences.getSensorEventsCount(this.mContext);
      sendJavascriptCB("window.smartDevicePlugin.OnSensorCountUpdated('" + str + "');");
    }
  }
  
  private class FetchDevicesRulesCallback
    implements FetchRulesErrorCallback, FetchRulesSuccessCallback
  {
    private String nestUDN;
    
    public FetchDevicesRulesCallback(String paramString)
    {
      this.nestUDN = paramString;
    }
    
    private boolean doesRulesDBExist()
    {
      return new File(RuleUtility.getLocalDBPath(), RuleUtility.getLocalDBName()).exists();
    }
    
    private HashMap<String, String[]> getWeeklyCalender(ArrayList<String> paramArrayList)
    {
      LogUtils.infoLog("SmartDevicePlugin", "Get Weekly Calendar");
      try
      {
        ArrayList localArrayList2 = SmartDevicePlugin.rMRulesDBManager.getTargetDeviceUDNForNestDevices(paramArrayList);
        localArrayList1 = localArrayList2;
      }
      catch (RuleDBException localRuleDBException)
      {
        for (;;)
        {
          int i;
          LogUtils.errorLog("SmartDevicePlugin", "RuleDBException: " + localRuleDBException.getMessage());
          localRuleDBException.printStackTrace();
          ArrayList localArrayList1 = null;
        }
      }
      HashMap localHashMap = new HashMap();
      for (i = 0; i < localArrayList1.size(); i++)
      {
        String str = (String)localArrayList1.get(i);
        LogUtils.infoLog("SmartDevicePlugin", "Target Device UDN For Nest Devices: " + str);
        localHashMap.put(str, new String[0]);
      }
      return localHashMap;
    }
    
    public void onError()
    {
      LogUtils.errorLog("SmartDevicePlugin", "FetchDevicerulesCallback: error during fetchRules().");
    }
    
    public void onSuccess(String paramString, int paramInt, ArrayList<String> paramArrayList)
    {
      LogUtils.infoLog("SmartDevicePlugin", "FetchDevicerulesCallback: on success during fetchRules().");
      if (doesRulesDBExist())
      {
        SmartDevicePlugin.rMRulesDBManager = RMRulesDBManager.getInstance(SmartDevicePlugin.this.mContext);
        try
        {
          ArrayList localArrayList = SmartDevicePlugin.rMRulesDBManager.getRuleIdArrayForNestDevices(this.nestUDN);
          SmartDevicePlugin.this.weeklyRecordsHashMap = getWeeklyCalender(localArrayList);
          for (int i = 0; i < localArrayList.size(); i++)
          {
            String str = (String)localArrayList.get(i);
            LogUtils.infoLog("SmartDevicePlugin", "RuleId: " + str);
            SmartDevicePlugin.rMRulesDBManager.deleteRowRules(Integer.parseInt(str));
            SmartDevicePlugin.rMRulesDBManager.deleteRowRuleDevices(Integer.parseInt(str));
          }
          if (localArrayList.size() > 0)
          {
            SmartDevicePlugin.StoreDeviceRulesCallback localStoreDeviceRulesCallback = new SmartDevicePlugin.StoreDeviceRulesCallback(SmartDevicePlugin.this);
            WeMoRulesFactory.getInstance(SmartDevicePlugin.this.mContext).storeRules(SmartDevicePlugin.this.mContext, SmartDevicePlugin.this.weeklyRecordsHashMap, localStoreDeviceRulesCallback, localStoreDeviceRulesCallback);
          }
          return;
        }
        catch (RuleDBException localRuleDBException)
        {
          LogUtils.errorLog("SmartDevicePlugin", "RuleDBException: " + localRuleDBException.getMessage());
          return;
        }
      }
      LogUtils.infoLog("SmartDevicePlugin", "Rule DB does not exists.");
    }
  }
  
  private class StoreDeviceRulesCallback
    implements StoreRulesErrorCallback, StoreRulesSuccessCallback
  {
    public StoreDeviceRulesCallback() {}
    
    public void onError(RMRulesError paramRMRulesError)
    {
      LogUtils.infoLog("SmartDevicePlugin", "Store Device Rules Callback on Error.");
      if (SmartDevicePlugin.this.weeklyRecordsHashMap != null) {
        SmartDevicePlugin.this.weeklyRecordsHashMap.clear();
      }
    }
    
    public void onSuccess()
    {
      LogUtils.infoLog("SmartDevicePlugin", "Store Device Rules Callback on Success.");
      if (SmartDevicePlugin.this.weeklyRecordsHashMap != null) {
        SmartDevicePlugin.this.weeklyRecordsHashMap.clear();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/SmartDevicePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */