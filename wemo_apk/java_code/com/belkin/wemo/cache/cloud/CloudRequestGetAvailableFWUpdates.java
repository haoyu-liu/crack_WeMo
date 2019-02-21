package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONArray;

public class CloudRequestGetAvailableFWUpdates
  implements CloudRequestInterface
{
  private final String TAG;
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  protected String URL = CloudConstants.CLOUD_URL + "/apis/http/firmware/upgrades";
  private JSONArray deviceList;
  private String homeID = "";
  private Boolean isRemoteEnabled = Boolean.valueOf(false);
  protected DeviceListManager mDevMgr;
  
  public CloudRequestGetAvailableFWUpdates(Context paramContext, JSONArray paramJSONArray, String paramString)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.isRemoteEnabled = Boolean.valueOf(new SharePreferences(paramContext).isRemoteEnabled());
    this.deviceList = paramJSONArray;
    this.homeID = paramString;
    this.TAG = getClass().getSimpleName();
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return this.deviceList.toString();
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
    return 40000;
  }
  
  public String getURL()
  {
    if ((this.isRemoteEnabled.booleanValue()) && (!TextUtils.isEmpty(this.homeID))) {
      return this.URL + "/" + this.homeID;
    }
    return this.URL;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  protected void onRequestFailed()
  {
    new CloudRequestManager(DeviceListManager.context).makeRequest(new CloudRequestGetAvailFWUpdatesNoHomeID(DeviceListManager.context, this.deviceList));
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.infoLog(this.TAG, "success: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(this.TAG, str);
        if (str != null) {
          this.mDevMgr.sendNotification("available_fw_updates", Boolean.toString(paramBoolean), str);
        }
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException during parsing of Get Available FWs from cloud: ", localUnsupportedEncodingException);
        return;
      }
    }
    onRequestFailed();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */