package com.belkin.wemo.rules.device.error;

import com.belkin.wemo.error.WeMoError;

public class RuleDeviceError
  extends WeMoError
{
  private String deviceUdn;
  
  public RuleDeviceError() {}
  
  public RuleDeviceError(int paramInt, String paramString1, String paramString2)
  {
    super(paramInt, paramString1);
    setDeviceUdn(paramString2);
  }
  
  public RuleDeviceError(String paramString)
  {
    setDeviceUdn(paramString);
    this.errorCode = -1;
    this.errorMessage = "Error while processing Rules!";
  }
  
  public String getDeviceUdn()
  {
    return this.deviceUdn;
  }
  
  public void setDeviceUdn(String paramString)
  {
    if (paramString != null)
    {
      this.deviceUdn = paramString;
      return;
    }
    this.deviceUdn = "";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/error/RuleDeviceError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */