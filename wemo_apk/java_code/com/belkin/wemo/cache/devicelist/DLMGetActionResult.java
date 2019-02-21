package com.belkin.wemo.cache.devicelist;

import android.os.AsyncTask;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONObject;

public class DLMGetActionResult
  extends AsyncTask<Object, Void, Boolean>
{
  private static final String TAG = "DLMGetActionResult";
  private DeviceListManager mDLM;
  private JSONObject propertyList = null;
  
  public DLMGetActionResult(DeviceListManager paramDeviceListManager)
  {
    this.mDLM = paramDeviceListManager;
  }
  
  public Boolean doInBackground(Object... paramVarArgs)
  {
    String str1 = (String)paramVarArgs[0];
    String str2 = (String)paramVarArgs[1];
    String[] arrayOfString1 = (String[])paramVarArgs[2];
    String[] arrayOfString2 = (String[])paramVarArgs[3];
    for (;;)
    {
      try
      {
        Action localAction = this.mDLM.getUpnpControl().getDevice(str1).getAction(str2);
        this.mDLM.setArgument(localAction, arrayOfString1, arrayOfString2);
        str3 = localAction.postControlAction();
        if (str3 == null) {
          continue;
        }
        SDKLogUtils.infoLog("DLMGetActionResult", "success from action:" + str2 + " resp: " + str3);
        bool = true;
      }
      catch (Exception localException)
      {
        String str3;
        SDKLogUtils.errorLog("DLMGetActionResult", "Error getting action value" + localException);
        boolean bool = false;
        continue;
      }
      return Boolean.valueOf(bool);
      SDKLogUtils.errorLog("DLMGetActionResult", "Error in action " + str2 + " resp: " + str3);
      bool = false;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/DLMGetActionResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */