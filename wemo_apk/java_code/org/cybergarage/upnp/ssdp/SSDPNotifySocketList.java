package org.cybergarage.upnp.ssdp;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.net.InetAddress;
import java.util.Vector;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.ControlPoint;

public class SSDPNotifySocketList
  extends Vector
{
  private static final String TAG = SSDPNotifySocketList.class.getSimpleName();
  private InetAddress[] binds = null;
  
  public SSDPNotifySocketList() {}
  
  public SSDPNotifySocketList(InetAddress[] paramArrayOfInetAddress)
  {
    this.binds = paramArrayOfInetAddress;
  }
  
  public void close()
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      SSDPNotifySocket localSSDPNotifySocket = getSSDPNotifySocket(j);
      if (localSSDPNotifySocket != null) {
        localSSDPNotifySocket.close();
      }
    }
    clear();
  }
  
  public SSDPNotifySocket getSSDPNotifySocket(int paramInt)
  {
    SDKLogUtils.infoLog(TAG, "getSSDPNotifySocket called-- ");
    try
    {
      SSDPNotifySocket localSSDPNotifySocket = (SSDPNotifySocket)get(paramInt);
      return localSSDPNotifySocket;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception: ", localException);
    }
    return null;
  }
  
  public boolean open()
  {
    InetAddress[] arrayOfInetAddress = this.binds;
    if (arrayOfInetAddress != null)
    {
      arrayOfString = new String[arrayOfInetAddress.length];
      for (int m = 0; m < arrayOfInetAddress.length; m++) {
        arrayOfString[m] = arrayOfInetAddress[m].getHostAddress();
      }
    }
    int i = HostInterface.getNHostAddresses();
    String[] arrayOfString = new String[i];
    for (int j = 0; j < i; j++) {
      arrayOfString[j] = HostInterface.getHostAddress(j);
    }
    for (int k = 0; k < arrayOfString.length; k++) {
      if (arrayOfString[k] != null) {
        add(new SSDPNotifySocket(arrayOfString[k]));
      }
    }
    return true;
  }
  
  public void setControlPoint(ControlPoint paramControlPoint)
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      SSDPNotifySocket localSSDPNotifySocket = getSSDPNotifySocket(j);
      if (localSSDPNotifySocket != null) {
        localSSDPNotifySocket.setControlPoint(paramControlPoint);
      }
    }
  }
  
  public void start()
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      SSDPNotifySocket localSSDPNotifySocket = getSSDPNotifySocket(j);
      if (localSSDPNotifySocket != null) {
        localSSDPNotifySocket.start();
      }
    }
  }
  
  public void stop()
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      SSDPNotifySocket localSSDPNotifySocket = getSSDPNotifySocket(j);
      if (localSSDPNotifySocket != null) {
        localSSDPNotifySocket.stop();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPNotifySocketList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */