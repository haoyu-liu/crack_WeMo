package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache;
import com.android.volley.Cache.Entry;
import com.android.volley.VolleyLog;
import java.io.EOFException;
import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class DiskBasedCache
  implements Cache
{
  private static final int CACHE_MAGIC = 538247942;
  private static final int DEFAULT_DISK_USAGE_BYTES = 5242880;
  private static final float HYSTERESIS_FACTOR = 0.9F;
  private final Map<String, CacheHeader> mEntries = new LinkedHashMap(16, 0.75F, true);
  private final int mMaxCacheSizeInBytes;
  private final File mRootDirectory;
  private long mTotalSize = 0L;
  
  public DiskBasedCache(File paramFile)
  {
    this(paramFile, 5242880);
  }
  
  public DiskBasedCache(File paramFile, int paramInt)
  {
    this.mRootDirectory = paramFile;
    this.mMaxCacheSizeInBytes = paramInt;
  }
  
  private String getFilenameForKey(String paramString)
  {
    int i = paramString.length() / 2;
    String str = String.valueOf(paramString.substring(0, i).hashCode());
    return str + String.valueOf(paramString.substring(i).hashCode());
  }
  
  private void pruneIfNeeded(int paramInt)
  {
    if (this.mTotalSize + paramInt < this.mMaxCacheSizeInBytes) {
      return;
    }
    if (VolleyLog.DEBUG) {
      VolleyLog.v("Pruning old cache entries.", new Object[0]);
    }
    long l1 = this.mTotalSize;
    int i = 0;
    long l2 = SystemClock.elapsedRealtime();
    Iterator localIterator = this.mEntries.entrySet().iterator();
    label61:
    CacheHeader localCacheHeader;
    if (localIterator.hasNext())
    {
      localCacheHeader = (CacheHeader)((Map.Entry)localIterator.next()).getValue();
      if (!getFileForKey(localCacheHeader.key).delete()) {
        break label205;
      }
      this.mTotalSize -= localCacheHeader.size;
    }
    for (;;)
    {
      localIterator.remove();
      i++;
      if ((float)(this.mTotalSize + paramInt) >= 0.9F * this.mMaxCacheSizeInBytes) {
        break label61;
      }
      if (!VolleyLog.DEBUG) {
        break;
      }
      Object[] arrayOfObject1 = new Object[3];
      arrayOfObject1[0] = Integer.valueOf(i);
      arrayOfObject1[1] = Long.valueOf(this.mTotalSize - l1);
      arrayOfObject1[2] = Long.valueOf(SystemClock.elapsedRealtime() - l2);
      VolleyLog.v("pruned %d files, %d bytes, %d ms", arrayOfObject1);
      return;
      label205:
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = localCacheHeader.key;
      arrayOfObject2[1] = getFilenameForKey(localCacheHeader.key);
      VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", arrayOfObject2);
    }
  }
  
  private void putEntry(String paramString, CacheHeader paramCacheHeader)
  {
    if (!this.mEntries.containsKey(paramString)) {}
    CacheHeader localCacheHeader;
    for (this.mTotalSize += paramCacheHeader.size;; this.mTotalSize += paramCacheHeader.size - localCacheHeader.size)
    {
      this.mEntries.put(paramString, paramCacheHeader);
      return;
      localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    }
  }
  
  private static int read(InputStream paramInputStream)
    throws IOException
  {
    int i = paramInputStream.read();
    if (i == -1) {
      throw new EOFException();
    }
    return i;
  }
  
  static int readInt(InputStream paramInputStream)
    throws IOException
  {
    return 0x0 | read(paramInputStream) << 0 | read(paramInputStream) << 8 | read(paramInputStream) << 16 | read(paramInputStream) << 24;
  }
  
  static long readLong(InputStream paramInputStream)
    throws IOException
  {
    return 0L | (0xFF & read(paramInputStream)) << 0 | (0xFF & read(paramInputStream)) << 8 | (0xFF & read(paramInputStream)) << 16 | (0xFF & read(paramInputStream)) << 24 | (0xFF & read(paramInputStream)) << 32 | (0xFF & read(paramInputStream)) << 40 | (0xFF & read(paramInputStream)) << 48 | (0xFF & read(paramInputStream)) << 56;
  }
  
  static String readString(InputStream paramInputStream)
    throws IOException
  {
    return new String(streamToBytes(paramInputStream, (int)readLong(paramInputStream)), "UTF-8");
  }
  
  static Map<String, String> readStringStringMap(InputStream paramInputStream)
    throws IOException
  {
    int i = readInt(paramInputStream);
    if (i == 0) {}
    for (Object localObject = Collections.emptyMap();; localObject = new HashMap(i)) {
      for (int j = 0; j < i; j++) {
        ((Map)localObject).put(readString(paramInputStream).intern(), readString(paramInputStream).intern());
      }
    }
    return (Map<String, String>)localObject;
  }
  
  private void removeEntry(String paramString)
  {
    CacheHeader localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    if (localCacheHeader != null)
    {
      this.mTotalSize -= localCacheHeader.size;
      this.mEntries.remove(paramString);
    }
  }
  
  private static byte[] streamToBytes(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      int j = paramInputStream.read(arrayOfByte, i, paramInt - i);
      if (j == -1) {
        break;
      }
      i += j;
    }
    if (i != paramInt) {
      throw new IOException("Expected " + paramInt + " bytes, read " + i + " bytes");
    }
    return arrayOfByte;
  }
  
  static void writeInt(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    paramOutputStream.write(0xFF & paramInt >> 0);
    paramOutputStream.write(0xFF & paramInt >> 8);
    paramOutputStream.write(0xFF & paramInt >> 16);
    paramOutputStream.write(0xFF & paramInt >> 24);
  }
  
  static void writeLong(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    paramOutputStream.write((byte)(int)(paramLong >>> 0));
    paramOutputStream.write((byte)(int)(paramLong >>> 8));
    paramOutputStream.write((byte)(int)(paramLong >>> 16));
    paramOutputStream.write((byte)(int)(paramLong >>> 24));
    paramOutputStream.write((byte)(int)(paramLong >>> 32));
    paramOutputStream.write((byte)(int)(paramLong >>> 40));
    paramOutputStream.write((byte)(int)(paramLong >>> 48));
    paramOutputStream.write((byte)(int)(paramLong >>> 56));
  }
  
  static void writeString(OutputStream paramOutputStream, String paramString)
    throws IOException
  {
    byte[] arrayOfByte = paramString.getBytes("UTF-8");
    writeLong(paramOutputStream, arrayOfByte.length);
    paramOutputStream.write(arrayOfByte, 0, arrayOfByte.length);
  }
  
  static void writeStringStringMap(Map<String, String> paramMap, OutputStream paramOutputStream)
    throws IOException
  {
    if (paramMap != null)
    {
      writeInt(paramOutputStream, paramMap.size());
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        writeString(paramOutputStream, (String)localEntry.getKey());
        writeString(paramOutputStream, (String)localEntry.getValue());
      }
    }
    writeInt(paramOutputStream, 0);
  }
  
  public void clear()
  {
    try
    {
      File[] arrayOfFile = this.mRootDirectory.listFiles();
      if (arrayOfFile != null)
      {
        int i = arrayOfFile.length;
        for (int j = 0; j < i; j++) {
          arrayOfFile[j].delete();
        }
      }
      this.mEntries.clear();
      this.mTotalSize = 0L;
      VolleyLog.d("Cache cleared.", new Object[0]);
      return;
    }
    finally {}
  }
  
  /* Error */
  public Cache.Entry get(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 38	com/android/volley/toolbox/DiskBasedCache:mEntries	Ljava/util/Map;
    //   6: aload_1
    //   7: invokeinterface 177 2 0
    //   12: checkcast 125	com/android/volley/toolbox/DiskBasedCache$CacheHeader
    //   15: astore_3
    //   16: aconst_null
    //   17: astore 4
    //   19: aload_3
    //   20: ifnonnull +8 -> 28
    //   23: aload_0
    //   24: monitorexit
    //   25: aload 4
    //   27: areturn
    //   28: aload_0
    //   29: aload_1
    //   30: invokevirtual 133	com/android/volley/toolbox/DiskBasedCache:getFileForKey	(Ljava/lang/String;)Ljava/io/File;
    //   33: astore 5
    //   35: aconst_null
    //   36: astore 6
    //   38: new 288	com/android/volley/toolbox/DiskBasedCache$CountingInputStream
    //   41: dup
    //   42: new 290	java/io/BufferedInputStream
    //   45: dup
    //   46: new 292	java/io/FileInputStream
    //   49: dup
    //   50: aload 5
    //   52: invokespecial 294	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   55: invokespecial 297	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   58: aconst_null
    //   59: invokespecial 300	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:<init>	(Ljava/io/InputStream;Lcom/android/volley/toolbox/DiskBasedCache$1;)V
    //   62: astore 7
    //   64: aload 7
    //   66: invokestatic 304	com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader	(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   69: pop
    //   70: aload_3
    //   71: aload 7
    //   73: aload 5
    //   75: invokevirtual 306	java/io/File:length	()J
    //   78: aload 7
    //   80: invokestatic 310	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:access$100	(Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;)I
    //   83: i2l
    //   84: lsub
    //   85: l2i
    //   86: invokestatic 203	com/android/volley/toolbox/DiskBasedCache:streamToBytes	(Ljava/io/InputStream;I)[B
    //   89: invokevirtual 314	com/android/volley/toolbox/DiskBasedCache$CacheHeader:toCacheEntry	([B)Lcom/android/volley/Cache$Entry;
    //   92: astore 14
    //   94: aload 7
    //   96: ifnull +8 -> 104
    //   99: aload 7
    //   101: invokevirtual 317	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   104: aload 14
    //   106: astore 4
    //   108: goto -85 -> 23
    //   111: astore 15
    //   113: aconst_null
    //   114: astore 4
    //   116: goto -93 -> 23
    //   119: astore 8
    //   121: iconst_2
    //   122: anewarray 4	java/lang/Object
    //   125: astore 11
    //   127: aload 11
    //   129: iconst_0
    //   130: aload 5
    //   132: invokevirtual 320	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   135: aastore
    //   136: aload 11
    //   138: iconst_1
    //   139: aload 8
    //   141: invokevirtual 321	java/io/IOException:toString	()Ljava/lang/String;
    //   144: aastore
    //   145: ldc_w 323
    //   148: aload 11
    //   150: invokestatic 163	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   153: aload_0
    //   154: aload_1
    //   155: invokevirtual 325	com/android/volley/toolbox/DiskBasedCache:remove	(Ljava/lang/String;)V
    //   158: aconst_null
    //   159: astore 4
    //   161: aload 6
    //   163: ifnull -140 -> 23
    //   166: aload 6
    //   168: invokevirtual 317	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   171: aconst_null
    //   172: astore 4
    //   174: goto -151 -> 23
    //   177: astore 12
    //   179: aconst_null
    //   180: astore 4
    //   182: goto -159 -> 23
    //   185: astore 9
    //   187: aload 6
    //   189: ifnull +8 -> 197
    //   192: aload 6
    //   194: invokevirtual 317	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   197: aload 9
    //   199: athrow
    //   200: astore_2
    //   201: aload_0
    //   202: monitorexit
    //   203: aload_2
    //   204: athrow
    //   205: astore 10
    //   207: aconst_null
    //   208: astore 4
    //   210: goto -187 -> 23
    //   213: astore 9
    //   215: aload 7
    //   217: astore 6
    //   219: goto -32 -> 187
    //   222: astore 8
    //   224: aload 7
    //   226: astore 6
    //   228: goto -107 -> 121
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	231	0	this	DiskBasedCache
    //   0	231	1	paramString	String
    //   200	4	2	localObject1	Object
    //   15	56	3	localCacheHeader	CacheHeader
    //   17	192	4	localObject2	Object
    //   33	98	5	localFile	File
    //   36	191	6	localObject3	Object
    //   62	163	7	localCountingInputStream	CountingInputStream
    //   119	21	8	localIOException1	IOException
    //   222	1	8	localIOException2	IOException
    //   185	13	9	localObject4	Object
    //   213	1	9	localObject5	Object
    //   205	1	10	localIOException3	IOException
    //   125	24	11	arrayOfObject	Object[]
    //   177	1	12	localIOException4	IOException
    //   92	13	14	localEntry	Cache.Entry
    //   111	1	15	localIOException5	IOException
    // Exception table:
    //   from	to	target	type
    //   99	104	111	java/io/IOException
    //   38	64	119	java/io/IOException
    //   166	171	177	java/io/IOException
    //   38	64	185	finally
    //   121	158	185	finally
    //   2	16	200	finally
    //   28	35	200	finally
    //   99	104	200	finally
    //   166	171	200	finally
    //   192	197	200	finally
    //   197	200	200	finally
    //   192	197	205	java/io/IOException
    //   64	94	213	finally
    //   64	94	222	java/io/IOException
  }
  
  public File getFileForKey(String paramString)
  {
    return new File(this.mRootDirectory, getFilenameForKey(paramString));
  }
  
  /* Error */
  public void initialize()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 42	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   6: invokevirtual 332	java/io/File:exists	()Z
    //   9: ifne +41 -> 50
    //   12: aload_0
    //   13: getfield 42	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   16: invokevirtual 335	java/io/File:mkdirs	()Z
    //   19: ifne +28 -> 47
    //   22: iconst_1
    //   23: anewarray 4	java/lang/Object
    //   26: astore 16
    //   28: aload 16
    //   30: iconst_0
    //   31: aload_0
    //   32: getfield 42	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   35: invokevirtual 320	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   38: aastore
    //   39: ldc_w 337
    //   42: aload 16
    //   44: invokestatic 340	com/android/volley/VolleyLog:e	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   47: aload_0
    //   48: monitorexit
    //   49: return
    //   50: aload_0
    //   51: getfield 42	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   54: invokevirtual 281	java/io/File:listFiles	()[Ljava/io/File;
    //   57: astore_2
    //   58: aload_2
    //   59: ifnull -12 -> 47
    //   62: aload_2
    //   63: arraylength
    //   64: istore_3
    //   65: iconst_0
    //   66: istore 4
    //   68: iload 4
    //   70: iload_3
    //   71: if_icmpge -24 -> 47
    //   74: aload_2
    //   75: iload 4
    //   77: aaload
    //   78: astore 5
    //   80: aconst_null
    //   81: astore 6
    //   83: new 290	java/io/BufferedInputStream
    //   86: dup
    //   87: new 292	java/io/FileInputStream
    //   90: dup
    //   91: aload 5
    //   93: invokespecial 294	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   96: invokespecial 297	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   99: astore 7
    //   101: aload 7
    //   103: invokestatic 304	com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader	(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   106: astore 13
    //   108: aload 13
    //   110: aload 5
    //   112: invokevirtual 306	java/io/File:length	()J
    //   115: putfield 141	com/android/volley/toolbox/DiskBasedCache$CacheHeader:size	J
    //   118: aload_0
    //   119: aload 13
    //   121: getfield 129	com/android/volley/toolbox/DiskBasedCache$CacheHeader:key	Ljava/lang/String;
    //   124: aload 13
    //   126: invokespecial 342	com/android/volley/toolbox/DiskBasedCache:putEntry	(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    //   129: aload 7
    //   131: ifnull +8 -> 139
    //   134: aload 7
    //   136: invokevirtual 343	java/io/BufferedInputStream:close	()V
    //   139: iinc 4 1
    //   142: goto -74 -> 68
    //   145: astore 14
    //   147: goto -8 -> 139
    //   150: astore 15
    //   152: aload 5
    //   154: ifnull +9 -> 163
    //   157: aload 5
    //   159: invokevirtual 138	java/io/File:delete	()Z
    //   162: pop
    //   163: aload 6
    //   165: ifnull -26 -> 139
    //   168: aload 6
    //   170: invokevirtual 343	java/io/BufferedInputStream:close	()V
    //   173: goto -34 -> 139
    //   176: astore 9
    //   178: goto -39 -> 139
    //   181: astore 10
    //   183: aload 6
    //   185: ifnull +8 -> 193
    //   188: aload 6
    //   190: invokevirtual 343	java/io/BufferedInputStream:close	()V
    //   193: aload 10
    //   195: athrow
    //   196: astore_1
    //   197: aload_0
    //   198: monitorexit
    //   199: aload_1
    //   200: athrow
    //   201: astore 11
    //   203: goto -10 -> 193
    //   206: astore 10
    //   208: aload 7
    //   210: astore 6
    //   212: goto -29 -> 183
    //   215: astore 8
    //   217: aload 7
    //   219: astore 6
    //   221: goto -69 -> 152
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	224	0	this	DiskBasedCache
    //   196	4	1	localObject1	Object
    //   57	18	2	arrayOfFile	File[]
    //   64	8	3	i	int
    //   66	74	4	j	int
    //   78	80	5	localFile	File
    //   81	139	6	localObject2	Object
    //   99	119	7	localBufferedInputStream	java.io.BufferedInputStream
    //   215	1	8	localIOException1	IOException
    //   176	1	9	localIOException2	IOException
    //   181	13	10	localObject3	Object
    //   206	1	10	localObject4	Object
    //   201	1	11	localIOException3	IOException
    //   106	19	13	localCacheHeader	CacheHeader
    //   145	1	14	localIOException4	IOException
    //   150	1	15	localIOException5	IOException
    //   26	17	16	arrayOfObject	Object[]
    // Exception table:
    //   from	to	target	type
    //   134	139	145	java/io/IOException
    //   83	101	150	java/io/IOException
    //   168	173	176	java/io/IOException
    //   83	101	181	finally
    //   157	163	181	finally
    //   2	47	196	finally
    //   50	58	196	finally
    //   62	65	196	finally
    //   74	80	196	finally
    //   134	139	196	finally
    //   168	173	196	finally
    //   188	193	196	finally
    //   193	196	196	finally
    //   188	193	201	java/io/IOException
    //   101	129	206	finally
    //   101	129	215	java/io/IOException
  }
  
  public void invalidate(String paramString, boolean paramBoolean)
  {
    try
    {
      Cache.Entry localEntry = get(paramString);
      if (localEntry != null)
      {
        localEntry.softTtl = 0L;
        if (paramBoolean) {
          localEntry.ttl = 0L;
        }
        put(paramString, localEntry);
      }
      return;
    }
    finally {}
  }
  
  /* Error */
  public void put(String paramString, Cache.Entry paramEntry)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: getfield 362	com/android/volley/Cache$Entry:data	[B
    //   7: arraylength
    //   8: invokespecial 364	com/android/volley/toolbox/DiskBasedCache:pruneIfNeeded	(I)V
    //   11: aload_0
    //   12: aload_1
    //   13: invokevirtual 133	com/android/volley/toolbox/DiskBasedCache:getFileForKey	(Ljava/lang/String;)Ljava/io/File;
    //   16: astore 4
    //   18: new 366	java/io/BufferedOutputStream
    //   21: dup
    //   22: new 368	java/io/FileOutputStream
    //   25: dup
    //   26: aload 4
    //   28: invokespecial 369	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   31: invokespecial 372	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   34: astore 5
    //   36: new 125	com/android/volley/toolbox/DiskBasedCache$CacheHeader
    //   39: dup
    //   40: aload_1
    //   41: aload_2
    //   42: invokespecial 374	com/android/volley/toolbox/DiskBasedCache$CacheHeader:<init>	(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    //   45: astore 6
    //   47: aload 6
    //   49: aload 5
    //   51: invokevirtual 378	com/android/volley/toolbox/DiskBasedCache$CacheHeader:writeHeader	(Ljava/io/OutputStream;)Z
    //   54: ifne +75 -> 129
    //   57: aload 5
    //   59: invokevirtual 379	java/io/BufferedOutputStream:close	()V
    //   62: iconst_1
    //   63: anewarray 4	java/lang/Object
    //   66: astore 9
    //   68: aload 9
    //   70: iconst_0
    //   71: aload 4
    //   73: invokevirtual 320	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   76: aastore
    //   77: ldc_w 381
    //   80: aload 9
    //   82: invokestatic 163	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   85: new 181	java/io/IOException
    //   88: dup
    //   89: invokespecial 382	java/io/IOException:<init>	()V
    //   92: athrow
    //   93: astore 7
    //   95: aload 4
    //   97: invokevirtual 138	java/io/File:delete	()Z
    //   100: ifne +26 -> 126
    //   103: iconst_1
    //   104: anewarray 4	java/lang/Object
    //   107: astore 8
    //   109: aload 8
    //   111: iconst_0
    //   112: aload 4
    //   114: invokevirtual 320	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   117: aastore
    //   118: ldc_w 384
    //   121: aload 8
    //   123: invokestatic 163	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   126: aload_0
    //   127: monitorexit
    //   128: return
    //   129: aload 5
    //   131: aload_2
    //   132: getfield 362	com/android/volley/Cache$Entry:data	[B
    //   135: invokevirtual 387	java/io/BufferedOutputStream:write	([B)V
    //   138: aload 5
    //   140: invokevirtual 379	java/io/BufferedOutputStream:close	()V
    //   143: aload_0
    //   144: aload_1
    //   145: aload 6
    //   147: invokespecial 342	com/android/volley/toolbox/DiskBasedCache:putEntry	(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    //   150: goto -24 -> 126
    //   153: astore_3
    //   154: aload_0
    //   155: monitorexit
    //   156: aload_3
    //   157: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	158	0	this	DiskBasedCache
    //   0	158	1	paramString	String
    //   0	158	2	paramEntry	Cache.Entry
    //   153	4	3	localObject	Object
    //   16	97	4	localFile	File
    //   34	105	5	localBufferedOutputStream	java.io.BufferedOutputStream
    //   45	101	6	localCacheHeader	CacheHeader
    //   93	1	7	localIOException	IOException
    //   107	15	8	arrayOfObject1	Object[]
    //   66	15	9	arrayOfObject2	Object[]
    // Exception table:
    //   from	to	target	type
    //   18	93	93	java/io/IOException
    //   129	150	93	java/io/IOException
    //   2	18	153	finally
    //   18	93	153	finally
    //   95	126	153	finally
    //   129	150	153	finally
  }
  
  public void remove(String paramString)
  {
    try
    {
      boolean bool = getFileForKey(paramString).delete();
      removeEntry(paramString);
      if (!bool)
      {
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = paramString;
        arrayOfObject[1] = getFilenameForKey(paramString);
        VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", arrayOfObject);
      }
      return;
    }
    finally {}
  }
  
  static class CacheHeader
  {
    public String etag;
    public String key;
    public long lastModified;
    public Map<String, String> responseHeaders;
    public long serverDate;
    public long size;
    public long softTtl;
    public long ttl;
    
    private CacheHeader() {}
    
    public CacheHeader(String paramString, Cache.Entry paramEntry)
    {
      this.key = paramString;
      this.size = paramEntry.data.length;
      this.etag = paramEntry.etag;
      this.serverDate = paramEntry.serverDate;
      this.lastModified = paramEntry.lastModified;
      this.ttl = paramEntry.ttl;
      this.softTtl = paramEntry.softTtl;
      this.responseHeaders = paramEntry.responseHeaders;
    }
    
    public static CacheHeader readHeader(InputStream paramInputStream)
      throws IOException
    {
      CacheHeader localCacheHeader = new CacheHeader();
      if (DiskBasedCache.readInt(paramInputStream) != 538247942) {
        throw new IOException();
      }
      localCacheHeader.key = DiskBasedCache.readString(paramInputStream);
      localCacheHeader.etag = DiskBasedCache.readString(paramInputStream);
      if (localCacheHeader.etag.equals("")) {
        localCacheHeader.etag = null;
      }
      localCacheHeader.serverDate = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.lastModified = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.ttl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.softTtl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.responseHeaders = DiskBasedCache.readStringStringMap(paramInputStream);
      return localCacheHeader;
    }
    
    public Cache.Entry toCacheEntry(byte[] paramArrayOfByte)
    {
      Cache.Entry localEntry = new Cache.Entry();
      localEntry.data = paramArrayOfByte;
      localEntry.etag = this.etag;
      localEntry.serverDate = this.serverDate;
      localEntry.lastModified = this.lastModified;
      localEntry.ttl = this.ttl;
      localEntry.softTtl = this.softTtl;
      localEntry.responseHeaders = this.responseHeaders;
      return localEntry;
    }
    
    public boolean writeHeader(OutputStream paramOutputStream)
    {
      try
      {
        DiskBasedCache.writeInt(paramOutputStream, 538247942);
        DiskBasedCache.writeString(paramOutputStream, this.key);
        if (this.etag == null) {}
        for (String str = "";; str = this.etag)
        {
          DiskBasedCache.writeString(paramOutputStream, str);
          DiskBasedCache.writeLong(paramOutputStream, this.serverDate);
          DiskBasedCache.writeLong(paramOutputStream, this.lastModified);
          DiskBasedCache.writeLong(paramOutputStream, this.ttl);
          DiskBasedCache.writeLong(paramOutputStream, this.softTtl);
          DiskBasedCache.writeStringStringMap(this.responseHeaders, paramOutputStream);
          paramOutputStream.flush();
          return true;
        }
        Object[] arrayOfObject;
        return false;
      }
      catch (IOException localIOException)
      {
        arrayOfObject = new Object[1];
        arrayOfObject[0] = localIOException.toString();
        VolleyLog.d("%s", arrayOfObject);
      }
    }
  }
  
  private static class CountingInputStream
    extends FilterInputStream
  {
    private int bytesRead = 0;
    
    private CountingInputStream(InputStream paramInputStream)
    {
      super();
    }
    
    public int read()
      throws IOException
    {
      int i = super.read();
      if (i != -1) {
        this.bytesRead = (1 + this.bytesRead);
      }
      return i;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int i = super.read(paramArrayOfByte, paramInt1, paramInt2);
      if (i != -1) {
        this.bytesRead = (i + this.bytesRead);
      }
      return i;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/toolbox/DiskBasedCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */