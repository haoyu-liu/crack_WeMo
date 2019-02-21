package org.apache.commons.io.input;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class Tailer
  implements Runnable
{
  private static final int DEFAULT_BUFSIZE = 4096;
  private static final int DEFAULT_DELAY_MILLIS = 1000;
  private static final String RAF_MODE = "r";
  private final long delayMillis;
  private final boolean end;
  private final File file;
  private final byte[] inbuf;
  private final TailerListener listener;
  private final boolean reOpen;
  private volatile boolean run = true;
  
  public Tailer(File paramFile, TailerListener paramTailerListener)
  {
    this(paramFile, paramTailerListener, 1000L);
  }
  
  public Tailer(File paramFile, TailerListener paramTailerListener, long paramLong)
  {
    this(paramFile, paramTailerListener, paramLong, false);
  }
  
  public Tailer(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean)
  {
    this(paramFile, paramTailerListener, paramLong, paramBoolean, 4096);
  }
  
  public Tailer(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean, int paramInt)
  {
    this(paramFile, paramTailerListener, paramLong, paramBoolean, false, paramInt);
  }
  
  public Tailer(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    this(paramFile, paramTailerListener, paramLong, paramBoolean1, paramBoolean2, 4096);
  }
  
  public Tailer(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    this.file = paramFile;
    this.delayMillis = paramLong;
    this.end = paramBoolean1;
    this.inbuf = new byte[paramInt];
    this.listener = paramTailerListener;
    paramTailerListener.init(this);
    this.reOpen = paramBoolean2;
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener)
  {
    return create(paramFile, paramTailerListener, 1000L, false);
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener, long paramLong)
  {
    return create(paramFile, paramTailerListener, paramLong, false);
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean)
  {
    return create(paramFile, paramTailerListener, paramLong, paramBoolean, 4096);
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean, int paramInt)
  {
    Tailer localTailer = new Tailer(paramFile, paramTailerListener, paramLong, paramBoolean, paramInt);
    Thread localThread = new Thread(localTailer);
    localThread.setDaemon(true);
    localThread.start();
    return localTailer;
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    return create(paramFile, paramTailerListener, paramLong, paramBoolean1, paramBoolean2, 4096);
  }
  
  public static Tailer create(File paramFile, TailerListener paramTailerListener, long paramLong, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    Tailer localTailer = new Tailer(paramFile, paramTailerListener, paramLong, paramBoolean1, paramBoolean2, paramInt);
    Thread localThread = new Thread(localTailer);
    localThread.setDaemon(true);
    localThread.start();
    return localTailer;
  }
  
  private long readLines(RandomAccessFile paramRandomAccessFile)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    long l1 = paramRandomAccessFile.getFilePointer();
    long l2 = l1;
    int i = 0;
    while (this.run)
    {
      int j = paramRandomAccessFile.read(this.inbuf);
      if (j == -1) {
        break;
      }
      int k = 0;
      if (k < j)
      {
        int m = this.inbuf[k];
        switch (m)
        {
        case 11: 
        case 12: 
        default: 
          if (i != 0)
          {
            i = 0;
            this.listener.handle(localStringBuilder.toString());
            localStringBuilder.setLength(0);
            l2 = 1L + (l1 + k);
          }
          localStringBuilder.append((char)m);
        }
        for (;;)
        {
          k++;
          break;
          this.listener.handle(localStringBuilder.toString());
          localStringBuilder.setLength(0);
          l2 = 1L + (l1 + k);
          i = 0;
          continue;
          if (i != 0) {
            localStringBuilder.append('\r');
          }
          i = 1;
        }
      }
      l1 = paramRandomAccessFile.getFilePointer();
    }
    paramRandomAccessFile.seek(l2);
    return l2;
  }
  
  public long getDelay()
  {
    return this.delayMillis;
  }
  
  public File getFile()
  {
    return this.file;
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: lconst_0
    //   1: lstore_1
    //   2: lconst_0
    //   3: lstore_3
    //   4: aconst_null
    //   5: astore 5
    //   7: aload_0
    //   8: getfield 49	org/apache/commons/io/input/Tailer:run	Z
    //   11: istore 9
    //   13: iload 9
    //   15: ifeq +106 -> 121
    //   18: aload 5
    //   20: ifnonnull +101 -> 121
    //   23: new 101	java/io/RandomAccessFile
    //   26: dup
    //   27: aload_0
    //   28: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   31: ldc 15
    //   33: invokespecial 141	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   36: astore 7
    //   38: aload 7
    //   40: ifnonnull +44 -> 84
    //   43: aload_0
    //   44: getfield 53	org/apache/commons/io/input/Tailer:delayMillis	J
    //   47: invokestatic 144	java/lang/Thread:sleep	(J)V
    //   50: aload 7
    //   52: astore 5
    //   54: goto -47 -> 7
    //   57: astore 21
    //   59: aload_0
    //   60: getfield 59	org/apache/commons/io/input/Tailer:listener	Lorg/apache/commons/io/input/TailerListener;
    //   63: invokeinterface 147 1 0
    //   68: aload 5
    //   70: astore 7
    //   72: goto -34 -> 38
    //   75: astore 20
    //   77: aload 7
    //   79: astore 5
    //   81: goto -74 -> 7
    //   84: aload_0
    //   85: getfield 55	org/apache/commons/io/input/Tailer:end	Z
    //   88: ifeq +28 -> 116
    //   91: aload_0
    //   92: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   95: invokevirtual 152	java/io/File:length	()J
    //   98: lstore_3
    //   99: invokestatic 157	java/lang/System:currentTimeMillis	()J
    //   102: lstore_1
    //   103: aload 7
    //   105: lload_3
    //   106: invokevirtual 129	java/io/RandomAccessFile:seek	(J)V
    //   109: aload 7
    //   111: astore 5
    //   113: goto -106 -> 7
    //   116: lconst_0
    //   117: lstore_3
    //   118: goto -19 -> 99
    //   121: aload_0
    //   122: getfield 49	org/apache/commons/io/input/Tailer:run	Z
    //   125: ifeq +201 -> 326
    //   128: aload_0
    //   129: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   132: lload_1
    //   133: invokestatic 163	org/apache/commons/io/FileUtils:isFileNewer	(Ljava/io/File;J)Z
    //   136: istore 11
    //   138: aload_0
    //   139: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   142: invokevirtual 152	java/io/File:length	()J
    //   145: lstore 12
    //   147: lload 12
    //   149: lload_3
    //   150: lcmp
    //   151: ifge +67 -> 218
    //   154: aload_0
    //   155: getfield 59	org/apache/commons/io/input/Tailer:listener	Lorg/apache/commons/io/input/TailerListener;
    //   158: invokeinterface 166 1 0
    //   163: aload 5
    //   165: astore 14
    //   167: new 101	java/io/RandomAccessFile
    //   170: dup
    //   171: aload_0
    //   172: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   175: ldc 15
    //   177: invokespecial 141	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   180: astore 7
    //   182: lconst_0
    //   183: lstore_3
    //   184: aload 14
    //   186: invokestatic 172	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   189: aload 7
    //   191: astore 5
    //   193: goto -72 -> 121
    //   196: astore 16
    //   198: aload 5
    //   200: astore 7
    //   202: aload_0
    //   203: getfield 59	org/apache/commons/io/input/Tailer:listener	Lorg/apache/commons/io/input/TailerListener;
    //   206: invokeinterface 147 1 0
    //   211: aload 7
    //   213: astore 5
    //   215: goto -94 -> 121
    //   218: lload 12
    //   220: lload_3
    //   221: lcmp
    //   222: ifle +75 -> 297
    //   225: aload_0
    //   226: aload 5
    //   228: invokespecial 174	org/apache/commons/io/input/Tailer:readLines	(Ljava/io/RandomAccessFile;)J
    //   231: lstore_3
    //   232: invokestatic 157	java/lang/System:currentTimeMillis	()J
    //   235: lstore_1
    //   236: aload_0
    //   237: getfield 67	org/apache/commons/io/input/Tailer:reOpen	Z
    //   240: ifeq +8 -> 248
    //   243: aload 5
    //   245: invokestatic 172	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   248: aload_0
    //   249: getfield 53	org/apache/commons/io/input/Tailer:delayMillis	J
    //   252: invokestatic 144	java/lang/Thread:sleep	(J)V
    //   255: aload_0
    //   256: getfield 49	org/apache/commons/io/input/Tailer:run	Z
    //   259: ifeq +133 -> 392
    //   262: aload_0
    //   263: getfield 67	org/apache/commons/io/input/Tailer:reOpen	Z
    //   266: ifeq +126 -> 392
    //   269: new 101	java/io/RandomAccessFile
    //   272: dup
    //   273: aload_0
    //   274: getfield 51	org/apache/commons/io/input/Tailer:file	Ljava/io/File;
    //   277: ldc 15
    //   279: invokespecial 141	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   282: astore 7
    //   284: aload 7
    //   286: lload_3
    //   287: invokevirtual 129	java/io/RandomAccessFile:seek	(J)V
    //   290: aload 7
    //   292: astore 5
    //   294: goto -173 -> 121
    //   297: iload 11
    //   299: ifeq -63 -> 236
    //   302: aload 5
    //   304: lconst_0
    //   305: invokevirtual 129	java/io/RandomAccessFile:seek	(J)V
    //   308: aload_0
    //   309: aload 5
    //   311: invokespecial 174	org/apache/commons/io/input/Tailer:readLines	(Ljava/io/RandomAccessFile;)J
    //   314: lstore_3
    //   315: invokestatic 157	java/lang/System:currentTimeMillis	()J
    //   318: lstore 17
    //   320: lload 17
    //   322: lstore_1
    //   323: goto -87 -> 236
    //   326: aload 5
    //   328: invokestatic 172	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   331: aload 5
    //   333: pop
    //   334: return
    //   335: astore 8
    //   337: aload 5
    //   339: astore 7
    //   341: aload_0
    //   342: getfield 59	org/apache/commons/io/input/Tailer:listener	Lorg/apache/commons/io/input/TailerListener;
    //   345: aload 8
    //   347: invokeinterface 177 2 0
    //   352: aload 7
    //   354: invokestatic 172	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   357: return
    //   358: astore 6
    //   360: aload 5
    //   362: astore 7
    //   364: aload 7
    //   366: invokestatic 172	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   369: aload 6
    //   371: athrow
    //   372: astore 6
    //   374: goto -10 -> 364
    //   377: astore 8
    //   379: goto -38 -> 341
    //   382: astore 19
    //   384: goto -129 -> 255
    //   387: astore 15
    //   389: goto -187 -> 202
    //   392: aload 5
    //   394: astore 7
    //   396: goto -106 -> 290
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	399	0	this	Tailer
    //   1	322	1	l1	long
    //   3	312	3	l2	long
    //   5	388	5	localObject1	Object
    //   358	12	6	localObject2	Object
    //   372	1	6	localObject3	Object
    //   36	359	7	localObject4	Object
    //   335	11	8	localException1	Exception
    //   377	1	8	localException2	Exception
    //   11	3	9	bool1	boolean
    //   136	162	11	bool2	boolean
    //   145	74	12	l3	long
    //   165	20	14	localObject5	Object
    //   387	1	15	localFileNotFoundException1	java.io.FileNotFoundException
    //   196	1	16	localFileNotFoundException2	java.io.FileNotFoundException
    //   318	3	17	l4	long
    //   382	1	19	localInterruptedException1	InterruptedException
    //   75	1	20	localInterruptedException2	InterruptedException
    //   57	1	21	localFileNotFoundException3	java.io.FileNotFoundException
    // Exception table:
    //   from	to	target	type
    //   23	38	57	java/io/FileNotFoundException
    //   43	50	75	java/lang/InterruptedException
    //   167	182	196	java/io/FileNotFoundException
    //   7	13	335	java/lang/Exception
    //   23	38	335	java/lang/Exception
    //   59	68	335	java/lang/Exception
    //   121	147	335	java/lang/Exception
    //   154	163	335	java/lang/Exception
    //   167	182	335	java/lang/Exception
    //   225	236	335	java/lang/Exception
    //   236	248	335	java/lang/Exception
    //   248	255	335	java/lang/Exception
    //   255	284	335	java/lang/Exception
    //   302	320	335	java/lang/Exception
    //   7	13	358	finally
    //   23	38	358	finally
    //   59	68	358	finally
    //   121	147	358	finally
    //   154	163	358	finally
    //   167	182	358	finally
    //   225	236	358	finally
    //   236	248	358	finally
    //   248	255	358	finally
    //   255	284	358	finally
    //   302	320	358	finally
    //   43	50	372	finally
    //   84	99	372	finally
    //   99	109	372	finally
    //   184	189	372	finally
    //   202	211	372	finally
    //   284	290	372	finally
    //   341	352	372	finally
    //   43	50	377	java/lang/Exception
    //   84	99	377	java/lang/Exception
    //   99	109	377	java/lang/Exception
    //   184	189	377	java/lang/Exception
    //   202	211	377	java/lang/Exception
    //   284	290	377	java/lang/Exception
    //   248	255	382	java/lang/InterruptedException
    //   184	189	387	java/io/FileNotFoundException
  }
  
  public void stop()
  {
    this.run = false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/Tailer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */