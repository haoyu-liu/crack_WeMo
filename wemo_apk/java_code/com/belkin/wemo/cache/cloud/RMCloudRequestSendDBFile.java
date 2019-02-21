package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.util.ByteArrayBuffer;

public class RMCloudRequestSendDBFile
  implements CloudRequestInterface
{
  private final String TAG = RMCloudRequestSendDBFile.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/senddbfile/";
  private String homeId;
  private byte[] objDataToSend;
  private OnRequestCompleteListener onRequestCompleteListener;
  
  public RMCloudRequestSendDBFile(String paramString, OnRequestCompleteListener paramOnRequestCompleteListener, byte[] paramArrayOfByte)
  {
    this.homeId = paramString;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    this.objDataToSend = paramArrayOfByte;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("Content-Type", "application/octet-stream");
    return localHashMap;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public byte[] getFileByteArray()
  {
    ByteArrayBuffer localByteArrayBuffer = new ByteArrayBuffer(this.objDataToSend.length);
    localByteArrayBuffer.append("--MULTIPART-FORM-DATA-BOUNDARY\r\n".getBytes(), 0, "--MULTIPART-FORM-DATA-BOUNDARY\r\n".getBytes().length);
    localByteArrayBuffer.append("Content-Disposition:form-data;name=filedata;filename=rules.db\r\n".getBytes(), 0, "Content-Disposition:form-data;name=filedata;filename=rules.db\r\n".getBytes().length);
    localByteArrayBuffer.append("Content-Type:application/octet-stream\r\n\r\n".getBytes(), 0, "Content-Type:application/octet-stream\r\n\r\n".getBytes().length);
    localByteArrayBuffer.append(this.objDataToSend, 0, this.objDataToSend.length);
    localByteArrayBuffer.append("\r\n--MULTIPART-FORM-DATA-BOUNDARY--\r\n".getBytes(), 0, "\r\n--MULTIPART-FORM-DATA-BOUNDARY--\r\n".getBytes().length);
    this.objDataToSend = ((byte[])localByteArrayBuffer.toByteArray());
    return this.objDataToSend;
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    return this.URL + this.homeId;
  }
  
  public String getUploadFileName()
  {
    return "rules.db";
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */