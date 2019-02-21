package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

class DrawableCompatEclair
{
  public static Drawable wrapForTinting(Drawable paramDrawable)
  {
    if (!(paramDrawable instanceof DrawableWrapperEclair)) {
      paramDrawable = new DrawableWrapperEclair(paramDrawable);
    }
    return paramDrawable;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/graphics/drawable/DrawableCompatEclair.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */