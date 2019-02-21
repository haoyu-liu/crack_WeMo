package com.almworks.sqlite4java;

public final class SQLiteColumnMetadata
{
  private final boolean myAutoinc;
  private final String myCollSeq;
  private final String myDataType;
  private final boolean myNotNull;
  private final boolean myPrimaryKey;
  
  SQLiteColumnMetadata(String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    this.myDataType = paramString1;
    this.myCollSeq = paramString2;
    this.myNotNull = paramBoolean1;
    this.myPrimaryKey = paramBoolean2;
    this.myAutoinc = paramBoolean3;
  }
  
  public String getCollSeq()
  {
    return this.myCollSeq;
  }
  
  public String getDataType()
  {
    return this.myDataType;
  }
  
  public boolean isAutoinc()
  {
    return this.myAutoinc;
  }
  
  public boolean isNotNull()
  {
    return this.myNotNull;
  }
  
  public boolean isPrimaryKey()
  {
    return this.myPrimaryKey;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteColumnMetadata.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */