package com.belkin.wemo.upnp.response;

public class RMFetchRulesResponse
  extends RMBaseUpnpResponse
{
  private int errorCode;
  private String ruleDBPath;
  private int ruleDBVersion;
  
  public int getErrorCode()
  {
    return this.errorCode;
  }
  
  public String getRuleDBPath()
  {
    return this.ruleDBPath;
  }
  
  public int getRuleDBVersion()
  {
    return this.ruleDBVersion;
  }
  
  public void setErrorCode(int paramInt)
  {
    this.errorCode = paramInt;
  }
  
  public void setRuleDBPath(String paramString)
  {
    if (paramString == null)
    {
      this.ruleDBPath = "";
      return;
    }
    this.ruleDBPath = paramString;
  }
  
  public void setRuleDBVersion(int paramInt)
  {
    this.ruleDBVersion = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/RMFetchRulesResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */