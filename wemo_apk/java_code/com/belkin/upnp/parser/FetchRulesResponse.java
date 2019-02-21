package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class FetchRulesResponse
  extends DefaultHandler
{
  public static final String TAG = "FetchRulesResponse";
  boolean errorCode = false;
  JSONObject jsonObject = null;
  boolean ruleDbPath = false;
  boolean ruleDbVersion = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    try
    {
      if (this.ruleDbPath)
      {
        this.jsonObject.put("ruleDbPath", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.ruleDbPath = false;
        return;
      }
      if (this.ruleDbVersion)
      {
        this.jsonObject.put("ruleDbVersion", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.ruleDbVersion = false;
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    if (this.errorCode)
    {
      this.jsonObject.put("errorCode", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.errorCode = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("ruleDbPath")) {
      this.ruleDbPath = false;
    }
    do
    {
      return;
      if (paramString2.equals("ruleDbVersion"))
      {
        this.ruleDbVersion = false;
        return;
      }
    } while (!paramString2.equals("errorCode"));
    this.errorCode = false;
  }
  
  public void parseResponse(Object paramObject, String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    LogUtils.infoLog("FetchRulesResponse", "response str: " + str);
    this.jsonObject = ((JSONObject)paramObject);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      LogUtils.infoLog("FetchRulesResponse", "jsonObject: " + this.jsonObject);
      return;
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
    if (paramString3.equals("ruleDbPath")) {
      this.ruleDbPath = true;
    }
    do
    {
      return;
      if (paramString3.equals("ruleDbVersion"))
      {
        this.ruleDbVersion = true;
        return;
      }
    } while (!paramString3.equals("errorCode"));
    this.errorCode = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/FetchRulesResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */