package org.cybergarage.upnp.xml;

import java.io.File;
import java.net.InetAddress;
import org.cybergarage.http.HTTPServerList;
import org.cybergarage.upnp.device.Advertiser;
import org.cybergarage.upnp.ssdp.SSDP;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.upnp.ssdp.SSDPSearchSocketList;
import org.cybergarage.util.ListenerList;

public class DeviceData
  extends NodeData
{
  private Advertiser advertiser = null;
  private ListenerList controlActionListenerList = new ListenerList();
  private File descriptionFile = null;
  private String descriptionURI = null;
  private InetAddress[] httpBinds = null;
  private int httpPort = 4004;
  private HTTPServerList httpServerList = null;
  private int leaseTime = 1800;
  private String location = "";
  private InetAddress[] ssdpBinds = null;
  private String ssdpMulticastIPv4 = "239.255.255.250";
  private String ssdpMulticastIPv6 = SSDP.getIPv6Address();
  private SSDPPacket ssdpPacket = null;
  private int ssdpPort = 1900;
  private SSDPSearchSocketList ssdpSearchSocketList = null;
  
  public Advertiser getAdvertiser()
  {
    return this.advertiser;
  }
  
  public ListenerList getControlActionListenerList()
  {
    return this.controlActionListenerList;
  }
  
  public File getDescriptionFile()
  {
    return this.descriptionFile;
  }
  
  public String getDescriptionURI()
  {
    return this.descriptionURI;
  }
  
  public InetAddress[] getHTTPBindAddress()
  {
    return this.httpBinds;
  }
  
  public int getHTTPPort()
  {
    return this.httpPort;
  }
  
  public HTTPServerList getHTTPServerList()
  {
    if (this.httpServerList == null) {
      this.httpServerList = new HTTPServerList(this.httpBinds, this.httpPort);
    }
    return this.httpServerList;
  }
  
  public int getLeaseTime()
  {
    return this.leaseTime;
  }
  
  public String getLocation()
  {
    return this.location;
  }
  
  public String getMulticastIPv4Address()
  {
    return this.ssdpMulticastIPv4;
  }
  
  public String getMulticastIPv6Address()
  {
    return this.ssdpMulticastIPv6;
  }
  
  public InetAddress[] getSSDPBindAddress()
  {
    return this.ssdpBinds;
  }
  
  public SSDPPacket getSSDPPacket()
  {
    return this.ssdpPacket;
  }
  
  public int getSSDPPort()
  {
    return this.ssdpPort;
  }
  
  public SSDPSearchSocketList getSSDPSearchSocketList()
  {
    if (this.ssdpSearchSocketList == null) {
      this.ssdpSearchSocketList = new SSDPSearchSocketList(this.ssdpBinds, this.ssdpPort, this.ssdpMulticastIPv4, this.ssdpMulticastIPv6);
    }
    return this.ssdpSearchSocketList;
  }
  
  public void setAdvertiser(Advertiser paramAdvertiser)
  {
    this.advertiser = paramAdvertiser;
  }
  
  public void setDescriptionFile(File paramFile)
  {
    this.descriptionFile = paramFile;
  }
  
  public void setDescriptionURI(String paramString)
  {
    this.descriptionURI = paramString;
  }
  
  public void setHTTPBindAddress(InetAddress[] paramArrayOfInetAddress)
  {
    this.httpBinds = paramArrayOfInetAddress;
  }
  
  public void setHTTPPort(int paramInt)
  {
    this.httpPort = paramInt;
  }
  
  public void setLeaseTime(int paramInt)
  {
    this.leaseTime = paramInt;
  }
  
  public void setLocation(String paramString)
  {
    this.location = paramString;
  }
  
  public void setMulticastIPv4Address(String paramString)
  {
    this.ssdpMulticastIPv4 = paramString;
  }
  
  public void setMulticastIPv6Address(String paramString)
  {
    this.ssdpMulticastIPv6 = paramString;
  }
  
  public void setSSDPBindAddress(InetAddress[] paramArrayOfInetAddress)
  {
    this.ssdpBinds = paramArrayOfInetAddress;
  }
  
  public void setSSDPPacket(SSDPPacket paramSSDPPacket)
  {
    this.ssdpPacket = paramSSDPPacket;
  }
  
  public void setSSDPPort(int paramInt)
  {
    this.ssdpPort = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/xml/DeviceData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */