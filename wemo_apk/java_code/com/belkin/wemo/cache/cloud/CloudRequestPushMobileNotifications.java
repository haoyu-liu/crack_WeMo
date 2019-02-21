package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudRequestPushMobileNotifications
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestPushMobileNotifications.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/ext/pushMobileNotifications/";
  private String homeId;
  private boolean isLongPressRule;
  private String newDBVersion;
  private OnRequestCompleteListener onRequestCompleteListener;
  private String udn;
  
  public CloudRequestPushMobileNotifications(String paramString1, String paramString2, String paramString3, boolean paramBoolean, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    this.newDBVersion = paramString3;
    this.udn = paramString2;
    this.homeId = paramString1;
    this.isLongPressRule = paramBoolean;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("Content-Type", "application/json");
    return localHashMap;
  }
  
  public String getBody()
  {
    JSONObject localJSONObject1 = new JSONObject();
    for (;;)
    {
      try
      {
        localJSONObject2 = new JSONObject();
        localJSONObject2.put("code", "CREATE_RULE");
        if (!this.isLongPressRule) {
          continue;
        }
        localJSONObject2.put("message", this.newDBVersion + "#$" + this.udn);
        localJSONObject1.put("pushEvent", localJSONObject2);
      }
      catch (JSONException localJSONException)
      {
        JSONObject localJSONObject2;
        SDKLogUtils.errorLog(this.TAG, "JSONException while creating body: ", localJSONException);
        continue;
      }
      SDKLogUtils.debugLog(this.TAG, "BODY: " + localJSONObject1.toString());
      return localJSONObject1.toString();
      localJSONObject2.put("message", this.newDBVersion);
    }
  }
  
  public byte[] getFileByteArray()
  {
    return getBody().getBytes();
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    return this.URL + this.homeId;
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
    SDKLogUtils.infoLog(this.TAG, "success: " + paramBoolean);
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */