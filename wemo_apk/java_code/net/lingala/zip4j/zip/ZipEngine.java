package net.lingala.zip4j.zip;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.progress.ProgressMonitor;
import net.lingala.zip4j.util.Zip4jUtil;

public class ZipEngine
{
  private ZipModel zipModel;
  
  public ZipEngine(ZipModel paramZipModel)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null in ZipEngine constructor");
    }
    this.zipModel = paramZipModel;
  }
  
  private long calculateTotalWork(ArrayList paramArrayList, ZipParameters paramZipParameters)
    throws ZipException
  {
    if (paramArrayList == null) {
      throw new ZipException("file list is null, cannot calculate total work");
    }
    long l = 0L;
    int i = 0;
    if (i >= paramArrayList.size()) {
      return l;
    }
    if (((paramArrayList.get(i) instanceof File)) && (((File)paramArrayList.get(i)).exists())) {
      if ((!paramZipParameters.isEncryptFiles()) || (paramZipParameters.getEncryptionMethod() != 0)) {
        break label202;
      }
    }
    label202:
    for (l += 2L * Zip4jUtil.getFileLengh((File)paramArrayList.get(i));; l += Zip4jUtil.getFileLengh((File)paramArrayList.get(i)))
    {
      if ((this.zipModel.getCentralDirectory() != null) && (this.zipModel.getCentralDirectory().getFileHeaders() != null) && (this.zipModel.getCentralDirectory().getFileHeaders().size() > 0))
      {
        String str = Zip4jUtil.getRelativeFileName(((File)paramArrayList.get(i)).getAbsolutePath(), paramZipParameters.getRootFolderInZip(), paramZipParameters.getDefaultFolderPath());
        FileHeader localFileHeader = Zip4jUtil.getFileHeader(this.zipModel, str);
        if (localFileHeader != null) {
          l += Zip4jUtil.getFileLengh(new File(this.zipModel.getZipFile())) - localFileHeader.getCompressedSize();
        }
      }
      i++;
      break;
    }
  }
  
  private void checkParameters(ZipParameters paramZipParameters)
    throws ZipException
  {
    if (paramZipParameters == null) {
      throw new ZipException("cannot validate zip parameters");
    }
    if ((paramZipParameters.getCompressionMethod() != 0) && (paramZipParameters.getCompressionMethod() != 8)) {
      throw new ZipException("unsupported compression type");
    }
    if ((paramZipParameters.getCompressionMethod() == 8) && (paramZipParameters.getCompressionLevel() < 0) && (paramZipParameters.getCompressionLevel() > 9)) {
      throw new ZipException("invalid compression level. compression level dor deflate should be in the range of 0-9");
    }
    if (paramZipParameters.isEncryptFiles())
    {
      if ((paramZipParameters.getEncryptionMethod() != 0) && (paramZipParameters.getEncryptionMethod() != 99)) {
        throw new ZipException("unsupported encryption method");
      }
      if ((paramZipParameters.getPassword() == null) || (paramZipParameters.getPassword().length <= 0)) {
        throw new ZipException("input password is empty or null");
      }
    }
    else
    {
      paramZipParameters.setAesKeyStrength(-1);
      paramZipParameters.setEncryptionMethod(-1);
    }
  }
  
  private EndCentralDirRecord createEndOfCentralDirectoryRecord()
  {
    EndCentralDirRecord localEndCentralDirRecord = new EndCentralDirRecord();
    localEndCentralDirRecord.setSignature(101010256L);
    localEndCentralDirRecord.setNoOfThisDisk(0);
    localEndCentralDirRecord.setTotNoOfEntriesInCentralDir(0);
    localEndCentralDirRecord.setTotNoOfEntriesInCentralDirOnThisDisk(0);
    localEndCentralDirRecord.setOffsetOfStartOfCentralDir(0L);
    return localEndCentralDirRecord;
  }
  
  /* Error */
  private void initAddFiles(ArrayList paramArrayList, ZipParameters paramZipParameters, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +7 -> 8
    //   4: aload_2
    //   5: ifnonnull +13 -> 18
    //   8: new 10	net/lingala/zip4j/exception/ZipException
    //   11: dup
    //   12: ldc -96
    //   14: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   17: athrow
    //   18: aload_1
    //   19: invokevirtual 36	java/util/ArrayList:size	()I
    //   22: ifgt +13 -> 35
    //   25: new 10	net/lingala/zip4j/exception/ZipException
    //   28: dup
    //   29: ldc -94
    //   31: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   34: athrow
    //   35: aload_0
    //   36: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   39: invokevirtual 165	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   42: ifnonnull +14 -> 56
    //   45: aload_0
    //   46: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   49: aload_0
    //   50: invokespecial 167	net/lingala/zip4j/zip/ZipEngine:createEndOfCentralDirectoryRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   53: invokevirtual 171	net/lingala/zip4j/model/ZipModel:setEndCentralDirRecord	(Lnet/lingala/zip4j/model/EndCentralDirRecord;)V
    //   56: aconst_null
    //   57: astore 4
    //   59: aconst_null
    //   60: astore 5
    //   62: aload_0
    //   63: aload_2
    //   64: invokespecial 173	net/lingala/zip4j/zip/ZipEngine:checkParameters	(Lnet/lingala/zip4j/model/ZipParameters;)V
    //   67: aload_0
    //   68: aload_1
    //   69: aload_2
    //   70: aload_3
    //   71: invokespecial 176	net/lingala/zip4j/zip/ZipEngine:removeFilesIfExists	(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    //   74: aload_0
    //   75: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   78: invokevirtual 95	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   81: invokestatic 180	net/lingala/zip4j/util/Zip4jUtil:checkFileExists	(Ljava/lang/String;)Z
    //   84: istore 11
    //   86: new 182	net/lingala/zip4j/io/SplitOutputStream
    //   89: dup
    //   90: new 42	java/io/File
    //   93: dup
    //   94: aload_0
    //   95: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   98: invokevirtual 95	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   101: invokespecial 96	java/io/File:<init>	(Ljava/lang/String;)V
    //   104: aload_0
    //   105: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   108: invokevirtual 185	net/lingala/zip4j/model/ZipModel:getSplitLength	()J
    //   111: invokespecial 188	net/lingala/zip4j/io/SplitOutputStream:<init>	(Ljava/io/File;J)V
    //   114: astore 12
    //   116: new 190	net/lingala/zip4j/io/ZipOutputStream
    //   119: dup
    //   120: aload 12
    //   122: aload_0
    //   123: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   126: invokespecial 193	net/lingala/zip4j/io/ZipOutputStream:<init>	(Ljava/io/OutputStream;Lnet/lingala/zip4j/model/ZipModel;)V
    //   129: astore 13
    //   131: iload 11
    //   133: ifeq +85 -> 218
    //   136: aload_0
    //   137: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   140: invokevirtual 165	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   143: astore 30
    //   145: aconst_null
    //   146: astore 5
    //   148: aload 30
    //   150: ifnonnull +53 -> 203
    //   153: new 10	net/lingala/zip4j/exception/ZipException
    //   156: dup
    //   157: ldc -61
    //   159: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   162: athrow
    //   163: astore 6
    //   165: aload 13
    //   167: astore 4
    //   169: aload_3
    //   170: aload 6
    //   172: invokevirtual 201	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   175: aload 6
    //   177: athrow
    //   178: astore 7
    //   180: aload 5
    //   182: ifnull +8 -> 190
    //   185: aload 5
    //   187: invokevirtual 206	java/io/InputStream:close	()V
    //   190: aload 4
    //   192: ifnull +8 -> 200
    //   195: aload 4
    //   197: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   200: aload 7
    //   202: athrow
    //   203: aload 12
    //   205: aload_0
    //   206: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   209: invokevirtual 165	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   212: invokevirtual 210	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   215: invokevirtual 213	net/lingala/zip4j/io/SplitOutputStream:seek	(J)V
    //   218: sipush 4096
    //   221: newarray <illegal type>
    //   223: astore 14
    //   225: iconst_0
    //   226: istore 15
    //   228: aconst_null
    //   229: astore 16
    //   231: iload 15
    //   233: aload_1
    //   234: invokevirtual 36	java/util/ArrayList:size	()I
    //   237: if_icmplt +36 -> 273
    //   240: aload 13
    //   242: invokevirtual 216	net/lingala/zip4j/io/ZipOutputStream:finish	()V
    //   245: aload_3
    //   246: invokevirtual 219	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorSuccess	()V
    //   249: aload 16
    //   251: ifnull +8 -> 259
    //   254: aload 16
    //   256: invokevirtual 206	java/io/InputStream:close	()V
    //   259: aload 13
    //   261: ifnull +8 -> 269
    //   264: aload 13
    //   266: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   269: aload 16
    //   271: pop
    //   272: return
    //   273: aload_3
    //   274: invokevirtual 222	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   277: ifeq +37 -> 314
    //   280: aload_3
    //   281: iconst_3
    //   282: invokevirtual 225	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   285: aload_3
    //   286: iconst_0
    //   287: invokevirtual 228	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   290: aload 16
    //   292: ifnull +8 -> 300
    //   295: aload 16
    //   297: invokevirtual 206	java/io/InputStream:close	()V
    //   300: aload 13
    //   302: ifnull +8 -> 310
    //   305: aload 13
    //   307: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   310: aload 16
    //   312: pop
    //   313: return
    //   314: aload_2
    //   315: invokevirtual 232	net/lingala/zip4j/model/ZipParameters:clone	()Ljava/lang/Object;
    //   318: checkcast 48	net/lingala/zip4j/model/ZipParameters
    //   321: astore 17
    //   323: aload_3
    //   324: aload_1
    //   325: iload 15
    //   327: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   330: checkcast 42	java/io/File
    //   333: invokevirtual 78	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   336: invokevirtual 235	net/lingala/zip4j/progress/ProgressMonitor:setFileName	(Ljava/lang/String;)V
    //   339: aload_1
    //   340: iload 15
    //   342: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   345: checkcast 42	java/io/File
    //   348: invokevirtual 238	java/io/File:isDirectory	()Z
    //   351: ifne +115 -> 466
    //   354: aload 17
    //   356: invokevirtual 51	net/lingala/zip4j/model/ZipParameters:isEncryptFiles	()Z
    //   359: ifeq +84 -> 443
    //   362: aload 17
    //   364: invokevirtual 54	net/lingala/zip4j/model/ZipParameters:getEncryptionMethod	()I
    //   367: ifne +76 -> 443
    //   370: aload_3
    //   371: iconst_3
    //   372: invokevirtual 241	net/lingala/zip4j/progress/ProgressMonitor:setCurrentOperation	(I)V
    //   375: aload 17
    //   377: aload_1
    //   378: iload 15
    //   380: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   383: checkcast 42	java/io/File
    //   386: invokevirtual 78	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   389: aload_3
    //   390: invokestatic 247	net/lingala/zip4j/util/CRCUtil:computeFileCRC	(Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;)J
    //   393: l2i
    //   394: invokevirtual 250	net/lingala/zip4j/model/ZipParameters:setSourceFileCRC	(I)V
    //   397: aload_3
    //   398: iconst_0
    //   399: invokevirtual 241	net/lingala/zip4j/progress/ProgressMonitor:setCurrentOperation	(I)V
    //   402: aload_3
    //   403: invokevirtual 222	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   406: ifeq +37 -> 443
    //   409: aload_3
    //   410: iconst_3
    //   411: invokevirtual 225	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   414: aload_3
    //   415: iconst_0
    //   416: invokevirtual 228	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   419: aload 16
    //   421: ifnull +8 -> 429
    //   424: aload 16
    //   426: invokevirtual 206	java/io/InputStream:close	()V
    //   429: aload 13
    //   431: ifnull +8 -> 439
    //   434: aload 13
    //   436: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   439: aload 16
    //   441: pop
    //   442: return
    //   443: aload_1
    //   444: iload 15
    //   446: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   449: checkcast 42	java/io/File
    //   452: invokestatic 62	net/lingala/zip4j/util/Zip4jUtil:getFileLengh	(Ljava/io/File;)J
    //   455: lconst_0
    //   456: lcmp
    //   457: ifne +9 -> 466
    //   460: aload 17
    //   462: iconst_0
    //   463: invokevirtual 253	net/lingala/zip4j/model/ZipParameters:setCompressionMethod	(I)V
    //   466: aload 13
    //   468: aload_1
    //   469: iload 15
    //   471: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   474: checkcast 42	java/io/File
    //   477: aload 17
    //   479: invokevirtual 257	net/lingala/zip4j/io/ZipOutputStream:putNextEntry	(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    //   482: aload_1
    //   483: iload 15
    //   485: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   488: checkcast 42	java/io/File
    //   491: invokevirtual 238	java/io/File:isDirectory	()Z
    //   494: ifeq +15 -> 509
    //   497: aload 13
    //   499: invokevirtual 260	net/lingala/zip4j/io/ZipOutputStream:closeEntry	()V
    //   502: aload 16
    //   504: astore 5
    //   506: goto +252 -> 758
    //   509: new 262	java/io/FileInputStream
    //   512: dup
    //   513: aload_1
    //   514: iload 15
    //   516: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   519: checkcast 42	java/io/File
    //   522: invokespecial 265	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   525: astore 5
    //   527: aload 5
    //   529: aload 14
    //   531: invokevirtual 269	java/io/InputStream:read	([B)I
    //   534: istore 18
    //   536: iload 18
    //   538: iconst_m1
    //   539: if_icmpne +43 -> 582
    //   542: aload 13
    //   544: invokevirtual 260	net/lingala/zip4j/io/ZipOutputStream:closeEntry	()V
    //   547: aload 5
    //   549: ifnull +209 -> 758
    //   552: aload 5
    //   554: invokevirtual 206	java/io/InputStream:close	()V
    //   557: goto +201 -> 758
    //   560: astore 10
    //   562: aload 13
    //   564: astore 4
    //   566: aload_3
    //   567: aload 10
    //   569: invokevirtual 201	net/lingala/zip4j/progress/ProgressMonitor:endProgressMonitorError	(Ljava/lang/Throwable;)V
    //   572: new 10	net/lingala/zip4j/exception/ZipException
    //   575: dup
    //   576: aload 10
    //   578: invokespecial 271	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   581: athrow
    //   582: aload_3
    //   583: invokevirtual 222	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   586: ifeq +37 -> 623
    //   589: aload_3
    //   590: iconst_3
    //   591: invokevirtual 225	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   594: aload_3
    //   595: iconst_0
    //   596: invokevirtual 228	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   599: aload 5
    //   601: ifnull +8 -> 609
    //   604: aload 5
    //   606: invokevirtual 206	java/io/InputStream:close	()V
    //   609: aload 13
    //   611: ifnull -339 -> 272
    //   614: aload 13
    //   616: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   619: return
    //   620: astore 19
    //   622: return
    //   623: aload 13
    //   625: aload 14
    //   627: iconst_0
    //   628: iload 18
    //   630: invokevirtual 275	net/lingala/zip4j/io/ZipOutputStream:write	([BII)V
    //   633: aload_3
    //   634: iload 18
    //   636: i2l
    //   637: invokevirtual 278	net/lingala/zip4j/progress/ProgressMonitor:updateWorkCompleted	(J)V
    //   640: goto -113 -> 527
    //   643: astore 7
    //   645: aload 13
    //   647: astore 4
    //   649: goto -469 -> 180
    //   652: astore 26
    //   654: goto -354 -> 300
    //   657: astore 25
    //   659: goto -349 -> 310
    //   662: astore 23
    //   664: goto -235 -> 429
    //   667: astore 22
    //   669: goto -230 -> 439
    //   672: astore 20
    //   674: goto -65 -> 609
    //   677: astore 9
    //   679: goto -489 -> 190
    //   682: astore 8
    //   684: goto -484 -> 200
    //   687: astore 29
    //   689: goto -430 -> 259
    //   692: astore 28
    //   694: goto -425 -> 269
    //   697: astore 7
    //   699: aload 16
    //   701: astore 5
    //   703: aload 13
    //   705: astore 4
    //   707: goto -527 -> 180
    //   710: astore 10
    //   712: aconst_null
    //   713: astore 5
    //   715: aconst_null
    //   716: astore 4
    //   718: goto -152 -> 566
    //   721: astore 10
    //   723: aload 16
    //   725: astore 5
    //   727: aload 13
    //   729: astore 4
    //   731: goto -165 -> 566
    //   734: astore 6
    //   736: aconst_null
    //   737: astore 5
    //   739: aconst_null
    //   740: astore 4
    //   742: goto -573 -> 169
    //   745: astore 6
    //   747: aload 16
    //   749: astore 5
    //   751: aload 13
    //   753: astore 4
    //   755: goto -586 -> 169
    //   758: iinc 15 1
    //   761: aload 5
    //   763: astore 16
    //   765: goto -534 -> 231
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	768	0	this	ZipEngine
    //   0	768	1	paramArrayList	ArrayList
    //   0	768	2	paramZipParameters	ZipParameters
    //   0	768	3	paramProgressMonitor	ProgressMonitor
    //   57	697	4	localObject1	Object
    //   60	702	5	localObject2	Object
    //   163	13	6	localZipException1	ZipException
    //   734	1	6	localZipException2	ZipException
    //   745	1	6	localZipException3	ZipException
    //   178	23	7	localObject3	Object
    //   643	1	7	localObject4	Object
    //   697	1	7	localObject5	Object
    //   682	1	8	localIOException1	java.io.IOException
    //   677	1	9	localIOException2	java.io.IOException
    //   560	17	10	localException1	Exception
    //   710	1	10	localException2	Exception
    //   721	1	10	localException3	Exception
    //   84	48	11	bool	boolean
    //   114	90	12	localSplitOutputStream	net.lingala.zip4j.io.SplitOutputStream
    //   129	623	13	localZipOutputStream	net.lingala.zip4j.io.ZipOutputStream
    //   223	403	14	arrayOfByte	byte[]
    //   226	533	15	i	int
    //   229	535	16	localObject6	Object
    //   321	157	17	localZipParameters	ZipParameters
    //   534	101	18	j	int
    //   620	1	19	localIOException3	java.io.IOException
    //   672	1	20	localIOException4	java.io.IOException
    //   667	1	22	localIOException5	java.io.IOException
    //   662	1	23	localIOException6	java.io.IOException
    //   657	1	25	localIOException7	java.io.IOException
    //   652	1	26	localIOException8	java.io.IOException
    //   692	1	28	localIOException9	java.io.IOException
    //   687	1	29	localIOException10	java.io.IOException
    //   143	6	30	localEndCentralDirRecord	EndCentralDirRecord
    // Exception table:
    //   from	to	target	type
    //   136	145	163	net/lingala/zip4j/exception/ZipException
    //   153	163	163	net/lingala/zip4j/exception/ZipException
    //   203	218	163	net/lingala/zip4j/exception/ZipException
    //   218	225	163	net/lingala/zip4j/exception/ZipException
    //   527	536	163	net/lingala/zip4j/exception/ZipException
    //   542	547	163	net/lingala/zip4j/exception/ZipException
    //   552	557	163	net/lingala/zip4j/exception/ZipException
    //   582	599	163	net/lingala/zip4j/exception/ZipException
    //   623	640	163	net/lingala/zip4j/exception/ZipException
    //   62	131	178	finally
    //   169	178	178	finally
    //   566	582	178	finally
    //   136	145	560	java/lang/Exception
    //   153	163	560	java/lang/Exception
    //   203	218	560	java/lang/Exception
    //   218	225	560	java/lang/Exception
    //   527	536	560	java/lang/Exception
    //   542	547	560	java/lang/Exception
    //   552	557	560	java/lang/Exception
    //   582	599	560	java/lang/Exception
    //   623	640	560	java/lang/Exception
    //   614	619	620	java/io/IOException
    //   136	145	643	finally
    //   153	163	643	finally
    //   203	218	643	finally
    //   218	225	643	finally
    //   527	536	643	finally
    //   542	547	643	finally
    //   552	557	643	finally
    //   582	599	643	finally
    //   623	640	643	finally
    //   295	300	652	java/io/IOException
    //   305	310	657	java/io/IOException
    //   424	429	662	java/io/IOException
    //   434	439	667	java/io/IOException
    //   604	609	672	java/io/IOException
    //   185	190	677	java/io/IOException
    //   195	200	682	java/io/IOException
    //   254	259	687	java/io/IOException
    //   264	269	692	java/io/IOException
    //   231	249	697	finally
    //   273	290	697	finally
    //   314	419	697	finally
    //   443	466	697	finally
    //   466	502	697	finally
    //   509	527	697	finally
    //   62	131	710	java/lang/Exception
    //   231	249	721	java/lang/Exception
    //   273	290	721	java/lang/Exception
    //   314	419	721	java/lang/Exception
    //   443	466	721	java/lang/Exception
    //   466	502	721	java/lang/Exception
    //   509	527	721	java/lang/Exception
    //   62	131	734	net/lingala/zip4j/exception/ZipException
    //   231	249	745	net/lingala/zip4j/exception/ZipException
    //   273	290	745	net/lingala/zip4j/exception/ZipException
    //   314	419	745	net/lingala/zip4j/exception/ZipException
    //   443	466	745	net/lingala/zip4j/exception/ZipException
    //   466	502	745	net/lingala/zip4j/exception/ZipException
    //   509	527	745	net/lingala/zip4j/exception/ZipException
  }
  
  private RandomAccessFile prepareFileOutputStream()
    throws ZipException
  {
    String str = this.zipModel.getZipFile();
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(str)) {
      throw new ZipException("invalid output path");
    }
    try
    {
      File localFile = new File(str);
      if (!localFile.getParentFile().exists()) {
        localFile.getParentFile().mkdirs();
      }
      RandomAccessFile localRandomAccessFile = new RandomAccessFile(localFile, "rw");
      return localRandomAccessFile;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      throw new ZipException(localFileNotFoundException);
    }
  }
  
  /* Error */
  private void removeFilesIfExists(ArrayList paramArrayList, ZipParameters paramZipParameters, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   4: ifnull +42 -> 46
    //   7: aload_0
    //   8: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   11: invokevirtual 68	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   14: ifnull +32 -> 46
    //   17: aload_0
    //   18: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   21: invokevirtual 68	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   24: invokevirtual 74	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   27: ifnull +19 -> 46
    //   30: aload_0
    //   31: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   34: invokevirtual 68	net/lingala/zip4j/model/ZipModel:getCentralDirectory	()Lnet/lingala/zip4j/model/CentralDirectory;
    //   37: invokevirtual 74	net/lingala/zip4j/model/CentralDirectory:getFileHeaders	()Ljava/util/ArrayList;
    //   40: invokevirtual 36	java/util/ArrayList:size	()I
    //   43: ifgt +4 -> 47
    //   46: return
    //   47: aconst_null
    //   48: astore 4
    //   50: iconst_0
    //   51: istore 5
    //   53: aload_1
    //   54: invokevirtual 36	java/util/ArrayList:size	()I
    //   57: istore 9
    //   59: iload 5
    //   61: iload 9
    //   63: if_icmplt +17 -> 80
    //   66: aload 4
    //   68: ifnull -22 -> 46
    //   71: aload 4
    //   73: invokevirtual 304	java/io/RandomAccessFile:close	()V
    //   76: return
    //   77: astore 20
    //   79: return
    //   80: aload_1
    //   81: iload 5
    //   83: invokevirtual 40	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   86: checkcast 42	java/io/File
    //   89: invokevirtual 78	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   92: aload_2
    //   93: invokevirtual 81	net/lingala/zip4j/model/ZipParameters:getRootFolderInZip	()Ljava/lang/String;
    //   96: aload_2
    //   97: invokevirtual 84	net/lingala/zip4j/model/ZipParameters:getDefaultFolderPath	()Ljava/lang/String;
    //   100: invokestatic 88	net/lingala/zip4j/util/Zip4jUtil:getRelativeFileName	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   103: astore 10
    //   105: aload_0
    //   106: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   109: aload 10
    //   111: invokestatic 92	net/lingala/zip4j/util/Zip4jUtil:getFileHeader	(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;
    //   114: astore 11
    //   116: aload 11
    //   118: ifnull +202 -> 320
    //   121: aload 4
    //   123: ifnull +11 -> 134
    //   126: aload 4
    //   128: invokevirtual 304	java/io/RandomAccessFile:close	()V
    //   131: aconst_null
    //   132: astore 4
    //   134: new 306	net/lingala/zip4j/util/ArchiveMaintainer
    //   137: dup
    //   138: invokespecial 307	net/lingala/zip4j/util/ArchiveMaintainer:<init>	()V
    //   141: astore 12
    //   143: aload_3
    //   144: iconst_2
    //   145: invokevirtual 241	net/lingala/zip4j/progress/ProgressMonitor:setCurrentOperation	(I)V
    //   148: aload 12
    //   150: aload_0
    //   151: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   154: aload 11
    //   156: aload_3
    //   157: invokevirtual 311	net/lingala/zip4j/util/ArchiveMaintainer:initRemoveZipFile	(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Lnet/lingala/zip4j/progress/ProgressMonitor;)Ljava/util/HashMap;
    //   160: astore 13
    //   162: aload_3
    //   163: invokevirtual 222	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   166: ifeq +27 -> 193
    //   169: aload_3
    //   170: iconst_3
    //   171: invokevirtual 225	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   174: aload_3
    //   175: iconst_0
    //   176: invokevirtual 228	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   179: aload 4
    //   181: ifnull -135 -> 46
    //   184: aload 4
    //   186: invokevirtual 304	java/io/RandomAccessFile:close	()V
    //   189: return
    //   190: astore 19
    //   192: return
    //   193: aload_3
    //   194: iconst_0
    //   195: invokevirtual 241	net/lingala/zip4j/progress/ProgressMonitor:setCurrentOperation	(I)V
    //   198: aload 4
    //   200: ifnonnull +120 -> 320
    //   203: aload_0
    //   204: invokespecial 313	net/lingala/zip4j/zip/ZipEngine:prepareFileOutputStream	()Ljava/io/RandomAccessFile;
    //   207: astore 4
    //   209: aload 13
    //   211: ifnull +109 -> 320
    //   214: aload 13
    //   216: ldc_w 315
    //   219: invokevirtual 320	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   222: astore 14
    //   224: aload 14
    //   226: ifnull +94 -> 320
    //   229: aload 13
    //   231: ldc_w 315
    //   234: invokevirtual 320	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   237: checkcast 322	java/lang/String
    //   240: invokestatic 328	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   243: lstore 17
    //   245: lload 17
    //   247: lconst_0
    //   248: lcmp
    //   249: iflt +71 -> 320
    //   252: aload 4
    //   254: lload 17
    //   256: invokevirtual 329	java/io/RandomAccessFile:seek	(J)V
    //   259: goto +61 -> 320
    //   262: astore 16
    //   264: new 10	net/lingala/zip4j/exception/ZipException
    //   267: dup
    //   268: ldc_w 331
    //   271: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   274: athrow
    //   275: astore 8
    //   277: new 10	net/lingala/zip4j/exception/ZipException
    //   280: dup
    //   281: aload 8
    //   283: invokespecial 271	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   286: athrow
    //   287: astore 6
    //   289: aload 4
    //   291: ifnull +8 -> 299
    //   294: aload 4
    //   296: invokevirtual 304	java/io/RandomAccessFile:close	()V
    //   299: aload 6
    //   301: athrow
    //   302: astore 15
    //   304: new 10	net/lingala/zip4j/exception/ZipException
    //   307: dup
    //   308: ldc_w 333
    //   311: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   314: athrow
    //   315: astore 7
    //   317: goto -18 -> 299
    //   320: iinc 5 1
    //   323: goto -270 -> 53
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	326	0	this	ZipEngine
    //   0	326	1	paramArrayList	ArrayList
    //   0	326	2	paramZipParameters	ZipParameters
    //   0	326	3	paramProgressMonitor	ProgressMonitor
    //   48	247	4	localRandomAccessFile	RandomAccessFile
    //   51	270	5	i	int
    //   287	13	6	localObject1	Object
    //   315	1	7	localIOException1	java.io.IOException
    //   275	7	8	localIOException2	java.io.IOException
    //   57	7	9	j	int
    //   103	7	10	str	String
    //   114	41	11	localFileHeader	FileHeader
    //   141	8	12	localArchiveMaintainer	net.lingala.zip4j.util.ArchiveMaintainer
    //   160	70	13	localHashMap	java.util.HashMap
    //   222	3	14	localObject2	Object
    //   302	1	15	localException	Exception
    //   262	1	16	localNumberFormatException	NumberFormatException
    //   243	12	17	l	long
    //   190	1	19	localIOException3	java.io.IOException
    //   77	1	20	localIOException4	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   71	76	77	java/io/IOException
    //   184	189	190	java/io/IOException
    //   229	245	262	java/lang/NumberFormatException
    //   53	59	275	java/io/IOException
    //   80	116	275	java/io/IOException
    //   126	131	275	java/io/IOException
    //   134	179	275	java/io/IOException
    //   193	198	275	java/io/IOException
    //   203	209	275	java/io/IOException
    //   214	224	275	java/io/IOException
    //   229	245	275	java/io/IOException
    //   252	259	275	java/io/IOException
    //   264	275	275	java/io/IOException
    //   304	315	275	java/io/IOException
    //   53	59	287	finally
    //   80	116	287	finally
    //   126	131	287	finally
    //   134	179	287	finally
    //   193	198	287	finally
    //   203	209	287	finally
    //   214	224	287	finally
    //   229	245	287	finally
    //   252	259	287	finally
    //   264	275	287	finally
    //   277	287	287	finally
    //   304	315	287	finally
    //   229	245	302	java/lang/Exception
    //   294	299	315	java/io/IOException
  }
  
  public void addFiles(ArrayList paramArrayList, ZipParameters paramZipParameters, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if ((paramArrayList == null) || (paramZipParameters == null)) {
      throw new ZipException("one of the input parameters is null when adding files");
    }
    if (paramArrayList.size() <= 0) {
      throw new ZipException("no files to add");
    }
    paramProgressMonitor.setCurrentOperation(0);
    paramProgressMonitor.setState(1);
    paramProgressMonitor.setResult(1);
    if (paramBoolean)
    {
      paramProgressMonitor.setTotalWork(calculateTotalWork(paramArrayList, paramZipParameters));
      paramProgressMonitor.setFileName(((File)paramArrayList.get(0)).getAbsolutePath());
      new ZipEngine.1(this, "Zip4j", paramArrayList, paramZipParameters, paramProgressMonitor).start();
      return;
    }
    initAddFiles(paramArrayList, paramZipParameters, paramProgressMonitor);
  }
  
  public void addFolderToZip(File paramFile, ZipParameters paramZipParameters, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if ((paramFile == null) || (paramZipParameters == null)) {
      throw new ZipException("one of the input parameters is null, cannot add folder to zip");
    }
    if (!Zip4jUtil.checkFileExists(paramFile.getAbsolutePath())) {
      throw new ZipException("input folder does not exist");
    }
    if (!paramFile.isDirectory()) {
      throw new ZipException("input file is not a folder, user addFileToZip method to add files");
    }
    if (!Zip4jUtil.checkFileReadAccess(paramFile.getAbsolutePath())) {
      throw new ZipException("cannot read folder: " + paramFile.getAbsolutePath());
    }
    String str;
    if (paramZipParameters.isIncludeRootFolder()) {
      if (paramFile.getAbsolutePath() != null) {
        if (paramFile.getAbsoluteFile().getParentFile() != null) {
          str = paramFile.getAbsoluteFile().getParentFile().getAbsolutePath();
        }
      }
    }
    for (;;)
    {
      paramZipParameters.setDefaultFolderPath(str);
      ArrayList localArrayList = Zip4jUtil.getFilesInDirectoryRec(paramFile, paramZipParameters.isReadHiddenFiles());
      if (paramZipParameters.isIncludeRootFolder())
      {
        if (localArrayList == null) {
          localArrayList = new ArrayList();
        }
        localArrayList.add(paramFile);
      }
      addFiles(localArrayList, paramZipParameters, paramProgressMonitor, paramBoolean);
      return;
      str = "";
      continue;
      if (paramFile.getParentFile() != null) {}
      for (str = paramFile.getParentFile().getAbsolutePath();; str = "") {
        break;
      }
      str = paramFile.getAbsolutePath();
    }
  }
  
  /* Error */
  public void addStreamToZip(java.io.InputStream paramInputStream, ZipParameters paramZipParameters)
    throws ZipException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +7 -> 8
    //   4: aload_2
    //   5: ifnonnull +14 -> 19
    //   8: new 10	net/lingala/zip4j/exception/ZipException
    //   11: dup
    //   12: ldc_w 404
    //   15: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   18: athrow
    //   19: aconst_null
    //   20: astore_3
    //   21: aload_0
    //   22: aload_2
    //   23: invokespecial 173	net/lingala/zip4j/zip/ZipEngine:checkParameters	(Lnet/lingala/zip4j/model/ZipParameters;)V
    //   26: aload_0
    //   27: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   30: invokevirtual 95	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   33: invokestatic 180	net/lingala/zip4j/util/Zip4jUtil:checkFileExists	(Ljava/lang/String;)Z
    //   36: istore 8
    //   38: new 182	net/lingala/zip4j/io/SplitOutputStream
    //   41: dup
    //   42: new 42	java/io/File
    //   45: dup
    //   46: aload_0
    //   47: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   50: invokevirtual 95	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   53: invokespecial 96	java/io/File:<init>	(Ljava/lang/String;)V
    //   56: aload_0
    //   57: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   60: invokevirtual 185	net/lingala/zip4j/model/ZipModel:getSplitLength	()J
    //   63: invokespecial 188	net/lingala/zip4j/io/SplitOutputStream:<init>	(Ljava/io/File;J)V
    //   66: astore 9
    //   68: new 190	net/lingala/zip4j/io/ZipOutputStream
    //   71: dup
    //   72: aload 9
    //   74: aload_0
    //   75: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   78: invokespecial 193	net/lingala/zip4j/io/ZipOutputStream:<init>	(Ljava/io/OutputStream;Lnet/lingala/zip4j/model/ZipModel;)V
    //   81: astore 10
    //   83: iload 8
    //   85: ifeq +59 -> 144
    //   88: aload_0
    //   89: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   92: invokevirtual 165	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   95: ifnonnull +34 -> 129
    //   98: new 10	net/lingala/zip4j/exception/ZipException
    //   101: dup
    //   102: ldc -61
    //   104: invokespecial 18	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   107: athrow
    //   108: astore 4
    //   110: aload 10
    //   112: astore_3
    //   113: aload 4
    //   115: athrow
    //   116: astore 5
    //   118: aload_3
    //   119: ifnull +7 -> 126
    //   122: aload_3
    //   123: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   126: aload 5
    //   128: athrow
    //   129: aload 9
    //   131: aload_0
    //   132: getfield 20	net/lingala/zip4j/zip/ZipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   135: invokevirtual 165	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   138: invokevirtual 210	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   141: invokevirtual 213	net/lingala/zip4j/io/SplitOutputStream:seek	(J)V
    //   144: sipush 4096
    //   147: newarray <illegal type>
    //   149: astore 11
    //   151: aload 10
    //   153: aconst_null
    //   154: aload_2
    //   155: invokevirtual 257	net/lingala/zip4j/io/ZipOutputStream:putNextEntry	(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    //   158: aload_2
    //   159: invokevirtual 407	net/lingala/zip4j/model/ZipParameters:getFileNameInZip	()Ljava/lang/String;
    //   162: ldc_w 409
    //   165: invokevirtual 412	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   168: ifne +30 -> 198
    //   171: aload_2
    //   172: invokevirtual 407	net/lingala/zip4j/model/ZipParameters:getFileNameInZip	()Ljava/lang/String;
    //   175: ldc_w 414
    //   178: invokevirtual 412	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   181: ifne +17 -> 198
    //   184: aload_1
    //   185: aload 11
    //   187: invokevirtual 269	java/io/InputStream:read	([B)I
    //   190: istore 13
    //   192: iload 13
    //   194: iconst_m1
    //   195: if_icmpne +24 -> 219
    //   198: aload 10
    //   200: invokevirtual 260	net/lingala/zip4j/io/ZipOutputStream:closeEntry	()V
    //   203: aload 10
    //   205: invokevirtual 216	net/lingala/zip4j/io/ZipOutputStream:finish	()V
    //   208: aload 10
    //   210: ifnull +8 -> 218
    //   213: aload 10
    //   215: invokevirtual 207	net/lingala/zip4j/io/ZipOutputStream:close	()V
    //   218: return
    //   219: aload 10
    //   221: aload 11
    //   223: iconst_0
    //   224: iload 13
    //   226: invokevirtual 275	net/lingala/zip4j/io/ZipOutputStream:write	([BII)V
    //   229: goto -45 -> 184
    //   232: astore 7
    //   234: aload 10
    //   236: astore_3
    //   237: new 10	net/lingala/zip4j/exception/ZipException
    //   240: dup
    //   241: aload 7
    //   243: invokespecial 271	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   246: athrow
    //   247: astore 6
    //   249: goto -123 -> 126
    //   252: astore 12
    //   254: return
    //   255: astore 5
    //   257: aload 10
    //   259: astore_3
    //   260: goto -142 -> 118
    //   263: astore 7
    //   265: aconst_null
    //   266: astore_3
    //   267: goto -30 -> 237
    //   270: astore 4
    //   272: aconst_null
    //   273: astore_3
    //   274: goto -161 -> 113
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	277	0	this	ZipEngine
    //   0	277	1	paramInputStream	java.io.InputStream
    //   0	277	2	paramZipParameters	ZipParameters
    //   20	254	3	localObject1	Object
    //   108	6	4	localZipException1	ZipException
    //   270	1	4	localZipException2	ZipException
    //   116	11	5	localObject2	Object
    //   255	1	5	localObject3	Object
    //   247	1	6	localIOException1	java.io.IOException
    //   232	10	7	localException1	Exception
    //   263	1	7	localException2	Exception
    //   36	48	8	bool	boolean
    //   66	64	9	localSplitOutputStream	net.lingala.zip4j.io.SplitOutputStream
    //   81	177	10	localZipOutputStream	net.lingala.zip4j.io.ZipOutputStream
    //   149	73	11	arrayOfByte	byte[]
    //   252	1	12	localIOException2	java.io.IOException
    //   190	35	13	i	int
    // Exception table:
    //   from	to	target	type
    //   88	108	108	net/lingala/zip4j/exception/ZipException
    //   129	144	108	net/lingala/zip4j/exception/ZipException
    //   144	184	108	net/lingala/zip4j/exception/ZipException
    //   184	192	108	net/lingala/zip4j/exception/ZipException
    //   198	208	108	net/lingala/zip4j/exception/ZipException
    //   219	229	108	net/lingala/zip4j/exception/ZipException
    //   21	83	116	finally
    //   113	116	116	finally
    //   237	247	116	finally
    //   88	108	232	java/lang/Exception
    //   129	144	232	java/lang/Exception
    //   144	184	232	java/lang/Exception
    //   184	192	232	java/lang/Exception
    //   198	208	232	java/lang/Exception
    //   219	229	232	java/lang/Exception
    //   122	126	247	java/io/IOException
    //   213	218	252	java/io/IOException
    //   88	108	255	finally
    //   129	144	255	finally
    //   144	184	255	finally
    //   184	192	255	finally
    //   198	208	255	finally
    //   219	229	255	finally
    //   21	83	263	java/lang/Exception
    //   21	83	270	net/lingala/zip4j/exception/ZipException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/zip/ZipEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */