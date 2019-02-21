package com.belkin.upnp.parser;

import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetAttributeMakerParser
  extends DefaultHandler
{
  private static String TAG = "GetAttributeMakerParser";
  private JSONObject jsonAttribute;
  private JSONObject jsonAttributeList;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    try
    {
      if (paramString3.equals("attribute")) {
        this.jsonAttributeList.put(this.jsonAttribute.getString("name"), this.jsonAttribute);
      }
      if (paramString3.equalsIgnoreCase("name")) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("value")) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public JSONObject parseGetAttributeRespone(String paramString)
  {
    if (paramString != null) {}
    try
    {
      String str = paramString.replaceAll("&amp;lt;", "<").replaceAll("&amp;gt;", ">");
      this.jsonAttributeList = new JSONObject();
      Xml.parse(str, this);
      return this.jsonAttributeList;
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
    if (paramString3.equalsIgnoreCase("attribute")) {
      this.jsonAttribute = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetAttributeMakerParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */