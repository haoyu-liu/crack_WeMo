package com.belkin.upnp.parser;

import android.util.Xml;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetLedProfileIDResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "CapabilityProfileIDList";
  private JSONArray jsonArray;
  private JSONObject jsonObject;
  boolean processValue = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    String str = new String(paramArrayOfChar, paramInt1, paramInt2);
    if (this.processValue) {}
    try
    {
      this.jsonObject.put("CapabilityProfileIDList", str);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = false;
      this.jsonArray.put(this.jsonObject);
    }
  }
  
  public JSONArray parseProfileIdListResponse(String paramString)
  {
    this.jsonArray = new JSONArray();
    try
    {
      Xml.parse(paramString, this);
      return this.jsonArray;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = true;
      this.jsonObject = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetLedProfileIDResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */