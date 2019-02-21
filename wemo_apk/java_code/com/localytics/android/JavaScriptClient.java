package com.localytics.android;

import android.os.Handler;
import android.os.Looper;
import android.util.SparseArray;
import android.webkit.JavascriptInterface;

final class JavaScriptClient
{
  private final SparseArray<MarketingCallable> mCallbacks;
  
  JavaScriptClient(SparseArray<MarketingCallable> paramSparseArray)
  {
    this.mCallbacks = paramSparseArray;
  }
  
  private Object invoke(int paramInt, Object[] paramArrayOfObject)
  {
    SparseArray localSparseArray = this.mCallbacks;
    Object localObject = null;
    if (localSparseArray != null)
    {
      MarketingCallable localMarketingCallable = (MarketingCallable)this.mCallbacks.get(paramInt);
      localObject = null;
      if (localMarketingCallable != null) {
        localObject = localMarketingCallable.call(paramArrayOfObject);
      }
    }
    return localObject;
  }
  
  String getAttributes()
  {
    return (String)invoke(7, null);
  }
  
  SparseArray<MarketingCallable> getCallbacks()
  {
    return this.mCallbacks;
  }
  
  String getCustomDimensions()
  {
    return (String)invoke(6, null);
  }
  
  String getIdentifiers()
  {
    return (String)invoke(5, null);
  }
  
  String getJsGlueCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = getIdentifiers();
    arrayOfObject[1] = getCustomDimensions();
    arrayOfObject[2] = getAttributes();
    arrayOfObject[3] = Localytics.getLibraryVersion();
    return String.format("javascript:(function() {  var localyticsScript = document.createElement('script');  localyticsScript.type = 'text/javascript';  localyticsScript.text = '  localytics.identifers = %s;  localytics.customDimensions = %s;  localytics.attributes = %s;  localytics.libraryVersion = \"%s\";  localytics.tagEvent = function(event, attributes, customerValueIncrease) {     localytics.nativeTagEvent(event, JSON.stringify(attributes), JSON.stringify(customerValueIncrease));  };  localytics.setCustomDimension = function(number, value) {     if (number != null && value != null)        localytics.nativeSetCustomDimension(number, value);  };  window.open = function(url) {     if (url != null)        localytics.navigate(url);  };  localytics.close = function() {     localytics.nativeClose();  };';  document.getElementsByTagName('body')[0].appendChild(localyticsScript);})()", arrayOfObject);
  }
  
  @JavascriptInterface
  public void nativeClose()
  {
    Localytics.Log.w("[JavaScriptClient]: nativeClose is being called");
    new Handler(Looper.getMainLooper()).post(new Runnable()
    {
      public void run()
      {
        JavaScriptClient.this.invoke(4, null);
      }
    });
  }
  
  @JavascriptInterface
  public void nativeSetCustomDimension(long paramLong, String paramString)
  {
    Localytics.Log.w("[JavaScriptClient]: nativeSetCustomDimension is being called");
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf((int)paramLong);
    arrayOfObject[1] = paramString;
    invoke(8, arrayOfObject);
  }
  
  @JavascriptInterface
  public void nativeTagEvent(String paramString1, String paramString2, String paramString3)
  {
    Localytics.Log.w("[JavaScriptClient]: nativeTagEvent is being called");
    invoke(3, new Object[] { paramString1, paramString2, paramString3 });
  }
  
  @JavascriptInterface
  public void navigate(String paramString)
  {
    invoke(15, new String[] { paramString });
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/JavaScriptClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */