package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GenericGetAttributeResponseParser
  extends DefaultHandler
{
  private static String TAG = "GetAttributeResponseParser";
  private JSONObject jsonAttribute;
  private JSONObject jsonAttributeList;
  private String tmpValue;
  
  private boolean isNumeric(String paramString)
  {
    return paramString.matches("-?\\d+(\\.\\d+)?");
  }
  
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
      if (paramString3.equals("attribute"))
      {
        Object localObject = this.jsonAttribute.getString("value");
        JSONObject localJSONObject = this.jsonAttributeList;
        String str = this.jsonAttribute.getString("name");
        if (isNumeric((String)localObject)) {
          localObject = Integer.valueOf((int)Double.parseDouble((String)localObject));
        }
        localJSONObject.put(str, localObject);
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
  
  public JSONObject parseGetAttributeResponse(String paramString)
  {
    String str1 = paramString.replaceAll("&amp;lt;", "<").replaceAll("&amp;gt;", ">").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    String str2 = "<xml>" + str1 + "</xml>";
    Log.i(TAG, "GetAttributeResponse : " + str2);
    this.jsonAttributeList = new JSONObject();
    if (str2 != null) {}
    try
    {
      Xml.parse(str2, this);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GenericGetAttributeResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */