package android.support.v4.media;

import android.media.session.MediaSession.Token;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class IMediaBrowserServiceCallbacksAdapterApi21
{
  private Method mAsBinderMethod;
  Object mCallbackObject;
  private Method mOnConnectFailedMethod;
  private Method mOnConnectMethod;
  private Method mOnLoadChildrenMethod;
  
  IMediaBrowserServiceCallbacksAdapterApi21(Object paramObject)
  {
    this.mCallbackObject = paramObject;
    try
    {
      Class localClass1 = Class.forName("android.service.media.IMediaBrowserServiceCallbacks");
      Class localClass2 = Class.forName("android.content.pm.ParceledListSlice");
      this.mAsBinderMethod = localClass1.getMethod("asBinder", new Class[0]);
      this.mOnConnectMethod = localClass1.getMethod("onConnect", new Class[] { String.class, MediaSession.Token.class, Bundle.class });
      this.mOnConnectFailedMethod = localClass1.getMethod("onConnectFailed", new Class[0]);
      this.mOnLoadChildrenMethod = localClass1.getMethod("onLoadChildren", new Class[] { String.class, localClass2 });
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      localNoSuchMethodException.printStackTrace();
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      for (;;) {}
    }
  }
  
  IBinder asBinder()
  {
    try
    {
      IBinder localIBinder = (IBinder)this.mAsBinderMethod.invoke(this.mCallbackObject, new Object[0]);
      return localIBinder;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
      return null;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;) {}
    }
  }
  
  void onConnect(String paramString, Object paramObject, Bundle paramBundle)
    throws RemoteException
  {
    try
    {
      this.mOnConnectMethod.invoke(this.mCallbackObject, new Object[] { paramString, paramObject, paramBundle });
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;) {}
    }
  }
  
  void onConnectFailed()
    throws RemoteException
  {
    try
    {
      this.mOnConnectFailedMethod.invoke(this.mCallbackObject, new Object[0]);
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;) {}
    }
  }
  
  void onLoadChildren(String paramString, Object paramObject)
    throws RemoteException
  {
    try
    {
      this.mOnLoadChildrenMethod.invoke(this.mCallbackObject, new Object[] { paramString, paramObject });
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;) {}
    }
  }
  
  static class Stub
  {
    static Method sAsInterfaceMethod;
    
    static
    {
      try
      {
        sAsInterfaceMethod = Class.forName("android.service.media.IMediaBrowserServiceCallbacks$Stub").getMethod("asInterface", new Class[] { IBinder.class });
        return;
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        localNoSuchMethodException.printStackTrace();
        return;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        for (;;) {}
      }
    }
    
    static Object asInterface(IBinder paramIBinder)
    {
      try
      {
        Object localObject = sAsInterfaceMethod.invoke(null, new Object[] { paramIBinder });
        return localObject;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        localIllegalAccessException.printStackTrace();
        return null;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        for (;;) {}
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/media/IMediaBrowserServiceCallbacksAdapterApi21.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */