package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.os.Build;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestAddLocation
  implements CloudRequestInterface
{
  private static final String KEY_HOME_ID = "homeId";
  private static final String KEY_HOME_TAG = "home";
  private final String TAG = "SDK_CloudRequestAddLocation";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/location/";
  private String arpMac;
  private String currentHomeId;
  private String deviceId;
  private String locationName;
  private DeviceListManager mDevMgr;
  private String newHomeId;
  private String ssid;
  
  public CloudRequestAddLocation(DeviceListManager paramDeviceListManager, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    this.mDevMgr = paramDeviceListManager;
    this.deviceId = paramString1;
    this.arpMac = paramString2;
    this.ssid = paramString3;
    this.currentHomeId = paramString4;
    this.locationName = paramString5;
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      this.newHomeId = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("home").item(0), "homeId");
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
    return "<location>\n    <home>\n        <key1>" + this.arpMac + "</key1>\n" + "        <key2>" + this.ssid + "</key2>\n" + "        <key3>" + this.arpMac + "</key3>\n" + "    </home>\n" + "    <currentHomeId>" + this.currentHomeId + "</currentHomeId>\n" + "    <smartDevice>\n" + "        <smartDeviceId>" + this.deviceId + "</smartDeviceId>\n" + "        <description>" + Build.MODEL + "</description>\n" + "    </smartDevice>\n" + "</location>";
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
    SDKLogUtils.infoLog("SDK_CloudRequestAddLocation", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestAddLocation", str);
        boolean bool = parseResponse(str);
        SDKLogUtils.infoLog("SDK_CloudRequestAddLocation", "requestComplete Response parse: " + String.valueOf(bool) + " newHomeId: " + this.newHomeId);
        if (bool)
        {
          this.mDevMgr.setAndAddNewLocationCallback(this.newHomeId, this.arpMac, this.ssid, this.locationName);
          return;
        }
        this.mDevMgr.setAndAddNewLocationCallback(null, this.arpMac, this.ssid, this.locationName);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        this.mDevMgr.setAndAddNewLocationCallback(null, this.arpMac, this.ssid, this.locationName);
        return;
      }
    }
    this.mDevMgr.setAndAddNewLocationCallback(null, this.arpMac, this.ssid, this.locationName);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestAddLocation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */