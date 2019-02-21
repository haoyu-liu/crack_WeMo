package net.lingala.zip4j.model;

public class DataDescriptor
{
  private int compressedSize;
  private String crc32;
  private int uncompressedSize;
  
  public int getCompressedSize()
  {
    return this.compressedSize;
  }
  
  public String getCrc32()
  {
    return this.crc32;
  }
  
  public int getUncompressedSize()
  {
    return this.uncompressedSize;
  }
  
  public void setCompressedSize(int paramInt)
  {
    this.compressedSize = paramInt;
  }
  
  public void setCrc32(String paramString)
  {
    this.crc32 = paramString;
  }
  
  public void setUncompressedSize(int paramInt)
  {
    this.uncompressedSize = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/DataDescriptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */