package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.InsightBinaryState;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class InsightBinaryStateResponseParser
  extends DefaultHandler
{
  private static final String TAG = InsightBinaryStateResponseParser.class.getSimpleName();
  private boolean binaryState = false;
  private boolean brightness = false;
  private boolean fader = false;
  private String insightBinaryState;
  private InsightBinaryState insightBinaryStateObj;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "Tag response: " + String.valueOf(paramArrayOfChar));
    if (this.binaryState)
    {
      String[] arrayOfString = String.valueOf(paramArrayOfChar).split("\\|");
      if (arrayOfString.length > 0)
      {
        this.insightBinaryState = arrayOfString[0];
        this.insightBinaryStateObj.setBinaryState(this.insightBinaryState);
        SDKLogUtils.infoLog(TAG, " binary state: " + this.insightBinaryState);
      }
      this.binaryState = false;
    }
    do
    {
      return;
      if (this.brightness)
      {
        this.insightBinaryStateObj.setBrightness(String.valueOf(paramArrayOfChar));
        this.brightness = false;
        return;
      }
    } while (!this.fader);
    this.insightBinaryStateObj.setFader(String.valueOf(paramArrayOfChar));
    this.fader = false;
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("BinaryState")) {
      this.binaryState = false;
    }
    do
    {
      return;
      if (paramString3.equals("Brightness"))
      {
        this.brightness = false;
        return;
      }
    } while (!paramString3.equals("Fader"));
    this.fader = false;
  }
  
  public InsightBinaryState parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "response str: " + str);
    this.insightBinaryStateObj = new InsightBinaryState();
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.insightBinaryStateObj;
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
    if (paramString3.equals("BinaryState")) {
      this.binaryState = true;
    }
    do
    {
      return;
      if (paramString3.equals("Brightness"))
      {
        this.brightness = true;
        return;
      }
    } while (!paramString3.equals("Fader"));
    this.fader = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */