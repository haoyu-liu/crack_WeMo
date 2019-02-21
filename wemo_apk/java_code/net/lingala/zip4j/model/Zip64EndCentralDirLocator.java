package net.lingala.zip4j.model;

public class Zip64EndCentralDirLocator
{
  private int noOfDiskStartOfZip64EndOfCentralDirRec;
  private long offsetZip64EndOfCentralDirRec;
  private long signature;
  private int totNumberOfDiscs;
  
  public int getNoOfDiskStartOfZip64EndOfCentralDirRec()
  {
    return this.noOfDiskStartOfZip64EndOfCentralDirRec;
  }
  
  public long getOffsetZip64EndOfCentralDirRec()
  {
    return this.offsetZip64EndOfCentralDirRec;
  }
  
  public long getSignature()
  {
    return this.signature;
  }
  
  public int getTotNumberOfDiscs()
  {
    return this.totNumberOfDiscs;
  }
  
  public void setNoOfDiskStartOfZip64EndOfCentralDirRec(int paramInt)
  {
    this.noOfDiskStartOfZip64EndOfCentralDirRec = paramInt;
  }
  
  public void setOffsetZip64EndOfCentralDirRec(long paramLong)
  {
    this.offsetZip64EndOfCentralDirRec = paramLong;
  }
  
  public void setSignature(long paramLong)
  {
    this.signature = paramLong;
  }
  
  public void setTotNumberOfDiscs(int paramInt)
  {
    this.totNumberOfDiscs = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/Zip64EndCentralDirLocator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */