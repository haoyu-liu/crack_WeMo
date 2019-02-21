package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.util.Log;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.XmlToJSONConverter;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CloudRequestStateChangeForMaker
  implements CloudRequestInterface
{
  private static final String KEY_ATTRIBUTE_LISTS = "attributeLists";
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private static final String KEY_STATUS = "status";
  private final String TAG = "SDK_CloudRequestStateChangeForMaker";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String attributeList;
  private String devName;
  private DeviceListManager mDevMgr;
  private String mac;
  private String newAttributelist;
  private String newDevState;
  private String pluginID;
  private String status;
  private String udn;
  
  public CloudRequestStateChangeForMaker(DeviceListManager paramDeviceListManager, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    this.mDevMgr = paramDeviceListManager;
    this.pluginID = paramString2;
    this.mac = paramString3;
    this.status = paramString4;
    this.udn = paramString1;
    this.attributeList = paramString5;
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      Log.i("SDK_CloudRequestStateChangeForMaker", "Response from Server" + paramString);
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0);
      this.newDevState = localXMLParser.getValue(localElement, "status");
      this.devName = localXMLParser.getValue(localElement, "friendlyName");
      Node localNode = localElement.getElementsByTagName("attributeLists").item(0);
      if (localNode != null)
      {
        boolean bool = this.devName.contains("Maker");
        String str = null;
        if (bool) {
          str = new XmlToJSONConverter(localNode).getJSONMakerString();
        }
        Log.i("SDK_CloudRequestStateChangeForMaker", "attributeList i  state Change ::" + str);
        if (str != null) {
          this.newAttributelist = str;
        }
      }
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
    return "<plugins>\n    <plugin>                 \n        <recipientId>" + this.pluginID + "</recipientId>                    \n" + "        <macAddress>" + this.mac + "</macAddress>\n" + "        <content>                          \n" + "            <![CDATA[ <pluginSetDeviceStatus>\n" + "                            <plugin>                                               \n" + "                                <pluginId>" + this.pluginID + "</pluginId>                                                 \n" + "                                <macAddress>" + this.mac + "</macAddress> \n" + "                                <status>" + this.status + "</status>\n" + "                    <attributeLists action=\"SetAttributes\" >" + this.attributeList + "</attributeLists>\n" + "                            </plugin>\n" + "                      </pluginSetDeviceStatus > ]]>            \n" + "        </content>    \n" + "    </plugin>\n" + "</plugins>";
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
    SDKLogUtils.debugLog("SDK_CloudRequestStateChangeForMaker", "Set Device State Request Completed. is success: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.debugLog("SDK_CloudRequestStateChangeForMaker", str);
        boolean bool = parseResponse(str);
        SDKLogUtils.debugLog("SDK_CloudRequestStateChangeForMaker", "Response parse: " + String.valueOf(bool));
        if (bool) {
          this.mDevMgr.setNewStateForMakerDevice(this.udn, this.devName, this.newDevState, this.newAttributelist);
        }
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestStateChangeForMaker", "UnsupportedEncodingException while parsing cloud response: ", localUnsupportedEncodingException);
        this.mDevMgr.restartCloudPeriodicUpdate();
        return;
      }
    }
    this.mDevMgr.restartCloudPeriodicUpdate();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */