package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetAttributeListResponseParser
  extends DefaultHandler
{
  private static String TAG = "GetAttributeListResponseParser";
  private JSONArray jsonAllowedValueList = new JSONArray();
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
      if (paramString3.equalsIgnoreCase("dataType")) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("defaultValue")) {
        this.jsonAttribute.put("value", this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("attrAccessType")) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("allowedValue")) {
        this.jsonAllowedValueList.put(this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("allowedValueList")) {
        this.jsonAttribute.put(paramString3, this.jsonAllowedValueList);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public JSONObject parseGetAttributeListRespone(String paramString)
  {
    String str = paramString.replaceAll("&amp;lt;", "<").replaceAll("&amp;gt;", ">");
    Log.i(TAG, "GetAttributeListResponse str: " + str);
    this.jsonAttributeList = new JSONObject();
    if (str != null) {}
    try
    {
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetAttributeListResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */