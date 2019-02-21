package com.belkin.wemo.cache.utils;

public class RMNetworkUtilsImpl
  implements RMINetworkUtils
{
  public boolean isLocal()
  {
    return NetworkMode.isLocal();
  }
  
  public void setLocal(boolean paramBoolean)
  {
    NetworkMode.setLocal(paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/RMNetworkUtilsImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */