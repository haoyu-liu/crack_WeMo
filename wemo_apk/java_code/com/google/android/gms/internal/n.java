package com.google.android.gms.internal;

import android.util.Log;

public final class n
{
  private final String bX;
  
  public n(String paramString)
  {
    this.bX = ((String)s.d(paramString));
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (l(3)) {
      Log.d(paramString1, paramString2);
    }
  }
  
  public void a(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (l(6)) {
      Log.e(paramString1, paramString2, paramThrowable);
    }
  }
  
  public void b(String paramString1, String paramString2)
  {
    if (l(5)) {
      Log.w(paramString1, paramString2);
    }
  }
  
  public void c(String paramString1, String paramString2)
  {
    if (l(6)) {
      Log.e(paramString1, paramString2);
    }
  }
  
  public void d(String paramString1, String paramString2)
  {
    if (l(4)) {}
  }
  
  public boolean l(int paramInt)
  {
    return Log.isLoggable(this.bX, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/n.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */