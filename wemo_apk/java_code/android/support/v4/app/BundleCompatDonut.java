package android.support.v4.app;

import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class BundleCompatDonut
{
  private static final String TAG = "BundleCompatDonut";
  private static Method sGetIBinderMethod;
  private static boolean sGetIBinderMethodFetched;
  private static Method sPutIBinderMethod;
  private static boolean sPutIBinderMethodFetched;
  
  public static IBinder getBinder(Bundle paramBundle, String paramString)
  {
    if (!sGetIBinderMethodFetched) {}
    try
    {
      sGetIBinderMethod = Bundle.class.getMethod("getIBinder", new Class[] { String.class });
      sGetIBinderMethod.setAccessible(true);
      sGetIBinderMethodFetched = true;
      if (sGetIBinderMethod == null) {}
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        try
        {
          IBinder localIBinder = (IBinder)sGetIBinderMethod.invoke(paramBundle, new Object[] { paramString });
          return localIBinder;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          Log.i("BundleCompatDonut", "Failed to invoke getIBinder via reflection", localIllegalArgumentException);
          sGetIBinderMethod = null;
          return null;
        }
        catch (InvocationTargetException localInvocationTargetException)
        {
          continue;
        }
        catch (IllegalAccessException localIllegalAccessException)
        {
          continue;
        }
        localNoSuchMethodException = localNoSuchMethodException;
        Log.i("BundleCompatDonut", "Failed to retrieve getIBinder method", localNoSuchMethodException);
      }
    }
  }
  
  public static void putBinder(Bundle paramBundle, String paramString, IBinder paramIBinder)
  {
    if (!sPutIBinderMethodFetched) {}
    try
    {
      sPutIBinderMethod = Bundle.class.getMethod("putIBinder", new Class[] { String.class, IBinder.class });
      sPutIBinderMethod.setAccessible(true);
      sPutIBinderMethodFetched = true;
      if (sPutIBinderMethod == null) {}
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        try
        {
          sPutIBinderMethod.invoke(paramBundle, new Object[] { paramString, paramIBinder });
          return;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          Log.i("BundleCompatDonut", "Failed to invoke putIBinder via reflection", localIllegalArgumentException);
          sPutIBinderMethod = null;
          return;
        }
        catch (InvocationTargetException localInvocationTargetException)
        {
          continue;
        }
        catch (IllegalAccessException localIllegalAccessException)
        {
          continue;
        }
        localNoSuchMethodException = localNoSuchMethodException;
        Log.i("BundleCompatDonut", "Failed to retrieve putIBinder method", localNoSuchMethodException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/app/BundleCompatDonut.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */