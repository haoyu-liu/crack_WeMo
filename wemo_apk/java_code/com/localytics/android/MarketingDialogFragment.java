package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;

public final class MarketingDialogFragment
  extends DialogFragment
{
  private static final String AMP_DESCRIPTION = "amp_view";
  private static final String CLOSE_BUTTON_DESCRIPTION = "close_button";
  private static final int CLOSE_BUTTON_ID = 1;
  static final String DIALOG_TAG = "marketing_dialog";
  private static final int OPENING_EXTERNAL = 2;
  private static final int OPENING_INTERNAL = 1;
  private static final int PROTOCOL_UNMATCHED = -1;
  private static final int PROTOCOL_UNRECOGNIZED = -2;
  private static final int WEB_VIEW_ID = 2;
  private static Localytics.InAppMessageDismissButtonLocation dismissButtonLocation = Localytics.InAppMessageDismissButtonLocation.LEFT;
  private static Bitmap sDismissButtonImage = null;
  private SparseArray<MarketingCallable> mCallbacks;
  private final AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  private final AtomicBoolean mExitAnimatable = new AtomicBoolean(true);
  private JavaScriptClient mJavaScriptClient;
  private MarketingDialog mMarketingDialog;
  private MarketingMessage mMarketingMessage;
  private final AtomicBoolean mUploadedViewEvent = new AtomicBoolean(false);
  
  static Localytics.InAppMessageDismissButtonLocation getInAppDismissButtonLocation()
  {
    return dismissButtonLocation;
  }
  
  private String getValueByQueryKey(String paramString, URI paramURI)
  {
    String str1 = paramURI.getQuery();
    if ((TextUtils.isEmpty(paramString)) || (TextUtils.isEmpty(str1))) {}
    for (;;)
    {
      return null;
      String[] arrayOfString1 = paramURI.getQuery().split("[&]");
      int i = arrayOfString1.length;
      for (int j = 0; j < i; j++)
      {
        String[] arrayOfString2 = arrayOfString1[j].split("[=]");
        if ((arrayOfString2[0].compareTo(paramString) == 0) && (2 == arrayOfString2.length)) {
          try
          {
            String str2 = URLDecoder.decode(arrayOfString2[1], "UTF-8");
            return str2;
          }
          catch (UnsupportedEncodingException localUnsupportedEncodingException)
          {
            return null;
          }
        }
      }
    }
  }
  
  private String getValueByQueryKey(String paramString, URL paramURL)
  {
    try
    {
      String str = getValueByQueryKey(paramString, paramURL.toURI());
      return str;
    }
    catch (URISyntaxException localURISyntaxException) {}
    return null;
  }
  
  private int handleCustomProtocolRequest(String paramString, Activity paramActivity)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW", Uri.parse(paramString));
    if (this.mMarketingDialog.getContext().getPackageManager().queryIntentActivities(localIntent, 0).size() > 0)
    {
      Localytics.Log.w("[In-app Nav Handler]: An app on this device is registered to handle this protocol scheme. Opening...");
      localIntent.setFlags(131072);
      paramActivity.startActivity(localIntent);
      return 2;
    }
    return -2;
  }
  
  private int handleCustomProtocolRequest(URL paramURL, Activity paramActivity)
  {
    return handleCustomProtocolRequest(paramURL.toString(), paramActivity);
  }
  
  private int handleFileProtocolRequest(URL paramURL)
  {
    if (!paramURL.getProtocol().equals("file")) {
      return -1;
    }
    Localytics.Log.w("[In-app Nav Handler]: Displaying content from your local creatives.");
    return 1;
  }
  
  private int handleHttpProtocolRequest(URL paramURL, Activity paramActivity)
  {
    String str1 = paramURL.getProtocol();
    if ((!str1.equals("http")) && (!str1.equals("https"))) {
      return -1;
    }
    Localytics.Log.w("[In-app Nav Handler]: Handling a request for an external HTTP address.");
    String str2 = getValueByQueryKey("ampExternalOpen", paramURL);
    if ((!TextUtils.isEmpty(str2)) && (str2.toLowerCase(Locale.US).equals("true")))
    {
      Localytics.Log.w(String.format("[In-app Nav Handler]: Query string hook [%s] set to true. Opening the URL in chrome", new Object[] { "ampExternalOpen" }));
      Intent localIntent = new Intent("android.intent.action.VIEW", Uri.parse(paramURL.toString()));
      if (this.mMarketingDialog.getContext().getPackageManager().queryIntentActivities(localIntent, 0).size() > 0)
      {
        paramActivity.startActivity(localIntent);
        return 2;
      }
    }
    Localytics.Log.w("[In-app Nav Handler]: Loading HTTP request inside the current in-app view");
    return 1;
  }
  
  static MarketingDialogFragment newInstance()
  {
    MarketingDialogFragment localMarketingDialogFragment = new MarketingDialogFragment();
    localMarketingDialogFragment.setRetainInstance(true);
    return localMarketingDialogFragment;
  }
  
  static void setDismissButtonImage(Bitmap paramBitmap)
  {
    if (sDismissButtonImage != null) {
      sDismissButtonImage.recycle();
    }
    sDismissButtonImage = paramBitmap;
  }
  
  static void setInAppDismissButtonLocation(Localytics.InAppMessageDismissButtonLocation paramInAppMessageDismissButtonLocation)
  {
    dismissButtonLocation = paramInAppMessageDismissButtonLocation;
  }
  
  private void tagMarketingActionEventWithAction(String paramString)
  {
    if (Constants.isTestModeEnabled()) {}
    TreeMap localTreeMap;
    do
    {
      do
      {
        return;
        if (this.mUploadedViewEvent.getAndSet(true))
        {
          Localytics.Log.w(String.format("The in-app action for this message has already been set. Ignoring in-app Action: [%s]", new Object[] { paramString }));
          return;
        }
        localTreeMap = new TreeMap();
        localTreeMap.put("ampAction", paramString);
        localTreeMap.put("type", "In-App");
        localTreeMap.put("ampCampaignId", this.mMarketingMessage.get("campaign_id").toString());
        localTreeMap.put("ampCampaign", this.mMarketingMessage.get("rule_name_non_unique").toString());
        localTreeMap.put("Schema Version - Client", String.valueOf(3));
        Object localObject = this.mMarketingMessage.get("schema_version");
        if (localObject != null) {
          localTreeMap.put("Schema Version - Server", localObject.toString());
        }
        String str = (String)this.mMarketingMessage.get("ab_test");
        if (!TextUtils.isEmpty(str)) {
          localTreeMap.put("ampAB", str);
        }
      } while (this.mCallbacks == null);
      MarketingCallable localMarketingCallable = (MarketingCallable)this.mCallbacks.get(2);
      if (localMarketingCallable != null) {
        localMarketingCallable.call(new Object[] { "ampView", localTreeMap });
      }
    } while (!Constants.IS_LOGGING_ENABLED);
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = localTreeMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localStringBuilder.append("Key = ").append((String)localEntry.getKey()).append(", Value = ").append((String)localEntry.getValue());
    }
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = localStringBuilder.toString();
    Localytics.Log.v(String.format("In-app event tagged successfully.\n   Attributes Dictionary = \n%s", arrayOfObject));
  }
  
  private void tagMarketingActionForURL(URI paramURI)
  {
    String str1 = getValueByQueryKey("ampAction", paramURI);
    if (!TextUtils.isEmpty(str1))
    {
      Localytics.Log.w(String.format("Attempting to tag event with custom in-app action. [Action: %s]", new Object[] { str1 }));
      tagMarketingActionEventWithAction(str1);
    }
    String str2;
    do
    {
      return;
      str2 = paramURI.getScheme();
    } while ((str2.equals("file")) || (str2.equals("http")) || (str2.equals("https")));
    tagMarketingActionEventWithAction("click");
  }
  
  void dismissCampaign()
  {
    if (this.mMarketingDialog != null)
    {
      if (this.mMarketingMessage != null) {
        tagMarketingActionEventWithAction("X");
      }
      this.mMarketingDialog.dismiss();
    }
  }
  
  boolean handleUrl(String paramString, Activity paramActivity)
  {
    bool = true;
    str = paramString;
    Object[] arrayOfObject1 = new Object[bool];
    arrayOfObject1[0] = str;
    Localytics.Log.w(String.format("[In-app Nav Handler]: Evaluating in-app URL:\n\tURL:%s", arrayOfObject1));
    i = 0;
    for (;;)
    {
      try
      {
        if (str.endsWith("://")) {
          str = str.substring(0, -1 + str.length());
        }
        tagMarketingActionForURL(new URI(str));
        localURL = new URL(str);
        int k = handleFileProtocolRequest(localURL);
        i = k;
        if (i <= 0) {
          continue;
        }
        if (i != 2) {
          continue;
        }
      }
      catch (Exception localException)
      {
        URL localURL;
        int m;
        int n;
        Object[] arrayOfObject2;
        int j = handleCustomProtocolRequest(str, paramActivity);
        i = j;
        if (i <= 0) {
          continue;
        }
        if (i != 2) {
          continue;
        }
        return bool;
        bool = false;
        continue;
        Localytics.Log.w(String.format("[In-app Nav Handler]: Invalid url %s", new Object[] { paramString }));
        this.mMarketingDialog.dismissWithAnimation();
        if (i != 2) {
          continue;
        }
        this.mMarketingDialog.dismissWithAnimation();
        continue;
      }
      finally
      {
        if (i != 2) {
          continue;
        }
        this.mMarketingDialog.dismissWithAnimation();
      }
      return bool;
      bool = false;
      continue;
      m = handleHttpProtocolRequest(localURL, paramActivity);
      i = m;
      if (i > 0)
      {
        if (i == 2)
        {
          if (i == 2)
          {
            this.mMarketingDialog.dismissWithAnimation();
            return bool;
          }
        }
        else
        {
          bool = false;
          continue;
        }
      }
      else
      {
        n = handleCustomProtocolRequest(localURL, paramActivity);
        i = n;
        if (i <= 0) {
          continue;
        }
        if (i == 2)
        {
          if (i == 2)
          {
            this.mMarketingDialog.dismissWithAnimation();
            return bool;
          }
        }
        else {
          bool = false;
        }
      }
    }
    arrayOfObject2 = new Object[1];
    arrayOfObject2[0] = localURL.getProtocol();
    Localytics.Log.w(String.format("[In-app Nav Handler]: Protocol handler scheme not recognized. Attempting to load the URL... [Scheme: %s]", arrayOfObject2));
    if (i == 2) {
      this.mMarketingDialog.dismissWithAnimation();
    }
    return false;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onActivityCreated");
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    Localytics.Log.v("[InAppDialogFragment]: onAttach");
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onCreate");
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onCreateDialog");
    MarketingDialog localMarketingDialog = new MarketingDialog(getActivity(), 16973835);
    this.mMarketingDialog = localMarketingDialog;
    return localMarketingDialog;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onCreateView");
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    Localytics.Log.v("[InAppDialogFragment]: onDestroy");
    if (this.mCallbacks != null)
    {
      MarketingCallable localMarketingCallable = (MarketingCallable)this.mCallbacks.get(1);
      if ((!Constants.isTestModeEnabled()) && (localMarketingCallable != null))
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = this.mMarketingMessage;
        localMarketingCallable.call(arrayOfObject);
      }
    }
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    Localytics.Log.v("[InAppDialogFragment]: onDestroyView");
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    Localytics.Log.v("[InAppDialogFragment]: onDetach");
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    Localytics.Log.v("[InAppDialogFragment]: onDismiss");
    try
    {
      if (this.mMarketingMessage != null) {
        tagMarketingActionEventWithAction("X");
      }
      super.onDismiss(paramDialogInterface);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Localytics.Log.e("MarketingDialogFragment onDismiss", localException);
      }
    }
  }
  
  public void onPause()
  {
    Localytics.Log.v("[InAppDialogFragment]: onPause");
    super.onPause();
  }
  
  public void onResume()
  {
    Localytics.Log.v("[InAppDialogFragment]: onResume");
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onSaveInstanceState");
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    Localytics.Log.v("[InAppDialogFragment]: onStart");
    super.onStart();
  }
  
  public void onStop()
  {
    Localytics.Log.v("[InAppDialogFragment]: onStop");
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    Localytics.Log.v("[InAppDialogFragment]: onViewStateRestored");
    super.onViewStateRestored(paramBundle);
  }
  
  public MarketingDialogFragment setCallbacks(SparseArray<MarketingCallable> paramSparseArray)
  {
    this.mCallbacks = paramSparseArray;
    return this;
  }
  
  MarketingDialogFragment setData(MarketingMessage paramMarketingMessage)
  {
    this.mMarketingMessage = paramMarketingMessage;
    return this;
  }
  
  MarketingDialogFragment setJavaScriptClient(JavaScriptClient paramJavaScriptClient)
  {
    this.mJavaScriptClient = paramJavaScriptClient;
    SparseArray localSparseArray = this.mJavaScriptClient.getCallbacks();
    localSparseArray.put(15, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        final String str = (String)paramAnonymousArrayOfObject[0];
        final MarketingDialogFragment.MarketingDialog.MarketingWebView localMarketingWebView = MarketingDialogFragment.MarketingDialog.access$100(MarketingDialogFragment.this.mMarketingDialog);
        if (MarketingDialogFragment.this.handleUrl(str, MarketingDialogFragment.this.getActivity())) {
          new Handler(Looper.getMainLooper()).post(new Runnable()
          {
            public void run()
            {
              localMarketingWebView.loadUrl(str);
            }
          });
        }
        return null;
      }
    });
    localSparseArray.put(4, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        MarketingDialogFragment.this.mMarketingDialog.dismissWithAnimation();
        return null;
      }
    });
    return this;
  }
  
  final class MarketingDialog
    extends Dialog
  {
    private static final String LOCATION_BOTTOM = "bottom";
    private static final String LOCATION_CENTER = "center";
    private static final String LOCATION_FULL = "full";
    private static final String LOCATION_TOP = "top";
    private static final int MARGIN = 10;
    private static final int MAX_BANNER_WIDTH_DIP = 360;
    private TranslateAnimation mAnimBottomIn;
    private TranslateAnimation mAnimBottomOut;
    private TranslateAnimation mAnimCenterIn;
    private TranslateAnimation mAnimCenterOut;
    private TranslateAnimation mAnimFullIn;
    private TranslateAnimation mAnimFullOut;
    private TranslateAnimation mAnimTopIn;
    private TranslateAnimation mAnimTopOut;
    private CloseButton mBtnClose;
    private RelativeLayout mDialogLayout;
    private float mHeight;
    private String mLocation;
    private DisplayMetrics mMetrics;
    private RelativeLayout mRootLayout;
    private MarketingWebView mWebView;
    private float mWidth;
    
    MarketingDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      if (MarketingDialogFragment.this.mMarketingMessage == null)
      {
        MarketingDialogFragment.this.dismiss();
        return;
      }
      this.mLocation = ((String)MarketingDialogFragment.this.mMarketingMessage.get("location"));
      setupViews();
      createAnimations();
      adjustLayout();
      String str = (String)MarketingDialogFragment.this.mMarketingMessage.get("html_url");
      if (str != null)
      {
        this.mWebView.loadUrl(str);
        return;
      }
      new Handler(Looper.getMainLooper()).post(new Runnable()
      {
        public void run()
        {
          MarketingDialogFragment.MarketingDialog.this.dismiss();
        }
      });
    }
    
    @SuppressLint({"NewApi"})
    private void adjustLayout()
    {
      this.mMetrics = new DisplayMetrics();
      ((WindowManager)MarketingDialogFragment.this.getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(this.mMetrics);
      this.mWidth = ((Float)MarketingDialogFragment.this.mMarketingMessage.get("display_width")).floatValue();
      this.mHeight = ((Float)MarketingDialogFragment.this.mMarketingMessage.get("display_height")).floatValue();
      float f1 = this.mHeight / this.mWidth;
      float f2 = Math.min(360.0F * this.mMetrics.density, Math.min(this.mMetrics.widthPixels, this.mMetrics.heightPixels));
      Window localWindow = getWindow();
      WindowManager.LayoutParams localLayoutParams = localWindow.getAttributes();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setFlags(32, 32);
      if (this.mLocation.equals("center"))
      {
        localWindow.setLayout(this.mMetrics.widthPixels, this.mMetrics.heightPixels);
        int i = (int)(0.5F + 10.0F * this.mMetrics.density);
        ViewGroup.MarginLayoutParams localMarginLayoutParams = (ViewGroup.MarginLayoutParams)this.mWebView.getLayoutParams();
        localMarginLayoutParams.width = ((int)Math.min(f2 - (i << 1), (int)(0.5F + this.mWidth * this.mMetrics.density)) + (i << 1));
        localMarginLayoutParams.height = ((int)(f1 * Math.min(f2 - (i << 1), (int)(0.5F + this.mWidth * this.mMetrics.density))) + (i << 1));
        localMarginLayoutParams.setMargins(i, i, i, i);
        this.mWebView.setLayoutParams(localMarginLayoutParams);
        this.mWebView.requestLayout();
        RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)this.mBtnClose.getLayoutParams();
        localLayoutParams1.setMargins(0, 0, -i, 0);
        this.mBtnClose.setLayoutParams(localLayoutParams1);
        this.mBtnClose.requestLayout();
      }
      for (;;)
      {
        localWindow.setFlags(1024, 1024);
        return;
        if (this.mLocation.equals("full"))
        {
          localWindow.setLayout(this.mMetrics.widthPixels, this.mMetrics.heightPixels);
        }
        else if (this.mLocation.equals("top"))
        {
          localLayoutParams.y = -268435455;
          localLayoutParams.dimAmount = 0.0F;
          localWindow.setLayout((int)f2, (int)(0.5F + f2 * f1));
        }
        else if (this.mLocation.equals("bottom"))
        {
          localLayoutParams.y = 268435455;
          localLayoutParams.dimAmount = 0.0F;
          localWindow.setLayout((int)f2, (int)(0.5F + f2 * f1));
        }
      }
    }
    
    private void createAnimations()
    {
      this.mAnimCenterIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      this.mAnimCenterIn.setDuration(500L);
      this.mAnimCenterOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      this.mAnimCenterOut.setDuration(500L);
      this.mAnimTopIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, -1.0F, 2, 0.0F);
      this.mAnimTopIn.setDuration(500L);
      this.mAnimTopOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, -1.0F);
      this.mAnimTopOut.setDuration(500L);
      this.mAnimBottomIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      this.mAnimBottomIn.setDuration(500L);
      this.mAnimBottomOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      this.mAnimBottomOut.setDuration(500L);
      this.mAnimFullIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      this.mAnimFullIn.setDuration(500L);
      this.mAnimFullOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      this.mAnimFullOut.setDuration(500L);
      Animation.AnimationListener local3 = new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          try
          {
            MarketingDialogFragment.this.dismiss();
            return;
          }
          catch (Exception localException)
          {
            LocalyticsManager.throwOrLogError(RuntimeException.class, "Localytics library threw an uncaught exception", localException);
          }
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation)
        {
          if (MarketingDialogFragment.this.mCallbacks != null)
          {
            MarketingCallable localMarketingCallable = (MarketingCallable)MarketingDialogFragment.this.mCallbacks.get(17);
            if ((!Constants.isTestModeEnabled()) && (localMarketingCallable != null)) {
              localMarketingCallable.call(null);
            }
          }
        }
      };
      this.mAnimCenterOut.setAnimationListener(local3);
      this.mAnimTopOut.setAnimationListener(local3);
      this.mAnimBottomOut.setAnimationListener(local3);
      this.mAnimFullOut.setAnimationListener(local3);
      Animation.AnimationListener local4 = new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          if (MarketingDialogFragment.this.mCallbacks != null)
          {
            MarketingCallable localMarketingCallable = (MarketingCallable)MarketingDialogFragment.this.mCallbacks.get(16);
            if ((!Constants.isTestModeEnabled()) && (localMarketingCallable != null))
            {
              Object[] arrayOfObject = new Object[1];
              arrayOfObject[0] = MarketingDialogFragment.this.mMarketingMessage;
              localMarketingCallable.call(arrayOfObject);
            }
          }
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      };
      this.mAnimCenterIn.setAnimationListener(local4);
      this.mAnimTopIn.setAnimationListener(local4);
      this.mAnimBottomIn.setAnimationListener(local4);
      this.mAnimFullIn.setAnimationListener(local4);
    }
    
    private void setupViews()
    {
      this.mRootLayout = new RelativeLayout(getContext());
      this.mRootLayout.setVisibility(4);
      this.mRootLayout.setContentDescription("amp_view");
      this.mRootLayout.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
      this.mDialogLayout = new RelativeLayout(getContext());
      RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams1.addRule(13);
      this.mDialogLayout.setLayoutParams(localLayoutParams1);
      this.mRootLayout.addView(this.mDialogLayout);
      this.mWebView = new MarketingWebView(getContext(), null);
      this.mWebView.setId(2);
      this.mDialogLayout.addView(this.mWebView);
      this.mBtnClose = new CloseButton(getContext(), null);
      this.mBtnClose.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (MarketingDialogFragment.this.mExitAnimatable.getAndSet(false)) {
            MarketingDialogFragment.MarketingDialog.this.dismissWithAnimation();
          }
        }
      });
      if (MarketingDialogFragment.dismissButtonLocation == Localytics.InAppMessageDismissButtonLocation.RIGHT)
      {
        RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)this.mBtnClose.getLayoutParams();
        localLayoutParams2.addRule(7, this.mWebView.getId());
        this.mBtnClose.setLayoutParams(localLayoutParams2);
      }
      this.mDialogLayout.addView(this.mBtnClose);
      requestWindowFeature(1);
      setContentView(this.mRootLayout);
    }
    
    void dismissWithAnimation()
    {
      new Handler(Looper.getMainLooper()).post(new Runnable()
      {
        public void run()
        {
          String str = (String)MarketingDialogFragment.this.mMarketingMessage.get("location");
          if (str.equals("center")) {
            MarketingDialogFragment.MarketingDialog.this.mRootLayout.startAnimation(MarketingDialogFragment.MarketingDialog.this.mAnimCenterOut);
          }
          do
          {
            return;
            if (str.equals("full"))
            {
              MarketingDialogFragment.MarketingDialog.this.mRootLayout.startAnimation(MarketingDialogFragment.MarketingDialog.this.mAnimFullOut);
              return;
            }
            if (str.equals("top"))
            {
              MarketingDialogFragment.MarketingDialog.this.mRootLayout.startAnimation(MarketingDialogFragment.MarketingDialog.this.mAnimTopOut);
              return;
            }
          } while (!str.equals("bottom"));
          MarketingDialogFragment.MarketingDialog.this.mRootLayout.startAnimation(MarketingDialogFragment.MarketingDialog.this.mAnimBottomOut);
        }
      });
    }
    
    void enterWithAnimation()
    {
      String str = (String)MarketingDialogFragment.this.mMarketingMessage.get("location");
      if (str.equals("center")) {
        this.mRootLayout.startAnimation(this.mAnimCenterIn);
      }
      do
      {
        return;
        if (str.equals("full"))
        {
          this.mRootLayout.startAnimation(this.mAnimFullIn);
          return;
        }
        if (str.equals("top"))
        {
          this.mRootLayout.startAnimation(this.mAnimTopIn);
          return;
        }
      } while (!str.equals("bottom"));
      this.mRootLayout.startAnimation(this.mAnimBottomIn);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4)
      {
        if (MarketingDialogFragment.this.mExitAnimatable.getAndSet(false)) {
          dismissWithAnimation();
        }
        return true;
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    
    protected void onStop()
    {
      if (this.mBtnClose != null) {
        this.mBtnClose.release();
      }
      super.onStop();
    }
    
    final class CloseButton
      extends View
    {
      private Bitmap mBitmap;
      private final float mCenterX;
      private final float mCenterY;
      private final float mInnerRadius;
      private final float mOffset;
      private final Paint mPaint;
      private final float mRadius;
      private final Paint mShadowInnerPaint;
      private final Paint mShadowOuterPaint;
      private final float mStrokeWidth;
      
      @TargetApi(11)
      CloseButton(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        setId(1);
        setContentDescription("close_button");
        if (DatapointHelper.getApiLevel() >= 14) {
          setLayerType(1, null);
        }
        float f1 = getResources().getDisplayMetrics().density;
        this.mCenterX = (13.0F * f1);
        this.mCenterY = (13.0F * f1);
        this.mRadius = (13.0F * f1);
        this.mOffset = (5.0F * f1);
        this.mStrokeWidth = (2.5F * f1);
        this.mInnerRadius = (this.mRadius - 0.5F * this.mStrokeWidth);
        this.mPaint = new Paint(1);
        this.mShadowInnerPaint = new Paint(1);
        this.mShadowInnerPaint.setMaskFilter(new BlurMaskFilter(this.mRadius - f1, BlurMaskFilter.Blur.INNER));
        this.mShadowOuterPaint = new Paint(1);
        this.mShadowOuterPaint.setMaskFilter(new BlurMaskFilter(2.0F * f1, BlurMaskFilter.Blur.OUTER));
        if (MarketingDialogFragment.sDismissButtonImage == null) {}
        for (float f2 = 30.0F;; f2 = 40.0F)
        {
          float f3 = 0.5F + f2 * f1;
          setLayoutParams(new RelativeLayout.LayoutParams((int)f3, (int)f3));
          this.mBitmap = Bitmap.createBitmap((int)(0.5F + 26.0F * f1), (int)(0.5F + 26.0F * f1), Bitmap.Config.ARGB_8888);
          Canvas localCanvas = new Canvas(this.mBitmap);
          this.mPaint.setColor(-16777216);
          this.mPaint.setStyle(Paint.Style.FILL);
          localCanvas.drawCircle(this.mCenterX, this.mCenterY, this.mRadius, this.mPaint);
          this.mPaint.setColor(-1);
          this.mPaint.setStyle(Paint.Style.STROKE);
          this.mPaint.setStrokeWidth(this.mStrokeWidth);
          localCanvas.drawCircle(this.mCenterX, this.mCenterY, this.mInnerRadius, this.mPaint);
          this.mPaint.setStrokeWidth(4.5F * f1);
          localCanvas.drawLine(this.mCenterX - this.mOffset, this.mCenterY - this.mOffset, this.mCenterX + this.mOffset, this.mCenterY + this.mOffset, this.mPaint);
          localCanvas.drawLine(this.mCenterX - this.mOffset, this.mCenterY + this.mOffset, this.mCenterX + this.mOffset, this.mCenterY - this.mOffset, this.mPaint);
          return;
        }
      }
      
      protected void onDraw(Canvas paramCanvas)
      {
        super.onDraw(paramCanvas);
        float f1 = getResources().getDisplayMetrics().density;
        Bitmap localBitmap;
        float f2;
        if (MarketingDialogFragment.sDismissButtonImage != null)
        {
          localBitmap = MarketingDialogFragment.sDismissButtonImage;
          f2 = (localBitmap.getHeight() - localBitmap.getWidth()) / 2.0F;
          paramCanvas.drawBitmap(localBitmap, f2, 0.0F, this.mPaint);
        }
        while (this.mBitmap == null) {
          return;
        }
        if (MarketingDialogFragment.dismissButtonLocation == Localytics.InAppMessageDismissButtonLocation.LEFT) {
          f2 = 0.0F;
        }
        for (float f3 = f1;; f3 = 3.0F * f1)
        {
          paramCanvas.drawCircle(f3 + this.mCenterX, f1 + this.mCenterY, this.mRadius - f1, this.mShadowInnerPaint);
          paramCanvas.drawCircle(f3 + this.mCenterX, f1 + this.mCenterY, this.mRadius - f1, this.mShadowOuterPaint);
          localBitmap = this.mBitmap;
          break;
          f2 = 4.0F * f1;
        }
      }
      
      public void release()
      {
        if (this.mBitmap != null)
        {
          this.mBitmap.recycle();
          this.mBitmap = null;
        }
      }
    }
    
    final class MarketingWebView
      extends WebView
    {
      @SuppressLint({"SetJavaScriptEnabled"})
      @TargetApi(16)
      MarketingWebView(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        if (DatapointHelper.getApiLevel() >= 19) {
          setLayerType(1, null);
        }
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -1);
        localLayoutParams.gravity = 17;
        setLayoutParams(localLayoutParams);
        setBackgroundColor(0);
        setInitialScale(1);
        setHorizontalScrollBarEnabled(false);
        setVerticalScrollBarEnabled(false);
        setWebViewClient(new MarketingWebViewClient(MarketingDialogFragment.this.getActivity()));
        WebSettings localWebSettings = getSettings();
        localWebSettings.setJavaScriptEnabled(true);
        addJavascriptInterface(MarketingDialogFragment.this.mJavaScriptClient, "localytics");
        localWebSettings.setUseWideViewPort(true);
        if (DatapointHelper.getApiLevel() >= 16) {
          localWebSettings.setAllowUniversalAccessFromFileURLs(true);
        }
      }
      
      final class MarketingWebViewClient
        extends WebViewClient
      {
        private final Activity mActivity;
        
        MarketingWebViewClient(Activity paramActivity)
        {
          this.mActivity = paramActivity;
        }
        
        public void onPageFinished(WebView paramWebView, String paramString)
        {
          if (((String)MarketingDialogFragment.this.mMarketingMessage.get("location")).equals("center")) {}
          for (int i = (int)(0.5F + 10.0F * MarketingDialogFragment.MarketingDialog.this.mMetrics.density) << 1;; i = 0)
          {
            int j = Math.min(MarketingDialogFragment.MarketingDialog.this.mMetrics.widthPixels, MarketingDialogFragment.MarketingDialog.this.mMetrics.heightPixels) - i;
            int k = Math.max(MarketingDialogFragment.MarketingDialog.this.mMetrics.widthPixels, MarketingDialogFragment.MarketingDialog.this.mMetrics.heightPixels) - i;
            float f1 = Math.min(j, (int)(0.5F + MarketingDialogFragment.MarketingDialog.this.mWidth * MarketingDialogFragment.MarketingDialog.this.mMetrics.density)) / MarketingDialogFragment.MarketingDialog.this.mMetrics.density;
            float f2 = Math.min(k, (int)(0.5F + MarketingDialogFragment.MarketingDialog.this.mHeight * MarketingDialogFragment.MarketingDialog.this.mMetrics.density)) / MarketingDialogFragment.MarketingDialog.this.mMetrics.density;
            Object[] arrayOfObject = new Object[2];
            arrayOfObject[0] = Float.valueOf(f1);
            arrayOfObject[1] = Float.valueOf(f2);
            paramWebView.loadUrl(String.format("javascript:(function() {  var viewportNode = document.createElement('meta');  viewportNode.name    = 'viewport';  viewportNode.content = 'width=%f, height=%f, user-scalable=no, minimum-scale=.25, maximum-scale=1';  viewportNode.id      = 'metatag';  document.getElementsByTagName('head')[0].appendChild(viewportNode);})()", arrayOfObject));
            paramWebView.loadUrl(MarketingDialogFragment.this.mJavaScriptClient.getJsGlueCode());
            MarketingDialogFragment.MarketingDialog.this.mRootLayout.setVisibility(0);
            if (MarketingDialogFragment.this.mEnterAnimatable.getAndSet(false)) {
              MarketingDialogFragment.MarketingDialog.this.enterWithAnimation();
            }
            return;
          }
        }
        
        public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
        {
          return MarketingDialogFragment.this.handleUrl(paramString, this.mActivity);
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingDialogFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */