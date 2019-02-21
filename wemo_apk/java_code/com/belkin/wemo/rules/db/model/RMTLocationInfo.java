package com.belkin.wemo.rules.db.model;

public class RMTLocationInfo
{
  private final int LocationPk = 1;
  private String cityName;
  private String countryCode;
  private String countryName;
  private String latitude;
  private String longitude;
  private String region;
  
  public RMTLocationInfo() {}
  
  public RMTLocationInfo(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    this.cityName = paramString1;
    this.countryName = paramString2;
    this.latitude = paramString3;
    this.longitude = paramString4;
    this.countryCode = paramString5;
    this.region = paramString6;
  }
  
  public String getCityName()
  {
    return this.cityName;
  }
  
  public String getCountryCode()
  {
    return this.countryCode;
  }
  
  public String getCountryName()
  {
    return this.countryName;
  }
  
  public String getLatitude()
  {
    return this.latitude;
  }
  
  public int getLocationPk()
  {
    return 1;
  }
  
  public String getLongitude()
  {
    return this.longitude;
  }
  
  public String getRegion()
  {
    return this.region;
  }
  
  public void setCityName(String paramString)
  {
    this.cityName = paramString;
  }
  
  public void setCountryCode(String paramString)
  {
    this.countryCode = paramString;
  }
  
  public void setCountryName(String paramString)
  {
    this.countryName = paramString;
  }
  
  public void setLatitude(String paramString)
  {
    this.latitude = paramString;
  }
  
  public void setLongitude(String paramString)
  {
    this.longitude = paramString;
  }
  
  public void setRegion(String paramString)
  {
    this.region = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/model/RMTLocationInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */