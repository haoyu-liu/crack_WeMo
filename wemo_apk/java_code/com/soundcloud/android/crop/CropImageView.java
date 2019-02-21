package com.soundcloud.android.crop;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Iterator;

public class CropImageView
  extends ImageViewTouchBase
{
  Context context;
  ArrayList<HighlightView> highlightViews = new ArrayList();
  private float lastX;
  private float lastY;
  private int motionEdge;
  HighlightView motionHighlightView;
  private int validPointerId;
  
  public CropImageView(Context paramContext)
  {
    super(paramContext);
  }
  
  public CropImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public CropImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void centerBasedOnHighlightView(HighlightView paramHighlightView)
  {
    Rect localRect = paramHighlightView.drawRect;
    float f1 = localRect.width();
    float f2 = localRect.height();
    float f3 = getWidth();
    float f4 = getHeight();
    float f5 = Math.max(1.0F, Math.min(0.6F * (f3 / f1), 0.6F * (f4 / f2)) * getScale());
    if (Math.abs(f5 - getScale()) / f5 > 0.1D)
    {
      float[] arrayOfFloat = new float[2];
      arrayOfFloat[0] = paramHighlightView.cropRect.centerX();
      arrayOfFloat[1] = paramHighlightView.cropRect.centerY();
      getUnrotatedMatrix().mapPoints(arrayOfFloat);
      zoomTo(f5, arrayOfFloat[0], arrayOfFloat[1], 300.0F);
    }
    ensureVisible(paramHighlightView);
  }
  
  private void ensureVisible(HighlightView paramHighlightView)
  {
    Rect localRect = paramHighlightView.drawRect;
    int i = Math.max(0, getLeft() - localRect.left);
    int j = Math.min(0, getRight() - localRect.right);
    int k = Math.max(0, getTop() - localRect.top);
    int m = Math.min(0, getBottom() - localRect.bottom);
    int n;
    if (i != 0)
    {
      n = i;
      if (k == 0) {
        break label108;
      }
    }
    label108:
    for (int i1 = k;; i1 = m)
    {
      if ((n != 0) || (i1 != 0)) {
        panBy(n, i1);
      }
      return;
      n = j;
      break;
    }
  }
  
  public void add(HighlightView paramHighlightView)
  {
    this.highlightViews.add(paramHighlightView);
    invalidate();
  }
  
  protected void onDraw(@NonNull Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    Iterator localIterator = this.highlightViews.iterator();
    while (localIterator.hasNext()) {
      ((HighlightView)localIterator.next()).draw(paramCanvas);
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if (this.bitmapDisplayed.getBitmap() != null)
    {
      Iterator localIterator = this.highlightViews.iterator();
      while (localIterator.hasNext())
      {
        HighlightView localHighlightView = (HighlightView)localIterator.next();
        localHighlightView.matrix.set(getUnrotatedMatrix());
        localHighlightView.invalidate();
        if (localHighlightView.hasFocus()) {
          centerBasedOnHighlightView(localHighlightView);
        }
      }
    }
  }
  
  public boolean onTouchEvent(@NonNull MotionEvent paramMotionEvent)
  {
    if (((CropImageActivity)this.context).isSaving()) {
      return false;
    }
    switch (paramMotionEvent.getAction())
    {
    }
    for (;;)
    {
      return true;
      Iterator localIterator = this.highlightViews.iterator();
      HighlightView localHighlightView1;
      int i;
      do
      {
        if (!localIterator.hasNext()) {
          break;
        }
        localHighlightView1 = (HighlightView)localIterator.next();
        i = localHighlightView1.getHit(paramMotionEvent.getX(), paramMotionEvent.getY());
      } while (i == 1);
      this.motionEdge = i;
      this.motionHighlightView = localHighlightView1;
      this.lastX = paramMotionEvent.getX();
      this.lastY = paramMotionEvent.getY();
      this.validPointerId = paramMotionEvent.getPointerId(paramMotionEvent.getActionIndex());
      HighlightView localHighlightView2 = this.motionHighlightView;
      if (i == 32) {}
      for (HighlightView.ModifyMode localModifyMode = HighlightView.ModifyMode.Move;; localModifyMode = HighlightView.ModifyMode.Grow)
      {
        localHighlightView2.setMode(localModifyMode);
        break;
      }
      if (this.motionHighlightView != null)
      {
        centerBasedOnHighlightView(this.motionHighlightView);
        this.motionHighlightView.setMode(HighlightView.ModifyMode.None);
      }
      this.motionHighlightView = null;
      center();
      continue;
      if ((this.motionHighlightView != null) && (paramMotionEvent.getPointerId(paramMotionEvent.getActionIndex()) == this.validPointerId))
      {
        this.motionHighlightView.handleMotion(this.motionEdge, paramMotionEvent.getX() - this.lastX, paramMotionEvent.getY() - this.lastY);
        this.lastX = paramMotionEvent.getX();
        this.lastY = paramMotionEvent.getY();
      }
      if (getScale() == 1.0F) {
        center();
      }
    }
  }
  
  protected void postTranslate(float paramFloat1, float paramFloat2)
  {
    super.postTranslate(paramFloat1, paramFloat2);
    Iterator localIterator = this.highlightViews.iterator();
    while (localIterator.hasNext())
    {
      HighlightView localHighlightView = (HighlightView)localIterator.next();
      localHighlightView.matrix.postTranslate(paramFloat1, paramFloat2);
      localHighlightView.invalidate();
    }
  }
  
  protected void zoomIn()
  {
    super.zoomIn();
    Iterator localIterator = this.highlightViews.iterator();
    while (localIterator.hasNext())
    {
      HighlightView localHighlightView = (HighlightView)localIterator.next();
      localHighlightView.matrix.set(getUnrotatedMatrix());
      localHighlightView.invalidate();
    }
  }
  
  protected void zoomOut()
  {
    super.zoomOut();
    Iterator localIterator = this.highlightViews.iterator();
    while (localIterator.hasNext())
    {
      HighlightView localHighlightView = (HighlightView)localIterator.next();
      localHighlightView.matrix.set(getUnrotatedMatrix());
      localHighlightView.invalidate();
    }
  }
  
  protected void zoomTo(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    super.zoomTo(paramFloat1, paramFloat2, paramFloat3);
    Iterator localIterator = this.highlightViews.iterator();
    while (localIterator.hasNext())
    {
      HighlightView localHighlightView = (HighlightView)localIterator.next();
      localHighlightView.matrix.set(getUnrotatedMatrix());
      localHighlightView.invalidate();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/CropImageView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */