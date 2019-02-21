package org.cybergarage.upnp.control;

import org.cybergarage.soap.SOAPResponse;
import org.cybergarage.upnp.UPnP;
import org.cybergarage.upnp.UPnPStatus;
import org.cybergarage.xml.Node;

public class ControlResponse
  extends SOAPResponse
{
  public static final String FAULT_CODE = "Client";
  public static final String FAULT_STRING = "UPnPError";
  private UPnPStatus upnpErr = new UPnPStatus();
  
  public ControlResponse()
  {
    setServer(UPnP.getServerName());
  }
  
  public ControlResponse(SOAPResponse paramSOAPResponse)
  {
    super(paramSOAPResponse);
  }
  
  private Node createFaultResponseNode(int paramInt)
  {
    return createFaultResponseNode(paramInt, UPnPStatus.code2String(paramInt));
  }
  
  private Node createFaultResponseNode(int paramInt, String paramString)
  {
    Node localNode1 = new Node("s:Fault");
    Node localNode2 = new Node("faultcode");
    localNode2.setValue("s:Client");
    localNode1.addNode(localNode2);
    Node localNode3 = new Node("faultstring");
    localNode3.setValue("UPnPError");
    localNode1.addNode(localNode3);
    Node localNode4 = new Node("detail");
    localNode1.addNode(localNode4);
    Node localNode5 = new Node("UPnPError");
    localNode5.setAttribute("xmlns", "urn:schemas-upnp-org:control-1-0");
    localNode4.addNode(localNode5);
    Node localNode6 = new Node("errorCode");
    localNode6.setValue(paramInt);
    localNode5.addNode(localNode6);
    Node localNode7 = new Node("errorDescription");
    localNode7.setValue(paramString);
    localNode5.addNode(localNode7);
    return localNode1;
  }
  
  private Node getUPnPErrorCodeNode()
  {
    Node localNode = getUPnPErrorNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("errorCode");
  }
  
  private Node getUPnPErrorDescriptionNode()
  {
    Node localNode = getUPnPErrorNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("errorDescription");
  }
  
  private Node getUPnPErrorNode()
  {
    Node localNode = getFaultDetailNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getNodeEndsWith("UPnPError");
  }
  
  public UPnPStatus getUPnPError()
  {
    int i = getUPnPErrorCode();
    String str = getUPnPErrorDescription();
    this.upnpErr.setCode(i);
    this.upnpErr.setDescription(str);
    return this.upnpErr;
  }
  
  public int getUPnPErrorCode()
  {
    Node localNode = getUPnPErrorCodeNode();
    if (localNode == null) {
      return -1;
    }
    String str = localNode.getValue();
    try
    {
      int i = Integer.parseInt(str);
      return i;
    }
    catch (Exception localException) {}
    return -1;
  }
  
  public String getUPnPErrorDescription()
  {
    Node localNode = getUPnPErrorDescriptionNode();
    if (localNode == null) {
      return "";
    }
    return localNode.getValue();
  }
  
  public void setFaultResponse(int paramInt)
  {
    setFaultResponse(paramInt, UPnPStatus.code2String(paramInt));
  }
  
  public void setFaultResponse(int paramInt, String paramString)
  {
    setStatusCode(500);
    getBodyNode().addNode(createFaultResponseNode(paramInt, paramString));
    setContent(getEnvelopeNode());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/ControlResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */