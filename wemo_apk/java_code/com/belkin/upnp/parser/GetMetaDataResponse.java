package com.belkin.upnp.parser;

import android.util.Xml;
import com.belkin.beans.MetaDataResponseBean;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetMetaDataResponse
  extends DefaultHandler
{
  boolean metadata = false;
  private StringBuffer metadataBuffer;
  boolean modelcode = false;
  private int parseField = 1;
  boolean serialnumber = false;
  boolean uniqueid = false;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.metadata) && (this.parseField % 2 == 0)) {
      this.metadataBuffer.append(paramArrayOfChar);
    }
    this.parseField = (1 + this.parseField);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
    if (paramString2.equals("MetaInfo")) {
      this.metadata = false;
    }
  }
  
  public MetaDataResponseBean parseGetMetaDataResponse(Object paramObject, String paramString)
  {
    this.metadataBuffer = new StringBuffer();
    try
    {
      Xml.parse(paramString, this);
      MetaDataResponseBean localMetaDataResponseBean = (MetaDataResponseBean)paramObject;
      if (this.metadataBuffer != null) {
        localMetaDataResponseBean.setMetadata(this.metadataBuffer.toString().trim());
      }
      return localMetaDataResponseBean;
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    if (paramString2.equals("MetaInfo"))
    {
      this.metadata = true;
      this.parseField = 0;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetMetaDataResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */