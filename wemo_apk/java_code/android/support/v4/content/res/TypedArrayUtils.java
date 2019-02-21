package android.support.v4.content.res;

import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.AnyRes;
import android.support.annotation.StyleableRes;

public class TypedArrayUtils
{
  public static boolean getBoolean(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2, boolean paramBoolean)
  {
    return paramTypedArray.getBoolean(paramInt1, paramTypedArray.getBoolean(paramInt2, paramBoolean));
  }
  
  public static Drawable getDrawable(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2)
  {
    Drawable localDrawable = paramTypedArray.getDrawable(paramInt1);
    if (localDrawable == null) {
      localDrawable = paramTypedArray.getDrawable(paramInt2);
    }
    return localDrawable;
  }
  
  public static int getInt(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2, int paramInt3)
  {
    return paramTypedArray.getInt(paramInt1, paramTypedArray.getInt(paramInt2, paramInt3));
  }
  
  @AnyRes
  public static int getResourceId(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2, @AnyRes int paramInt3)
  {
    return paramTypedArray.getResourceId(paramInt1, paramTypedArray.getResourceId(paramInt2, paramInt3));
  }
  
  public static String getString(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2)
  {
    String str = paramTypedArray.getString(paramInt1);
    if (str == null) {
      str = paramTypedArray.getString(paramInt2);
    }
    return str;
  }
  
  public static CharSequence[] getTextArray(TypedArray paramTypedArray, @StyleableRes int paramInt1, @StyleableRes int paramInt2)
  {
    CharSequence[] arrayOfCharSequence = paramTypedArray.getTextArray(paramInt1);
    if (arrayOfCharSequence == null) {
      arrayOfCharSequence = paramTypedArray.getTextArray(paramInt2);
    }
    return arrayOfCharSequence;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/content/res/TypedArrayUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */