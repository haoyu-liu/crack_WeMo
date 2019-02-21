package com.belkin.wemo.upnp.response;

public class RMRulesDBVersionResponse
  extends RMBaseUpnpResponse
{
  private String rulesDBVersion = "";
  
  public String getRulesDBVersion()
  {
    return this.rulesDBVersion;
  }
  
  public void setRulesDBVersion(String paramString)
  {
    if (paramString != null)
    {
      this.rulesDBVersion = paramString;
      return;
    }
    this.rulesDBVersion = "";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/RMRulesDBVersionResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */