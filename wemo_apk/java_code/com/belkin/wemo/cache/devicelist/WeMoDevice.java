package com.belkin.wemo.cache.devicelist;

import android.util.Log;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.NetworkMode;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.cybergarage.upnp.Device;
import org.json.JSONObject;

public class WeMoDevice
{
  public static final String AIR_PURIFIER;
  public static final String BRIDGE;
  public static final String COFFEE_MAKER;
  public static final String DEFAULT = "urn:Belkin:device:socket:1";
  public static final String HEATER;
  public static final String HEATERA;
  public static final String HEATERB;
  public static final String HUMIDIFIER;
  public static final String HUMIDIFIERB;
  public static final String INSIGHT;
  public static final String LIGHT_SWITCH;
  public static final String LINK_CAM;
  public static final String MAKER;
  public static final String NET_CAM;
  public static final String SENSOR;
  public static final String SLOW_COOKER;
  public static final String SWITCH;
  public static final String WEMO_DEVICE_NOTIFY_TYPE = "-1";
  public static final String WEMO_DEVICE_OFF = "0";
  public static final String WEMO_DEVICE_ON = "1";
  public static final String WEMO_DEVICE_STAND_BY = "8";
  public static final String WEMO_DEVICE_UNDEFINED = "-1";
  private String checkingStatus;
  private long endDiscoveryTime = 0L;
  private String foundTime = "";
  private int idDB;
  private int inActive = 0;
  private String info = "";
  private boolean isDiscovered = false;
  private String lastTimestamp = "";
  private String mAttributelist = "";
  private String mBlobStorage = "";
  private String mBrandName = "";
  private String mCountdown = "";
  private String mCustomizedState = null;
  private Device mDevice;
  private String mDiscoveryState = "";
  private int mFWstatus = 0;
  private String mFirmwareVersion = null;
  private String mFriendlyName = "";
  private String mHwVersion = "";
  private boolean mIsAvailable = false;
  private String mLogo = "";
  private String mLogoURL = "";
  private String mModelName = "";
  private String mNotifyType = "-1";
  private String mProductName = "";
  private String mSerialNumber = "";
  private String mState = "-1";
  private String mType = "";
  private String mUDN = "";
  private String mac = null;
  private String pluginID = null;
  private long startDiscoveryTime = 0L;
  private String timestamp = "";
  private String whichDiscovered = "";
  private String whichFound = "";
  
  static
  {
    String str1;
    String str2;
    label22:
    String str3;
    label35:
    String str4;
    label48:
    String str5;
    label62:
    String str6;
    label77:
    String str7;
    label92:
    String str8;
    label107:
    String str9;
    label122:
    String str10;
    label137:
    String str11;
    label152:
    String str12;
    label167:
    String str13;
    label182:
    String str14;
    label197:
    String str15;
    if (NetworkMode.isLocal())
    {
      str1 = "urn:Belkin:device:bridge:1";
      BRIDGE = str1;
      if (!NetworkMode.isLocal()) {
        break label239;
      }
      str2 = "urn:Belkin:device:controllee:1";
      SWITCH = str2;
      if (!NetworkMode.isLocal()) {
        break label245;
      }
      str3 = "urn:Belkin:device:sensor:1";
      SENSOR = str3;
      if (!NetworkMode.isLocal()) {
        break label251;
      }
      str4 = "urn:Belkin:device:lightswitch:1";
      LIGHT_SWITCH = str4;
      if (!NetworkMode.isLocal()) {
        break label257;
      }
      str5 = "urn:Belkin:device:insight:1";
      INSIGHT = str5;
      if (!NetworkMode.isLocal()) {
        break label264;
      }
      str6 = "urn:Belkin:device:NetCamSensor:1";
      NET_CAM = str6;
      if (!NetworkMode.isLocal()) {
        break label271;
      }
      str7 = "urn:Belkin:device:LinksysWNCSensor:1";
      LINK_CAM = str7;
      if (!NetworkMode.isLocal()) {
        break label278;
      }
      str8 = "urn:Belkin:device:CoffeeMaker:1";
      COFFEE_MAKER = str8;
      if (!NetworkMode.isLocal()) {
        break label285;
      }
      str9 = "urn:Belkin:device:Crockpot:1";
      SLOW_COOKER = str9;
      if (!NetworkMode.isLocal()) {
        break label292;
      }
      str10 = "urn:Belkin:device:AirPurifier:1";
      AIR_PURIFIER = str10;
      if (!NetworkMode.isLocal()) {
        break label299;
      }
      str11 = "urn:Belkin:device:Heater:1";
      HEATER = str11;
      if (!NetworkMode.isLocal()) {
        break label306;
      }
      str12 = "urn:Belkin:device:HeaterA:1";
      HEATERA = str12;
      if (!NetworkMode.isLocal()) {
        break label313;
      }
      str13 = "urn:Belkin:device:HeaterB:1";
      HEATERB = str13;
      if (!NetworkMode.isLocal()) {
        break label320;
      }
      str14 = "urn:Belkin:device:Maker:1";
      MAKER = str14;
      if (!NetworkMode.isLocal()) {
        break label327;
      }
      str15 = "urn:Belkin:device:Humidifier:1";
      label212:
      HUMIDIFIER = str15;
      if (!NetworkMode.isLocal()) {
        break label334;
      }
    }
    label239:
    label245:
    label251:
    label257:
    label264:
    label271:
    label278:
    label285:
    label292:
    label299:
    label306:
    label313:
    label320:
    label327:
    label334:
    for (String str16 = "urn:Belkin:device:HumidifierB:1";; str16 = "HumidifierB")
    {
      HUMIDIFIERB = str16;
      return;
      str1 = "LED";
      break;
      str2 = "Socket";
      break label22;
      str3 = "Sensor";
      break label35;
      str4 = "Lightswitch";
      break label48;
      str5 = "Insight";
      break label62;
      str6 = "NetCam";
      break label77;
      str7 = "LinkCam";
      break label92;
      str8 = "CoffeeMaker";
      break label107;
      str9 = "Crockpot";
      break label122;
      str10 = "AirPurifier";
      break label137;
      str11 = "Heater";
      break label152;
      str12 = "HeaterA";
      break label167;
      str13 = "HeaterB";
      break label182;
      str14 = "Maker";
      break label197;
      str15 = "Humidifier";
      break label212;
    }
  }
  
  public WeMoDevice(DeviceInformation paramDeviceInformation)
  {
    if (paramDeviceInformation == null) {
      throw new IllegalArgumentException();
    }
    this.mUDN = paramDeviceInformation.getUDN();
    Log.v("WeMoDevice", "constructor deviceinformation mUDN: " + this.mUDN);
    this.mType = paramDeviceInformation.getType();
    this.mFriendlyName = paramDeviceInformation.getFriendlyName();
    this.mSerialNumber = paramDeviceInformation.getMAC();
    this.mIsAvailable = paramDeviceInformation.getIsDiscovered();
    this.mHwVersion = paramDeviceInformation.getHwVersion();
    this.mModelName = paramDeviceInformation.getModelCode();
    try
    {
      this.mState = Integer.valueOf(paramDeviceInformation.getState()).toString();
      this.mDiscoveryState = "Loaded from cache";
      this.info = paramDeviceInformation.getInfo();
      this.mAttributelist = paramDeviceInformation.getAttributeList().toString();
      this.mLogoURL = paramDeviceInformation.getIcon();
      this.mFirmwareVersion = paramDeviceInformation.getFirmwareVersion();
      this.mCustomizedState = paramDeviceInformation.getCustomizedState();
      this.mac = paramDeviceInformation.getMAC();
      this.pluginID = paramDeviceInformation.getPluginID();
      this.mFriendlyName = paramDeviceInformation.getFriendlyName();
      String str;
      if (IsDevice.NetCam(this.mUDN))
      {
        str = this.mFriendlyName;
        if (str.lastIndexOf(';') <= 0) {
          break label420;
        }
        str = str.substring(0, str.lastIndexOf(';'));
      }
      for (;;)
      {
        this.mFriendlyName = str;
        return;
        label420:
        if (str.lastIndexOf(',') > 0) {
          str = str.substring(0, str.lastIndexOf(','));
        }
      }
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  WeMoDevice(Device paramDevice)
  {
    if (paramDevice == null) {
      throw new IllegalArgumentException();
    }
    this.mDevice = paramDevice;
    setParametersFromDevice();
    Log.v("WeMoDevice", "constructor device mUDN: " + this.mUDN);
  }
  
  private void setParametersFromDevice()
  {
    this.mType = this.mDevice.getDeviceType();
    this.mFriendlyName = this.mDevice.getFriendlyName();
    this.mUDN = this.mDevice.getUDN();
    this.mSerialNumber = this.mDevice.getSerialNumber();
    this.mModelName = this.mDevice.getModelName();
    this.mac = this.mDevice.getMacAddress();
    this.mBrandName = this.mDevice.getBrandName();
    JSONObject localJSONObject = this.mDevice.getAttributeListParameterFromDevice();
    if (localJSONObject != null) {
      this.mAttributelist = localJSONObject.toString();
    }
  }
  
  public String getAttributeList()
  {
    return this.mAttributelist;
  }
  
  public String getBlobStorage()
  {
    return this.mBlobStorage;
  }
  
  public String getBrandName()
  {
    return this.mBrandName;
  }
  
  public String getCheckingStatus()
  {
    if (this.checkingStatus == null) {
      this.checkingStatus = "First time discovered";
    }
    return this.checkingStatus;
  }
  
  public String getCountdownEndTime()
  {
    return this.mCountdown;
  }
  
  public String getCustomizedState()
  {
    return this.mCustomizedState;
  }
  
  public Device getDevice()
  {
    return this.mDevice;
  }
  
  public int getDeviceIdDB()
  {
    return this.idDB;
  }
  
  public String getDiscoveryState()
  {
    return this.mDiscoveryState;
  }
  
  public long getDiscoveryTime()
  {
    return this.endDiscoveryTime - this.startDiscoveryTime;
  }
  
  public String getDiscoveryTimeString()
  {
    if ((this.startDiscoveryTime > 0L) && (this.endDiscoveryTime > 0L) && (this.endDiscoveryTime > this.startDiscoveryTime))
    {
      int i = (int)getDiscoveryTime() / 1000;
      String str = String.valueOf((int)getDiscoveryTime() % 1000);
      if (str.length() > 3) {
        str = str.substring(0, 2);
      }
      if (i > 0) {
        return i + ":" + str;
      }
      return "0:" + str;
    }
    return "";
  }
  
  public long getEndDiscoveryTime()
  {
    return this.endDiscoveryTime;
  }
  
  public int getFWstatus()
  {
    return this.mFWstatus;
  }
  
  public String getFirmwareVersion()
  {
    return this.mFirmwareVersion;
  }
  
  public String getFoundTime()
  {
    return this.foundTime;
  }
  
  public String getFriendlyName()
  {
    return this.mFriendlyName;
  }
  
  public String getHwVersion()
  {
    return this.mHwVersion;
  }
  
  public int getInActive()
  {
    return this.inActive;
  }
  
  public String getInfo()
  {
    return this.info;
  }
  
  public boolean getIsDiscovered()
  {
    return this.isDiscovered;
  }
  
  public String getLastTimestamp()
  {
    return this.lastTimestamp;
  }
  
  public String getLogo()
  {
    return this.mLogo;
  }
  
  public String getLogoURL()
  {
    return this.mLogoURL;
  }
  
  public String getMac()
  {
    return this.mac;
  }
  
  public String getModelName()
  {
    return this.mModelName;
  }
  
  public String getNotifyType()
  {
    return this.mNotifyType;
  }
  
  public String getPluginID()
  {
    return this.pluginID;
  }
  
  public String getProductName()
  {
    return this.mProductName;
  }
  
  public String getSerialNumber()
  {
    return this.mSerialNumber;
  }
  
  public long getStartDiscoveryTime()
  {
    return this.startDiscoveryTime;
  }
  
  public String getState()
  {
    return this.mState.split("\\|.")[0];
  }
  
  public String getTimestamp()
  {
    return this.timestamp;
  }
  
  public String getType()
  {
    return this.mType;
  }
  
  public String getUDN()
  {
    return this.mUDN;
  }
  
  public String getWhichDiscovered()
  {
    return this.whichDiscovered;
  }
  
  public String getWhichFound()
  {
    return this.whichFound;
  }
  
  public boolean isAvailable()
  {
    if (this.inActive == 0) {}
    for (this.mIsAvailable = true;; this.mIsAvailable = false) {
      return this.mIsAvailable;
    }
  }
  
  public void setAttributeList(String paramString)
  {
    this.mAttributelist = paramString;
  }
  
  void setAvailability(boolean paramBoolean)
  {
    this.mIsAvailable = paramBoolean;
  }
  
  void setBlobStorage(String paramString)
  {
    this.mBlobStorage = paramString;
  }
  
  public void setBrandName(String paramString)
  {
    this.mBrandName = paramString;
  }
  
  public void setCheckingStatus(String paramString)
  {
    this.checkingStatus = paramString;
  }
  
  public void setCountdownEndTime(String paramString)
  {
    this.mCountdown = paramString;
  }
  
  void setCustomizedState(String paramString)
  {
    this.mCustomizedState = paramString;
  }
  
  public void setDevice(Device paramDevice)
  {
    if ((paramDevice == null) || (paramDevice.getLocation() == null) || (paramDevice.getLocation().length() == 0)) {}
    do
    {
      return;
      Log.v("WeMoDevice", "setDevice device: " + paramDevice + " location: " + paramDevice.getLocation() + " udn: " + this.mUDN + " len: " + paramDevice.getLocation().length());
    } while ((paramDevice.getLocation() == null) || (paramDevice.getLocation().length() == 0));
    this.mDevice = paramDevice;
    setParametersFromDevice();
  }
  
  public void setDeviceIdDB(int paramInt)
  {
    this.idDB = paramInt;
  }
  
  public void setDiscoveryState(String paramString)
  {
    if (((paramString.equals("Discovery Success")) || (paramString.equals("Loaded from cloud"))) && ((paramString == null) || (paramString.equals("Loaded from cache"))))
    {
      this.foundTime = getDiscoveryTimeString();
      this.whichFound = this.whichDiscovered;
    }
    this.mDiscoveryState = paramString;
  }
  
  public void setEndDiscoveryTime(long paramLong)
  {
    this.endDiscoveryTime = paramLong;
  }
  
  public void setFWstatus(int paramInt)
  {
    this.mFWstatus = paramInt;
  }
  
  void setFirmwareVersion(String paramString)
  {
    this.mFirmwareVersion = paramString;
  }
  
  public void setFoundTime(String paramString)
  {
    this.foundTime = paramString;
  }
  
  public void setFriendlyName(String paramString)
  {
    this.mFriendlyName = paramString;
  }
  
  public void setHwVersion(String paramString)
  {
    this.mHwVersion = paramString;
  }
  
  public void setInActive(int paramInt)
  {
    this.inActive = paramInt;
  }
  
  public void setInfo(String paramString)
  {
    this.info = paramString;
  }
  
  public void setIsDiscovered(boolean paramBoolean)
  {
    this.isDiscovered = paramBoolean;
  }
  
  public void setLastTimestamp(String paramString)
  {
    this.lastTimestamp = paramString;
  }
  
  void setLogo(String paramString)
  {
    this.mLogo = paramString;
  }
  
  public void setLogoURL(String paramString)
  {
    this.mLogoURL = paramString;
  }
  
  public void setMac(String paramString)
  {
    this.mac = paramString;
  }
  
  public void setModelName(String paramString)
  {
    this.mModelName = paramString;
  }
  
  void setNotifyType(String paramString)
  {
    this.mNotifyType = paramString;
  }
  
  public void setPluginID(String paramString)
  {
    this.pluginID = paramString;
  }
  
  public void setProductName(String paramString)
  {
    this.mProductName = paramString;
  }
  
  public void setSerialNumber(String paramString)
  {
    this.mSerialNumber = paramString;
  }
  
  public void setStartDiscoveryTime(long paramLong)
  {
    this.startDiscoveryTime = paramLong;
  }
  
  void setState(String paramString)
  {
    this.mState = paramString;
  }
  
  public void setTimestamp()
  {
    this.timestamp = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date());
  }
  
  public void setType(String paramString)
  {
    this.mType = paramString;
  }
  
  public void setUDN(String paramString)
  {
    this.mUDN = paramString;
  }
  
  public void setWhichDiscovered(String paramString)
  {
    this.whichDiscovered = paramString;
  }
  
  public void setWhichFound(String paramString)
  {
    this.whichFound = paramString;
  }
  
  public String toString()
  {
    return "udn: " + this.mUDN + " " + "type: " + this.mType + " " + "name: " + this.mFriendlyName + " " + "icon: " + this.mLogo + " " + "state: " + this.mState + " " + "maker: " + this.mAttributelist + " " + "inActive: " + this.inActive + " " + "modelName: " + this.mModelName + " " + "customized: " + this.mCustomizedState + " " + "fwVersion: " + this.mFirmwareVersion + " " + "info: " + this.info + "mIsAvailable: " + this.mIsAvailable + " " + "fwStatus: " + this.mFWstatus + " " + "mac: " + this.mac + " " + "pluginID" + this.pluginID + " ";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/WeMoDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */