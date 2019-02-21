package com.belkin.remoteservice;

import org.apache.http.message.BasicHeader;

public class HttpResponseObject
{
  private BasicHeader[] arrBasicHeader = null;
  private byte[] bytearrDataReceived = null;
  private int nRequestId = -1;
  private int nResponseCode = -1;
  private String pragmaVersion = "";
  
  public byte[] getDataReceived()
  {
    return this.bytearrDataReceived;
  }
  
  public BasicHeader[] getHeaders()
  {
    return this.arrBasicHeader;
  }
  
  public String getPragmaVersion()
  {
    return this.pragmaVersion;
  }
  
  public int getRequestId()
  {
    return this.nRequestId;
  }
  
  public int getResponseCode()
  {
    return this.nResponseCode;
  }
  
  public void setDataReceived(byte[] paramArrayOfByte)
  {
    this.bytearrDataReceived = paramArrayOfByte;
  }
  
  public void setHeaders(BasicHeader[] paramArrayOfBasicHeader)
  {
    this.arrBasicHeader = paramArrayOfBasicHeader;
  }
  
  public void setPragmaVersion(String paramString)
  {
    this.pragmaVersion = paramString;
  }
  
  public void setRequestId(int paramInt)
  {
    this.nRequestId = paramInt;
  }
  
  public void setResponseCode(int paramInt)
  {
    this.nResponseCode = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/remoteservice/HttpResponseObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */