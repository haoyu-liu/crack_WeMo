package com.android.volley.toolbox;

import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;

public class StringRequest
  extends Request<String>
{
  private static final String TAG = StringRequest.class.getSimpleName();
  private final Response.Listener<String> mListener;
  
  public StringRequest(int paramInt, String paramString, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramInt, paramString, paramErrorListener);
    this.mListener = paramListener;
  }
  
  public StringRequest(String paramString, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener)
  {
    this(0, paramString, paramListener, paramErrorListener);
  }
  
  protected void deliverResponse(String paramString)
  {
    this.mListener.onResponse(paramString);
  }
  
  protected Response<String> parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    try
    {
      str = new String(paramNetworkResponse.data, HttpHeaderParser.parseCharset(paramNetworkResponse.headers));
      SDKLogUtils.debugLog(TAG, "Network response received for String Request. Status code: " + paramNetworkResponse.statusCode + "; Network time: " + paramNetworkResponse.networkTimeMs);
      return Response.success(str, HttpHeaderParser.parseCacheHeaders(paramNetworkResponse));
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        String str = new String(paramNetworkResponse.data);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/toolbox/StringRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */