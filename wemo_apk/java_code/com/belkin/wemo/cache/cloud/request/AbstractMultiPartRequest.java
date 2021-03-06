package com.belkin.wemo.cache.cloud.request;

import com.android.volley.AuthFailureError;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public abstract class AbstractMultiPartRequest
  extends WemoStringRequest
{
  private final String CONTENT_TYPE_MULTIPART = "multipart/form-data";
  private byte[] fileBody;
  
  public AbstractMultiPartRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2, byte[] paramArrayOfByte)
  {
    super(paramInt, paramString1, paramListener, paramErrorListener, paramString2);
    this.fileBody = paramArrayOfByte;
  }
  
  public byte[] getBody()
    throws AuthFailureError
  {
    return this.fileBody;
  }
  
  public String getBodyContentType()
  {
    return "multipart/form-data";
  }
  
  protected String getHeaderContentType()
  {
    return "multipart/form-data";
  }
  
  public String getStringBody()
  {
    return this.fileBody.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */