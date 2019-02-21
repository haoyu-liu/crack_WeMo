package org.cybergarage.upnp.control;

import org.cybergarage.soap.SOAPResponse;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Argument;
import org.cybergarage.upnp.ArgumentList;
import org.cybergarage.upnp.Service;
import org.cybergarage.xml.Node;

public class ActionResponse
  extends ControlResponse
{
  public ActionResponse()
  {
    setHeader("EXT", "");
  }
  
  public ActionResponse(SOAPResponse paramSOAPResponse)
  {
    super(paramSOAPResponse);
    setHeader("EXT", "");
  }
  
  private Node createResponseNode(Action paramAction)
  {
    String str = paramAction.getName();
    Node localNode1 = new Node("u:" + str + "Response");
    Service localService = paramAction.getService();
    if (localService != null) {
      localNode1.setAttribute("xmlns:u", localService.getServiceType());
    }
    ArgumentList localArgumentList = paramAction.getArgumentList();
    int i = localArgumentList.size();
    int j = 0;
    if (j < i)
    {
      Argument localArgument = localArgumentList.getArgument(j);
      if (!localArgument.isOutDirection()) {}
      for (;;)
      {
        j++;
        break;
        Node localNode2 = new Node();
        localNode2.setName(localArgument.getName());
        localNode2.setValue(localArgument.getValue());
        localNode1.addNode(localNode2);
      }
    }
    return localNode1;
  }
  
  private Node getActionResponseNode()
  {
    Node localNode = getBodyNode();
    if ((localNode == null) || (!localNode.hasNodes())) {
      return null;
    }
    return localNode.getNode(0);
  }
  
  public ArgumentList getResponse()
  {
    ArgumentList localArgumentList = new ArgumentList();
    Node localNode1 = getActionResponseNode();
    if (localNode1 == null) {}
    for (;;)
    {
      return localArgumentList;
      int i = localNode1.getNNodes();
      for (int j = 0; j < i; j++)
      {
        Node localNode2 = localNode1.getNode(j);
        localArgumentList.add(new Argument(localNode2.getName(), localNode2.getValue()));
      }
    }
  }
  
  public void setResponse(Action paramAction)
  {
    setStatusCode(200);
    getBodyNode().addNode(createResponseNode(paramAction));
    setContent(getEnvelopeNode());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/ActionResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */