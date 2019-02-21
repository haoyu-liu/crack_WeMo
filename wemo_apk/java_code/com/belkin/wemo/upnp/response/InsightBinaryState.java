package com.belkin.wemo.upnp.response;

public class InsightBinaryState
{
  private String binaryState;
  private String brightness;
  private String fader;
  
  public String getBinaryState()
  {
    if (this.binaryState == null) {
      this.binaryState = "";
    }
    return this.binaryState;
  }
  
  public String getBrightness()
  {
    if (this.brightness == null) {
      this.brightness = "";
    }
    return this.brightness;
  }
  
  public String getFader()
  {
    if (this.fader == null) {
      this.fader = "";
    }
    return this.fader;
  }
  
  public void setBinaryState(String paramString)
  {
    this.binaryState = paramString;
  }
  
  public void setBrightness(String paramString)
  {
    this.brightness = paramString;
  }
  
  public void setFader(String paramString)
  {
    this.fader = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/InsightBinaryState.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */