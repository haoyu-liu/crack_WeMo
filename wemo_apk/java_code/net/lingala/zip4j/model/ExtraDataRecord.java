package net.lingala.zip4j.model;

public class ExtraDataRecord
{
  private byte[] data;
  private long header;
  private int sizeOfData;
  
  public byte[] getData()
  {
    return this.data;
  }
  
  public long getHeader()
  {
    return this.header;
  }
  
  public int getSizeOfData()
  {
    return this.sizeOfData;
  }
  
  public void setData(byte[] paramArrayOfByte)
  {
    this.data = paramArrayOfByte;
  }
  
  public void setHeader(long paramLong)
  {
    this.header = paramLong;
  }
  
  public void setSizeOfData(int paramInt)
  {
    this.sizeOfData = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/ExtraDataRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */