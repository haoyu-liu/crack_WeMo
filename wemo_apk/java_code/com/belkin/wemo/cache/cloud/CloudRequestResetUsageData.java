package com.belkin.wemo.cache.cloud;

import android.text.TextUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestResetUsageData
  implements CloudRequestInterface
{
  private static final String TAG = "CloudRequestResetUsageData";
  private final int TIMEOUT = 100;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private DeviceListManager mDevMgr;
  private String mUdn;
  private String macAddress;
  private String notification;
  private String pluginID;
  
  public CloudRequestResetUsageData(DeviceListManager paramDeviceListManager, String paramString1, String paramString2, String paramString3, Object... paramVarArgs)
  {
    if (paramVarArgs.length > 0) {
      this.notification = ((String)paramVarArgs[0]);
    }
    this.pluginID = paramString2;
    this.macAddress = paramString3;
    this.mDevMgr = paramDeviceListManager;
    this.mUdn = paramString1;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    String str = "<plugins><plugin>  <recipientId>" + this.pluginID + "</recipientId>" + "  <macAddress>" + this.macAddress + "</macAddress>" + "  <modelCode>" + this.mUdn + "</modelCode> ";
    return str + "<content><![CDATA[<setClearDataUsage><plugin><macAddress>" + this.macAddress + "</macAddress></plugin></setClearDataUsage>]]>" + "</content></plugin></plugins>";
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
    return 100;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
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
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.infoLog("CloudRequestResetUsageData", "resetUsageData over remote requestComple");
    bool1 = false;
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog("CloudRequestResetUsageData", str);
      boolean bool2 = TextUtils.isEmpty(str);
      bool1 = false;
      if (!bool2) {
        bool1 = true;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("CloudRequestResetUsageData", "Exception in requestComplete e:" + localException);
        bool1 = false;
      }
    }
    this.mDevMgr.sendNotification(this.notification, bool1 + "", this.mUdn);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestResetUsageData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */