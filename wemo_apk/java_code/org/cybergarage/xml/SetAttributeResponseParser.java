package org.cybergarage.xml;

import android.util.Xml;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SetAttributeResponseParser
  extends DefaultHandler
{
  private boolean isSuccess = false;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equals("attributeList"))
    {
      if (this.tmpValue.equals("0")) {
        this.isSuccess = true;
      }
    }
    else {
      return;
    }
    this.isSuccess = false;
  }
  
  public boolean parseSetAttributeRespone(String paramString)
  {
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
      return this.isSuccess;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/SetAttributeResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */