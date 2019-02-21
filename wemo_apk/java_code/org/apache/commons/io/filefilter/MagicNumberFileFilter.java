package org.apache.commons.io.filefilter;

import java.io.Serializable;

public class MagicNumberFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  private static final long serialVersionUID = -547733176983104172L;
  private final long byteOffset;
  private final byte[] magicNumbers;
  
  public MagicNumberFileFilter(String paramString)
  {
    this(paramString, 0L);
  }
  
  public MagicNumberFileFilter(String paramString, long paramLong)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("The magic number cannot be null");
    }
    if (paramString.length() == 0) {
      throw new IllegalArgumentException("The magic number must contain at least one byte");
    }
    if (paramLong < 0L) {
      throw new IllegalArgumentException("The offset cannot be negative");
    }
    this.magicNumbers = paramString.getBytes();
    this.byteOffset = paramLong;
  }
  
  public MagicNumberFileFilter(byte[] paramArrayOfByte)
  {
    this(paramArrayOfByte, 0L);
  }
  
  public MagicNumberFileFilter(byte[] paramArrayOfByte, long paramLong)
  {
    if (paramArrayOfByte == null) {
      throw new IllegalArgumentException("The magic number cannot be null");
    }
    if (paramArrayOfByte.length == 0) {
      throw new IllegalArgumentException("The magic number must contain at least one byte");
    }
    if (paramLong < 0L) {
      throw new IllegalArgumentException("The offset cannot be negative");
    }
    this.magicNumbers = new byte[paramArrayOfByte.length];
    System.arraycopy(paramArrayOfByte, 0, this.magicNumbers, 0, paramArrayOfByte.length);
    this.byteOffset = paramLong;
  }
  
  /* Error */
  public boolean accept(java.io.File paramFile)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +77 -> 78
    //   4: aload_1
    //   5: invokevirtual 65	java/io/File:isFile	()Z
    //   8: ifeq +70 -> 78
    //   11: aload_1
    //   12: invokevirtual 68	java/io/File:canRead	()Z
    //   15: ifeq +63 -> 78
    //   18: aconst_null
    //   19: astore_2
    //   20: aload_0
    //   21: getfield 43	org/apache/commons/io/filefilter/MagicNumberFileFilter:magicNumbers	[B
    //   24: arraylength
    //   25: newarray <illegal type>
    //   27: astore 5
    //   29: new 70	java/io/RandomAccessFile
    //   32: dup
    //   33: aload_1
    //   34: ldc 72
    //   36: invokespecial 75	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   39: astore 6
    //   41: aload 6
    //   43: aload_0
    //   44: getfield 45	org/apache/commons/io/filefilter/MagicNumberFileFilter:byteOffset	J
    //   47: invokevirtual 79	java/io/RandomAccessFile:seek	(J)V
    //   50: aload 6
    //   52: aload 5
    //   54: invokevirtual 83	java/io/RandomAccessFile:read	([B)I
    //   57: istore 8
    //   59: aload_0
    //   60: getfield 43	org/apache/commons/io/filefilter/MagicNumberFileFilter:magicNumbers	[B
    //   63: arraylength
    //   64: istore 9
    //   66: iload 8
    //   68: iload 9
    //   70: if_icmpeq +10 -> 80
    //   73: aload 6
    //   75: invokestatic 89	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   78: iconst_0
    //   79: ireturn
    //   80: aload_0
    //   81: getfield 43	org/apache/commons/io/filefilter/MagicNumberFileFilter:magicNumbers	[B
    //   84: aload 5
    //   86: invokestatic 95	java/util/Arrays:equals	([B[B)Z
    //   89: istore 10
    //   91: aload 6
    //   93: invokestatic 89	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   96: iload 10
    //   98: ireturn
    //   99: astore 4
    //   101: aload_2
    //   102: invokestatic 89	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   105: iconst_0
    //   106: ireturn
    //   107: astore_3
    //   108: aload_2
    //   109: invokestatic 89	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   112: aload_3
    //   113: athrow
    //   114: astore_3
    //   115: aload 6
    //   117: astore_2
    //   118: goto -10 -> 108
    //   121: astore 7
    //   123: aload 6
    //   125: astore_2
    //   126: goto -25 -> 101
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	129	0	this	MagicNumberFileFilter
    //   0	129	1	paramFile	java.io.File
    //   19	107	2	localObject1	Object
    //   107	6	3	localObject2	Object
    //   114	1	3	localObject3	Object
    //   99	1	4	localIOException1	java.io.IOException
    //   27	58	5	arrayOfByte	byte[]
    //   39	85	6	localRandomAccessFile	java.io.RandomAccessFile
    //   121	1	7	localIOException2	java.io.IOException
    //   57	14	8	i	int
    //   64	7	9	j	int
    //   89	8	10	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   20	41	99	java/io/IOException
    //   20	41	107	finally
    //   41	66	114	finally
    //   80	91	114	finally
    //   41	66	121	java/io/IOException
    //   80	91	121	java/io/IOException
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(super.toString());
    localStringBuilder.append("(");
    localStringBuilder.append(new String(this.magicNumbers));
    localStringBuilder.append(",");
    localStringBuilder.append(this.byteOffset);
    localStringBuilder.append(")");
    return localStringBuilder.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/MagicNumberFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */