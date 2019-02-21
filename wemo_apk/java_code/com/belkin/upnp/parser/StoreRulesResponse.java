package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class StoreRulesResponse
  extends DefaultHandler
{
  public static final String TAG = "StoreRulesResponse";
  boolean errorInfo = false;
  private JSONObject jsonObject = null;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    try
    {
      if (this.errorInfo)
      {
        this.jsonObject.put("errorInfo", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.errorInfo = false;
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
    if (paramString3.equals("errorInfo")) {
      this.errorInfo = false;
    }
  }
  
  public void parseResponse(Object paramObject, String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    LogUtils.infoLog("StoreRulesResponse", "Response str: " + str);
    this.jsonObject = ((JSONObject)paramObject);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      LogUtils.infoLog("StoreRulesResponse", "jsonObject: " + this.jsonObject);
      return;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        LogUtils.errorLog("StoreRulesResponse", "SAXException during XML parsing: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("errorInfo")) {
      this.errorInfo = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/StoreRulesResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */