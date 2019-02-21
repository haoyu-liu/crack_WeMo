package net.lingala.zip4j.model;

public class Zip64EndCentralDirRecord
{
  private byte[] extensibleDataSector;
  private int noOfThisDisk;
  private int noOfThisDiskStartOfCentralDir;
  private long offsetStartCenDirWRTStartDiskNo;
  private long signature;
  private long sizeOfCentralDir;
  private long sizeOfZip64EndCentralDirRec;
  private long totNoOfEntriesInCentralDir;
  private long totNoOfEntriesInCentralDirOnThisDisk;
  private int versionMadeBy;
  private int versionNeededToExtract;
  
  public byte[] getExtensibleDataSector()
  {
    return this.extensibleDataSector;
  }
  
  public int getNoOfThisDisk()
  {
    return this.noOfThisDisk;
  }
  
  public int getNoOfThisDiskStartOfCentralDir()
  {
    return this.noOfThisDiskStartOfCentralDir;
  }
  
  public long getOffsetStartCenDirWRTStartDiskNo()
  {
    return this.offsetStartCenDirWRTStartDiskNo;
  }
  
  public long getSignature()
  {
    return this.signature;
  }
  
  public long getSizeOfCentralDir()
  {
    return this.sizeOfCentralDir;
  }
  
  public long getSizeOfZip64EndCentralDirRec()
  {
    return this.sizeOfZip64EndCentralDirRec;
  }
  
  public long getTotNoOfEntriesInCentralDir()
  {
    return this.totNoOfEntriesInCentralDir;
  }
  
  public long getTotNoOfEntriesInCentralDirOnThisDisk()
  {
    return this.totNoOfEntriesInCentralDirOnThisDisk;
  }
  
  public int getVersionMadeBy()
  {
    return this.versionMadeBy;
  }
  
  public int getVersionNeededToExtract()
  {
    return this.versionNeededToExtract;
  }
  
  public void setExtensibleDataSector(byte[] paramArrayOfByte)
  {
    this.extensibleDataSector = paramArrayOfByte;
  }
  
  public void setNoOfThisDisk(int paramInt)
  {
    this.noOfThisDisk = paramInt;
  }
  
  public void setNoOfThisDiskStartOfCentralDir(int paramInt)
  {
    this.noOfThisDiskStartOfCentralDir = paramInt;
  }
  
  public void setOffsetStartCenDirWRTStartDiskNo(long paramLong)
  {
    this.offsetStartCenDirWRTStartDiskNo = paramLong;
  }
  
  public void setSignature(long paramLong)
  {
    this.signature = paramLong;
  }
  
  public void setSizeOfCentralDir(long paramLong)
  {
    this.sizeOfCentralDir = paramLong;
  }
  
  public void setSizeOfZip64EndCentralDirRec(long paramLong)
  {
    this.sizeOfZip64EndCentralDirRec = paramLong;
  }
  
  public void setTotNoOfEntriesInCentralDir(long paramLong)
  {
    this.totNoOfEntriesInCentralDir = paramLong;
  }
  
  public void setTotNoOfEntriesInCentralDirOnThisDisk(long paramLong)
  {
    this.totNoOfEntriesInCentralDirOnThisDisk = paramLong;
  }
  
  public void setVersionMadeBy(int paramInt)
  {
    this.versionMadeBy = paramInt;
  }
  
  public void setVersionNeededToExtract(int paramInt)
  {
    this.versionNeededToExtract = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/Zip64EndCentralDirRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */