package com.belkin.cordova.plugin;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class AndroidPreferences
  extends CordovaPlugin
{
  public static final String LOG_NAME = "AndroidPreferences Plugin";
  public static final String LOG_PROV = "PhoneGapLog";
  
  public boolean execute(final String paramString, final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        String str1;
        String str2;
        String str3;
        SharedPreferences localSharedPreferences;
        SharedPreferences.Editor localEditor;
        try
        {
          str1 = paramJSONArray.getString(0);
          str2 = paramJSONArray.getString(1);
          str3 = paramJSONArray.getString(2);
          if ((str1 != null) && (str2 != null) && (str3 != null) && (str1 != "") && (str2 != ""))
          {
            localSharedPreferences = AndroidPreferences.this.cordova.getActivity().getSharedPreferences(str1, 0);
            localEditor = localSharedPreferences.edit();
          }
          while ((paramString.equals("set")) && (localSharedPreferences != null) && (localEditor != null))
          {
            localEditor.putString(str2, str3);
            localEditor.commit();
            Log.d("PhoneGapLog", "AndroidPreferences Plugin: Set value: " + str1 + ":" + str2 + ":" + localSharedPreferences.getString(str2, ""));
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK));
            return;
            Log.e("PhoneGapLog", "AndroidPreferences Plugin: Error: " + PluginResult.Status.ERROR);
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            localEditor = null;
            localSharedPreferences = null;
          }
          if (!paramString.equals("get")) {
            break label401;
          }
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
          Log.e("PhoneGapLog", "AndroidPreferences Plugin: Error: " + PluginResult.Status.JSON_EXCEPTION);
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.JSON_EXCEPTION));
          return;
        }
        if ((localSharedPreferences != null) && (localEditor != null))
        {
          String str4 = localSharedPreferences.getString(str2, str3);
          Log.d("PhoneGapLog", "AndroidPreferences Plugin: Get value: " + str1 + ":" + str2 + ":" + str4);
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, str4));
          return;
        }
        label401:
        Log.e("PhoneGapLog", "AndroidPreferences Plugin: Error: " + PluginResult.Status.INVALID_ACTION);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.INVALID_ACTION));
      }
    });
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/AndroidPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */