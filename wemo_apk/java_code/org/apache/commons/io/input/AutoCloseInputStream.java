package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

public class AutoCloseInputStream
  extends ProxyInputStream
{
  public AutoCloseInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  protected void afterRead(int paramInt)
    throws IOException
  {
    if (paramInt == -1) {
      close();
    }
  }
  
  public void close()
    throws IOException
  {
    this.in.close();
    this.in = new ClosedInputStream();
  }
  
  protected void finalize()
    throws Throwable
  {
    close();
    super.finalize();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/AutoCloseInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */