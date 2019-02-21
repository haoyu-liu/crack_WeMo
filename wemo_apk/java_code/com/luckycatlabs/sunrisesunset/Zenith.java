package com.luckycatlabs.sunrisesunset;

import java.math.BigDecimal;

public class Zenith
{
  public static final Zenith ASTRONOMICAL = new Zenith(108.0D);
  public static final Zenith CIVIL = new Zenith(96.0D);
  public static final Zenith NAUTICAL = new Zenith(102.0D);
  public static final Zenith OFFICIAL = new Zenith(90.8333D);
  private final BigDecimal degrees;
  
  public Zenith(double paramDouble)
  {
    this.degrees = BigDecimal.valueOf(paramDouble);
  }
  
  public BigDecimal degrees()
  {
    return this.degrees;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/luckycatlabs/sunrisesunset/Zenith.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */