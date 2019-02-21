package com.belkin.cordova.plugin.runnable;

import android.content.Context;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.GetBlobStorageCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONObject;

public class GetBlobStorageRunnable
  extends WeMoRunnable
{
  private static String TAG = "GetBlobStorageRunnable";
  private GetBlobStorageCallback mCallback;
  private Context mContext;
  private DeviceListController mDLC;
  private JSONArray mInParamArray;
  
  public GetBlobStorageRunnable(JSONArray paramJSONArray, GetBlobStorageCallback paramGetBlobStorageCallback, Context paramContext)
  {
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramGetBlobStorageCallback;
    this.mContext = paramContext;
    this.mDLC = DeviceListController.getInstance(this.mContext);
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
          break label135;
        }
        if (this.mInParamArray.length() > 1)
        {
          String str = this.mInParamArray.getString(0);
          JSONObject localJSONObject2 = this.mInParamArray.getJSONObject(1);
          if (this.mDLC.getBlobStorage(str, localJSONObject2))
          {
            this.mCallback.onSuccess("");
            if (!localJSONObject1.has("error")) {
              break;
            }
            LogUtils.errorLog(TAG, "Error in run() of GetBlobStorageRunnable");
            this.mCallback.onError(localJSONObject1.getString("error"));
            return;
          }
          this.mCallback.onError("Error in getBlobStorage");
          continue;
        }
        localJSONObject1.put("error", "Missing udn in inParamArray");
      }
      catch (Exception localException)
      {
        LogUtils.errorLog(TAG, "Exception in run() of GetBlobStorageRunnable: ", localException);
        return;
      }
      continue;
      label135:
      localJSONObject1.put("error", "Null inParamArray");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/GetBlobStorageRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */