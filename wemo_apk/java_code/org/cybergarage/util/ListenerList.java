package org.cybergarage.util;

import java.util.Vector;

public class ListenerList
  extends Vector
{
  public boolean add(Object paramObject)
  {
    if (indexOf(paramObject) >= 0) {
      return false;
    }
    return super.add(paramObject);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/ListenerList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */