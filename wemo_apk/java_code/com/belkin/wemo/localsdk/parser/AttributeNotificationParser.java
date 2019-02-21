package com.belkin.wemo.localsdk.parser;

import android.util.Log;
import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class AttributeNotificationParser
  extends DefaultHandler
{
  private static String TAG = "AttributeNotificationParser";
  private JSONObject jsonAttribute;
  private JSONObject jsonAttributeList;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (paramArrayOfChar.length > 0) {
      this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    try
    {
      boolean bool = paramString3.equalsIgnoreCase("attribute");
      if (bool) {}
      try
      {
        if (this.jsonAttribute.has("name"))
        {
          String str = this.jsonAttribute.getString("name");
          if ((str != null) && (!str.equals("")) && (!str.equals(null))) {
            this.jsonAttributeList.put(str, this.jsonAttribute);
          }
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
      Log.e(TAG, "Attribute end  " + this.jsonAttributeList.toString());
      if ((paramString3.equalsIgnoreCase("name")) && (this.tmpValue != null) && (!this.tmpValue.equals("")) && (!this.tmpValue.equals(null))) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if ((paramString3.equalsIgnoreCase("value")) && (this.tmpValue != null) && (!this.tmpValue.equals("")) && (!this.tmpValue.equals(null))) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if ((paramString3.equalsIgnoreCase("prevvalue")) && (this.tmpValue != null) && (!this.tmpValue.equals("")) && (!this.tmpValue.equals(null))) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      if ((paramString3.equalsIgnoreCase("ts")) && (this.tmpValue != null) && (!this.tmpValue.equals("")) && (!this.tmpValue.equals(null)))
      {
        this.jsonAttribute.put(paramString3, this.tmpValue);
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public JSONObject parseAttributeRespone(String paramString)
  {
    this.jsonAttributeList = new JSONObject();
    if (paramString != null) {}
    try
    {
      if (!paramString.equals(""))
      {
        Log.i(TAG + ".parseAttributeRespone", "Response For Parsing " + paramString);
        Xml.parse(paramString, this);
      }
      return this.jsonAttributeList;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        Log.e(TAG + ".parseAttributeRespone", "Exception is " + localSAXException.toString());
        localSAXException.printStackTrace();
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("attribute"))
    {
      Log.v(TAG, "Attribute element present ");
      this.jsonAttribute = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/AttributeNotificationParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */