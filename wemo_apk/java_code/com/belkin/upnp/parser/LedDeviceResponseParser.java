package com.belkin.upnp.parser;

import android.util.Xml;
import java.io.PrintStream;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class LedDeviceResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "ErrorDeviceIDs";
  private String LedDeviceStatus;
  private JSONObject jsonObject;
  private boolean processValue = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if (this.processValue == true)
    {
      this.LedDeviceStatus = new String(paramArrayOfChar, paramInt1, paramInt2);
      System.out.println("length:****" + this.LedDeviceStatus.length() + "----" + this.LedDeviceStatus);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    System.out.println("end element*************: " + paramString2 + "----" + paramString3);
    if (paramString2.equals(this.ATTRIBUTE)) {
      this.processValue = false;
    }
  }
  
  public JSONObject parseNetworkStatus(String paramString)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      Xml.parse(paramString, this);
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        try
        {
          JSONObject localJSONObject = this.jsonObject.put("GetAddLedDeviceStatus", true);
          return localJSONObject;
        }
        catch (JSONException localJSONException) {}
        localSAXException = localSAXException;
        localSAXException.printStackTrace();
      }
    }
    return this.jsonObject.put("GetAddLedDeviceStatus", false);
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = true;
      System.out.println("start element*************: " + paramString2 + "----" + paramString3);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/LedDeviceResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */