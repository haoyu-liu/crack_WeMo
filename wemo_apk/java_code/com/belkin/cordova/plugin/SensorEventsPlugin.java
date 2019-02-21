package com.belkin.cordova.plugin;

import android.content.Context;
import com.belkin.controller.AppController;
import com.belkin.devices.callback.GetDataStoreOnLinkCallBack;
import com.belkin.devices.callback.GetSensorEventFromDBCallBack;
import com.belkin.devices.callback.GetSensorEventHistoryCallBack;
import com.belkin.devices.callback.SetDataStoreOnLinkCallBack;
import com.belkin.devices.runnable.GetDataStoreRunnable;
import com.belkin.devices.runnable.GetSensorEventRunnable;
import com.belkin.devices.runnable.GetSensorEventsFromDBRunnable;
import com.belkin.devices.runnable.SetDataStoreRunnable;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SensorEventsPlugin
  extends CordovaPlugin
{
  public static final String ACTION_CALL_EMERGENCY_CONTACT = "callEmergencyContact";
  public static final String ACTION_GET_CONTACT_LIST = "getContactList";
  public static final String ACTION_GET_EMERGENCY_CONTACT = "getEmergencyContact";
  public static final String ACTION_GET_EVENTS_FROM_DB = "getEventHistoryFromDB";
  public static final String ACTION_GET_EVENT_HISTORY = "getEventHistory";
  public static final String ACTION_GET_SENSOR_NOTIFICATIONS_COUNT = "getSensorNotificationsCount";
  public static final String ACTION_SET_EMERGENCY_CONTACT = "setEmergencyContact";
  public static final String TAG = "SensorEventsPlugin";
  private AppController mAppController;
  private Context mContext = null;
  
  public boolean execute(String paramString, JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.infoLog("SensorEventsPlugin", "action: " + paramString);
    if ("getSensorNotificationsCount".equals(paramString))
    {
      String str5 = "" + SharePreferences.getSensorEventsCount(this.mContext);
      PluginResult localPluginResult3 = new PluginResult(PluginResult.Status.OK, str5);
      localPluginResult3.setKeepCallback(false);
      paramCallbackContext.sendPluginResult(localPluginResult3);
    }
    for (;;)
    {
      return true;
      if ("callEmergencyContact".equals(paramString))
      {
        String str4 = paramJSONArray.getJSONObject(0).getString("Number");
        LogUtils.infoLog("SensorEventsPlugin", "Emergency Params: " + str4);
        boolean bool = this.mAppController.callEmergencyContact(str4, this.mContext);
        LogUtils.infoLog("SensorEventsPlugin", "Result for callEmergencyContact :: " + bool);
        if (bool)
        {
          PluginResult localPluginResult1 = new PluginResult(PluginResult.Status.OK, new JSONObject());
          localPluginResult1.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(localPluginResult1);
        }
        else
        {
          PluginResult localPluginResult2 = new PluginResult(PluginResult.Status.ERROR);
          localPluginResult2.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(localPluginResult2);
        }
      }
      else if ("getEventHistory".equals(paramString))
      {
        LogUtils.infoLog("SensorEventsPlugin", ":: ACTION_GET_EVENT_HISTORY :: 1st param :: " + paramJSONArray.getString(0) + ":: 2nd param ::" + paramJSONArray.getLong(1));
        SharePreferences.resetSensorEventCounter(this.mContext);
        WeMoThreadPoolHandler.executeInBackground(new GetSensorEventRunnable(new GetSensorEventHistoryCallBack(paramCallbackContext), this.mContext, paramJSONArray));
      }
      else if ("getEventHistoryFromDB".equals(paramString))
      {
        LogUtils.infoLog("SensorEventsPlugin", ":: ACTION_GET_EVENTS_FROM_DB :: ");
        WeMoThreadPoolHandler.executeInBackground(new GetSensorEventsFromDBRunnable(new GetSensorEventFromDBCallBack(paramCallbackContext), this.mContext));
      }
      else if ("getContactList".equals(paramString))
      {
        new Thread(new Runnable()
        {
          public void run()
          {
            JSONArray localJSONArray = SensorEventsPlugin.this.mAppController.getContactsList();
            if ((localJSONArray != null) && (localJSONArray.length() > 0))
            {
              LogUtils.infoLog("SensorEventsPlugin", "ACTION_GET_CONTACT_LIST : contacts list " + localJSONArray.toString());
              PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONArray);
              localPluginResult.setKeepCallback(false);
              paramCallbackContext.sendPluginResult(localPluginResult);
              return;
            }
            paramCallbackContext.error("error fetching contacts list");
          }
        }).start();
      }
      else if ("setEmergencyContact".equals(paramString))
      {
        JSONObject localJSONObject = paramJSONArray.getJSONObject(0);
        String str2 = "";
        LogUtils.infoLog("SensorEventsPlugin", "Emergency contact: " + localJSONObject);
        String str3 = localJSONObject.toString();
        if (paramJSONArray.length() > 1) {
          str2 = paramJSONArray.getString(1);
        }
        WeMoThreadPoolHandler.executeInBackground(new SetDataStoreRunnable(str2, new SetDataStoreOnLinkCallBack(paramCallbackContext), this.mContext, str3));
      }
      else if ("getEmergencyContact".equals(paramString))
      {
        String str1 = "";
        if (paramJSONArray.length() >= 1) {
          str1 = paramJSONArray.getString(0);
        }
        LogUtils.infoLog("SensorEventsPlugin", "ACTION_GET_EMERGENCY_CONTACT :: bridgeUDN" + str1);
        WeMoThreadPoolHandler.executeInBackground(new GetDataStoreRunnable(str1, new GetDataStoreOnLinkCallBack(paramCallbackContext), this.mContext));
      }
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    LogUtils.infoLog("SensorEventsPlugin", "SensorEventsPlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.mAppController = AppController.getInstance(this.mContext);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/SensorEventsPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */