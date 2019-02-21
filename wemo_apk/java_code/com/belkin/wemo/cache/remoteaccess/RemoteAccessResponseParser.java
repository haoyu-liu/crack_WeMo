package com.belkin.wemo.cache.remoteaccess;

import android.util.Xml;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class RemoteAccessResponseParser
  extends DefaultHandler
{
  boolean homeId = false;
  JSONObject jsonObject = new JSONObject();
  RemoteAccessResponseBean object = null;
  boolean privateKeyphone = false;
  boolean privateKeyplugin = false;
  boolean statusCode = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    try
    {
      if (this.privateKeyplugin)
      {
        this.jsonObject.put("privateKeyPlugIn", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.privateKeyplugin = false;
      }
      if (this.privateKeyphone)
      {
        this.jsonObject.put("privateKeyPhone", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.privateKeyphone = false;
      }
      if (this.homeId)
      {
        this.jsonObject.put("homeId", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.homeId = false;
      }
      if (this.statusCode)
      {
        this.jsonObject.put("statusCode", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.statusCode = false;
      }
      return;
    }
    catch (JSONException localJSONException) {}
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("statusCode")) {
      this.statusCode = false;
    }
    if (paramString2.equals("pluginprivateKey")) {
      this.privateKeyplugin = false;
    }
    if (paramString2.equals("smartprivateKey")) {
      this.privateKeyphone = false;
    }
    if (paramString2.equals("homeId")) {
      this.homeId = false;
    }
  }
  
  public JSONObject parseRemoteAccessRespone(String paramString)
  {
    this.jsonObject = new JSONObject();
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
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
    if (paramString3.equals("pluginprivateKey")) {
      this.privateKeyplugin = true;
    }
    if (paramString3.equals("smartprivateKey")) {
      this.privateKeyphone = true;
    }
    if (paramString3.equals("homeId")) {
      this.homeId = true;
    }
    if (paramString3.equals("statusCode")) {
      this.statusCode = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */