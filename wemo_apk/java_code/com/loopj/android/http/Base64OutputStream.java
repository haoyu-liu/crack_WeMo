package com.loopj.android.http;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Base64OutputStream
  extends FilterOutputStream
{
  private static byte[] EMPTY = new byte[0];
  private int bpos = 0;
  private byte[] buffer = null;
  private final Base64.Coder coder;
  private final int flags;
  
  public Base64OutputStream(OutputStream paramOutputStream, int paramInt)
  {
    this(paramOutputStream, paramInt, true);
  }
  
  public Base64OutputStream(OutputStream paramOutputStream, int paramInt, boolean paramBoolean)
  {
    super(paramOutputStream);
    this.flags = paramInt;
    if (paramBoolean)
    {
      this.coder = new Base64.Encoder(paramInt, null);
      return;
    }
    this.coder = new Base64.Decoder(paramInt, null);
  }
  
  private byte[] embiggen(byte[] paramArrayOfByte, int paramInt)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length < paramInt)) {
      paramArrayOfByte = new byte[paramInt];
    }
    return paramArrayOfByte;
  }
  
  private void flushBuffer()
    throws IOException
  {
    if (this.bpos > 0)
    {
      internalWrite(this.buffer, 0, this.bpos, false);
      this.bpos = 0;
    }
  }
  
  private void internalWrite(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean)
    throws IOException
  {
    this.coder.output = embiggen(this.coder.output, this.coder.maxOutputSize(paramInt2));
    if (!this.coder.process(paramArrayOfByte, paramInt1, paramInt2, paramBoolean)) {
      throw new Base64DataException("bad base-64");
    }
    this.out.write(this.coder.output, 0, this.coder.op);
  }
  
  public void close()
    throws IOException
  {
    Object localObject = null;
    try
    {
      flushBuffer();
      internalWrite(EMPTY, 0, 0, true);
    }
    catch (IOException localIOException1)
    {
      try
      {
        if ((0x10 & this.flags) == 0) {
          this.out.close();
        }
        for (;;)
        {
          if (localObject == null) {
            return;
          }
          throw ((Throwable)localObject);
          localIOException1 = localIOException1;
          localObject = localIOException1;
          break;
          this.out.flush();
        }
      }
      catch (IOException localIOException2)
      {
        for (;;)
        {
          if (localObject != null) {
            localObject = localIOException2;
          }
        }
      }
    }
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (this.buffer == null) {
      this.buffer = new byte['Ѐ'];
    }
    if (this.bpos >= this.buffer.length)
    {
      internalWrite(this.buffer, 0, this.bpos, false);
      this.bpos = 0;
    }
    byte[] arrayOfByte = this.buffer;
    int i = this.bpos;
    this.bpos = (i + 1);
    arrayOfByte[i] = ((byte)paramInt);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 <= 0) {
      return;
    }
    flushBuffer();
    internalWrite(paramArrayOfByte, paramInt1, paramInt2, false);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/Base64OutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */