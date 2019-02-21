package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.SetBulbTypeResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SetBulbTypeResponseParser
  extends DefaultHandler
{
  private static final String TAG = SetBulbTypeResponseParser.class.getSimpleName();
  private boolean isMaxLevel;
  private boolean isMinLevel;
  private boolean isTurnOnLevel;
  private SetBulbTypeResponse setBulbTypeResponse;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "characters: " + String.valueOf(paramArrayOfChar) + "; start: " + paramInt1 + "; length: " + paramInt2);
    if (this.isMinLevel)
    {
      this.setBulbTypeResponse.setMinLevel(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
      this.isMinLevel = false;
    }
    do
    {
      return;
      if (this.isMaxLevel)
      {
        this.setBulbTypeResponse.setMaxLevel(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
        this.isMaxLevel = false;
        return;
      }
    } while (!this.isTurnOnLevel);
    this.setBulbTypeResponse.setTurnOnLevel(String.copyValueOf(paramArrayOfChar, paramInt1, paramInt2));
    this.isTurnOnLevel = false;
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "endElement: " + paramString3);
    if (paramString3.equals("maxLevel")) {
      this.isMaxLevel = false;
    }
    do
    {
      return;
      if (paramString3.equals("minLevel"))
      {
        this.isMinLevel = false;
        return;
      }
    } while (!paramString3.equals("turnOnLevel"));
    this.isTurnOnLevel = false;
  }
  
  public SetBulbTypeResponse parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(TAG, "parseResponse: response str = " + str);
    this.setBulbTypeResponse = new SetBulbTypeResponse();
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.setBulbTypeResponse;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "SAXException while parsing SetBulbType Response: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    SDKLogUtils.infoLog(TAG, "startElement: " + paramString3);
    if (paramString3.equals("maxLevel")) {
      this.isMaxLevel = true;
    }
    do
    {
      return;
      if (paramString3.equals("minLevel"))
      {
        this.isMinLevel = true;
        return;
      }
    } while (!paramString3.equals("turnOnLevel"));
    this.isTurnOnLevel = true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/SetBulbTypeResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */