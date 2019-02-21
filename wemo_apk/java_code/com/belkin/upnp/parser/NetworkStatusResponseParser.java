package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.NetworkStatusResponseBean;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class NetworkStatusResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "NetworkStatus";
  private int parseField = 1;
  boolean processValue = false;
  private StringBuffer responseBuffer;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.processValue) && (this.parseField % 2 == 0)) {
      this.responseBuffer.append(paramArrayOfChar);
    }
    this.parseField = (1 + this.parseField);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals(this.ATTRIBUTE)) {
      this.processValue = false;
    }
  }
  
  public NetworkStatusResponseBean parseNetworkStatus(String paramString)
  {
    this.responseBuffer = new StringBuffer();
    NetworkStatusResponseBean localNetworkStatusResponseBean = new NetworkStatusResponseBean();
    try
    {
      Xml.parse(paramString, this);
      if (this.responseBuffer != null) {
        localNetworkStatusResponseBean.setStatus(Integer.parseInt(this.responseBuffer.toString().trim()));
      }
      return localNetworkStatusResponseBean;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = true;
      this.parseField = 0;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/NetworkStatusResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */