package com.belkin.wemo.cache.cloud.request;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestErrorListener;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestSuccessListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.HashMap;
import java.util.Map;

public abstract class WemoRequest<T>
  extends Request<T>
{
  public static final String AUTH = "Authorization";
  public static final String CONTENT_TYPE = "Content-Type";
  private final int DEFAULT_TIMEOUT_MS = 60000;
  protected final String TAG;
  private float backoffMultiplier;
  protected Map<String, String> headersMap;
  private int initialTimeoutMs;
  private int maxRetriesCount;
  private int statusCode;
  private WemoRequestSuccessListener<T> successListener;
  
  public WemoRequest(int paramInt, String paramString, WemoRequestErrorListener paramWemoRequestErrorListener, WemoRequestSuccessListener<T> paramWemoRequestSuccessListener)
  {
    super(paramInt, paramString, paramWemoRequestErrorListener);
    this.successListener = paramWemoRequestSuccessListener;
    this.initialTimeoutMs = 60000;
    this.backoffMultiplier = 1.0F;
    this.maxRetriesCount = 1;
    this.TAG = getClass().getSimpleName();
    this.headersMap = new HashMap();
  }
  
  public void addHeader(String paramString1, String paramString2)
  {
    SDKLogUtils.debugLog(this.TAG, "Adding header to WemoRequest. Key: " + paramString1 + "; Value: " + paramString2);
    this.headersMap.put(paramString1, paramString2);
  }
  
  protected void deliverResponse(T paramT)
  {
    if (this.successListener != null) {
      this.successListener.onResponse(paramT, this.statusCode);
    }
  }
  
  protected abstract Response<T> extractNetworkResponse(NetworkResponse paramNetworkResponse);
  
  public float getBackoffMultiplier()
  {
    return this.backoffMultiplier;
  }
  
  public int getInitialTimeoutMs()
  {
    return this.initialTimeoutMs;
  }
  
  public int getMaxRetriesCount()
  {
    return this.maxRetriesCount;
  }
  
  public RetryPolicy getRetryPolicy()
  {
    return new DefaultRetryPolicy(this.initialTimeoutMs, this.maxRetriesCount, this.backoffMultiplier);
  }
  
  protected Response<T> parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    Response localResponse = null;
    if (paramNetworkResponse != null)
    {
      this.statusCode = paramNetworkResponse.statusCode;
      localResponse = extractNetworkResponse(paramNetworkResponse);
    }
    return localResponse;
  }
  
  public void setBackoffMultiplier(float paramFloat)
  {
    this.backoffMultiplier = paramFloat;
  }
  
  public void setInitialTimeoutMs(int paramInt)
  {
    this.initialTimeoutMs = paramInt;
  }
  
  public void setMaxRetriesCount(int paramInt)
  {
    this.maxRetriesCount = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/WemoRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */