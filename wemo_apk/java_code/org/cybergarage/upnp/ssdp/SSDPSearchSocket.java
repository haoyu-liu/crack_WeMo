package org.cybergarage.upnp.ssdp;

import android.util.Log;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.device.SearchListener;
import org.cybergarage.util.ListenerList;

public class SSDPSearchSocket
  extends HTTPMUSocket
  implements Runnable
{
  private ListenerList deviceSearchListenerList = new ListenerList();
  private Thread deviceSearchThread = null;
  private boolean useIPv6Address;
  
  public SSDPSearchSocket(String paramString1, int paramInt, String paramString2)
  {
    open(paramString1, paramString2);
  }
  
  public SSDPSearchSocket(InetAddress paramInetAddress)
  {
    if (paramInetAddress.getAddress().length != 4)
    {
      open((Inet6Address)paramInetAddress);
      return;
    }
    open((Inet4Address)paramInetAddress);
  }
  
  public void addSearchListener(SearchListener paramSearchListener)
  {
    this.deviceSearchListenerList.add(paramSearchListener);
  }
  
  public boolean open(String paramString)
  {
    String str = "239.255.255.250";
    this.useIPv6Address = false;
    if (HostInterface.isIPv6Address(paramString) == true)
    {
      str = SSDP.getIPv6Address();
      this.useIPv6Address = true;
    }
    return open(str, 1900, paramString);
  }
  
  public boolean open(String paramString1, String paramString2)
  {
    if ((HostInterface.isIPv6Address(paramString1)) && (HostInterface.isIPv6Address(paramString2))) {}
    for (this.useIPv6Address = true;; this.useIPv6Address = false)
    {
      return open(paramString2, 1900, paramString1);
      if ((!HostInterface.isIPv4Address(paramString1)) || (!HostInterface.isIPv4Address(paramString2))) {
        break;
      }
    }
    throw new IllegalArgumentException("Cannot open a UDP Socket for IPv6 address on IPv4 interface or viceversa");
  }
  
  public boolean open(Inet4Address paramInet4Address)
  {
    this.useIPv6Address = false;
    return open("239.255.255.250", 1900, paramInet4Address);
  }
  
  public boolean open(Inet6Address paramInet6Address)
  {
    this.useIPv6Address = true;
    return open(SSDP.getIPv6Address(), 1900, paramInet6Address);
  }
  
  public void performSearchListener(SSDPPacket paramSSDPPacket)
  {
    int i = this.deviceSearchListenerList.size();
    for (int j = 0; j < i; j++) {
      ((SearchListener)this.deviceSearchListenerList.get(j)).deviceSearchReceived(paramSSDPPacket);
    }
  }
  
  public void removeSearchListener(SearchListener paramSearchListener)
  {
    this.deviceSearchListenerList.remove(paramSearchListener);
  }
  
  public void run()
  {
    Thread localThread = Thread.currentThread();
    int i = 0;
    for (;;)
    {
      if (this.deviceSearchThread == localThread)
      {
        Thread.yield();
        Log.e("Discovery", "SSDP Search Socket iterations = " + i);
        i++;
        try
        {
          SSDPPacket localSSDPPacket = receive();
          if ((localSSDPPacket != null) && (localSSDPPacket.isDiscover() == true)) {
            performSearchListener(localSSDPPacket);
          }
        }
        catch (IOException localIOException) {}
      }
    }
  }
  
  public void start()
  {
    StringBuffer localStringBuffer = new StringBuffer("Cyber.SSDPSearchSocket/");
    String str = getLocalAddress();
    if ((str != null) && (str.length() > 0))
    {
      localStringBuffer.append(getLocalAddress()).append(':');
      localStringBuffer.append(getLocalPort()).append(" -> ");
      localStringBuffer.append(getMulticastAddress()).append(':');
      localStringBuffer.append(getMulticastPort());
    }
    this.deviceSearchThread = new Thread(this, localStringBuffer.toString());
    this.deviceSearchThread.start();
  }
  
  public void stop()
  {
    close();
    this.deviceSearchThread = null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */