package com.belkin.wemo.cache.cloud.request;

import com.android.volley.AuthFailureError;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.StringRequest;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public abstract class WemoStringRequest
  extends StringRequest
{
  public static final String AUTH = "Authorization";
  public static final String CONTENT_TYPE = "Content-Type";
  private final String DEFAULT_CHARSET_NAME = "UTF-8";
  protected final String TAG = getClass().getSimpleName();
  private String authHeader;
  private String body;
  private String charsetName;
  private Map<String, String> headersMap;
  
  public WemoStringRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2)
  {
    this(paramInt, paramString1, paramListener, paramErrorListener, paramString2, null);
  }
  
  public WemoStringRequest(int paramInt, String paramString1, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener, String paramString2, String paramString3)
  {
    super(paramInt, paramString1, paramListener, paramErrorListener);
    setStringBody(paramString3);
    this.charsetName = "UTF-8";
    this.authHeader = paramString2;
    this.headersMap = new HashMap();
    addDefaultHeaders();
  }
  
  private void addDefaultHeaders()
  {
    this.headersMap.put("Content-Type", getHeaderContentType());
    this.headersMap.put("Authorization", this.authHeader);
  }
  
  public String addHeader(String paramString1, String paramString2)
  {
    return (String)this.headersMap.put(paramString1, paramString2);
  }
  
  public byte[] getBody()
    throws AuthFailureError
  {
    try
    {
      byte[] arrayOfByte = this.body.getBytes(this.charsetName);
      return arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException for charsetName: " + this.charsetName, localUnsupportedEncodingException);
    }
    return null;
  }
  
  public abstract String getBodyContentType();
  
  public String getCharsetName()
  {
    return this.charsetName;
  }
  
  protected abstract String getHeaderContentType();
  
  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    return this.headersMap;
  }
  
  public String getStringBody()
  {
    return this.body;
  }
  
  public String removeHeader(String paramString)
  {
    return (String)this.headersMap.remove(paramString);
  }
  
  public void setCharsetName(String paramString)
  {
    this.charsetName = paramString;
  }
  
  public void setStringBody(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.body = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/request/WemoStringRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */