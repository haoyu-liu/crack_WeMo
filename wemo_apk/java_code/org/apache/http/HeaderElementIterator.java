package org.apache.http;

import java.util.Iterator;

@Deprecated
public abstract interface HeaderElementIterator
  extends Iterator
{
  public abstract boolean hasNext();
  
  public abstract HeaderElement nextElement();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/HeaderElementIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */