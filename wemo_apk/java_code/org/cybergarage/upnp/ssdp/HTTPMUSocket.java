package org.cybergarage.upnp.ssdp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MulticastSocket;
import java.net.NetworkInterface;
import java.util.Enumeration;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.upnp.UPnP;
import org.cybergarage.util.Debug;

public class HTTPMUSocket
{
  private InetSocketAddress ssdpMultiGroup = null;
  private NetworkInterface ssdpMultiIf = null;
  private MulticastSocket ssdpMultiSock = null;
  
  public HTTPMUSocket() {}
  
  public HTTPMUSocket(String paramString1, int paramInt, String paramString2)
  {
    open(paramString1, paramInt, paramString2);
  }
  
  public boolean close()
  {
    if (this.ssdpMultiSock == null) {
      return true;
    }
    try
    {
      this.ssdpMultiSock.leaveGroup(this.ssdpMultiGroup, this.ssdpMultiIf);
      this.ssdpMultiSock.close();
      this.ssdpMultiSock = null;
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  protected void finalize()
  {
    close();
  }
  
  public String getLocalAddress()
  {
    if ((this.ssdpMultiGroup == null) || (this.ssdpMultiIf == null)) {
      return "";
    }
    InetAddress localInetAddress1 = this.ssdpMultiGroup.getAddress();
    Enumeration localEnumeration = this.ssdpMultiIf.getInetAddresses();
    while (localEnumeration.hasMoreElements())
    {
      InetAddress localInetAddress2 = (InetAddress)localEnumeration.nextElement();
      if (((localInetAddress1 instanceof Inet6Address)) && ((localInetAddress2 instanceof Inet6Address))) {
        return localInetAddress2.getHostAddress();
      }
      if (((localInetAddress1 instanceof Inet4Address)) && ((localInetAddress2 instanceof Inet4Address))) {
        return localInetAddress2.getHostAddress();
      }
    }
    return "";
  }
  
  public int getLocalPort()
  {
    return this.ssdpMultiSock.getLocalPort();
  }
  
  public String getMulticastAddress()
  {
    return getMulticastInetAddress().getHostAddress();
  }
  
  public InetAddress getMulticastInetAddress()
  {
    return this.ssdpMultiGroup.getAddress();
  }
  
  public int getMulticastPort()
  {
    return this.ssdpMultiGroup.getPort();
  }
  
  public MulticastSocket getSocket()
  {
    return this.ssdpMultiSock;
  }
  
  public boolean open(String paramString1, int paramInt, String paramString2)
  {
    try
    {
      boolean bool = open(paramString1, paramInt, InetAddress.getByName(paramString2));
      return bool;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return false;
  }
  
  public boolean open(String paramString, int paramInt, InetAddress paramInetAddress)
  {
    try
    {
      this.ssdpMultiSock = new MulticastSocket(null);
      this.ssdpMultiSock.setReuseAddress(true);
      InetSocketAddress localInetSocketAddress = new InetSocketAddress(paramInt);
      this.ssdpMultiSock.bind(localInetSocketAddress);
      this.ssdpMultiGroup = new InetSocketAddress(InetAddress.getByName(paramString), paramInt);
      this.ssdpMultiIf = NetworkInterface.getByInetAddress(paramInetAddress);
      this.ssdpMultiSock.joinGroup(this.ssdpMultiGroup, this.ssdpMultiIf);
      return true;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return false;
  }
  
  public boolean post(HTTPRequest paramHTTPRequest)
  {
    return send(paramHTTPRequest.toString(), null, -1);
  }
  
  public boolean post(HTTPRequest paramHTTPRequest, String paramString, int paramInt)
  {
    return send(paramHTTPRequest.toString(), paramString, paramInt);
  }
  
  public SSDPPacket receive()
    throws IOException
  {
    byte[] arrayOfByte = new byte['Ѐ'];
    SSDPPacket localSSDPPacket = new SSDPPacket(arrayOfByte, arrayOfByte.length);
    localSSDPPacket.setLocalAddress(getLocalAddress());
    if (this.ssdpMultiSock != null)
    {
      this.ssdpMultiSock.receive(localSSDPPacket.getDatagramPacket());
      localSSDPPacket.setTimeStamp(System.currentTimeMillis());
      return localSSDPPacket;
    }
    throw new IOException("Multicast socket has already been closed.");
  }
  
  public boolean send(String paramString)
  {
    return send(paramString, null, -1);
  }
  
  public boolean send(String paramString1, String paramString2, int paramInt)
  {
    if ((paramString2 != null) && (paramInt > 0)) {}
    for (;;)
    {
      try
      {
        localMulticastSocket = new MulticastSocket(null);
        localMulticastSocket.bind(new InetSocketAddress(paramString2, paramInt));
        DatagramPacket localDatagramPacket = new DatagramPacket(paramString1.getBytes(), paramString1.length(), this.ssdpMultiGroup);
        localMulticastSocket.setTimeToLive(UPnP.getTimeToLive());
        localMulticastSocket.send(localDatagramPacket);
        localMulticastSocket.close();
        return true;
      }
      catch (Exception localException)
      {
        MulticastSocket localMulticastSocket;
        Debug.warning(localException);
      }
      localMulticastSocket = new MulticastSocket();
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/HTTPMUSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */