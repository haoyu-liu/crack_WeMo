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

public class GetEndDeviceListResponse
  extends DefaultHandler
{
  private static String deviceListTyp;
  private boolean capabilityId = false;
  private boolean currenState = false;
  private boolean deviceId = false;
  private String deviceIdAvailablity;
  private boolean deviceIndex = false;
  private boolean deviceInfo = false;
  private boolean deviceInfos = false;
  private boolean deviceListType = false;
  GetEndDeviceListResponseBean endList;
  private boolean firmwareVersion = false;
  private boolean friendlyName = false;
  private boolean groupCapabilityId = false;
  private boolean groupCapabilityValues = false;
  private boolean groupId = false;
  private boolean groupInfo = false;
  private boolean groupName = false;
  private boolean iconVersion = false;
  private JSONArray jsonArr;
  private JSONArray jsonGroupArray;
  JSONObject jsonGroupObj;
  JSONObject jsonObject;
  private boolean manufacturerName = false;
  private boolean modelCode = false;
  private boolean processValue = false;
  private boolean productName = false;
  private StringBuffer responseBuffer;
  private boolean rtmFW = false;
  private String tempVal;
  private boolean wemoCertified = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.processValue == true) && (paramArrayOfChar[0] != '\n'))
    {
      if (new String(paramArrayOfChar, paramInt1, paramInt2).equalsIgnoreCase("available=")) {
        this.responseBuffer.append(" ");
      }
      this.responseBuffer.append(new String(paramArrayOfChar, paramInt1, paramInt2));
    }
    this.tempVal = new String(paramArrayOfChar, paramInt1, paramInt2);
    try
    {
      this.jsonObject.put("Availability", this.deviceIdAvailablity);
      if (this.groupInfo)
      {
        if (this.deviceIndex) {
          this.jsonObject.put("DeviceIndex", this.tempVal);
        }
        if (this.deviceListType)
        {
          this.jsonObject.put("DeviceListType", this.tempVal);
          deviceListTyp = this.tempVal;
        }
        if (this.deviceId) {
          this.jsonObject.put("DeviceID", this.tempVal);
        }
        if (this.friendlyName) {
          this.jsonObject.put("FriendlyName", this.tempVal);
        }
        if (this.iconVersion) {
          this.jsonObject.put("IconVersion", this.tempVal);
        }
        if (this.firmwareVersion) {
          this.jsonObject.put("FirmwareVersion", this.tempVal);
        }
        if (this.capabilityId)
        {
          this.jsonObject.put("CapabilityIDs", this.tempVal);
          this.jsonObject.put("DeviceListType", deviceListTyp);
          Log.v("device list type:", deviceListTyp);
          this.jsonGroupArray.put(this.jsonObject);
        }
        if (this.currenState) {
          this.jsonObject.put("CurrentState", this.tempVal);
        }
        if (this.manufacturerName) {
          this.jsonObject.put("ManufacturerName", this.tempVal);
        }
        if (this.modelCode) {
          this.jsonObject.put("ModelCode", this.tempVal);
        }
        if (this.productName) {
          this.jsonObject.put("ProductName", this.tempVal);
        }
        if (this.wemoCertified) {
          this.jsonObject.put("WemoCertified", this.tempVal);
        }
        if (this.groupId) {
          this.jsonGroupObj.put("GroupID", this.tempVal);
        }
        if (this.groupName) {
          this.jsonGroupObj.put("GroupName", this.tempVal);
        }
        if (this.groupCapabilityId) {
          this.jsonGroupObj.put("GroupCapabilityIDs", this.tempVal);
        }
        if (this.groupCapabilityValues) {
          this.jsonGroupObj.put("GroupCapabilityValues", this.tempVal);
        }
      }
      else
      {
        if (this.deviceIndex) {
          this.jsonObject.put("DeviceIndex", this.tempVal);
        }
        if (this.deviceListType) {
          deviceListTyp = this.tempVal;
        }
        if (this.deviceId) {
          this.jsonObject.put("DeviceID", this.tempVal);
        }
        if (this.friendlyName) {
          this.jsonObject.put("FriendlyName", this.tempVal);
        }
        if (this.iconVersion) {
          this.jsonObject.put("IconVersion", this.tempVal);
        }
        if (this.firmwareVersion) {
          this.jsonObject.put("FirmwareVersion", this.tempVal);
        }
        if (this.capabilityId) {
          this.jsonObject.put("CapabilityIDs", this.tempVal);
        }
        if (this.manufacturerName) {
          this.jsonObject.put("ManufacturerName", this.tempVal);
        }
        if (this.modelCode) {
          this.jsonObject.put("ModelCode", this.tempVal);
        }
        if (this.productName) {
          this.jsonObject.put("ProductName", this.tempVal);
        }
        if (this.wemoCertified)
        {
          this.jsonObject.put("WemoCertified", this.tempVal);
          if (!this.rtmFW)
          {
            this.jsonObject.put("DeviceListType", deviceListTyp);
            this.jsonArr.put(this.jsonObject);
          }
        }
        if (this.currenState)
        {
          this.jsonObject.put("CurrentState", this.tempVal);
          if (this.rtmFW)
          {
            this.jsonObject.put("DeviceListType", deviceListTyp);
            this.jsonArr.put(this.jsonObject);
            return;
          }
        }
      }
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
    if (paramString3.equals("DeviceInfo")) {
      this.deviceInfo = false;
    }
    if (paramString3.equals("DeviceInfos")) {
      this.deviceInfos = false;
    }
    if (paramString3.equals("DeviceListType")) {
      this.deviceListType = false;
    }
    if (paramString3.equals("DeviceIndex")) {
      this.deviceIndex = false;
    }
    if (paramString3.equals("DeviceID")) {
      this.deviceId = false;
    }
    if (paramString3.equals("FriendlyName")) {
      this.friendlyName = false;
    }
    if (paramString3.equals("IconVersion")) {
      this.iconVersion = false;
    }
    if (paramString3.equals("FirmwareVersion")) {
      this.firmwareVersion = false;
    }
    if (paramString3.equals("CapabilityIDs")) {
      this.capabilityId = false;
    }
    if (paramString3.equals("CurrentState")) {
      this.currenState = false;
    }
    if (paramString3.equals("Manufacturer")) {
      this.manufacturerName = false;
    }
    if (paramString3.equals("ModelCode")) {
      this.modelCode = false;
    }
    if (paramString3.equals("productName")) {
      this.productName = false;
    }
    if (paramString3.equals("WeMoCertified")) {
      this.wemoCertified = false;
    }
    if (paramString3.equals("GroupInfo")) {}
    try
    {
      this.jsonGroupObj.put("GroupIDS", this.jsonGroupArray);
      this.jsonArr.put(this.jsonGroupObj);
      this.groupInfo = false;
      if (paramString3.equals("GroupID")) {
        this.groupId = false;
      }
      if (paramString3.equals("GroupName")) {
        this.groupName = false;
      }
      if (paramString3.equals("GroupCapabilityIDs")) {
        this.groupCapabilityId = false;
      }
      if (paramString3.equals("GroupCapabilityValues")) {
        this.groupCapabilityValues = false;
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  public JSONArray parseForGetEndDeviceList(String paramString)
  {
    this.endList = new GetEndDeviceListResponseBean();
    this.jsonObject = new JSONObject();
    this.jsonGroupObj = new JSONObject();
    this.jsonArr = new JSONArray();
    this.jsonGroupArray = new JSONArray();
    this.responseBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      str = new String(this.responseBuffer);
      str.replace("&lt;", "<");
      str.replace("&gt;", ">");
      str.replace("&quot;", "\"\"");
      System.out.println("RESPONSE AFTER REPLACE*******" + str);
      if (!str.contains("ModelCode")) {
        this.rtmFW = true;
      }
    }
    catch (SAXException localSAXException1)
    {
      try
      {
        String str;
        Xml.parse(str, this);
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
    if (paramString2.equals("DeviceLists")) {
      this.processValue = true;
    }
    if (paramString3.equals("DeviceListType")) {
      this.deviceListType = true;
    }
    if (paramString3.equals("DeviceInfo"))
    {
      this.deviceInfo = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString3.equals("DeviceInfos")) {
      this.deviceInfos = true;
    }
    if (paramString3.equals("DeviceIndex")) {
      this.deviceIndex = true;
    }
    if (paramString3.equals("DeviceID"))
    {
      this.deviceId = true;
      this.deviceIdAvailablity = paramAttributes.getValue("available");
    }
    if (paramString3.equals("FriendlyName")) {
      this.friendlyName = true;
    }
    if (paramString3.equals("IconVersion")) {
      this.iconVersion = true;
    }
    if (paramString3.equals("FirmwareVersion")) {
      this.firmwareVersion = true;
    }
    if (paramString3.equals("CapabilityIDs")) {
      this.capabilityId = true;
    }
    if (paramString3.equals("CurrentState")) {
      this.currenState = true;
    }
    if (paramString3.equals("GroupInfo"))
    {
      this.groupInfo = true;
      this.jsonGroupObj = new JSONObject();
      this.jsonGroupArray = new JSONArray();
    }
    if (paramString3.equals("GroupID")) {
      this.groupId = true;
    }
    if (paramString3.equals("GroupName")) {
      this.groupName = true;
    }
    if (paramString3.equals("GroupCapabilityIDs")) {
      this.groupCapabilityId = true;
    }
    if (paramString3.equals("GroupCapabilityValues")) {
      this.groupCapabilityValues = true;
    }
    if (paramString3.equals("Manufacturer")) {
      this.manufacturerName = true;
    }
    if (paramString3.equals("ModelCode")) {
      this.modelCode = true;
    }
    if (paramString3.equals("productName")) {
      this.productName = true;
    }
    if (paramString3.equals("WeMoCertified")) {
      this.wemoCertified = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetEndDeviceListResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */