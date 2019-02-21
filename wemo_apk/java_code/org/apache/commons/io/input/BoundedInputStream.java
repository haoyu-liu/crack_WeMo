package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

public class BoundedInputStream
  extends InputStream
{
  private final InputStream in;
  private long mark = -1L;
  private final long max;
  private long pos = 0L;
  private boolean propagateClose = true;
  
  public BoundedInputStream(InputStream paramInputStream)
  {
    this(paramInputStream, -1L);
  }
  
  public BoundedInputStream(InputStream paramInputStream, long paramLong)
  {
    this.max = paramLong;
    this.in = paramInputStream;
  }
  
  public int available()
    throws IOException
  {
    if ((this.max >= 0L) && (this.pos >= this.max)) {
      return 0;
    }
    return this.in.available();
  }
  
  public void close()
    throws IOException
  {
    if (this.propagateClose) {
      this.in.close();
    }
  }
  
  public boolean isPropagateClose()
  {
    return this.propagateClose;
  }
  
  public void mark(int paramInt)
  {
    try
    {
      this.in.mark(paramInt);
      this.mark = this.pos;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean markSupported()
  {
    return this.in.markSupported();
  }
  
  public int read()
    throws IOException
  {
    if ((this.max >= 0L) && (this.pos >= this.max)) {
      return -1;
    }
    int i = this.in.read();
    this.pos = (1L + this.pos);
    return i;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if ((this.max >= 0L) && (this.pos >= this.max)) {
      return -1;
    }
    if (this.max >= 0L) {}
    int i;
    for (long l = Math.min(paramInt2, this.max - this.pos);; l = paramInt2)
    {
      i = this.in.read(paramArrayOfByte, paramInt1, (int)l);
      if (i != -1) {
        break;
      }
      return -1;
    }
    this.pos += i;
    return i;
  }
  
  public void reset()
    throws IOException
  {
    try
    {
      this.in.reset();
      this.pos = this.mark;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setPropagateClose(boolean paramBoolean)
  {
    this.propagateClose = paramBoolean;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    if (this.max >= 0L) {}
    for (long l1 = Math.min(paramLong, this.max - this.pos);; l1 = paramLong)
    {
      long l2 = this.in.skip(l1);
      this.pos = (l2 + this.pos);
      return l2;
    }
  }
  
  public String toString()
  {
    return this.in.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/BoundedInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */