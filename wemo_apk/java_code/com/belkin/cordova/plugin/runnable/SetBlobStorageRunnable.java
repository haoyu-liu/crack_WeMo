package com.belkin.cordova.plugin.runnable;

import android.content.Context;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.SetBlobStorageCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONObject;

public class SetBlobStorageRunnable
  extends WeMoRunnable
{
  private final String TAG = "SetBlobStorageRunnable";
  private SetBlobStorageCallback mCallback;
  private Context mContext;
  private DeviceListController mDLC;
  private JSONArray mInParamArray;
  
  public SetBlobStorageRunnable(JSONArray paramJSONArray, SetBlobStorageCallback paramSetBlobStorageCallback, Context paramContext)
  {
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramSetBlobStorageCallback;
    this.mContext = paramContext;
    this.mDLC = DeviceListController.getInstance(paramContext);
  }
  
  public void run()
  {
    for (;;)
    {
      JSONObject localJSONObject1;
      try
      {
        localJSONObject1 = new JSONObject();
        if (this.mInParamArray == null) {
          break label133;
        }
        if (this.mInParamArray.length() > 1)
        {
          String str = this.mInParamArray.getString(0);
          JSONObject localJSONObject2 = this.mInParamArray.getJSONObject(1);
          if (this.mDLC.setBlobStorage(str, localJSONObject2))
          {
            this.mCallback.onSuccess("");
            if (!localJSONObject1.has("error")) {
              break;
            }
            LogUtils.errorLog("SetBlobStorageRunnable", "Error in run() of SetBlobStorageRunnable");
            this.mCallback.onError(localJSONObject1.getString("error"));
            return;
          }
          this.mCallback.onError("Error in setBlobStorage");
          continue;
        }
        localJSONObject1.put("error", "Missing udn in inParamArray");
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("SetBlobStorageRunnable", "Exception in run() ex: ", localException);
        return;
      }
      continue;
      label133:
      localJSONObject1.put("error", "Null inParamArray");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/SetBlobStorageRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */