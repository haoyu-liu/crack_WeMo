package org.cybergarage.upnp.ssdp;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.net.InetAddress;
import java.util.Vector;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.ControlPoint;

public class SSDPSearchResponseSocketList
  extends Vector
{
  private static final String TAG = SSDPSearchResponseSocketList.class.getSimpleName();
  private InetAddress[] binds = null;
  
  public SSDPSearchResponseSocketList() {}
  
  public SSDPSearchResponseSocketList(InetAddress[] paramArrayOfInetAddress)
  {
    this.binds = paramArrayOfInetAddress;
  }
  
  public void close()
  {
    int i = size();
    int j = 0;
    for (;;)
    {
      if (j < i) {
        try
        {
          getSSDPSearchResponseSocket(j).close();
          j++;
        }
        catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
        {
          SDKLogUtils.errorLog(TAG, "Exception: ", localArrayIndexOutOfBoundsException);
        }
      }
    }
    clear();
  }
  
  public SSDPSearchResponseSocket getSSDPSearchResponseSocket(int paramInt)
  {
    return (SSDPSearchResponseSocket)get(paramInt);
  }
  
  public boolean open()
  {
    return open(1900);
  }
  
  public boolean open(int paramInt)
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
    try
    {
      while (k < arrayOfString.length)
      {
        add(new SSDPSearchResponseSocket(arrayOfString[k], paramInt));
        k++;
      }
      return true;
    }
    catch (Exception localException)
    {
      stop();
      close();
      clear();
      return false;
    }
  }
  
  public boolean post(SSDPSearchRequest paramSSDPSearchRequest)
  {
    bool1 = true;
    int i = size();
    try
    {
      SDKLogUtils.debugLog(TAG, "post() Number of Sockets: " + i);
      for (int j = 0; j < i; j++)
      {
        SSDPSearchResponseSocket localSSDPSearchResponseSocket = getSSDPSearchResponseSocket(j);
        String str1 = localSSDPSearchResponseSocket.getLocalAddress();
        paramSSDPSearchRequest.setLocalAddress(str1);
        String str2 = "239.255.255.250";
        if (HostInterface.isIPv6Address(str1) == true) {
          str2 = SSDP.getIPv6Address();
        }
        boolean bool2 = localSSDPSearchResponseSocket.post(str2, 1900, paramSSDPSearchRequest);
        if (!bool2) {
          bool1 = false;
        }
      }
      return bool1;
    }
    catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
    {
      SDKLogUtils.errorLog(TAG, "Exception: ", localArrayIndexOutOfBoundsException);
    }
  }
  
  public void setControlPoint(ControlPoint paramControlPoint)
  {
    int i = size();
    int j = 0;
    for (;;)
    {
      if (j < i) {
        try
        {
          getSSDPSearchResponseSocket(j).setControlPoint(paramControlPoint);
          j++;
        }
        catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
        {
          SDKLogUtils.errorLog(TAG, "Exception: ", localArrayIndexOutOfBoundsException);
        }
      }
    }
  }
  
  public void start()
  {
    int i = size();
    int j = 0;
    for (;;)
    {
      if (j < i) {
        try
        {
          getSSDPSearchResponseSocket(j).start();
          j++;
        }
        catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
        {
          SDKLogUtils.errorLog(TAG, "Exception: ", localArrayIndexOutOfBoundsException);
        }
      }
    }
  }
  
  public void stop()
  {
    int i = size();
    int j = 0;
    for (;;)
    {
      if (j < i) {
        try
        {
          getSSDPSearchResponseSocket(j).stop();
          j++;
        }
        catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
        {
          SDKLogUtils.errorLog(TAG, "Exception: ", localArrayIndexOutOfBoundsException);
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */