package net.lingala.zip4j.unzip;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.zip.CRC32;
import net.lingala.zip4j.crypto.AESDecrypter;
import net.lingala.zip4j.crypto.IDecrypter;
import net.lingala.zip4j.crypto.StandardDecrypter;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.AESExtraDataRecord;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.LocalFileHeader;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.util.Raw;
import net.lingala.zip4j.util.Zip4jUtil;

public class UnzipEngine
{
  private CRC32 crc;
  private int currSplitFileCounter = 0;
  private IDecrypter decrypter;
  private FileHeader fileHeader;
  private LocalFileHeader localFileHeader;
  private ZipModel zipModel;
  
  public UnzipEngine(ZipModel paramZipModel, FileHeader paramFileHeader)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramFileHeader == null)) {
      throw new ZipException("Invalid parameters passed to StoreUnzip. One or more of the parameters were null");
    }
    this.zipModel = paramZipModel;
    this.fileHeader = paramFileHeader;
    this.crc = new CRC32();
  }
  
  private int calculateAESSaltLength(AESExtraDataRecord paramAESExtraDataRecord)
    throws ZipException
  {
    if (paramAESExtraDataRecord == null) {
      throw new ZipException("unable to determine salt length: AESExtraDataRecord is null");
    }
    switch (paramAESExtraDataRecord.getAesStrength())
    {
    default: 
      throw new ZipException("unable to determine salt length: invalid aes key strength");
    case 1: 
      return 8;
    case 2: 
      return 12;
    }
    return 16;
  }
  
  /* Error */
  private boolean checkLocalHeader()
    throws ZipException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: invokespecial 63	net/lingala/zip4j/unzip/UnzipEngine:checkSplitFile	()Ljava/io/RandomAccessFile;
    //   6: astore_1
    //   7: aload_1
    //   8: ifnonnull +27 -> 35
    //   11: new 65	java/io/RandomAccessFile
    //   14: dup
    //   15: new 67	java/io/File
    //   18: dup
    //   19: aload_0
    //   20: getfield 32	net/lingala/zip4j/unzip/UnzipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   23: invokevirtual 73	net/lingala/zip4j/model/ZipModel:getZipFile	()Ljava/lang/String;
    //   26: invokespecial 74	java/io/File:<init>	(Ljava/lang/String;)V
    //   29: ldc 76
    //   31: invokespecial 79	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   34: astore_1
    //   35: aload_0
    //   36: new 81	net/lingala/zip4j/core/HeaderReader
    //   39: dup
    //   40: aload_1
    //   41: invokespecial 84	net/lingala/zip4j/core/HeaderReader:<init>	(Ljava/io/RandomAccessFile;)V
    //   44: aload_0
    //   45: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   48: invokevirtual 88	net/lingala/zip4j/core/HeaderReader:readLocalFileHeader	(Lnet/lingala/zip4j/model/FileHeader;)Lnet/lingala/zip4j/model/LocalFileHeader;
    //   51: putfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   54: aload_0
    //   55: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   58: ifnonnull +36 -> 94
    //   61: new 20	net/lingala/zip4j/exception/ZipException
    //   64: dup
    //   65: ldc 92
    //   67: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   70: athrow
    //   71: astore 5
    //   73: new 20	net/lingala/zip4j/exception/ZipException
    //   76: dup
    //   77: aload 5
    //   79: invokespecial 95	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   82: athrow
    //   83: astore_2
    //   84: aload_1
    //   85: ifnull +7 -> 92
    //   88: aload_1
    //   89: invokevirtual 98	java/io/RandomAccessFile:close	()V
    //   92: aload_2
    //   93: athrow
    //   94: aload_0
    //   95: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   98: invokevirtual 103	net/lingala/zip4j/model/LocalFileHeader:getCompressionMethod	()I
    //   101: istore 6
    //   103: aload_0
    //   104: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   107: invokevirtual 106	net/lingala/zip4j/model/FileHeader:getCompressionMethod	()I
    //   110: istore 7
    //   112: iload 6
    //   114: iload 7
    //   116: if_icmpeq +13 -> 129
    //   119: aload_1
    //   120: ifnull +7 -> 127
    //   123: aload_1
    //   124: invokevirtual 98	java/io/RandomAccessFile:close	()V
    //   127: iconst_0
    //   128: ireturn
    //   129: aload_1
    //   130: ifnull +7 -> 137
    //   133: aload_1
    //   134: invokevirtual 98	java/io/RandomAccessFile:close	()V
    //   137: iconst_1
    //   138: ireturn
    //   139: astore 11
    //   141: goto -14 -> 127
    //   144: astore 10
    //   146: goto -19 -> 127
    //   149: astore 9
    //   151: goto -14 -> 137
    //   154: astore 8
    //   156: goto -19 -> 137
    //   159: astore 4
    //   161: goto -69 -> 92
    //   164: astore_3
    //   165: goto -73 -> 92
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	168	0	this	UnzipEngine
    //   1	133	1	localRandomAccessFile	RandomAccessFile
    //   83	10	2	localObject	Object
    //   164	1	3	localException1	Exception
    //   159	1	4	localIOException1	IOException
    //   71	7	5	localFileNotFoundException	FileNotFoundException
    //   101	16	6	i	int
    //   110	7	7	j	int
    //   154	1	8	localException2	Exception
    //   149	1	9	localIOException2	IOException
    //   144	1	10	localException3	Exception
    //   139	1	11	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   2	7	71	java/io/FileNotFoundException
    //   11	35	71	java/io/FileNotFoundException
    //   35	71	71	java/io/FileNotFoundException
    //   94	112	71	java/io/FileNotFoundException
    //   2	7	83	finally
    //   11	35	83	finally
    //   35	71	83	finally
    //   73	83	83	finally
    //   94	112	83	finally
    //   123	127	139	java/io/IOException
    //   123	127	144	java/lang/Exception
    //   133	137	149	java/io/IOException
    //   133	137	154	java/lang/Exception
    //   88	92	159	java/io/IOException
    //   88	92	164	java/lang/Exception
  }
  
  private RandomAccessFile checkSplitFile()
    throws ZipException
  {
    if (this.zipModel.isSplitArchive())
    {
      int i = this.fileHeader.getDiskNumberStart();
      this.currSplitFileCounter = (i + 1);
      String str1 = this.zipModel.getZipFile();
      String str2;
      if (i == this.zipModel.getEndCentralDirRecord().getNoOfThisDisk()) {
        str2 = this.zipModel.getZipFile();
      }
      try
      {
        localRandomAccessFile = new RandomAccessFile(str2, "r");
        if (this.currSplitFileCounter != 1) {
          return localRandomAccessFile;
        }
        byte[] arrayOfByte = new byte[4];
        localRandomAccessFile.read(arrayOfByte);
        if (Raw.readIntLittleEndian(arrayOfByte, 0) == 134695760L) {
          return localRandomAccessFile;
        }
        throw new ZipException("invalid first part split file signature");
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        for (;;)
        {
          throw new ZipException(localFileNotFoundException);
          if (i >= 9) {
            str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z" + (i + 1);
          } else {
            str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z0" + (i + 1);
          }
        }
      }
      catch (IOException localIOException)
      {
        throw new ZipException(localIOException);
      }
    }
    RandomAccessFile localRandomAccessFile = null;
    return localRandomAccessFile;
  }
  
  private void closeStreams(InputStream paramInputStream, OutputStream paramOutputStream)
    throws ZipException
  {
    if (paramInputStream != null) {}
    try
    {
      paramInputStream.close();
      if (paramOutputStream != null) {}
      return;
    }
    catch (IOException localIOException3)
    {
      localIOException3 = localIOException3;
      if ((localIOException3 != null) && (Zip4jUtil.isStringNotNullAndNotEmpty(localIOException3.getMessage())) && (localIOException3.getMessage().indexOf(" - Wrong Password?") >= 0)) {
        throw new ZipException(localIOException3.getMessage());
      }
    }
    finally
    {
      for (;;)
      {
        if (paramOutputStream != null) {}
        try
        {
          paramOutputStream.close();
          throw ((Throwable)localObject);
          if (paramOutputStream == null) {
            continue;
          }
          try
          {
            paramOutputStream.close();
            return;
          }
          catch (IOException localIOException4)
          {
            return;
          }
        }
        catch (IOException localIOException2)
        {
          for (;;) {}
        }
      }
    }
  }
  
  private RandomAccessFile createFileHandler(String paramString)
    throws ZipException
  {
    if ((this.zipModel == null) || (!Zip4jUtil.isStringNotNullAndNotEmpty(this.zipModel.getZipFile()))) {
      throw new ZipException("input parameter is null in getFilePointer");
    }
    try
    {
      if (this.zipModel.isSplitArchive()) {
        return checkSplitFile();
      }
      RandomAccessFile localRandomAccessFile = new RandomAccessFile(new File(this.zipModel.getZipFile()), paramString);
      return localRandomAccessFile;
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
  
  private byte[] getAESPasswordVerifier(RandomAccessFile paramRandomAccessFile)
    throws ZipException
  {
    try
    {
      byte[] arrayOfByte = new byte[2];
      paramRandomAccessFile.read(arrayOfByte);
      return arrayOfByte;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
  }
  
  private byte[] getAESSalt(RandomAccessFile paramRandomAccessFile)
    throws ZipException
  {
    if (this.localFileHeader.getAesExtraDataRecord() == null) {
      return null;
    }
    try
    {
      byte[] arrayOfByte = new byte[calculateAESSaltLength(this.localFileHeader.getAesExtraDataRecord())];
      paramRandomAccessFile.seek(this.localFileHeader.getOffsetStartOfData());
      paramRandomAccessFile.read(arrayOfByte);
      return arrayOfByte;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
  }
  
  private String getOutputFileNameWithPath(String paramString1, String paramString2)
    throws ZipException
  {
    if (Zip4jUtil.isStringNotNullAndNotEmpty(paramString2)) {}
    for (String str = paramString2;; str = this.fileHeader.getFileName()) {
      return paramString1 + System.getProperty("file.separator") + str;
    }
  }
  
  private FileOutputStream getOutputStream(String paramString1, String paramString2)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString1)) {
      throw new ZipException("invalid output path");
    }
    try
    {
      File localFile = new File(getOutputFileNameWithPath(paramString1, paramString2));
      if (!localFile.getParentFile().exists()) {
        localFile.getParentFile().mkdirs();
      }
      if (localFile.exists()) {
        localFile.delete();
      }
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      return localFileOutputStream;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      throw new ZipException(localFileNotFoundException);
    }
  }
  
  private byte[] getStandardDecrypterHeaderBytes(RandomAccessFile paramRandomAccessFile)
    throws ZipException
  {
    try
    {
      byte[] arrayOfByte = new byte[12];
      paramRandomAccessFile.seek(this.localFileHeader.getOffsetStartOfData());
      paramRandomAccessFile.read(arrayOfByte, 0, 12);
      return arrayOfByte;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private void init(RandomAccessFile paramRandomAccessFile)
    throws ZipException
  {
    if (this.localFileHeader == null) {
      throw new ZipException("local file header is null, cannot initialize input stream");
    }
    try
    {
      initDecrypter(paramRandomAccessFile);
      return;
    }
    catch (ZipException localZipException)
    {
      throw localZipException;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private void initDecrypter(RandomAccessFile paramRandomAccessFile)
    throws ZipException
  {
    if (this.localFileHeader == null) {
      throw new ZipException("local file header is null, cannot init decrypter");
    }
    if (this.localFileHeader.isEncrypted())
    {
      if (this.localFileHeader.getEncryptionMethod() == 0) {
        this.decrypter = new StandardDecrypter(this.fileHeader, getStandardDecrypterHeaderBytes(paramRandomAccessFile));
      }
    }
    else {
      return;
    }
    if (this.localFileHeader.getEncryptionMethod() == 99)
    {
      this.decrypter = new AESDecrypter(this.localFileHeader, getAESSalt(paramRandomAccessFile), getAESPasswordVerifier(paramRandomAccessFile));
      return;
    }
    throw new ZipException("unsupported encryption method");
  }
  
  public void checkCRC()
    throws ZipException
  {
    if (this.fileHeader != null) {
      if (this.fileHeader.getEncryptionMethod() == 99)
      {
        if ((this.decrypter != null) && ((this.decrypter instanceof AESDecrypter)))
        {
          byte[] arrayOfByte1 = ((AESDecrypter)this.decrypter).getCalculatedAuthenticationBytes();
          byte[] arrayOfByte2 = ((AESDecrypter)this.decrypter).getStoredMac();
          byte[] arrayOfByte3 = new byte[10];
          if ((arrayOfByte3 == null) || (arrayOfByte2 == null)) {
            throw new ZipException("CRC (MAC) check failed for " + this.fileHeader.getFileName());
          }
          System.arraycopy(arrayOfByte1, 0, arrayOfByte3, 0, 10);
          if (!Arrays.equals(arrayOfByte3, arrayOfByte2)) {
            throw new ZipException("invalid CRC (MAC) for file: " + this.fileHeader.getFileName());
          }
        }
      }
      else if ((0xFFFFFFFF & this.crc.getValue()) != this.fileHeader.getCrc32())
      {
        String str = "invalid CRC for file: " + this.fileHeader.getFileName();
        if ((this.localFileHeader.isEncrypted()) && (this.localFileHeader.getEncryptionMethod() == 0)) {
          str = str + " - Wrong Password?";
        }
        throw new ZipException(str);
      }
    }
  }
  
  public IDecrypter getDecrypter()
  {
    return this.decrypter;
  }
  
  public FileHeader getFileHeader()
  {
    return this.fileHeader;
  }
  
  /* Error */
  public net.lingala.zip4j.io.ZipInputStream getInputStream()
    throws ZipException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   4: ifnonnull +14 -> 18
    //   7: new 20	net/lingala/zip4j/exception/ZipException
    //   10: dup
    //   11: ldc_w 330
    //   14: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   17: athrow
    //   18: aconst_null
    //   19: astore_1
    //   20: aload_0
    //   21: ldc 76
    //   23: invokespecial 332	net/lingala/zip4j/unzip/UnzipEngine:createFileHandler	(Ljava/lang/String;)Ljava/io/RandomAccessFile;
    //   26: astore_1
    //   27: aload_0
    //   28: invokespecial 334	net/lingala/zip4j/unzip/UnzipEngine:checkLocalHeader	()Z
    //   31: ifne +27 -> 58
    //   34: new 20	net/lingala/zip4j/exception/ZipException
    //   37: dup
    //   38: ldc_w 336
    //   41: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   44: athrow
    //   45: astore 4
    //   47: aload_1
    //   48: ifnull +7 -> 55
    //   51: aload_1
    //   52: invokevirtual 98	java/io/RandomAccessFile:close	()V
    //   55: aload 4
    //   57: athrow
    //   58: aload_0
    //   59: aload_1
    //   60: invokespecial 338	net/lingala/zip4j/unzip/UnzipEngine:init	(Ljava/io/RandomAccessFile;)V
    //   63: aload_0
    //   64: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   67: invokevirtual 341	net/lingala/zip4j/model/LocalFileHeader:getCompressedSize	()J
    //   70: lstore 6
    //   72: aload_0
    //   73: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   76: invokevirtual 210	net/lingala/zip4j/model/LocalFileHeader:getOffsetStartOfData	()J
    //   79: lstore 8
    //   81: aload_0
    //   82: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   85: invokevirtual 266	net/lingala/zip4j/model/LocalFileHeader:isEncrypted	()Z
    //   88: ifeq +82 -> 170
    //   91: aload_0
    //   92: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   95: invokevirtual 269	net/lingala/zip4j/model/LocalFileHeader:getEncryptionMethod	()I
    //   98: bipush 99
    //   100: if_icmpne +208 -> 308
    //   103: aload_0
    //   104: getfield 278	net/lingala/zip4j/unzip/UnzipEngine:decrypter	Lnet/lingala/zip4j/crypto/IDecrypter;
    //   107: instanceof 280
    //   110: ifeq +167 -> 277
    //   113: lload 6
    //   115: bipush 10
    //   117: aload_0
    //   118: getfield 278	net/lingala/zip4j/unzip/UnzipEngine:decrypter	Lnet/lingala/zip4j/crypto/IDecrypter;
    //   121: checkcast 280	net/lingala/zip4j/crypto/AESDecrypter
    //   124: invokevirtual 344	net/lingala/zip4j/crypto/AESDecrypter:getSaltLength	()I
    //   127: aload_0
    //   128: getfield 278	net/lingala/zip4j/unzip/UnzipEngine:decrypter	Lnet/lingala/zip4j/crypto/IDecrypter;
    //   131: checkcast 280	net/lingala/zip4j/crypto/AESDecrypter
    //   134: invokevirtual 347	net/lingala/zip4j/crypto/AESDecrypter:getPasswordVerifierLength	()I
    //   137: iadd
    //   138: iadd
    //   139: i2l
    //   140: lsub
    //   141: lstore 6
    //   143: lload 8
    //   145: aload_0
    //   146: getfield 278	net/lingala/zip4j/unzip/UnzipEngine:decrypter	Lnet/lingala/zip4j/crypto/IDecrypter;
    //   149: checkcast 280	net/lingala/zip4j/crypto/AESDecrypter
    //   152: invokevirtual 344	net/lingala/zip4j/crypto/AESDecrypter:getSaltLength	()I
    //   155: aload_0
    //   156: getfield 278	net/lingala/zip4j/unzip/UnzipEngine:decrypter	Lnet/lingala/zip4j/crypto/IDecrypter;
    //   159: checkcast 280	net/lingala/zip4j/crypto/AESDecrypter
    //   162: invokevirtual 347	net/lingala/zip4j/crypto/AESDecrypter:getPasswordVerifierLength	()I
    //   165: iadd
    //   166: i2l
    //   167: ladd
    //   168: lstore 8
    //   170: aload_0
    //   171: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   174: invokevirtual 106	net/lingala/zip4j/model/FileHeader:getCompressionMethod	()I
    //   177: istore 10
    //   179: aload_0
    //   180: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   183: invokevirtual 291	net/lingala/zip4j/model/FileHeader:getEncryptionMethod	()I
    //   186: bipush 99
    //   188: if_icmpne +25 -> 213
    //   191: aload_0
    //   192: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   195: invokevirtual 348	net/lingala/zip4j/model/FileHeader:getAesExtraDataRecord	()Lnet/lingala/zip4j/model/AESExtraDataRecord;
    //   198: ifnull +139 -> 337
    //   201: aload_0
    //   202: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   205: invokevirtual 348	net/lingala/zip4j/model/FileHeader:getAesExtraDataRecord	()Lnet/lingala/zip4j/model/AESExtraDataRecord;
    //   208: invokevirtual 349	net/lingala/zip4j/model/AESExtraDataRecord:getCompressionMethod	()I
    //   211: istore 10
    //   213: aload_1
    //   214: lload 8
    //   216: invokevirtual 214	java/io/RandomAccessFile:seek	(J)V
    //   219: iload 10
    //   221: lookupswitch	default:+27->248, 0:+147->368, 8:+168->389
    //   248: new 20	net/lingala/zip4j/exception/ZipException
    //   251: dup
    //   252: ldc_w 351
    //   255: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   258: athrow
    //   259: astore_2
    //   260: aload_1
    //   261: ifnull +7 -> 268
    //   264: aload_1
    //   265: invokevirtual 98	java/io/RandomAccessFile:close	()V
    //   268: new 20	net/lingala/zip4j/exception/ZipException
    //   271: dup
    //   272: aload_2
    //   273: invokespecial 95	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   276: athrow
    //   277: new 20	net/lingala/zip4j/exception/ZipException
    //   280: dup
    //   281: new 140	java/lang/StringBuffer
    //   284: dup
    //   285: ldc_w 353
    //   288: invokespecial 157	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   291: aload_0
    //   292: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   295: invokevirtual 227	net/lingala/zip4j/model/FileHeader:getFileName	()Ljava/lang/String;
    //   298: invokevirtual 163	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   301: invokevirtual 169	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   304: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   307: athrow
    //   308: aload_0
    //   309: getfield 90	net/lingala/zip4j/unzip/UnzipEngine:localFileHeader	Lnet/lingala/zip4j/model/LocalFileHeader;
    //   312: invokevirtual 269	net/lingala/zip4j/model/LocalFileHeader:getEncryptionMethod	()I
    //   315: ifne -145 -> 170
    //   318: lload 6
    //   320: ldc2_w 354
    //   323: lsub
    //   324: lstore 6
    //   326: lload 8
    //   328: ldc2_w 354
    //   331: ladd
    //   332: lstore 8
    //   334: goto -164 -> 170
    //   337: new 20	net/lingala/zip4j/exception/ZipException
    //   340: dup
    //   341: new 140	java/lang/StringBuffer
    //   344: dup
    //   345: ldc_w 357
    //   348: invokespecial 157	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   351: aload_0
    //   352: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   355: invokevirtual 227	net/lingala/zip4j/model/FileHeader:getFileName	()Ljava/lang/String;
    //   358: invokevirtual 163	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   361: invokevirtual 169	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   364: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   367: athrow
    //   368: new 359	net/lingala/zip4j/io/ZipInputStream
    //   371: dup
    //   372: new 361	net/lingala/zip4j/io/PartInputStream
    //   375: dup
    //   376: aload_1
    //   377: lload 8
    //   379: lload 6
    //   381: aload_0
    //   382: invokespecial 364	net/lingala/zip4j/io/PartInputStream:<init>	(Ljava/io/RandomAccessFile;JJLnet/lingala/zip4j/unzip/UnzipEngine;)V
    //   385: invokespecial 367	net/lingala/zip4j/io/ZipInputStream:<init>	(Lnet/lingala/zip4j/io/BaseInputStream;)V
    //   388: areturn
    //   389: new 359	net/lingala/zip4j/io/ZipInputStream
    //   392: dup
    //   393: new 369	net/lingala/zip4j/io/InflaterInputStream
    //   396: dup
    //   397: aload_1
    //   398: lload 8
    //   400: lload 6
    //   402: aload_0
    //   403: invokespecial 370	net/lingala/zip4j/io/InflaterInputStream:<init>	(Ljava/io/RandomAccessFile;JJLnet/lingala/zip4j/unzip/UnzipEngine;)V
    //   406: invokespecial 367	net/lingala/zip4j/io/ZipInputStream:<init>	(Lnet/lingala/zip4j/io/BaseInputStream;)V
    //   409: astore 11
    //   411: aload 11
    //   413: areturn
    //   414: astore 5
    //   416: goto -361 -> 55
    //   419: astore_3
    //   420: goto -152 -> 268
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	423	0	this	UnzipEngine
    //   19	379	1	localRandomAccessFile	RandomAccessFile
    //   259	14	2	localException	Exception
    //   419	1	3	localIOException1	IOException
    //   45	11	4	localZipException	ZipException
    //   414	1	5	localIOException2	IOException
    //   70	331	6	l1	long
    //   79	320	8	l2	long
    //   177	43	10	i	int
    //   409	3	11	localZipInputStream	net.lingala.zip4j.io.ZipInputStream
    // Exception table:
    //   from	to	target	type
    //   20	45	45	net/lingala/zip4j/exception/ZipException
    //   58	170	45	net/lingala/zip4j/exception/ZipException
    //   170	213	45	net/lingala/zip4j/exception/ZipException
    //   213	219	45	net/lingala/zip4j/exception/ZipException
    //   248	259	45	net/lingala/zip4j/exception/ZipException
    //   277	308	45	net/lingala/zip4j/exception/ZipException
    //   308	318	45	net/lingala/zip4j/exception/ZipException
    //   337	368	45	net/lingala/zip4j/exception/ZipException
    //   368	389	45	net/lingala/zip4j/exception/ZipException
    //   389	411	45	net/lingala/zip4j/exception/ZipException
    //   20	45	259	java/lang/Exception
    //   58	170	259	java/lang/Exception
    //   170	213	259	java/lang/Exception
    //   213	219	259	java/lang/Exception
    //   248	259	259	java/lang/Exception
    //   277	308	259	java/lang/Exception
    //   308	318	259	java/lang/Exception
    //   337	368	259	java/lang/Exception
    //   368	389	259	java/lang/Exception
    //   389	411	259	java/lang/Exception
    //   51	55	414	java/io/IOException
    //   264	268	419	java/io/IOException
  }
  
  public LocalFileHeader getLocalFileHeader()
  {
    return this.localFileHeader;
  }
  
  public ZipModel getZipModel()
  {
    return this.zipModel;
  }
  
  public RandomAccessFile startNextSplitFile()
    throws IOException, FileNotFoundException
  {
    String str1 = this.zipModel.getZipFile();
    String str2;
    if (this.currSplitFileCounter == this.zipModel.getEndCentralDirRecord().getNoOfThisDisk()) {
      str2 = this.zipModel.getZipFile();
    }
    for (;;)
    {
      this.currSplitFileCounter = (1 + this.currSplitFileCounter);
      try
      {
        if (Zip4jUtil.checkFileExists(str2)) {
          break;
        }
        throw new IOException("zip split file does not exist: " + str2);
      }
      catch (ZipException localZipException)
      {
        throw new IOException(localZipException.getMessage());
      }
      if (this.currSplitFileCounter >= 9) {
        str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z" + (1 + this.currSplitFileCounter);
      } else {
        str2 = str1.substring(0, str1.lastIndexOf(".")) + ".z0" + (1 + this.currSplitFileCounter);
      }
    }
    return new RandomAccessFile(str2, "r");
  }
  
  /* Error */
  public void unzipFile(net.lingala.zip4j.progress.ProgressMonitor paramProgressMonitor, String paramString1, String paramString2, net.lingala.zip4j.model.UnzipParameters paramUnzipParameters)
    throws ZipException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 32	net/lingala/zip4j/unzip/UnzipEngine:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   4: ifnull +17 -> 21
    //   7: aload_0
    //   8: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   11: ifnull +10 -> 21
    //   14: aload_2
    //   15: invokestatic 188	net/lingala/zip4j/util/Zip4jUtil:isStringNotNullAndNotEmpty	(Ljava/lang/String;)Z
    //   18: ifne +14 -> 32
    //   21: new 20	net/lingala/zip4j/exception/ZipException
    //   24: dup
    //   25: ldc_w 386
    //   28: invokespecial 30	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   31: athrow
    //   32: aconst_null
    //   33: astore 5
    //   35: aconst_null
    //   36: astore 6
    //   38: sipush 4096
    //   41: newarray <illegal type>
    //   43: astore 10
    //   45: aload_0
    //   46: invokevirtual 388	net/lingala/zip4j/unzip/UnzipEngine:getInputStream	()Lnet/lingala/zip4j/io/ZipInputStream;
    //   49: astore 5
    //   51: aload_0
    //   52: aload_2
    //   53: aload_3
    //   54: invokespecial 390	net/lingala/zip4j/unzip/UnzipEngine:getOutputStream	(Ljava/lang/String;Ljava/lang/String;)Ljava/io/FileOutputStream;
    //   57: astore 6
    //   59: aload 5
    //   61: aload 10
    //   63: invokevirtual 391	java/io/InputStream:read	([B)I
    //   66: istore 11
    //   68: iload 11
    //   70: iconst_m1
    //   71: if_icmpne +42 -> 113
    //   74: aload_0
    //   75: aload 5
    //   77: aload 6
    //   79: invokespecial 393	net/lingala/zip4j/unzip/UnzipEngine:closeStreams	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   82: aload_0
    //   83: getfield 34	net/lingala/zip4j/unzip/UnzipEngine:fileHeader	Lnet/lingala/zip4j/model/FileHeader;
    //   86: new 67	java/io/File
    //   89: dup
    //   90: aload_0
    //   91: aload_2
    //   92: aload_3
    //   93: invokespecial 233	net/lingala/zip4j/unzip/UnzipEngine:getOutputFileNameWithPath	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   96: invokespecial 74	java/io/File:<init>	(Ljava/lang/String;)V
    //   99: aload 4
    //   101: invokestatic 399	net/lingala/zip4j/unzip/UnzipUtil:applyFileAttributes	(Lnet/lingala/zip4j/model/FileHeader;Ljava/io/File;Lnet/lingala/zip4j/model/UnzipParameters;)V
    //   104: aload_0
    //   105: aload 5
    //   107: aload 6
    //   109: invokespecial 393	net/lingala/zip4j/unzip/UnzipEngine:closeStreams	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   112: return
    //   113: aload 6
    //   115: aload 10
    //   117: iconst_0
    //   118: iload 11
    //   120: invokevirtual 403	java/io/OutputStream:write	([BII)V
    //   123: aload_1
    //   124: iload 11
    //   126: i2l
    //   127: invokevirtual 408	net/lingala/zip4j/progress/ProgressMonitor:updateWorkCompleted	(J)V
    //   130: aload_1
    //   131: invokevirtual 411	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   134: ifeq -75 -> 59
    //   137: aload_1
    //   138: iconst_3
    //   139: invokevirtual 415	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   142: aload_1
    //   143: iconst_0
    //   144: invokevirtual 418	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   147: aload_0
    //   148: aload 5
    //   150: aload 6
    //   152: invokespecial 393	net/lingala/zip4j/unzip/UnzipEngine:closeStreams	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   155: return
    //   156: astore 9
    //   158: new 20	net/lingala/zip4j/exception/ZipException
    //   161: dup
    //   162: aload 9
    //   164: invokespecial 95	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   167: athrow
    //   168: astore 8
    //   170: aload_0
    //   171: aload 5
    //   173: aload 6
    //   175: invokespecial 393	net/lingala/zip4j/unzip/UnzipEngine:closeStreams	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   178: aload 8
    //   180: athrow
    //   181: astore 7
    //   183: new 20	net/lingala/zip4j/exception/ZipException
    //   186: dup
    //   187: aload 7
    //   189: invokespecial 95	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   192: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	193	0	this	UnzipEngine
    //   0	193	1	paramProgressMonitor	net.lingala.zip4j.progress.ProgressMonitor
    //   0	193	2	paramString1	String
    //   0	193	3	paramString2	String
    //   0	193	4	paramUnzipParameters	net.lingala.zip4j.model.UnzipParameters
    //   33	139	5	localZipInputStream	net.lingala.zip4j.io.ZipInputStream
    //   36	138	6	localFileOutputStream	FileOutputStream
    //   181	7	7	localException	Exception
    //   168	11	8	localObject	Object
    //   156	7	9	localIOException	IOException
    //   43	73	10	arrayOfByte	byte[]
    //   66	59	11	i	int
    // Exception table:
    //   from	to	target	type
    //   38	59	156	java/io/IOException
    //   59	68	156	java/io/IOException
    //   74	104	156	java/io/IOException
    //   113	147	156	java/io/IOException
    //   38	59	168	finally
    //   59	68	168	finally
    //   74	104	168	finally
    //   113	147	168	finally
    //   158	168	168	finally
    //   183	193	168	finally
    //   38	59	181	java/lang/Exception
    //   59	68	181	java/lang/Exception
    //   74	104	181	java/lang/Exception
    //   113	147	181	java/lang/Exception
  }
  
  public void updateCRC(int paramInt)
  {
    this.crc.update(paramInt);
  }
  
  public void updateCRC(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte != null) {
      this.crc.update(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/unzip/UnzipEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */