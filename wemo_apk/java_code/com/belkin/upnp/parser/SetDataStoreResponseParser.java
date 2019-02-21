package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.utils.LogUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SetDataStoreResponseParser
  extends DefaultHandler
{
  public static final String TAG = "SetDataStoreResponseParser";
  boolean errorCode = false;
  String responseCode = null;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.errorCode)
    {
      this.responseCode = new String(paramArrayOfChar, paramInt1, paramInt2);
      this.errorCode = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("ErrorCode")) {
      this.errorCode = false;
    }
  }
  
  public String parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&amp;", "&").replaceAll("&quot;", "\"").replaceAll("&apos;", "'");
    LogUtils.infoLog("SetDataStoreResponseParser", "response str: " + str);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      LogUtils.infoLog("SetDataStoreResponseParser", "responseCode: " + this.responseCode);
      return this.responseCode;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        LogUtils.errorLog("SetDataStoreResponseParser", "SAXException: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("ErrorCode")) {
      this.errorCode = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/SetDataStoreResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */