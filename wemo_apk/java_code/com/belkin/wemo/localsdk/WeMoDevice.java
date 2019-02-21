package com.belkin.wemo.localsdk;

import com.belkin.wemo.cache.data.DeviceInformation;
import org.cybergarage.upnp.Device;

public class WeMoDevice
{
  public static final String AIR_PURIFIER = "urn:Belkin:device:AirPurifier:1";
  public static final String DEFAULT = "urn:Belkin:device:socket:1";
  public static final String HEATERA = "urn:Belkin:device:HeaterA:1";
  public static final String HEATERB = "urn:Belkin:device:HeaterB:1";
  public static final String HUMIDIFIER = "urn:Belkin:device:Humidifier:1";
  public static final String HUMIDIFIERB = "urn:Belkin:device:HumidifierB:1";
  public static final String INSIGHT = "urn:Belkin:device:insight:1";
  public static final String LIGHT_SWITCH = "urn:Belkin:device:lightswitch:1";
  public static final String LINK_CAM = "urn:Belkin:device:LinksysWNCSensor:1";
  public static final String MAKER = "urn:Belkin:device:Maker:1";
  public static final String NET_CAM = "urn:Belkin:device:NetCamSensor:1";
  public static final String SENSOR = "urn:Belkin:device:sensor:1";
  public static final String SWITCH = "urn:Belkin:device:controllee:1";
  public static final String WEMO_DEVICE_NOTIFY_TYPE = "-1";
  public static final String WEMO_DEVICE_OFF = "0";
  public static final String WEMO_DEVICE_ON = "1";
  public static final String WEMO_DEVICE_STAND_BY = "8";
  public static final String WEMO_DEVICE_UNDEFINED = "-1";
  private String mAttributelist = "";
  private String mBlobStorage = "";
  private String mCountdown = "";
  private String mCustomizedState = null;
  private Device mDevice;
  private String mFirmwareVersion = null;
  private String mHwVersion = "";
  private boolean mIsAvailable = false;
  private boolean mIsSubscribed = false;
  private String mLogo = "";
  private String mLogoURL = "";
  private String mMacAddress = "";
  private String mNotifyType = "-1";
  private String mProductName = "";
  private String mState = "-1";
  
  WeMoDevice()
  {
    throw new IllegalArgumentException();
  }
  
  WeMoDevice(Device paramDevice)
  {
    if (paramDevice == null) {
      throw new IllegalArgumentException();
    }
    this.mDevice = paramDevice;
  }
  
  public static boolean isValid(String paramString)
  {
    return (paramString.contains("Controlee")) || (paramString.contains("Socket")) || (paramString.contains("Sensor")) || (paramString.contains("Lightswitch")) || (paramString.contains("NetCamSensor")) || (paramString.contains("LinksysWNCSensor")) || (paramString.contains("Insight")) || (paramString.contains("Bridge")) || (paramString.contains("Coffee")) || (paramString.contains("Crockpot")) || (paramString.contains("Maker")) || (paramString.contains("Heater")) || (paramString.contains("Purifier")) || (paramString.contains("Humidifier"));
  }
  
  public String getAttribute()
  {
    return this.mAttributelist;
  }
  
  public String getBlobStorage()
  {
    return this.mBlobStorage;
  }
  
  public String getBrandName()
  {
    return this.mDevice.getBrandName();
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
  
  public DeviceInformation getDeviceInformation()
  {
    return new DeviceInformation(getUDN(), getType(), getFriendlyName(), getLogoURL(), Integer.parseInt(getState()), "", 0, getModelName(), getCustomizedState(), getFirmwareVersion(), "", "0", "0", 0);
  }
  
  public String getFirmwareVersion()
  {
    return this.mFirmwareVersion;
  }
  
  public String getFriendlyName()
  {
    return this.mDevice.getFriendlyName();
  }
  
  public String getHwVersion()
  {
    return this.mHwVersion;
  }
  
  public String getLogo()
  {
    return this.mLogo;
  }
  
  public String getLogoURL()
  {
    return this.mLogoURL;
  }
  
  public String getMacAddress()
  {
    return this.mMacAddress;
  }
  
  public String getModelName()
  {
    return this.mDevice.getModelName();
  }
  
  public String getNotifyType()
  {
    return this.mNotifyType;
  }
  
  public String getProductName()
  {
    return this.mProductName;
  }
  
  public String getSerialNumber()
  {
    return this.mDevice.getSerialNumber();
  }
  
  public String getState()
  {
    return this.mState;
  }
  
  public String getType()
  {
    return this.mDevice.getDeviceType();
  }
  
  public String getUDN()
  {
    return this.mDevice.getUDN();
  }
  
  public boolean isAvailable()
  {
    return this.mIsAvailable;
  }
  
  public boolean isSubscribed()
  {
    return this.mIsSubscribed;
  }
  
  void setAttribute(String paramString)
  {
    this.mAttributelist = paramString;
  }
  
  void setAvailability(boolean paramBoolean)
  {
    this.mIsAvailable = paramBoolean;
    this.mDevice.setAvailable(paramBoolean);
  }
  
  void setBlobStrage(String paramString)
  {
    this.mBlobStorage = paramString;
  }
  
  public void setBrandName(String paramString)
  {
    this.mDevice.setBrandName(paramString);
  }
  
  public void setCountdownEndTime(String paramString)
  {
    this.mCountdown = paramString;
  }
  
  void setCustomizedState(String paramString)
  {
    this.mCustomizedState = paramString;
  }
  
  void setFirmwareVersion(String paramString)
  {
    this.mFirmwareVersion = paramString;
  }
  
  public void setHwVersion(String paramString)
  {
    this.mHwVersion = paramString;
  }
  
  void setLogo(String paramString)
  {
    this.mLogo = paramString;
  }
  
  void setLogoURL(String paramString)
  {
    this.mLogoURL = paramString;
  }
  
  public void setMacAddress(String paramString)
  {
    this.mMacAddress = paramString;
  }
  
  void setNotifyType(String paramString)
  {
    this.mNotifyType = paramString;
  }
  
  public void setProductName(String paramString)
  {
    this.mProductName = paramString;
  }
  
  void setState(String paramString)
  {
    this.mState = paramString;
  }
  
  void setSubscribed(boolean paramBoolean)
  {
    this.mIsSubscribed = paramBoolean;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/WeMoDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */