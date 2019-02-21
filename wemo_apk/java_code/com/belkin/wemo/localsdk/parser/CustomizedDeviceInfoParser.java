package com.belkin.wemo.localsdk.parser;

import java.util.HashMap;
import java.util.Map;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class CustomizedDeviceInfoParser
  extends DefaultHandler
{
  private Map<String, String> device_infromation = new HashMap();
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("Device")) {}
    while (paramString3.equalsIgnoreCase("DeviceInformation")) {
      return;
    }
    this.device_infromation.put(paramString3, this.tmpValue);
  }
  
  public Map<String, String> getCustomizedDeviceInfoArray()
  {
    return this.device_infromation;
  }
  
  public void setCustomizedDeviceInfoArray(Map<String, String> paramMap)
  {
    this.device_infromation = paramMap;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if ((!paramString3.equalsIgnoreCase("Device")) || (paramString3.equalsIgnoreCase("DeviceInformation"))) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/CustomizedDeviceInfoParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */