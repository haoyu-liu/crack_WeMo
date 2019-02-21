package com.belkin.wemo.cache.cloud.request;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public abstract class AbstractXMLStringRequest
  extends WemoStringRequest
{
  private final String APP_XML = "application/xml";
  
  public AbstractXMLStringRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2)
  {
    super(paramInt, paramString1, paramListener, paramErrorListener, paramString2);
  }
  
  public AbstractXMLStringRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2, String paramString3)
  {
    super(paramInt, paramString1, paramListener, paramErrorListener, paramString2, paramString3);
  }
  
  public String getBodyContentType()
  {
    return "application/xml";
  }
  
  protected String getHeaderContentType()
  {
    return "application/xml";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/AbstractXMLStringRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */