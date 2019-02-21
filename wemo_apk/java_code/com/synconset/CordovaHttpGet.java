package com.synconset;

import java.net.UnknownHostException;
import java.util.Map;
import org.apache.cordova.CallbackContext;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaHttpGet
  extends CordovaHttp
  implements Runnable
{
  public CordovaHttpGet(String paramString, Map<?, ?> paramMap, Map<String, String> paramMap1, CallbackContext paramCallbackContext)
  {
    super(paramString, paramMap, paramMap1, paramCallbackContext);
  }
  
  public void run()
  {
    try
    {
      HttpRequest localHttpRequest = HttpRequest.get(getUrlString(), getParams(), true);
      setupSecurity(localHttpRequest);
      localHttpRequest.acceptCharset("UTF-8");
      localHttpRequest.headers(getHeaders());
      int i = localHttpRequest.code();
      String str = localHttpRequest.body("UTF-8");
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("status", i);
      if ((i >= 200) && (i < 300))
      {
        localJSONObject.put("data", str);
        getCallbackContext().success(localJSONObject);
        return;
      }
      localJSONObject.put("error", str);
      getCallbackContext().error(localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      respondWithError("There was an error generating the response");
      return;
    }
    catch (HttpRequest.HttpRequestException localHttpRequestException)
    {
      if ((localHttpRequestException.getCause() instanceof UnknownHostException))
      {
        respondWithError(0, "The host could not be resolved");
        return;
      }
      respondWithError("There was an error with the request");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/synconset/CordovaHttpGet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */