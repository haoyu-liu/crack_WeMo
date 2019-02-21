package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.c;
import com.google.android.gms.plus.PlusOneDummyView;

public final class bu
{
  private static Context gN;
  private static bq iy;
  
  public static View a(Context paramContext, int paramInt1, int paramInt2, String paramString, int paramInt3)
  {
    if (paramString == null) {
      try
      {
        throw new NullPointerException();
      }
      catch (Exception localException)
      {
        return new PlusOneDummyView(paramContext, paramInt1);
      }
    }
    View localView = (View)c.a(m(paramContext).a(c.f(paramContext), paramInt1, paramInt2, paramString, paramInt3));
    return localView;
  }
  
  public static View a(Context paramContext, int paramInt1, int paramInt2, String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      try
      {
        throw new NullPointerException();
      }
      catch (Exception localException)
      {
        return new PlusOneDummyView(paramContext, paramInt1);
      }
    }
    View localView = (View)c.a(m(paramContext).a(c.f(paramContext), paramInt1, paramInt2, paramString1, paramString2));
    return localView;
  }
  
  private static bq m(Context paramContext)
    throws bu.a
  {
    s.d(paramContext);
    ClassLoader localClassLoader;
    if (iy == null)
    {
      if (gN == null)
      {
        gN = GooglePlayServicesUtil.getRemoteContext(paramContext);
        if (gN == null) {
          throw new a("Could not get remote context.");
        }
      }
      localClassLoader = gN.getClassLoader();
    }
    try
    {
      iy = bq.a.Z((IBinder)localClassLoader.loadClass("com.google.android.gms.plus.plusone.PlusOneButtonCreatorImpl").newInstance());
      return iy;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new a("Could not load creator class.");
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new a("Could not instantiate creator.");
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new a("Could not access creator.");
    }
  }
  
  public static class a
    extends Exception
  {
    public a(String paramString)
    {
      super();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bu.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */