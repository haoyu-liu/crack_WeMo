package com.belkin.cordova.plugin.runnable;

import android.content.Context;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.FindBulbCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONObject;

public class FindBulbRunnable
  extends WeMoRunnable
{
  private static final String TAG = "FindBulbRunnable";
  private FindBulbCallback mCallback;
  private Context mContext;
  private DeviceListController mDeviceListController;
  private JSONArray mInParamArray;
  
  public FindBulbRunnable(JSONArray paramJSONArray, FindBulbCallback paramFindBulbCallback, Context paramContext)
  {
    this.mContext = paramContext;
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramFindBulbCallback;
    this.mDeviceListController = DeviceListController.getInstance(paramContext);
  }
  
  public void run()
  {
    try
    {
      if (this.mInParamArray != null)
      {
        if (this.mInParamArray.length() > 0)
        {
          JSONObject localJSONObject = this.mInParamArray.getJSONObject(0);
          if (localJSONObject.has("udn"))
          {
            String str = localJSONObject.getString("udn");
            JSONArray localJSONArray = this.mDeviceListController.findLedBulb(str);
            this.mCallback.onSuccess(localJSONArray.toString());
          }
        }
      }
      else
      {
        this.mCallback.onError("null mInParamArray");
        return;
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("FindBulbRunnable", "Exception in run() method ex:" + localException);
      localException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/FindBulbRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */