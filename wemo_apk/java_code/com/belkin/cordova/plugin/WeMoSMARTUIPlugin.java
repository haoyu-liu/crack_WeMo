package com.belkin.cordova.plugin;

import android.app.Activity;
import android.os.Build;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class WeMoSMARTUIPlugin
  extends CordovaPlugin
{
  public static final String ACTION_GET_LOCAL_DEVICE_INFO = "getLocalDeviceInfo";
  private static final String TAG = "WeMoSMARTUIPlugin";
  
  private boolean getLocalDeviceInfo(JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        String str1 = null;
        for (;;)
        {
          try
          {
            JSONObject localJSONObject1 = new JSONObject();
            try
            {
              DisplayMetrics localDisplayMetrics = new DisplayMetrics();
              WeMoSMARTUIPlugin.this.cordova.getActivity().getWindowManager().getDefaultDisplay().getMetrics(localDisplayMetrics);
              localJSONObject1.put("widthPixels", localDisplayMetrics.widthPixels);
              localJSONObject1.put("heightPixels", localDisplayMetrics.heightPixels);
              localJSONObject1.put("xdpi", WeMoSMARTUIPlugin.this.round(localDisplayMetrics.xdpi));
              localJSONObject1.put("ydpi", WeMoSMARTUIPlugin.this.round(localDisplayMetrics.ydpi));
              float f1 = localDisplayMetrics.widthPixels / localDisplayMetrics.xdpi;
              float f2 = localDisplayMetrics.heightPixels / localDisplayMetrics.ydpi;
              localJSONObject1.put("widthInches", WeMoSMARTUIPlugin.this.round(f1));
              localJSONObject1.put("heightInches", WeMoSMARTUIPlugin.this.round(f2));
              double d = WeMoSMARTUIPlugin.this.round(Math.sqrt(f1 * f1 + f2 * f2));
              localJSONObject1.put("diagonalInches", d);
              if (d > 6.0D)
              {
                localJSONObject1.put("isTablet", "true");
                localJSONObject1.put("model", Build.MODEL);
                localJSONObject1.put("manufacturer", Build.MANUFACTURER);
                String str2 = Build.VERSION.RELEASE;
                localJSONObject1.put("version", str2);
                int i = str2.indexOf('.');
                if (i > 0)
                {
                  localJSONObject1.put("majorVersion", Integer.valueOf(str2.substring(0, i)));
                  localJSONObject1.put("minorVersion", str2.substring(i + 1));
                }
                localJSONObject1.put("sdkVersion", Build.VERSION.SDK_INT);
                localJSONObject2 = localJSONObject1;
                if (str1 == null) {
                  continue;
                }
                Log.e("WeMoSMARTUIPlugin", "Get local device info error: " + str1);
                paramCallbackContext.error(str1);
                return;
              }
              localJSONObject1.put("isTablet", "false");
              continue;
              str1 = localException1.toString();
            }
            catch (Exception localException1)
            {
              localJSONObject2 = localJSONObject1;
            }
          }
          catch (Exception localException2)
          {
            JSONObject localJSONObject2 = null;
          }
        }
        paramCallbackContext.success(localJSONObject2);
      }
    });
    return true;
  }
  
  private double round(double paramDouble)
  {
    return Math.round(10.0D * paramDouble) / 10.0D;
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    if ("getLocalDeviceInfo".equals(paramString)) {
      return getLocalDeviceInfo(paramJSONArray, paramCallbackContext);
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/WeMoSMARTUIPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */