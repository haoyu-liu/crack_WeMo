package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.RemoteAccessResponseBean;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class RemoteAccessResponseParser
  extends DefaultHandler
{
  boolean arpMac = false;
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
        return;
      }
      if (this.privateKeyphone)
      {
        this.jsonObject.put("privateKeyPhone", new String(paramArrayOfChar, paramInt1, paramInt2));
        this.privateKeyphone = false;
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    if (this.homeId)
    {
      this.jsonObject.put("homeId", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.homeId = false;
      return;
    }
    if (this.statusCode)
    {
      this.jsonObject.put("statusCode", new String(paramArrayOfChar, paramInt1, paramInt2));
      this.statusCode = false;
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
    if (paramString3.equalsIgnoreCase("statusCode")) {
      this.statusCode = false;
    }
    do
    {
      return;
      if (paramString2.equals("pluginprivateKey"))
      {
        this.privateKeyplugin = false;
        return;
      }
      if (paramString2.equals("smartprivateKey"))
      {
        this.privateKeyphone = false;
        return;
      }
      if (paramString2.equals("homeId"))
      {
        this.homeId = false;
        return;
      }
    } while (!paramString2.equals("ArpMac"));
    this.arpMac = false;
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
    do
    {
      return;
      if (paramString3.equals("smartprivateKey"))
      {
        this.privateKeyphone = true;
        return;
      }
      if (paramString3.equals("homeId"))
      {
        this.homeId = true;
        return;
      }
      if (paramString3.equals("statusCode"))
      {
        this.statusCode = true;
        return;
      }
    } while (!paramString3.equals("ArpMac"));
    this.arpMac = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/RemoteAccessResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */