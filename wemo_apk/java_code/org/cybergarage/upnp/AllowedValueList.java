package org.cybergarage.upnp;

import java.util.Iterator;
import java.util.Vector;

public class AllowedValueList
  extends Vector
{
  public static final String ELEM_NAME = "allowedValueList";
  
  public AllowedValueList() {}
  
  public AllowedValueList(String[] paramArrayOfString)
  {
    for (int i = 0; i < paramArrayOfString.length; i++) {
      add(new AllowedValue(paramArrayOfString[i]));
    }
  }
  
  public AllowedValue getAllowedValue(int paramInt)
  {
    return (AllowedValue)get(paramInt);
  }
  
  public boolean isAllowed(String paramString)
  {
    Iterator localIterator = iterator();
    while (localIterator.hasNext()) {
      if (((AllowedValue)localIterator.next()).getValue().equals(paramString)) {
        return true;
      }
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/AllowedValueList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */