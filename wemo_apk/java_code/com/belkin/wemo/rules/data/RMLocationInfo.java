package com.belkin.wemo.rules.data;

public class RMLocationInfo
{
  private String cityName;
  private String countryCode;
  private String countryName;
  private double latitude;
  private double longitude;
  private String region;
  
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
  
  public double getLatitude()
  {
    return this.latitude;
  }
  
  public double getLongitude()
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
  
  public void setLatitude(double paramDouble)
  {
    this.latitude = paramDouble;
  }
  
  public void setLongitude(double paramDouble)
  {
    this.longitude = paramDouble;
  }
  
  public void setRegion(String paramString)
  {
    this.region = paramString;
  }
  
  public String toString()
  {
    return super.toString() + "; CITY_NAME: " + this.cityName + "; COUNTRY_NAME: " + this.countryName + "; REGION: " + this.region + "; COUNTRY_CODE: " + this.countryCode + "; LATITUDE: " + this.latitude + "; LONGITUDE: " + this.longitude;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMLocationInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */