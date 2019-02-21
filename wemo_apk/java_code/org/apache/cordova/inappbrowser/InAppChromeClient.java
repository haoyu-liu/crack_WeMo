package org.apache.cordova.inappbrowser;

import android.webkit.GeolocationPermissions.Callback;
import android.webkit.JsPromptResult;
import android.webkit.WebChromeClient;
import android.webkit.WebStorage.QuotaUpdater;
import android.webkit.WebView;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class InAppChromeClient
  extends WebChromeClient
{
  private String LOG_TAG = "InAppChromeClient";
  private long MAX_QUOTA = 104857600L;
  private CordovaWebView webView;
  
  public InAppChromeClient(CordovaWebView paramCordovaWebView)
  {
    this.webView = paramCordovaWebView;
  }
  
  public void onExceededDatabaseQuota(String paramString1, String paramString2, long paramLong1, long paramLong2, long paramLong3, WebStorage.QuotaUpdater paramQuotaUpdater)
  {
    String str = this.LOG_TAG;
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Long.valueOf(paramLong2);
    arrayOfObject[1] = Long.valueOf(paramLong1);
    arrayOfObject[2] = Long.valueOf(paramLong3);
    LOG.d(str, "onExceededDatabaseQuota estimatedSize: %d  currentQuota: %d  totalUsedQuota: %d", arrayOfObject);
    paramQuotaUpdater.updateQuota(this.MAX_QUOTA);
  }
  
  public void onGeolocationPermissionsShowPrompt(String paramString, GeolocationPermissions.Callback paramCallback)
  {
    super.onGeolocationPermissionsShowPrompt(paramString, paramCallback);
    paramCallback.invoke(paramString, true, false);
  }
  
  public boolean onJsPrompt(WebView paramWebView, String paramString1, String paramString2, String paramString3, JsPromptResult paramJsPromptResult)
  {
    if ((paramString3 != null) && (paramString3.startsWith("gap"))) {
      if (paramString3.startsWith("gap-iab://"))
      {
        String str = paramString3.substring(10);
        if (str.startsWith("InAppBrowser"))
        {
          PluginResult localPluginResult;
          if ((paramString2 == null) || (paramString2.length() == 0)) {
            localPluginResult = new PluginResult(PluginResult.Status.OK, new JSONArray());
          }
          for (;;)
          {
            this.webView.sendPluginResult(localPluginResult, str);
            paramJsPromptResult.confirm("");
            return true;
            try
            {
              localPluginResult = new PluginResult(PluginResult.Status.OK, new JSONArray(paramString2));
            }
            catch (JSONException localJSONException)
            {
              localPluginResult = new PluginResult(PluginResult.Status.JSON_EXCEPTION, localJSONException.getMessage());
            }
          }
        }
      }
      else
      {
        LOG.w(this.LOG_TAG, "InAppBrowser does not support Cordova API calls: " + paramString1 + " " + paramString3);
        paramJsPromptResult.cancel();
        return true;
      }
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/inappbrowser/InAppChromeClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */