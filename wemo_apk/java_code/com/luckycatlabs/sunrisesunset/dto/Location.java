package com.luckycatlabs.sunrisesunset.dto;

import java.math.BigDecimal;

public class Location
{
  private BigDecimal latitude;
  private BigDecimal longitude;
  
  public Location(double paramDouble1, double paramDouble2)
  {
    this.latitude = new BigDecimal(paramDouble1);
    this.longitude = new BigDecimal(paramDouble2);
  }
  
  public Location(String paramString1, String paramString2)
  {
    this.latitude = new BigDecimal(paramString1);
    this.longitude = new BigDecimal(paramString2);
  }
  
  public BigDecimal getLatitude()
  {
    return this.latitude;
  }
  
  public BigDecimal getLongitude()
  {
    return this.longitude;
  }
  
  public void setLocation(double paramDouble1, double paramDouble2)
  {
    this.latitude = new BigDecimal(paramDouble1);
    this.longitude = new BigDecimal(paramDouble2);
  }
  
  public void setLocation(String paramString1, String paramString2)
  {
    this.latitude = new BigDecimal(paramString1);
    this.longitude = new BigDecimal(paramString2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/luckycatlabs/sunrisesunset/dto/Location.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */