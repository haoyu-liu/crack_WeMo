package com.belkin.wemo.upnp.parser;

import android.util.Xml;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.upnp.response.RMBaseUpnpResponse;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public abstract class RMBaseUPNPResponseParser
  extends DefaultHandler
{
  protected final String TAG = getClass().getSimpleName();
  protected RMBaseUpnpResponse responseObj;
  
  public RMBaseUPNPResponseParser(RMBaseUpnpResponse paramRMBaseUpnpResponse)
  {
    this.responseObj = paramRMBaseUpnpResponse;
  }
  
  public RMBaseUpnpResponse parseResponse(String paramString)
  {
    String str = paramString.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    SDKLogUtils.infoLog(this.TAG, "uPnP response received from device: " + str);
    if (str != null) {}
    try
    {
      Xml.parse(str, this);
      return this.responseObj;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "SAXException during XML parsing: ", localSAXException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */