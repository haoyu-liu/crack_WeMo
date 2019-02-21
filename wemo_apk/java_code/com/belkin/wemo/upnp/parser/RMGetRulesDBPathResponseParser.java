package com.belkin.wemo.upnp.parser;

import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import com.belkin.wemo.upnp.response.RMRulesDBPathResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class RMGetRulesDBPathResponseParser
  extends RMBaseUPNPResponseParser
{
  boolean rulesDbPath = false;
  
  public RMGetRulesDBPathResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse)
  {
    super(paramRMBaseUpnpResponse);
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.rulesDbPath)
    {
      ((RMRulesDBPathResponse)this.responseObj).setRulesDBPath(new String(paramArrayOfChar, paramInt1, paramInt2));
      this.rulesDbPath = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("RulesDBPath")) {
      this.rulesDbPath = false;
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("RulesDBPath")) {
      this.rulesDbPath = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMGetRulesDBPathResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */