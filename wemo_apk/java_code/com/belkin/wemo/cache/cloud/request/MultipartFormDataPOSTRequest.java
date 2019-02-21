package com.belkin.wemo.cache.cloud.request;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public class MultipartFormDataPOSTRequest
  extends MultipartPOSTRequest
{
  public MultipartFormDataPOSTRequest(String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2, byte[] paramArrayOfByte)
  {
    super(paramString1, paramListener, paramErrorListener, paramString2, paramArrayOfByte);
  }
  
  public String getBodyContentType()
  {
    return "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY";
  }
  
  protected String getHeaderContentType()
  {
    return "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/MultipartFormDataPOSTRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */