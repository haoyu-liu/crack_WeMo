package org.apache.cordova.inappbrowser;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.inputmethod.InputMethodManager;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.HttpAuthHandler;
import android.webkit.WebSettings;
import android.webkit.WebSettings.PluginState;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.StringTokenizer;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.Config;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaHttpAuthHandler;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaPreferences;
import org.apache.cordova.CordovaResourceApi;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginManager;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressLint({"SetJavaScriptEnabled"})
public class InAppBrowser
  extends CordovaPlugin
{
  private static final String CLEAR_ALL_CACHE = "clearcache";
  private static final String CLEAR_SESSION_CACHE = "clearsessioncache";
  private static final String EXIT_EVENT = "exit";
  private static final String HARDWARE_BACK_BUTTON = "hardwareback";
  private static final String HIDDEN = "hidden";
  private static final String LOAD_ERROR_EVENT = "loaderror";
  private static final String LOAD_START_EVENT = "loadstart";
  private static final String LOAD_STOP_EVENT = "loadstop";
  private static final String LOCATION = "location";
  protected static final String LOG_TAG = "InAppBrowser";
  private static final String MEDIA_PLAYBACK_REQUIRES_USER_ACTION = "mediaPlaybackRequiresUserAction";
  private static final String NULL = "null";
  private static final String SELF = "_self";
  private static final String SYSTEM = "_system";
  private static final String ZOOM = "zoom";
  private CallbackContext callbackContext;
  private boolean clearAllCache = false;
  private boolean clearSessionCache = false;
  private InAppBrowserDialog dialog;
  private EditText edittext;
  private boolean hadwareBackButton = true;
  private WebView inAppWebView;
  private boolean mediaPlaybackRequiresUserGesture = false;
  private boolean openWindowHidden = false;
  private boolean showLocationBar = true;
  private boolean showZoomControls = true;
  
  private InAppBrowser getInAppBrowser()
  {
    return this;
  }
  
  private boolean getShowLocationBar()
  {
    return this.showLocationBar;
  }
  
  private void goForward()
  {
    if (this.inAppWebView.canGoForward()) {
      this.inAppWebView.goForward();
    }
  }
  
  private void injectDeferredObject(String paramString1, String paramString2)
  {
    String str1;
    if (paramString2 != null)
    {
      JSONArray localJSONArray = new JSONArray();
      localJSONArray.put(paramString1);
      str1 = localJSONArray.toString();
    }
    for (String str2 = String.format(paramString2, new Object[] { str1.substring(1, -1 + str1.length()) });; str2 = paramString1)
    {
      final String str3 = str2;
      this.cordova.getActivity().runOnUiThread(new Runnable()
      {
        @SuppressLint({"NewApi"})
        public void run()
        {
          if (Build.VERSION.SDK_INT < 19)
          {
            InAppBrowser.this.inAppWebView.loadUrl("javascript:" + str3);
            return;
          }
          InAppBrowser.this.inAppWebView.evaluateJavascript(str3, null);
        }
      });
      return;
    }
  }
  
  private void navigate(String paramString)
  {
    ((InputMethodManager)this.cordova.getActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.edittext.getWindowToken(), 0);
    if ((!paramString.startsWith("http")) && (!paramString.startsWith("file:"))) {
      this.inAppWebView.loadUrl("http://" + paramString);
    }
    for (;;)
    {
      this.inAppWebView.requestFocus();
      return;
      this.inAppWebView.loadUrl(paramString);
    }
  }
  
  private HashMap<String, Boolean> parseFeature(String paramString)
  {
    if (paramString.equals("null"))
    {
      localObject = null;
      return (HashMap<String, Boolean>)localObject;
    }
    Object localObject = new HashMap();
    StringTokenizer localStringTokenizer1 = new StringTokenizer(paramString, ",");
    label33:
    String str;
    while (localStringTokenizer1.hasMoreElements())
    {
      StringTokenizer localStringTokenizer2 = new StringTokenizer(localStringTokenizer1.nextToken(), "=");
      if (localStringTokenizer2.hasMoreElements())
      {
        str = localStringTokenizer2.nextToken();
        if (!localStringTokenizer2.nextToken().equals("no")) {
          break label102;
        }
      }
    }
    label102:
    for (Boolean localBoolean = Boolean.FALSE;; localBoolean = Boolean.TRUE)
    {
      ((HashMap)localObject).put(str, localBoolean);
      break label33;
      break;
    }
  }
  
  private void sendUpdate(JSONObject paramJSONObject, boolean paramBoolean)
  {
    sendUpdate(paramJSONObject, paramBoolean, PluginResult.Status.OK);
  }
  
  private void sendUpdate(JSONObject paramJSONObject, boolean paramBoolean, PluginResult.Status paramStatus)
  {
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(paramStatus, paramJSONObject);
      localPluginResult.setKeepCallback(paramBoolean);
      this.callbackContext.sendPluginResult(localPluginResult);
      if (!paramBoolean) {
        this.callbackContext = null;
      }
    }
  }
  
  public boolean canGoBack()
  {
    return this.inAppWebView.canGoBack();
  }
  
  public void closeDialog()
  {
    this.cordova.getActivity().runOnUiThread(new Runnable()
    {
      public void run()
      {
        WebView localWebView = InAppBrowser.this.inAppWebView;
        if (localWebView == null) {
          return;
        }
        localWebView.setWebViewClient(new WebViewClient()
        {
          public void onPageFinished(WebView paramAnonymous2WebView, String paramAnonymous2String)
          {
            if (InAppBrowser.this.dialog != null)
            {
              InAppBrowser.this.dialog.dismiss();
              InAppBrowser.access$002(InAppBrowser.this, null);
            }
          }
        });
        localWebView.loadUrl("about:blank");
        try
        {
          JSONObject localJSONObject = new JSONObject();
          localJSONObject.put("type", "exit");
          InAppBrowser.this.sendUpdate(localJSONObject, false);
          return;
        }
        catch (JSONException localJSONException)
        {
          Log.d("InAppBrowser", "Should never happen");
        }
      }
    });
  }
  
  public boolean execute(String paramString, CordovaArgs paramCordovaArgs, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (paramString.equals("open"))
    {
      this.callbackContext = paramCallbackContext;
      final String str5 = paramCordovaArgs.getString(0);
      String str6 = paramCordovaArgs.optString(1);
      if ((str6 == null) || (str6.equals("")) || (str6.equals("null"))) {
        str6 = "_self";
      }
      final String str7 = str6;
      final HashMap localHashMap = parseFeature(paramCordovaArgs.optString(2));
      Log.d("InAppBrowser", "target = " + str7);
      this.cordova.getActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          String str = "";
          Boolean localBoolean;
          if ("_self".equals(str7))
          {
            Log.d("InAppBrowser", "in self");
            boolean bool = str5.startsWith("javascript:");
            localBoolean = null;
            if (bool) {
              localBoolean = Boolean.valueOf(true);
            }
            if (localBoolean != null) {}
          }
          try
          {
            Method localMethod2 = Config.class.getMethod("isUrlWhiteListed", new Class[] { String.class });
            Object[] arrayOfObject2 = new Object[1];
            arrayOfObject2[0] = str5;
            localBoolean = (Boolean)localMethod2.invoke(null, arrayOfObject2);
            if (localBoolean == null) {}
            try
            {
              PluginManager localPluginManager = (PluginManager)InAppBrowser.this.webView.getClass().getMethod("getPluginManager", new Class[0]).invoke(InAppBrowser.this.webView, new Object[0]);
              Method localMethod1 = localPluginManager.getClass().getMethod("shouldAllowNavigation", new Class[] { String.class });
              Object[] arrayOfObject1 = new Object[1];
              arrayOfObject1[0] = str5;
              localBoolean = (Boolean)localMethod1.invoke(localPluginManager, arrayOfObject1);
              if (Boolean.TRUE.equals(localBoolean))
              {
                Log.d("InAppBrowser", "loading in webview");
                InAppBrowser.this.webView.loadUrl(str5);
              }
              for (;;)
              {
                PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, str);
                localPluginResult.setKeepCallback(true);
                paramCallbackContext.sendPluginResult(localPluginResult);
                return;
                if (str5.startsWith("tel:"))
                {
                  try
                  {
                    Log.d("InAppBrowser", "loading in dialer");
                    Intent localIntent = new Intent("android.intent.action.DIAL");
                    localIntent.setData(Uri.parse(str5));
                    InAppBrowser.this.cordova.getActivity().startActivity(localIntent);
                  }
                  catch (ActivityNotFoundException localActivityNotFoundException)
                  {
                    LOG.e("InAppBrowser", "Error dialing " + str5 + ": " + localActivityNotFoundException.toString());
                  }
                }
                else
                {
                  Log.d("InAppBrowser", "loading in InAppBrowser");
                  str = InAppBrowser.this.showWebPage(str5, localHashMap);
                  continue;
                  if ("_system".equals(str7))
                  {
                    Log.d("InAppBrowser", "in system");
                    str = InAppBrowser.this.openExternal(str5);
                  }
                  else
                  {
                    Log.d("InAppBrowser", "in blank");
                    str = InAppBrowser.this.showWebPage(str5, localHashMap);
                  }
                }
              }
            }
            catch (InvocationTargetException localInvocationTargetException1)
            {
              for (;;) {}
            }
            catch (IllegalAccessException localIllegalAccessException1)
            {
              for (;;) {}
            }
            catch (NoSuchMethodException localNoSuchMethodException1)
            {
              for (;;) {}
            }
          }
          catch (InvocationTargetException localInvocationTargetException2)
          {
            for (;;) {}
          }
          catch (IllegalAccessException localIllegalAccessException2)
          {
            for (;;) {}
          }
          catch (NoSuchMethodException localNoSuchMethodException2)
          {
            for (;;) {}
          }
        }
      });
    }
    for (;;)
    {
      boolean bool2 = true;
      boolean bool1;
      do
      {
        return bool2;
        if (paramString.equals("close"))
        {
          closeDialog();
          break;
        }
        if (paramString.equals("injectScriptCode"))
        {
          boolean bool3 = paramCordovaArgs.getBoolean(1);
          String str4 = null;
          if (bool3)
          {
            Object[] arrayOfObject4 = new Object[1];
            arrayOfObject4[0] = paramCallbackContext.getCallbackId();
            str4 = String.format("(function(){prompt(JSON.stringify([eval(%%s)]), 'gap-iab://%s')})()", arrayOfObject4);
          }
          injectDeferredObject(paramCordovaArgs.getString(0), str4);
          break;
        }
        if (paramString.equals("injectScriptFile"))
        {
          Object[] arrayOfObject3;
          if (paramCordovaArgs.getBoolean(1))
          {
            arrayOfObject3 = new Object[1];
            arrayOfObject3[0] = paramCallbackContext.getCallbackId();
          }
          for (String str3 = String.format("(function(d) { var c = d.createElement('script'); c.src = %%s; c.onload = function() { prompt('', 'gap-iab://%s'); }; d.body.appendChild(c); })(document)", arrayOfObject3);; str3 = "(function(d) { var c = d.createElement('script'); c.src = %s; d.body.appendChild(c); })(document)")
          {
            injectDeferredObject(paramCordovaArgs.getString(0), str3);
            break;
          }
        }
        if (paramString.equals("injectStyleCode"))
        {
          Object[] arrayOfObject2;
          if (paramCordovaArgs.getBoolean(1))
          {
            arrayOfObject2 = new Object[1];
            arrayOfObject2[0] = paramCallbackContext.getCallbackId();
          }
          for (String str2 = String.format("(function(d) { var c = d.createElement('style'); c.innerHTML = %%s; d.body.appendChild(c); prompt('', 'gap-iab://%s');})(document)", arrayOfObject2);; str2 = "(function(d) { var c = d.createElement('style'); c.innerHTML = %s; d.body.appendChild(c); })(document)")
          {
            injectDeferredObject(paramCordovaArgs.getString(0), str2);
            break;
          }
        }
        if (paramString.equals("injectStyleFile"))
        {
          Object[] arrayOfObject1;
          if (paramCordovaArgs.getBoolean(1))
          {
            arrayOfObject1 = new Object[1];
            arrayOfObject1[0] = paramCallbackContext.getCallbackId();
          }
          for (String str1 = String.format("(function(d) { var c = d.createElement('link'); c.rel='stylesheet'; c.type='text/css'; c.href = %%s; d.head.appendChild(c); prompt('', 'gap-iab://%s');})(document)", arrayOfObject1);; str1 = "(function(d) { var c = d.createElement('link'); c.rel='stylesheet'; c.type='text/css'; c.href = %s; d.head.appendChild(c); })(document)")
          {
            injectDeferredObject(paramCordovaArgs.getString(0), str1);
            break;
          }
        }
        bool1 = paramString.equals("show");
        bool2 = false;
      } while (!bool1);
      this.cordova.getActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          InAppBrowser.this.dialog.show();
        }
      });
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
      localPluginResult.setKeepCallback(true);
      this.callbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void goBack()
  {
    if (this.inAppWebView.canGoBack()) {
      this.inAppWebView.goBack();
    }
  }
  
  public boolean hardwareBack()
  {
    return this.hadwareBackButton;
  }
  
  public void onDestroy()
  {
    closeDialog();
  }
  
  public void onReset()
  {
    closeDialog();
  }
  
  public String openExternal(String paramString)
  {
    try
    {
      Intent localIntent = new Intent("android.intent.action.VIEW");
      try
      {
        Uri localUri = Uri.parse(paramString);
        if ("file".equals(localUri.getScheme())) {
          localIntent.setDataAndType(localUri, this.webView.getResourceApi().getMimeType(localUri));
        }
        for (;;)
        {
          localIntent.putExtra("com.android.browser.application_id", this.cordova.getActivity().getPackageName());
          this.cordova.getActivity().startActivity(localIntent);
          return "";
          localIntent.setData(localUri);
        }
        Log.d("InAppBrowser", "InAppBrowser: Error loading url " + paramString + ":" + localActivityNotFoundException1.toString());
      }
      catch (ActivityNotFoundException localActivityNotFoundException1) {}
    }
    catch (ActivityNotFoundException localActivityNotFoundException2)
    {
      for (;;) {}
    }
    return localActivityNotFoundException1.toString();
  }
  
  public String showWebPage(final String paramString, HashMap<String, Boolean> paramHashMap)
  {
    this.showLocationBar = true;
    this.showZoomControls = true;
    this.openWindowHidden = false;
    this.mediaPlaybackRequiresUserGesture = false;
    if (paramHashMap != null)
    {
      Boolean localBoolean1 = (Boolean)paramHashMap.get("location");
      if (localBoolean1 != null) {
        this.showLocationBar = localBoolean1.booleanValue();
      }
      Boolean localBoolean2 = (Boolean)paramHashMap.get("zoom");
      if (localBoolean2 != null) {
        this.showZoomControls = localBoolean2.booleanValue();
      }
      Boolean localBoolean3 = (Boolean)paramHashMap.get("hidden");
      if (localBoolean3 != null) {
        this.openWindowHidden = localBoolean3.booleanValue();
      }
      Boolean localBoolean4 = (Boolean)paramHashMap.get("hardwareback");
      if (localBoolean4 != null) {
        this.hadwareBackButton = localBoolean4.booleanValue();
      }
      Boolean localBoolean5 = (Boolean)paramHashMap.get("mediaPlaybackRequiresUserAction");
      if (localBoolean5 != null) {
        this.mediaPlaybackRequiresUserGesture = localBoolean5.booleanValue();
      }
      Boolean localBoolean6 = (Boolean)paramHashMap.get("clearcache");
      if (localBoolean6 == null) {
        break label205;
      }
      this.clearAllCache = localBoolean6.booleanValue();
    }
    for (;;)
    {
      Runnable local5 = new Runnable()
      {
        private int dpToPixels(int paramAnonymousInt)
        {
          return (int)TypedValue.applyDimension(1, paramAnonymousInt, InAppBrowser.this.cordova.getActivity().getResources().getDisplayMetrics());
        }
        
        @SuppressLint({"NewApi"})
        public void run()
        {
          if (InAppBrowser.this.dialog != null) {
            InAppBrowser.this.dialog.dismiss();
          }
          InAppBrowser.access$002(InAppBrowser.this, new InAppBrowserDialog(InAppBrowser.this.cordova.getActivity(), 16973830));
          InAppBrowser.this.dialog.getWindow().getAttributes().windowAnimations = 16973826;
          InAppBrowser.this.dialog.requestWindowFeature(1);
          InAppBrowser.this.dialog.setCancelable(true);
          InAppBrowser.this.dialog.setInAppBroswer(InAppBrowser.this.getInAppBrowser());
          LinearLayout localLinearLayout = new LinearLayout(InAppBrowser.this.cordova.getActivity());
          localLinearLayout.setOrientation(1);
          RelativeLayout localRelativeLayout1 = new RelativeLayout(InAppBrowser.this.cordova.getActivity());
          localRelativeLayout1.setBackgroundColor(-3355444);
          localRelativeLayout1.setLayoutParams(new RelativeLayout.LayoutParams(-1, dpToPixels(44)));
          localRelativeLayout1.setPadding(dpToPixels(2), dpToPixels(2), dpToPixels(2), dpToPixels(2));
          localRelativeLayout1.setHorizontalGravity(3);
          localRelativeLayout1.setVerticalGravity(48);
          RelativeLayout localRelativeLayout2 = new RelativeLayout(InAppBrowser.this.cordova.getActivity());
          localRelativeLayout2.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
          localRelativeLayout2.setHorizontalGravity(3);
          localRelativeLayout2.setVerticalGravity(16);
          localRelativeLayout2.setId(Integer.valueOf(1).intValue());
          ImageButton localImageButton1 = new ImageButton(InAppBrowser.this.cordova.getActivity());
          RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-2, -1);
          localLayoutParams1.addRule(5);
          localImageButton1.setLayoutParams(localLayoutParams1);
          localImageButton1.setContentDescription("Back Button");
          localImageButton1.setId(Integer.valueOf(2).intValue());
          Resources localResources = InAppBrowser.this.cordova.getActivity().getResources();
          Drawable localDrawable1 = localResources.getDrawable(localResources.getIdentifier("ic_action_previous_item", "drawable", InAppBrowser.this.cordova.getActivity().getPackageName()));
          localImageButton1.setBackground(null);
          localImageButton1.setImageDrawable(localDrawable1);
          localImageButton1.setScaleType(ImageView.ScaleType.FIT_CENTER);
          localImageButton1.setPadding(0, dpToPixels(10), 0, dpToPixels(10));
          localImageButton1.getAdjustViewBounds();
          View.OnClickListener local1 = new View.OnClickListener()
          {
            public void onClick(View paramAnonymous2View)
            {
              InAppBrowser.this.goBack();
            }
          };
          localImageButton1.setOnClickListener(local1);
          ImageButton localImageButton2 = new ImageButton(InAppBrowser.this.cordova.getActivity());
          RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(-2, -1);
          localLayoutParams2.addRule(1, 2);
          localImageButton2.setLayoutParams(localLayoutParams2);
          localImageButton2.setContentDescription("Forward Button");
          localImageButton2.setId(Integer.valueOf(3).intValue());
          Drawable localDrawable2 = localResources.getDrawable(localResources.getIdentifier("ic_action_next_item", "drawable", InAppBrowser.this.cordova.getActivity().getPackageName()));
          localImageButton2.setBackground(null);
          localImageButton2.setImageDrawable(localDrawable2);
          localImageButton2.setScaleType(ImageView.ScaleType.FIT_CENTER);
          localImageButton2.setPadding(0, dpToPixels(10), 0, dpToPixels(10));
          localImageButton2.getAdjustViewBounds();
          View.OnClickListener local2 = new View.OnClickListener()
          {
            public void onClick(View paramAnonymous2View)
            {
              InAppBrowser.this.goForward();
            }
          };
          localImageButton2.setOnClickListener(local2);
          InAppBrowser.access$502(InAppBrowser.this, new EditText(InAppBrowser.this.cordova.getActivity()));
          RelativeLayout.LayoutParams localLayoutParams3 = new RelativeLayout.LayoutParams(-1, -1);
          localLayoutParams3.addRule(1, 1);
          localLayoutParams3.addRule(0, 5);
          InAppBrowser.this.edittext.setLayoutParams(localLayoutParams3);
          InAppBrowser.this.edittext.setId(Integer.valueOf(4).intValue());
          InAppBrowser.this.edittext.setSingleLine(true);
          InAppBrowser.this.edittext.setText(paramString);
          InAppBrowser.this.edittext.setInputType(16);
          InAppBrowser.this.edittext.setImeOptions(2);
          InAppBrowser.this.edittext.setInputType(0);
          EditText localEditText = InAppBrowser.this.edittext;
          View.OnKeyListener local3 = new View.OnKeyListener()
          {
            public boolean onKey(View paramAnonymous2View, int paramAnonymous2Int, KeyEvent paramAnonymous2KeyEvent)
            {
              if ((paramAnonymous2KeyEvent.getAction() == 0) && (paramAnonymous2Int == 66))
              {
                InAppBrowser.this.navigate(InAppBrowser.this.edittext.getText().toString());
                return true;
              }
              return false;
            }
          };
          localEditText.setOnKeyListener(local3);
          ImageButton localImageButton3 = new ImageButton(InAppBrowser.this.cordova.getActivity());
          RelativeLayout.LayoutParams localLayoutParams4 = new RelativeLayout.LayoutParams(-2, -1);
          localLayoutParams4.addRule(11);
          localImageButton3.setLayoutParams(localLayoutParams4);
          localImageButton2.setContentDescription("Close Button");
          localImageButton3.setId(Integer.valueOf(5).intValue());
          Drawable localDrawable3 = localResources.getDrawable(localResources.getIdentifier("ic_action_remove", "drawable", InAppBrowser.this.cordova.getActivity().getPackageName()));
          localImageButton3.setBackground(null);
          localImageButton3.setImageDrawable(localDrawable3);
          localImageButton3.setScaleType(ImageView.ScaleType.FIT_CENTER);
          localImageButton1.setPadding(0, dpToPixels(10), 0, dpToPixels(10));
          localImageButton3.getAdjustViewBounds();
          View.OnClickListener local4 = new View.OnClickListener()
          {
            public void onClick(View paramAnonymous2View)
            {
              InAppBrowser.this.closeDialog();
            }
          };
          localImageButton3.setOnClickListener(local4);
          InAppBrowser.access$102(InAppBrowser.this, new WebView(InAppBrowser.this.cordova.getActivity()));
          InAppBrowser.this.inAppWebView.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
          InAppBrowser.this.inAppWebView.setId(Integer.valueOf(6).intValue());
          InAppBrowser.this.inAppWebView.setWebChromeClient(new InAppChromeClient(this.val$thatWebView));
          InAppBrowser.InAppBrowserClient localInAppBrowserClient = new InAppBrowser.InAppBrowserClient(InAppBrowser.this, this.val$thatWebView, InAppBrowser.this.edittext);
          InAppBrowser.this.inAppWebView.setWebViewClient(localInAppBrowserClient);
          WebSettings localWebSettings = InAppBrowser.this.inAppWebView.getSettings();
          localWebSettings.setJavaScriptEnabled(true);
          localWebSettings.setJavaScriptCanOpenWindowsAutomatically(true);
          localWebSettings.setBuiltInZoomControls(InAppBrowser.this.showZoomControls);
          localWebSettings.setPluginState(WebSettings.PluginState.ON);
          if (Build.VERSION.SDK_INT >= 17) {
            localWebSettings.setMediaPlaybackRequiresUserGesture(InAppBrowser.this.mediaPlaybackRequiresUserGesture);
          }
          String str1 = InAppBrowser.this.preferences.getString("OverrideUserAgent", null);
          String str2 = InAppBrowser.this.preferences.getString("AppendUserAgent", null);
          if (str1 != null) {
            localWebSettings.setUserAgentString(str1);
          }
          if (str2 != null) {
            localWebSettings.setUserAgentString(localWebSettings.getUserAgentString() + str2);
          }
          Bundle localBundle = InAppBrowser.this.cordova.getActivity().getIntent().getExtras();
          boolean bool;
          if (localBundle == null)
          {
            bool = true;
            if (bool)
            {
              localWebSettings.setDatabasePath(InAppBrowser.this.cordova.getActivity().getApplicationContext().getDir("inAppBrowserDB", 0).getPath());
              localWebSettings.setDatabaseEnabled(true);
            }
            localWebSettings.setDomStorageEnabled(true);
            if (!InAppBrowser.this.clearAllCache) {
              break label1556;
            }
            CookieManager.getInstance().removeAllCookie();
          }
          for (;;)
          {
            InAppBrowser.this.inAppWebView.loadUrl(paramString);
            InAppBrowser.this.inAppWebView.setId(Integer.valueOf(6).intValue());
            InAppBrowser.this.inAppWebView.getSettings().setLoadWithOverviewMode(true);
            InAppBrowser.this.inAppWebView.getSettings().setUseWideViewPort(true);
            InAppBrowser.this.inAppWebView.requestFocus();
            InAppBrowser.this.inAppWebView.requestFocusFromTouch();
            localRelativeLayout2.addView(localImageButton1);
            localRelativeLayout2.addView(localImageButton2);
            localRelativeLayout1.addView(localRelativeLayout2);
            localRelativeLayout1.addView(InAppBrowser.this.edittext);
            localRelativeLayout1.addView(localImageButton3);
            if (InAppBrowser.this.getShowLocationBar()) {
              localLinearLayout.addView(localRelativeLayout1);
            }
            localLinearLayout.addView(InAppBrowser.this.inAppWebView);
            WindowManager.LayoutParams localLayoutParams = new WindowManager.LayoutParams();
            localLayoutParams.copyFrom(InAppBrowser.this.dialog.getWindow().getAttributes());
            localLayoutParams.width = -1;
            localLayoutParams.height = -1;
            InAppBrowser.this.dialog.setContentView(localLinearLayout);
            InAppBrowser.this.dialog.show();
            InAppBrowser.this.dialog.getWindow().setAttributes(localLayoutParams);
            if (InAppBrowser.this.openWindowHidden) {
              InAppBrowser.this.dialog.hide();
            }
            return;
            bool = localBundle.getBoolean("InAppBrowserStorageEnabled", true);
            break;
            label1556:
            if (InAppBrowser.this.clearSessionCache) {
              CookieManager.getInstance().removeSessionCookie();
            }
          }
        }
      };
      this.cordova.getActivity().runOnUiThread(local5);
      return "";
      label205:
      Boolean localBoolean7 = (Boolean)paramHashMap.get("clearsessioncache");
      if (localBoolean7 != null) {
        this.clearSessionCache = localBoolean7.booleanValue();
      }
    }
  }
  
  public class InAppBrowserClient
    extends WebViewClient
  {
    EditText edittext;
    CordovaWebView webView;
    
    public InAppBrowserClient(CordovaWebView paramCordovaWebView, EditText paramEditText)
    {
      this.webView = paramCordovaWebView;
      this.edittext = paramEditText;
    }
    
    public void onPageFinished(WebView paramWebView, String paramString)
    {
      super.onPageFinished(paramWebView, paramString);
      if (Build.VERSION.SDK_INT >= 21) {
        CookieManager.getInstance().flush();
      }
      for (;;)
      {
        try
        {
          JSONObject localJSONObject = new JSONObject();
          localJSONObject.put("type", "loadstop");
          localJSONObject.put("url", paramString);
          InAppBrowser.this.sendUpdate(localJSONObject, true);
          return;
        }
        catch (JSONException localJSONException)
        {
          Log.d("InAppBrowser", "Should never happen");
        }
        CookieSyncManager.getInstance().sync();
      }
    }
    
    public void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
    {
      super.onPageStarted(paramWebView, paramString, paramBitmap);
      if ((paramString.startsWith("http:")) || (paramString.startsWith("https:")) || (paramString.startsWith("file:"))) {}
      for (String str = paramString;; str = "http://" + paramString)
      {
        if (!str.equals(this.edittext.getText().toString())) {
          this.edittext.setText(str);
        }
        try
        {
          JSONObject localJSONObject = new JSONObject();
          localJSONObject.put("type", "loadstart");
          localJSONObject.put("url", str);
          InAppBrowser.this.sendUpdate(localJSONObject, true);
          return;
        }
        catch (JSONException localJSONException)
        {
          LOG.e("InAppBrowser", "URI passed in has caused a JSON error.");
        }
        LOG.e("InAppBrowser", "Possible Uncaught/Unknown URI");
      }
    }
    
    public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
    {
      super.onReceivedError(paramWebView, paramInt, paramString1, paramString2);
      try
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("type", "loaderror");
        localJSONObject.put("url", paramString2);
        localJSONObject.put("code", paramInt);
        localJSONObject.put("message", paramString1);
        InAppBrowser.this.sendUpdate(localJSONObject, true, PluginResult.Status.ERROR);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.d("InAppBrowser", "Should never happen");
      }
    }
    
    public void onReceivedHttpAuthRequest(WebView paramWebView, HttpAuthHandler paramHttpAuthHandler, String paramString1, String paramString2)
    {
      try
      {
        localPluginManager = (PluginManager)this.webView.getClass().getMethod("getPluginManager", new Class[0]).invoke(this.webView, new Object[0]);
        if (localPluginManager == null) {}
        try
        {
          localPluginManager = (PluginManager)this.webView.getClass().getField("pluginManager").get(this.webView);
          if ((localPluginManager != null) && (localPluginManager.onReceivedHttpAuthRequest(this.webView, new CordovaHttpAuthHandler(paramHttpAuthHandler), paramString1, paramString2))) {
            return;
          }
          super.onReceivedHttpAuthRequest(paramWebView, paramHttpAuthHandler, paramString1, paramString2);
          return;
        }
        catch (IllegalAccessException localIllegalAccessException1)
        {
          for (;;) {}
        }
        catch (NoSuchFieldException localNoSuchFieldException)
        {
          for (;;) {}
        }
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        for (;;)
        {
          localPluginManager = null;
        }
      }
      catch (IllegalAccessException localIllegalAccessException2)
      {
        for (;;)
        {
          localPluginManager = null;
        }
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        for (;;)
        {
          PluginManager localPluginManager = null;
        }
      }
    }
    
    public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
    {
      if (paramString.startsWith("tel:")) {
        try
        {
          Intent localIntent3 = new Intent("android.intent.action.DIAL");
          localIntent3.setData(Uri.parse(paramString));
          InAppBrowser.this.cordova.getActivity().startActivity(localIntent3);
          return true;
        }
        catch (ActivityNotFoundException localActivityNotFoundException3)
        {
          LOG.e("InAppBrowser", "Error dialing " + paramString + ": " + localActivityNotFoundException3.toString());
        }
      }
      do
      {
        for (;;)
        {
          return false;
          if ((!paramString.startsWith("geo:")) && (!paramString.startsWith("mailto:")) && (!paramString.startsWith("market:"))) {
            break;
          }
          try
          {
            Intent localIntent1 = new Intent("android.intent.action.VIEW");
            localIntent1.setData(Uri.parse(paramString));
            InAppBrowser.this.cordova.getActivity().startActivity(localIntent1);
            return true;
          }
          catch (ActivityNotFoundException localActivityNotFoundException1)
          {
            LOG.e("InAppBrowser", "Error with " + paramString + ": " + localActivityNotFoundException1.toString());
          }
        }
      } while (!paramString.startsWith("sms:"));
      for (;;)
      {
        Intent localIntent2;
        int i;
        try
        {
          localIntent2 = new Intent("android.intent.action.VIEW");
          i = paramString.indexOf('?');
          if (i != -1) {
            break label357;
          }
          str1 = paramString.substring(4);
          localIntent2.setData(Uri.parse("sms:" + str1));
          localIntent2.putExtra("address", str1);
          localIntent2.setType("vnd.android-dir/mms-sms");
          InAppBrowser.this.cordova.getActivity().startActivity(localIntent2);
          return true;
        }
        catch (ActivityNotFoundException localActivityNotFoundException2)
        {
          LOG.e("InAppBrowser", "Error sending sms " + paramString + ":" + localActivityNotFoundException2.toString());
        }
        break;
        label357:
        String str1 = paramString.substring(4, i);
        String str2 = Uri.parse(paramString).getQuery();
        if ((str2 != null) && (str2.startsWith("body="))) {
          localIntent2.putExtra("sms_body", str2.substring(5));
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/inappbrowser/InAppBrowser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */