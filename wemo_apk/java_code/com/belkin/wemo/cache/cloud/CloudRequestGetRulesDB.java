package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestGetRulesDB
  implements CloudRequestInterface
{
  private static final String TAG = CloudRequestGetRulesDB.class.getSimpleName();
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 240000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/dbfile/";
  private String cloudURL = this.URL + paramString;
  private OnRequestCompleteListener listener;
  
  public CloudRequestGetRulesDB(Context paramContext, String paramString, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.listener = paramOnRequestCompleteListener;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 2;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 240000;
  }
  
  public String getURL()
  {
    return this.cloudURL;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.debugLog(TAG, "Is success: " + paramBoolean + "; Status Code: " + paramInt);
    if (this.listener != null) {
      this.listener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetRulesDB.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */