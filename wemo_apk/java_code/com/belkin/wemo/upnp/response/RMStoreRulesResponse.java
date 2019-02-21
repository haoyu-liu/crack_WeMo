package com.belkin.wemo.upnp.response;

public class RMStoreRulesResponse
  extends RMBaseUpnpResponse
{
  private String errorInfo;
  
  public String getErrorInfo()
  {
    return this.errorInfo;
  }
  
  public void setErrorInfo(String paramString)
  {
    if (paramString == null) {
      return;
    }
    this.errorInfo = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/RMStoreRulesResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */