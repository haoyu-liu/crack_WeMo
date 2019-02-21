package net.lingala.zip4j.model;

public class EndCentralDirRecord
{
  private String comment;
  private byte[] commentBytes;
  private int commentLength;
  private int noOfThisDisk;
  private int noOfThisDiskStartOfCentralDir;
  private long offsetOfStartOfCentralDir;
  private long signature;
  private int sizeOfCentralDir;
  private int totNoOfEntriesInCentralDir;
  private int totNoOfEntriesInCentralDirOnThisDisk;
  
  public String getComment()
  {
    return this.comment;
  }
  
  public byte[] getCommentBytes()
  {
    return this.commentBytes;
  }
  
  public int getCommentLength()
  {
    return this.commentLength;
  }
  
  public int getNoOfThisDisk()
  {
    return this.noOfThisDisk;
  }
  
  public int getNoOfThisDiskStartOfCentralDir()
  {
    return this.noOfThisDiskStartOfCentralDir;
  }
  
  public long getOffsetOfStartOfCentralDir()
  {
    return this.offsetOfStartOfCentralDir;
  }
  
  public long getSignature()
  {
    return this.signature;
  }
  
  public int getSizeOfCentralDir()
  {
    return this.sizeOfCentralDir;
  }
  
  public int getTotNoOfEntriesInCentralDir()
  {
    return this.totNoOfEntriesInCentralDir;
  }
  
  public int getTotNoOfEntriesInCentralDirOnThisDisk()
  {
    return this.totNoOfEntriesInCentralDirOnThisDisk;
  }
  
  public void setComment(String paramString)
  {
    this.comment = paramString;
  }
  
  public void setCommentBytes(byte[] paramArrayOfByte)
  {
    this.commentBytes = paramArrayOfByte;
  }
  
  public void setCommentLength(int paramInt)
  {
    this.commentLength = paramInt;
  }
  
  public void setNoOfThisDisk(int paramInt)
  {
    this.noOfThisDisk = paramInt;
  }
  
  public void setNoOfThisDiskStartOfCentralDir(int paramInt)
  {
    this.noOfThisDiskStartOfCentralDir = paramInt;
  }
  
  public void setOffsetOfStartOfCentralDir(long paramLong)
  {
    this.offsetOfStartOfCentralDir = paramLong;
  }
  
  public void setSignature(long paramLong)
  {
    this.signature = paramLong;
  }
  
  public void setSizeOfCentralDir(int paramInt)
  {
    this.sizeOfCentralDir = paramInt;
  }
  
  public void setTotNoOfEntriesInCentralDir(int paramInt)
  {
    this.totNoOfEntriesInCentralDir = paramInt;
  }
  
  public void setTotNoOfEntriesInCentralDirOnThisDisk(int paramInt)
  {
    this.totNoOfEntriesInCentralDirOnThisDisk = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/EndCentralDirRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */