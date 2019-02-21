package org.cybergarage.soap;

import java.io.ByteArrayInputStream;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.util.Debug;
import org.cybergarage.xml.Node;
import org.cybergarage.xml.Parser;
import org.cybergarage.xml.ParserException;

public class SOAPRequest
  extends HTTPRequest
{
  private static final String SOAPACTION = "SOAPACTION";
  private Node rootNode;
  
  public SOAPRequest()
  {
    setContentType("text/xml; charset=\"utf-8\"");
    setMethod("POST");
  }
  
  public SOAPRequest(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
  }
  
  private Node getRootNode()
  {
    for (;;)
    {
      try
      {
        if (this.rootNode != null)
        {
          localNode = this.rootNode;
          return localNode;
        }
        ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(getContent());
        Parser localParser = SOAP.getXMLParser();
        if (localParser != null) {
          this.rootNode = localParser.parse(localByteArrayInputStream);
        }
      }
      catch (ParserException localParserException)
      {
        Node localNode;
        localParserException.printStackTrace();
        Debug.warning(localParserException);
        continue;
      }
      finally {}
      localNode = this.rootNode;
    }
  }
  
  private void setRootNode(Node paramNode)
  {
    if (paramNode != null) {}
    this.rootNode = paramNode;
  }
  
  public Node getBodyNode()
  {
    Node localNode = getEnvelopeNode();
    if (localNode == null) {}
    while (!localNode.hasNodes()) {
      return null;
    }
    return localNode.getNode(0);
  }
  
  public Node getEnvelopeNode()
  {
    return getRootNode();
  }
  
  public String getSOAPAction()
  {
    return getStringHeaderValue("SOAPACTION");
  }
  
  public boolean isSOAPAction(String paramString)
  {
    String str1 = getHeaderValue("SOAPACTION");
    if (str1 == null) {}
    String str2;
    do
    {
      return false;
      if (str1.equals(paramString) == true) {
        return true;
      }
      str2 = getSOAPAction();
    } while (str2 == null);
    return str2.equals(paramString);
  }
  
  public SOAPResponse postMessage(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    SOAPResponse localSOAPResponse = new SOAPResponse(post(paramString, paramInt1, paramInt2, paramInt3));
    byte[] arrayOfByte = localSOAPResponse.getContent();
    if (arrayOfByte.length <= 0) {
      return localSOAPResponse;
    }
    try
    {
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(arrayOfByte);
      localSOAPResponse.setEnvelopeNode(SOAP.getXMLParser().parse(localByteArrayInputStream));
      return localSOAPResponse;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return localSOAPResponse;
  }
  
  public void print()
  {
    Debug.message(toString());
    if (hasContent() == true) {}
    Node localNode;
    do
    {
      return;
      localNode = getRootNode();
    } while (localNode == null);
    Debug.message(localNode.toString());
  }
  
  public void setContent(Node paramNode)
  {
    String str1 = "" + "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    String str2 = str1 + "\n";
    setContent(str2 + paramNode.toString());
  }
  
  public void setEnvelopeNode(Node paramNode)
  {
    setRootNode(paramNode);
  }
  
  public void setSOAPAction(String paramString)
  {
    setStringHeader("SOAPACTION", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/soap/SOAPRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */