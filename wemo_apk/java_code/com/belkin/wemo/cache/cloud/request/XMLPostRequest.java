package com.belkin.wemo.cache.cloud.request;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public class XMLPostRequest
  extends AbstractXMLStringRequest
{
  public XMLPostRequest(String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2)
  {
    super(1, paramString1, paramListener, paramErrorListener, paramString2);
  }
  
  public XMLPostRequest(String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2, String paramString3)
  {
    super(1, paramString1, paramListener, paramErrorListener, paramString2, paramString3);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/XMLPostRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */