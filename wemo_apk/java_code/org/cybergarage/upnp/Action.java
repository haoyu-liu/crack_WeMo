package org.cybergarage.upnp;

import android.util.Log;
import java.io.PrintStream;
import java.util.Iterator;
import org.cybergarage.upnp.control.ActionListener;
import org.cybergarage.upnp.control.ActionRequest;
import org.cybergarage.upnp.control.ActionResponse;
import org.cybergarage.upnp.control.ControlResponse;
import org.cybergarage.upnp.xml.ActionData;
import org.cybergarage.util.Debug;
import org.cybergarage.util.Mutex;
import org.cybergarage.xml.Node;

public class Action
{
  public static final String ELEM_NAME = "action";
  private static final String NAME = "name";
  private Node actionNode;
  private Mutex mutex = new Mutex();
  private Node serviceNode;
  private UPnPStatus upnpStatus = new UPnPStatus();
  private Object userData = null;
  
  public Action(Action paramAction)
  {
    this.serviceNode = paramAction.getServiceNode();
    this.actionNode = paramAction.getActionNode();
  }
  
  public Action(Node paramNode)
  {
    this.serviceNode = paramNode;
    this.actionNode = new Node("action");
  }
  
  public Action(Node paramNode1, Node paramNode2)
  {
    this.serviceNode = paramNode1;
    this.actionNode = paramNode2;
  }
  
  private void clearOutputAgumentValues()
  {
    ArgumentList localArgumentList = getArgumentList();
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
        localArgument.setValue("");
      }
    }
  }
  
  private ActionData getActionData()
  {
    Node localNode = getActionNode();
    ActionData localActionData = (ActionData)localNode.getUserData();
    if (localActionData == null)
    {
      localActionData = new ActionData();
      localNode.setUserData(localActionData);
      localActionData.setNode(localNode);
    }
    return localActionData;
  }
  
  private ControlResponse getControlResponse()
  {
    return getActionData().getControlResponse();
  }
  
  private Node getServiceNode()
  {
    return this.serviceNode;
  }
  
  public static boolean isActionNode(Node paramNode)
  {
    return "action".equals(paramNode.getName());
  }
  
  private void setControlResponse(ControlResponse paramControlResponse)
  {
    getActionData().setControlResponse(paramControlResponse);
  }
  
  public ActionListener getActionListener()
  {
    return getActionData().getActionListener();
  }
  
  public Node getActionNode()
  {
    return this.actionNode;
  }
  
  public Argument getArgument(String paramString)
  {
    ArgumentList localArgumentList = getArgumentList();
    int i = localArgumentList.size();
    int j = 0;
    if (j < i)
    {
      Argument localArgument = localArgumentList.getArgument(j);
      String str = localArgument.getName();
      if (str == null) {}
      while (paramString.equals(str) != true)
      {
        j++;
        break;
      }
      return localArgument;
    }
    return null;
  }
  
  public int getArgumentIntegerValue(String paramString)
  {
    Argument localArgument = getArgument(paramString);
    if (localArgument == null) {
      return 0;
    }
    return localArgument.getIntegerValue();
  }
  
  public ArgumentList getArgumentList()
  {
    ArgumentList localArgumentList = new ArgumentList();
    Node localNode1 = getActionNode().getNode("argumentList");
    if (localNode1 == null) {
      return localArgumentList;
    }
    int i = localNode1.getNNodes();
    int j = 0;
    label32:
    Node localNode2;
    if (j < i)
    {
      localNode2 = localNode1.getNode(j);
      if (Argument.isArgumentNode(localNode2)) {
        break label60;
      }
    }
    for (;;)
    {
      j++;
      break label32;
      break;
      label60:
      localArgumentList.add(new Argument(getServiceNode(), localNode2));
    }
  }
  
  public String getArgumentValue(String paramString)
  {
    Argument localArgument = getArgument(paramString);
    if (localArgument == null) {
      return "";
    }
    return localArgument.getValue();
  }
  
  public UPnPStatus getControlStatus()
  {
    return getControlResponse().getUPnPError();
  }
  
  public ArgumentList getInputArgumentList()
  {
    ArgumentList localArgumentList1 = getArgumentList();
    int i = localArgumentList1.size();
    ArgumentList localArgumentList2 = new ArgumentList();
    int j = 0;
    if (j < i)
    {
      Argument localArgument = localArgumentList1.getArgument(j);
      if (!localArgument.isInDirection()) {}
      for (;;)
      {
        j++;
        break;
        localArgumentList2.add(localArgument);
      }
    }
    return localArgumentList2;
  }
  
  public String getName()
  {
    return getActionNode().getNodeValue("name");
  }
  
  public ArgumentList getOutputArgumentList()
  {
    ArgumentList localArgumentList1 = getArgumentList();
    int i = localArgumentList1.size();
    ArgumentList localArgumentList2 = new ArgumentList();
    int j = 0;
    if (j < i)
    {
      Argument localArgument = localArgumentList1.getArgument(j);
      if (!localArgument.isOutDirection()) {}
      for (;;)
      {
        j++;
        break;
        localArgumentList2.add(localArgument);
      }
    }
    return localArgumentList2;
  }
  
  public Service getService()
  {
    return new Service(getServiceNode());
  }
  
  public UPnPStatus getStatus()
  {
    return this.upnpStatus;
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public void lock()
  {
    this.mutex.lock();
  }
  
  public boolean performActionListener(ActionRequest paramActionRequest)
  {
    ActionListener localActionListener = getActionListener();
    if (localActionListener == null) {
      return false;
    }
    ActionResponse localActionResponse = new ActionResponse();
    setStatus(401);
    clearOutputAgumentValues();
    if (localActionListener.actionControlReceived(this) == true) {
      localActionResponse.setResponse(this);
    }
    for (;;)
    {
      if (Debug.isOn() == true) {
        localActionResponse.print();
      }
      paramActionRequest.post(localActionResponse);
      return true;
      UPnPStatus localUPnPStatus = getStatus();
      localActionResponse.setFaultResponse(localUPnPStatus.getCode(), localUPnPStatus.getDescription());
    }
  }
  
  public String postControlAction()
  {
    return postControlAction(180000, 30000);
  }
  
  public String postControlAction(int paramInt1, int paramInt2)
  {
    ArgumentList localArgumentList1 = getArgumentList();
    ArgumentList localArgumentList2 = getInputArgumentList();
    ActionRequest localActionRequest = new ActionRequest();
    localActionRequest.setRequest(this, localArgumentList2);
    Log.d("CybverGarage", "Request recieved : " + localActionRequest);
    if (Debug.isOn() == true) {
      localActionRequest.print();
    }
    ActionResponse localActionResponse = localActionRequest.post(paramInt1, paramInt2);
    if (Debug.isOn() == true) {
      localActionResponse.print();
    }
    setControlResponse(localActionResponse);
    int i = localActionResponse.getStatusCode();
    String str = new String(localActionResponse.getContent());
    setStatus(i);
    if (!localActionResponse.isSuccessful()) {
      return null;
    }
    ArgumentList localArgumentList3 = localActionResponse.getResponse();
    try
    {
      localArgumentList1.setResArgs(localArgumentList3);
      Log.d("CybverGarage", "Response recieved : " + str);
      return str;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        setStatus(402, "Action succesfully delivered but invalid arguments returned.");
        Log.e("CybverGarage", "Action succesfully delivered but invalid arguments returned. " + localIllegalArgumentException.getMessage());
      }
    }
  }
  
  public void print()
  {
    System.out.println("Action : " + getName());
    ArgumentList localArgumentList = getArgumentList();
    int i = localArgumentList.size();
    for (int j = 0; j < i; j++)
    {
      Argument localArgument = localArgumentList.getArgument(j);
      String str1 = localArgument.getName();
      String str2 = localArgument.getValue();
      String str3 = localArgument.getDirection();
      System.out.println(" [" + j + "] = " + str3 + ", " + str1 + ", " + str2);
    }
  }
  
  public void setActionListener(ActionListener paramActionListener)
  {
    getActionData().setActionListener(paramActionListener);
  }
  
  public void setArgumentList(ArgumentList paramArgumentList)
  {
    Node localNode = getActionNode().getNode("argumentList");
    if (localNode == null)
    {
      localNode = new Node("argumentList");
      getActionNode().addNode(localNode);
    }
    for (;;)
    {
      Iterator localIterator = paramArgumentList.iterator();
      while (localIterator.hasNext())
      {
        Argument localArgument = (Argument)localIterator.next();
        localArgument.setService(getService());
        localNode.addNode(localArgument.getArgumentNode());
      }
      localNode.removeAllNodes();
    }
  }
  
  public void setArgumentValue(String paramString, int paramInt)
  {
    setArgumentValue(paramString, Integer.toString(paramInt));
  }
  
  public void setArgumentValue(String paramString1, String paramString2)
  {
    Argument localArgument = getArgument(paramString1);
    if (localArgument == null) {
      return;
    }
    localArgument.setValue(paramString2);
  }
  
  public void setArgumentValues(ArgumentList paramArgumentList)
  {
    getArgumentList().set(paramArgumentList);
  }
  
  public void setInArgumentValues(ArgumentList paramArgumentList)
  {
    getArgumentList().setReqArgs(paramArgumentList);
  }
  
  public void setName(String paramString)
  {
    getActionNode().setNode("name", paramString);
  }
  
  public void setOutArgumentValues(ArgumentList paramArgumentList)
  {
    getArgumentList().setResArgs(paramArgumentList);
  }
  
  void setService(Service paramService)
  {
    this.serviceNode = paramService.getServiceNode();
    Iterator localIterator = getArgumentList().iterator();
    while (localIterator.hasNext()) {
      ((Argument)localIterator.next()).setService(paramService);
    }
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
  
  public void unlock()
  {
    this.mutex.unlock();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/Action.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */