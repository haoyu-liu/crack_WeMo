package com.localytics.android;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

final class ReflectionUtils
{
  private ReflectionUtils()
  {
    throw new UnsupportedOperationException("This class is non-instantiable");
  }
  
  private static <T> T helper(Object paramObject, Class<?> paramClass, String paramString1, String paramString2, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    Object localObject;
    if (paramClass != null) {
      localObject = paramClass;
    }
    for (;;)
    {
      try
      {
        return (T)((Class)localObject).getMethod(paramString2, paramArrayOfClass).invoke(paramObject, paramArrayOfObject);
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        Class localClass;
        throw new RuntimeException(localNoSuchMethodException);
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        throw new RuntimeException(localIllegalAccessException);
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        throw new RuntimeException(localInvocationTargetException);
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        throw new RuntimeException(localClassNotFoundException);
      }
      if (paramObject != null)
      {
        localObject = paramObject.getClass();
      }
      else
      {
        localClass = Class.forName(paramString1);
        localObject = localClass;
      }
    }
  }
  
  static Object tryGetStaticField(String paramString1, String paramString2)
  {
    try
    {
      Object localObject = Class.forName(paramString1).getField(paramString2).get(null);
      return localObject;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new RuntimeException(localClassNotFoundException);
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      throw new RuntimeException(localNoSuchFieldException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new RuntimeException(localIllegalAccessException);
    }
  }
  
  static <T> T tryInvokeConstructor(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    try
    {
      Object localObject = Class.forName(paramString).getDeclaredConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
      return (T)localObject;
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new RuntimeException(localInstantiationException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new RuntimeException(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new RuntimeException(localInvocationTargetException);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new RuntimeException(localNoSuchMethodException);
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new RuntimeException(localClassNotFoundException);
    }
  }
  
  static <T> T tryInvokeInstance(Object paramObject, String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    return (T)helper(paramObject, null, null, paramString, paramArrayOfClass, paramArrayOfObject);
  }
  
  static <T> T tryInvokeStatic(Class<?> paramClass, String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    return (T)helper(null, paramClass, null, paramString, paramArrayOfClass, paramArrayOfObject);
  }
  
  static <T> T tryInvokeStatic(String paramString1, String paramString2, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    return (T)helper(null, null, paramString1, paramString2, paramArrayOfClass, paramArrayOfObject);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ReflectionUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */