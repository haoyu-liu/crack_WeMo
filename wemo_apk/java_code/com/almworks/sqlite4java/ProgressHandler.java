package com.almworks.sqlite4java;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.LongBuffer;

class ProgressHandler
{
  public static final ProgressHandler DISPOSED;
  private static final int OFFSET_CANCEL = 0;
  private static final int OFFSET_STEPCOUNT = 1;
  private ByteBuffer myBuffer;
  private LongBuffer myLongs;
  private SWIGTYPE_p_direct_buffer myPointer;
  private final int myStepsPerCallback;
  
  static
  {
    if (!ProgressHandler.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      DISPOSED = new ProgressHandler();
      return;
    }
  }
  
  private ProgressHandler()
  {
    this.myStepsPerCallback = 0;
  }
  
  public ProgressHandler(SWIGTYPE_p_direct_buffer paramSWIGTYPE_p_direct_buffer, ByteBuffer paramByteBuffer, int paramInt)
  {
    this.myStepsPerCallback = paramInt;
    assert (paramByteBuffer.isDirect());
    assert (paramByteBuffer.capacity() == 16) : paramByteBuffer.capacity();
    this.myPointer = paramSWIGTYPE_p_direct_buffer;
    this.myBuffer = paramByteBuffer;
    this.myLongs = paramByteBuffer.order(ByteOrder.nativeOrder()).asLongBuffer();
    assert (this.myLongs.capacity() == 2);
  }
  
  /* Error */
  public void cancel()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   18: iconst_0
    //   19: lconst_1
    //   20: invokevirtual 82	java/nio/LongBuffer:put	(IJ)Ljava/nio/LongBuffer;
    //   23: pop
    //   24: goto -13 -> 11
    //   27: astore_1
    //   28: aload_0
    //   29: monitorexit
    //   30: aload_1
    //   31: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	32	0	this	ProgressHandler
    //   27	4	1	localObject	Object
    //   6	2	2	localLongBuffer	LongBuffer
    // Exception table:
    //   from	to	target	type
    //   2	7	27	finally
    //   14	24	27	finally
  }
  
  public SWIGTYPE_p_direct_buffer dispose()
  {
    try
    {
      SWIGTYPE_p_direct_buffer localSWIGTYPE_p_direct_buffer = this.myPointer;
      this.myBuffer = null;
      this.myPointer = null;
      this.myLongs = null;
      return localSWIGTYPE_p_direct_buffer;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public long getSteps()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +13 -> 21
    //   11: ldc2_w 87
    //   14: lstore 6
    //   16: aload_0
    //   17: monitorexit
    //   18: lload 6
    //   20: lreturn
    //   21: aload_0
    //   22: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   25: iconst_1
    //   26: invokevirtual 92	java/nio/LongBuffer:get	(I)J
    //   29: lstore_3
    //   30: aload_0
    //   31: getfield 38	com/almworks/sqlite4java/ProgressHandler:myStepsPerCallback	I
    //   34: istore 5
    //   36: lload_3
    //   37: iload 5
    //   39: i2l
    //   40: lmul
    //   41: lstore 6
    //   43: goto -27 -> 16
    //   46: astore_1
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_1
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	this	ProgressHandler
    //   46	4	1	localObject	Object
    //   6	2	2	localLongBuffer	LongBuffer
    //   29	8	3	l1	long
    //   34	4	5	i	int
    //   14	28	6	l2	long
    // Exception table:
    //   from	to	target	type
    //   2	7	46	finally
    //   21	36	46	finally
  }
  
  /* Error */
  public void reset()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   18: iconst_0
    //   19: lconst_0
    //   20: invokevirtual 82	java/nio/LongBuffer:put	(IJ)Ljava/nio/LongBuffer;
    //   23: pop
    //   24: aload_0
    //   25: getfield 74	com/almworks/sqlite4java/ProgressHandler:myLongs	Ljava/nio/LongBuffer;
    //   28: iconst_1
    //   29: lconst_0
    //   30: invokevirtual 82	java/nio/LongBuffer:put	(IJ)Ljava/nio/LongBuffer;
    //   33: pop
    //   34: goto -23 -> 11
    //   37: astore_1
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_1
    //   41: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	42	0	this	ProgressHandler
    //   37	4	1	localObject	Object
    //   6	2	2	localLongBuffer	LongBuffer
    // Exception table:
    //   from	to	target	type
    //   2	7	37	finally
    //   14	34	37	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/ProgressHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */