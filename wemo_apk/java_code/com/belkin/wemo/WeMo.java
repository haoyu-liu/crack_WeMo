package com.belkin.wemo;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.belkin.wemo.exception.WeMoInitException;

public enum WeMo
{
  private static String apiKey;
  private static Context context;
  private static Handler mainHandler;
  private static Looper mainLooper;
  
  static
  {
    WeMo[] arrayOfWeMo = new WeMo[1];
    arrayOfWeMo[0] = INSTANCE;
    $VALUES = arrayOfWeMo;
  }
  
  private WeMo() {}
  
  public static Handler getMainHandler()
  {
    return mainHandler;
  }
  
  public static Looper getMainLooper()
  {
    return mainLooper;
  }
  
  public static void initialize(String paramString, Context paramContext)
    throws WeMoInitException
  {
    if (paramContext == null) {
      throw new WeMoInitException("Context in NULL!");
    }
    if (TextUtils.isEmpty(paramString)) {
      throw new WeMoInitException("Invalid WEMO SDK API key.");
    }
    context = paramContext;
    mainLooper = Looper.getMainLooper();
    mainHandler = new Handler(Looper.getMainLooper());
  }
  
  public void destroy()
  {
    context = null;
    mainHandler = null;
    mainHandler = null;
  }
  
  public String getApiKey()
  {
    return apiKey;
  }
  
  public Context getContext()
  {
    return context;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/WeMo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */