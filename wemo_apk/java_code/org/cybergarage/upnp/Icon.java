package org.cybergarage.upnp;

import org.cybergarage.xml.Node;

public class Icon
{
  private static final String DEPTH = "depth";
  public static final String ELEM_NAME = "icon";
  private static final String HEIGHT = "height";
  private static final String MIME_TYPE = "mimeType";
  private static final String URL = "url";
  private static final String WIDTH = "width";
  private Node iconNode;
  private Object userData = null;
  
  public Icon(Node paramNode)
  {
    this.iconNode = paramNode;
  }
  
  public static boolean isIconNode(Node paramNode)
  {
    return "icon".equals(paramNode.getName());
  }
  
  public String getDepth()
  {
    return getIconNode().getNodeValue("depth");
  }
  
  public int getHeight()
  {
    try
    {
      int i = Integer.parseInt(getIconNode().getNodeValue("height"));
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public Node getIconNode()
  {
    return this.iconNode;
  }
  
  public String getMimeType()
  {
    return getIconNode().getNodeValue("mimeType");
  }
  
  public String getURL()
  {
    return getIconNode().getNodeValue("url");
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public int getWidth()
  {
    try
    {
      int i = Integer.parseInt(getIconNode().getNodeValue("width"));
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public void setDepth(String paramString)
  {
    getIconNode().setNode("depth", paramString);
  }
  
  public void setHeight(int paramInt)
  {
    try
    {
      setHeight(Integer.toString(paramInt));
      return;
    }
    catch (Exception localException) {}
  }
  
  public void setHeight(String paramString)
  {
    getIconNode().setNode("height", paramString);
  }
  
  public void setMimeType(String paramString)
  {
    getIconNode().setNode("mimeType", paramString);
  }
  
  public void setURL(String paramString)
  {
    getIconNode().setNode("url", paramString);
  }
  
  public void setUserData(Object paramObject)
  {
    this.userData = paramObject;
  }
  
  public void setWidth(int paramInt)
  {
    try
    {
      setWidth(Integer.toString(paramInt));
      return;
    }
    catch (Exception localException) {}
  }
  
  public void setWidth(String paramString)
  {
    getIconNode().setNode("width", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/Icon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */