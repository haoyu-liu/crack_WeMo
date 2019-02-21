package org.apache.commons.io.output;

import java.io.OutputStream;

public class CountingOutputStream
  extends ProxyOutputStream
{
  private long count = 0L;
  
  public CountingOutputStream(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  protected void beforeWrite(int paramInt)
  {
    try
    {
      this.count += paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public long getByteCount()
  {
    try
    {
      long l = this.count;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int getCount()
  {
    long l = getByteCount();
    if (l > 2147483647L) {
      throw new ArithmeticException("The byte count " + l + " is too large to be converted to an int");
    }
    return (int)l;
  }
  
  public long resetByteCount()
  {
    try
    {
      long l = this.count;
      this.count = 0L;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int resetCount()
  {
    long l = resetByteCount();
    if (l > 2147483647L) {
      throw new ArithmeticException("The byte count " + l + " is too large to be converted to an int");
    }
    return (int)l;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/CountingOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */