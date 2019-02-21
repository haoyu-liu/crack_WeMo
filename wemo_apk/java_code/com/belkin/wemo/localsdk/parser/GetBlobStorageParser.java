package com.belkin.wemo.localsdk.parser;

import android.util.Log;
import android.util.Xml;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetBlobStorageParser
  extends DefaultHandler
{
  private static String TAG = "GetBlobStorageParser";
  private boolean processValue = false;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (this.processValue) {
      this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString3.equals("DataValue")) {
      this.processValue = false;
    }
  }
  
  public String parseGetBlobStorageRespone(String paramString)
  {
    try
    {
      Log.v(TAG, "response is " + paramString);
      if (paramString != null) {
        Xml.parse(paramString, this);
      }
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        Log.e(TAG, "Exception is " + localSAXException.toString());
        localSAXException.printStackTrace();
      }
    }
    return this.tmpValue;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("DataValue")) {
      this.processValue = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/GetBlobStorageParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */