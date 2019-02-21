package com.belkin.wemo.upnp.parser;

import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import org.xml.sax.helpers.DefaultHandler;

public class RMParser
  extends DefaultHandler
{
  public static final int FetchRules = 11;
  public static final int GetRulesDBPath = 2;
  public static final int GetRulesDBVersion = 1;
  public static final int StoreRules = 12;
  public static int uPnPActionCommands = 0;
  
  public void uPnPResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse, int paramInt, String paramString)
  {
    Object localObject = null;
    switch (paramInt)
    {
    }
    for (;;)
    {
      ((RMBaseUPNPResponseParser)localObject).parseResponse(paramString);
      return;
      localObject = new RMFetchRulesResponseParser(paramRMBaseUpnpResponse);
      continue;
      localObject = new RMStoreRulesResponseParser(paramRMBaseUpnpResponse);
      continue;
      localObject = new RMGetRulesDBVersionResponseParser(paramRMBaseUpnpResponse);
      continue;
      localObject = new RMGetRulesDBPathResponseParser(paramRMBaseUpnpResponse);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */