package org.cybergarage.xml;

import java.util.Vector;

public class AttributeList
  extends Vector
{
  public Attribute getAttribute(int paramInt)
  {
    return (Attribute)get(paramInt);
  }
  
  public Attribute getAttribute(String paramString)
  {
    Attribute localAttribute;
    if (paramString == null)
    {
      localAttribute = null;
      return localAttribute;
    }
    int i = size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        break label47;
      }
      localAttribute = getAttribute(j);
      if (paramString.compareTo(localAttribute.getName()) == 0) {
        break;
      }
    }
    label47:
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/AttributeList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */