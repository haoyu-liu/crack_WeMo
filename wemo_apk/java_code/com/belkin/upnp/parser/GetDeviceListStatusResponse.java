package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import com.belkin.beans.GetEndDeviceListResponseBean;
import java.io.PrintStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
  GetEndDeviceListResponseBean endList;
  private boolean isGroupAction = false;
  private JSONArray jsonArr;
  JSONObject jsonObject = new JSONObject();
  private boolean lastEventTimeStamp = false;
  private boolean processValue = false;
  private StringBuffer responseBuffer;
  private String tempVal;
  
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
    try
    {
      this.jsonObject.put("Availability", this.deviceIdAvailablity);
      if (this.isGroupAction) {
        this.jsonObject.put("IsGroupAction", this.tempVal);
      }
      if (this.devidId) {
        this.jsonObject.put("DeviceIDLED", this.tempVal);
      }
      if (this.capabilityId) {
        this.jsonObject.put("capabilityid", this.tempVal);
      }
      if (this.capabilityValue) {
        this.jsonObject.put("capabilityvalue", this.tempVal);
      }
      if (this.lastEventTimeStamp) {
        this.jsonObject.put("lastEventTimeStamp", this.tempVal);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
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
      this.jsonArr.put(this.jsonObject);
    }
    if (paramString3.equals("LastEventTimeStamp")) {
      this.lastEventTimeStamp = false;
    }
  }
  
  public JSONArray parseForDeviceListStatus(String paramString)
  {
    this.endList = new GetEndDeviceListResponseBean();
    this.jsonObject = new JSONObject();
    this.responseBuffer = new StringBuffer();
    this.jsonArr = new JSONArray();
    try
    {
      Xml.parse(paramString, this);
      str = new String(this.responseBuffer);
      str.replace("&lt;", "<");
      str.replace("&gt;", ">");
      str.replace("&quot;", "\"\"");
      System.out.println("LED AFTER REPLACE *******" + str);
    }
    catch (SAXException localSAXException1)
    {
      try
      {
        String str;
        Xml.parse(str, this);
        Log.d("GetDeviceresponse", "GetdeviceResponse: " + this.jsonArr.toString());
        return this.jsonArr;
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
      this.jsonObject = new JSONObject();
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetDeviceListStatusResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */