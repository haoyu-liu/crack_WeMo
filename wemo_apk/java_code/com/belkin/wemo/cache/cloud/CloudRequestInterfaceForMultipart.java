package com.belkin.wemo.cache.cloud;

public abstract interface CloudRequestInterfaceForMultipart
{
  public abstract String[] getFormKeys();
  
  public abstract String[] getFormValues();
  
  public abstract boolean getRequestMethod();
  
  public abstract String getURL();
  
  public abstract String[] requestComplete(int paramInt, String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */