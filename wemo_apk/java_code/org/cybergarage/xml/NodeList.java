package org.cybergarage.xml;

import java.util.Vector;

public class NodeList
  extends Vector
{
  public Node getEndsWith(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    int i = size();
    int j = 0;
    if (j < i)
    {
      Node localNode = getNode(j);
      String str = localNode.getName();
      if (str == null) {}
      while (str.endsWith(paramString) != true)
      {
        j++;
        break;
      }
      return localNode;
    }
    return null;
  }
  
  public Node getNode(int paramInt)
  {
    return (Node)get(paramInt);
  }
  
  public Node getNode(String paramString)
  {
    Node localNode;
    if (paramString == null)
    {
      localNode = null;
      return localNode;
    }
    int i = size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        break label47;
      }
      localNode = getNode(j);
      if (paramString.compareTo(localNode.getName()) == 0) {
        break;
      }
    }
    label47:
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/NodeList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */