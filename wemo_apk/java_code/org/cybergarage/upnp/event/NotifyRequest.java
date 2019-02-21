package org.cybergarage.upnp.event;

import java.io.PrintStream;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.soap.SOAPRequest;
import org.cybergarage.xml.Node;

public class NotifyRequest
  extends SOAPRequest
{
  private static final String PROPERTY = "property";
  private static final String PROPERTYSET = "propertyset";
  private static final String XMLNS = "e";
  
  public NotifyRequest() {}
  
  public NotifyRequest(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
  }
  
  private Node createPropertySetNode(String paramString1, String paramString2)
  {
    Node localNode1 = new Node("propertyset");
    localNode1.setNameSpace("e", "urn:schemas-upnp-org:event-1-0");
    Node localNode2 = new Node("property");
    localNode1.addNode(localNode2);
    Node localNode3 = new Node(paramString1);
    localNode3.setValue(paramString2);
    localNode2.addNode(localNode3);
    return localNode1;
  }
  
  private Property getProperty(Node paramNode)
  {
    Property localProperty = new Property();
    if (paramNode == null) {
      return localProperty;
    }
    String str = paramNode.getName();
    int i = str.lastIndexOf(':');
    if (i != -1) {
      str = str.substring(i + 1);
    }
    if ((str.equalsIgnoreCase("StatusChange")) && (str.contains("StatusChange")))
    {
      System.out.println("VARNAODE*******" + paramNode.getValue() + "---" + paramNode.getParentNode() + "---" + paramNode.getName());
      paramNode.setValue(1);
      localProperty.setValue(paramNode.getValue());
      localProperty.setName(paramNode.getName());
      return localProperty;
    }
    localProperty.setValue(paramNode.getValue());
    localProperty.setName(str);
    return localProperty;
  }
  
  private Node getVariableNode()
  {
    Node localNode1 = getEnvelopeNode();
    if (localNode1 == null) {}
    Node localNode2;
    do
    {
      do
      {
        return null;
      } while (!localNode1.hasNodes());
      localNode2 = localNode1.getNode(0);
    } while (!localNode2.hasNodes());
    return localNode2.getNode(0);
  }
  
  public PropertyList getPropertyList()
  {
    PropertyList localPropertyList = new PropertyList();
    Node localNode1 = getEnvelopeNode();
    if (localNode1 != null)
    {
      int i = 0;
      if (i < localNode1.getNNodes())
      {
        Node localNode2 = localNode1.getNode(i);
        if (localNode2 == null) {}
        for (;;)
        {
          i++;
          break;
          localPropertyList.add(getProperty(localNode2.getNode(0)));
        }
      }
    }
    else
    {
      localPropertyList = null;
    }
    return localPropertyList;
  }
  
  public long getSEQ()
  {
    return getLongHeaderValue("SEQ");
  }
  
  public String getSID()
  {
    return Subscription.getSID(getHeaderValue("SID"));
  }
  
  public void setNT(String paramString)
  {
    setHeader("NT", paramString);
  }
  
  public void setNTS(String paramString)
  {
    setHeader("NTS", paramString);
  }
  
  public boolean setRequest(Subscriber paramSubscriber, String paramString1, String paramString2)
  {
    paramSubscriber.getDeliveryURL();
    String str1 = paramSubscriber.getSID();
    long l = paramSubscriber.getNotifyCount();
    String str2 = paramSubscriber.getDeliveryHost();
    String str3 = paramSubscriber.getDeliveryPath();
    int i = paramSubscriber.getDeliveryPort();
    setMethod("NOTIFY");
    setURI(str3);
    setHost(str2, i);
    setNT("upnp:event");
    setNTS("upnp:propchange");
    setSID(str1);
    setSEQ(l);
    setContentType("text/xml; charset=\"utf-8\"");
    setContent(createPropertySetNode(paramString1, paramString2));
    return true;
  }
  
  public void setSEQ(long paramLong)
  {
    setHeader("SEQ", Long.toString(paramLong));
  }
  
  public void setSID(String paramString)
  {
    setHeader("SID", Subscription.toSIDHeaderString(paramString));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/NotifyRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */