package com.belkin.wemo.runnable;

import com.belkin.wemo.cache.devicelist.CloudCacheUnicastDeviceDiscovery;
import com.belkin.wemo.cache.devicelist.listener.UnicastListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;

public class DeviceUnicastRunnable
  extends WeMoRunnable
{
  private CloudCacheUnicastDeviceDiscovery cloudCacheUnicastDeviceDiscovery;
  private String ipAddress;
  private int port;
  private String udn;
  private UnicastListener unicastListener;
  
  public DeviceUnicastRunnable(String paramString1, int paramInt, String paramString2, UnicastListener paramUnicastListener, CloudCacheUnicastDeviceDiscovery paramCloudCacheUnicastDeviceDiscovery)
  {
    this.ipAddress = paramString1;
    this.port = paramInt;
    this.udn = paramString2;
    this.unicastListener = paramUnicastListener;
    this.cloudCacheUnicastDeviceDiscovery = paramCloudCacheUnicastDeviceDiscovery;
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "UNICAST CALL BEING SENT FOR UDN: " + this.udn);
    try
    {
      this.cloudCacheUnicastDeviceDiscovery.isDeviceReachable(this.ipAddress, this.port, this.udn, this.unicastListener);
      return;
    }
    catch (InvalidArgumentsException localInvalidArgumentsException)
    {
      SDKLogUtils.errorLog(this.TAG, "IPAddress is null", localInvalidArgumentsException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/runnable/DeviceUnicastRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */