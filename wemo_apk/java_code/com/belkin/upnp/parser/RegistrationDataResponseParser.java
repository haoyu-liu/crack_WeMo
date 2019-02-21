package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class RegistrationDataResponseParser
  extends DefaultHandler
{
  public static final String TAG = "RegistrationDataResponseParser";
  boolean arpMac = false;
  boolean homeId = false;
  JSONObject jsonObject = null;
  boolean registrationData = false;
  boolean registrationStatus = false;
  boolean smartPrivateKey = false;
  boolean statusCode = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    try
    {
      if (this.homeId)
      {
        this.jsonObject.put("homeId", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.homeId = false;
        return;
      }
      if (this.smartPrivateKey)
      {
        this.jsonObject.put("privateKeyPhone", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.smartPrivateKey = false;
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    if (this.statusCode)
    {
      this.jsonObject.put("statusCode", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.statusCode = false;
      return;
    }
    if (this.registrationStatus)
    {
      this.jsonObject.put("registrationStatus", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.registrationStatus = false;
      return;
    }
    if (this.arpMac)
    {
      this.jsonObject.put("arpMac", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.arpMac = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("HomeId")) {
      this.homeId = false;
    }
    do
    {
      return;
      if (paramString2.equals("SmartPrivateKey"))
      {
        this.smartPrivateKey = false;
        return;
      }
      if (paramString2.equals("StatusCode"))
      {
        this.statusCode = false;
        return;
      }
      if (paramString2.equals("RegistrationStatus"))
      {
        this.registrationStatus = false;
        return;
      }
    } while (!paramString2.equals("ArpMac"));
    this.arpMac = false;
  }
  
  public JSONObject parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    Log.i("RegistrationDataResponseParser", "response str: " + str);
    this.jsonObject = new JSONObject();
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      Log.i("RegistrationDataResponseParser", "jsonObject: " + this.jsonObject);
      return this.jsonObject;
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
    if (paramString3.equals("HomeId")) {
      this.homeId = true;
    }
    do
    {
      return;
      if (paramString3.equals("SmartPrivateKey"))
      {
        this.smartPrivateKey = true;
        return;
      }
      if (paramString3.equals("StatusCode"))
      {
        this.statusCode = true;
        return;
      }
      if (paramString3.equals("RegistrationStatus"))
      {
        this.registrationStatus = true;
        return;
      }
    } while (!paramString3.equals("ArpMac"));
    this.arpMac = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/RegistrationDataResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */