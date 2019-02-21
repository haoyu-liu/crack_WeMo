package com.belkin.wemo.cache.cloud;

import android.util.Log;
import java.io.IOException;
import java.io.StringReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class XMLParser
{
  private final String getElementValue(Node paramNode)
  {
    if ((paramNode != null) && (paramNode.hasChildNodes())) {
      for (Node localNode = paramNode.getFirstChild(); localNode != null; localNode = localNode.getNextSibling()) {
        if (localNode.getNodeType() == 3) {
          return localNode.getNodeValue();
        }
      }
    }
    return "";
  }
  
  public Document getDomElement(String paramString)
  {
    DocumentBuilderFactory localDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
    try
    {
      DocumentBuilder localDocumentBuilder = localDocumentBuilderFactory.newDocumentBuilder();
      InputSource localInputSource = new InputSource();
      localInputSource.setCharacterStream(new StringReader(paramString));
      Document localDocument = localDocumentBuilder.parse(localInputSource);
      return localDocument;
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      Log.e("Error: ", localParserConfigurationException.getMessage());
      return null;
    }
    catch (SAXException localSAXException)
    {
      Log.e("Error: ", localSAXException.getMessage());
      return null;
    }
    catch (IOException localIOException)
    {
      Log.e("Error: ", localIOException.getMessage());
    }
    return null;
  }
  
  public String getValue(Element paramElement, String paramString)
  {
    return getElementValue(paramElement.getElementsByTagName(paramString).item(0));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/XMLParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */