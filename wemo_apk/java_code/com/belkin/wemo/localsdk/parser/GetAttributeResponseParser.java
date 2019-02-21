package com.belkin.wemo.localsdk.parser;

import android.util.Xml;
import android.util.Xml.Encoding;
import com.belkin.wemo.cache.utils.StringUtils;
import java.io.IOException;
import java.io.StringReader;
import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetAttributeResponseParser
  extends DefaultHandler
{
  private static String TAG = "GetAttributeResponseParser";
  private JSONObject jsonAttribute;
  private JSONObject jsonAttributeList;
  private String tmpValue;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.tmpValue = new String(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    try
    {
      if (paramString3.equals("attribute")) {
        this.jsonAttributeList.put(StringUtils.toLowerCamelCase(this.jsonAttribute.getString("name")), this.jsonAttribute);
      }
      if (paramString3.equalsIgnoreCase("name")) {
        this.jsonAttribute.put(StringUtils.toLowerCamelCase(paramString3), this.tmpValue);
      }
      if (paramString3.equalsIgnoreCase("value")) {
        this.jsonAttribute.put(paramString3, this.tmpValue);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public JSONObject parseGetAttributeResponse(String paramString)
  {
    if (paramString != null) {}
    try
    {
      if ((!paramString.contains("<attributeList>")) || (!paramString.contains("</attributeList>"))) {
        paramString = "<attributeList>" + paramString + "</attributeList>";
      }
      String str = paramString.replaceAll("&amp;lt;", "<").replaceAll("&amp;gt;", ">");
      this.jsonAttributeList = new JSONObject();
      InputSource localInputSource = new InputSource();
      localInputSource.setEncoding("ISO-8859-1");
      localInputSource.setCharacterStream(new StringReader(str));
      Xml.parse(IOUtils.toInputStream(str, Xml.Encoding.ISO_8859_1.toString()), Xml.Encoding.ISO_8859_1, this);
      Xml.parse(str, this);
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        localSAXException.printStackTrace();
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
      }
    }
    return this.jsonAttributeList;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString3.equalsIgnoreCase("attribute")) {
      this.jsonAttribute = new JSONObject();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/parser/GetAttributeResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */