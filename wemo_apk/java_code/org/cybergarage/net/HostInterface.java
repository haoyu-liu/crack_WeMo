package org.cybergarage.net;

import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;
import org.cybergarage.util.Debug;

public class HostInterface
{
  public static final int IPV4_BITMASK = 1;
  public static final int IPV6_BITMASK = 16;
  public static final int LOCAL_BITMASK = 256;
  public static boolean USE_LOOPBACK_ADDR = false;
  public static boolean USE_ONLY_IPV4_ADDR = true;
  public static boolean USE_ONLY_IPV6_ADDR = false;
  private static String ifAddress = "";
  
  public static final String getHostAddress(int paramInt)
  {
    if (hasAssignedInterface() == true) {
      return getInterface();
    }
    int i = 0;
    try
    {
      Enumeration localEnumeration1 = NetworkInterface.getNetworkInterfaces();
      while (localEnumeration1.hasMoreElements())
      {
        Enumeration localEnumeration2 = ((NetworkInterface)localEnumeration1.nextElement()).getInetAddresses();
        InetAddress localInetAddress;
        while (localEnumeration2.hasMoreElements())
        {
          localInetAddress = (InetAddress)localEnumeration2.nextElement();
          if (isUsableAddress(localInetAddress))
          {
            if (i >= paramInt) {
              break label81;
            }
            i++;
          }
        }
        continue;
        label81:
        String str = localInetAddress.getHostAddress();
        return str;
      }
    }
    catch (Exception localException) {}
    return "";
  }
  
  public static final String getHostURL(String paramString1, int paramInt, String paramString2)
  {
    String str = paramString1;
    if (isIPv6Address(paramString1) == true) {
      str = "[" + paramString1 + "]";
    }
    return "http://" + str + ":" + Integer.toString(paramInt) + paramString2;
  }
  
  public static final String getIPv4Address()
  {
    int i = getNHostAddresses();
    for (int j = 0; j < i; j++)
    {
      String str = getHostAddress(j);
      if (isIPv4Address(str) == true) {
        return str;
      }
    }
    return "";
  }
  
  public static final String getIPv6Address()
  {
    int i = getNHostAddresses();
    for (int j = 0; j < i; j++)
    {
      String str = getHostAddress(j);
      if (isIPv6Address(str) == true) {
        return str;
      }
    }
    return "";
  }
  
  public static final InetAddress[] getInetAddress(int paramInt, String[] paramArrayOfString)
  {
    Object localObject;
    ArrayList localArrayList;
    if (paramArrayOfString != null)
    {
      Vector localVector = new Vector();
      int i = 0;
      while (i < paramArrayOfString.length) {
        try
        {
          NetworkInterface localNetworkInterface = NetworkInterface.getByName(paramArrayOfString[i]);
          if (localNetworkInterface != null) {
            localVector.add(localNetworkInterface);
          }
          i++;
        }
        catch (SocketException localSocketException1)
        {
          for (;;) {}
        }
      }
      localObject = localVector.elements();
      localArrayList = new ArrayList();
    }
    label194:
    for (;;)
    {
      if (!((Enumeration)localObject).hasMoreElements()) {
        break label196;
      }
      Enumeration localEnumeration1 = ((NetworkInterface)((Enumeration)localObject).nextElement()).getInetAddresses();
      for (;;)
      {
        if (!localEnumeration1.hasMoreElements()) {
          break label194;
        }
        InetAddress localInetAddress = (InetAddress)localEnumeration1.nextElement();
        if (((paramInt & 0x100) != 0) || (!localInetAddress.isLoopbackAddress()))
        {
          if (((paramInt & 0x1) != 0) && ((localInetAddress instanceof Inet4Address)))
          {
            localArrayList.add(localInetAddress);
            continue;
            try
            {
              Enumeration localEnumeration2 = NetworkInterface.getNetworkInterfaces();
              localObject = localEnumeration2;
            }
            catch (SocketException localSocketException2)
            {
              return null;
            }
          }
          if (((paramInt & 0x10) != 0) && ((localInetAddress instanceof InetAddress))) {
            localArrayList.add(localInetAddress);
          }
        }
      }
    }
    label196:
    return (InetAddress[])localArrayList.toArray(new InetAddress[0]);
  }
  
  public static final String getInterface()
  {
    return ifAddress;
  }
  
  public static final int getNHostAddresses()
  {
    i = 1;
    if (hasAssignedInterface() == i) {}
    for (;;)
    {
      return i;
      i = 0;
      try
      {
        Enumeration localEnumeration1 = NetworkInterface.getNetworkInterfaces();
        while (localEnumeration1.hasMoreElements())
        {
          Enumeration localEnumeration2 = ((NetworkInterface)localEnumeration1.nextElement()).getInetAddresses();
          while (localEnumeration2.hasMoreElements())
          {
            boolean bool = isUsableAddress((InetAddress)localEnumeration2.nextElement());
            if (bool) {
              i++;
            }
          }
        }
        return i;
      }
      catch (Exception localException)
      {
        Debug.warning(localException);
      }
    }
  }
  
  private static final boolean hasAssignedInterface()
  {
    return ifAddress.length() > 0;
  }
  
  public static final boolean hasIPv4Addresses()
  {
    int i = getNHostAddresses();
    for (int j = 0; j < i; j++) {
      if (isIPv4Address(getHostAddress(j)) == true) {
        return true;
      }
    }
    return false;
  }
  
  public static final boolean hasIPv6Addresses()
  {
    int i = getNHostAddresses();
    for (int j = 0; j < i; j++) {
      if (isIPv6Address(getHostAddress(j)) == true) {
        return true;
      }
    }
    return false;
  }
  
  public static final boolean isIPv4Address(String paramString)
  {
    try
    {
      boolean bool1 = InetAddress.getByName(paramString) instanceof Inet4Address;
      boolean bool2 = false;
      if (bool1) {
        bool2 = true;
      }
      return bool2;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public static final boolean isIPv6Address(String paramString)
  {
    try
    {
      boolean bool1 = InetAddress.getByName(paramString) instanceof Inet6Address;
      boolean bool2 = false;
      if (bool1) {
        bool2 = true;
      }
      return bool2;
    }
    catch (Exception localException) {}
    return false;
  }
  
  private static final boolean isUsableAddress(InetAddress paramInetAddress)
  {
    if ((!USE_LOOPBACK_ADDR) && (paramInetAddress.isLoopbackAddress() == true)) {}
    while (((USE_ONLY_IPV4_ADDR == true) && ((paramInetAddress instanceof Inet6Address))) || ((USE_ONLY_IPV6_ADDR == true) && ((paramInetAddress instanceof Inet4Address)))) {
      return false;
    }
    return true;
  }
  
  public static final void setInterface(String paramString)
  {
    ifAddress = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/net/HostInterface.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */