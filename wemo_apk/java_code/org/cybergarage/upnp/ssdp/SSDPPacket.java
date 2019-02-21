package org.cybergarage.upnp.ssdp;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import org.cybergarage.http.HTTPHeader;
import org.cybergarage.upnp.device.MAN;
import org.cybergarage.upnp.device.NT;
import org.cybergarage.upnp.device.NTS;
import org.cybergarage.upnp.device.ST;
import org.cybergarage.upnp.device.USN;

public class SSDPPacket
{
  private static final String TAG = SSDPPacket.class.getSimpleName();
  private DatagramPacket dgmPacket = null;
  private String localAddr = "";
  private boolean notify = false;
  public byte[] packetBytes = null;
  private long timeStamp;
  
  public SSDPPacket(byte[] paramArrayOfByte, int paramInt)
  {
    this.dgmPacket = new DatagramPacket(paramArrayOfByte, paramInt);
  }
  
  public String getCacheControl()
  {
    return HTTPHeader.getValue(getData(), "Cache-Control");
  }
  
  public byte[] getData()
  {
    if (this.packetBytes != null) {
      return this.packetBytes;
    }
    DatagramPacket localDatagramPacket = getDatagramPacket();
    int i = localDatagramPacket.getLength();
    this.packetBytes = new String(localDatagramPacket.getData(), 0, i).getBytes();
    return this.packetBytes;
  }
  
  public DatagramPacket getDatagramPacket()
  {
    return this.dgmPacket;
  }
  
  public String getHost()
  {
    return HTTPHeader.getValue(getData(), "HOST");
  }
  
  public InetAddress getHostInetAddress()
  {
    String str1 = "127.0.0.1";
    String str2 = getHost();
    int i = str2.lastIndexOf(":");
    if (i >= 0)
    {
      str1 = str2.substring(0, i);
      if (str1.charAt(0) == '[') {
        str1 = str1.substring(1, str1.length());
      }
      if (str1.charAt(-1 + str1.length()) == ']') {
        str1 = str1.substring(0, -1 + str1.length());
      }
    }
    return new InetSocketAddress(str1, 0).getAddress();
  }
  
  public int getLeaseTime()
  {
    return SSDP.getLeaseTime(getCacheControl());
  }
  
  public String getLocalAddress()
  {
    return this.localAddr;
  }
  
  public String getLocation()
  {
    return HTTPHeader.getValue(getData(), "Location");
  }
  
  public String getMAN()
  {
    return HTTPHeader.getValue(getData(), "MAN");
  }
  
  public int getMX()
  {
    return HTTPHeader.getIntegerValue(getData(), "MX");
  }
  
  public String getNT()
  {
    return HTTPHeader.getValue(getData(), "NT");
  }
  
  public String getNTS()
  {
    return HTTPHeader.getValue(getData(), "NTS");
  }
  
  public String getRemoteAddress()
  {
    return getDatagramPacket().getAddress().getHostAddress();
  }
  
  public InetAddress getRemoteInetAddress()
  {
    return getDatagramPacket().getAddress();
  }
  
  public int getRemotePort()
  {
    return getDatagramPacket().getPort();
  }
  
  public String getST()
  {
    return HTTPHeader.getValue(getData(), "ST");
  }
  
  public String getServer()
  {
    return HTTPHeader.getValue(getData(), "Server");
  }
  
  public long getTimeStamp()
  {
    return this.timeStamp;
  }
  
  public String getUSN()
  {
    return HTTPHeader.getValue(getData(), "USN");
  }
  
  public boolean isAlive()
  {
    return NTS.isAlive(getNTS());
  }
  
  public boolean isByeBye()
  {
    return NTS.isByeBye(getNTS());
  }
  
  public boolean isDiscover()
  {
    return MAN.isDiscover(getMAN());
  }
  
  public boolean isNotify()
  {
    return this.notify;
  }
  
  public boolean isRootDevice()
  {
    if (NT.isRootDevice(getNT()) == true) {}
    while (ST.isRootDevice(getST()) == true) {
      return true;
    }
    return USN.isRootDevice(getUSN());
  }
  
  public void setLocalAddress(String paramString)
  {
    this.localAddr = paramString;
  }
  
  public void setNotify(boolean paramBoolean)
  {
    SDKLogUtils.debugLog(TAG, "Discovery: SSDP Packet settinf NOTIFY Flag to: " + paramBoolean);
    this.notify = paramBoolean;
  }
  
  public void setTimeStamp(long paramLong)
  {
    this.timeStamp = paramLong;
  }
  
  public String toString()
  {
    return new String(getData());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPPacket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */