package org.apache.cordova;

public abstract interface ICordovaCookieManager
{
  public abstract void clearCookies();
  
  public abstract void flush();
  
  public abstract String getCookie(String paramString);
  
  public abstract void setCookie(String paramString1, String paramString2);
  
  public abstract void setCookiesEnabled(boolean paramBoolean);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/ICordovaCookieManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */