package com.belkin.upnp.parser;

import org.xml.sax.helpers.DefaultHandler;

public class Parser
  extends DefaultHandler
{
  public static final int fetchRules = 17;
  public static final int getAPListResp = 1;
  public static final int getBinaryStateResp = 8;
  public static final int getCloseSetupResp = 3;
  public static final int getDBPath = 12;
  public static final int getDBVersion = 13;
  public static final int getFirmwareVersionResp = 6;
  public static final int getFriendlyNameResp = 4;
  public static final int getIconURLResp = 5;
  public static final int getMetaDataResp = 9;
  public static final int getNetworkListResp = 15;
  public static final int getNetworkStatusResp = 2;
  public static final int getRemoteAccessRegistrationResp = 10;
  public static final int getRemoteAccesspluginListResp = 11;
  public static final int getSignalStrengthResp = 14;
  public static final int getStatusResp = 7;
  public static final int getValueFromSOAP = 16;
  public static final int storeRules = 18;
  public static int uPnPActionCommands = 0;
  
  public void uPnPResponseParser(Object paramObject, int paramInt, String paramString)
  {
    switch (paramInt)
    {
    case 2: 
    case 3: 
    case 5: 
    case 7: 
    case 8: 
    case 10: 
    case 11: 
    case 16: 
    default: 
      return;
    case 4: 
      new GetFriendlyNameResponse().parseGetFriendlyNameResponse(paramObject, paramString);
      return;
    case 1: 
      new GetAPListResponse().parseForAPList(paramObject, paramString);
      return;
    case 15: 
      new GetAPListResponse().parseForNetworkList(paramObject, paramString);
      return;
    case 14: 
      new GetSignalStrengthResponse().parseForSignalStrength(paramObject, paramString);
      return;
    case 6: 
      new GetFirmwareResponse().parseGetFirmwareResponse(paramObject, paramString);
      return;
    case 9: 
      new GetMetaDataResponse().parseGetMetaDataResponse(paramObject, paramString);
      return;
    case 12: 
      new GetRulesDBPathResponse().parseGetRulesDBPathResponse(paramObject, paramString);
      return;
    case 13: 
      new GetRulesDBVersionResponse().parseGetRulesDBVersionResponse(paramObject, paramString);
      return;
    case 17: 
      new FetchRulesResponse().parseResponse(paramObject, paramString);
      return;
    }
    new StoreRulesResponse().parseResponse(paramObject, paramString);
  }
  
  public void uPnPResponseParserSOAP(Object paramObject, int paramInt, String paramString1, String paramString2)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    GetValueFromSoapResponse localGetValueFromSoapResponse = new GetValueFromSoapResponse();
    localGetValueFromSoapResponse.ATTRIBUTE = paramString2;
    localGetValueFromSoapResponse.parseGetValueFromSOAP(paramObject, paramString1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/Parser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */