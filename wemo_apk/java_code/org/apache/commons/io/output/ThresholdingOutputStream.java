package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

public abstract class ThresholdingOutputStream
  extends OutputStream
{
  private final int threshold;
  private boolean thresholdExceeded;
  private long written;
  
  public ThresholdingOutputStream(int paramInt)
  {
    this.threshold = paramInt;
  }
  
  protected void checkThreshold(int paramInt)
    throws IOException
  {
    if ((!this.thresholdExceeded) && (this.written + paramInt > this.threshold))
    {
      this.thresholdExceeded = true;
      thresholdReached();
    }
  }
  
  public void close()
    throws IOException
  {
    try
    {
      flush();
      getStream().close();
      return;
    }
    catch (IOException localIOException)
    {
      for (;;) {}
    }
  }
  
  public void flush()
    throws IOException
  {
    getStream().flush();
  }
  
  public long getByteCount()
  {
    return this.written;
  }
  
  protected abstract OutputStream getStream()
    throws IOException;
  
  public int getThreshold()
  {
    return this.threshold;
  }
  
  public boolean isThresholdExceeded()
  {
    return this.written > this.threshold;
  }
  
  protected void resetByteCount()
  {
    this.thresholdExceeded = false;
    this.written = 0L;
  }
  
  protected abstract void thresholdReached()
    throws IOException;
  
  public void write(int paramInt)
    throws IOException
  {
    checkThreshold(1);
    getStream().write(paramInt);
    this.written = (1L + this.written);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    checkThreshold(paramArrayOfByte.length);
    getStream().write(paramArrayOfByte);
    this.written += paramArrayOfByte.length;
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    checkThreshold(paramInt2);
    getStream().write(paramArrayOfByte, paramInt1, paramInt2);
    this.written += paramInt2;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/ThresholdingOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */