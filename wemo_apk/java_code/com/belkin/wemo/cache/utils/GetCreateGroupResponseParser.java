package com.belkin.wemo.cache.utils;

import android.util.Xml;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetCreateGroupResponseParser
  extends DefaultHandler
{
  String ATTRIBUTE = "RespCreateGroup";
  String ATTRIBUTE_DELETERESPONSE = "ResponseStatus";
  String ATTRIBUTE_FRIENDLYNAME = "Status";
  private final String TAG = "GetCreateGroupResponseParser";
  boolean deleteGroupValue = false;
  private JSONArray jsonArray;
  private JSONObject jsonObject;
  boolean processFriendlyValue = false;
  boolean processValue = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    String str = new String(paramArrayOfChar, paramInt1, paramInt2);
    try
    {
      if (this.processValue) {
        this.jsonObject.put("GetCreateGroupResponse", str);
      }
      if (this.processFriendlyValue) {
        this.jsonObject.put("GetFriendlyNameResponse", str);
      }
      if (this.deleteGroupValue) {
        this.jsonObject.put("GetDeleteResponse", str);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("GetCreateGroupResponseParser", "exception in characters()", localJSONException);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = false;
      this.jsonArray.put(this.jsonObject);
    }
    if (paramString2.equals(this.ATTRIBUTE_FRIENDLYNAME))
    {
      this.processFriendlyValue = false;
      this.jsonArray.put(this.jsonObject);
    }
    if (paramString2.equals(this.ATTRIBUTE_DELETERESPONSE))
    {
      this.deleteGroupValue = false;
      this.jsonArray.put(this.jsonObject);
    }
  }
  
  public JSONArray parseCreateGroupResponse(String paramString)
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
        SDKLogUtils.errorLog("GetCreateGroupResponseParser", "Exception in parseCreateGroupResponse", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString2.equals(this.ATTRIBUTE_FRIENDLYNAME))
    {
      this.processFriendlyValue = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString2.equals(this.ATTRIBUTE_DELETERESPONSE))
    {
      this.deleteGroupValue = true;
      this.jsonObject = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/GetCreateGroupResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */