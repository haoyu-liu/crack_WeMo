package com.belkin.utils;

import android.graphics.Bitmap;
import android.graphics.Matrix;

public class ImageResize
{
  public Bitmap resize(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    float f1 = paramInt1 / i;
    float f2 = paramInt2 / j;
    Matrix localMatrix = new Matrix();
    localMatrix.postScale(f1, f2);
    return Bitmap.createBitmap(paramBitmap, 0, 0, i, j, localMatrix, true);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/ImageResize.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */