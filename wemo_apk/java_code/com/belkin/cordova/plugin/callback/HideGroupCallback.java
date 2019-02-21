package com.belkin.cordova.plugin.callback;

import com.belkin.cordova.plugin.SmartDevicePlugin;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.callback.HideGroupErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.HideGroupSuccessCallback;
import com.belkin.wemo.error.WeMoError;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONException;
import org.json.JSONObject;

public class HideGroupCallback
  implements HideGroupSuccessCallback, HideGroupErrorCallback
{
  private final String TAG = HideGroupCallback.class.getSimpleName();
  private CallbackContext callbackContext;
  private SmartDevicePlugin plugin;
  
  public HideGroupCallback(CallbackContext paramCallbackContext, SmartDevicePlugin paramSmartDevicePlugin)
  {
    this.callbackContext = paramCallbackContext;
    this.plugin = paramSmartDevicePlugin;
  }
  
  public void onGroupHidden(String paramString)
  {
    LogUtils.debugLog(this.TAG, "Hide group SUCCESS for groupID: " + paramString);
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
      localPluginResult.setKeepCallback(false);
      this.callbackContext.sendPluginResult(localPluginResult);
    }
    JSONObject localJSONObject;
    if (this.plugin != null) {
      localJSONObject = new JSONObject();
    }
    try
    {
      localJSONObject.put("groupID", paramString);
      this.plugin.sendJavascriptCB("window.smartDevicePlugin.onDeviceRemoved('" + localJSONObject + "');");
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(this.TAG, "JSONException while creating JO for onDeviceRemoved() callback to JS: ", localJSONException);
    }
  }
  
  public void onHideGroupError(WeMoError paramWeMoError)
  {
    LogUtils.errorLog(this.TAG, "Error during hiding group: " + paramWeMoError);
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramWeMoError.getErrorMessage());
      localPluginResult.setKeepCallback(false);
      this.callbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/HideGroupCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */