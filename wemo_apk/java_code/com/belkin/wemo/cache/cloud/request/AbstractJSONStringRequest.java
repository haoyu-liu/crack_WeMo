package com.belkin.wemo.cache.cloud.request;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public abstract class AbstractJSONStringRequest
  extends WemoStringRequest
{
  private final String APP_JSON = "application/json";
  
  public AbstractJSONStringRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2)
  {
    super(paramInt, paramString1, paramListener, paramErrorListener, paramString2);
  }
  
  public String getBodyContentType()
  {
    return "application/json";
  }
  
  protected String getHeaderContentType()
  {
    return "application/json";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/AbstractJSONStringRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */