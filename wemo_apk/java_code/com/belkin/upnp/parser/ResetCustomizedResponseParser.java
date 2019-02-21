package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.ResetCustomizedResponseBean;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class ResetCustomizedResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "Status";
  boolean processValue = false;
  private StringBuffer responseBuffer;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if (this.processValue) {
      this.responseBuffer.append(paramArrayOfChar);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals(this.ATTRIBUTE)) {
      this.processValue = false;
    }
  }
  
  public ResetCustomizedResponseBean parseCustomizedResponse(String paramString)
  {
    ResetCustomizedResponseBean localResetCustomizedResponseBean = new ResetCustomizedResponseBean();
    this.responseBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      if (this.responseBuffer != null) {
        localResetCustomizedResponseBean.setCustomizedState(this.responseBuffer.toString().trim());
      }
      return localResetCustomizedResponseBean;
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
    if (paramString2.equals(this.ATTRIBUTE)) {
      this.processValue = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/ResetCustomizedResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */