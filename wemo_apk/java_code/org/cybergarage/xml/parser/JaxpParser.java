package org.cybergarage.xml.parser;

import java.io.InputStream;
import java.io.StringWriter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.cybergarage.xml.Parser;
import org.cybergarage.xml.ParserException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.xml.sax.InputSource;

public class JaxpParser
  extends Parser
{
  public String getStringFromDocument(Document paramDocument)
  {
    try
    {
      DOMSource localDOMSource = new DOMSource(paramDocument);
      StringWriter localStringWriter = new StringWriter();
      StreamResult localStreamResult = new StreamResult(localStringWriter);
      TransformerFactory.newInstance().newTransformer().transform(localDOMSource, localStreamResult);
      String str = localStringWriter.toString();
      return str;
    }
    catch (TransformerException localTransformerException)
    {
      localTransformerException.printStackTrace();
    }
    return null;
  }
  
  public org.cybergarage.xml.Node parse(InputStream paramInputStream)
    throws ParserException
  {
    try
    {
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new InputSource(paramInputStream));
      Element localElement = localDocument.getDocumentElement();
      getStringFromDocument(localDocument);
      Object localObject = null;
      if (localElement != null)
      {
        org.cybergarage.xml.Node localNode = parse(null, localElement);
        localObject = localNode;
      }
      return (org.cybergarage.xml.Node)localObject;
    }
    catch (Exception localException)
    {
      throw new ParserException(localException);
    }
  }
  
  public org.cybergarage.xml.Node parse(org.cybergarage.xml.Node paramNode, org.w3c.dom.Node paramNode1)
  {
    return parse(paramNode, paramNode1, 0);
  }
  
  public org.cybergarage.xml.Node parse(org.cybergarage.xml.Node paramNode, org.w3c.dom.Node paramNode1, int paramInt)
  {
    int i = paramNode1.getNodeType();
    String str1 = paramNode1.getNodeName();
    String str2 = paramNode1.getNodeValue();
    if (i == 3) {
      paramNode.addValue(str2);
    }
    while (i != 1) {
      return paramNode;
    }
    org.cybergarage.xml.Node localNode = new org.cybergarage.xml.Node();
    localNode.setName(str1);
    localNode.setValue(str2);
    if (paramNode != null) {
      paramNode.addNode(localNode);
    }
    NamedNodeMap localNamedNodeMap = paramNode1.getAttributes();
    if (localNamedNodeMap != null)
    {
      int j = localNamedNodeMap.getLength();
      for (int k = 0; k < j; k++)
      {
        org.w3c.dom.Node localNode2 = localNamedNodeMap.item(k);
        localNode.setAttribute(localNode2.getNodeName(), localNode2.getNodeValue());
      }
    }
    org.w3c.dom.Node localNode1 = paramNode1.getFirstChild();
    if (localNode1 == null)
    {
      localNode.setValue("");
      return localNode;
    }
    do
    {
      parse(localNode, localNode1, paramInt + 1);
      localNode1 = localNode1.getNextSibling();
    } while (localNode1 != null);
    return localNode;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/parser/JaxpParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */