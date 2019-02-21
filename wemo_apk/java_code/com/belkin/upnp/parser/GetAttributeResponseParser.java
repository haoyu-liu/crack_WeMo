package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetAttributeResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE_MODE = "Mode";
  String ATTRIBUTE_MODETIME = "ModeTime";
  String ATTRIBUTE_TIME_REMAINING = "TimeRemaining";
  private JSONArray jsonArray;
  private JSONObject jsonObject;
  boolean modeTimeValue = false;
  boolean modeValue = false;
  boolean timeRemainingValue = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    String str = new String(paramArrayOfChar, paramInt1, paramInt2);
    try
    {
      if (this.modeValue) {
        this.jsonObject.put(JSONConstants.GET_MODE, str);
      }
      if (this.modeTimeValue) {
        this.jsonObject.put(JSONConstants.GET_MODETIME, str);
      }
      if (this.timeRemainingValue) {
        this.jsonObject.put(JSONConstants.GET_TIME_REMAINING, str);
      }
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
    if (paramString2.equals(this.ATTRIBUTE_MODE)) {
      this.modeValue = true;
    }
    if (paramString2.equals(this.ATTRIBUTE_MODETIME)) {
      this.modeTimeValue = true;
    }
    if (paramString2.equals(this.ATTRIBUTE_TIME_REMAINING))
    {
      this.timeRemainingValue = true;
      this.jsonArray.put(this.jsonObject);
    }
  }
  
  public JSONArray parseGetAttributeResponse(String paramString)
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
    if (paramString2.equals(this.ATTRIBUTE_MODE))
    {
      this.modeValue = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString2.equals(this.ATTRIBUTE_MODETIME)) {
      this.modeTimeValue = true;
    }
    if (paramString2.equals(this.ATTRIBUTE_TIME_REMAINING)) {
      this.timeRemainingValue = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetAttributeResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */