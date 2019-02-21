package org.apache.cordova.engine;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build.VERSION;
import android.webkit.ClientCertRequest;
import android.webkit.HttpAuthHandler;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Hashtable;
import org.apache.cordova.AuthenticationToken;
import org.apache.cordova.CordovaBridge;
import org.apache.cordova.CordovaClientCertRequest;
import org.apache.cordova.CordovaHttpAuthHandler;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaResourceApi;
import org.apache.cordova.CordovaResourceApi.OpenForReadResult;
import org.apache.cordova.CordovaWebViewEngine.Client;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginManager;

public class SystemWebViewClient
  extends WebViewClient
{
  private static final String TAG = "SystemWebViewClient";
  private Hashtable<String, AuthenticationToken> authenticationTokens = new Hashtable();
  private boolean doClearHistory = false;
  boolean isCurrentlyLoading;
  protected final SystemWebViewEngine parentEngine;
  
  public SystemWebViewClient(SystemWebViewEngine paramSystemWebViewEngine)
  {
    this.parentEngine = paramSystemWebViewEngine;
  }
  
  private static boolean needsKitKatContentUrlFix(Uri paramUri)
  {
    return (Build.VERSION.SDK_INT >= 19) && ("content".equals(paramUri.getScheme()));
  }
  
  private static boolean needsSpecialsInAssetUrlFix(Uri paramUri)
  {
    if (CordovaResourceApi.getUriType(paramUri) != 1) {}
    do
    {
      return false;
      if ((paramUri.getQuery() != null) || (paramUri.getFragment() != null)) {
        return true;
      }
    } while (!paramUri.toString().contains("%"));
    switch (Build.VERSION.SDK_INT)
    {
    default: 
      return false;
    }
    return true;
  }
  
  public void clearAuthenticationTokens()
  {
    this.authenticationTokens.clear();
  }
  
  public AuthenticationToken getAuthenticationToken(String paramString1, String paramString2)
  {
    AuthenticationToken localAuthenticationToken = (AuthenticationToken)this.authenticationTokens.get(paramString1.concat(paramString2));
    if (localAuthenticationToken == null)
    {
      localAuthenticationToken = (AuthenticationToken)this.authenticationTokens.get(paramString1);
      if (localAuthenticationToken == null) {
        localAuthenticationToken = (AuthenticationToken)this.authenticationTokens.get(paramString2);
      }
      if (localAuthenticationToken == null) {
        localAuthenticationToken = (AuthenticationToken)this.authenticationTokens.get("");
      }
    }
    return localAuthenticationToken;
  }
  
  public void onPageFinished(WebView paramWebView, String paramString)
  {
    super.onPageFinished(paramWebView, paramString);
    if ((!this.isCurrentlyLoading) && (!paramString.startsWith("about:"))) {
      return;
    }
    this.isCurrentlyLoading = false;
    if (this.doClearHistory)
    {
      paramWebView.clearHistory();
      this.doClearHistory = false;
    }
    this.parentEngine.client.onPageFinishedLoading(paramString);
  }
  
  public void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
  {
    super.onPageStarted(paramWebView, paramString, paramBitmap);
    this.isCurrentlyLoading = true;
    this.parentEngine.bridge.reset();
    this.parentEngine.client.onPageStarted(paramString);
  }
  
  @TargetApi(21)
  public void onReceivedClientCertRequest(WebView paramWebView, ClientCertRequest paramClientCertRequest)
  {
    PluginManager localPluginManager = this.parentEngine.pluginManager;
    if ((localPluginManager != null) && (localPluginManager.onReceivedClientCertRequest(null, new CordovaClientCertRequest(paramClientCertRequest))))
    {
      this.parentEngine.client.clearLoadTimeoutTimer();
      return;
    }
    super.onReceivedClientCertRequest(paramWebView, paramClientCertRequest);
  }
  
  public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
  {
    if (!this.isCurrentlyLoading) {
      return;
    }
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    arrayOfObject[1] = paramString1;
    arrayOfObject[2] = paramString2;
    LOG.d("SystemWebViewClient", "CordovaWebViewClient.onReceivedError: Error code=%s Description=%s URL=%s", arrayOfObject);
    if (paramInt == -10)
    {
      this.parentEngine.client.clearLoadTimeoutTimer();
      if (paramWebView.canGoBack())
      {
        paramWebView.goBack();
        return;
      }
      super.onReceivedError(paramWebView, paramInt, paramString1, paramString2);
    }
    this.parentEngine.client.onReceivedError(paramInt, paramString1, paramString2);
  }
  
  public void onReceivedHttpAuthRequest(WebView paramWebView, HttpAuthHandler paramHttpAuthHandler, String paramString1, String paramString2)
  {
    AuthenticationToken localAuthenticationToken = getAuthenticationToken(paramString1, paramString2);
    if (localAuthenticationToken != null)
    {
      paramHttpAuthHandler.proceed(localAuthenticationToken.getUserName(), localAuthenticationToken.getPassword());
      return;
    }
    PluginManager localPluginManager = this.parentEngine.pluginManager;
    if ((localPluginManager != null) && (localPluginManager.onReceivedHttpAuthRequest(null, new CordovaHttpAuthHandler(paramHttpAuthHandler), paramString1, paramString2)))
    {
      this.parentEngine.client.clearLoadTimeoutTimer();
      return;
    }
    super.onReceivedHttpAuthRequest(paramWebView, paramHttpAuthHandler, paramString1, paramString2);
  }
  
  @TargetApi(8)
  public void onReceivedSslError(WebView paramWebView, SslErrorHandler paramSslErrorHandler, SslError paramSslError)
  {
    String str = this.parentEngine.cordova.getActivity().getPackageName();
    PackageManager localPackageManager = this.parentEngine.cordova.getActivity().getPackageManager();
    try
    {
      if ((0x2 & localPackageManager.getApplicationInfo(str, 128).flags) != 0)
      {
        paramSslErrorHandler.proceed();
        return;
      }
      super.onReceivedSslError(paramWebView, paramSslErrorHandler, paramSslError);
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      super.onReceivedSslError(paramWebView, paramSslErrorHandler, paramSslError);
    }
  }
  
  public AuthenticationToken removeAuthenticationToken(String paramString1, String paramString2)
  {
    return (AuthenticationToken)this.authenticationTokens.remove(paramString1.concat(paramString2));
  }
  
  public void setAuthenticationToken(AuthenticationToken paramAuthenticationToken, String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      paramString1 = "";
    }
    if (paramString2 == null) {
      paramString2 = "";
    }
    this.authenticationTokens.put(paramString1.concat(paramString2), paramAuthenticationToken);
  }
  
  @TargetApi(11)
  public WebResourceResponse shouldInterceptRequest(WebView paramWebView, String paramString)
  {
    try
    {
      if (!this.parentEngine.pluginManager.shouldAllowRequest(paramString))
      {
        LOG.w("SystemWebViewClient", "URL blocked by whitelist: " + paramString);
        return new WebResourceResponse("text/plain", "UTF-8", null);
      }
      CordovaResourceApi localCordovaResourceApi = this.parentEngine.resourceApi;
      Uri localUri1 = Uri.parse(paramString);
      Uri localUri2 = localCordovaResourceApi.remapUri(localUri1);
      if ((!localUri1.equals(localUri2)) || (needsSpecialsInAssetUrlFix(localUri1)) || (needsKitKatContentUrlFix(localUri1)))
      {
        CordovaResourceApi.OpenForReadResult localOpenForReadResult = localCordovaResourceApi.openForRead(localUri2, true);
        WebResourceResponse localWebResourceResponse = new WebResourceResponse(localOpenForReadResult.mimeType, "UTF-8", localOpenForReadResult.inputStream);
        return localWebResourceResponse;
      }
    }
    catch (IOException localIOException)
    {
      if (!(localIOException instanceof FileNotFoundException)) {
        LOG.e("SystemWebViewClient", "Error occurred while loading a file (returning a 404).", localIOException);
      }
      return new WebResourceResponse("text/plain", "UTF-8", null);
    }
    return null;
  }
  
  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    return this.parentEngine.client.onNavigationAttempt(paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/engine/SystemWebViewClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */