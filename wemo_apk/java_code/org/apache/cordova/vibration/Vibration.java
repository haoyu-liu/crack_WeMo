package org.apache.cordova.vibration;

import android.app.Activity;
import android.os.Vibrator;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class Vibration
  extends CordovaPlugin
{
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    boolean bool1 = paramString.equals("vibrate");
    boolean bool2 = false;
    if (bool1)
    {
      vibrate(paramJSONArray.getLong(0));
      paramCallbackContext.success();
      bool2 = true;
    }
    return bool2;
  }
  
  public void vibrate(long paramLong)
  {
    if (paramLong == 0L) {
      paramLong = 500L;
    }
    ((Vibrator)this.cordova.getActivity().getSystemService("vibrator")).vibrate(paramLong);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/vibration/Vibration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */