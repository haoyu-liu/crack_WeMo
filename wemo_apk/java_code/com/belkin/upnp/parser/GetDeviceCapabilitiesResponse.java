package com.belkin.upnp.parser;

import android.util.Xml;
import java.io.PrintStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetDeviceCapabilitiesResponse
  extends DefaultHandler
{
  private boolean capabilitiesIds = false;
  private boolean deviceCapability = false;
  private boolean deviceId = false;
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
      if (this.deviceId) {
        this.jsonObject.put("deviceid", this.tempVal);
      }
      if (this.capabilitiesIds) {
        this.jsonObject.put("deviceCapabilityIds", this.tempVal);
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
    if (paramString3.equals("DeviceCapability"))
    {
      this.deviceCapability = false;
      this.jsonArr.put(this.jsonObject);
    }
    if (paramString3.equals("DeviceID")) {
      this.deviceId = false;
    }
    if (paramString3.equals("CapabilityIDs")) {
      this.capabilitiesIds = false;
    }
  }
  
  public JSONArray parseForDeviceCapabilitiesList(String paramString)
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
    if (paramString2.equals("DeviceCapabilities")) {
      this.parentTag = true;
    }
    if (paramString3.equals("DeviceCapability"))
    {
      this.deviceCapability = true;
      this.jsonObject = new JSONObject();
    }
    if (paramString3.equals("DeviceID")) {
      this.deviceId = true;
    }
    if (paramString3.equals("CapabilityIDs")) {
      this.capabilitiesIds = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetDeviceCapabilitiesResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */