package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.NightModeConfiguration;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetNightModeConfigurationResponseParser
  extends DefaultHandler
{
  private static final String TAG = GetNightModeConfigurationResponseParser.class.getSimpleName();
  private boolean isEndTime = false;
  private boolean isNightMode = false;
  private boolean isNightModeBrightness = false;
  private boolean isStartTime = false;
  private NightModeConfiguration nightModeConfiguration;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "characters: " + String.valueOf(paramArrayOfChar) + "; start: " + paramInt1 + "; length: " + paramInt2);
    if (this.isNightMode)
    {
      this.nightModeConfiguration.setNightMode(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
      this.isNightMode = false;
    }
    do
    {
      return;
      if (this.isNightModeBrightness)
      {
        this.nightModeConfiguration.setNightModeBrightness(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
        this.isNightModeBrightness = false;
        return;
      }
      if (this.isStartTime)
      {
        this.nightModeConfiguration.setStartTime(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
        this.isStartTime = false;
        return;
      }
    } while (!this.isEndTime);
    this.nightModeConfiguration.setEndTime(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
    this.isEndTime = false;
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "endElement: " + paramString3);
    if (paramString3.equals("nightMode")) {
      this.isNightMode = false;
    }
    do
    {
      return;
      if (paramString3.equals("nightModeBrightness"))
      {
        this.isNightModeBrightness = false;
        return;
      }
      if (paramString3.equals("startTime"))
      {
        this.isStartTime = false;
        return;
      }
    } while (!paramString3.equals("endTime"));
    this.isEndTime = false;
  }
  
  public NightModeConfiguration parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "parseResponse: response str: " + str);
    this.nightModeConfiguration = new NightModeConfiguration();
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.nightModeConfiguration;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "SAXException while parsing GetNightModeConfiguration Response: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "startElement: " + paramString3);
    if (paramString3.equals("nightMode")) {
      this.isNightMode = true;
    }
    do
    {
      return;
      if (paramString3.equals("nightModeBrightness"))
      {
        this.isNightModeBrightness = true;
        return;
      }
      if (paramString3.equals("startTime"))
      {
        this.isStartTime = true;
        return;
      }
    } while (!paramString3.equals("endTime"));
    this.isEndTime = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */