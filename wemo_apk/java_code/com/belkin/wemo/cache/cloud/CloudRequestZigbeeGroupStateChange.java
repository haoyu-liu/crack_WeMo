package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestZigbeeGroupStateChange
  implements CloudRequestInterface
{
  private static final String KEY_GROUPS = "groups";
  private static final String KEY_STATUS = "statusCode";
  private final String TAG = "SDK_CloudRequestZigbeeGroupStateChange";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 4;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/groups/capabilityProfile?remoteSync=true";
  private String capabilityID;
  private String capabilityName = "";
  private String capabilityValue;
  private String groupID;
  private String groupName;
  private ArrayList<DeviceInformation> groupedLEDList = null;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  
  public CloudRequestZigbeeGroupStateChange(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "in CloudRequestZigbeeGroupStateChange: " + paramString1);
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.mCacheManager = CacheManager.getInstance(paramContext);
    this.groupID = paramString1;
    this.capabilityID = paramString2;
    this.capabilityName = paramString3;
    this.capabilityValue = paramString4;
    this.groupedLEDList = this.mCacheManager.getDevicesForGroup(paramString1);
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("groups").item(0);
      SDKLogUtils.infoLog("stateforGroup: ", "success: " + localXMLParser.getValue(localElement, "statusCode"));
      boolean bool1 = localXMLParser.getValue(localElement, "statusCode").equalsIgnoreCase("S");
      boolean bool2 = false;
      if (bool1) {
        bool2 = true;
      }
      return bool2;
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
    if (this.groupedLEDList.size() > 0) {
      this.groupName = ((DeviceInformation)this.groupedLEDList.get(0)).getGroupName();
    }
    String str1 = "<groups><group><id>" + this.groupID + "</id>" + "<referenceId>" + this.groupID + "</referenceId>" + "<groupName>" + this.groupName + "</groupName>" + " <iconVersion>" + 0 + "</iconVersion>" + "<devices>";
    Iterator localIterator = this.groupedLEDList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      str1 = str1 + "<device>" + "<deviceId>" + localDeviceInformation.getPluginID() + "</deviceId>" + "</device>";
    }
    String str2 = str1 + "</devices>" + "<capabilities>";
    for (int i = 0; i < localList1.size(); i++) {
      str2 = str2 + "<capability><capabilityId>" + (String)localList1.get(i) + "</capabilityId>" + "<currentValue>" + (String)localList2.get(i) + "</currentValue>" + "</capability>";
    }
    String str3 = str2 + "</capabilities></group></groups>";
    SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "body: " + str3);
    return str3;
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
    SDKLogUtils.infoLog("setgroupState: ", "success: " + paramBoolean);
    boolean bool = false;
    if (paramBoolean)
    {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", str);
        bool = parseResponse(str);
        SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "Response parse: " + String.valueOf(bool));
        if (!bool) {
          break label267;
        }
        SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "Request complete: ");
        if (this.groupedLEDList.size() > 0)
        {
          Iterator localIterator = this.groupedLEDList.iterator();
          while (localIterator.hasNext())
          {
            DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
            this.mDevMgr.updateZigbeeCapability(localDeviceInformation.getUDN(), this.capabilityID, this.capabilityValue);
            SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "updated cache and db for :" + localDeviceInformation.getUDN());
          }
        }
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        localUnsupportedEncodingException.printStackTrace();
        this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.groupID);
      }
      SDKLogUtils.infoLog("SDK_CloudRequestZigbeeGroupStateChange", "sending positive notification :" + paramBoolean);
      this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.groupID);
      return;
      label267:
      this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.groupID);
      return;
    }
    this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.groupID);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestZigbeeGroupStateChange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */