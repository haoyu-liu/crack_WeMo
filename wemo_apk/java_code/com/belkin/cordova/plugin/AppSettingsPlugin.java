package com.belkin.cordova.plugin;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.controller.AppSettingsController;
import com.belkin.devices.runnable.GetLocalEmailBodyRunnable;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class AppSettingsPlugin
  extends CordovaPlugin
{
  public static final String TAG = "AppSettingsPlugin";
  private AppSettingsController mAppSettingsController = null;
  private Context mContext = null;
  
  public boolean execute(String paramString, final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.infoLog("AppSettingsPlugin", "action: " + paramString);
    if ("reportAProblem".equals(paramString))
    {
      LogUtils.infoLog("AppSettingsPlugin", " ACTION_REPORT_A_PROBLEM");
      WeMoThreadPoolHandler.executeInBackground(new Runnable()
      {
        public void run()
        {
          if (paramCallbackContext != null)
          {
            if (paramJSONArray == null) {
              break label104;
            }
            String str = AppSettingsPlugin.this.mAppSettingsController.reportAProblem(paramJSONArray);
            LogUtils.infoLog("AppSettingsPlugin", " result: " + str);
            if (!TextUtils.isEmpty(str))
            {
              PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, str);
              localPluginResult.setKeepCallback(false);
              paramCallbackContext.sendPluginResult(localPluginResult);
            }
          }
          else
          {
            return;
          }
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
          return;
          label104:
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        }
      });
    }
    for (;;)
    {
      return true;
      if ("getLocalEmailBody".equals(paramString))
      {
        LogUtils.infoLog("AppSettingsPlugin", " ACTION_GET_LOCAL_EMAIL_BODY");
        if (paramCallbackContext != null) {
          WeMoThreadPoolHandler.executeInBackground(new GetLocalEmailBodyRunnable(paramCallbackContext, this.mContext));
        }
      }
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    LogUtils.infoLog("AppSettingsPlugin", "AppSettingsPlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.mAppSettingsController = AppSettingsController.getInstance(this.mContext);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/AppSettingsPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */