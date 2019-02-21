package com.belkin.cordova.plugin;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class StartApp
  extends CordovaPlugin
{
  private static final String TAG = "StartApp";
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    Log.i("StartApp", "StartApp execute method for: " + paramString);
    if (paramString.equals("startApp"))
    {
      Log.i("StartApp", "execute args: " + paramJSONArray);
      if (paramJSONArray.length() == 1)
      {
        startActivity(paramJSONArray.getJSONObject(0).getString("android"), paramCallbackContext);
        paramCallbackContext.success();
      }
    }
    else
    {
      return true;
    }
    paramCallbackContext.error("Invalid StartApp args");
    return true;
  }
  
  void startActivity(String paramString, CallbackContext paramCallbackContext)
  {
    try
    {
      ComponentName localComponentName = ComponentName.unflattenFromString(paramString);
      Intent localIntent = this.cordova.getActivity().getPackageManager().getLaunchIntentForPackage(localComponentName.getPackageName());
      if (localIntent != null)
      {
        localIntent.setComponent(localComponentName);
        this.cordova.getActivity().getApplicationContext().startActivity(localIntent);
        return;
      }
      paramCallbackContext.success(paramString);
      return;
    }
    catch (Exception localException)
    {
      paramCallbackContext.error(localException.toString());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/StartApp.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */