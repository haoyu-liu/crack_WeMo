package com.synconset;

import android.webkit.MimeTypeMap;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.cordova.CallbackContext;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaHttpUpload
  extends CordovaHttp
  implements Runnable
{
  private String filePath;
  private String name;
  
  public CordovaHttpUpload(String paramString1, Map<?, ?> paramMap, Map<String, String> paramMap1, CallbackContext paramCallbackContext, String paramString2, String paramString3)
  {
    super(paramString1, paramMap, paramMap1, paramCallbackContext);
    this.filePath = paramString2;
    this.name = paramString3;
  }
  
  public void run()
  {
    try
    {
      localHttpRequest = HttpRequest.post(getUrlString());
      setupSecurity(localHttpRequest);
      localHttpRequest.acceptCharset("UTF-8");
      localHttpRequest.headers(getHeaders());
      URI localURI = new URI(this.filePath);
      int i = this.filePath.lastIndexOf('/');
      String str1 = this.filePath.substring(i + 1);
      int j = this.filePath.lastIndexOf('.');
      String str2 = this.filePath.substring(j + 1);
      String str3 = MimeTypeMap.getSingleton().getMimeTypeFromExtension(str2);
      String str4 = this.name;
      File localFile = new File(localURI);
      localHttpRequest.part(str4, str1, str3, localFile);
      Iterator localIterator = getParams().entrySet().iterator();
      for (;;)
      {
        if (!localIterator.hasNext()) {
          break label285;
        }
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        str6 = (String)localEntry.getKey();
        localObject = localEntry.getValue();
        if (!(localObject instanceof Number)) {
          break;
        }
        localHttpRequest.part(str6, (Number)localObject);
      }
    }
    catch (URISyntaxException localURISyntaxException)
    {
      for (;;)
      {
        String str6;
        Object localObject;
        respondWithError("There was an error loading the file");
        return;
        if (!(localObject instanceof String)) {
          break;
        }
        localHttpRequest.part(str6, (String)localObject);
      }
    }
    catch (JSONException localJSONException)
    {
      respondWithError("There was an error generating the response");
      return;
      respondWithError("All parameters must be Numbers or Strings");
      return;
    }
    catch (HttpRequest.HttpRequestException localHttpRequestException)
    {
      HttpRequest localHttpRequest;
      if ((localHttpRequestException.getCause() instanceof UnknownHostException))
      {
        respondWithError(0, "The host could not be resolved");
        return;
        label285:
        int k = localHttpRequest.code();
        String str5 = localHttpRequest.body("UTF-8");
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("status", k);
        if ((k >= 200) && (k < 300))
        {
          localJSONObject.put("data", str5);
          getCallbackContext().success(localJSONObject);
          return;
        }
        localJSONObject.put("error", str5);
        getCallbackContext().error(localJSONObject);
        return;
      }
      respondWithError("There was an error with the request");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/synconset/CordovaHttpUpload.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */