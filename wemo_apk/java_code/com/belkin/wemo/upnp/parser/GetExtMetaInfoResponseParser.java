package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.ExtMetaInfo;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetExtMetaInfoResponseParser
  extends DefaultHandler
{
  private static final String TAG = GetExtMetaInfoResponseParser.class.getSimpleName();
  private boolean extMetaInfoXMLTag;
  private ExtMetaInfo metaInfoObj;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.extMetaInfoXMLTag)
    {
      String[] arrayOfString = String.valueOf(paramArrayOfChar).split("\\|");
      if ((arrayOfString.length > 0) && (arrayOfString.length >= 6))
      {
        String str = arrayOfString[5];
        this.metaInfoObj.setFwStatus(str);
        SDKLogUtils.infoLog(TAG, "Firmware Status: " + str);
      }
      this.extMetaInfoXMLTag = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("ExtMetaInfo")) {
      this.extMetaInfoXMLTag = false;
    }
  }
  
  public ExtMetaInfo parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "response str: " + str);
    this.metaInfoObj = new ExtMetaInfo();
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.metaInfoObj;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "SAXException while parsing ExtMetaInfo uPnP response: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("ExtMetaInfo")) {
      this.extMetaInfoXMLTag = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */