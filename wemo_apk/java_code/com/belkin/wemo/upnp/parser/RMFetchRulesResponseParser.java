package com.belkin.wemo.upnp.parser;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import com.belkin.wemo.upnp.response.RMFetchRulesResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

public class RMFetchRulesResponseParser
  extends RMBaseUPNPResponseParser
{
  boolean errorCode = false;
  boolean ruleDbPath = false;
  boolean ruleDbVersion = false;
  
  public RMFetchRulesResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse)
  {
    super(paramRMBaseUpnpResponse);
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.ruleDbPath)
    {
      ((RMFetchRulesResponse)this.responseObj).setRuleDBPath(new String(paramArrayOfChar, paramInt1, paramInt2));
      this.ruleDbPath = false;
    }
    do
    {
      return;
      try
      {
        if (this.ruleDbVersion)
        {
          ((RMFetchRulesResponse)this.responseObj).setRuleDBVersion(Integer.valueOf(new String(paramArrayOfChar, paramInt1, paramInt2)).intValue());
          this.ruleDbVersion = false;
          return;
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        SDKLogUtils.errorLog(this.TAG, "NumberFormatException during XML parsing for uPnP response: ", localNumberFormatException);
        return;
      }
    } while (!this.errorCode);
    ((RMFetchRulesResponse)this.responseObj).setErrorCode(Integer.valueOf(new String(paramArrayOfChar, paramInt1, paramInt2)).intValue());
    this.errorCode = false;
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("ruleDbPath")) {
      this.ruleDbPath = false;
    }
    do
    {
      return;
      if (paramString2.equals("ruleDbVersion"))
      {
        this.ruleDbVersion = false;
        return;
      }
    } while (!paramString2.equals("errorCode"));
    this.errorCode = false;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("ruleDbPath")) {
      this.ruleDbPath = true;
    }
    do
    {
      return;
      if (paramString3.equals("ruleDbVersion"))
      {
        this.ruleDbVersion = true;
        return;
      }
    } while (!paramString3.equals("errorCode"));
    this.errorCode = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMFetchRulesResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */