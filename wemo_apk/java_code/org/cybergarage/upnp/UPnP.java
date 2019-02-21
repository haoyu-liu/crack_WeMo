package org.cybergarage.upnp;

import org.cybergarage.net.HostInterface;
import org.cybergarage.soap.SOAP;
import org.cybergarage.upnp.ssdp.SSDP;
import org.cybergarage.util.Debug;
import org.cybergarage.xml.Parser;

public class UPnP
{
  public static final int DEFAULT_EXPIRED_DEVICE_EXTRA_TIME = 60;
  public static final int DEFAULT_TTL = 4;
  public static final String INMPR03 = "INMPR03";
  public static final int INMPR03_DISCOVERY_OVER_WIRELESS_COUNT = 4;
  public static final String INMPR03_VERSION = "1.0";
  public static final String NAME = "CyberLinkJava";
  public static final int SERVER_RETRY_COUNT = 100;
  public static final int USE_IPV6_ADMINISTRATIVE_SCOPE = 5;
  public static final int USE_IPV6_GLOBAL_SCOPE = 7;
  public static final int USE_IPV6_LINK_LOCAL_SCOPE = 3;
  public static final int USE_IPV6_SITE_LOCAL_SCOPE = 6;
  public static final int USE_IPV6_SUBNET_SCOPE = 4;
  public static final int USE_LOOPBACK_ADDR = 2;
  public static final int USE_ONLY_IPV4_ADDR = 9;
  public static final int USE_ONLY_IPV6_ADDR = 1;
  public static final int USE_SSDP_SEARCHRESPONSE_MULTIPLE_INTERFACES = 8;
  public static final String VERSION = "1.8";
  public static final String XML_CLASS_PROPERTTY = "cyberlink.upnp.xml.parser";
  public static final String XML_DECLARATION = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
  private static int timeToLive = 4;
  private static Parser xmlParser;
  
  static
  {
    setTimeToLive(4);
  }
  
  public static final String createUUID()
  {
    long l1 = System.currentTimeMillis();
    long l2 = (System.currentTimeMillis() * Math.random());
    return toUUID((int)(l1 & 0xFFFF)) + "-" + toUUID(0xFFFF & (int)(0xA000 | l1 >> 32)) + "-" + toUUID((int)(l2 & 0xFFFF)) + "-" + toUUID(0xFFFF & (int)(0xE000 | l2 >> 32));
  }
  
  public static final String getServerName()
  {
    String str1 = System.getProperty("os.name");
    String str2 = System.getProperty("os.version");
    return str1 + "/" + str2 + " UPnP/1.0 " + "CyberLinkJava" + "/" + "1.8";
  }
  
  public static final int getTimeToLive()
  {
    return timeToLive;
  }
  
  public static final Parser getXMLParser()
  {
    if (xmlParser == null)
    {
      xmlParser = loadDefaultXMLParser();
      if (xmlParser == null) {
        throw new RuntimeException("No XML parser defined. And unable to laod any. \nTry to invoke UPnP.setXMLParser before UPnP.getXMLParser");
      }
      SOAP.setXMLParser(xmlParser);
    }
    return xmlParser;
  }
  
  public static final void initialize() {}
  
  public static final boolean isEnabled(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return false;
    case 1: 
      return HostInterface.USE_ONLY_IPV6_ADDR;
    case 9: 
      return HostInterface.USE_ONLY_IPV4_ADDR;
    }
    return HostInterface.USE_LOOPBACK_ADDR;
  }
  
  private static Parser loadDefaultXMLParser()
  {
    String[] arrayOfString = new String[5];
    arrayOfString[0] = System.getProperty("cyberlink.upnp.xml.parser");
    arrayOfString[1] = "org.cybergarage.xml.parser.XmlPullParser";
    arrayOfString[2] = "org.cybergarage.xml.parser.JaxpParser";
    arrayOfString[3] = "org.cybergarage.xml.parser.kXML2Parser";
    arrayOfString[4] = "org.cybergarage.xml.parser.XercesParser";
    int i = 0;
    if (i < arrayOfString.length)
    {
      if (arrayOfString[i] == null) {}
      for (;;)
      {
        i++;
        break;
        try
        {
          Parser localParser = (Parser)Class.forName(arrayOfString[i]).newInstance();
          return localParser;
        }
        catch (Throwable localThrowable)
        {
          Debug.warning("Unable to load " + arrayOfString[i] + " as XMLParser due to " + localThrowable);
        }
      }
    }
    return null;
  }
  
  public static final void setDisable(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 1: 
      HostInterface.USE_ONLY_IPV6_ADDR = false;
      return;
    case 9: 
      HostInterface.USE_ONLY_IPV4_ADDR = false;
      return;
    }
    HostInterface.USE_LOOPBACK_ADDR = false;
  }
  
  public static final void setEnable(int paramInt)
  {
    switch (paramInt)
    {
    case 8: 
    default: 
      return;
    case 1: 
      HostInterface.USE_ONLY_IPV6_ADDR = true;
      return;
    case 9: 
      HostInterface.USE_ONLY_IPV4_ADDR = true;
      return;
    case 2: 
      HostInterface.USE_LOOPBACK_ADDR = true;
      return;
    case 3: 
      SSDP.setIPv6Address("FF02::C");
      return;
    case 4: 
      SSDP.setIPv6Address("FF03::C");
      return;
    case 5: 
      SSDP.setIPv6Address("FF04::C");
      return;
    case 6: 
      SSDP.setIPv6Address("FF05::C");
      return;
    }
    SSDP.setIPv6Address("FF0E::C");
  }
  
  public static final void setTimeToLive(int paramInt)
  {
    timeToLive = paramInt;
  }
  
  public static final void setXMLParser(Parser paramParser)
  {
    xmlParser = paramParser;
    SOAP.setXMLParser(paramParser);
  }
  
  private static final String toUUID(int paramInt)
  {
    String str1 = Integer.toString(0xFFFF & paramInt, 16);
    int i = str1.length();
    String str2 = "";
    for (int j = 0; j < 4 - i; j++) {
      str2 = str2 + "0";
    }
    return str2 + str1;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/UPnP.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */