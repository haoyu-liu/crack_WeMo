package org.cybergarage.xml.parser;

import android.util.Xml;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import java.io.PrintStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetNotifyStatusFirmwareParser
  extends DefaultHandler
{
  private String ATTRIBUTE = "StateEvent";
  private String NOTIFY_DEVICEID = "DeviceID";
  private String NOTIFY_EVENTTYPE = "EventType";
  private String NOTIFY_VALUE = "Value";
  private boolean deviceId = false;
  private boolean eventtype = false;
  private JSONArray jsonArray;
  private JSONObject jsonObject;
  private boolean processValue = false;
  private boolean value = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    String str = new String(paramArrayOfChar, paramInt1, paramInt2);
    try
    {
      if (this.processValue)
      {
        System.out.println("Status change response: " + str);
        if (this.deviceId) {
          this.jsonObject.put(JSONConstants.NOTIFY_DEVICE_ID, str);
        }
        if (this.eventtype) {
          this.jsonObject.put(JSONConstants.NOTIFY_TYPE, str);
        }
        if (this.value) {
          this.jsonObject.put(JSONConstants.NOTIFY_VALUE, str);
        }
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
    if (paramString2.equals(this.ATTRIBUTE))
    {
      this.processValue = false;
      this.jsonArray.put(this.jsonObject);
    }
    if (paramString2.equals(this.NOTIFY_DEVICEID)) {
      this.deviceId = false;
    }
    if (paramString2.equals(this.NOTIFY_EVENTTYPE)) {
      this.eventtype = false;
    }
    if (paramString2.equals(this.NOTIFY_VALUE)) {
      this.value = false;
    }
  }
  
  public JSONArray parseNotifyStatusResponse(String paramString)
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
        localSAXException.printStackTrace();
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
    if (paramString2.equals(this.NOTIFY_DEVICEID)) {
      this.deviceId = true;
    }
    if (paramString2.equals(this.NOTIFY_EVENTTYPE)) {
      this.eventtype = true;
    }
    if (paramString2.equals(this.NOTIFY_VALUE)) {
      this.value = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/parser/GetNotifyStatusFirmwareParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */