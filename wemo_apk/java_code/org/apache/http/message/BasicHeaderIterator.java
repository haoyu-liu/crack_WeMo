package org.apache.http.message;

import java.util.NoSuchElementException;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;

@Deprecated
public class BasicHeaderIterator
  implements HeaderIterator
{
  protected final Header[] allHeaders = null;
  protected int currentIndex;
  protected String headerName;
  
  public BasicHeaderIterator(Header[] paramArrayOfHeader, String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected boolean filterHeader(int paramInt)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected int findNext(int paramInt)
  {
    throw new RuntimeException("Stub!");
  }
  
  public boolean hasNext()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final Object next()
    throws NoSuchElementException
  {
    throw new RuntimeException("Stub!");
  }
  
  public Header nextHeader()
    throws NoSuchElementException
  {
    throw new RuntimeException("Stub!");
  }
  
  public void remove()
    throws UnsupportedOperationException
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/message/BasicHeaderIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */