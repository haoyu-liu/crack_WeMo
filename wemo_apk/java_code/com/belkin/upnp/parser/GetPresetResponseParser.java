package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetPresetResponseParser
  extends DefaultHandler
{
  public static final String TAG = "GetPresetResponseParser";
  boolean hasValues = false;
  private JSONObject jsonAttributeList;
  private JSONObject jsonList;
  private JSONArray presetArray;
  String tmpValue = null;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
    LogUtils.infoLog("GetPresetResponseParser", "characters tmpValue: " + this.tmpValue);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    LogUtils.infoLog("GetPresetResponseParser", "endElement qName: " + paramString3);
    try
    {
      if (paramString3.equalsIgnoreCase("preset"))
      {
        this.jsonList.put(paramString3, this.presetArray);
        return;
      }
      if (paramString3.equalsIgnoreCase("isGroupID"))
      {
        this.jsonList.put(paramString3, this.tmpValue);
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    if (paramString3.equalsIgnoreCase("id"))
    {
      this.jsonList.put(paramString3, this.tmpValue);
      return;
    }
    if (paramString3.equalsIgnoreCase("version"))
    {
      this.jsonList.put(paramString3, this.tmpValue);
      return;
    }
    if (paramString3.equalsIgnoreCase("name"))
    {
      this.jsonAttributeList.put(paramString3, this.tmpValue);
      return;
    }
    if (paramString3.equalsIgnoreCase("value"))
    {
      this.jsonAttributeList.put(paramString3, this.tmpValue);
      return;
    }
    if (paramString3.equalsIgnoreCase("type"))
    {
      this.jsonAttributeList.put(paramString3, this.tmpValue);
      this.presetArray.put(this.jsonAttributeList);
    }
  }
  
  public String parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&amp;", "&").replaceAll("&quot;", "\"").replaceAll("&apos;", "'");
    LogUtils.infoLog("GetPresetResponseParser", "Response str: " + str);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      LogUtils.infoLog("GetPresetResponseParser", "jsonList: " + this.jsonList.toString());
      return this.jsonList.toString();
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        LogUtils.errorLog("GetPresetResponseParser", "SAXException: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    LogUtils.infoLog("GetPresetResponseParser", "startElement qName: " + paramString3);
    this.tmpValue = "";
    if (paramString3.equals("devicePreset"))
    {
      this.jsonList = new JSONObject();
      this.presetArray = new JSONArray();
    }
    while (!paramString3.equalsIgnoreCase("preset")) {
      return;
    }
    this.jsonAttributeList = new JSONObject();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetPresetResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */