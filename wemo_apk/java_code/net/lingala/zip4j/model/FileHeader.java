package net.lingala.zip4j.model;

import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.progress.ProgressMonitor;
import net.lingala.zip4j.unzip.Unzip;
import net.lingala.zip4j.util.Zip4jUtil;

public class FileHeader
{
  private AESExtraDataRecord aesExtraDataRecord;
  private long compressedSize;
  private int compressionMethod;
  private long crc32 = 0L;
  private byte[] crcBuff;
  private boolean dataDescriptorExists;
  private int diskNumberStart;
  private int encryptionMethod = -1;
  private byte[] externalFileAttr;
  private ArrayList extraDataRecords;
  private int extraFieldLength;
  private String fileComment;
  private int fileCommentLength;
  private String fileName;
  private int fileNameLength;
  private boolean fileNameUTF8Encoded;
  private byte[] generalPurposeFlag;
  private byte[] internalFileAttr;
  private boolean isDirectory;
  private boolean isEncrypted;
  private int lastModFileTime;
  private long offsetLocalHeader;
  private char[] password;
  private int signature;
  private long uncompressedSize = 0L;
  private int versionMadeBy;
  private int versionNeededToExtract;
  private Zip64ExtendedInfo zip64ExtendedInfo;
  
  public void extractFile(ZipModel paramZipModel, String paramString1, UnzipParameters paramUnzipParameters, String paramString2, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("input zipModel is null");
    }
    if (!Zip4jUtil.checkOutputFolder(paramString1)) {
      throw new ZipException("Invalid output path");
    }
    if (this == null) {
      throw new ZipException("invalid file header");
    }
    new Unzip(paramZipModel).extractFile(this, paramString1, paramUnzipParameters, paramString2, paramProgressMonitor, paramBoolean);
  }
  
  public void extractFile(ZipModel paramZipModel, String paramString, UnzipParameters paramUnzipParameters, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    extractFile(paramZipModel, paramString, paramUnzipParameters, null, paramProgressMonitor, paramBoolean);
  }
  
  public void extractFile(ZipModel paramZipModel, String paramString, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    extractFile(paramZipModel, paramString, null, paramProgressMonitor, paramBoolean);
  }
  
  public AESExtraDataRecord getAesExtraDataRecord()
  {
    return this.aesExtraDataRecord;
  }
  
  public long getCompressedSize()
  {
    return this.compressedSize;
  }
  
  public int getCompressionMethod()
  {
    return this.compressionMethod;
  }
  
  public long getCrc32()
  {
    return 0xFFFFFFFF & this.crc32;
  }
  
  public byte[] getCrcBuff()
  {
    return this.crcBuff;
  }
  
  public int getDiskNumberStart()
  {
    return this.diskNumberStart;
  }
  
  public int getEncryptionMethod()
  {
    return this.encryptionMethod;
  }
  
  public byte[] getExternalFileAttr()
  {
    return this.externalFileAttr;
  }
  
  public ArrayList getExtraDataRecords()
  {
    return this.extraDataRecords;
  }
  
  public int getExtraFieldLength()
  {
    return this.extraFieldLength;
  }
  
  public String getFileComment()
  {
    return this.fileComment;
  }
  
  public int getFileCommentLength()
  {
    return this.fileCommentLength;
  }
  
  public String getFileName()
  {
    return this.fileName;
  }
  
  public int getFileNameLength()
  {
    return this.fileNameLength;
  }
  
  public byte[] getGeneralPurposeFlag()
  {
    return this.generalPurposeFlag;
  }
  
  public byte[] getInternalFileAttr()
  {
    return this.internalFileAttr;
  }
  
  public int getLastModFileTime()
  {
    return this.lastModFileTime;
  }
  
  public long getOffsetLocalHeader()
  {
    return this.offsetLocalHeader;
  }
  
  public char[] getPassword()
  {
    return this.password;
  }
  
  public int getSignature()
  {
    return this.signature;
  }
  
  public long getUncompressedSize()
  {
    return this.uncompressedSize;
  }
  
  public int getVersionMadeBy()
  {
    return this.versionMadeBy;
  }
  
  public int getVersionNeededToExtract()
  {
    return this.versionNeededToExtract;
  }
  
  public Zip64ExtendedInfo getZip64ExtendedInfo()
  {
    return this.zip64ExtendedInfo;
  }
  
  public boolean isDataDescriptorExists()
  {
    return this.dataDescriptorExists;
  }
  
  public boolean isDirectory()
  {
    return this.isDirectory;
  }
  
  public boolean isEncrypted()
  {
    return this.isEncrypted;
  }
  
  public boolean isFileNameUTF8Encoded()
  {
    return this.fileNameUTF8Encoded;
  }
  
  public void setAesExtraDataRecord(AESExtraDataRecord paramAESExtraDataRecord)
  {
    this.aesExtraDataRecord = paramAESExtraDataRecord;
  }
  
  public void setCompressedSize(long paramLong)
  {
    this.compressedSize = paramLong;
  }
  
  public void setCompressionMethod(int paramInt)
  {
    this.compressionMethod = paramInt;
  }
  
  public void setCrc32(long paramLong)
  {
    this.crc32 = paramLong;
  }
  
  public void setCrcBuff(byte[] paramArrayOfByte)
  {
    this.crcBuff = paramArrayOfByte;
  }
  
  public void setDataDescriptorExists(boolean paramBoolean)
  {
    this.dataDescriptorExists = paramBoolean;
  }
  
  public void setDirectory(boolean paramBoolean)
  {
    this.isDirectory = paramBoolean;
  }
  
  public void setDiskNumberStart(int paramInt)
  {
    this.diskNumberStart = paramInt;
  }
  
  public void setEncrypted(boolean paramBoolean)
  {
    this.isEncrypted = paramBoolean;
  }
  
  public void setEncryptionMethod(int paramInt)
  {
    this.encryptionMethod = paramInt;
  }
  
  public void setExternalFileAttr(byte[] paramArrayOfByte)
  {
    this.externalFileAttr = paramArrayOfByte;
  }
  
  public void setExtraDataRecords(ArrayList paramArrayList)
  {
    this.extraDataRecords = paramArrayList;
  }
  
  public void setExtraFieldLength(int paramInt)
  {
    this.extraFieldLength = paramInt;
  }
  
  public void setFileComment(String paramString)
  {
    this.fileComment = paramString;
  }
  
  public void setFileCommentLength(int paramInt)
  {
    this.fileCommentLength = paramInt;
  }
  
  public void setFileName(String paramString)
  {
    this.fileName = paramString;
  }
  
  public void setFileNameLength(int paramInt)
  {
    this.fileNameLength = paramInt;
  }
  
  public void setFileNameUTF8Encoded(boolean paramBoolean)
  {
    this.fileNameUTF8Encoded = paramBoolean;
  }
  
  public void setGeneralPurposeFlag(byte[] paramArrayOfByte)
  {
    this.generalPurposeFlag = paramArrayOfByte;
  }
  
  public void setInternalFileAttr(byte[] paramArrayOfByte)
  {
    this.internalFileAttr = paramArrayOfByte;
  }
  
  public void setLastModFileTime(int paramInt)
  {
    this.lastModFileTime = paramInt;
  }
  
  public void setOffsetLocalHeader(long paramLong)
  {
    this.offsetLocalHeader = paramLong;
  }
  
  public void setPassword(char[] paramArrayOfChar)
  {
    this.password = paramArrayOfChar;
  }
  
  public void setSignature(int paramInt)
  {
    this.signature = paramInt;
  }
  
  public void setUncompressedSize(long paramLong)
  {
    this.uncompressedSize = paramLong;
  }
  
  public void setVersionMadeBy(int paramInt)
  {
    this.versionMadeBy = paramInt;
  }
  
  public void setVersionNeededToExtract(int paramInt)
  {
    this.versionNeededToExtract = paramInt;
  }
  
  public void setZip64ExtendedInfo(Zip64ExtendedInfo paramZip64ExtendedInfo)
  {
    this.zip64ExtendedInfo = paramZip64ExtendedInfo;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/FileHeader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */