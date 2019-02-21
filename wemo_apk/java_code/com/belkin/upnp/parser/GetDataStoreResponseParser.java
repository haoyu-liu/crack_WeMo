package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetDataStoreResponseParser
  extends DefaultHandler
{
  public static final String TAG = "GetDataStoreResponseParser";
  String emergencyContactInfo = null;
  boolean hasValues = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.hasValues)
    {
      this.emergencyContactInfo = new String(paramArrayOfChar, paramInt1, paramInt2);
      this.hasValues = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("Value")) {
      this.hasValues = false;
    }
  }
  
  public String parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&amp;", "&").replaceAll("&quot;", "\"").replaceAll("&apos;", "'");
    LogUtils.infoLog("GetDataStoreResponseParser", "response str: " + str);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      LogUtils.infoLog("GetDataStoreResponseParser", "emergencyContactInfo: " + this.emergencyContactInfo);
      return this.emergencyContactInfo;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        LogUtils.errorLog("GetDataStoreResponseParser", "SAXException: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("Value")) {
      this.hasValues = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetDataStoreResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */