package com.belkin.wemo.cache.devicelist.callback;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class GetSetBlobStorageCallback
  implements PluginResultErrorCallback, PluginResultSuccessCallback
{
  private final String TAG = "GetSetBlobStorageCallback";
  private Context mCallbackContext;
  
  public GetSetBlobStorageCallback(Context paramContext)
  {
    this.mCallbackContext = paramContext;
  }
  
  public void onError(String paramString)
  {
    SDKLogUtils.errorLog("GetSetBlobStorageCallback", "onError SDK error: " + paramString);
  }
  
  public void onSuccess(String paramString)
  {
    SDKLogUtils.infoLog("GetSetBlobStorageCallback", "onSuccess SDK result: " + paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */