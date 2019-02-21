package org.cybergarage.xml;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

public class Node
{
  private AttributeList attrList = new AttributeList();
  private String name = new String();
  private NodeList nodeList = new NodeList();
  private Node parentNode = null;
  private Object userData = null;
  private String value = new String();
  
  public Node()
  {
    setUserData(null);
    setParentNode(null);
  }
  
  public Node(String paramString)
  {
    this();
    setName(paramString);
  }
  
  public Node(String paramString1, String paramString2)
  {
    this();
    setName(paramString1, paramString2);
  }
  
  public void addAttribute(String paramString1, String paramString2)
  {
    addAttribute(new Attribute(paramString1, paramString2));
  }
  
  public void addAttribute(Attribute paramAttribute)
  {
    this.attrList.add(paramAttribute);
  }
  
  public void addNode(Node paramNode)
  {
    paramNode.setParentNode(this);
    this.nodeList.add(paramNode);
  }
  
  public void addValue(String paramString)
  {
    if (this.value == null) {
      this.value = paramString;
    }
    while (paramString == null) {
      return;
    }
    this.value += paramString;
  }
  
  public Attribute getAttribute(int paramInt)
  {
    return this.attrList.getAttribute(paramInt);
  }
  
  public Attribute getAttribute(String paramString)
  {
    return this.attrList.getAttribute(paramString);
  }
  
  public int getAttributeIntegerValue(String paramString)
  {
    String str = getAttributeValue(paramString);
    try
    {
      int i = Integer.parseInt(str);
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public String getAttributeValue(String paramString)
  {
    Attribute localAttribute = getAttribute(paramString);
    if (localAttribute != null) {
      return localAttribute.getValue();
    }
    return "";
  }
  
  public String getIndentLevelString(int paramInt)
  {
    return getIndentLevelString(paramInt, "   ");
  }
  
  public String getIndentLevelString(int paramInt, String paramString)
  {
    StringBuffer localStringBuffer = new StringBuffer(paramInt * paramString.length());
    for (int i = 0; i < paramInt; i++) {
      localStringBuffer.append(paramString);
    }
    return localStringBuffer.toString();
  }
  
  public int getIndex(String paramString)
  {
    int i = -1;
    Iterator localIterator = this.nodeList.iterator();
    while (localIterator.hasNext())
    {
      i++;
      if (((Node)localIterator.next()).getName().equals(paramString)) {
        return i;
      }
    }
    return i;
  }
  
  public int getNAttributes()
  {
    return this.attrList.size();
  }
  
  public int getNNodes()
  {
    return this.nodeList.size();
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public Node getNode(int paramInt)
  {
    return this.nodeList.getNode(paramInt);
  }
  
  public Node getNode(String paramString)
  {
    return this.nodeList.getNode(paramString);
  }
  
  public Node getNodeEndsWith(String paramString)
  {
    return this.nodeList.getEndsWith(paramString);
  }
  
  public String getNodeValue(String paramString)
  {
    Node localNode = getNode(paramString);
    if (localNode != null) {
      return localNode.getValue();
    }
    return "";
  }
  
  public Node getParentNode()
  {
    return this.parentNode;
  }
  
  public Node getRootNode()
  {
    Object localObject = null;
    for (Node localNode = getParentNode(); localNode != null; localNode = ((Node)localObject).getParentNode()) {
      localObject = localNode;
    }
    return (Node)localObject;
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public String getValue()
  {
    return this.value;
  }
  
  public boolean hasAttributes()
  {
    return getNAttributes() > 0;
  }
  
  public boolean hasNodes()
  {
    return getNNodes() > 0;
  }
  
  public void insertAttributeAt(Attribute paramAttribute, int paramInt)
  {
    this.attrList.insertElementAt(paramAttribute, paramInt);
  }
  
  public void insertNode(Node paramNode, int paramInt)
  {
    paramNode.setParentNode(this);
    this.nodeList.insertElementAt(paramNode, paramInt);
  }
  
  public boolean isName(String paramString)
  {
    return this.name.equals(paramString);
  }
  
  public void output(PrintWriter paramPrintWriter, int paramInt, boolean paramBoolean)
  {
    String str1 = getIndentLevelString(paramInt);
    String str2 = getName();
    String str3 = getValue();
    if ((!hasNodes()) || (!paramBoolean))
    {
      paramPrintWriter.print(str1 + "<" + str2);
      outputAttributes(paramPrintWriter);
      if ((str3 == null) || (str3.length() == 0))
      {
        paramPrintWriter.println("></" + str2 + ">");
        return;
      }
      paramPrintWriter.println(">" + XML.escapeXMLChars(str3) + "</" + str2 + ">");
      return;
    }
    paramPrintWriter.print(str1 + "<" + str2);
    outputAttributes(paramPrintWriter);
    paramPrintWriter.println(">");
    int i = getNNodes();
    for (int j = 0; j < i; j++) {
      getNode(j).output(paramPrintWriter, paramInt + 1, true);
    }
    paramPrintWriter.println(str1 + "</" + str2 + ">");
  }
  
  public void outputAttributes(PrintWriter paramPrintWriter)
  {
    int i = getNAttributes();
    for (int j = 0; j < i; j++)
    {
      Attribute localAttribute = getAttribute(j);
      paramPrintWriter.print(" " + localAttribute.getName() + "=\"" + XML.escapeXMLChars(localAttribute.getValue()) + "\"");
    }
  }
  
  public void print()
  {
    print(true);
  }
  
  public void print(boolean paramBoolean)
  {
    PrintWriter localPrintWriter = new PrintWriter(System.out);
    output(localPrintWriter, 0, paramBoolean);
    localPrintWriter.flush();
  }
  
  public void removeAllNodes()
  {
    this.nodeList.clear();
  }
  
  public boolean removeAttribute(String paramString)
  {
    return removeAttribute(getAttribute(paramString));
  }
  
  public boolean removeAttribute(Attribute paramAttribute)
  {
    return this.attrList.remove(paramAttribute);
  }
  
  public boolean removeNode(String paramString)
  {
    return this.nodeList.remove(getNode(paramString));
  }
  
  public boolean removeNode(Node paramNode)
  {
    paramNode.setParentNode(null);
    return this.nodeList.remove(paramNode);
  }
  
  public void setAttribute(String paramString, int paramInt)
  {
    setAttribute(paramString, Integer.toString(paramInt));
  }
  
  public void setAttribute(String paramString1, String paramString2)
  {
    Attribute localAttribute = getAttribute(paramString1);
    if (localAttribute != null)
    {
      localAttribute.setValue(paramString2);
      return;
    }
    addAttribute(new Attribute(paramString1, paramString2));
  }
  
  public void setName(String paramString)
  {
    this.name = paramString;
  }
  
  public void setName(String paramString1, String paramString2)
  {
    this.name = (paramString1 + ":" + paramString2);
  }
  
  public void setNameSpace(String paramString1, String paramString2)
  {
    setAttribute("xmlns:" + paramString1, paramString2);
  }
  
  public void setNode(String paramString1, String paramString2)
  {
    Node localNode1 = getNode(paramString1);
    if (localNode1 != null)
    {
      localNode1.setValue(paramString2);
      return;
    }
    Node localNode2 = new Node(paramString1);
    localNode2.setValue(paramString2);
    addNode(localNode2);
  }
  
  public void setParentNode(Node paramNode)
  {
    this.parentNode = paramNode;
  }
  
  public void setUserData(Object paramObject)
  {
    this.userData = paramObject;
  }
  
  public void setValue(int paramInt)
  {
    setValue(Integer.toString(paramInt));
  }
  
  public void setValue(String paramString)
  {
    this.value = paramString;
  }
  
  public String toString()
  {
    return toString("utf-8", true);
  }
  
  public String toString(String paramString, boolean paramBoolean)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    PrintWriter localPrintWriter = new PrintWriter(localByteArrayOutputStream);
    output(localPrintWriter, 0, paramBoolean);
    localPrintWriter.flush();
    if (paramString != null) {
      try
      {
        if (paramString.length() > 0)
        {
          String str = localByteArrayOutputStream.toString(paramString);
          return str;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
    }
    return localByteArrayOutputStream.toString();
  }
  
  public String toXMLString()
  {
    return toXMLString(true);
  }
  
  public String toXMLString(boolean paramBoolean)
  {
    return toString().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("&", "&amp;").replaceAll("\"", "&quot;").replaceAll("'", "&apos;");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/Node.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */