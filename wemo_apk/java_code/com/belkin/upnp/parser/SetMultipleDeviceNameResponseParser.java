package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SetMultipleDeviceNameResponseParser
  extends DefaultHandler
{
  public static final String TAG = "SetMultipleDeviceNameResponseParser";
  boolean errorCodeIDs = false;
  String responseCode = null;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.errorCodeIDs)
    {
      this.responseCode = new String(paramArrayOfChar, paramInt1, paramInt2);
      this.errorCodeIDs = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("ErrorDeviceIDs")) {
      this.errorCodeIDs = false;
    }
  }
  
  public String parseResponse(String paramString)
  {
    LogUtils.infoLog("SetMultipleDeviceNameResponseParser", "response str: " + paramString);
    if (paramString != null) {}
    try
    {
      Xml.parse(paramString, this);
      LogUtils.infoLog("SetMultipleDeviceNameResponseParser", "responseCode: " + this.responseCode);
      return this.responseCode;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        LogUtils.errorLog("SetMultipleDeviceNameResponseParser", "SAXException in parsing set multiple device name response parser: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("ErrorDeviceIDs")) {
      this.errorCodeIDs = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/SetMultipleDeviceNameResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */