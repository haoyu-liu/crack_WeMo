package org.cybergarage.upnp.ssdp;

import android.util.Log;
import java.net.DatagramSocket;
import java.util.Date;
import java.util.HashMap;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.device.USN;

public class SSDPSearchResponseSocket
  extends HTTPUSocket
  implements Runnable
{
  long SEARCH_EXPIRY_INTERVAL = 3000L;
  private ControlPoint controlPoint = null;
  private Thread deviceSearchResponseThread = null;
  HashMap<String, Date> udns = new HashMap();
  
  public SSDPSearchResponseSocket()
  {
    setControlPoint(null);
  }
  
  public SSDPSearchResponseSocket(String paramString, int paramInt)
  {
    super(paramString, paramInt);
    setControlPoint(null);
  }
  
  public ControlPoint getControlPoint()
  {
    return this.controlPoint;
  }
  
  public boolean post(String paramString, int paramInt, SSDPSearchRequest paramSSDPSearchRequest)
  {
    return post(paramString, paramInt, paramSSDPSearchRequest.toString());
  }
  
  public boolean post(String paramString, int paramInt, SSDPSearchResponse paramSSDPSearchResponse)
  {
    return post(paramString, paramInt, paramSSDPSearchResponse.getHeader());
  }
  
  public void run()
  {
    Thread localThread = Thread.currentThread();
    ControlPoint localControlPoint = getControlPoint();
    int i = 0;
    for (;;)
    {
      SSDPPacket localSSDPPacket;
      if (this.deviceSearchResponseThread == localThread)
      {
        i++;
        Thread.yield();
        localSSDPPacket = receive();
        if (localSSDPPacket == null) {
          Log.e("Discovery", "SSDP Packaet = Null");
        }
      }
      else
      {
        return;
      }
      if (localControlPoint != null)
      {
        String str1 = USN.getUDN(localSSDPPacket.getUSN());
        Log.i("Discovery", "Received the search response from IP : " + localSSDPPacket.getLocalAddress() + " udn: " + str1);
        if ((str1.contains("Controlee")) || (str1.contains("Socket")) || (str1.contains("Sensor")) || (str1.contains("Lightswitch")) || (str1.contains("NetCamSensor")) || (str1.contains("LinksysWNCSensor")) || (str1.contains("Insight")) || (str1.contains("Bridge")) || (str1.contains("Coffee")) || (str1.contains("Crockpot")) || (str1.contains("Maker")) || (str1.contains("Heater")) || (str1.contains("Purifier")) || (str1.contains("Humidifier")) || (str1.contains("Dimmer")))
        {
          Log.i("Discovery", "UDN of device found in discovery..   " + str1);
          String str2 = str1.trim();
          if ((this.udns.get(str2) == null) || (System.currentTimeMillis() - ((Date)this.udns.get(str2)).getTime() > this.SEARCH_EXPIRY_INTERVAL))
          {
            this.udns.put(str2, new Date());
            new Thread(new SearchResponsePacketProcessor(new SSDPPacket[] { localSSDPPacket })).start();
          }
        }
      }
    }
  }
  
  public void setControlPoint(ControlPoint paramControlPoint)
  {
    this.controlPoint = paramControlPoint;
  }
  
  public void start()
  {
    StringBuffer localStringBuffer = new StringBuffer("Cyber.SSDPSearchResponseSocket/");
    DatagramSocket localDatagramSocket = getDatagramSocket();
    if (localDatagramSocket.getLocalAddress() != null)
    {
      localStringBuffer.append(localDatagramSocket.getLocalAddress()).append(':');
      localStringBuffer.append(localDatagramSocket.getLocalPort());
    }
    this.deviceSearchResponseThread = new Thread(this, localStringBuffer.toString());
    this.deviceSearchResponseThread.start();
  }
  
  public void stop()
  {
    this.deviceSearchResponseThread = null;
  }
  
  public class SearchResponsePacketProcessor
    implements Runnable
  {
    private SSDPPacket[] packet;
    
    public SearchResponsePacketProcessor(SSDPPacket... paramVarArgs)
    {
      this.packet = paramVarArgs;
    }
    
    public void run()
    {
      Log.e("Discovery", "SSDP Packaet = Good ...Processing start@@@@@@@@@@");
      SSDPSearchResponseSocket.this.getControlPoint().searchResponseReceived(this.packet[0]);
      Log.e("Discovery", "SSDP Packaet = Good ...Processing end@@@@@@@@@@");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchResponseSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */