package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.MetaInfo;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetMetaInfoResponseParser
  extends DefaultHandler
{
  private static final String TAG = GetMetaInfoResponseParser.class.getSimpleName();
  private String fwVersion;
  private boolean metaInfo = false;
  private MetaInfo metaInfoObj;
  private String ssid;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.metaInfo)
    {
      String[] arrayOfString = String.valueOf(paramArrayOfChar).split("\\|");
      if (arrayOfString.length > 4)
      {
        this.fwVersion = arrayOfString[3];
        this.metaInfoObj.setFirmwareVersion(this.fwVersion);
        this.ssid = arrayOfString[4];
        this.metaInfoObj.setSSID(this.ssid);
        SDKLogUtils.infoLog(TAG, "ssid: " + this.ssid + "; firmware version: " + this.fwVersion);
      }
      this.metaInfo = false;
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("MetaInfo")) {
      this.metaInfo = false;
    }
  }
  
  public MetaInfo parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "response str: " + str);
    this.metaInfoObj = new MetaInfo();
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
        SDKLogUtils.errorLog(TAG, "Exception: " + localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equals("MetaInfo")) {
      this.metaInfo = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/GetMetaInfoResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */