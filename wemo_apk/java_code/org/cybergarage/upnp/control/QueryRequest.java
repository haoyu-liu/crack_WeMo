package org.cybergarage.upnp.control;

import org.cybergarage.http.HTTPRequest;
import org.cybergarage.soap.SOAP;
import org.cybergarage.upnp.Service;
import org.cybergarage.upnp.StateVariable;
import org.cybergarage.xml.Node;

public class QueryRequest
  extends ControlRequest
{
  public QueryRequest() {}
  
  public QueryRequest(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
  }
  
  private Node createContentNode(StateVariable paramStateVariable)
  {
    Node localNode1 = new Node();
    localNode1.setName("u", "QueryStateVariable");
    localNode1.setNameSpace("u", "urn:schemas-upnp-org:control-1-0");
    Node localNode2 = new Node();
    localNode2.setName("u", "varName");
    localNode2.setValue(paramStateVariable.getName());
    localNode1.addNode(localNode2);
    return localNode1;
  }
  
  private Node getVarNameNode()
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
  
  public String getVarName()
  {
    Node localNode = getVarNameNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public QueryResponse post(int paramInt1, int paramInt2)
  {
    return new QueryResponse(postMessage(getRequestHost(), getRequestPort(), paramInt1, paramInt2));
  }
  
  public void setRequest(StateVariable paramStateVariable)
  {
    Service localService = paramStateVariable.getService();
    localService.getControlURL();
    setRequestHost(localService);
    setEnvelopeNode(SOAP.createEnvelopeBodyNode());
    Node localNode = getEnvelopeNode();
    getBodyNode().addNode(createContentNode(paramStateVariable));
    setContent(localNode);
    setSOAPAction("urn:schemas-upnp-org:control-1-0#QueryStateVariable");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/QueryRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */