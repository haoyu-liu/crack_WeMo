package com.belkin.wemo.upnp.parser;

import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import com.belkin.wemo.upnp.response.RMRulesDBVersionResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class RMGetRulesDBVersionResponseParser
  extends RMBaseUPNPResponseParser
{
  boolean ruleDbVersion = false;
  
  public RMGetRulesDBVersionResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse)
  {
    super(paramRMBaseUpnpResponse);
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.ruleDbVersion)
    {
      ((RMRulesDBVersionResponse)this.responseObj).setRulesDBVersion(new String(paramArrayOfChar, paramInt1, paramInt2));
      this.ruleDbVersion = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString2.equals("ruleDbVersion")) {
      this.ruleDbVersion = false;
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("RulesDBVersion")) {
      this.ruleDbVersion = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */