package com.belkin.wemo.localsdk.parser;

import org.xml.sax.helpers.DefaultHandler;

public class Parser
  extends DefaultHandler
{
  public static final int getDBPath = 12;
  public static int uPnPActionCommands = 0;
  
  public void uPnPResponseParser(Object paramObject, int paramInt, String paramString)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    new GetRulesDBPathResponse().parseGetRulesDBPathResponse(paramObject, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/Parser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */