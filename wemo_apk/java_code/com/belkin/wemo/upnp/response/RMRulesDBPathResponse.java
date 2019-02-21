package com.belkin.wemo.upnp.response;

import com.belkin.wemo.cache.utils.SDKLogUtils;

public class RMRulesDBPathResponse
  extends RMBaseUpnpResponse
{
  private static final String TAG = RMRulesDBPathResponse.class.getSimpleName();
  private String rulesDBPath = "";
  
  public String getRulesDBPath()
  {
    return this.rulesDBPath;
  }
  
  public void setRulesDBPath(String paramString)
  {
    if (paramString != null)
    {
      SDKLogUtils.infoLog(TAG, "Setting rules db path to: " + paramString);
      this.rulesDBPath = paramString;
      return;
    }
    SDKLogUtils.infoLog(TAG, "rules db path received is NULL. Setting empty string");
    this.rulesDBPath = "";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/RMRulesDBPathResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */