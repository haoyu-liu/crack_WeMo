package com.synconset;

import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.apache.cordova.CallbackContext;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class CordovaHttp
{
  protected static final String CHARSET = "UTF-8";
  protected static final String TAG = "CordovaHTTP";
  private static AtomicBoolean acceptAllCerts = new AtomicBoolean(false);
  private static AtomicBoolean sslPinning = new AtomicBoolean(false);
  private CallbackContext callbackContext;
  private Map<String, String> headers;
  private Map<?, ?> params;
  private String urlString;
  
  public CordovaHttp(String paramString, Map<?, ?> paramMap, Map<String, String> paramMap1, CallbackContext paramCallbackContext)
  {
    this.urlString = paramString;
    this.params = paramMap;
    this.headers = paramMap1;
    this.callbackContext = paramCallbackContext;
  }
  
  public static void acceptAllCerts(boolean paramBoolean)
  {
    acceptAllCerts.set(paramBoolean);
    if (paramBoolean) {
      sslPinning.set(false);
    }
  }
  
  public static void enableSSLPinning(boolean paramBoolean)
  {
    sslPinning.set(paramBoolean);
    if (paramBoolean) {
      acceptAllCerts.set(false);
    }
  }
  
  protected CallbackContext getCallbackContext()
  {
    return this.callbackContext;
  }
  
  protected Map<String, String> getHeaders()
  {
    return this.headers;
  }
  
  protected Map<?, ?> getParams()
  {
    return this.params;
  }
  
  protected String getUrlString()
  {
    return this.urlString;
  }
  
  protected void respondWithError(int paramInt, String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("status", paramInt);
      localJSONObject.put("error", paramString);
      this.callbackContext.error(localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      this.callbackContext.error(paramString);
    }
  }
  
  protected void respondWithError(String paramString)
  {
    respondWithError(500, paramString);
  }
  
  protected HttpRequest setupSecurity(HttpRequest paramHttpRequest)
  {
    if (acceptAllCerts.get())
    {
      paramHttpRequest.trustAllCerts();
      paramHttpRequest.trustAllHosts();
    }
    if (sslPinning.get()) {
      paramHttpRequest.pinToCerts();
    }
    return paramHttpRequest;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/synconset/CordovaHttp.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */