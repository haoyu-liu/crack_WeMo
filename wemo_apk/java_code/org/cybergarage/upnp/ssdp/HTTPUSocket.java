package org.cybergarage.upnp.ssdp;

import android.util.Log;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import org.cybergarage.util.Debug;

public class HTTPUSocket
{
  private static final String TAG = HTTPUSocket.class.getSimpleName();
  private String localAddr = "";
  private DatagramSocket ssdpUniSock = null;
  
  public HTTPUSocket()
  {
    open();
  }
  
  public HTTPUSocket(int paramInt)
  {
    open(paramInt);
  }
  
  public HTTPUSocket(String paramString, int paramInt)
  {
    open(paramString, paramInt);
  }
  
  public boolean close()
  {
    if (this.ssdpUniSock == null) {
      return true;
    }
    try
    {
      this.ssdpUniSock.disconnect();
      this.ssdpUniSock.close();
      this.ssdpUniSock = null;
      return true;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return false;
  }
  
  protected void finalize()
  {
    close();
  }
  
  public DatagramSocket getDatagramSocket()
  {
    return this.ssdpUniSock;
  }
  
  public String getLocalAddress()
  {
    if (this.localAddr.length() > 0) {
      return this.localAddr;
    }
    return this.ssdpUniSock.getLocalAddress().getHostAddress();
  }
  
  public DatagramSocket getUDPSocket()
  {
    return this.ssdpUniSock;
  }
  
  public boolean open()
  {
    close();
    try
    {
      this.ssdpUniSock = new DatagramSocket();
      this.ssdpUniSock.setReuseAddress(true);
      return true;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return false;
  }
  
  public boolean open(int paramInt)
  {
    close();
    try
    {
      InetSocketAddress localInetSocketAddress = new InetSocketAddress(paramInt);
      this.ssdpUniSock = new DatagramSocket(null);
      this.ssdpUniSock.setReuseAddress(true);
      this.ssdpUniSock.bind(localInetSocketAddress);
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public boolean open(String paramString, int paramInt)
  {
    close();
    try
    {
      Log.e("Discovery", "InetSocketAddress...   start");
      InetSocketAddress localInetSocketAddress = new InetSocketAddress(InetAddress.getByName(paramString), paramInt);
      Log.e("Discovery", "InetSocketAddress...   end");
      this.ssdpUniSock = new DatagramSocket(null);
      this.ssdpUniSock.setReuseAddress(true);
      this.ssdpUniSock.bind(localInetSocketAddress);
      setLocalAddress(paramString);
      return true;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
      this.ssdpUniSock.disconnect();
      this.ssdpUniSock.close();
    }
    try
    {
      this.ssdpUniSock = new DatagramSocket(new InetSocketAddress(InetAddress.getByName(paramString), paramInt));
      this.ssdpUniSock.setReuseAddress(true);
      return false;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      for (;;)
      {
        localUnknownHostException.printStackTrace();
      }
    }
    catch (SocketException localSocketException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public boolean post(String paramString1, int paramInt, String paramString2)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "post() addr: " + paramString1 + "; port: " + paramInt + "; msg: " + paramString2);
      InetAddress localInetAddress = InetAddress.getByName(paramString1);
      DatagramPacket localDatagramPacket = new DatagramPacket(paramString2.getBytes(), paramString2.length(), localInetAddress, paramInt);
      this.ssdpUniSock.send(localDatagramPacket);
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public SSDPPacket receive()
  {
    byte[] arrayOfByte = new byte['Ѐ'];
    SSDPPacket localSSDPPacket = new SSDPPacket(arrayOfByte, arrayOfByte.length);
    localSSDPPacket.setLocalAddress(getLocalAddress());
    try
    {
      this.ssdpUniSock.receive(localSSDPPacket.getDatagramPacket());
      localSSDPPacket.setTimeStamp(System.currentTimeMillis());
      return localSSDPPacket;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public void setLocalAddress(String paramString)
  {
    this.localAddr = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/HTTPUSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */