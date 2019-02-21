package org.cybergarage.soap;

import org.cybergarage.http.HTTPResponse;
import org.cybergarage.util.Debug;
import org.cybergarage.xml.Node;

public class SOAPResponse
  extends HTTPResponse
{
  private Node rootNode;
  
  public SOAPResponse()
  {
    setRootNode(SOAP.createEnvelopeBodyNode());
    setContentType("text/xml; charset=\"utf-8\"");
  }
  
  public SOAPResponse(HTTPResponse paramHTTPResponse)
  {
    super(paramHTTPResponse);
    setRootNode(SOAP.createEnvelopeBodyNode());
    setContentType("text/xml; charset=\"utf-8\"");
  }
  
  public SOAPResponse(SOAPResponse paramSOAPResponse)
  {
    super(paramSOAPResponse);
    setEnvelopeNode(paramSOAPResponse.getEnvelopeNode());
    setContentType("text/xml; charset=\"utf-8\"");
  }
  
  private Node getRootNode()
  {
    return this.rootNode;
  }
  
  private void setRootNode(Node paramNode)
  {
    this.rootNode = paramNode;
  }
  
  public Node getBodyNode()
  {
    Node localNode = getEnvelopeNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("Body");
  }
  
  public Node getEnvelopeNode()
  {
    return getRootNode();
  }
  
  public String getFaultActor()
  {
    Node localNode = getFaultActorNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public Node getFaultActorNode()
  {
    Node localNode = getFaultNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("faultactor");
  }
  
  public String getFaultCode()
  {
    Node localNode = getFaultCodeNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public Node getFaultCodeNode()
  {
    Node localNode = getFaultNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("faultcode");
  }
  
  public Node getFaultDetailNode()
  {
    Node localNode = getFaultNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("detail");
  }
  
  public Node getFaultNode()
  {
    Node localNode = getBodyNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("Fault");
  }
  
  public String getFaultString()
  {
    Node localNode = getFaultStringNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public Node getFaultStringNode()
  {
    Node localNode = getFaultNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("faultstring");
  }
  
  public Node getMethodResponseNode(String paramString)
  {
    Node localNode = getBodyNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith(paramString + "Response");
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
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/soap/SOAPResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */