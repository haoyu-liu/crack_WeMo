package com.belkin.constant;

import java.util.EnumSet;
import java.util.Set;

public class DeviceListConstants
{
  public static enum Attributes
  {
    public static Set<Attributes> attributes = EnumSet.allOf(Attributes.class);
    private final String value;
    
    static
    {
      Attributes[] arrayOfAttributes = new Attributes[1];
      arrayOfAttributes[0] = ATTRIBUTELIST;
      $VALUES = arrayOfAttributes;
    }
    
    private Attributes(String paramString)
    {
      this.value = paramString;
    }
    
    public String getValue()
    {
      return this.value;
    }
  }
  
  public static enum Information
  {
    public static Set<Information> infos = EnumSet.allOf(Information.class);
    private final String value;
    
    static
    {
      TYPE = new Information("TYPE", 1, "Type");
      MAC = new Information("MAC", 2, "MAC");
      PLUGINID = new Information("PLUGINID", 3, "PluginID");
      HOMEID = new Information("HOMEID", 4, "HomeID");
      MODElCODE = new Information("MODElCODE", 5, "ModelCode");
      IP = new Information("IP", 6, "IP");
      PORT = new Information("PORT", 7, "Port");
      MANUFACTURER = new Information("MANUFACTURER", 8, "ManufacturerName");
      WEMOCERTIFIED = new Information("WEMOCERTIFIED", 9, "WemoCertified");
      BRIDGEUDN = new Information("BRIDGEUDN", 10, "BridgeUDN");
      PRODUCTTYPE = new Information("PRODUCTTYPE", 11, "ProductType");
      PRODUCTNAME = new Information("PRODUCTNAME", 12, "ProductName");
      HWVERSION = new Information("HWVERSION", 13, "HwVersion");
      SSID = new Information("SSID", 14, "SSID");
      PARENTNAME = new Information("PARENTNAME", 15, "ParentName");
      SERIALNUMBER = new Information("SERIALNUMBER", 16, "SerialNumber");
      Information[] arrayOfInformation = new Information[17];
      arrayOfInformation[0] = UDN;
      arrayOfInformation[1] = TYPE;
      arrayOfInformation[2] = MAC;
      arrayOfInformation[3] = PLUGINID;
      arrayOfInformation[4] = HOMEID;
      arrayOfInformation[5] = MODElCODE;
      arrayOfInformation[6] = IP;
      arrayOfInformation[7] = PORT;
      arrayOfInformation[8] = MANUFACTURER;
      arrayOfInformation[9] = WEMOCERTIFIED;
      arrayOfInformation[10] = BRIDGEUDN;
      arrayOfInformation[11] = PRODUCTTYPE;
      arrayOfInformation[12] = PRODUCTNAME;
      arrayOfInformation[13] = HWVERSION;
      arrayOfInformation[14] = SSID;
      arrayOfInformation[15] = PARENTNAME;
      arrayOfInformation[16] = SERIALNUMBER;
      $VALUES = arrayOfInformation;
    }
    
    private Information(String paramString)
    {
      this.value = paramString;
    }
    
    public String getValue()
    {
      return this.value;
    }
  }
  
  public static enum Properties
  {
    public static Set<Properties> properties = EnumSet.allOf(Properties.class);
    private final String value;
    
    static
    {
      FRIENDLYNAME = new Properties("FRIENDLYNAME", 1, "FriendlyName");
      FIRMWAREVERSION = new Properties("FIRMWAREVERSION", 2, "FirmwareVersion");
      STATE = new Properties("STATE", 3, "State");
      INACTIVE = new Properties("INACTIVE", 4, "InActive");
      CUSTOMIZEDSTATE = new Properties("CUSTOMIZEDSTATE", 5, "CustomizedState");
      DISCOVERYSTATE = new Properties("DISCOVERYSTATE", 6, "DiscoveryState");
      HIDE = new Properties("HIDE", 7, "Hide");
      ISDISCOVERED = new Properties("ISDISCOVERED", 8, "IsDiscovered");
      REMOTE = new Properties("REMOTE", 9, "IsRemote");
      STATUSTS = new Properties("STATUSTS", 10, "StatusTS");
      GROUPID = new Properties("GROUPID", 11, "GroupID");
      GROUPNAME = new Properties("GROUPNAME", 12, "GroupName");
      GROUPICON = new Properties("GROUPICON", 13, "GroupIcon");
      FWSTATUS = new Properties("FWSTATUS", 14, "FwStatus");
      ICONVERSION = new Properties("ICONVERSION", 15, "IconVersion");
      Properties[] arrayOfProperties = new Properties[16];
      arrayOfProperties[0] = ICON;
      arrayOfProperties[1] = FRIENDLYNAME;
      arrayOfProperties[2] = FIRMWAREVERSION;
      arrayOfProperties[3] = STATE;
      arrayOfProperties[4] = INACTIVE;
      arrayOfProperties[5] = CUSTOMIZEDSTATE;
      arrayOfProperties[6] = DISCOVERYSTATE;
      arrayOfProperties[7] = HIDE;
      arrayOfProperties[8] = ISDISCOVERED;
      arrayOfProperties[9] = REMOTE;
      arrayOfProperties[10] = STATUSTS;
      arrayOfProperties[11] = GROUPID;
      arrayOfProperties[12] = GROUPNAME;
      arrayOfProperties[13] = GROUPICON;
      arrayOfProperties[14] = FWSTATUS;
      arrayOfProperties[15] = ICONVERSION;
      $VALUES = arrayOfProperties;
    }
    
    private Properties(String paramString)
    {
      this.value = paramString;
    }
    
    public String getValue()
    {
      return this.value;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/constant/DeviceListConstants.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */