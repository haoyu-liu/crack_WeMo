package com.belkin.wemo.upnp.parser;

import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import com.belkin.wemo.upnp.response.RMStoreRulesResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class RMStoreRulesResponseParser
  extends RMBaseUPNPResponseParser
{
  boolean errorInfo = false;
  
  public RMStoreRulesResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse)
  {
    super(paramRMBaseUpnpResponse);
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.errorInfo)
    {
      ((RMStoreRulesResponse)this.responseObj).setErrorInfo(new String(paramArrayOfChar, paramInt1, paramInt2));
      this.errorInfo = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equals("errorInfo")) {
      this.errorInfo = false;
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("errorInfo")) {
      this.errorInfo = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMStoreRulesResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */