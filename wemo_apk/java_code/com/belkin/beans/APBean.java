package com.belkin.beans;

public class APBean
{
  private Integer channel;
  private String securityStrength;
  private Integer signalStrength;
  private String strSSID;
  
  public Integer getChannel()
  {
    return this.channel;
  }
  
  public String getSecurityStrength()
  {
    return this.securityStrength;
  }
  
  public Integer getSignalStrength()
  {
    return this.signalStrength;
  }
  
  public String getStrSSID()
  {
    return this.strSSID;
  }
  
  public void setChannel(Integer paramInteger)
  {
    this.channel = paramInteger;
  }
  
  public void setSecurityStrength(String paramString)
  {
    this.securityStrength = paramString;
  }
  
  public void setSignalStrength(Integer paramInteger)
  {
    this.signalStrength = paramInteger;
  }
  
  public void setStrSSID(String paramString)
  {
    this.strSSID = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/beans/APBean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */