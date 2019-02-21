package com.belkin.wemo.cache.cloud.request;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Response;
import com.android.volley.toolbox.HttpHeaderParser;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestErrorListener;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestSuccessListener;
import java.util.Map;

public class ByteStreamGetRequest
  extends WemoRequest<byte[]>
{
  private String authHeader;
  
  public ByteStreamGetRequest(String paramString1, WemoRequestErrorListener paramWemoRequestErrorListener, WemoRequestSuccessListener<byte[]> paramWemoRequestSuccessListener, String paramString2)
  {
    super(0, paramString1, paramWemoRequestErrorListener, paramWemoRequestSuccessListener);
    this.authHeader = paramString2;
    addDefaultHeaders();
  }
  
  private void addDefaultHeaders()
  {
    this.headersMap.put("Content-Type", "application/xml");
    this.headersMap.put("Authorization", this.authHeader);
  }
  
  protected Response<byte[]> extractNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    return Response.success(paramNetworkResponse.data, HttpHeaderParser.parseCacheHeaders(paramNetworkResponse));
  }
  
  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    return this.headersMap;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/ByteStreamGetRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */