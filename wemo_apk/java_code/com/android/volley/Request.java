package com.android.volley;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public abstract class Request<T>
  implements Comparable<Request<T>>
{
  private static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
  private Cache.Entry mCacheEntry;
  private boolean mCanceled;
  private final int mDefaultTrafficStatsTag;
  private final Response.ErrorListener mErrorListener;
  private final VolleyLog.MarkerLog mEventLog;
  private final int mMethod;
  private RequestQueue mRequestQueue;
  private boolean mResponseDelivered;
  private RetryPolicy mRetryPolicy;
  private Integer mSequence;
  private boolean mShouldCache;
  private Object mTag;
  private final String mUrl;
  
  public Request(int paramInt, String paramString, Response.ErrorListener paramErrorListener)
  {
    if (VolleyLog.MarkerLog.ENABLED) {}
    for (VolleyLog.MarkerLog localMarkerLog = new VolleyLog.MarkerLog();; localMarkerLog = null)
    {
      this.mEventLog = localMarkerLog;
      this.mShouldCache = true;
      this.mCanceled = false;
      this.mResponseDelivered = false;
      this.mCacheEntry = null;
      this.mMethod = paramInt;
      this.mUrl = paramString;
      this.mErrorListener = paramErrorListener;
      setRetryPolicy(new DefaultRetryPolicy());
      this.mDefaultTrafficStatsTag = findDefaultTrafficStatsTag(paramString);
      return;
    }
  }
  
  @Deprecated
  public Request(String paramString, Response.ErrorListener paramErrorListener)
  {
    this(-1, paramString, paramErrorListener);
  }
  
  private byte[] encodeParameters(Map<String, String> paramMap, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    try
    {
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localStringBuilder.append(URLEncoder.encode((String)localEntry.getKey(), paramString));
        localStringBuilder.append('=');
        localStringBuilder.append(URLEncoder.encode((String)localEntry.getValue(), paramString));
        localStringBuilder.append('&');
      }
      arrayOfByte = localStringBuilder.toString().getBytes(paramString);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException("Encoding not supported: " + paramString, localUnsupportedEncodingException);
    }
    byte[] arrayOfByte;
    return arrayOfByte;
  }
  
  private static int findDefaultTrafficStatsTag(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      Uri localUri = Uri.parse(paramString);
      if (localUri != null)
      {
        String str = localUri.getHost();
        if (str != null) {
          return str.hashCode();
        }
      }
    }
    return 0;
  }
  
  public void addMarker(String paramString)
  {
    if (VolleyLog.MarkerLog.ENABLED) {
      this.mEventLog.add(paramString, Thread.currentThread().getId());
    }
  }
  
  public void cancel()
  {
    this.mCanceled = true;
  }
  
  public int compareTo(Request<T> paramRequest)
  {
    Priority localPriority1 = getPriority();
    Priority localPriority2 = paramRequest.getPriority();
    if (localPriority1 == localPriority2) {
      return this.mSequence.intValue() - paramRequest.mSequence.intValue();
    }
    return localPriority2.ordinal() - localPriority1.ordinal();
  }
  
  public void deliverError(VolleyError paramVolleyError)
  {
    if (this.mErrorListener != null) {
      this.mErrorListener.onErrorResponse(paramVolleyError);
    }
  }
  
  protected abstract void deliverResponse(T paramT);
  
  void finish(final String paramString)
  {
    if (this.mRequestQueue != null) {
      this.mRequestQueue.finish(this);
    }
    final long l;
    if (VolleyLog.MarkerLog.ENABLED)
    {
      l = Thread.currentThread().getId();
      if (Looper.myLooper() != Looper.getMainLooper()) {
        new Handler(Looper.getMainLooper()).post(new Runnable()
        {
          public void run()
          {
            Request.this.mEventLog.add(paramString, l);
            Request.this.mEventLog.finish(toString());
          }
        });
      }
    }
    else
    {
      return;
    }
    this.mEventLog.add(paramString, l);
    this.mEventLog.finish(toString());
  }
  
  public byte[] getBody()
    throws AuthFailureError
  {
    Map localMap = getParams();
    if ((localMap != null) && (localMap.size() > 0)) {
      return encodeParameters(localMap, getParamsEncoding());
    }
    return null;
  }
  
  public String getBodyContentType()
  {
    return "application/x-www-form-urlencoded; charset=" + getParamsEncoding();
  }
  
  public Cache.Entry getCacheEntry()
  {
    return this.mCacheEntry;
  }
  
  public String getCacheKey()
  {
    return getUrl();
  }
  
  public Response.ErrorListener getErrorListener()
  {
    return this.mErrorListener;
  }
  
  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    return Collections.emptyMap();
  }
  
  public int getMethod()
  {
    return this.mMethod;
  }
  
  protected Map<String, String> getParams()
    throws AuthFailureError
  {
    return null;
  }
  
  protected String getParamsEncoding()
  {
    return "UTF-8";
  }
  
  @Deprecated
  public byte[] getPostBody()
    throws AuthFailureError
  {
    Map localMap = getPostParams();
    if ((localMap != null) && (localMap.size() > 0)) {
      return encodeParameters(localMap, getPostParamsEncoding());
    }
    return null;
  }
  
  @Deprecated
  public String getPostBodyContentType()
  {
    return getBodyContentType();
  }
  
  @Deprecated
  protected Map<String, String> getPostParams()
    throws AuthFailureError
  {
    return getParams();
  }
  
  @Deprecated
  protected String getPostParamsEncoding()
  {
    return getParamsEncoding();
  }
  
  public Priority getPriority()
  {
    return Priority.NORMAL;
  }
  
  public RetryPolicy getRetryPolicy()
  {
    return this.mRetryPolicy;
  }
  
  public final int getSequence()
  {
    if (this.mSequence == null) {
      throw new IllegalStateException("getSequence called before setSequence");
    }
    return this.mSequence.intValue();
  }
  
  public Object getTag()
  {
    return this.mTag;
  }
  
  public final int getTimeoutMs()
  {
    return this.mRetryPolicy.getCurrentTimeout();
  }
  
  public int getTrafficStatsTag()
  {
    return this.mDefaultTrafficStatsTag;
  }
  
  public String getUrl()
  {
    return this.mUrl;
  }
  
  public boolean hasHadResponseDelivered()
  {
    return this.mResponseDelivered;
  }
  
  public boolean isCanceled()
  {
    return this.mCanceled;
  }
  
  public void markDelivered()
  {
    this.mResponseDelivered = true;
  }
  
  protected VolleyError parseNetworkError(VolleyError paramVolleyError)
  {
    return paramVolleyError;
  }
  
  protected abstract Response<T> parseNetworkResponse(NetworkResponse paramNetworkResponse);
  
  public Request<?> setCacheEntry(Cache.Entry paramEntry)
  {
    this.mCacheEntry = paramEntry;
    return this;
  }
  
  public Request<?> setRequestQueue(RequestQueue paramRequestQueue)
  {
    this.mRequestQueue = paramRequestQueue;
    return this;
  }
  
  public Request<?> setRetryPolicy(RetryPolicy paramRetryPolicy)
  {
    this.mRetryPolicy = paramRetryPolicy;
    return this;
  }
  
  public final Request<?> setSequence(int paramInt)
  {
    this.mSequence = Integer.valueOf(paramInt);
    return this;
  }
  
  public final Request<?> setShouldCache(boolean paramBoolean)
  {
    this.mShouldCache = paramBoolean;
    return this;
  }
  
  public Request<?> setTag(Object paramObject)
  {
    this.mTag = paramObject;
    return this;
  }
  
  public final boolean shouldCache()
  {
    return this.mShouldCache;
  }
  
  public String toString()
  {
    String str1 = "0x" + Integer.toHexString(getTrafficStatsTag());
    StringBuilder localStringBuilder = new StringBuilder();
    if (this.mCanceled) {}
    for (String str2 = "[X] ";; str2 = "[ ] ") {
      return str2 + getUrl() + " " + str1 + " " + getPriority() + " " + this.mSequence;
    }
  }
  
  public static abstract interface Method
  {
    public static final int DELETE = 3;
    public static final int DEPRECATED_GET_OR_POST = -1;
    public static final int GET = 0;
    public static final int HEAD = 4;
    public static final int OPTIONS = 5;
    public static final int PATCH = 7;
    public static final int POST = 1;
    public static final int PUT = 2;
    public static final int TRACE = 6;
  }
  
  public static enum Priority
  {
    static
    {
      HIGH = new Priority("HIGH", 2);
      IMMEDIATE = new Priority("IMMEDIATE", 3);
      Priority[] arrayOfPriority = new Priority[4];
      arrayOfPriority[0] = LOW;
      arrayOfPriority[1] = NORMAL;
      arrayOfPriority[2] = HIGH;
      arrayOfPriority[3] = IMMEDIATE;
      $VALUES = arrayOfPriority;
    }
    
    private Priority() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/Request.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */