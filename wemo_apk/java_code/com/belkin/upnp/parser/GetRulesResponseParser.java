package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetRulesResponseParser
  extends DefaultHandler
{
  private static String TAG = "GetRulesResponseParser";
  private JSONObject jsonRule;
  private JSONObject jsonRuleList;
  private String tmpValue = "";
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue += new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    try
    {
      if (paramString3.equals("ruleList"))
      {
        this.tmpValue = this.tmpValue.replaceAll("&lt;", "<");
        this.tmpValue = this.tmpValue.replaceAll("&gt;", ">");
        this.jsonRuleList.put(paramString3, this.tmpValue);
        this.tmpValue = "";
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public JSONObject parseGetRulesResponse(String paramString)
  {
    Log.i(TAG, "GetRulesResponse : " + paramString);
    this.jsonRuleList = new JSONObject();
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
      return this.jsonRuleList;
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
    if (paramString3.equalsIgnoreCase("ruleList")) {
      this.jsonRule = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetRulesResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */