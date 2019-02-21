package com.belkin.wemo.upnp.parser;

import android.text.TextUtils;
import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetIconVersionResponseParser
  extends DefaultHandler
{
  private static final String TAG = GetIconVersionResponseParser.class.getSimpleName();
  private int iconVersion;
  private boolean iconVersionTag = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    String str;
    if (this.iconVersionTag)
    {
      str = String.valueOf(paramArrayOfChar);
      if (TextUtils.isEmpty(str)) {}
    }
    try
    {
      this.iconVersion = Integer.valueOf(str).intValue();
      this.iconVersionTag = false;
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "NumberFormatException while parsing icon version: ", localNumberFormatException);
      }
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("IconVersion")) {
      this.iconVersionTag = false;
    }
  }
  
  public int parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "response str: " + str);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.iconVersion;
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
    if (paramString3.equals("IconVersion")) {
      this.iconVersionTag = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/GetIconVersionResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */