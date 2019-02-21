package com.google.android.gms.maps.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class p
{
  private static Context gN;
  private static c gO;
  
  private static <T> T a(ClassLoader paramClassLoader, String paramString)
  {
    try
    {
      Object localObject = c(((ClassLoader)s.d(paramClassLoader)).loadClass(paramString));
      return (T)localObject;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new IllegalStateException("Unable to find dynamic class " + paramString);
    }
  }
  
  private static Class<?> bm()
  {
    try
    {
      Class localClass = Class.forName("com.google.android.gms.maps.internal.CreatorImpl");
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException) {}
    return null;
  }
  
  private static <T> T c(Class<?> paramClass)
  {
    try
    {
      Object localObject = paramClass.newInstance();
      return (T)localObject;
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new IllegalStateException("Unable to instantiate the dynamic class " + paramClass.getName());
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new IllegalStateException("Unable to call the default constructor of " + paramClass.getName());
    }
  }
  
  private static Context getRemoteContext(Context paramContext)
  {
    if (gN == null) {
      if (bm() == null) {
        break label20;
      }
    }
    label20:
    for (gN = paramContext;; gN = GooglePlayServicesUtil.getRemoteContext(paramContext)) {
      return gN;
    }
  }
  
  public static c i(Context paramContext)
    throws GooglePlayServicesNotAvailableException
  {
    s.d(paramContext);
    k(paramContext);
    if (gO == null) {
      l(paramContext);
    }
    if (gO != null) {
      return gO;
    }
    gO = c.a.v((IBinder)a(getRemoteContext(paramContext).getClassLoader(), "com.google.android.gms.maps.internal.CreatorImpl"));
    j(paramContext);
    return gO;
  }
  
  private static void j(Context paramContext)
  {
    try
    {
      gO.a(com.google.android.gms.dynamic.c.f(getRemoteContext(paramContext).getResources()), 3265100);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public static void k(Context paramContext)
    throws GooglePlayServicesNotAvailableException
  {
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext);
    if (i != 0) {
      throw new GooglePlayServicesNotAvailableException(i);
    }
  }
  
  private static void l(Context paramContext)
  {
    Class localClass = bm();
    if (localClass != null)
    {
      Log.i(p.class.getSimpleName(), "Making Creator statically");
      gO = (c)c(localClass);
      j(paramContext);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/p.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */