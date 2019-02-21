package org.cybergarage.upnp.control;

import org.cybergarage.http.HTTPRequest;
import org.cybergarage.soap.SOAP;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Argument;
import org.cybergarage.upnp.ArgumentList;
import org.cybergarage.upnp.Service;
import org.cybergarage.xml.Node;

public class ActionRequest
  extends ControlRequest
{
  public ActionRequest() {}
  
  public ActionRequest(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
  }
  
  private Node createContentNode(Service paramService, Action paramAction, ArgumentList paramArgumentList)
  {
    String str1 = paramAction.getName();
    String str2 = paramService.getServiceType();
    Node localNode1 = new Node();
    localNode1.setName("u", str1);
    localNode1.setNameSpace("u", str2);
    int i = paramArgumentList.size();
    for (int j = 0; j < i; j++)
    {
      Argument localArgument = paramArgumentList.getArgument(j);
      Node localNode2 = new Node();
      localNode2.setName(localArgument.getName());
      localNode2.setValue(localArgument.getValue());
      localNode1.addNode(localNode2);
    }
    return localNode1;
  }
  
  public String getActionName()
  {
    Node localNode = getActionNode();
    if (localNode == null) {
      return "";
    }
    String str = localNode.getName();
    if (str == null) {
      return "";
    }
    int i = 1 + str.indexOf(":");
    if (i < 0) {
      return "";
    }
    return str.substring(i, str.length());
  }
  
  public Node getActionNode()
  {
    Node localNode = getBodyNode();
    if (localNode == null) {}
    while (!localNode.hasNodes()) {
      return null;
    }
    return localNode.getNode(0);
  }
  
  public ArgumentList getArgumentList()
  {
    Node localNode1 = getActionNode();
    int i = localNode1.getNNodes();
    ArgumentList localArgumentList = new ArgumentList();
    for (int j = 0; j < i; j++)
    {
      Argument localArgument = new Argument();
      Node localNode2 = localNode1.getNode(j);
      localArgument.setName(localNode2.getName());
      localArgument.setValue(localNode2.getValue());
      localArgumentList.add(localArgument);
    }
    return localArgumentList;
  }
  
  public ActionResponse post(int paramInt1, int paramInt2)
  {
    return new ActionResponse(postMessage(getRequestHost(), getRequestPort(), paramInt1, paramInt2));
  }
  
  public void setRequest(Action paramAction, ArgumentList paramArgumentList)
  {
    Service localService = paramAction.getService();
    setRequestHost(localService);
    setEnvelopeNode(SOAP.createEnvelopeBodyNode());
    Node localNode = getEnvelopeNode();
    getBodyNode().addNode(createContentNode(localService, paramAction, paramArgumentList));
    setContent(localNode);
    String str1 = localService.getServiceType();
    String str2 = paramAction.getName();
    setSOAPAction("\"" + str1 + "#" + str2 + "\"");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/ActionRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */