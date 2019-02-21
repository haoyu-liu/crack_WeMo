package com.belkin.upnp.parser;

import android.util.Xml;
import java.io.PrintStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetLedProfileListResponse
  extends DefaultHandler
{
  private boolean capabilityAttrName = false;
  private boolean capabilityControl = false;
  private boolean capabilityDataType = false;
  private boolean capabilityId = false;
  private boolean capabilityNameValue = false;
  private boolean capabilityProfile = false;
  private boolean capabilityProfileName = false;
  private boolean capabilitySpec = false;
  private JSONArray jsonArr;
  private JSONObject jsonObject;
  private boolean parentTag = false;
  private StringBuffer responseBuffer;
  private String tempVal;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.parentTag == true) && (paramArrayOfChar[0] != '\n')) {
      this.responseBuffer.append(new String(paramArrayOfChar, paramInt1, paramInt2));
    }
    this.tempVal = new String(paramArrayOfChar, paramInt1, paramInt2);
    try
    {
      if (this.capabilityProfile) {
        this.jsonObject.put("capabilityProfile", this.tempVal);
      }
      if (this.capabilityId) {
        this.jsonObject.put("capabilityId", this.tempVal);
      }
      if (this.capabilitySpec) {
        this.jsonObject.put("capabilitySpec", this.tempVal);
      }
      if (this.capabilityProfileName) {
        this.jsonObject.put("capabilityProfileName", this.tempVal);
      }
      if (this.capabilityAttrName) {
        this.jsonObject.put("capabilityAttrName", this.tempVal);
      }
      if (this.capabilityDataType) {
        this.jsonObject.put("capabilityDataType", this.tempVal);
      }
      if (this.capabilityNameValue) {
        this.jsonObject.put("capabilityNameValue", this.tempVal);
      }
      if (this.capabilityControl) {
        this.jsonObject.put("capabilityControl", this.tempVal);
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
    if (paramString3.equals("CapabilityProfileList")) {
      this.parentTag = false;
    }
    if (paramString3.equals("CapabilityProfile"))
    {
      this.capabilityProfile = false;
      this.jsonArr.put(this.jsonObject);
    }
    if (paramString3.equals("CapabilityID")) {
      this.capabilityId = false;
    }
    if (paramString3.equals("CapabilitySpec")) {
      this.capabilitySpec = false;
    }
    if (paramString3.equals("CapabilityProfileName")) {
      this.capabilityProfileName = false;
    }
    if (paramString3.equals("CapabilityAttrName")) {
      this.capabilityAttrName = false;
    }
    if (paramString3.equals("CapabilityDataType")) {
      this.capabilityDataType = false;
    }
    if (paramString3.equals("CapabilityNameValue")) {
      this.capabilityNameValue = false;
    }
    if (paramString3.equals("CapabilityControl")) {
      this.capabilityControl = false;
    }
  }
  
  public JSONArray parseForLedprofileList(String paramString)
  {
    this.jsonObject = new JSONObject();
    this.jsonArr = new JSONArray();
    this.responseBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      str = new String(this.responseBuffer);
      System.out.println("RESPONSE AFTER REPLACE*******" + str);
    }
    catch (SAXException localSAXException1)
    {
      try
      {
        String str;
        Xml.parse(str, this);
        return this.jsonArr;
        localSAXException1 = localSAXException1;
        localSAXException1.printStackTrace();
      }
      catch (SAXException localSAXException2)
      {
        for (;;)
        {
          localSAXException2.printStackTrace();
        }
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals("CapabilityProfileList")) {
      this.parentTag = true;
    }
    if (paramString3.equals("CapabilityProfile"))
    {
      this.capabilityProfile = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString3.equals("CapabilityID")) {
      this.capabilityId = true;
    }
    if (paramString3.equals("CapabilitySpec")) {
      this.capabilitySpec = true;
    }
    if (paramString3.equals("CapabilityProfileName")) {
      this.capabilityProfileName = true;
    }
    if (paramString3.equals("CapabilityAttrName")) {
      this.capabilityAttrName = true;
    }
    if (paramString3.equals("CapabilityDataType")) {
      this.capabilityDataType = true;
    }
    if (paramString3.equals("CapabilityNameValue")) {
      this.capabilityNameValue = true;
    }
    if (paramString3.equals("CapabilityControl")) {
      this.capabilityControl = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetLedProfileListResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */