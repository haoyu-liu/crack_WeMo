package org.cybergarage.upnp.ssdp;

import android.os.AsyncTask;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.localsdk.WeMoDevice;
import java.io.IOException;
import java.net.InetAddress;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.device.USN;
import org.cybergarage.util.Debug;

public class SSDPNotifySocket
  extends HTTPMUSocket
  implements Runnable
{
  private static final String TAG = SSDPNotifySocket.class.getSimpleName();
  private ControlPoint controlPoint = null;
  private Thread deviceNotifyThread = null;
  private boolean useIPv6Address;
  
  public SSDPNotifySocket(String paramString)
  {
    String str = "239.255.255.250";
    this.useIPv6Address = false;
    if (HostInterface.isIPv6Address(paramString) == true)
    {
      str = SSDP.getIPv6Address();
      this.useIPv6Address = true;
    }
    open(str, 1900, paramString);
    setControlPoint(null);
  }
  
  public ControlPoint getControlPoint()
  {
    return this.controlPoint;
  }
  
  public boolean post(SSDPNotifyRequest paramSSDPNotifyRequest)
  {
    String str = "239.255.255.250";
    if (this.useIPv6Address == true) {
      str = SSDP.getIPv6Address();
    }
    paramSSDPNotifyRequest.setHost(str, 1900);
    return post(paramSSDPNotifyRequest);
  }
  
  public void run()
  {
    for (;;)
    {
      ControlPoint localControlPoint;
      SSDPPacket localSSDPPacket;
      try
      {
        Thread localThread = Thread.currentThread();
        localControlPoint = getControlPoint();
        if (this.deviceNotifyThread == localThread) {
          Thread.yield();
        }
      }
      catch (Exception localException)
      {
        try
        {
          localSSDPPacket = receive();
          if ((localSSDPPacket == null) || (new String(localSSDPPacket.getData()).indexOf("ssdp:discover") != -1) || (!WeMoDevice.isValid(USN.getUDN(localSSDPPacket.getUSN())))) {
            continue;
          }
          InetAddress localInetAddress1 = getMulticastInetAddress();
          InetAddress localInetAddress2 = localSSDPPacket.getHostInetAddress();
          if (localInetAddress1.equals(localInetAddress2)) {
            break label139;
          }
          Debug.warning("Invalidate Multicast Recieved from IP " + localInetAddress1 + " on " + localInetAddress2);
        }
        catch (IOException localIOException)
        {
          return;
        }
        localException = localException;
        SDKLogUtils.errorLog(TAG, "Exception: ", localException);
      }
      return;
      label139:
      if (localControlPoint != null) {
        new NotifyResponsePacketProcessor(null).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new SSDPPacket[] { localSSDPPacket });
      }
    }
  }
  
  public void setControlPoint(ControlPoint paramControlPoint)
  {
    this.controlPoint = paramControlPoint;
  }
  
  public void start()
  {
    try
    {
      StringBuffer localStringBuffer = new StringBuffer("Cyber.SSDPNotifySocket/");
      String str = getLocalAddress();
      if ((str != null) && (str.length() > 0))
      {
        localStringBuffer.append(getLocalAddress()).append(':');
        localStringBuffer.append(getLocalPort()).append(" -> ");
        localStringBuffer.append(getMulticastAddress()).append(':');
        localStringBuffer.append(getMulticastPort());
      }
      this.deviceNotifyThread = new Thread(this, localStringBuffer.toString());
      this.deviceNotifyThread.start();
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception in start() method: ", localException);
    }
  }
  
  public void stop()
  {
    close();
    this.deviceNotifyThread = null;
  }
  
  private class NotifyResponsePacketProcessor
    extends AsyncTask<SSDPPacket, Object, Object>
  {
    private NotifyResponsePacketProcessor() {}
    
    protected Object doInBackground(SSDPPacket... paramVarArgs)
    {
      ControlPoint localControlPoint = SSDPNotifySocket.this.getControlPoint();
      try
      {
        localControlPoint.notifyReceived(paramVarArgs[0]);
        return null;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog(SSDPNotifySocket.TAG, "Exception: ", localException);
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPNotifySocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */