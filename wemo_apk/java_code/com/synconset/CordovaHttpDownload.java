package com.synconset;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.util.Map;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.file.FileUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaHttpDownload
  extends CordovaHttp
  implements Runnable
{
  private String filePath;
  
  public CordovaHttpDownload(String paramString1, Map<?, ?> paramMap, Map<String, String> paramMap1, CallbackContext paramCallbackContext, String paramString2)
  {
    super(paramString1, paramMap, paramMap1, paramCallbackContext);
    this.filePath = paramString2;
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
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("status", i);
      if ((i >= 200) && (i < 300))
      {
        File localFile = new File(new URI(this.filePath));
        localHttpRequest.receive(localFile);
        localJSONObject.put("file", FileUtils.getEntry(localFile));
        getCallbackContext().success(localJSONObject);
        return;
      }
      localJSONObject.put("error", "There was an error downloading the file");
      getCallbackContext().error(localJSONObject);
      return;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      respondWithError("There was an error with the given filePath");
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/synconset/CordovaHttpDownload.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */