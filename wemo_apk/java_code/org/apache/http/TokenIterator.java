package org.apache.http;

import java.util.Iterator;

@Deprecated
public abstract interface TokenIterator
  extends Iterator
{
  public abstract boolean hasNext();
  
  public abstract String nextToken();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/TokenIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */