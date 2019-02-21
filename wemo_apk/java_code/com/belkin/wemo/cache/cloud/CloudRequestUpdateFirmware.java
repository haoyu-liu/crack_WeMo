package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class CloudRequestUpdateFirmware
  implements CloudRequestInterface
{
  private static final String PLUGINS = "plugins";
  private static final String RESULT_CODE = "resultCode";
  private static String UPDATE_FAILED = "2";
  private static String UPDATE_STARTED = "0";
  private final String TAG = "CloudRequestUpdateFirmware";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/upgradeFwVersion";
  private String bridgeMacAddress = "";
  private boolean isZigbee = false;
  private DeviceListManager mDevMgr;
  private String macAddress = "";
  private String pluginID = "";
  private String signature = "";
  private String udn = "";
  private String url = "";
  
  public CloudRequestUpdateFirmware(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, boolean paramBoolean, String paramString6)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.macAddress = paramString1;
    this.pluginID = paramString2;
    this.url = paramString3;
    this.signature = paramString4;
    this.udn = paramString5;
    this.isZigbee = paramBoolean;
    this.bridgeMacAddress = paramString6;
  }
  
  private boolean parseResponse(String paramString)
  {
    NodeList localNodeList = new XMLParser().getDomElement(paramString).getElementsByTagName("plugins");
    if ((localNodeList != null) && (localNodeList.getLength() > 0)) {}
    for (boolean bool = true;; bool = false)
    {
      SDKLogUtils.infoLog("CloudRequestUpdateFirmware", "parseResponse:: " + bool);
      return bool;
    }
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    if (this.isZigbee)
    {
      boolean bool = this.udn.contains(",");
      int i = 0;
      if (bool) {
        i = 1;
      }
      String str1 = "<plugins><plugin><recipientId>" + this.pluginID + "</recipientId>" + "<macAddress>" + this.macAddress + "</macAddress>" + "<content><![CDATA[<upgradeFwVersion>" + "<plugins>";
      if (i != 0) {
        for (String str2 : this.udn.split(",")) {
          str1 = str1 + "<plugin>" + "  <downloadStartTime>" + System.currentTimeMillis() + "</downloadStartTime>" + "  <macAddress>" + str2 + "</macAddress>" + "  <signature>" + this.signature + "</signature>" + "  <firmwareDownloadUrl>" + this.url + "</firmwareDownloadUrl>" + "  </plugin>";
        }
      }
      str1 = str1 + "<plugin>" + "  <downloadStartTime>" + System.currentTimeMillis() + "</downloadStartTime>" + "  <macAddress>" + this.udn + "</macAddress>" + "  <signature>" + this.signature + "</signature>" + "  <firmwareDownloadUrl>" + this.url + "</firmwareDownloadUrl>" + "  </plugin>";
      return str1 + "</plugins></upgradeFwVersion>]]></content></plugin></plugins>";
    }
    return "<plugins>  <plugin>  <recipientId>" + this.pluginID + "</recipientId>" + "  <macAddress>" + this.macAddress + "</macAddress>" + "  <content>" + "<![CDATA[<upgradeFwVersion>" + "  <plugin>" + "  <downloadStartTime>" + "0" + "</downloadStartTime>" + "  <signature>" + this.signature + "</signature>" + "  <firmwareDownloadUrl>" + this.url + "</firmwareDownloadUrl>" + "  <macAddress>" + this.macAddress + "</macAddress>" + "  </plugin>" + "</upgradeFwVersion>]]>" + " </content>" + "  </plugin></plugins>";
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
    return 30000;
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
    SDKLogUtils.infoLog("CloudRequestUpdateFirmware", "success: " + paramBoolean);
    if (paramBoolean)
    {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("CloudRequestUpdateFirmware", str1);
        if (str1 == null) {
          return;
        }
        if (parseResponse(str1))
        {
          SDKLogUtils.infoLog("CloudRequestUpdateFirmware", "firmware update started successfully for udn:" + this.udn);
          if (this.isZigbee)
          {
            if (this.udn.contains(",")) {
              for (String str2 : this.udn.split(",")) {
                this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_STARTED, str2);
              }
            }
            this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_STARTED, this.udn);
            return;
          }
          this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_STARTED, this.udn);
          return;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog("CloudRequestUpdateFirmware", "error in firmware update", localUnsupportedEncodingException);
        this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_FAILED, this.udn);
        return;
      }
      this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_FAILED, this.udn);
      return;
    }
    this.mDevMgr.sendNotification("FirmwareUpdateStatus", UPDATE_FAILED, this.udn);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */