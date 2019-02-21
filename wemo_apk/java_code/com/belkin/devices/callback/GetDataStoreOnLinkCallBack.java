package com.belkin.devices.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONException;
import org.json.JSONObject;

public class GetDataStoreOnLinkCallBack
  implements SetAndGetActionCallBack
{
  private static final String TAG = "GetDataStoreOnLinkCallBack";
  private CallbackContext mCallbackContext;
  
  public GetDataStoreOnLinkCallBack(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError()
  {
    LogUtils.errorLog("GetDataStoreOnLinkCallBack", "GetDataStoreOnLinkCallBack: error during getting emergency contact.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("GetDataStoreOnLinkCallBack", "GetDataStoreOnLinkCallBack" + paramString);
    if ((this.mCallbackContext == null) || (!TextUtils.isEmpty(paramString)))
    {
      try
      {
        JSONObject localJSONObject = new JSONObject(paramString);
        LogUtils.errorLog("GetDataStoreOnLinkCallBack", "Exception in getting the emergency contacts:: " + localJSONException1);
      }
      catch (JSONException localJSONException1)
      {
        try
        {
          LogUtils.infoLog("GetDataStoreOnLinkCallBack", "final response: " + localJSONObject.toString());
          this.mCallbackContext.success(localJSONObject);
          return;
        }
        catch (JSONException localJSONException2)
        {
          for (;;) {}
        }
        localJSONException1 = localJSONException1;
      }
      onError();
    }
    else
    {
      this.mCallbackContext.success(new JSONObject());
      return;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/callback/GetDataStoreOnLinkCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */