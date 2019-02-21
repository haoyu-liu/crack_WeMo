package org.apache.commons.io.output;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.SequenceInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.input.ClosedInputStream;

public class ByteArrayOutputStream
  extends OutputStream
{
  private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
  private final List<byte[]> buffers = new ArrayList();
  private int count;
  private byte[] currentBuffer;
  private int currentBufferIndex;
  private int filledBufferSum;
  
  public ByteArrayOutputStream()
  {
    this(1024);
  }
  
  public ByteArrayOutputStream(int paramInt)
  {
    if (paramInt < 0) {
      throw new IllegalArgumentException("Negative initial size: " + paramInt);
    }
    try
    {
      needNewBuffer(paramInt);
      return;
    }
    finally {}
  }
  
  private void needNewBuffer(int paramInt)
  {
    if (this.currentBufferIndex < -1 + this.buffers.size())
    {
      this.filledBufferSum += this.currentBuffer.length;
      this.currentBufferIndex = (1 + this.currentBufferIndex);
      this.currentBuffer = ((byte[])this.buffers.get(this.currentBufferIndex));
      return;
    }
    int i;
    if (this.currentBuffer == null) {
      i = paramInt;
    }
    for (this.filledBufferSum = 0;; this.filledBufferSum += this.currentBuffer.length)
    {
      this.currentBufferIndex = (1 + this.currentBufferIndex);
      this.currentBuffer = new byte[i];
      this.buffers.add(this.currentBuffer);
      return;
      i = Math.max(this.currentBuffer.length << 1, paramInt - this.filledBufferSum);
    }
  }
  
  private InputStream toBufferedInputStream()
  {
    int i = this.count;
    if (i == 0) {
      return new ClosedInputStream();
    }
    ArrayList localArrayList = new ArrayList(this.buffers.size());
    Iterator localIterator = this.buffers.iterator();
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      byte[] arrayOfByte = (byte[])localIterator.next();
      int j = Math.min(arrayOfByte.length, i);
      localArrayList.add(new ByteArrayInputStream(arrayOfByte, 0, j));
      i -= j;
    } while (i != 0);
    return new SequenceInputStream(Collections.enumeration(localArrayList));
  }
  
  public static InputStream toBufferedInputStream(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    localByteArrayOutputStream.write(paramInputStream);
    return localByteArrayOutputStream.toBufferedInputStream();
  }
  
  public void close()
    throws IOException
  {}
  
  public void reset()
  {
    try
    {
      this.count = 0;
      this.filledBufferSum = 0;
      this.currentBufferIndex = 0;
      this.currentBuffer = ((byte[])this.buffers.get(this.currentBufferIndex));
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int size()
  {
    try
    {
      int i = this.count;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public byte[] toByteArray()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 84	org/apache/commons/io/output/ByteArrayOutputStream:count	I
    //   6: istore_2
    //   7: iload_2
    //   8: ifne +11 -> 19
    //   11: getstatic 18	org/apache/commons/io/output/ByteArrayOutputStream:EMPTY_BYTE_ARRAY	[B
    //   14: astore_3
    //   15: aload_0
    //   16: monitorexit
    //   17: aload_3
    //   18: areturn
    //   19: iload_2
    //   20: newarray <illegal type>
    //   22: astore_3
    //   23: iconst_0
    //   24: istore 4
    //   26: aload_0
    //   27: getfield 29	org/apache/commons/io/output/ByteArrayOutputStream:buffers	Ljava/util/List;
    //   30: invokeinterface 92 1 0
    //   35: astore 5
    //   37: aload 5
    //   39: invokeinterface 98 1 0
    //   44: ifeq -29 -> 15
    //   47: aload 5
    //   49: invokeinterface 102 1 0
    //   54: checkcast 70	[B
    //   57: astore 6
    //   59: aload 6
    //   61: arraylength
    //   62: iload_2
    //   63: invokestatic 105	java/lang/Math:min	(II)I
    //   66: istore 7
    //   68: aload 6
    //   70: iconst_0
    //   71: aload_3
    //   72: iload 4
    //   74: iload 7
    //   76: invokestatic 141	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   79: iload 4
    //   81: iload 7
    //   83: iadd
    //   84: istore 4
    //   86: iload_2
    //   87: iload 7
    //   89: isub
    //   90: istore_2
    //   91: iload_2
    //   92: ifne -55 -> 37
    //   95: goto -80 -> 15
    //   98: astore_1
    //   99: aload_0
    //   100: monitorexit
    //   101: aload_1
    //   102: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	103	0	this	ByteArrayOutputStream
    //   98	4	1	localObject	Object
    //   6	86	2	i	int
    //   14	58	3	arrayOfByte1	byte[]
    //   24	61	4	j	int
    //   35	13	5	localIterator	Iterator
    //   57	12	6	arrayOfByte2	byte[]
    //   66	24	7	k	int
    // Exception table:
    //   from	to	target	type
    //   2	7	98	finally
    //   11	15	98	finally
    //   19	23	98	finally
    //   26	37	98	finally
    //   37	79	98	finally
  }
  
  public String toString()
  {
    return new String(toByteArray());
  }
  
  public String toString(String paramString)
    throws UnsupportedEncodingException
  {
    return new String(toByteArray(), paramString);
  }
  
  public int write(InputStream paramInputStream)
    throws IOException
  {
    int i = 0;
    try
    {
      int j = this.count - this.filledBufferSum;
      int m;
      for (int k = paramInputStream.read(this.currentBuffer, j, this.currentBuffer.length - j); k != -1; k = m)
      {
        i += k;
        j += k;
        this.count = (k + this.count);
        if (j == this.currentBuffer.length)
        {
          needNewBuffer(this.currentBuffer.length);
          j = 0;
        }
        m = paramInputStream.read(this.currentBuffer, j, this.currentBuffer.length - j);
      }
      return i;
    }
    finally {}
  }
  
  public void write(int paramInt)
  {
    try
    {
      int i = this.count - this.filledBufferSum;
      if (i == this.currentBuffer.length)
      {
        needNewBuffer(1 + this.count);
        i = 0;
      }
      this.currentBuffer[i] = ((byte)paramInt);
      this.count = (1 + this.count);
      return;
    }
    finally {}
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if ((paramInt1 < 0) || (paramInt1 > paramArrayOfByte.length) || (paramInt2 < 0) || (paramInt1 + paramInt2 > paramArrayOfByte.length) || (paramInt1 + paramInt2 < 0)) {
      throw new IndexOutOfBoundsException();
    }
    if (paramInt2 == 0) {
      return;
    }
    try
    {
      int i = paramInt2 + this.count;
      int j = paramInt2;
      int k = this.count - this.filledBufferSum;
      while (j > 0)
      {
        int m = Math.min(j, this.currentBuffer.length - k);
        System.arraycopy(paramArrayOfByte, paramInt1 + paramInt2 - j, this.currentBuffer, k, m);
        j -= m;
        if (j > 0)
        {
          needNewBuffer(i);
          k = 0;
        }
      }
      this.count = i;
      return;
    }
    finally {}
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    try
    {
      int i = this.count;
      Iterator localIterator = this.buffers.iterator();
      do
      {
        if (!localIterator.hasNext()) {
          break;
        }
        byte[] arrayOfByte = (byte[])localIterator.next();
        int j = Math.min(arrayOfByte.length, i);
        paramOutputStream.write(arrayOfByte, 0, j);
        i -= j;
      } while (i != 0);
      return;
    }
    finally {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/ByteArrayOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */