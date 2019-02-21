package android.support.v4.view;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class ViewCompatEclairMr1
{
  public static final String TAG = "ViewCompat";
  private static Method sChildrenDrawingOrderMethod;
  
  public static boolean isOpaque(View paramView)
  {
    return paramView.isOpaque();
  }
  
  public static void setChildrenDrawingOrderEnabled(ViewGroup paramViewGroup, boolean paramBoolean)
  {
    if (sChildrenDrawingOrderMethod == null) {}
    try
    {
      Class[] arrayOfClass = new Class[1];
      arrayOfClass[0] = Boolean.TYPE;
      sChildrenDrawingOrderMethod = ViewGroup.class.getDeclaredMethod("setChildrenDrawingOrderEnabled", arrayOfClass);
      sChildrenDrawingOrderMethod.setAccessible(true);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        try
        {
          Method localMethod = sChildrenDrawingOrderMethod;
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = Boolean.valueOf(paramBoolean);
          localMethod.invoke(paramViewGroup, arrayOfObject);
          return;
        }
        catch (IllegalAccessException localIllegalAccessException)
        {
          Log.e("ViewCompat", "Unable to invoke childrenDrawingOrderEnabled", localIllegalAccessException);
          return;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          Log.e("ViewCompat", "Unable to invoke childrenDrawingOrderEnabled", localIllegalArgumentException);
          return;
        }
        catch (InvocationTargetException localInvocationTargetException)
        {
          Log.e("ViewCompat", "Unable to invoke childrenDrawingOrderEnabled", localInvocationTargetException);
        }
        localNoSuchMethodException = localNoSuchMethodException;
        Log.e("ViewCompat", "Unable to find childrenDrawingOrderEnabled", localNoSuchMethodException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/view/ViewCompatEclairMr1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */