package com.belkin.wemo.localsdk.parser;

import android.util.Xml;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class ResetPowerThresholdResponse
  extends DefaultHandler
{
  private static String TAG = ResetPowerThresholdResponse.class.getSimpleName();
  private int powerThreshold;
  private boolean powerThresholdTag = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if (this.powerThresholdTag) {
      this.powerThreshold = Integer.valueOf(new String(paramArrayOfChar)).intValue();
    }
    SDKLogUtils.debugLog(TAG, "CHARACTERS: ch: " + paramArrayOfChar.toString() + "; start: " + paramInt1 + "; length: " + paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals(JSONConstants.NEW_VALUE_POWER_THRESHOLD)) {
      this.powerThresholdTag = false;
    }
    SDKLogUtils.debugLog(TAG, "END ELEMENT: uri: " + paramString1 + "; localName: " + paramString2 + "; qName: " + paramString3);
  }
  
  public int parsePowerThreshold(String paramString)
  {
    try
    {
      Xml.parse(paramString, this);
      return this.powerThreshold;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "SAXException while parsing Reset/AutoReset PowerThreshold response: ", localSAXException);
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals(JSONConstants.NEW_VALUE_POWER_THRESHOLD)) {
      this.powerThresholdTag = true;
    }
    SDKLogUtils.debugLog(TAG, "START ELEMENT: uri: " + paramString1 + "; localName: " + paramString2 + "; qName: " + paramString3 + "; attributes: " + paramAttributes);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/ResetPowerThresholdResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */