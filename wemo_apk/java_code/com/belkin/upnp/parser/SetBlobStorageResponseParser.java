package com.belkin.upnp.parser;

import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SetBlobStorageResponseParser
  extends DefaultHandler
{
  private JSONObject jsonAttribute;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equals("attributeList")) {
      try
      {
        if (this.tmpValue.equals("0"))
        {
          this.jsonAttribute.put(paramString3, true);
          return;
        }
        this.jsonAttribute.put(paramString3, false);
        return;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  public JSONObject parseSetlobStorageRespone(String paramString)
  {
    this.jsonAttribute = new JSONObject();
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
      return this.jsonAttribute;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/SetBlobStorageResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */