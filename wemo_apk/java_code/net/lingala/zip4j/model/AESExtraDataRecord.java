package net.lingala.zip4j.model;

public class AESExtraDataRecord
{
  private int aesStrength = -1;
  private int compressionMethod = -1;
  private int dataSize = -1;
  private long signature = -1L;
  private String vendorID = null;
  private int versionNumber = -1;
  
  public int getAesStrength()
  {
    return this.aesStrength;
  }
  
  public int getCompressionMethod()
  {
    return this.compressionMethod;
  }
  
  public int getDataSize()
  {
    return this.dataSize;
  }
  
  public long getSignature()
  {
    return this.signature;
  }
  
  public String getVendorID()
  {
    return this.vendorID;
  }
  
  public int getVersionNumber()
  {
    return this.versionNumber;
  }
  
  public void setAesStrength(int paramInt)
  {
    this.aesStrength = paramInt;
  }
  
  public void setCompressionMethod(int paramInt)
  {
    this.compressionMethod = paramInt;
  }
  
  public void setDataSize(int paramInt)
  {
    this.dataSize = paramInt;
  }
  
  public void setSignature(long paramLong)
  {
    this.signature = paramLong;
  }
  
  public void setVendorID(String paramString)
  {
    this.vendorID = paramString;
  }
  
  public void setVersionNumber(int paramInt)
  {
    this.versionNumber = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/AESExtraDataRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */