package org.cybergarage.upnp.control;

import org.cybergarage.soap.SOAPResponse;
import org.cybergarage.upnp.StateVariable;
import org.cybergarage.xml.Node;

public class QueryResponse
  extends ControlResponse
{
  public QueryResponse() {}
  
  public QueryResponse(SOAPResponse paramSOAPResponse)
  {
    super(paramSOAPResponse);
  }
  
  private Node createResponseNode(String paramString)
  {
    Node localNode1 = new Node();
    localNode1.setName("u", "QueryStateVariableResponse");
    localNode1.setNameSpace("u", "urn:schemas-upnp-org:control-1-0");
    Node localNode2 = new Node();
    localNode2.setName("return");
    localNode2.setValue(paramString);
    localNode1.addNode(localNode2);
    return localNode1;
  }
  
  private Node getReturnNode()
  {
    Node localNode1 = getBodyNode();
    if (localNode1 == null) {}
    Node localNode2;
    do
    {
      do
      {
        return null;
      } while (!localNode1.hasNodes());
      localNode2 = localNode1.getNode(0);
    } while ((localNode2 == null) || (!localNode2.hasNodes()));
    return localNode2.getNode(0);
  }
  
  public String getReturnValue()
  {
    Node localNode = getReturnNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public void setResponse(StateVariable paramStateVariable)
  {
    String str = paramStateVariable.getValue();
    setStatusCode(200);
    getBodyNode().addNode(createResponseNode(str));
    setContent(getEnvelopeNode());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/QueryResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */