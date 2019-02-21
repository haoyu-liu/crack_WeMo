package com.belkin.wemo.rules.device.error;

import com.belkin.wemo.error.WeMoError;

public class RMRuleDeviceError
  extends WeMoError
{
  private String deviceUdn;
  
  public RMRuleDeviceError() {}
  
  public RMRuleDeviceError(int paramInt, String paramString1, String paramString2)
  {
    super(paramInt, paramString1);
    setDeviceUdn(paramString2);
  }
  
  public RMRuleDeviceError(String paramString)
  {
    setDeviceUdn(paramString);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/error/RMRuleDeviceError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */