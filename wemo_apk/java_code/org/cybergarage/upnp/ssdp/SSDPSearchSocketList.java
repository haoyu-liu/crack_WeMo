package org.cybergarage.upnp.ssdp;

import java.net.InetAddress;
import java.util.Vector;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.device.SearchListener;

public class SSDPSearchSocketList
  extends Vector
{
  private InetAddress[] binds = null;
  private String multicastIPv4 = "239.255.255.250";
  private String multicastIPv6 = SSDP.getIPv6Address();
  private int port = 1900;
  
  public SSDPSearchSocketList() {}
  
  public SSDPSearchSocketList(InetAddress[] paramArrayOfInetAddress)
  {
    this.binds = paramArrayOfInetAddress;
  }
  
  public SSDPSearchSocketList(InetAddress[] paramArrayOfInetAddress, int paramInt, String paramString1, String paramString2)
  {
    this.binds = paramArrayOfInetAddress;
    this.port = paramInt;
    this.multicastIPv4 = paramString1;
    this.multicastIPv6 = paramString2;
  }
  
  public void addSearchListener(SearchListener paramSearchListener)
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getSSDPSearchSocket(j).addSearchListener(paramSearchListener);
    }
  }
  
  public void close()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getSSDPSearchSocket(j).close();
    }
    clear();
  }
  
  public SSDPSearchSocket getSSDPSearchSocket(int paramInt)
  {
    return (SSDPSearchSocket)get(paramInt);
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
    int k = 0;
    if (k < arrayOfString.length)
    {
      if (arrayOfString[k] != null) {
        if (!HostInterface.isIPv6Address(arrayOfString[k])) {
          break label136;
        }
      }
      label136:
      for (SSDPSearchSocket localSSDPSearchSocket = new SSDPSearchSocket(arrayOfString[k], this.port, this.multicastIPv6);; localSSDPSearchSocket = new SSDPSearchSocket(arrayOfString[k], this.port, this.multicastIPv4))
      {
        add(localSSDPSearchSocket);
        k++;
        break;
      }
    }
    return true;
  }
  
  public void start()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getSSDPSearchSocket(j).start();
    }
  }
  
  public void stop()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getSSDPSearchSocket(j).stop();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchSocketList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */