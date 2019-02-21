package com.soundcloud.android.crop;

import android.graphics.Bitmap;
import android.graphics.Matrix;

class RotateBitmap
{
  private Bitmap bitmap;
  private int rotation;
  
  public RotateBitmap(Bitmap paramBitmap, int paramInt)
  {
    this.bitmap = paramBitmap;
    this.rotation = (paramInt % 360);
  }
  
  public Bitmap getBitmap()
  {
    return this.bitmap;
  }
  
  public int getHeight()
  {
    if (this.bitmap == null) {
      return 0;
    }
    if (isOrientationChanged()) {
      return this.bitmap.getWidth();
    }
    return this.bitmap.getHeight();
  }
  
  public Matrix getRotateMatrix()
  {
    Matrix localMatrix = new Matrix();
    if ((this.bitmap != null) && (this.rotation != 0))
    {
      int i = this.bitmap.getWidth() / 2;
      int j = this.bitmap.getHeight() / 2;
      localMatrix.preTranslate(-i, -j);
      localMatrix.postRotate(this.rotation);
      localMatrix.postTranslate(getWidth() / 2, getHeight() / 2);
    }
    return localMatrix;
  }
  
  public int getRotation()
  {
    return this.rotation;
  }
  
  public int getWidth()
  {
    if (this.bitmap == null) {
      return 0;
    }
    if (isOrientationChanged()) {
      return this.bitmap.getHeight();
    }
    return this.bitmap.getWidth();
  }
  
  public boolean isOrientationChanged()
  {
    return this.rotation / 90 % 2 != 0;
  }
  
  public void recycle()
  {
    if (this.bitmap != null)
    {
      this.bitmap.recycle();
      this.bitmap = null;
    }
  }
  
  public void setBitmap(Bitmap paramBitmap)
  {
    this.bitmap = paramBitmap;
  }
  
  public void setRotation(int paramInt)
  {
    this.rotation = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/RotateBitmap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */