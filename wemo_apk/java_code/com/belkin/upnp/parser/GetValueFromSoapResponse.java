package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.ValueFromSoapResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetValueFromSoapResponse
  extends DefaultHandler
{
  String ATTRIBUTE = "";
  boolean processValue = false;
  private StringBuffer responseBuffer;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.processValue == true) && (paramArrayOfChar[0] != '\n')) {
      this.responseBuffer.append(new String(paramArrayOfChar, paramInt1, paramInt2));
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
  
  public ValueFromSoapResponse parseGetValueFromSOAP(Object paramObject, String paramString)
  {
    this.responseBuffer = new StringBuffer();
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
      ValueFromSoapResponse localValueFromSoapResponse = (ValueFromSoapResponse)paramObject;
      if (this.responseBuffer != null) {
        localValueFromSoapResponse.setStrValue(this.responseBuffer.toString().trim());
      }
      return localValueFromSoapResponse;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetValueFromSoapResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */