package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.WemoAppRecovery;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudRequestForAppRecovery
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestForAppRecovery";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 4000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/firmware/upgrades" + "/";
  private String homeID = "";
  private DeviceListManagerCallbacksActivity mActivity;
  private Context mContext;
  private WemoAppRecovery mWemoAppRecovery;
  private String options = "1";
  
  public CloudRequestForAppRecovery(Context paramContext, DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity, String paramString)
  {
    this.mWemoAppRecovery = WemoAppRecovery.getInstance(paramContext);
    this.mContext = paramContext;
    this.mActivity = paramDeviceListManagerCallbacksActivity;
    this.homeID = paramString;
  }
  
  private String parseErrorCode(String paramString, int paramInt)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject(paramString);
      if (paramInt == 403) {}
      String str;
      for (Object localObject = localJSONObject.getJSONObject("Error").getString("code");; localObject = str)
      {
        SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", " AppRecovery error code is :: " + (String)localObject);
        return (String)localObject;
        str = localJSONObject.getJSONObject("error").getJSONObject("resultCode").getString("code");
      }
      return null;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestForAppRecovery", " AppRecovery exception during parsing json errorcode :: ", localJSONException);
    }
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
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 4000;
  }
  
  public String getURL()
  {
    SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", "Inside getURL :: consistentFlag is:  " + this.mWemoAppRecovery.consistentFlag);
    if (!this.mWemoAppRecovery.consistentFlag) {}
    for (this.options = "2";; this.options = "1") {
      return this.URL + this.homeID + "?options=" + this.options;
    }
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
    SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", "in requestComplete :: Response success is :: " + paramBoolean + " :: statusCode is :: " + paramInt);
    Object localObject = null;
    if (paramArrayOfByte != null) {}
    try
    {
      String str2 = new String(paramArrayOfByte, "UTF-8");
      localObject = str2;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      RemoteAccessManager localRemoteAccessManager;
      do
      {
        do
        {
          String str1;
          do
          {
            do
            {
              for (;;)
              {
                SDKLogUtils.errorLog("SDK_CloudRequestForAppRecovery", " ::Exception during encoding of cloud response :: ", localUnsupportedEncodingException);
                localObject = null;
              }
            } while ((paramInt != 403) && (paramInt != 400));
            str1 = parseErrorCode((String)localObject, paramInt);
          } while ((TextUtils.isEmpty(str1)) || (((!str1.equals("ERR_002")) || (paramInt != 403)) && (((!str1.equals("WEMO_415")) && (!str1.equals("WEMO_414"))) || (paramInt != 400))));
          this.mWemoAppRecovery.consistentFlag = false;
          WemoAppRecovery localWemoAppRecovery1 = this.mWemoAppRecovery;
          localWemoAppRecovery1.counter = (1 + localWemoAppRecovery1.counter);
          this.mWemoAppRecovery.setAppRecoveryData(this.mWemoAppRecovery);
          SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", "appRecovery ::  counter ::" + this.mWemoAppRecovery.counter + " :: consistentFlag ::" + this.mWemoAppRecovery.consistentFlag + " :: maxRetryCount ::" + this.mWemoAppRecovery.maxRetryCount);
        } while ((!NetworkMode.isLocal()) || (this.mWemoAppRecovery.counter <= 2) || (this.mWemoAppRecovery.consistentFlag) || (this.mWemoAppRecovery.maxRetryCount >= 2));
        localRemoteAccessManager = new RemoteAccessManager(this.mActivity, this.mContext);
        SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", "Enabling Remote Access");
      } while (!localRemoteAccessManager.enableRemoteAccess());
      this.mWemoAppRecovery.consistentFlag = false;
      WemoAppRecovery localWemoAppRecovery2 = this.mWemoAppRecovery;
      localWemoAppRecovery2.maxRetryCount = (1 + localWemoAppRecovery2.maxRetryCount);
      this.mWemoAppRecovery.setAppRecoveryData(this.mWemoAppRecovery);
    }
    SDKLogUtils.infoLog("SDK_CloudRequestForAppRecovery", " :: response of fwUpgradeInfo API is :: " + String.valueOf(localObject));
    if (paramBoolean)
    {
      this.mWemoAppRecovery.consistentFlag = true;
      this.mWemoAppRecovery.counter = 0;
      this.mWemoAppRecovery.maxRetryCount = 0;
      this.mWemoAppRecovery.setAppRecoveryData(this.mWemoAppRecovery);
      return;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForAppRecovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */