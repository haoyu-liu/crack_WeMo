package org.cybergarage.upnp;

import org.cybergarage.xml.Node;

public class AllowedValue
{
  public static final String ELEM_NAME = "allowedValue";
  private Node allowedValueNode;
  
  public AllowedValue(String paramString)
  {
    this.allowedValueNode = new Node("allowedValue");
    setValue(paramString);
  }
  
  public AllowedValue(Node paramNode)
  {
    this.allowedValueNode = paramNode;
  }
  
  public static boolean isAllowedValueNode(Node paramNode)
  {
    return "allowedValue".equals(paramNode.getName());
  }
  
  public Node getAllowedValueNode()
  {
    return this.allowedValueNode;
  }
  
  public String getValue()
  {
    return getAllowedValueNode().getValue();
  }
  
  public void setValue(String paramString)
  {
    getAllowedValueNode().setValue(paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/AllowedValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */