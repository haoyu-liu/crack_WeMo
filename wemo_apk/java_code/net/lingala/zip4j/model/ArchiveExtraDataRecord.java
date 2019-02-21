package net.lingala.zip4j.model;

public class ArchiveExtraDataRecord
{
  private String extraFieldData;
  private int extraFieldLength;
  private int signature;
  
  public String getExtraFieldData()
  {
    return this.extraFieldData;
  }
  
  public int getExtraFieldLength()
  {
    return this.extraFieldLength;
  }
  
  public int getSignature()
  {
    return this.signature;
  }
  
  public void setExtraFieldData(String paramString)
  {
    this.extraFieldData = paramString;
  }
  
  public void setExtraFieldLength(int paramInt)
  {
    this.extraFieldLength = paramInt;
  }
  
  public void setSignature(int paramInt)
  {
    this.signature = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/ArchiveExtraDataRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */