package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.CloseSetupResponseBean;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class CloseSetupResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "status";
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
  
  public CloseSetupResponseBean parseCloseSetupResponse(String paramString)
  {
    CloseSetupResponseBean localCloseSetupResponseBean = new CloseSetupResponseBean();
    this.responseBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      if (this.responseBuffer != null) {
        localCloseSetupResponseBean.setCloseSetupStatus(this.responseBuffer.toString().trim());
      }
      return localCloseSetupResponseBean;
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/CloseSetupResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */