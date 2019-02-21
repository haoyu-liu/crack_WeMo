package com.soundcloud.android.crop;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

abstract class ImageViewTouchBase
  extends ImageView
{
  private static final float SCALE_RATE = 1.25F;
  protected Matrix baseMatrix = new Matrix();
  protected final RotateBitmap bitmapDisplayed = new RotateBitmap(null, 0);
  private final Matrix displayMatrix = new Matrix();
  protected Handler handler = new Handler();
  private final float[] matrixValues = new float[9];
  float maxZoom;
  private Runnable onLayoutRunnable;
  private Recycler recycler;
  protected Matrix suppMatrix = new Matrix();
  int thisHeight = -1;
  int thisWidth = -1;
  
  public ImageViewTouchBase(Context paramContext)
  {
    super(paramContext);
    init();
  }
  
  public ImageViewTouchBase(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  public ImageViewTouchBase(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }
  
  private float centerHorizontal(RectF paramRectF, float paramFloat1, float paramFloat2)
  {
    int i = getWidth();
    if (paramFloat1 < i) {
      paramFloat2 = (i - paramFloat1) / 2.0F - paramRectF.left;
    }
    do
    {
      return paramFloat2;
      if (paramRectF.left > 0.0F) {
        return -paramRectF.left;
      }
    } while (paramRectF.right >= i);
    return i - paramRectF.right;
  }
  
  private float centerVertical(RectF paramRectF, float paramFloat1, float paramFloat2)
  {
    int i = getHeight();
    if (paramFloat1 < i) {
      paramFloat2 = (i - paramFloat1) / 2.0F - paramRectF.top;
    }
    do
    {
      return paramFloat2;
      if (paramRectF.top > 0.0F) {
        return -paramRectF.top;
      }
    } while (paramRectF.bottom >= i);
    return getHeight() - paramRectF.bottom;
  }
  
  private void getProperBaseMatrix(RotateBitmap paramRotateBitmap, Matrix paramMatrix, boolean paramBoolean)
  {
    float f1 = getWidth();
    float f2 = getHeight();
    float f3 = paramRotateBitmap.getWidth();
    float f4 = paramRotateBitmap.getHeight();
    paramMatrix.reset();
    float f5 = Math.min(Math.min(f1 / f3, 3.0F), Math.min(f2 / f4, 3.0F));
    if (paramBoolean) {
      paramMatrix.postConcat(paramRotateBitmap.getRotateMatrix());
    }
    paramMatrix.postScale(f5, f5);
    paramMatrix.postTranslate((f1 - f3 * f5) / 2.0F, (f2 - f4 * f5) / 2.0F);
  }
  
  private void init()
  {
    setScaleType(ImageView.ScaleType.MATRIX);
  }
  
  private void setImageBitmap(Bitmap paramBitmap, int paramInt)
  {
    super.setImageBitmap(paramBitmap);
    Drawable localDrawable = getDrawable();
    if (localDrawable != null) {
      localDrawable.setDither(true);
    }
    Bitmap localBitmap = this.bitmapDisplayed.getBitmap();
    this.bitmapDisplayed.setBitmap(paramBitmap);
    this.bitmapDisplayed.setRotation(paramInt);
    if ((localBitmap != null) && (localBitmap != paramBitmap) && (this.recycler != null)) {
      this.recycler.recycle(localBitmap);
    }
  }
  
  protected float calculateMaxZoom()
  {
    if (this.bitmapDisplayed.getBitmap() == null) {
      return 1.0F;
    }
    return 4.0F * Math.max(this.bitmapDisplayed.getWidth() / this.thisWidth, this.bitmapDisplayed.getHeight() / this.thisHeight);
  }
  
  protected void center()
  {
    Bitmap localBitmap = this.bitmapDisplayed.getBitmap();
    if (localBitmap == null) {
      return;
    }
    Matrix localMatrix = getImageViewMatrix();
    RectF localRectF = new RectF(0.0F, 0.0F, localBitmap.getWidth(), localBitmap.getHeight());
    localMatrix.mapRect(localRectF);
    float f1 = localRectF.height();
    float f2 = localRectF.width();
    float f3 = centerVertical(localRectF, f1, 0.0F);
    postTranslate(centerHorizontal(localRectF, f2, 0.0F), f3);
    setImageMatrix(getImageViewMatrix());
  }
  
  public void clear()
  {
    setImageBitmapResetBase(null, true);
  }
  
  protected Matrix getImageViewMatrix()
  {
    this.displayMatrix.set(this.baseMatrix);
    this.displayMatrix.postConcat(this.suppMatrix);
    return this.displayMatrix;
  }
  
  protected float getScale()
  {
    return getScale(this.suppMatrix);
  }
  
  protected float getScale(Matrix paramMatrix)
  {
    return getValue(paramMatrix, 0);
  }
  
  public Matrix getUnrotatedMatrix()
  {
    Matrix localMatrix = new Matrix();
    getProperBaseMatrix(this.bitmapDisplayed, localMatrix, false);
    localMatrix.postConcat(this.suppMatrix);
    return localMatrix;
  }
  
  protected float getValue(Matrix paramMatrix, int paramInt)
  {
    paramMatrix.getValues(this.matrixValues);
    return this.matrixValues[paramInt];
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.getRepeatCount() == 0))
    {
      paramKeyEvent.startTracking();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.isTracking()) && (!paramKeyEvent.isCanceled()) && (getScale() > 1.0F))
    {
      zoomTo(1.0F);
      return true;
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    this.thisWidth = (paramInt3 - paramInt1);
    this.thisHeight = (paramInt4 - paramInt2);
    Runnable localRunnable = this.onLayoutRunnable;
    if (localRunnable != null)
    {
      this.onLayoutRunnable = null;
      localRunnable.run();
    }
    if (this.bitmapDisplayed.getBitmap() != null)
    {
      getProperBaseMatrix(this.bitmapDisplayed, this.baseMatrix, true);
      setImageMatrix(getImageViewMatrix());
    }
  }
  
  protected void panBy(float paramFloat1, float paramFloat2)
  {
    postTranslate(paramFloat1, paramFloat2);
    setImageMatrix(getImageViewMatrix());
  }
  
  protected void postTranslate(float paramFloat1, float paramFloat2)
  {
    this.suppMatrix.postTranslate(paramFloat1, paramFloat2);
  }
  
  public void setImageBitmap(Bitmap paramBitmap)
  {
    setImageBitmap(paramBitmap, 0);
  }
  
  public void setImageBitmapResetBase(Bitmap paramBitmap, boolean paramBoolean)
  {
    setImageRotateBitmapResetBase(new RotateBitmap(paramBitmap, 0), paramBoolean);
  }
  
  public void setImageRotateBitmapResetBase(final RotateBitmap paramRotateBitmap, final boolean paramBoolean)
  {
    if (getWidth() <= 0)
    {
      this.onLayoutRunnable = new Runnable()
      {
        public void run()
        {
          ImageViewTouchBase.this.setImageRotateBitmapResetBase(paramRotateBitmap, paramBoolean);
        }
      };
      return;
    }
    if (paramRotateBitmap.getBitmap() != null)
    {
      getProperBaseMatrix(paramRotateBitmap, this.baseMatrix, true);
      setImageBitmap(paramRotateBitmap.getBitmap(), paramRotateBitmap.getRotation());
    }
    for (;;)
    {
      if (paramBoolean) {
        this.suppMatrix.reset();
      }
      setImageMatrix(getImageViewMatrix());
      this.maxZoom = calculateMaxZoom();
      return;
      this.baseMatrix.reset();
      setImageBitmap(null);
    }
  }
  
  public void setRecycler(Recycler paramRecycler)
  {
    this.recycler = paramRecycler;
  }
  
  protected void zoomIn()
  {
    zoomIn(1.25F);
  }
  
  protected void zoomIn(float paramFloat)
  {
    if (getScale() >= this.maxZoom) {}
    while (this.bitmapDisplayed.getBitmap() == null) {
      return;
    }
    float f1 = getWidth() / 2.0F;
    float f2 = getHeight() / 2.0F;
    this.suppMatrix.postScale(paramFloat, paramFloat, f1, f2);
    setImageMatrix(getImageViewMatrix());
  }
  
  protected void zoomOut()
  {
    zoomOut(1.25F);
  }
  
  protected void zoomOut(float paramFloat)
  {
    if (this.bitmapDisplayed.getBitmap() == null) {
      return;
    }
    float f1 = getWidth() / 2.0F;
    float f2 = getHeight() / 2.0F;
    Matrix localMatrix = new Matrix(this.suppMatrix);
    localMatrix.postScale(1.0F / paramFloat, 1.0F / paramFloat, f1, f2);
    if (getScale(localMatrix) < 1.0F) {
      this.suppMatrix.setScale(1.0F, 1.0F, f1, f2);
    }
    for (;;)
    {
      setImageMatrix(getImageViewMatrix());
      center();
      return;
      this.suppMatrix.postScale(1.0F / paramFloat, 1.0F / paramFloat, f1, f2);
    }
  }
  
  protected void zoomTo(float paramFloat)
  {
    zoomTo(paramFloat, getWidth() / 2.0F, getHeight() / 2.0F);
  }
  
  protected void zoomTo(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (paramFloat1 > this.maxZoom) {
      paramFloat1 = this.maxZoom;
    }
    float f = paramFloat1 / getScale();
    this.suppMatrix.postScale(f, f, paramFloat2, paramFloat3);
    setImageMatrix(getImageViewMatrix());
    center();
  }
  
  protected void zoomTo(float paramFloat1, final float paramFloat2, final float paramFloat3, final float paramFloat4)
  {
    final float f1 = (paramFloat1 - getScale()) / paramFloat4;
    float f2 = getScale();
    final long l = System.currentTimeMillis();
    this.handler.post(new Runnable()
    {
      public void run()
      {
        long l = System.currentTimeMillis();
        float f1 = Math.min(paramFloat4, (float)(l - l));
        float f2 = f1 + f1 * paramFloat2;
        ImageViewTouchBase.this.zoomTo(f2, paramFloat3, this.val$centerY);
        if (f1 < paramFloat4) {
          ImageViewTouchBase.this.handler.post(this);
        }
      }
    });
  }
  
  public static abstract interface Recycler
  {
    public abstract void recycle(Bitmap paramBitmap);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/ImageViewTouchBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */