package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CloudRequestZigbeeStateChange
  implements CloudRequestInterface
{
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private static final String KEY_STATUS = "status";
  private final String KEY_CAPABILITY_ID = "capabilityId";
  private final String KEY_CAPABILITY_PROFILE = "capabilityProfile";
  private final String KEY_CAPABILITY_ROOT = "deviceCapabilityProfiles";
  private final String KEY_CAPABILITY_VALUE = "currentValue";
  private final String TAG = "SDK_CloudRequestZigbeeStateChange";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 4;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/homeDevices/capabilityProfile?remoteSync=true";
  private String capabilityID;
  private String capabilityName;
  private String capabilityValue;
  private String deviceId;
  private String isGroupAction;
  private DeviceListManager mDevMgr;
  private DeviceInformation mDeviceInfo;
  private String modelCode;
  private String pluginID;
  private String responseCapabilityID = "";
  private String responseCapabilityValue = "";
  private int state;
  
  public CloudRequestZigbeeStateChange(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt, String paramString5, String paramString6)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.deviceId = paramString1;
    this.capabilityID = paramString2;
    this.capabilityName = paramString3;
    this.capabilityValue = paramString4;
    this.state = paramInt;
    this.modelCode = paramString6;
    this.pluginID = paramString5;
  }
  
  private void extractCapabilities(XMLParser paramXMLParser, Element paramElement)
  {
    try
    {
      Node localNode = paramElement.getElementsByTagName("deviceCapabilityProfiles").item(0);
      for (int i = 0;; i++) {
        if (i < localNode.getChildNodes().getLength())
        {
          Element localElement = (Element)localNode.getChildNodes().item(i);
          String str1 = paramXMLParser.getValue((Element)localElement.getElementsByTagName("capabilityProfile").item(0), "capabilityId");
          String str2 = paramXMLParser.getValue(localElement, "currentValue");
          if (str1.equalsIgnoreCase(this.capabilityID))
          {
            this.responseCapabilityID = this.capabilityID;
            this.responseCapabilityValue = str2;
          }
        }
        else
        {
          return;
        }
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("device").item(0);
      SDKLogUtils.infoLog("setNewStateForDevice: ", "success: " + localXMLParser.getValue(localElement, "status"));
      extractCapabilities(localXMLParser, localElement);
      return true;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    List localList1 = Arrays.asList(this.capabilityID.split("\\s*,\\s*"));
    List localList2 = Arrays.asList(this.capabilityValue.split("\\s*,\\s*"));
    String str = "<devices>\n    <device> \n        <pluginId>" + this.pluginID + "</pluginId> \n" + "        <macAddress>" + this.deviceId + "</macAddress> \n" + "        <modelCode>" + this.modelCode + "</modelCode>\n" + "        <status>" + this.state + "</status>\n" + "        <deviceCapabilityProfiles>\n";
    for (int i = 0; i < localList1.size(); i++) {
      str = str + "            <deviceCapabilityProfile>\n                <capabilityId>" + (String)localList1.get(i) + "</capabilityId> \n" + "                <currentValue>" + (String)localList2.get(i) + "</currentValue>\n" + "            </deviceCapabilityProfile>\n";
    }
    return str + "         </deviceCapabilityProfiles>\n       </device>\n</devices>";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 4;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 4;
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
    SDKLogUtils.infoLog("setNewStateForDevice: ", "success: " + paramBoolean);
    boolean bool = false;
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestZigbeeStateChange", str);
        bool = parseResponse(str);
        SDKLogUtils.infoLog("SDK_CloudRequestZigbeeStateChange", "Response parse: " + String.valueOf(bool));
        if (bool)
        {
          SDKLogUtils.infoLog("SDK_CloudRequestZigbeeStateChange", "Request complete: ");
          this.mDevMgr.updateZigbeeStateResponse();
          this.mDevMgr.updateZigbeeCapability(this.deviceId, this.capabilityID, this.capabilityValue);
          this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.deviceId);
        }
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        localUnsupportedEncodingException.printStackTrace();
        this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.deviceId);
        return;
      }
    }
    this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.deviceId);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */