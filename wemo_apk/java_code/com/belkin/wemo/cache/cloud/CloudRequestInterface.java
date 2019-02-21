package com.belkin.wemo.cache.cloud;

import java.util.Map;

public abstract interface CloudRequestInterface
{
  public abstract Map<String, String> getAdditionalHeaders();
  
  public abstract String getBody();
  
  public abstract byte[] getFileByteArray();
  
  public abstract int getRequestMethod();
  
  public abstract int getTimeout();
  
  public abstract int getTimeoutLimit();
  
  public abstract String getURL();
  
  public abstract String getUploadFileName();
  
  public abstract boolean isAuthHeaderRequired();
  
  public abstract void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestInterface.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */