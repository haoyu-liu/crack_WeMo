package org.cybergarage.upnp;

import com.belkin.wemo.storage.FileStorage;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.Iterator;
import org.cybergarage.http.HTTP;
import org.cybergarage.http.HTTPResponse;
import org.cybergarage.upnp.control.ActionListener;
import org.cybergarage.upnp.control.QueryListener;
import org.cybergarage.upnp.device.InvalidDescriptionException;
import org.cybergarage.upnp.device.ST;
import org.cybergarage.upnp.event.NotifyRequest;
import org.cybergarage.upnp.event.Subscriber;
import org.cybergarage.upnp.event.SubscriberList;
import org.cybergarage.upnp.ssdp.SSDPNotifyRequest;
import org.cybergarage.upnp.ssdp.SSDPNotifySocket;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.upnp.xml.ServiceData;
import org.cybergarage.util.Debug;
import org.cybergarage.util.Mutex;
import org.cybergarage.util.StringUtil;
import org.cybergarage.xml.Node;
import org.cybergarage.xml.Parser;
import org.cybergarage.xml.ParserException;

public class Service
{
  private static final String CONTROL_URL = "controlURL";
  public static final String ELEM_NAME = "service";
  private static final String EVENT_SUB_URL = "eventSubURL";
  public static final String MAJOR = "major";
  public static final String MAJOR_VALUE = "1";
  public static final String MINOR = "minor";
  public static final String MINOR_VALUE = "0";
  private static final String SCPDURL = "SCPDURL";
  public static final String SCPD_ROOTNODE = "scpd";
  public static final String SCPD_ROOTNODE_NS = "urn:schemas-upnp-org:service-1-0";
  private static final String SERVICE_ID = "serviceId";
  private static final String SERVICE_TYPE = "serviceType";
  public static final String SPEC_VERSION = "specVersion";
  private Mutex mutex = new Mutex();
  private Node serviceNode;
  private Object userData = null;
  
  public Service()
  {
    this(new Node("service"));
    Node localNode1 = new Node("specVersion");
    Node localNode2 = new Node("major");
    localNode2.setValue("1");
    localNode1.addNode(localNode2);
    Node localNode3 = new Node("minor");
    localNode3.setValue("0");
    localNode1.addNode(localNode3);
    Node localNode4 = new Node("scpd");
    localNode4.addAttribute("xmlns", "urn:schemas-upnp-org:service-1-0");
    localNode4.addNode(localNode1);
    getServiceData().setSCPDNode(localNode4);
  }
  
  public Service(Node paramNode)
  {
    this.serviceNode = paramNode;
  }
  
  private Node getDeviceNode()
  {
    Node localNode = getServiceNode().getParentNode();
    if (localNode == null) {
      return null;
    }
    return localNode.getParentNode();
  }
  
  private String getNotifyServiceTypeNT()
  {
    return getServiceType();
  }
  
  private String getNotifyServiceTypeUSN()
  {
    return getDevice().getUDN() + "::" + getServiceType();
  }
  
  private Node getRootNode()
  {
    return getServiceNode().getRootNode();
  }
  
  private Node getSCPDNode()
  {
    ServiceData localServiceData = getServiceData();
    Object localObject1 = localServiceData.getSCPDNode();
    Object localObject2;
    if (localObject1 != null) {
      localObject2 = localObject1;
    }
    Device localDevice;
    do
    {
      return (Node)localObject2;
      localDevice = getDevice();
      localObject2 = null;
    } while (localDevice == null);
    String str1 = getSCPDURL();
    String str2 = localDevice.getDescriptionFilePath();
    if (str2 != null)
    {
      File localFile = new File(str2.concat(str1));
      if (localFile.exists())
      {
        try
        {
          Node localNode2 = getSCPDNode(localFile);
          localObject1 = localNode2;
        }
        catch (ParserException localParserException)
        {
          for (;;)
          {
            localParserException.printStackTrace();
          }
        }
        if (localObject1 != null)
        {
          localServiceData.setSCPDNode((Node)localObject1);
          return (Node)localObject1;
        }
      }
    }
    try
    {
      Node localNode1 = getSCPDNode(new URL(localDevice.getAbsoluteURL(str1)));
      if (localNode1 != null)
      {
        localServiceData.setSCPDNode(localNode1);
        return localNode1;
      }
    }
    catch (Exception localException1)
    {
      String str3 = localDevice.getDescriptionFilePath() + HTTP.toRelativeURL(str1);
      try
      {
        getSCPDNode(new File(str3));
        return null;
      }
      catch (Exception localException2)
      {
        Debug.warning(localException2);
      }
    }
    return null;
  }
  
  private Node getSCPDNode(File paramFile)
    throws ParserException
  {
    return UPnP.getXMLParser().parse(paramFile);
  }
  
  private Node getSCPDNode(URL paramURL)
    throws ParserException
  {
    return UPnP.getXMLParser().parse(FileStorage.getInstance(null).getDescriptionFile(paramURL, getDevice().getSerialNumber()));
  }
  
  private ServiceData getServiceData()
  {
    Node localNode = getServiceNode();
    ServiceData localServiceData = (ServiceData)localNode.getUserData();
    if (localServiceData == null)
    {
      localServiceData = new ServiceData();
      localNode.setUserData(localServiceData);
      localServiceData.setNode(localNode);
    }
    return localServiceData;
  }
  
  public static boolean isServiceNode(Node paramNode)
  {
    return "service".equals(paramNode.getName());
  }
  
  private boolean isURL(String paramString1, String paramString2)
  {
    boolean bool = true;
    if ((paramString1 == null) || (paramString2 == null)) {
      bool = false;
    }
    while ((paramString2.equals(paramString1) == bool) || (paramString2.equals(HTTP.toRelativeURL(paramString1, false)) == bool)) {
      return bool;
    }
    return false;
  }
  
  private boolean notify(Subscriber paramSubscriber, StateVariable paramStateVariable)
  {
    String str1 = paramStateVariable.getName();
    String str2 = paramStateVariable.getValue();
    String str3 = paramSubscriber.getDeliveryHost();
    int i = paramSubscriber.getDeliveryPort();
    NotifyRequest localNotifyRequest = new NotifyRequest();
    localNotifyRequest.setRequest(paramSubscriber, str1, str2);
    if (!localNotifyRequest.post(str3, i).isSuccessful()) {
      return false;
    }
    paramSubscriber.incrementNotifyCount();
    return true;
  }
  
  public void addAction(Action paramAction)
  {
    Iterator localIterator = paramAction.getArgumentList().iterator();
    while (localIterator.hasNext()) {
      ((Argument)localIterator.next()).setService(this);
    }
    Node localNode1 = getSCPDNode();
    Node localNode2 = localNode1.getNode("actionList");
    if (localNode2 == null)
    {
      localNode2 = new Node("actionList");
      localNode1.addNode(localNode2);
    }
    localNode2.addNode(paramAction.getActionNode());
  }
  
  public void addStateVariable(StateVariable paramStateVariable)
  {
    Node localNode = getSCPDNode().getNode("serviceStateTable");
    if (localNode == null)
    {
      localNode = new Node("serviceStateTable");
      getSCPDNode().addNode(localNode);
    }
    paramStateVariable.setServiceNode(getServiceNode());
    localNode.addNode(paramStateVariable.getStateVariableNode());
  }
  
  public void addSubscriber(Subscriber paramSubscriber)
  {
    getSubscriberList().add(paramSubscriber);
  }
  
  public void announce(String paramString)
  {
    String str1 = getRootDevice().getLocationURL(paramString);
    String str2 = getNotifyServiceTypeNT();
    String str3 = getNotifyServiceTypeUSN();
    Device localDevice = getDevice();
    SSDPNotifyRequest localSSDPNotifyRequest = new SSDPNotifyRequest();
    localSSDPNotifyRequest.setServer(UPnP.getServerName());
    localSSDPNotifyRequest.setLeaseTime(localDevice.getLeaseTime());
    localSSDPNotifyRequest.setLocation(str1);
    localSSDPNotifyRequest.setNTS("ssdp:alive");
    localSSDPNotifyRequest.setNT(str2);
    localSSDPNotifyRequest.setUSN(str3);
    SSDPNotifySocket localSSDPNotifySocket = new SSDPNotifySocket(paramString);
    Device.notifyWait();
    localSSDPNotifySocket.post(localSSDPNotifyRequest);
  }
  
  public void byebye(String paramString)
  {
    String str1 = getNotifyServiceTypeNT();
    String str2 = getNotifyServiceTypeUSN();
    SSDPNotifyRequest localSSDPNotifyRequest = new SSDPNotifyRequest();
    localSSDPNotifyRequest.setNTS("ssdp:byebye");
    localSSDPNotifyRequest.setNT(str1);
    localSSDPNotifyRequest.setUSN(str2);
    SSDPNotifySocket localSSDPNotifySocket = new SSDPNotifySocket(paramString);
    Device.notifyWait();
    localSSDPNotifySocket.post(localSSDPNotifyRequest);
  }
  
  public void clearSID()
  {
    setSID("");
    setTimeout(0L);
  }
  
  public Action getAction(String paramString)
  {
    ActionList localActionList = getActionList();
    int i = localActionList.size();
    int j = 0;
    if (j < i)
    {
      Action localAction = localActionList.getAction(j);
      String str = localAction.getName();
      if (str == null) {}
      while (str.equals(paramString) != true)
      {
        j++;
        break;
      }
      return localAction;
    }
    return null;
  }
  
  public ActionList getActionList()
  {
    ActionList localActionList = new ActionList();
    Node localNode1 = getSCPDNode();
    if (localNode1 == null) {}
    Node localNode2;
    do
    {
      return localActionList;
      localNode2 = localNode1.getNode("actionList");
    } while (localNode2 == null);
    int i = localNode2.getNNodes();
    int j = 0;
    label40:
    Node localNode3;
    if (j < i)
    {
      localNode3 = localNode2.getNode(j);
      if (Action.isActionNode(localNode3)) {
        break label69;
      }
    }
    for (;;)
    {
      j++;
      break label40;
      break;
      label69:
      localActionList.add(new Action(this.serviceNode, localNode3));
    }
  }
  
  public String getControlURL()
  {
    return getServiceNode().getNodeValue("controlURL");
  }
  
  public String getDescriptionURL()
  {
    return getServiceData().getDescriptionURL();
  }
  
  public Device getDevice()
  {
    return new Device(getRootNode(), getDeviceNode());
  }
  
  public String getEventSubURL()
  {
    return getServiceNode().getNodeValue("eventSubURL");
  }
  
  public Device getRootDevice()
  {
    return getDevice().getRootDevice();
  }
  
  public byte[] getSCPDData()
  {
    Node localNode = getSCPDNode();
    if (localNode == null) {
      return new byte[0];
    }
    String str1 = new String();
    String str2 = str1 + "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    String str3 = str2 + "\n";
    return (str3 + localNode.toString()).getBytes();
  }
  
  public String getSCPDDataS()
  {
    Node localNode = getSCPDNode();
    if (localNode == null) {
      return null;
    }
    String str1 = new String();
    String str2 = str1 + "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    String str3 = str2 + "\n";
    return str3 + localNode.toString();
  }
  
  public String getSCPDURL()
  {
    return getServiceNode().getNodeValue("SCPDURL");
  }
  
  public String getSID()
  {
    return getServiceData().getSID();
  }
  
  public String getServiceID()
  {
    return getServiceNode().getNodeValue("serviceId");
  }
  
  public Node getServiceNode()
  {
    return this.serviceNode;
  }
  
  public ServiceStateTable getServiceStateTable()
  {
    ServiceStateTable localServiceStateTable = new ServiceStateTable();
    Node localNode1 = getSCPDNode().getNode("serviceStateTable");
    if (localNode1 == null) {
      return localServiceStateTable;
    }
    Node localNode2 = getServiceNode();
    int i = localNode1.getNNodes();
    int j = 0;
    label39:
    Node localNode3;
    if (j < i)
    {
      localNode3 = localNode1.getNode(j);
      if (StateVariable.isStateVariableNode(localNode3)) {
        break label68;
      }
    }
    for (;;)
    {
      j++;
      break label39;
      break;
      label68:
      localServiceStateTable.add(new StateVariable(localNode2, localNode3));
    }
  }
  
  public String getServiceType()
  {
    return getServiceNode().getNodeValue("serviceType");
  }
  
  public StateVariable getStateVariable(String paramString)
  {
    ServiceStateTable localServiceStateTable = getServiceStateTable();
    int i = localServiceStateTable.size();
    int j = 0;
    if (j < i)
    {
      StateVariable localStateVariable = localServiceStateTable.getStateVariable(j);
      String str = localStateVariable.getName();
      if (str == null) {}
      while (str.equals(paramString) != true)
      {
        j++;
        break;
      }
      return localStateVariable;
    }
    return null;
  }
  
  public Subscriber getSubscriber(String paramString)
  {
    SubscriberList localSubscriberList = getSubscriberList();
    int i = localSubscriberList.size();
    int j = 0;
    if (j < i)
    {
      Subscriber localSubscriber = localSubscriberList.getSubscriber(j);
      if (localSubscriber == null) {}
      String str;
      do
      {
        j++;
        break;
        str = localSubscriber.getSID();
      } while ((str == null) || (str.equals(paramString) != true));
      return localSubscriber;
    }
    return null;
  }
  
  public SubscriberList getSubscriberList()
  {
    return getServiceData().getSubscriberList();
  }
  
  public long getTimeout()
  {
    return getServiceData().getTimeout();
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public boolean hasSID()
  {
    return StringUtil.hasData(getSID());
  }
  
  public boolean hasStateVariable(String paramString)
  {
    return getStateVariable(paramString) != null;
  }
  
  public boolean isControlURL(String paramString)
  {
    return isURL(getControlURL(), paramString);
  }
  
  public boolean isEventSubURL(String paramString)
  {
    return isURL(getEventSubURL(), paramString);
  }
  
  public boolean isSCPDURL(String paramString)
  {
    return isURL(getSCPDURL(), paramString);
  }
  
  public boolean isService(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return false;
      if (paramString.endsWith(getServiceType()) == true) {
        return true;
      }
    } while (paramString.endsWith(getServiceID()) != true);
    return true;
  }
  
  public boolean isSubscribed()
  {
    return hasSID();
  }
  
  public boolean loadSCPD(File paramFile)
    throws ParserException
  {
    Node localNode = UPnP.getXMLParser().parse(paramFile);
    if (localNode == null) {
      return false;
    }
    getServiceData().setSCPDNode(localNode);
    return true;
  }
  
  public boolean loadSCPD(InputStream paramInputStream)
    throws ParserException
  {
    Node localNode = UPnP.getXMLParser().parse(paramInputStream);
    if (localNode == null) {
      return false;
    }
    getServiceData().setSCPDNode(localNode);
    return true;
  }
  
  public boolean loadSCPD(String paramString)
    throws InvalidDescriptionException
  {
    try
    {
      Node localNode = UPnP.getXMLParser().parse(paramString);
      if (localNode == null) {
        return false;
      }
      getServiceData().setSCPDNode(localNode);
      return true;
    }
    catch (ParserException localParserException)
    {
      throw new InvalidDescriptionException(localParserException);
    }
  }
  
  public void lock()
  {
    this.mutex.lock();
  }
  
  public void notify(StateVariable paramStateVariable)
  {
    SubscriberList localSubscriberList = getSubscriberList();
    int i = localSubscriberList.size();
    Subscriber[] arrayOfSubscriber1 = new Subscriber[i];
    for (int j = 0; j < i; j++) {
      arrayOfSubscriber1[j] = localSubscriberList.getSubscriber(j);
    }
    int k = 0;
    if (k < i)
    {
      Subscriber localSubscriber2 = arrayOfSubscriber1[k];
      if (localSubscriber2 == null) {}
      for (;;)
      {
        k++;
        break;
        if (localSubscriber2.isExpired() == true) {
          removeSubscriber(localSubscriber2);
        }
      }
    }
    int m = localSubscriberList.size();
    Subscriber[] arrayOfSubscriber2 = new Subscriber[m];
    for (int n = 0; n < m; n++) {
      arrayOfSubscriber2[n] = localSubscriberList.getSubscriber(n);
    }
    int i1 = 0;
    if (i1 < m)
    {
      Subscriber localSubscriber1 = arrayOfSubscriber2[i1];
      if (localSubscriber1 == null) {}
      for (;;)
      {
        i1++;
        break;
        if (notify(localSubscriber1, paramStateVariable)) {}
      }
    }
  }
  
  public void notifyAllStateVariables()
  {
    ServiceStateTable localServiceStateTable = getServiceStateTable();
    int i = localServiceStateTable.size();
    for (int j = 0; j < i; j++)
    {
      StateVariable localStateVariable = localServiceStateTable.getStateVariable(j);
      if (localStateVariable.isSendEvents() == true) {
        notify(localStateVariable);
      }
    }
  }
  
  public void removeSubscriber(Subscriber paramSubscriber)
  {
    getSubscriberList().remove(paramSubscriber);
  }
  
  public boolean serviceSearchResponse(SSDPPacket paramSSDPPacket)
  {
    boolean bool = true;
    String str1 = paramSSDPPacket.getST();
    if (str1 == null) {
      bool = false;
    }
    Device localDevice;
    String str3;
    String str4;
    do
    {
      do
      {
        return bool;
        localDevice = getDevice();
        String str2 = getNotifyServiceTypeNT();
        str3 = getNotifyServiceTypeUSN();
        if (ST.isAllDevice(str1) == bool)
        {
          localDevice.postSearchResponse(paramSSDPPacket, str2, str3);
          return bool;
        }
      } while (ST.isURNService(str1) != bool);
      str4 = getServiceType();
    } while (str1.equals(str4) != bool);
    localDevice.postSearchResponse(paramSSDPPacket, str4, str3);
    return bool;
  }
  
  public void setActionListener(ActionListener paramActionListener)
  {
    ActionList localActionList = getActionList();
    int i = localActionList.size();
    for (int j = 0; j < i; j++) {
      localActionList.getAction(j).setActionListener(paramActionListener);
    }
  }
  
  public void setControlURL(String paramString)
  {
    getServiceNode().setNode("controlURL", paramString);
  }
  
  public void setDescriptionURL(String paramString)
  {
    getServiceData().setDescriptionURL(paramString);
  }
  
  public void setEventSubURL(String paramString)
  {
    getServiceNode().setNode("eventSubURL", paramString);
  }
  
  public void setQueryListener(QueryListener paramQueryListener)
  {
    ServiceStateTable localServiceStateTable = getServiceStateTable();
    int i = localServiceStateTable.size();
    for (int j = 0; j < i; j++) {
      localServiceStateTable.getStateVariable(j).setQueryListener(paramQueryListener);
    }
  }
  
  public void setSCPDURL(String paramString)
  {
    getServiceNode().setNode("SCPDURL", paramString);
  }
  
  public void setSID(String paramString)
  {
    getServiceData().setSID(paramString);
  }
  
  public void setServiceID(String paramString)
  {
    getServiceNode().setNode("serviceId", paramString);
  }
  
  public void setServiceType(String paramString)
  {
    getServiceNode().setNode("serviceType", paramString);
  }
  
  public void setTimeout(long paramLong)
  {
    getServiceData().setTimeout(paramLong);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/Service.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */