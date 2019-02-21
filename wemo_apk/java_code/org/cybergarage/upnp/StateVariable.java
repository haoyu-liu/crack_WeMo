package org.cybergarage.upnp;

import java.util.Iterator;
import org.cybergarage.upnp.control.QueryListener;
import org.cybergarage.upnp.control.QueryRequest;
import org.cybergarage.upnp.control.QueryResponse;
import org.cybergarage.upnp.xml.NodeData;
import org.cybergarage.upnp.xml.StateVariableData;
import org.cybergarage.util.Debug;
import org.cybergarage.xml.Node;

public class StateVariable
  extends NodeData
{
  private static final String DATATYPE = "dataType";
  private static final String DEFAULT_VALUE = "defaultValue";
  public static final String ELEM_NAME = "stateVariable";
  private static final String NAME = "name";
  private static final String SENDEVENTS = "sendEvents";
  private static final String SENDEVENTS_NO = "no";
  private static final String SENDEVENTS_YES = "yes";
  private Node serviceNode;
  private Node stateVariableNode;
  private UPnPStatus upnpStatus = new UPnPStatus();
  private Object userData = null;
  
  public StateVariable()
  {
    this.serviceNode = null;
    this.stateVariableNode = new Node("stateVariable");
  }
  
  public StateVariable(Node paramNode1, Node paramNode2)
  {
    this.serviceNode = paramNode1;
    this.stateVariableNode = paramNode2;
  }
  
  public static boolean isStateVariableNode(Node paramNode)
  {
    return "stateVariable".equals(paramNode.getName());
  }
  
  private void setQueryResponse(QueryResponse paramQueryResponse)
  {
    getStateVariableData().setQueryResponse(paramQueryResponse);
  }
  
  public AllowedValueList getAllowedValueList()
  {
    AllowedValueList localAllowedValueList = new AllowedValueList();
    Node localNode1 = getStateVariableNode().getNode("allowedValueList");
    if (localNode1 == null)
    {
      localAllowedValueList = null;
      return localAllowedValueList;
    }
    int i = localNode1.getNNodes();
    int j = 0;
    label34:
    Node localNode2;
    if (j < i)
    {
      localNode2 = localNode1.getNode(j);
      if (AllowedValue.isAllowedValueNode(localNode2)) {
        break label62;
      }
    }
    for (;;)
    {
      j++;
      break label34;
      break;
      label62:
      localAllowedValueList.add(new AllowedValue(localNode2));
    }
  }
  
  public AllowedValueRange getAllowedValueRange()
  {
    Node localNode = getStateVariableNode().getNode("allowedValueRange");
    if (localNode == null) {
      return null;
    }
    return new AllowedValueRange(localNode);
  }
  
  public String getDataType()
  {
    return getStateVariableNode().getNodeValue("dataType");
  }
  
  public String getDefaultValue()
  {
    return getStateVariableNode().getNodeValue("defaultValue");
  }
  
  public String getName()
  {
    return getStateVariableNode().getNodeValue("name");
  }
  
  public QueryListener getQueryListener()
  {
    return getStateVariableData().getQueryListener();
  }
  
  public QueryResponse getQueryResponse()
  {
    return getStateVariableData().getQueryResponse();
  }
  
  public UPnPStatus getQueryStatus()
  {
    return getQueryResponse().getUPnPError();
  }
  
  public Service getService()
  {
    Node localNode = getServiceNode();
    if (localNode == null) {
      return null;
    }
    return new Service(localNode);
  }
  
  public Node getServiceNode()
  {
    return this.serviceNode;
  }
  
  public StateVariableData getStateVariableData()
  {
    Node localNode = getStateVariableNode();
    StateVariableData localStateVariableData = (StateVariableData)localNode.getUserData();
    if (localStateVariableData == null)
    {
      localStateVariableData = new StateVariableData();
      localNode.setUserData(localStateVariableData);
      localStateVariableData.setNode(localNode);
    }
    return localStateVariableData;
  }
  
  public Node getStateVariableNode()
  {
    return this.stateVariableNode;
  }
  
  public UPnPStatus getStatus()
  {
    return this.upnpStatus;
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public String getValue()
  {
    return getStateVariableData().getValue();
  }
  
  public boolean hasAllowedValueList()
  {
    return getAllowedValueList() != null;
  }
  
  public boolean hasAllowedValueRange()
  {
    return getAllowedValueRange() != null;
  }
  
  public boolean isSendEvents()
  {
    String str = getStateVariableNode().getAttributeValue("sendEvents");
    if (str == null) {}
    while (str.equalsIgnoreCase("yes") != true) {
      return false;
    }
    return true;
  }
  
  public boolean performQueryListener(QueryRequest paramQueryRequest)
  {
    QueryListener localQueryListener = getQueryListener();
    if (localQueryListener == null) {
      return false;
    }
    QueryResponse localQueryResponse = new QueryResponse();
    StateVariable localStateVariable = new StateVariable();
    localStateVariable.set(this);
    localStateVariable.setValue("");
    localStateVariable.setStatus(404);
    if (localQueryListener.queryControlReceived(localStateVariable) == true) {
      localQueryResponse.setResponse(localStateVariable);
    }
    for (;;)
    {
      paramQueryRequest.post(localQueryResponse);
      return true;
      UPnPStatus localUPnPStatus = localStateVariable.getStatus();
      localQueryResponse.setFaultResponse(localUPnPStatus.getCode(), localUPnPStatus.getDescription());
    }
  }
  
  public boolean postQuerylAction()
  {
    QueryRequest localQueryRequest = new QueryRequest();
    localQueryRequest.setRequest(this);
    if (Debug.isOn() == true) {
      localQueryRequest.print();
    }
    QueryResponse localQueryResponse = localQueryRequest.post(180000, 30000);
    if (Debug.isOn() == true) {
      localQueryResponse.print();
    }
    setQueryResponse(localQueryResponse);
    if (!localQueryResponse.isSuccessful())
    {
      setValue(localQueryResponse.getReturnValue());
      return false;
    }
    setValue(localQueryResponse.getReturnValue());
    return true;
  }
  
  public void set(StateVariable paramStateVariable)
  {
    setName(paramStateVariable.getName());
    setValue(paramStateVariable.getValue());
    setDataType(paramStateVariable.getDataType());
    setSendEvents(paramStateVariable.isSendEvents());
  }
  
  public void setAllowedValueList(AllowedValueList paramAllowedValueList)
  {
    getStateVariableNode().removeNode("allowedValueList");
    getStateVariableNode().removeNode("allowedValueRange");
    Node localNode = new Node("allowedValueList");
    Iterator localIterator = paramAllowedValueList.iterator();
    while (localIterator.hasNext()) {
      localNode.addNode(((AllowedValue)localIterator.next()).getAllowedValueNode());
    }
    getStateVariableNode().addNode(localNode);
  }
  
  public void setAllowedValueRange(AllowedValueRange paramAllowedValueRange)
  {
    getStateVariableNode().removeNode("allowedValueList");
    getStateVariableNode().removeNode("allowedValueRange");
    getStateVariableNode().addNode(paramAllowedValueRange.getAllowedValueRangeNode());
  }
  
  public void setDataType(String paramString)
  {
    getStateVariableNode().setNode("dataType", paramString);
  }
  
  public void setDefaultValue(String paramString)
  {
    getStateVariableNode().setNode("defaultValue", paramString);
  }
  
  public void setName(String paramString)
  {
    getStateVariableNode().setNode("name", paramString);
  }
  
  public void setQueryListener(QueryListener paramQueryListener)
  {
    getStateVariableData().setQueryListener(paramQueryListener);
  }
  
  public void setSendEvents(boolean paramBoolean)
  {
    Node localNode = getStateVariableNode();
    if (paramBoolean == true) {}
    for (String str = "yes";; str = "no")
    {
      localNode.setAttribute("sendEvents", str);
      return;
    }
  }
  
  void setServiceNode(Node paramNode)
  {
    this.serviceNode = paramNode;
  }
  
  public void setStatus(int paramInt)
  {
    setStatus(paramInt, UPnPStatus.code2String(paramInt));
  }
  
  public void setStatus(int paramInt, String paramString)
  {
    this.upnpStatus.setCode(paramInt);
    this.upnpStatus.setDescription(paramString);
  }
  
  public void setUserData(Object paramObject)
  {
    this.userData = paramObject;
  }
  
  public void setValue(int paramInt)
  {
    setValue(Integer.toString(paramInt));
  }
  
  public void setValue(long paramLong)
  {
    setValue(Long.toString(paramLong));
  }
  
  public void setValue(String paramString)
  {
    String str = getStateVariableData().getValue();
    if ((str != null) && (str.equals(paramString) == true)) {}
    Service localService;
    do
    {
      return;
      getStateVariableData().setValue(paramString);
      localService = getService();
    } while ((localService == null) || (!isSendEvents()));
    localService.notify(this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/StateVariable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */