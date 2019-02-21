package net.lingala.zip4j.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.Zip64EndCentralDirLocator;
import net.lingala.zip4j.model.Zip64EndCentralDirRecord;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.progress.ProgressMonitor;

public class ArchiveMaintainer
{
  private long calculateTotalWorkForMergeOp(ZipModel paramZipModel)
    throws ZipException
  {
    long l = 0L;
    String str1;
    int j;
    if (paramZipModel.isSplitArchive())
    {
      int i = paramZipModel.getEndCentralDirRecord().getNoOfThisDisk();
      str1 = paramZipModel.getZipFile();
      j = 0;
      if (j <= i) {}
    }
    else
    {
      return l;
    }
    String str2;
    if (paramZipModel.getEndCentralDirRecord().getNoOfThisDisk() == 0) {
      str2 = paramZipModel.getZipFile();
    }
    for (;;)
    {
      l += Zip4jUtil.getFileLengh(new File(str2));
      j++;
      break;
      if (9 >= 0) {
        str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z" + 1;
      } else {
        str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z0" + 1;
      }
    }
  }
  
  private long calculateTotalWorkForRemoveOp(ZipModel paramZipModel, FileHeader paramFileHeader)
    throws ZipException
  {
    return Zip4jUtil.getFileLengh(new File(paramZipModel.getZipFile())) - paramFileHeader.getCompressedSize();
  }
  
  private void copyFile(RandomAccessFile paramRandomAccessFile, OutputStream paramOutputStream, long paramLong1, long paramLong2, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    if ((paramRandomAccessFile == null) || (paramOutputStream == null)) {
      throw new ZipException("input or output stream is null, cannot copy file");
    }
    if (paramLong1 < 0L) {
      throw new ZipException("starting offset is negative, cannot copy file");
    }
    if (paramLong2 < 0L) {
      throw new ZipException("end offset is negative, cannot copy file");
    }
    if (paramLong1 > paramLong2) {
      throw new ZipException("start offset is greater than end offset, cannot copy file");
    }
    if (paramLong1 == paramLong2) {}
    for (;;)
    {
      return;
      if (paramProgressMonitor.isCancelAllTasks())
      {
        paramProgressMonitor.setResult(3);
        paramProgressMonitor.setState(0);
        return;
      }
      try
      {
        paramRandomAccessFile.seek(paramLong1);
        l1 = 0L;
        l2 = paramLong2 - paramLong1;
        if (paramLong2 - paramLong1 < 4096L)
        {
          arrayOfByte = new byte[(int)(paramLong2 - paramLong1)];
          i = paramRandomAccessFile.read(arrayOfByte);
          if (i == -1) {
            continue;
          }
          paramOutputStream.write(arrayOfByte, 0, i);
          paramProgressMonitor.updateWorkCompleted(i);
          if (!paramProgressMonitor.isCancelAllTasks()) {
            break label199;
          }
          paramProgressMonitor.setResult(3);
          return;
        }
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          long l1;
          long l2;
          int i;
          throw new ZipException(localIOException);
          byte[] arrayOfByte = new byte['က'];
          continue;
          l1 += i;
          if (l1 == l2) {
            break;
          }
          if (l1 + arrayOfByte.length > l2) {
            arrayOfByte = new byte[(int)(l2 - l1)];
          }
        }
      }
      catch (Exception localException)
      {
        label199:
        throw new ZipException(localException);
      }
    }
  }
  
  private RandomAccessFile createFileHandler(ZipModel paramZipModel, String paramString)
    throws ZipException
  {
    if ((paramZipModel == null) || (!Zip4jUtil.isStringNotNullAndNotEmpty(paramZipModel.getZipFile()))) {
      throw new ZipException("input parameter is null in getFilePointer, cannot create file handler to remove file");
    }
    try
    {
      RandomAccessFile localRandomAccessFile = new RandomAccessFile(new File(paramZipModel.getZipFile()), paramString);
      return localRandomAccessFile;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      throw new ZipException(localFileNotFoundException);
    }
  }
  
  private RandomAccessFile createSplitZipFileHandler(ZipModel paramZipModel, int paramInt)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot create split file handler");
    }
    if (paramInt < 0) {
      throw new ZipException("invlaid part number, cannot create split file handler");
    }
    try
    {
      str1 = paramZipModel.getZipFile();
      if (paramInt == paramZipModel.getEndCentralDirRecord().getNoOfThisDisk())
      {
        str2 = paramZipModel.getZipFile();
        localFile = new File(str2);
        if (Zip4jUtil.checkFileExists(localFile)) {
          break label197;
        }
        throw new ZipException("split file does not exist: " + str2);
      }
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      File localFile;
      for (;;)
      {
        String str1;
        String str2;
        throw new ZipException(localFileNotFoundException);
        if (paramInt >= 9) {
          str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z" + (paramInt + 1);
        } else {
          str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z0" + (paramInt + 1);
        }
      }
      RandomAccessFile localRandomAccessFile = new RandomAccessFile(localFile, "r");
      return localRandomAccessFile;
    }
    catch (Exception localException)
    {
      label197:
      throw new ZipException(localException);
    }
  }
  
  /* Error */
  private void initMergeSplitZipFile(ZipModel paramZipModel, File paramFile, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +23 -> 24
    //   4: new 12	net/lingala/zip4j/exception/ZipException
    //   7: dup
    //   8: ldc -86
    //   10: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   13: astore 4
    //   15: aload_3
    //   16: aload 4
    //   18: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   21: aload 4
    //   23: athrow
    //   24: aload_1
    //   25: invokevirtual 24	net/lingala/zip4j/model/ZipModel:isSplitArchive	()Z
    //   28: ifne +23 -> 51
    //   31: new 12	net/lingala/zip4j/exception/ZipException
    //   34: dup
    //   35: ldc -81
    //   37: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   40: astore 5
    //   42: aload_3
    //   43: aload 5
    //   45: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   48: aload 5
    //   50: athrow
    //   51: aconst_null
    //   52: astore 6
    //   54: aconst_null
    //   55: astore 7
    //   57: new 177	java/util/ArrayList
    //   60: dup
    //   61: invokespecial 178	java/util/ArrayList:<init>	()V
    //   64: astore 8
    //   66: lconst_0
    //   67: lstore 9
    //   69: iconst_0
    //   70: istore 11
    //   72: aload_1
    //   73: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   76: invokevirtual 34	net/lingala/zip4j/model/EndCentralDirRecord:getNoOfThisDisk	()I
    //   79: istore 17
    //   81: aconst_null
    //   82: astore 7
    //   84: aconst_null
    //   85: astore 6
    //   87: iload 17
    //   89: ifgt +56 -> 145
    //   92: new 12	net/lingala/zip4j/exception/ZipException
    //   95: dup
    //   96: ldc -76
    //   98: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   101: athrow
    //   102: astore 16
    //   104: aload_3
    //   105: aload 16
    //   107: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   110: new 12	net/lingala/zip4j/exception/ZipException
    //   113: dup
    //   114: aload 16
    //   116: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   119: athrow
    //   120: astore 13
    //   122: aload 6
    //   124: ifnull +8 -> 132
    //   127: aload 6
    //   129: invokevirtual 183	java/io/OutputStream:close	()V
    //   132: aload 7
    //   134: ifnull +8 -> 142
    //   137: aload 7
    //   139: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   142: aload 13
    //   144: athrow
    //   145: aload_0
    //   146: aload_2
    //   147: invokespecial 188	net/lingala/zip4j/util/ArchiveMaintainer:prepareOutputStreamForMerge	(Ljava/io/File;)Ljava/io/OutputStream;
    //   150: astore 6
    //   152: iconst_0
    //   153: istore 18
    //   155: iload 18
    //   157: iload 17
    //   159: if_icmple +71 -> 230
    //   162: aload_1
    //   163: invokevirtual 192	net/lingala/zip4j/model/ZipModel:clone	()Ljava/lang/Object;
    //   166: checkcast 20	net/lingala/zip4j/model/ZipModel
    //   169: astore 19
    //   171: aload 19
    //   173: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   176: lload 9
    //   178: invokevirtual 195	net/lingala/zip4j/model/EndCentralDirRecord:setOffsetOfStartOfCentralDir	(J)V
    //   181: aload_0
    //   182: aload 19
    //   184: aload 8
    //   186: iload 11
    //   188: invokespecial 199	net/lingala/zip4j/util/ArchiveMaintainer:updateSplitZipModel	(Lnet/lingala/zip4j/model/ZipModel;Ljava/util/ArrayList;Z)V
    //   191: new 201	net/lingala/zip4j/core/HeaderWriter
    //   194: dup
    //   195: invokespecial 202	net/lingala/zip4j/core/HeaderWriter:<init>	()V
    //   198: aload 19
    //   200: aload 6
    //   202: invokevirtual 206	net/lingala/zip4j/core/HeaderWriter:finalizeZipFileWithoutValidations	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    //   205: aload_3
    //   206: invokevirtual 209	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorSuccess	()V
    //   209: aload 6
    //   211: ifnull +8 -> 219
    //   214: aload 6
    //   216: invokevirtual 183	java/io/OutputStream:close	()V
    //   219: aload 7
    //   221: ifnull +8 -> 229
    //   224: aload 7
    //   226: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   229: return
    //   230: aload_0
    //   231: aload_1
    //   232: iload 18
    //   234: invokespecial 211	net/lingala/zip4j/util/ArchiveMaintainer:createSplitZipFileHandler	(Lnet/lingala/zip4j/model/ZipModel;I)Ljava/io/RandomAccessFile;
    //   237: astore 7
    //   239: new 213	java/lang/Long
    //   242: dup
    //   243: aload 7
    //   245: invokevirtual 216	java/io/RandomAccessFile:length	()J
    //   248: invokespecial 218	java/lang/Long:<init>	(J)V
    //   251: astore 22
    //   253: iconst_0
    //   254: istore 23
    //   256: iload 18
    //   258: ifne +100 -> 358
    //   261: aload_1
    //   262: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   265: astore 24
    //   267: iconst_0
    //   268: istore 23
    //   270: aload 24
    //   272: ifnull +86 -> 358
    //   275: aload_1
    //   276: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   279: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   282: astore 25
    //   284: iconst_0
    //   285: istore 23
    //   287: aload 25
    //   289: ifnull +69 -> 358
    //   292: aload_1
    //   293: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   296: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   299: invokevirtual 231	java/util/ArrayList:size	()I
    //   302: istore 26
    //   304: iconst_0
    //   305: istore 23
    //   307: iload 26
    //   309: ifle +49 -> 358
    //   312: iconst_4
    //   313: newarray <illegal type>
    //   315: astore 27
    //   317: aload 7
    //   319: lconst_0
    //   320: invokevirtual 123	java/io/RandomAccessFile:seek	(J)V
    //   323: aload 7
    //   325: aload 27
    //   327: invokevirtual 129	java/io/RandomAccessFile:read	([B)I
    //   330: pop
    //   331: aload 27
    //   333: iconst_0
    //   334: invokestatic 237	net/lingala/zip4j/util/Raw:readIntLittleEndian	([BI)I
    //   337: i2l
    //   338: ldc2_w 238
    //   341: lcmp
    //   342: istore 29
    //   344: iconst_0
    //   345: istore 23
    //   347: iload 29
    //   349: ifne +9 -> 358
    //   352: iconst_4
    //   353: istore 23
    //   355: iconst_1
    //   356: istore 11
    //   358: iload 18
    //   360: iload 17
    //   362: if_icmpne +19 -> 381
    //   365: new 213	java/lang/Long
    //   368: dup
    //   369: aload_1
    //   370: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   373: invokevirtual 242	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   376: invokespecial 218	java/lang/Long:<init>	(J)V
    //   379: astore 22
    //   381: aload_0
    //   382: aload 7
    //   384: aload 6
    //   386: iload 23
    //   388: i2l
    //   389: aload 22
    //   391: invokevirtual 245	java/lang/Long:longValue	()J
    //   394: aload_3
    //   395: invokespecial 247	net/lingala/zip4j/util/ArchiveMaintainer:copyFile	(Ljava/io/RandomAccessFile;Ljava/io/OutputStream;JJLnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   398: lload 9
    //   400: aload 22
    //   402: invokevirtual 245	java/lang/Long:longValue	()J
    //   405: iload 23
    //   407: i2l
    //   408: lsub
    //   409: ladd
    //   410: lstore 9
    //   412: aload_3
    //   413: invokevirtual 110	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   416: ifeq +37 -> 453
    //   419: aload_3
    //   420: iconst_3
    //   421: invokevirtual 114	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   424: aload_3
    //   425: iconst_0
    //   426: invokevirtual 117	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   429: aload 6
    //   431: ifnull +8 -> 439
    //   434: aload 6
    //   436: invokevirtual 183	java/io/OutputStream:close	()V
    //   439: aload 7
    //   441: ifnull -212 -> 229
    //   444: aload 7
    //   446: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   449: return
    //   450: astore 32
    //   452: return
    //   453: aload 8
    //   455: aload 22
    //   457: invokevirtual 251	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   460: pop
    //   461: aload 7
    //   463: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   466: iinc 18 1
    //   469: goto -314 -> 155
    //   472: astore 12
    //   474: aload_3
    //   475: aload 12
    //   477: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   480: new 12	net/lingala/zip4j/exception/ZipException
    //   483: dup
    //   484: aload 12
    //   486: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   489: athrow
    //   490: astore 33
    //   492: goto -53 -> 439
    //   495: astore 31
    //   497: goto -31 -> 466
    //   500: astore 15
    //   502: goto -370 -> 132
    //   505: astore 14
    //   507: goto -365 -> 142
    //   510: astore 21
    //   512: goto -293 -> 219
    //   515: astore 20
    //   517: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	518	0	this	ArchiveMaintainer
    //   0	518	1	paramZipModel	ZipModel
    //   0	518	2	paramFile	File
    //   0	518	3	paramProgressMonitor	ProgressMonitor
    //   13	9	4	localZipException1	ZipException
    //   40	9	5	localZipException2	ZipException
    //   52	383	6	localOutputStream	OutputStream
    //   55	407	7	localRandomAccessFile	RandomAccessFile
    //   64	390	8	localArrayList1	ArrayList
    //   67	344	9	l	long
    //   70	287	11	bool1	boolean
    //   472	13	12	localException	Exception
    //   120	23	13	localObject	Object
    //   505	1	14	localIOException1	IOException
    //   500	1	15	localIOException2	IOException
    //   102	13	16	localIOException3	IOException
    //   79	284	17	i	int
    //   153	314	18	j	int
    //   169	30	19	localZipModel	ZipModel
    //   515	1	20	localIOException4	IOException
    //   510	1	21	localIOException5	IOException
    //   251	205	22	localLong	Long
    //   254	152	23	k	int
    //   265	6	24	localCentralDirectory	CentralDirectory
    //   282	6	25	localArrayList2	ArrayList
    //   302	6	26	m	int
    //   315	17	27	arrayOfByte	byte[]
    //   342	6	29	bool2	boolean
    //   495	1	31	localIOException6	IOException
    //   450	1	32	localIOException7	IOException
    //   490	1	33	localIOException8	IOException
    // Exception table:
    //   from	to	target	type
    //   72	81	102	java/io/IOException
    //   92	102	102	java/io/IOException
    //   145	152	102	java/io/IOException
    //   162	209	102	java/io/IOException
    //   230	253	102	java/io/IOException
    //   261	267	102	java/io/IOException
    //   275	284	102	java/io/IOException
    //   292	304	102	java/io/IOException
    //   312	344	102	java/io/IOException
    //   365	381	102	java/io/IOException
    //   381	429	102	java/io/IOException
    //   453	461	102	java/io/IOException
    //   72	81	120	finally
    //   92	102	120	finally
    //   104	120	120	finally
    //   145	152	120	finally
    //   162	209	120	finally
    //   230	253	120	finally
    //   261	267	120	finally
    //   275	284	120	finally
    //   292	304	120	finally
    //   312	344	120	finally
    //   365	381	120	finally
    //   381	429	120	finally
    //   453	461	120	finally
    //   461	466	120	finally
    //   474	490	120	finally
    //   444	449	450	java/io/IOException
    //   72	81	472	java/lang/Exception
    //   92	102	472	java/lang/Exception
    //   145	152	472	java/lang/Exception
    //   162	209	472	java/lang/Exception
    //   230	253	472	java/lang/Exception
    //   261	267	472	java/lang/Exception
    //   275	284	472	java/lang/Exception
    //   292	304	472	java/lang/Exception
    //   312	344	472	java/lang/Exception
    //   365	381	472	java/lang/Exception
    //   381	429	472	java/lang/Exception
    //   453	461	472	java/lang/Exception
    //   461	466	472	java/lang/Exception
    //   434	439	490	java/io/IOException
    //   461	466	495	java/io/IOException
    //   127	132	500	java/io/IOException
    //   137	142	505	java/io/IOException
    //   214	219	510	java/io/IOException
    //   224	229	515	java/io/IOException
  }
  
  private OutputStream prepareOutputStreamForMerge(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("outFile is null, cannot create outputstream");
    }
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(paramFile);
      return localFileOutputStream;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      throw new ZipException(localFileNotFoundException);
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private void restoreFileName(File paramFile, String paramString)
    throws ZipException
  {
    if (paramFile.delete())
    {
      if (!new File(paramString).renameTo(paramFile)) {
        throw new ZipException("cannot rename modified zip file");
      }
    }
    else {
      throw new ZipException("cannot delete old zip file");
    }
  }
  
  private void updateSplitEndCentralDirectory(ZipModel paramZipModel)
    throws ZipException
  {
    if (paramZipModel == null) {}
    try
    {
      throw new ZipException("zip model is null - cannot update end of central directory for split zip model");
    }
    catch (ZipException localZipException)
    {
      throw localZipException;
      if (paramZipModel.getCentralDirectory() == null) {
        throw new ZipException("corrupt zip model - getCentralDirectory, cannot update split zip model");
      }
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
    paramZipModel.getEndCentralDirRecord().setNoOfThisDisk(0);
    paramZipModel.getEndCentralDirRecord().setNoOfThisDiskStartOfCentralDir(0);
    paramZipModel.getEndCentralDirRecord().setTotNoOfEntriesInCentralDir(paramZipModel.getCentralDirectory().getFileHeaders().size());
    paramZipModel.getEndCentralDirRecord().setTotNoOfEntriesInCentralDirOnThisDisk(paramZipModel.getCentralDirectory().getFileHeaders().size());
  }
  
  private void updateSplitFileHeader(ZipModel paramZipModel, ArrayList paramArrayList, boolean paramBoolean)
    throws ZipException
  {
    for (;;)
    {
      int i;
      try
      {
        if (paramZipModel.getCentralDirectory() == null) {
          throw new ZipException("corrupt zip model - getCentralDirectory, cannot update split zip model");
        }
      }
      catch (ZipException localZipException)
      {
        throw localZipException;
        i = paramZipModel.getCentralDirectory().getFileHeaders().size();
        int j = 0;
        if (paramBoolean)
        {
          j = 4;
          break label178;
          Object localObject;
          if (m >= ((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(k)).getDiskNumberStart())
          {
            ((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(k)).setOffsetLocalHeader(localObject + ((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(k)).getOffsetLocalHeader() - j);
            ((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(k)).setDiskNumberStart(0);
            k++;
            break label181;
          }
          long l2 = ((Long)paramArrayList.get(m)).longValue();
          localObject += l2;
          m++;
          continue;
        }
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
      label178:
      int k = 0;
      label181:
      if (k >= i) {
        return;
      }
      long l1 = 0L;
      int m = 0;
    }
  }
  
  private void updateSplitZip64EndCentralDirLocator(ZipModel paramZipModel, ArrayList paramArrayList)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot update split Zip64 end of central directory locator");
    }
    if (paramZipModel.getZip64EndCentralDirLocator() == null) {
      return;
    }
    paramZipModel.getZip64EndCentralDirLocator().setNoOfDiskStartOfZip64EndOfCentralDirRec(0);
    long l = 0L;
    for (int i = 0;; i++)
    {
      if (i >= paramArrayList.size())
      {
        paramZipModel.getZip64EndCentralDirLocator().setOffsetZip64EndOfCentralDirRec(l + paramZipModel.getZip64EndCentralDirLocator().getOffsetZip64EndOfCentralDirRec());
        paramZipModel.getZip64EndCentralDirLocator().setTotNumberOfDiscs(1);
        return;
      }
      l += ((Long)paramArrayList.get(i)).longValue();
    }
  }
  
  private void updateSplitZip64EndCentralDirRec(ZipModel paramZipModel, ArrayList paramArrayList)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot update split Zip64 end of central directory record");
    }
    if (paramZipModel.getZip64EndCentralDirRecord() == null) {
      return;
    }
    paramZipModel.getZip64EndCentralDirRecord().setNoOfThisDisk(0);
    paramZipModel.getZip64EndCentralDirRecord().setNoOfThisDiskStartOfCentralDir(0);
    paramZipModel.getZip64EndCentralDirRecord().setTotNoOfEntriesInCentralDirOnThisDisk(paramZipModel.getEndCentralDirRecord().getTotNoOfEntriesInCentralDir());
    long l = 0L;
    for (int i = 0;; i++)
    {
      if (i >= paramArrayList.size())
      {
        paramZipModel.getZip64EndCentralDirRecord().setOffsetStartCenDirWRTStartDiskNo(l + paramZipModel.getZip64EndCentralDirRecord().getOffsetStartCenDirWRTStartDiskNo());
        return;
      }
      l += ((Long)paramArrayList.get(i)).longValue();
    }
  }
  
  private void updateSplitZipModel(ZipModel paramZipModel, ArrayList paramArrayList, boolean paramBoolean)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot update split zip model");
    }
    paramZipModel.setSplitArchive(false);
    updateSplitFileHeader(paramZipModel, paramArrayList, paramBoolean);
    updateSplitEndCentralDirectory(paramZipModel);
    if (paramZipModel.isZip64Format())
    {
      updateSplitZip64EndCentralDirLocator(paramZipModel, paramArrayList);
      updateSplitZip64EndCentralDirRec(paramZipModel, paramArrayList);
    }
  }
  
  public void initProgressMonitorForMergeOp(ZipModel paramZipModel, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot calculate total work for merge op");
    }
    paramProgressMonitor.setCurrentOperation(4);
    paramProgressMonitor.setFileName(paramZipModel.getZipFile());
    paramProgressMonitor.setTotalWork(calculateTotalWorkForMergeOp(paramZipModel));
    paramProgressMonitor.setState(1);
  }
  
  public void initProgressMonitorForRemoveOp(ZipModel paramZipModel, FileHeader paramFileHeader, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramFileHeader == null) || (paramProgressMonitor == null)) {
      throw new ZipException("one of the input parameters is null, cannot calculate total work");
    }
    paramProgressMonitor.setCurrentOperation(2);
    paramProgressMonitor.setFileName(paramFileHeader.getFileName());
    paramProgressMonitor.setTotalWork(calculateTotalWorkForRemoveOp(paramZipModel, paramFileHeader));
    paramProgressMonitor.setState(1);
  }
  
  /* Error */
  public HashMap initRemoveZipFile(ZipModel paramZipModel, FileHeader paramFileHeader, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnull +7 -> 8
    //   4: aload_1
    //   5: ifnonnull +14 -> 19
    //   8: new 12	net/lingala/zip4j/exception/ZipException
    //   11: dup
    //   12: ldc_w 393
    //   15: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   18: athrow
    //   19: aconst_null
    //   20: astore 4
    //   22: aconst_null
    //   23: astore 5
    //   25: iconst_0
    //   26: istore 6
    //   28: aconst_null
    //   29: astore 7
    //   31: new 395	java/util/HashMap
    //   34: dup
    //   35: invokespecial 396	java/util/HashMap:<init>	()V
    //   38: astore 8
    //   40: aload_1
    //   41: aload_2
    //   42: invokestatic 400	net/lingala/zip4j/util/Zip4jUtil:getIndexOfFileHeader	(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;)I
    //   45: istore 16
    //   47: aconst_null
    //   48: astore 7
    //   50: iload 16
    //   52: ifge +66 -> 118
    //   55: new 12	net/lingala/zip4j/exception/ZipException
    //   58: dup
    //   59: ldc_w 402
    //   62: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   65: athrow
    //   66: astore 15
    //   68: aconst_null
    //   69: astore 10
    //   71: aload_3
    //   72: aload 15
    //   74: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   77: aload 15
    //   79: athrow
    //   80: astore 9
    //   82: aload 5
    //   84: ifnull +8 -> 92
    //   87: aload 5
    //   89: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   92: aload 10
    //   94: ifnull +8 -> 102
    //   97: aload 10
    //   99: invokevirtual 183	java/io/OutputStream:close	()V
    //   102: iload 6
    //   104: ifeq +996 -> 1100
    //   107: aload_0
    //   108: aload 4
    //   110: aload 7
    //   112: invokespecial 404	net/lingala/zip4j/util/ArchiveMaintainer:restoreFileName	(Ljava/io/File;Ljava/lang/String;)V
    //   115: aload 9
    //   117: athrow
    //   118: aload_1
    //   119: invokevirtual 24	net/lingala/zip4j/model/ZipModel:isSplitArchive	()Z
    //   122: istore 17
    //   124: aconst_null
    //   125: astore 7
    //   127: iload 17
    //   129: ifeq +35 -> 164
    //   132: new 12	net/lingala/zip4j/exception/ZipException
    //   135: dup
    //   136: ldc_w 406
    //   139: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   142: athrow
    //   143: astore 14
    //   145: aconst_null
    //   146: astore 10
    //   148: aload_3
    //   149: aload 14
    //   151: invokevirtual 173	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   154: new 12	net/lingala/zip4j/exception/ZipException
    //   157: dup
    //   158: aload 14
    //   160: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   163: athrow
    //   164: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   167: lstore 18
    //   169: new 51	java/lang/StringBuffer
    //   172: dup
    //   173: aload_1
    //   174: invokevirtual 38	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   177: invokestatic 67	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   180: invokespecial 68	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   183: lload 18
    //   185: ldc2_w 412
    //   188: lrem
    //   189: invokevirtual 416	java/lang/StringBuffer:append	(J)Ljava/lang/StringBuffer;
    //   192: invokevirtual 80	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   195: astore 7
    //   197: new 40	java/io/File
    //   200: dup
    //   201: aload 7
    //   203: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   206: astore 20
    //   208: aload 20
    //   210: invokevirtual 419	java/io/File:exists	()Z
    //   213: istore 21
    //   215: iload 21
    //   217: ifne +90 -> 307
    //   220: new 421	net/lingala/zip4j/io/SplitOutputStream
    //   223: dup
    //   224: new 40	java/io/File
    //   227: dup
    //   228: aload 7
    //   230: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   233: invokespecial 422	net/lingala/zip4j/io/SplitOutputStream:<init>	(Ljava/io/File;)V
    //   236: astore 10
    //   238: new 40	java/io/File
    //   241: dup
    //   242: aload_1
    //   243: invokevirtual 38	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   246: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   249: astore 24
    //   251: aload_0
    //   252: aload_1
    //   253: ldc -88
    //   255: invokespecial 424	net/lingala/zip4j/util/ArchiveMaintainer:createFileHandler	(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Ljava/io/RandomAccessFile;
    //   258: astore 5
    //   260: new 426	net/lingala/zip4j/core/HeaderReader
    //   263: dup
    //   264: aload 5
    //   266: invokespecial 429	net/lingala/zip4j/core/HeaderReader:<init>	(Ljava/io/RandomAccessFile;)V
    //   269: astore 25
    //   271: aload 25
    //   273: aload_2
    //   274: invokevirtual 433	net/lingala/zip4j/core/HeaderReader:readLocalFileHeader	(Lnet/lingala/zip4j/model/FileHeader;)Lnet/lingala/zip4j/model/LocalFileHeader;
    //   277: astore 26
    //   279: iconst_0
    //   280: istore 6
    //   282: aload 26
    //   284: ifnonnull +99 -> 383
    //   287: new 12	net/lingala/zip4j/exception/ZipException
    //   290: dup
    //   291: ldc_w 435
    //   294: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   297: athrow
    //   298: astore 15
    //   300: aload 24
    //   302: astore 4
    //   304: goto -233 -> 71
    //   307: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   310: lstore 22
    //   312: new 51	java/lang/StringBuffer
    //   315: dup
    //   316: aload_1
    //   317: invokevirtual 38	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   320: invokestatic 67	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   323: invokespecial 68	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   326: lload 22
    //   328: ldc2_w 412
    //   331: lrem
    //   332: invokevirtual 416	java/lang/StringBuffer:append	(J)Ljava/lang/StringBuffer;
    //   335: invokevirtual 80	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   338: astore 7
    //   340: new 40	java/io/File
    //   343: dup
    //   344: aload 7
    //   346: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   349: astore 20
    //   351: goto -143 -> 208
    //   354: astore 56
    //   356: new 12	net/lingala/zip4j/exception/ZipException
    //   359: dup
    //   360: aload 56
    //   362: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   365: athrow
    //   366: astore 9
    //   368: aconst_null
    //   369: astore 5
    //   371: aconst_null
    //   372: astore 10
    //   374: iconst_0
    //   375: istore 6
    //   377: aconst_null
    //   378: astore 4
    //   380: goto -298 -> 82
    //   383: aload_2
    //   384: invokevirtual 298	net/lingala/zip4j/model/FileHeader:getOffsetLocalHeader	()J
    //   387: lstore 27
    //   389: aload_2
    //   390: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   393: astore 29
    //   395: iconst_0
    //   396: istore 6
    //   398: aload 29
    //   400: ifnull +33 -> 433
    //   403: aload_2
    //   404: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   407: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   410: ldc2_w 443
    //   413: lcmp
    //   414: istore 30
    //   416: iconst_0
    //   417: istore 6
    //   419: iload 30
    //   421: ifeq +12 -> 433
    //   424: aload_2
    //   425: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   428: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   431: lstore 27
    //   433: ldc2_w 443
    //   436: lstore 31
    //   438: aload_1
    //   439: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   442: invokevirtual 242	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   445: lstore 33
    //   447: aload_1
    //   448: invokevirtual 361	net/lingala/zip4j/model/ZipModel:isZip64Format	()Z
    //   451: istore 35
    //   453: iconst_0
    //   454: istore 6
    //   456: iload 35
    //   458: ifeq +26 -> 484
    //   461: aload_1
    //   462: invokevirtual 333	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirRecord	()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;
    //   465: astore 36
    //   467: iconst_0
    //   468: istore 6
    //   470: aload 36
    //   472: ifnull +12 -> 484
    //   475: aload_1
    //   476: invokevirtual 333	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirRecord	()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;
    //   479: invokevirtual 345	net/lingala/zip4j/model/Zip64EndCentralDirRecord:getOffsetStartCenDirWRTStartDiskNo	()J
    //   482: lstore 33
    //   484: aload_1
    //   485: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   488: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   491: astore 37
    //   493: iload 16
    //   495: iconst_m1
    //   496: aload 37
    //   498: invokevirtual 231	java/util/ArrayList:size	()I
    //   501: iadd
    //   502: if_icmpne +23 -> 525
    //   505: lload 33
    //   507: lconst_1
    //   508: lsub
    //   509: lstore 31
    //   511: goto +670 -> 1181
    //   514: new 12	net/lingala/zip4j/exception/ZipException
    //   517: dup
    //   518: ldc_w 446
    //   521: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   524: athrow
    //   525: aload 37
    //   527: iload 16
    //   529: iconst_1
    //   530: iadd
    //   531: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   534: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   537: astore 53
    //   539: iconst_0
    //   540: istore 6
    //   542: aload 53
    //   544: ifnull +637 -> 1181
    //   547: aload 53
    //   549: invokevirtual 298	net/lingala/zip4j/model/FileHeader:getOffsetLocalHeader	()J
    //   552: lconst_1
    //   553: lsub
    //   554: lstore 31
    //   556: aload 53
    //   558: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   561: astore 54
    //   563: iconst_0
    //   564: istore 6
    //   566: aload 54
    //   568: ifnull +613 -> 1181
    //   571: aload 53
    //   573: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   576: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   579: ldc2_w 443
    //   582: lcmp
    //   583: istore 55
    //   585: iconst_0
    //   586: istore 6
    //   588: iload 55
    //   590: ifeq +591 -> 1181
    //   593: aload 53
    //   595: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   598: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   601: lconst_1
    //   602: lsub
    //   603: lstore 31
    //   605: goto +576 -> 1181
    //   608: iconst_0
    //   609: istore 6
    //   611: iload 16
    //   613: ifne +83 -> 696
    //   616: aload_1
    //   617: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   620: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   623: invokevirtual 231	java/util/ArrayList:size	()I
    //   626: iconst_1
    //   627: if_icmple +18 -> 645
    //   630: aload_0
    //   631: aload 5
    //   633: aload 10
    //   635: lconst_1
    //   636: lload 31
    //   638: ladd
    //   639: lload 33
    //   641: aload_3
    //   642: invokespecial 247	net/lingala/zip4j/util/ArchiveMaintainer:copyFile	(Ljava/io/RandomAccessFile;Ljava/io/OutputStream;JJLnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   645: aload_3
    //   646: invokevirtual 110	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   649: ifeq +137 -> 786
    //   652: aload_3
    //   653: iconst_3
    //   654: invokevirtual 114	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   657: aload_3
    //   658: iconst_0
    //   659: invokevirtual 117	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   662: aload 5
    //   664: ifnull +8 -> 672
    //   667: aload 5
    //   669: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   672: aload 10
    //   674: ifnull +8 -> 682
    //   677: aload 10
    //   679: invokevirtual 183	java/io/OutputStream:close	()V
    //   682: iconst_0
    //   683: ifeq +83 -> 766
    //   686: aload_0
    //   687: aload 24
    //   689: aload 7
    //   691: invokespecial 404	net/lingala/zip4j/util/ArchiveMaintainer:restoreFileName	(Ljava/io/File;Ljava/lang/String;)V
    //   694: aconst_null
    //   695: areturn
    //   696: iload 16
    //   698: iconst_m1
    //   699: aload 37
    //   701: invokevirtual 231	java/util/ArrayList:size	()I
    //   704: iadd
    //   705: if_icmpne +18 -> 723
    //   708: aload_0
    //   709: aload 5
    //   711: aload 10
    //   713: lconst_0
    //   714: lload 27
    //   716: aload_3
    //   717: invokespecial 247	net/lingala/zip4j/util/ArchiveMaintainer:copyFile	(Ljava/io/RandomAccessFile;Ljava/io/OutputStream;JJLnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   720: goto -75 -> 645
    //   723: aload_0
    //   724: aload 5
    //   726: aload 10
    //   728: lconst_0
    //   729: lload 27
    //   731: aload_3
    //   732: invokespecial 247	net/lingala/zip4j/util/ArchiveMaintainer:copyFile	(Ljava/io/RandomAccessFile;Ljava/io/OutputStream;JJLnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   735: aload_0
    //   736: aload 5
    //   738: aload 10
    //   740: lconst_1
    //   741: lload 31
    //   743: ladd
    //   744: lload 33
    //   746: aload_3
    //   747: invokespecial 247	net/lingala/zip4j/util/ArchiveMaintainer:copyFile	(Ljava/io/RandomAccessFile;Ljava/io/OutputStream;JJLnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   750: goto -105 -> 645
    //   753: astore 50
    //   755: new 12	net/lingala/zip4j/exception/ZipException
    //   758: dup
    //   759: ldc_w 448
    //   762: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   765: athrow
    //   766: new 40	java/io/File
    //   769: dup
    //   770: aload 7
    //   772: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   775: astore 51
    //   777: aload 51
    //   779: invokevirtual 262	java/io/File:delete	()Z
    //   782: pop
    //   783: goto -89 -> 694
    //   786: aload_1
    //   787: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   790: aload 10
    //   792: checkcast 421	net/lingala/zip4j/io/SplitOutputStream
    //   795: invokevirtual 451	net/lingala/zip4j/io/SplitOutputStream:getFilePointer	()J
    //   798: invokevirtual 195	net/lingala/zip4j/model/EndCentralDirRecord:setOffsetOfStartOfCentralDir	(J)V
    //   801: aload_1
    //   802: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   805: iconst_m1
    //   806: aload_1
    //   807: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   810: invokevirtual 340	net/lingala/zip4j/model/EndCentralDirRecord:getTotNoOfEntriesInCentralDir	()I
    //   813: iadd
    //   814: invokevirtual 284	net/lingala/zip4j/model/EndCentralDirRecord:setTotNoOfEntriesInCentralDir	(I)V
    //   817: aload_1
    //   818: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   821: iconst_m1
    //   822: aload_1
    //   823: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   826: invokevirtual 454	net/lingala/zip4j/model/EndCentralDirRecord:getTotNoOfEntriesInCentralDirOnThisDisk	()I
    //   829: iadd
    //   830: invokevirtual 287	net/lingala/zip4j/model/EndCentralDirRecord:setTotNoOfEntriesInCentralDirOnThisDisk	(I)V
    //   833: aload_1
    //   834: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   837: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   840: iload 16
    //   842: invokevirtual 457	java/util/ArrayList:remove	(I)Ljava/lang/Object;
    //   845: pop
    //   846: iload 16
    //   848: istore 39
    //   850: aload_1
    //   851: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   854: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   857: invokevirtual 231	java/util/ArrayList:size	()I
    //   860: istore 40
    //   862: iload 39
    //   864: istore 41
    //   866: iconst_0
    //   867: istore 6
    //   869: iload 41
    //   871: iload 40
    //   873: if_icmplt +74 -> 947
    //   876: new 201	net/lingala/zip4j/core/HeaderWriter
    //   879: dup
    //   880: invokespecial 202	net/lingala/zip4j/core/HeaderWriter:<init>	()V
    //   883: aload_1
    //   884: aload 10
    //   886: invokevirtual 460	net/lingala/zip4j/core/HeaderWriter:finalizeZipFile	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    //   889: iconst_1
    //   890: istore 6
    //   892: aload 8
    //   894: ldc_w 462
    //   897: aload_1
    //   898: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   901: invokevirtual 242	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   904: invokestatic 465	java/lang/Long:toString	(J)Ljava/lang/String;
    //   907: invokevirtual 469	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   910: pop
    //   911: aload 5
    //   913: ifnull +8 -> 921
    //   916: aload 5
    //   918: invokevirtual 184	java/io/RandomAccessFile:close	()V
    //   921: aload 10
    //   923: ifnull +8 -> 931
    //   926: aload 10
    //   928: invokevirtual 183	java/io/OutputStream:close	()V
    //   931: iload 6
    //   933: ifeq +200 -> 1133
    //   936: aload_0
    //   937: aload 24
    //   939: aload 7
    //   941: invokespecial 404	net/lingala/zip4j/util/ArchiveMaintainer:restoreFileName	(Ljava/io/File;Ljava/lang/String;)V
    //   944: aload 8
    //   946: areturn
    //   947: aload_1
    //   948: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   951: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   954: iload 39
    //   956: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   959: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   962: invokevirtual 298	net/lingala/zip4j/model/FileHeader:getOffsetLocalHeader	()J
    //   965: lstore 46
    //   967: aload_1
    //   968: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   971: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   974: iload 39
    //   976: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   979: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   982: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   985: astore 48
    //   987: iconst_0
    //   988: istore 6
    //   990: aload 48
    //   992: ifnull +61 -> 1053
    //   995: aload_1
    //   996: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   999: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   1002: iload 39
    //   1004: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   1007: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   1010: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   1013: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   1016: ldc2_w 443
    //   1019: lcmp
    //   1020: istore 49
    //   1022: iconst_0
    //   1023: istore 6
    //   1025: iload 49
    //   1027: ifeq +26 -> 1053
    //   1030: aload_1
    //   1031: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   1034: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   1037: iload 39
    //   1039: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   1042: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   1045: invokevirtual 439	net/lingala/zip4j/model/FileHeader:getZip64ExtendedInfo	()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    //   1048: invokevirtual 442	net/lingala/zip4j/model/Zip64ExtendedInfo:getOffsetLocalHeader	()J
    //   1051: lstore 46
    //   1053: aload_1
    //   1054: invokevirtual 222	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   1057: invokevirtual 228	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   1060: iload 39
    //   1062: invokevirtual 292	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   1065: checkcast 86	net/lingala/zip4j/model/FileHeader
    //   1068: lload 46
    //   1070: lload 31
    //   1072: lload 27
    //   1074: lsub
    //   1075: lsub
    //   1076: lconst_1
    //   1077: lsub
    //   1078: invokevirtual 301	net/lingala/zip4j/model/FileHeader:setOffsetLocalHeader	(J)V
    //   1081: iinc 39 1
    //   1084: goto -234 -> 850
    //   1087: astore 11
    //   1089: new 12	net/lingala/zip4j/exception/ZipException
    //   1092: dup
    //   1093: ldc_w 448
    //   1096: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   1099: athrow
    //   1100: new 40	java/io/File
    //   1103: dup
    //   1104: aload 7
    //   1106: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   1109: astore 12
    //   1111: aload 12
    //   1113: invokevirtual 262	java/io/File:delete	()Z
    //   1116: pop
    //   1117: goto -1002 -> 115
    //   1120: astore 43
    //   1122: new 12	net/lingala/zip4j/exception/ZipException
    //   1125: dup
    //   1126: ldc_w 448
    //   1129: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   1132: athrow
    //   1133: new 40	java/io/File
    //   1136: dup
    //   1137: aload 7
    //   1139: invokespecial 43	java/io/File:<init>	(Ljava/lang/String;)V
    //   1142: astore 44
    //   1144: aload 44
    //   1146: invokevirtual 262	java/io/File:delete	()Z
    //   1149: pop
    //   1150: aload 8
    //   1152: areturn
    //   1153: astore 14
    //   1155: aconst_null
    //   1156: astore 5
    //   1158: iconst_0
    //   1159: istore 6
    //   1161: aconst_null
    //   1162: astore 4
    //   1164: goto -1016 -> 148
    //   1167: astore 15
    //   1169: aconst_null
    //   1170: astore 5
    //   1172: iconst_0
    //   1173: istore 6
    //   1175: aconst_null
    //   1176: astore 4
    //   1178: goto -1107 -> 71
    //   1181: lload 27
    //   1183: lconst_0
    //   1184: lcmp
    //   1185: iflt -671 -> 514
    //   1188: lload 31
    //   1190: lconst_0
    //   1191: lcmp
    //   1192: ifge -584 -> 608
    //   1195: goto -681 -> 514
    //   1198: astore 14
    //   1200: aload 24
    //   1202: astore 4
    //   1204: goto -1056 -> 148
    //   1207: astore 9
    //   1209: aload 24
    //   1211: astore 4
    //   1213: goto -1131 -> 82
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1216	0	this	ArchiveMaintainer
    //   0	1216	1	paramZipModel	ZipModel
    //   0	1216	2	paramFileHeader	FileHeader
    //   0	1216	3	paramProgressMonitor	ProgressMonitor
    //   20	1192	4	localObject1	Object
    //   23	1148	5	localRandomAccessFile	RandomAccessFile
    //   26	1148	6	i	int
    //   29	1109	7	str	String
    //   38	1113	8	localHashMap	HashMap
    //   80	36	9	localObject2	Object
    //   366	1	9	localObject3	Object
    //   1207	1	9	localObject4	Object
    //   69	858	10	localSplitOutputStream	net.lingala.zip4j.io.SplitOutputStream
    //   1087	1	11	localIOException1	IOException
    //   1109	3	12	localFile1	File
    //   143	16	14	localException1	Exception
    //   1153	1	14	localException2	Exception
    //   1198	1	14	localException3	Exception
    //   66	12	15	localZipException1	ZipException
    //   298	1	15	localZipException2	ZipException
    //   1167	1	15	localZipException3	ZipException
    //   45	802	16	j	int
    //   122	6	17	bool1	boolean
    //   167	17	18	l1	long
    //   206	144	20	localFile2	File
    //   213	3	21	bool2	boolean
    //   310	17	22	l2	long
    //   249	961	24	localFile3	File
    //   269	3	25	localHeaderReader	net.lingala.zip4j.core.HeaderReader
    //   277	6	26	localLocalFileHeader	net.lingala.zip4j.model.LocalFileHeader
    //   387	795	27	l3	long
    //   393	6	29	localZip64ExtendedInfo1	net.lingala.zip4j.model.Zip64ExtendedInfo
    //   414	6	30	bool3	boolean
    //   436	753	31	l4	long
    //   445	300	33	l5	long
    //   451	6	35	bool4	boolean
    //   465	6	36	localZip64EndCentralDirRecord	Zip64EndCentralDirRecord
    //   491	209	37	localArrayList	ArrayList
    //   848	234	39	k	int
    //   860	14	40	m	int
    //   864	10	41	n	int
    //   1120	1	43	localIOException2	IOException
    //   1142	3	44	localFile4	File
    //   965	104	46	l6	long
    //   985	6	48	localZip64ExtendedInfo2	net.lingala.zip4j.model.Zip64ExtendedInfo
    //   1020	6	49	bool5	boolean
    //   753	1	50	localIOException3	IOException
    //   775	3	51	localFile5	File
    //   537	57	53	localFileHeader	FileHeader
    //   561	6	54	localZip64ExtendedInfo3	net.lingala.zip4j.model.Zip64ExtendedInfo
    //   583	6	55	bool6	boolean
    //   354	7	56	localFileNotFoundException	FileNotFoundException
    // Exception table:
    //   from	to	target	type
    //   40	47	66	net/lingala/zip4j/exception/ZipException
    //   55	66	66	net/lingala/zip4j/exception/ZipException
    //   118	124	66	net/lingala/zip4j/exception/ZipException
    //   132	143	66	net/lingala/zip4j/exception/ZipException
    //   164	208	66	net/lingala/zip4j/exception/ZipException
    //   208	215	66	net/lingala/zip4j/exception/ZipException
    //   220	238	66	net/lingala/zip4j/exception/ZipException
    //   307	351	66	net/lingala/zip4j/exception/ZipException
    //   356	366	66	net/lingala/zip4j/exception/ZipException
    //   71	80	80	finally
    //   148	164	80	finally
    //   238	251	80	finally
    //   40	47	143	java/lang/Exception
    //   55	66	143	java/lang/Exception
    //   118	124	143	java/lang/Exception
    //   132	143	143	java/lang/Exception
    //   164	208	143	java/lang/Exception
    //   208	215	143	java/lang/Exception
    //   220	238	143	java/lang/Exception
    //   307	351	143	java/lang/Exception
    //   356	366	143	java/lang/Exception
    //   251	279	298	net/lingala/zip4j/exception/ZipException
    //   287	298	298	net/lingala/zip4j/exception/ZipException
    //   383	395	298	net/lingala/zip4j/exception/ZipException
    //   403	416	298	net/lingala/zip4j/exception/ZipException
    //   424	433	298	net/lingala/zip4j/exception/ZipException
    //   438	453	298	net/lingala/zip4j/exception/ZipException
    //   461	467	298	net/lingala/zip4j/exception/ZipException
    //   475	484	298	net/lingala/zip4j/exception/ZipException
    //   484	505	298	net/lingala/zip4j/exception/ZipException
    //   514	525	298	net/lingala/zip4j/exception/ZipException
    //   525	539	298	net/lingala/zip4j/exception/ZipException
    //   547	563	298	net/lingala/zip4j/exception/ZipException
    //   571	585	298	net/lingala/zip4j/exception/ZipException
    //   593	605	298	net/lingala/zip4j/exception/ZipException
    //   616	645	298	net/lingala/zip4j/exception/ZipException
    //   645	662	298	net/lingala/zip4j/exception/ZipException
    //   696	720	298	net/lingala/zip4j/exception/ZipException
    //   723	750	298	net/lingala/zip4j/exception/ZipException
    //   786	846	298	net/lingala/zip4j/exception/ZipException
    //   850	862	298	net/lingala/zip4j/exception/ZipException
    //   876	889	298	net/lingala/zip4j/exception/ZipException
    //   892	911	298	net/lingala/zip4j/exception/ZipException
    //   947	987	298	net/lingala/zip4j/exception/ZipException
    //   995	1022	298	net/lingala/zip4j/exception/ZipException
    //   1030	1053	298	net/lingala/zip4j/exception/ZipException
    //   1053	1081	298	net/lingala/zip4j/exception/ZipException
    //   220	238	354	java/io/FileNotFoundException
    //   40	47	366	finally
    //   55	66	366	finally
    //   118	124	366	finally
    //   132	143	366	finally
    //   164	208	366	finally
    //   208	215	366	finally
    //   220	238	366	finally
    //   307	351	366	finally
    //   356	366	366	finally
    //   667	672	753	java/io/IOException
    //   677	682	753	java/io/IOException
    //   87	92	1087	java/io/IOException
    //   97	102	1087	java/io/IOException
    //   916	921	1120	java/io/IOException
    //   926	931	1120	java/io/IOException
    //   238	251	1153	java/lang/Exception
    //   238	251	1167	net/lingala/zip4j/exception/ZipException
    //   251	279	1198	java/lang/Exception
    //   287	298	1198	java/lang/Exception
    //   383	395	1198	java/lang/Exception
    //   403	416	1198	java/lang/Exception
    //   424	433	1198	java/lang/Exception
    //   438	453	1198	java/lang/Exception
    //   461	467	1198	java/lang/Exception
    //   475	484	1198	java/lang/Exception
    //   484	505	1198	java/lang/Exception
    //   514	525	1198	java/lang/Exception
    //   525	539	1198	java/lang/Exception
    //   547	563	1198	java/lang/Exception
    //   571	585	1198	java/lang/Exception
    //   593	605	1198	java/lang/Exception
    //   616	645	1198	java/lang/Exception
    //   645	662	1198	java/lang/Exception
    //   696	720	1198	java/lang/Exception
    //   723	750	1198	java/lang/Exception
    //   786	846	1198	java/lang/Exception
    //   850	862	1198	java/lang/Exception
    //   876	889	1198	java/lang/Exception
    //   892	911	1198	java/lang/Exception
    //   947	987	1198	java/lang/Exception
    //   995	1022	1198	java/lang/Exception
    //   1030	1053	1198	java/lang/Exception
    //   1053	1081	1198	java/lang/Exception
    //   251	279	1207	finally
    //   287	298	1207	finally
    //   383	395	1207	finally
    //   403	416	1207	finally
    //   424	433	1207	finally
    //   438	453	1207	finally
    //   461	467	1207	finally
    //   475	484	1207	finally
    //   484	505	1207	finally
    //   514	525	1207	finally
    //   525	539	1207	finally
    //   547	563	1207	finally
    //   571	585	1207	finally
    //   593	605	1207	finally
    //   616	645	1207	finally
    //   645	662	1207	finally
    //   696	720	1207	finally
    //   723	750	1207	finally
    //   786	846	1207	finally
    //   850	862	1207	finally
    //   876	889	1207	finally
    //   892	911	1207	finally
    //   947	987	1207	finally
    //   995	1022	1207	finally
    //   1030	1053	1207	finally
    //   1053	1081	1207	finally
  }
  
  public void mergeSplitZipFiles(ZipModel paramZipModel, File paramFile, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if (paramBoolean)
    {
      new ArchiveMaintainer.2(this, "Zip4j", paramZipModel, paramFile, paramProgressMonitor).start();
      return;
    }
    initMergeSplitZipFile(paramZipModel, paramFile, paramProgressMonitor);
  }
  
  public HashMap removeZipFile(ZipModel paramZipModel, FileHeader paramFileHeader, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if (paramBoolean)
    {
      new ArchiveMaintainer.1(this, "Zip4j", paramZipModel, paramFileHeader, paramProgressMonitor).start();
      return null;
    }
    HashMap localHashMap = initRemoveZipFile(paramZipModel, paramFileHeader, paramProgressMonitor);
    paramProgressMonitor.endProgressMonitorSuccess();
    return localHashMap;
  }
  
  /* Error */
  public void setComment(ZipModel paramZipModel, String paramString)
    throws ZipException
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnonnull +14 -> 15
    //   4: new 12	net/lingala/zip4j/exception/ZipException
    //   7: dup
    //   8: ldc_w 498
    //   11: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   14: athrow
    //   15: aload_1
    //   16: ifnonnull +14 -> 30
    //   19: new 12	net/lingala/zip4j/exception/ZipException
    //   22: dup
    //   23: ldc_w 500
    //   26: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   29: athrow
    //   30: aload_2
    //   31: astore_3
    //   32: aload_2
    //   33: invokevirtual 504	java/lang/String:getBytes	()[B
    //   36: astore 4
    //   38: aload_2
    //   39: invokevirtual 506	java/lang/String:length	()I
    //   42: istore 5
    //   44: ldc_w 508
    //   47: invokestatic 511	net/lingala/zip4j/util/Zip4jUtil:isSupportedCharset	(Ljava/lang/String;)Z
    //   50: ifeq +46 -> 96
    //   53: new 55	java/lang/String
    //   56: dup
    //   57: aload_2
    //   58: ldc_w 508
    //   61: invokevirtual 514	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   64: ldc_w 508
    //   67: invokespecial 517	java/lang/String:<init>	([BLjava/lang/String;)V
    //   70: astore 14
    //   72: aload 14
    //   74: ldc_w 508
    //   77: invokevirtual 514	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   80: astore 4
    //   82: aload 14
    //   84: invokevirtual 506	java/lang/String:length	()I
    //   87: istore 16
    //   89: iload 16
    //   91: istore 5
    //   93: aload 14
    //   95: astore_3
    //   96: iload 5
    //   98: ldc_w 518
    //   101: if_icmple +33 -> 134
    //   104: new 12	net/lingala/zip4j/exception/ZipException
    //   107: dup
    //   108: ldc_w 520
    //   111: invokespecial 99	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   114: athrow
    //   115: astore 17
    //   117: aload_2
    //   118: astore_3
    //   119: aload_2
    //   120: invokevirtual 504	java/lang/String:getBytes	()[B
    //   123: astore 4
    //   125: aload_2
    //   126: invokevirtual 506	java/lang/String:length	()I
    //   129: istore 5
    //   131: goto -35 -> 96
    //   134: aload_1
    //   135: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   138: aload_3
    //   139: invokevirtual 522	net/lingala/zip4j/model/EndCentralDirRecord:setComment	(Ljava/lang/String;)V
    //   142: aload_1
    //   143: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   146: aload 4
    //   148: invokevirtual 526	net/lingala/zip4j/model/EndCentralDirRecord:setCommentBytes	([B)V
    //   151: aload_1
    //   152: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   155: iload 5
    //   157: invokevirtual 529	net/lingala/zip4j/model/EndCentralDirRecord:setCommentLength	(I)V
    //   160: aconst_null
    //   161: astore 6
    //   163: new 201	net/lingala/zip4j/core/HeaderWriter
    //   166: dup
    //   167: invokespecial 202	net/lingala/zip4j/core/HeaderWriter:<init>	()V
    //   170: astore 7
    //   172: new 421	net/lingala/zip4j/io/SplitOutputStream
    //   175: dup
    //   176: aload_1
    //   177: invokevirtual 38	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   180: invokespecial 530	net/lingala/zip4j/io/SplitOutputStream:<init>	(Ljava/lang/String;)V
    //   183: astore 8
    //   185: aload_1
    //   186: invokevirtual 361	net/lingala/zip4j/model/ZipModel:isZip64Format	()Z
    //   189: ifeq +34 -> 223
    //   192: aload 8
    //   194: aload_1
    //   195: invokevirtual 333	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirRecord	()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;
    //   198: invokevirtual 345	net/lingala/zip4j/model/Zip64EndCentralDirRecord:getOffsetStartCenDirWRTStartDiskNo	()J
    //   201: invokevirtual 531	net/lingala/zip4j/io/SplitOutputStream:seek	(J)V
    //   204: aload 7
    //   206: aload_1
    //   207: aload 8
    //   209: invokevirtual 206	net/lingala/zip4j/core/HeaderWriter:finalizeZipFileWithoutValidations	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    //   212: aload 8
    //   214: ifnull +8 -> 222
    //   217: aload 8
    //   219: invokevirtual 532	net/lingala/zip4j/io/SplitOutputStream:close	()V
    //   222: return
    //   223: aload 8
    //   225: aload_1
    //   226: invokevirtual 28	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   229: invokevirtual 242	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   232: invokevirtual 531	net/lingala/zip4j/io/SplitOutputStream:seek	(J)V
    //   235: goto -31 -> 204
    //   238: astore 12
    //   240: aload 8
    //   242: astore 6
    //   244: new 12	net/lingala/zip4j/exception/ZipException
    //   247: dup
    //   248: aload 12
    //   250: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   253: athrow
    //   254: astore 10
    //   256: aload 6
    //   258: ifnull +8 -> 266
    //   261: aload 6
    //   263: invokevirtual 532	net/lingala/zip4j/io/SplitOutputStream:close	()V
    //   266: aload 10
    //   268: athrow
    //   269: astore 9
    //   271: new 12	net/lingala/zip4j/exception/ZipException
    //   274: dup
    //   275: aload 9
    //   277: invokespecial 141	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   280: athrow
    //   281: astore 11
    //   283: goto -17 -> 266
    //   286: astore 13
    //   288: return
    //   289: astore 10
    //   291: aload 8
    //   293: astore 6
    //   295: goto -39 -> 256
    //   298: astore 9
    //   300: aload 8
    //   302: astore 6
    //   304: goto -33 -> 271
    //   307: astore 12
    //   309: aconst_null
    //   310: astore 6
    //   312: goto -68 -> 244
    //   315: astore 15
    //   317: goto -200 -> 117
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	320	0	this	ArchiveMaintainer
    //   0	320	1	paramZipModel	ZipModel
    //   0	320	2	paramString	String
    //   31	108	3	localObject1	Object
    //   36	111	4	arrayOfByte	byte[]
    //   42	114	5	i	int
    //   161	150	6	localObject2	Object
    //   170	35	7	localHeaderWriter	net.lingala.zip4j.core.HeaderWriter
    //   183	118	8	localSplitOutputStream	net.lingala.zip4j.io.SplitOutputStream
    //   269	7	9	localIOException1	IOException
    //   298	1	9	localIOException2	IOException
    //   254	13	10	localObject3	Object
    //   289	1	10	localObject4	Object
    //   281	1	11	localIOException3	IOException
    //   238	11	12	localFileNotFoundException1	FileNotFoundException
    //   307	1	12	localFileNotFoundException2	FileNotFoundException
    //   286	1	13	localIOException4	IOException
    //   70	24	14	str	String
    //   315	1	15	localUnsupportedEncodingException1	java.io.UnsupportedEncodingException
    //   87	3	16	j	int
    //   115	1	17	localUnsupportedEncodingException2	java.io.UnsupportedEncodingException
    // Exception table:
    //   from	to	target	type
    //   53	72	115	java/io/UnsupportedEncodingException
    //   185	204	238	java/io/FileNotFoundException
    //   204	212	238	java/io/FileNotFoundException
    //   223	235	238	java/io/FileNotFoundException
    //   163	185	254	finally
    //   244	254	254	finally
    //   271	281	254	finally
    //   163	185	269	java/io/IOException
    //   261	266	281	java/io/IOException
    //   217	222	286	java/io/IOException
    //   185	204	289	finally
    //   204	212	289	finally
    //   223	235	289	finally
    //   185	204	298	java/io/IOException
    //   204	212	298	java/io/IOException
    //   223	235	298	java/io/IOException
    //   163	185	307	java/io/FileNotFoundException
    //   72	89	315	java/io/UnsupportedEncodingException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/ArchiveMaintainer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */