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

public class GetNotifyStatusResponseParser
  extends DefaultHandler
{
  private static final String STATUS_TS_TAG = "statusTS";
  private String ATTRIBUTE = "StateEvent";
  private String NOTIFY_CAPABILITYID = "CapabilityId";
  private String NOTIFY_DEVICEID = "DeviceID";
  private String NOTIFY_VALUE = "Value";
  private boolean capabilityId = false;
  private boolean deviceId = false;
  private String deviceIdAvailablity = "";
  private JSONArray jsonArray;
  private JSONObject jsonObject;
  private boolean processValue = false;
  private boolean statusTS = false;
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
        this.jsonObject.put("Availability", this.deviceIdAvailablity);
        System.out.println("Status change response: " + str);
        if (this.deviceId) {
          this.jsonObject.put(JSONConstants.NOTIFY_DEVICE_ID, str);
        }
        if (this.capabilityId) {
          this.jsonObject.put(JSONConstants.NOTIFY_CAPABILITY_ID, str);
        }
        if (this.value) {
          this.jsonObject.put(JSONConstants.NOTIFY_VALUE, str);
        }
        if (this.statusTS) {
          this.jsonObject.put("statusTS", str);
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
    if (paramString2.equals(this.NOTIFY_CAPABILITYID)) {
      this.capabilityId = false;
    }
    if (paramString2.equals(this.NOTIFY_VALUE)) {
      this.value = false;
    }
    if (paramString2.equals("statusTS")) {
      this.statusTS = true;
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
    if (paramString2.equals(this.NOTIFY_DEVICEID))
    {
      this.deviceId = true;
      this.deviceIdAvailablity = paramAttributes.getValue("available");
    }
    if (paramString2.equals(this.NOTIFY_CAPABILITYID)) {
      this.capabilityId = true;
    }
    if (paramString2.equals(this.NOTIFY_VALUE)) {
      this.value = true;
    }
    if (paramString2.equals("statusTS")) {
      this.statusTS = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/parser/GetNotifyStatusResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */