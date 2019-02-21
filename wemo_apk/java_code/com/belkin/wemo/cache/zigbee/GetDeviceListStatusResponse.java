package com.belkin.wemo.cache.zigbee;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.ArrayList;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetDeviceListStatusResponse
  extends DefaultHandler
{
  private boolean capabilityId = false;
  private boolean capabilityValue = false;
  private String deviceIdAvailablity = "";
  private boolean deviceStatus = false;
  private boolean devidId = false;
  private boolean isGroupAction = false;
  private boolean lastEventTimeStamp = false;
  private boolean processValue = false;
  private StringBuffer responseBuffer;
  private String tempVal;
  private ZigBeeGetDeviceListStatusResponse zbResp;
  private ArrayList<ZigBeeGetDeviceListStatusResponse> zbRespList;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    String str = "";
    this.tempVal = new String(paramArrayOfChar, paramInt1, paramInt2);
    if (this.processValue == true)
    {
      if (paramArrayOfChar[0] != '\n') {
        str = new String(paramArrayOfChar, paramInt1, paramInt2);
      }
      if (str.equalsIgnoreCase("available=")) {
        this.responseBuffer.append(" ");
      }
      this.responseBuffer.append(new String(paramArrayOfChar, paramInt1, paramInt2));
    }
    this.zbResp.setAvability(this.deviceIdAvailablity);
    if (this.isGroupAction) {
      this.zbResp.setIsGroupAction(this.tempVal);
    }
    if (this.devidId) {
      this.zbResp.setDeviceIDLED(this.tempVal);
    }
    if (this.capabilityId) {
      this.zbResp.setCapabilityid(this.tempVal);
    }
    if (this.capabilityValue) {
      this.zbResp.setCapabilityvalue(this.tempVal);
    }
    if (this.lastEventTimeStamp) {
      this.zbResp.setLastEventTimeStamp(Integer.parseInt(this.tempVal));
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString3.equals("DeviceStatus")) {
      this.deviceStatus = false;
    }
    if (paramString3.equals("IsGroupAction")) {
      this.isGroupAction = false;
    }
    if (paramString3.equals("DeviceID")) {
      this.devidId = false;
    }
    if (paramString3.equals("CapabilityID")) {
      this.capabilityId = false;
    }
    if (paramString3.equals("CapabilityValue"))
    {
      this.capabilityValue = false;
      this.zbRespList.add(this.zbResp);
    }
    if (paramString3.equals("LastEventTimeStamp")) {
      this.lastEventTimeStamp = false;
    }
  }
  
  public ArrayList<ZigBeeGetDeviceListStatusResponse> parseForDeviceListStatus(String paramString)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "MSearch Device Added: parseForDeviceListStatus");
    this.zbResp = new ZigBeeGetDeviceListStatusResponse();
    this.responseBuffer = new StringBuffer();
    this.zbRespList = new ArrayList();
    try
    {
      Xml.parse(paramString, this);
      str = new String(this.responseBuffer);
      str.replace("&lt;", "<");
      str.replace("&gt;", ">");
      str.replace("&quot;", "\"\"");
    }
    catch (SAXException localSAXException1)
    {
      try
      {
        String str;
        Xml.parse(str, this);
        SDKLogUtils.infoLog("ZigbeeScan", "MSearch Device Added: status response after parse" + str);
        SDKLogUtils.infoLog("ZigbeeScan", "MSearch Device Added: GetdeviceResponse" + this.zbRespList.size());
        return this.zbRespList;
        localSAXException1 = localSAXException1;
        localSAXException1.printStackTrace();
      }
      catch (SAXException localSAXException2)
      {
        for (;;)
        {
          localSAXException2.printStackTrace();
        }
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals("DeviceStatusList")) {
      this.processValue = true;
    }
    if (paramString3.equals("DeviceStatus"))
    {
      this.deviceStatus = true;
      this.zbResp = new ZigBeeGetDeviceListStatusResponse();
    }
    if (paramString3.equals("IsGroupAction")) {
      this.isGroupAction = true;
    }
    if (paramString3.contains("DeviceID"))
    {
      this.devidId = true;
      this.deviceIdAvailablity = paramAttributes.getValue("available");
    }
    if (paramString3.equals("CapabilityID")) {
      this.capabilityId = true;
    }
    if (paramString3.equals("CapabilityValue")) {
      this.capabilityValue = true;
    }
    if (paramString3.equals("LastEventTimeStamp")) {
      this.lastEventTimeStamp = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */