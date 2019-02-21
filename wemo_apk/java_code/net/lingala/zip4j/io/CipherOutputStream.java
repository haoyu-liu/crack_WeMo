package net.lingala.zip4j.io;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.CRC32;
import net.lingala.zip4j.core.HeaderWriter;
import net.lingala.zip4j.crypto.AESEncrpyter;
import net.lingala.zip4j.crypto.IEncrypter;
import net.lingala.zip4j.crypto.StandardEncrypter;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.AESExtraDataRecord;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.LocalFileHeader;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Raw;
import net.lingala.zip4j.util.Zip4jUtil;

public class CipherOutputStream
  extends BaseOutputStream
{
  private long bytesWrittenForThisFile;
  protected CRC32 crc;
  private IEncrypter encrypter;
  protected FileHeader fileHeader;
  protected LocalFileHeader localFileHeader;
  protected OutputStream outputStream;
  private byte[] pendingBuffer;
  private int pendingBufferLength;
  private File sourceFile;
  private long totalBytesRead;
  private long totalBytesWritten;
  protected ZipModel zipModel;
  protected ZipParameters zipParameters;
  
  public CipherOutputStream(OutputStream paramOutputStream, ZipModel paramZipModel)
  {
    this.outputStream = paramOutputStream;
    initZipModel(paramZipModel);
    this.crc = new CRC32();
    this.totalBytesWritten = 0L;
    this.bytesWrittenForThisFile = 0L;
    this.pendingBuffer = new byte[16];
    this.pendingBufferLength = 0;
    this.totalBytesRead = 0L;
  }
  
  private void createFileHeader()
    throws ZipException
  {
    this.fileHeader = new FileHeader();
    this.fileHeader.setSignature(33639248);
    this.fileHeader.setVersionMadeBy(20);
    this.fileHeader.setVersionNeededToExtract(20);
    if ((this.zipParameters.isEncryptFiles()) && (this.zipParameters.getEncryptionMethod() == 99))
    {
      this.fileHeader.setCompressionMethod(99);
      this.fileHeader.setAesExtraDataRecord(generateAESExtraDataRecord(this.zipParameters));
    }
    for (;;)
    {
      if (this.zipParameters.isEncryptFiles())
      {
        this.fileHeader.setEncrypted(true);
        this.fileHeader.setEncryptionMethod(this.zipParameters.getEncryptionMethod());
      }
      if (!this.zipParameters.isSourceExternalStream()) {
        break label205;
      }
      this.fileHeader.setLastModFileTime((int)Zip4jUtil.javaToDosTime(System.currentTimeMillis()));
      if (Zip4jUtil.isStringNotNullAndNotEmpty(this.zipParameters.getFileNameInZip())) {
        break;
      }
      throw new ZipException("fileNameInZip is null or empty");
      this.fileHeader.setCompressionMethod(this.zipParameters.getCompressionMethod());
    }
    for (String str = this.zipParameters.getFileNameInZip(); !Zip4jUtil.isStringNotNullAndNotEmpty(str); str = Zip4jUtil.getRelativeFileName(this.sourceFile.getAbsolutePath(), this.zipParameters.getRootFolderInZip(), this.zipParameters.getDefaultFolderPath()))
    {
      throw new ZipException("fileName is null or empty. unable to create file header");
      label205:
      this.fileHeader.setLastModFileTime((int)Zip4jUtil.javaToDosTime(Zip4jUtil.getLastModifiedFileTime(this.sourceFile, this.zipParameters.getTimeZone())));
      this.fileHeader.setUncompressedSize(this.sourceFile.length());
    }
    this.fileHeader.setFileName(str);
    label338:
    boolean bool3;
    label418:
    label425:
    label451:
    byte[] arrayOfByte2;
    if (Zip4jUtil.isStringNotNullAndNotEmpty(this.zipModel.getFileNameCharset()))
    {
      this.fileHeader.setFileNameLength(Zip4jUtil.getEncodedStringLength(str, this.zipModel.getFileNameCharset()));
      if (!(this.outputStream instanceof SplitOutputStream)) {
        break label601;
      }
      this.fileHeader.setDiskNumberStart(((SplitOutputStream)this.outputStream).getCurrSplitFileCounter());
      boolean bool1 = this.zipParameters.isSourceExternalStream();
      int i = 0;
      if (!bool1) {
        i = getFileAttributes(this.sourceFile);
      }
      byte[] arrayOfByte1 = new byte[4];
      arrayOfByte1[0] = ((byte)i);
      this.fileHeader.setExternalFileAttr(arrayOfByte1);
      if (!this.zipParameters.isSourceExternalStream()) {
        break label618;
      }
      FileHeader localFileHeader1 = this.fileHeader;
      if ((str.endsWith("/")) || (str.endsWith("\\"))) {
        break label612;
      }
      bool3 = false;
      localFileHeader1.setDirectory(bool3);
      if (!this.fileHeader.isDirectory()) {
        break label635;
      }
      this.fileHeader.setCompressedSize(0L);
      this.fileHeader.setUncompressedSize(0L);
      if ((this.zipParameters.isEncryptFiles()) && (this.zipParameters.getEncryptionMethod() == 0)) {
        this.fileHeader.setCrc32(this.zipParameters.getSourceFileCRC());
      }
      arrayOfByte2 = new byte[2];
      arrayOfByte2[0] = Raw.bitArrayToByte(generateGeneralPurposeBitArray(this.fileHeader.isEncrypted(), this.zipParameters.getCompressionMethod()));
      boolean bool2 = Zip4jUtil.isStringNotNullAndNotEmpty(this.zipModel.getFileNameCharset());
      if (((!bool2) || (!this.zipModel.getFileNameCharset().equalsIgnoreCase("UTF8"))) && ((bool2) || (!Zip4jUtil.detectCharSet(this.fileHeader.getFileName()).equals("UTF8")))) {
        break label812;
      }
      arrayOfByte2[1] = 8;
    }
    for (;;)
    {
      this.fileHeader.setGeneralPurposeFlag(arrayOfByte2);
      return;
      this.fileHeader.setFileNameLength(Zip4jUtil.getEncodedStringLength(str));
      break;
      label601:
      this.fileHeader.setDiskNumberStart(0);
      break label338;
      label612:
      bool3 = true;
      break label418;
      label618:
      this.fileHeader.setDirectory(this.sourceFile.isDirectory());
      break label425;
      label635:
      if (this.zipParameters.isSourceExternalStream()) {
        break label451;
      }
      long l = Zip4jUtil.getFileLengh(this.sourceFile);
      if (this.zipParameters.getCompressionMethod() == 0) {
        if (this.zipParameters.getEncryptionMethod() == 0) {
          this.fileHeader.setCompressedSize(12L + l);
        }
      }
      for (;;)
      {
        this.fileHeader.setUncompressedSize(l);
        break;
        if (this.zipParameters.getEncryptionMethod() == 99)
        {
          switch (this.zipParameters.getAesKeyStrength())
          {
          case 2: 
          default: 
            throw new ZipException("invalid aes key strength, cannot determine key sizes");
          }
          for (int j = 8;; j = 16)
          {
            this.fileHeader.setCompressedSize(2L + (10L + (l + j)));
            break;
          }
        }
        this.fileHeader.setCompressedSize(0L);
        continue;
        this.fileHeader.setCompressedSize(0L);
      }
      label812:
      arrayOfByte2[1] = 0;
    }
  }
  
  private void createLocalFileHeader()
    throws ZipException
  {
    if (this.fileHeader == null) {
      throw new ZipException("file header is null, cannot create local file header");
    }
    this.localFileHeader = new LocalFileHeader();
    this.localFileHeader.setSignature(67324752);
    this.localFileHeader.setVersionNeededToExtract(this.fileHeader.getVersionNeededToExtract());
    this.localFileHeader.setCompressionMethod(this.fileHeader.getCompressionMethod());
    this.localFileHeader.setLastModFileTime(this.fileHeader.getLastModFileTime());
    this.localFileHeader.setUncompressedSize(this.fileHeader.getUncompressedSize());
    this.localFileHeader.setFileNameLength(this.fileHeader.getFileNameLength());
    this.localFileHeader.setFileName(this.fileHeader.getFileName());
    this.localFileHeader.setEncrypted(this.fileHeader.isEncrypted());
    this.localFileHeader.setEncryptionMethod(this.fileHeader.getEncryptionMethod());
    this.localFileHeader.setAesExtraDataRecord(this.fileHeader.getAesExtraDataRecord());
    this.localFileHeader.setCrc32(this.fileHeader.getCrc32());
    this.localFileHeader.setCompressedSize(this.fileHeader.getCompressedSize());
    this.localFileHeader.setGeneralPurposeFlag((byte[])this.fileHeader.getGeneralPurposeFlag().clone());
  }
  
  private void encryptAndWrite(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.encrypter != null) {}
    try
    {
      this.encrypter.encryptData(paramArrayOfByte, paramInt1, paramInt2);
      this.outputStream.write(paramArrayOfByte, paramInt1, paramInt2);
      this.totalBytesWritten += paramInt2;
      this.bytesWrittenForThisFile += paramInt2;
      return;
    }
    catch (ZipException localZipException)
    {
      throw new IOException(localZipException.getMessage());
    }
  }
  
  private AESExtraDataRecord generateAESExtraDataRecord(ZipParameters paramZipParameters)
    throws ZipException
  {
    if (paramZipParameters == null) {
      throw new ZipException("zip parameters are null, cannot generate AES Extra Data record");
    }
    AESExtraDataRecord localAESExtraDataRecord = new AESExtraDataRecord();
    localAESExtraDataRecord.setSignature(39169L);
    localAESExtraDataRecord.setDataSize(7);
    localAESExtraDataRecord.setVendorID("AE");
    localAESExtraDataRecord.setVersionNumber(2);
    if (paramZipParameters.getAesKeyStrength() == 1) {
      localAESExtraDataRecord.setAesStrength(1);
    }
    for (;;)
    {
      localAESExtraDataRecord.setCompressionMethod(paramZipParameters.getCompressionMethod());
      return localAESExtraDataRecord;
      if (paramZipParameters.getAesKeyStrength() != 3) {
        break;
      }
      localAESExtraDataRecord.setAesStrength(3);
    }
    throw new ZipException("invalid AES key strength, cannot generate AES Extra data record");
  }
  
  private int[] generateGeneralPurposeBitArray(boolean paramBoolean, int paramInt)
  {
    int[] arrayOfInt = new int[8];
    if (paramBoolean) {
      arrayOfInt[0] = 1;
    }
    for (;;)
    {
      if (paramInt != 8)
      {
        arrayOfInt[1] = 0;
        arrayOfInt[2] = 0;
      }
      arrayOfInt[3] = 1;
      return arrayOfInt;
      arrayOfInt[0] = 0;
    }
  }
  
  private int getFileAttributes(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input file is null, cannot get file attributes");
    }
    if (!paramFile.exists()) {}
    do
    {
      return 0;
      if (paramFile.isDirectory())
      {
        if (paramFile.isHidden()) {
          return 18;
        }
        return 16;
      }
      if ((!paramFile.canWrite()) && (paramFile.isHidden())) {
        return 3;
      }
      if (!paramFile.canWrite()) {
        return 1;
      }
    } while (!paramFile.isHidden());
    return 2;
  }
  
  private void initEncrypter()
    throws ZipException
  {
    if (!this.zipParameters.isEncryptFiles())
    {
      this.encrypter = null;
      return;
    }
    switch (this.zipParameters.getEncryptionMethod())
    {
    default: 
      throw new ZipException("invalid encprytion method");
    case 0: 
      this.encrypter = new StandardEncrypter(this.zipParameters.getPassword(), (0xFFFF & this.localFileHeader.getLastModFileTime()) << 16);
      return;
    }
    this.encrypter = new AESEncrpyter(this.zipParameters.getPassword(), this.zipParameters.getAesKeyStrength());
  }
  
  private void initZipModel(ZipModel paramZipModel)
  {
    if (paramZipModel == null) {}
    for (this.zipModel = new ZipModel();; this.zipModel = paramZipModel)
    {
      if (this.zipModel.getEndCentralDirRecord() == null) {
        this.zipModel.setEndCentralDirRecord(new EndCentralDirRecord());
      }
      if (this.zipModel.getCentralDirectory() == null) {
        this.zipModel.setCentralDirectory(new CentralDirectory());
      }
      if (this.zipModel.getCentralDirectory().getFileHeaders() == null) {
        this.zipModel.getCentralDirectory().setFileHeaders(new ArrayList());
      }
      if (this.zipModel.getLocalFileHeaderList() == null) {
        this.zipModel.setLocalFileHeaderList(new ArrayList());
      }
      if (((this.outputStream instanceof SplitOutputStream)) && (((SplitOutputStream)this.outputStream).isSplitZipFile()))
      {
        this.zipModel.setSplitArchive(true);
        this.zipModel.setSplitLength(((SplitOutputStream)this.outputStream).getSplitLength());
      }
      this.zipModel.getEndCentralDirRecord().setSignature(101010256L);
      return;
    }
  }
  
  public void close()
    throws IOException
  {
    if (this.outputStream != null) {
      this.outputStream.close();
    }
  }
  
  public void closeEntry()
    throws IOException, ZipException
  {
    if (this.pendingBufferLength != 0)
    {
      encryptAndWrite(this.pendingBuffer, 0, this.pendingBufferLength);
      this.pendingBufferLength = 0;
    }
    long l;
    if ((this.zipParameters.isEncryptFiles()) && (this.zipParameters.getEncryptionMethod() == 99))
    {
      if ((this.encrypter instanceof AESEncrpyter))
      {
        this.outputStream.write(((AESEncrpyter)this.encrypter).getFinalMac());
        this.bytesWrittenForThisFile = (10L + this.bytesWrittenForThisFile);
        this.totalBytesWritten = (10L + this.totalBytesWritten);
      }
    }
    else
    {
      this.fileHeader.setCompressedSize(this.bytesWrittenForThisFile);
      this.localFileHeader.setCompressedSize(this.bytesWrittenForThisFile);
      if (this.zipParameters.isSourceExternalStream())
      {
        this.fileHeader.setUncompressedSize(this.totalBytesRead);
        if (this.localFileHeader.getUncompressedSize() != this.totalBytesRead) {
          this.localFileHeader.setUncompressedSize(this.totalBytesRead);
        }
      }
      l = this.crc.getValue();
      if ((this.fileHeader.isEncrypted()) && (this.fileHeader.getEncryptionMethod() == 99)) {
        l = 0L;
      }
      if ((!this.zipParameters.isEncryptFiles()) || (this.zipParameters.getEncryptionMethod() != 99)) {
        break label338;
      }
      this.fileHeader.setCrc32(0L);
      this.localFileHeader.setCrc32(0L);
    }
    for (;;)
    {
      this.zipModel.getLocalFileHeaderList().add(this.localFileHeader);
      this.zipModel.getCentralDirectory().getFileHeaders().add(this.fileHeader);
      HeaderWriter localHeaderWriter = new HeaderWriter();
      this.totalBytesWritten += localHeaderWriter.writeExtendedLocalHeader(this.localFileHeader, this.outputStream);
      this.crc.reset();
      this.bytesWrittenForThisFile = 0L;
      this.encrypter = null;
      this.totalBytesRead = 0L;
      return;
      throw new ZipException("invalid encrypter for AES encrypted file");
      label338:
      this.fileHeader.setCrc32(l);
      this.localFileHeader.setCrc32(l);
    }
  }
  
  public void decrementCompressedFileSize(int paramInt)
  {
    if (paramInt <= 0) {}
    while (paramInt > this.bytesWrittenForThisFile) {
      return;
    }
    this.bytesWrittenForThisFile -= paramInt;
  }
  
  public void finish()
    throws IOException, ZipException
  {
    this.zipModel.getEndCentralDirRecord().setOffsetOfStartOfCentralDir(this.totalBytesWritten);
    new HeaderWriter().finalizeZipFile(this.zipModel, this.outputStream);
  }
  
  public File getSourceFile()
  {
    return this.sourceFile;
  }
  
  public void putNextEntry(File paramFile, ZipParameters paramZipParameters)
    throws ZipException
  {
    if ((!paramZipParameters.isSourceExternalStream()) && (paramFile == null)) {
      throw new ZipException("input file is null");
    }
    if ((!paramZipParameters.isSourceExternalStream()) && (!Zip4jUtil.checkFileExists(paramFile))) {
      throw new ZipException("input file does not exist");
    }
    for (;;)
    {
      try
      {
        this.sourceFile = paramFile;
        this.zipParameters = ((ZipParameters)paramZipParameters.clone());
        if (!paramZipParameters.isSourceExternalStream())
        {
          if (this.sourceFile.isDirectory())
          {
            this.zipParameters.setEncryptFiles(false);
            this.zipParameters.setEncryptionMethod(-1);
            this.zipParameters.setCompressionMethod(0);
          }
          createFileHeader();
          createLocalFileHeader();
          if ((this.zipModel.isSplitArchive()) && ((this.zipModel.getCentralDirectory() == null) || (this.zipModel.getCentralDirectory().getFileHeaders() == null) || (this.zipModel.getCentralDirectory().getFileHeaders().size() == 0)))
          {
            byte[] arrayOfByte4 = new byte[4];
            Raw.writeIntLittleEndian(arrayOfByte4, 0, 134695760);
            this.outputStream.write(arrayOfByte4);
            this.totalBytesWritten = (4L + this.totalBytesWritten);
          }
          if (!(this.outputStream instanceof SplitOutputStream)) {
            break label474;
          }
          if (this.totalBytesWritten == 4L)
          {
            this.fileHeader.setOffsetLocalHeader(4L);
            HeaderWriter localHeaderWriter = new HeaderWriter();
            this.totalBytesWritten += localHeaderWriter.writeLocalFileHeader(this.zipModel, this.localFileHeader, this.outputStream);
            if (this.zipParameters.isEncryptFiles())
            {
              initEncrypter();
              if (this.encrypter != null)
              {
                if (paramZipParameters.getEncryptionMethod() != 0) {
                  break label512;
                }
                byte[] arrayOfByte3 = ((StandardEncrypter)this.encrypter).getHeaderBytes();
                this.outputStream.write(arrayOfByte3);
                this.totalBytesWritten += arrayOfByte3.length;
                this.bytesWrittenForThisFile += arrayOfByte3.length;
              }
            }
            this.crc.reset();
          }
        }
        else if (!Zip4jUtil.isStringNotNullAndNotEmpty(this.zipParameters.getFileNameInZip()))
        {
          throw new ZipException("file name is empty for external stream");
        }
      }
      catch (CloneNotSupportedException localCloneNotSupportedException)
      {
        throw new ZipException(localCloneNotSupportedException);
        if ((!this.zipParameters.getFileNameInZip().endsWith("/")) && (!this.zipParameters.getFileNameInZip().endsWith("\\"))) {
          continue;
        }
        this.zipParameters.setEncryptFiles(false);
        this.zipParameters.setEncryptionMethod(-1);
        this.zipParameters.setCompressionMethod(0);
        continue;
      }
      catch (ZipException localZipException)
      {
        throw localZipException;
        this.fileHeader.setOffsetLocalHeader(((SplitOutputStream)this.outputStream).getFilePointer());
        continue;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
      label474:
      if (this.totalBytesWritten == 4L)
      {
        this.fileHeader.setOffsetLocalHeader(4L);
      }
      else
      {
        this.fileHeader.setOffsetLocalHeader(this.totalBytesWritten);
        continue;
        label512:
        if (paramZipParameters.getEncryptionMethod() == 99)
        {
          byte[] arrayOfByte1 = ((AESEncrpyter)this.encrypter).getSaltBytes();
          byte[] arrayOfByte2 = ((AESEncrpyter)this.encrypter).getDerivedPasswordVerifier();
          this.outputStream.write(arrayOfByte1);
          this.outputStream.write(arrayOfByte2);
          this.totalBytesWritten += arrayOfByte1.length + arrayOfByte2.length;
          this.bytesWrittenForThisFile += arrayOfByte1.length + arrayOfByte2.length;
        }
      }
    }
  }
  
  public void setSourceFile(File paramFile)
  {
    this.sourceFile = paramFile;
  }
  
  protected void updateTotalBytesRead(int paramInt)
  {
    if (paramInt > 0) {
      this.totalBytesRead += paramInt;
    }
  }
  
  public void write(int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[1];
    arrayOfByte[0] = ((byte)paramInt);
    write(arrayOfByte, 0, 1);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException();
    }
    if (paramArrayOfByte.length == 0) {
      return;
    }
    write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 == 0) {}
    do
    {
      return;
      if ((this.zipParameters.isEncryptFiles()) && (this.zipParameters.getEncryptionMethod() == 99))
      {
        if (this.pendingBufferLength != 0)
        {
          if (paramInt2 < 16 - this.pendingBufferLength) {
            break;
          }
          System.arraycopy(paramArrayOfByte, paramInt1, this.pendingBuffer, this.pendingBufferLength, 16 - this.pendingBufferLength);
          encryptAndWrite(this.pendingBuffer, 0, this.pendingBuffer.length);
          paramInt1 = 16 - this.pendingBufferLength;
          paramInt2 -= paramInt1;
          this.pendingBufferLength = 0;
        }
        if ((paramInt2 != 0) && (paramInt2 % 16 != 0))
        {
          System.arraycopy(paramArrayOfByte, paramInt2 + paramInt1 - paramInt2 % 16, this.pendingBuffer, 0, paramInt2 % 16);
          this.pendingBufferLength = (paramInt2 % 16);
          paramInt2 -= this.pendingBufferLength;
        }
      }
    } while (paramInt2 == 0);
    encryptAndWrite(paramArrayOfByte, paramInt1, paramInt2);
    return;
    System.arraycopy(paramArrayOfByte, paramInt1, this.pendingBuffer, this.pendingBufferLength, paramInt2);
    this.pendingBufferLength = (paramInt2 + this.pendingBufferLength);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/io/CipherOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */