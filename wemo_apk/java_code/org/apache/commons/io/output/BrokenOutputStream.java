package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

public class BrokenOutputStream
  extends OutputStream
{
  private final IOException exception;
  
  public BrokenOutputStream()
  {
    this(new IOException("Broken output stream"));
  }
  
  public BrokenOutputStream(IOException paramIOException)
  {
    this.exception = paramIOException;
  }
  
  public void close()
    throws IOException
  {
    throw this.exception;
  }
  
  public void flush()
    throws IOException
  {
    throw this.exception;
  }
  
  public void write(int paramInt)
    throws IOException
  {
    throw this.exception;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/BrokenOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */