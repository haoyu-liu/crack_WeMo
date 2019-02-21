package com.belkin.wemo.cache.devicelist.listener;

public abstract interface UnicastListener
{
  public abstract void onDeviceDiscovered(String paramString1, int paramInt, String paramString2);
  
  public abstract void onDeviceNotDiscovered(String paramString1, int paramInt, String paramString2);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/listener/UnicastListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */