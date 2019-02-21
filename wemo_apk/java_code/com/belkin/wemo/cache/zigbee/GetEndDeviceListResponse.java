package com.belkin.wemo.cache.zigbee;

import android.text.TextUtils;
import android.util.Xml;
import android.util.Xml.Encoding;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import com.belkin.wemo.cache.utils.WemoUtils;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.commons.io.IOUtils;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetEndDeviceListResponse
  extends DefaultHandler
{
  private static String deviceListTyp;
  private boolean capabilityId = false;
  private boolean capabilityValue = false;
  private boolean currentState = false;
  DeviceInformation device;
  private boolean deviceId = false;
  private String deviceIdAvailablity;
  private boolean deviceIndex = false;
  private boolean deviceInfo = false;
  private boolean deviceInfos = false;
  private boolean deviceListType = false;
  private String deviceTypeBelkin = "Lightbulb";
  private String deviceTypeOSRAM = "OSRAM";
  private boolean firmwareVersion = false;
  private boolean friendlyName = false;
  private boolean groupCapabilityId = false;
  private boolean groupCapabilityValues = false;
  private boolean groupId = false;
  private boolean groupInfo = false;
  private boolean groupName = false;
  DeviceInformation groupedDevice;
  private boolean iconVersion = false;
  private boolean isGroupAction = false;
  private boolean lastEventTimeStamp = false;
  private boolean manufacturerName = false;
  private boolean modelCode = false;
  private boolean processValue = false;
  private boolean productName = false;
  private boolean productType = false;
  private StringBuffer responseBuffer;
  private boolean rtmFW = false;
  private String tempVal;
  private boolean wemoCertified = false;
  ZigBeeDevice zigBeeDevice;
  private HashMap<String, DeviceInformation> zigBeeDeviceList = null;
  private ArrayList<ZigBeeDevice> zigBeeDevices;
  ZigBeeDevice zigBeeGroupInfo;
  
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
    for (;;)
    {
      try
      {
        if ((this.deviceIdAvailablity != null) && (!this.deviceIdAvailablity.isEmpty())) {
          this.device.setDeviceIdAvailablity(this.deviceIdAvailablity);
        }
        if (this.groupInfo)
        {
          if (this.deviceIndex) {
            this.device.setDeviceIndex(this.tempVal);
          }
          if (this.deviceListType)
          {
            this.device.setDeviceListType(this.tempVal);
            deviceListTyp = this.tempVal;
          }
          if (this.productType) {
            this.device.setProductType(StringUtils.toLowerCamelCase(this.tempVal));
          }
          if (this.productName) {
            this.device.setProductName(StringUtils.toLowerCamelCase(this.tempVal));
          }
          if (this.deviceId)
          {
            this.device.setDeviceId(this.tempVal);
            this.device.setUDN(this.tempVal);
            this.device.setMAC(this.tempVal);
          }
          if (this.friendlyName) {
            this.device.setFriendlyName(this.tempVal);
          }
          if (this.iconVersion) {
            this.device.setIconVersion(this.tempVal);
          }
          if (this.firmwareVersion) {
            this.device.setFirmwareVersion(this.tempVal);
          }
          if (this.capabilityId) {
            this.device.setCapabilityID(this.tempVal);
          }
          if (this.capabilityValue) {
            this.device.setCapabilityvalue(this.tempVal);
          }
          if (this.lastEventTimeStamp) {
            this.device.setLastEventTimeStamp(Integer.parseInt(this.tempVal));
          }
          if (this.isGroupAction) {
            this.device.setIsGroupAction(this.tempVal);
          }
          if ((this.currentState) || (this.capabilityValue))
          {
            this.device.setCurrentState(this.tempVal);
            this.device.setDeviceListType(deviceListTyp);
            this.device.setGroupID(this.groupedDevice.getGroupID());
            this.device.setGroupName(this.groupedDevice.getGroupName());
            if (!TextUtils.isEmpty(this.device.getUDN()))
            {
              this.zigBeeDeviceList.put(this.device.getUDN(), this.device);
              this.groupedDevice.addLEDInGrp(this.device);
            }
          }
          if (this.manufacturerName) {
            this.device.setManufacturerName(this.tempVal);
          }
          if (this.modelCode) {
            this.device.setModelCode(this.tempVal);
          }
          if (this.wemoCertified)
          {
            WemoUtils.getZigbeeIcon(this.device.getManufacturerName(), this.device.getModelCode());
            this.device.setWemoCertified(this.tempVal);
          }
          if (this.groupId) {
            this.groupedDevice.setGroupID(this.tempVal);
          }
          if (this.groupName) {
            this.groupedDevice.setGroupName(this.tempVal);
          }
          if (this.groupCapabilityId) {
            this.groupedDevice.setGroupCapabilityID(this.tempVal);
          }
          if (!this.groupCapabilityValues) {
            break;
          }
          this.groupedDevice.setGroupCapabilities(this.tempVal);
          return;
        }
        if (this.deviceIndex) {
          this.device.setDeviceIndex(this.tempVal);
        }
        if (this.deviceListType) {
          deviceListTyp = this.tempVal;
        }
        if (this.productType) {
          this.device.setProductType(StringUtils.toLowerCamelCase(this.tempVal));
        }
        if (this.productName) {
          this.device.setProductName(StringUtils.toLowerCamelCase(this.tempVal));
        }
        if (this.deviceId)
        {
          this.device.setDeviceId(this.tempVal);
          this.device.setUDN(this.tempVal);
          this.device.setMAC(this.tempVal);
        }
        if (this.iconVersion) {
          this.device.setIconVersion(this.tempVal);
        }
        if (this.firmwareVersion) {
          this.device.setFirmwareVersion(this.tempVal);
        }
        if (this.capabilityId) {
          this.device.setCapabilityID(this.tempVal);
        }
        if (this.capabilityValue) {
          this.device.setCapabilityvalue(this.tempVal);
        }
        if (this.lastEventTimeStamp)
        {
          this.device.setLastEventTimeStamp(Integer.parseInt(this.tempVal));
          this.device.setStatusTS(Integer.parseInt(this.tempVal));
        }
        if (this.isGroupAction) {
          this.device.setIsGroupAction(this.tempVal);
        }
        if (this.manufacturerName) {
          this.device.setManufacturerName(this.tempVal);
        }
        if (this.modelCode) {
          this.device.setModelCode(this.tempVal);
        }
        if (this.wemoCertified)
        {
          this.device.setWemoCertified(this.tempVal);
          this.device.setDeviceListType(deviceListTyp);
          if (!this.device.getProductType().isEmpty()) {
            break label1364;
          }
          SDKLogUtils.infoLog("ZigbeeScan", "ProductType is empty ");
          this.device.setProductType(StringUtils.toLowerCamelCase((String)DevicesArray.productTypeMapping.get(this.device.getModelCode())));
          if (this.device.getProductName().isEmpty()) {
            this.device.setProductName(StringUtils.toLowerCamelCase((String)DevicesArray.productNameMapping.get(this.device.getModelCode())));
          }
          SDKLogUtils.infoLog("DeviceListController", "adding device: " + this.device.toString());
          if (this.zigBeeDeviceList == null) {
            this.zigBeeDeviceList = new HashMap();
          }
          if ((!this.rtmFW) && (!TextUtils.isEmpty(this.device.getUDN()))) {
            this.zigBeeDeviceList.put(this.device.getUDN(), this.device);
          }
        }
        if ((this.currentState) || (this.capabilityValue))
        {
          this.device.setCurrentState(this.tempVal);
          if (this.rtmFW)
          {
            SDKLogUtils.infoLog("ZigbeeScan", "it is RTM fw");
            if (!this.device.getFriendlyName().contains(this.deviceTypeBelkin)) {
              break label1399;
            }
            SDKLogUtils.infoLog("ZigbeeScan", "device type belkin");
            this.device.setModelCode("MZ100");
            this.device.setManufacturerName("MRVL");
            this.device.setWemoCertified("YES");
            if (this.device.getProductType().isEmpty()) {
              this.device.setProductType(StringUtils.toLowerCamelCase((String)DevicesArray.productTypeMapping.get(this.device.getModelCode())));
            }
            if (this.device.getProductName().isEmpty()) {
              this.device.setProductName(StringUtils.toLowerCamelCase((String)DevicesArray.productNameMapping.get(this.device.getModelCode())));
            }
            if (this.zigBeeDeviceList == null) {
              this.zigBeeDeviceList = new HashMap();
            }
            if (!TextUtils.isEmpty(this.device.getUDN())) {
              this.zigBeeDeviceList.put(this.device.getUDN(), this.device);
            }
          }
        }
        if (!this.friendlyName) {
          break;
        }
        this.device.setFriendlyName(this.tempVal);
        this.device.setDeviceListType(deviceListTyp);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
      label1364:
      SDKLogUtils.infoLog("ZigbeeScan", "ProductType is  " + this.device.getProductType());
      continue;
      label1399:
      if (this.device.getFriendlyName().contains(this.deviceTypeOSRAM))
      {
        SDKLogUtils.infoLog("ZigbeeScan", "device type OSRAM");
        this.device.setModelCode("iQBR30");
        this.device.setManufacturerName("OSRAM SYLVANIA");
        this.device.setWemoCertified("NO");
      }
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
    if (paramString3.equals("CapabilityValue")) {
      this.capabilityValue = false;
    }
    if (paramString3.equals("LastEventTimeStamp")) {
      this.lastEventTimeStamp = false;
    }
    if (paramString3.equals("IsGroupAction")) {
      this.isGroupAction = false;
    }
    if (paramString3.equals("CurrentState")) {
      this.currentState = false;
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
    if (paramString3.equals("productType")) {
      this.productType = false;
    }
    if (paramString3.equals("WeMoCertified")) {
      this.wemoCertified = false;
    }
    if (paramString3.equals("GroupInfo"))
    {
      if ((this.groupedDevice != null) && (!TextUtils.isEmpty(this.groupedDevice.getUDN()))) {
        this.zigBeeDeviceList.put(this.groupedDevice.getUDN(), this.groupedDevice);
      }
      this.groupInfo = false;
    }
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
  }
  
  public ArrayList<ZigBeeDevice> parseForGetEndDeviceList(String paramString)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "in parseForGetEndDeviceList:");
    this.zigBeeDevice = new ZigBeeDevice();
    this.zigBeeGroupInfo = new ZigBeeDevice();
    if (this.zigBeeDevices == null) {
      this.zigBeeDevices = new ArrayList();
    }
    this.responseBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      str = new String(this.responseBuffer);
      if (!str.trim().equals("0"))
      {
        str.replace("&lt;", "<");
        str.replace("&gt;", ">");
        str.replace("&quot;", "\"\"");
      }
    }
    catch (SAXException localSAXException1)
    {
      try
      {
        String str;
        Xml.parse(str, this);
        SDKLogUtils.infoLog("ZigbeeScan", "xml after 2nd parse:" + str);
        SDKLogUtils.infoLog("ZigbeeScan", "zigbee Devices size:" + this.zigBeeDevices.size());
        return this.zigBeeDevices;
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
  
  public HashMap<String, DeviceInformation> parseGetEndDeviceList(String paramString, DeviceInformation paramDeviceInformation)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "parseGetEndDeviceList");
    if (paramDeviceInformation == null)
    {
      SDKLogUtils.infoLog("ZigbeeScan", "Discovery Zigbee: parseGetEndDeviceList(): New device.");
      this.device = new DeviceInformation();
    }
    for (;;)
    {
      this.groupedDevice = new DeviceInformation();
      this.zigBeeDeviceList = new HashMap();
      this.responseBuffer = new StringBuffer();
      try
      {
        Xml.parse(paramString, this);
        str = new String(this.responseBuffer);
        if (!str.contains("ModelCode"))
        {
          SDKLogUtils.infoLog("ZigbeeScan", "it is RTM fw");
          this.rtmFW = true;
        }
        if (!str.trim().equals("0"))
        {
          str.replace("&lt;", "<");
          str.replace("&gt;", ">");
          str.replace("&quot;", "\"\"");
        }
      }
      catch (SAXException localSAXException1)
      {
        try
        {
          String str;
          Xml.parse(str, this);
          SDKLogUtils.infoLog("ZigbeeScan", "xml after 2nd parse:" + str);
          SDKLogUtils.infoLog("ZigbeeScan", "zigbee Devices size:" + this.zigBeeDeviceList.size());
          return this.zigBeeDeviceList;
          SDKLogUtils.infoLog("ZigbeeScan", "Discovery Zigbee: parseGetEndDeviceList(): Existing device. Exiting Icon: " + paramDeviceInformation.getIcon() + "; Existing groupIcon: " + paramDeviceInformation.getGroupIcon());
          this.device = paramDeviceInformation;
          continue;
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
  }
  
  public HashMap<String, DeviceInformation> parseGetEndDeviceListWithStatus(String paramString, DeviceInformation paramDeviceInformation)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "Unification: parseGetEndDeviceListWithStatus");
    if (paramDeviceInformation == null)
    {
      SDKLogUtils.infoLog("ZigbeeScan", "Discovery Zigbee: parseGetEndDeviceListWithStatus(): New device.");
      this.device = new DeviceInformation();
    }
    for (;;)
    {
      this.groupedDevice = new DeviceInformation();
      this.zigBeeDeviceList = new HashMap();
      this.responseBuffer = new StringBuffer();
      SDKLogUtils.infoLog("ZigbeeScan", "Unification: xml response received: " + paramString);
      try
      {
        Xml.parse(paramString, this);
        str = new String(this.responseBuffer);
        if (!str.contains("ModelCode"))
        {
          SDKLogUtils.infoLog("ZigbeeScan", " it is RTM fw");
          this.rtmFW = true;
        }
        if (!str.trim().equals("0"))
        {
          str.replace("&lt;", "<");
          str.replace("&gt;", ">");
          str.replace("&quot;", "\"\"");
          SDKLogUtils.infoLog("ZigbeeScan", "Unification: xml parsed response received: " + str);
        }
      }
      catch (SAXException localSAXException1)
      {
        try
        {
          String str;
          InputSource localInputSource = new InputSource();
          localInputSource.setEncoding("ISO-8859-1");
          localInputSource.setCharacterStream(new StringReader(str));
          Xml.parse(IOUtils.toInputStream(str, Xml.Encoding.ISO_8859_1.toString()), Xml.Encoding.ISO_8859_1, this);
          SDKLogUtils.infoLog("ZigbeeScan", "Unification: xml after 2nd parse:" + str);
          SDKLogUtils.infoLog("ZigbeeScan", "Unification: zigbee Devices size:" + this.zigBeeDeviceList.size());
          return this.zigBeeDeviceList;
          SDKLogUtils.infoLog("ZigbeeScan", "Discovery Zigbee: parseGetEndDeviceListWithStatus(): Existing device.");
          this.device = paramDeviceInformation;
          continue;
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
        catch (IOException localIOException)
        {
          for (;;)
          {
            localIOException.printStackTrace();
          }
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
      this.device = new DeviceInformation();
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
    if (paramString3.equals("CapabilityValue")) {
      this.capabilityValue = true;
    }
    if (paramString3.equals("LastEventTimeStamp")) {
      this.lastEventTimeStamp = true;
    }
    if (paramString3.equals("IsGroupAction")) {
      this.isGroupAction = true;
    }
    if (paramString3.equals("CurrentState")) {
      this.currentState = true;
    }
    if (paramString3.equals("GroupInfo"))
    {
      this.groupInfo = true;
      this.groupedDevice = new DeviceInformation();
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
    if (paramString3.equals("WeMoCertified")) {
      this.wemoCertified = true;
    }
    if (paramString3.equals("productType")) {
      this.productType = true;
    }
    if (paramString3.equals("productName")) {
      this.productName = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/GetEndDeviceListResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */