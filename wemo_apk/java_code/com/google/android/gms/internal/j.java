package com.google.android.gms.internal;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.lang.reflect.Field;

public abstract class j
  implements SafeParcelable
{
  private static final Object bo = new Object();
  private static ClassLoader bp = null;
  private static Integer bq = null;
  private boolean br = false;
  
  private static boolean a(Class<?> paramClass)
  {
    try
    {
      boolean bool = "SAFE_PARCELABLE_NULL_STRING".equals(paramClass.getField("NULL").get(null));
      return bool;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      return false;
    }
    catch (NoSuchFieldException localNoSuchFieldException) {}
    return false;
  }
  
  protected static boolean h(String paramString)
  {
    ClassLoader localClassLoader = u();
    if (localClassLoader == null) {
      return true;
    }
    try
    {
      boolean bool = a(localClassLoader.loadClass(paramString));
      return bool;
    }
    catch (Exception localException) {}
    return false;
  }
  
  protected static ClassLoader u()
  {
    synchronized (bo)
    {
      ClassLoader localClassLoader = bp;
      return localClassLoader;
    }
  }
  
  protected static Integer v()
  {
    synchronized (bo)
    {
      Integer localInteger = bq;
      return localInteger;
    }
  }
  
  protected boolean w()
  {
    return this.br;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/j.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */