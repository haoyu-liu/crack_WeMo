package net.lingala.zip4j.model;

import java.util.ArrayList;

public class LocalFileHeader
{
  private AESExtraDataRecord aesExtraDataRecord;
  private long compressedSize;
  private int compressionMethod;
  private long crc32 = 0L;
  private byte[] crcBuff;
  private boolean dataDescriptorExists;
  private int encryptionMethod = -1;
  private ArrayList extraDataRecords;
  private byte[] extraField;
  private int extraFieldLength;
  private String fileName;
  private int fileNameLength;
  private boolean fileNameUTF8Encoded;
  private byte[] generalPurposeFlag;
  private boolean isEncrypted;
  private int lastModFileTime;
  private long offsetStartOfData;
  private char[] password;
  private int signature;
  private long uncompressedSize = 0L;
  private int versionNeededToExtract;
  private boolean writeComprSizeInZip64ExtraRecord = false;
  private Zip64ExtendedInfo zip64ExtendedInfo;
  
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
    return this.crc32;
  }
  
  public byte[] getCrcBuff()
  {
    return this.crcBuff;
  }
  
  public int getEncryptionMethod()
  {
    return this.encryptionMethod;
  }
  
  public ArrayList getExtraDataRecords()
  {
    return this.extraDataRecords;
  }
  
  public byte[] getExtraField()
  {
    return this.extraField;
  }
  
  public int getExtraFieldLength()
  {
    return this.extraFieldLength;
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
  
  public int getLastModFileTime()
  {
    return this.lastModFileTime;
  }
  
  public long getOffsetStartOfData()
  {
    return this.offsetStartOfData;
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
  
  public boolean isEncrypted()
  {
    return this.isEncrypted;
  }
  
  public boolean isFileNameUTF8Encoded()
  {
    return this.fileNameUTF8Encoded;
  }
  
  public boolean isWriteComprSizeInZip64ExtraRecord()
  {
    return this.writeComprSizeInZip64ExtraRecord;
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
  
  public void setEncrypted(boolean paramBoolean)
  {
    this.isEncrypted = paramBoolean;
  }
  
  public void setEncryptionMethod(int paramInt)
  {
    this.encryptionMethod = paramInt;
  }
  
  public void setExtraDataRecords(ArrayList paramArrayList)
  {
    this.extraDataRecords = paramArrayList;
  }
  
  public void setExtraField(byte[] paramArrayOfByte)
  {
    this.extraField = paramArrayOfByte;
  }
  
  public void setExtraFieldLength(int paramInt)
  {
    this.extraFieldLength = paramInt;
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
  
  public void setLastModFileTime(int paramInt)
  {
    this.lastModFileTime = paramInt;
  }
  
  public void setOffsetStartOfData(long paramLong)
  {
    this.offsetStartOfData = paramLong;
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
  
  public void setVersionNeededToExtract(int paramInt)
  {
    this.versionNeededToExtract = paramInt;
  }
  
  public void setWriteComprSizeInZip64ExtraRecord(boolean paramBoolean)
  {
    this.writeComprSizeInZip64ExtraRecord = paramBoolean;
  }
  
  public void setZip64ExtendedInfo(Zip64ExtendedInfo paramZip64ExtendedInfo)
  {
    this.zip64ExtendedInfo = paramZip64ExtendedInfo;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/LocalFileHeader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */