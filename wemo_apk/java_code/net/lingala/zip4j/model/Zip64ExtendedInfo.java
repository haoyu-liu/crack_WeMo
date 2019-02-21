package net.lingala.zip4j.model;

public class Zip64ExtendedInfo
{
  private long compressedSize = -1L;
  private int diskNumberStart = -1;
  private int header;
  private long offsetLocalHeader = -1L;
  private int size;
  private long unCompressedSize = -1L;
  
  public long getCompressedSize()
  {
    return this.compressedSize;
  }
  
  public int getDiskNumberStart()
  {
    return this.diskNumberStart;
  }
  
  public int getHeader()
  {
    return this.header;
  }
  
  public long getOffsetLocalHeader()
  {
    return this.offsetLocalHeader;
  }
  
  public int getSize()
  {
    return this.size;
  }
  
  public long getUnCompressedSize()
  {
    return this.unCompressedSize;
  }
  
  public void setCompressedSize(long paramLong)
  {
    this.compressedSize = paramLong;
  }
  
  public void setDiskNumberStart(int paramInt)
  {
    this.diskNumberStart = paramInt;
  }
  
  public void setHeader(int paramInt)
  {
    this.header = paramInt;
  }
  
  public void setOffsetLocalHeader(long paramLong)
  {
    this.offsetLocalHeader = paramLong;
  }
  
  public void setSize(int paramInt)
  {
    this.size = paramInt;
  }
  
  public void setUnCompressedSize(long paramLong)
  {
    this.unCompressedSize = paramLong;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/Zip64ExtendedInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */