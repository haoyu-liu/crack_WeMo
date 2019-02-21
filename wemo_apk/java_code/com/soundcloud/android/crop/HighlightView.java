package com.soundcloud.android.crop;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region.Op;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;

class HighlightView
{
  private static final int DEFAULT_HIGHLIGHT_COLOR = -13388315;
  public static final int GROW_BOTTOM_EDGE = 16;
  public static final int GROW_LEFT_EDGE = 2;
  public static final int GROW_NONE = 1;
  public static final int GROW_RIGHT_EDGE = 4;
  public static final int GROW_TOP_EDGE = 8;
  private static final float HANDLE_RADIUS_DP = 12.0F;
  public static final int MOVE = 32;
  private static final float OUTLINE_DP = 2.0F;
  RectF cropRect;
  Rect drawRect;
  private HandleMode handleMode = HandleMode.Changing;
  private final Paint handlePaint = new Paint();
  private float handleRadius;
  private int highlightColor;
  private RectF imageRect;
  private float initialAspectRatio;
  private boolean isFocused;
  private boolean maintainAspectRatio;
  Matrix matrix;
  private ModifyMode modifyMode = ModifyMode.None;
  private final Paint outlinePaint = new Paint();
  private float outlineWidth;
  private final Paint outsidePaint = new Paint();
  private boolean showCircle;
  private boolean showThirds;
  private View viewContext;
  
  public HighlightView(View paramView)
  {
    this.viewContext = paramView;
    initStyles(paramView.getContext());
  }
  
  private Rect computeLayout()
  {
    RectF localRectF = new RectF(this.cropRect.left, this.cropRect.top, this.cropRect.right, this.cropRect.bottom);
    this.matrix.mapRect(localRectF);
    return new Rect(Math.round(localRectF.left), Math.round(localRectF.top), Math.round(localRectF.right), Math.round(localRectF.bottom));
  }
  
  private float dpToPx(float paramFloat)
  {
    return paramFloat * this.viewContext.getResources().getDisplayMetrics().density;
  }
  
  private void drawCircle(Canvas paramCanvas)
  {
    this.outlinePaint.setStrokeWidth(1.0F);
    paramCanvas.drawOval(new RectF(this.drawRect), this.outlinePaint);
  }
  
  private void drawHandles(Canvas paramCanvas)
  {
    int i = this.drawRect.left + (this.drawRect.right - this.drawRect.left) / 2;
    int j = this.drawRect.top + (this.drawRect.bottom - this.drawRect.top) / 2;
    paramCanvas.drawCircle(this.drawRect.left, j, this.handleRadius, this.handlePaint);
    paramCanvas.drawCircle(i, this.drawRect.top, this.handleRadius, this.handlePaint);
    paramCanvas.drawCircle(this.drawRect.right, j, this.handleRadius, this.handlePaint);
    paramCanvas.drawCircle(i, this.drawRect.bottom, this.handleRadius, this.handlePaint);
  }
  
  private void drawOutsideFallback(Canvas paramCanvas)
  {
    paramCanvas.drawRect(0.0F, 0.0F, paramCanvas.getWidth(), this.drawRect.top, this.outsidePaint);
    paramCanvas.drawRect(0.0F, this.drawRect.bottom, paramCanvas.getWidth(), paramCanvas.getHeight(), this.outsidePaint);
    paramCanvas.drawRect(0.0F, this.drawRect.top, this.drawRect.left, this.drawRect.bottom, this.outsidePaint);
    paramCanvas.drawRect(this.drawRect.right, this.drawRect.top, paramCanvas.getWidth(), this.drawRect.bottom, this.outsidePaint);
  }
  
  private void drawThirds(Canvas paramCanvas)
  {
    this.outlinePaint.setStrokeWidth(1.0F);
    float f1 = (this.drawRect.right - this.drawRect.left) / 3;
    float f2 = (this.drawRect.bottom - this.drawRect.top) / 3;
    paramCanvas.drawLine(f1 + this.drawRect.left, this.drawRect.top, f1 + this.drawRect.left, this.drawRect.bottom, this.outlinePaint);
    paramCanvas.drawLine(this.drawRect.left + f1 * 2.0F, this.drawRect.top, this.drawRect.left + f1 * 2.0F, this.drawRect.bottom, this.outlinePaint);
    paramCanvas.drawLine(this.drawRect.left, f2 + this.drawRect.top, this.drawRect.right, f2 + this.drawRect.top, this.outlinePaint);
    paramCanvas.drawLine(this.drawRect.left, this.drawRect.top + f2 * 2.0F, this.drawRect.right, this.drawRect.top + f2 * 2.0F, this.outlinePaint);
  }
  
  private void initStyles(Context paramContext)
  {
    TypedValue localTypedValue = new TypedValue();
    paramContext.getTheme().resolveAttribute(R.attr.cropImageStyle, localTypedValue, true);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(localTypedValue.resourceId, R.styleable.CropImageView);
    try
    {
      this.showThirds = localTypedArray.getBoolean(R.styleable.CropImageView_showThirds, false);
      this.showCircle = localTypedArray.getBoolean(R.styleable.CropImageView_showCircle, false);
      this.highlightColor = localTypedArray.getColor(R.styleable.CropImageView_highlightColor, -13388315);
      this.handleMode = HandleMode.values()[localTypedArray.getInt(R.styleable.CropImageView_showHandles, 0)];
      return;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }
  
  @SuppressLint({"NewApi"})
  private boolean isClipPathSupported(Canvas paramCanvas)
  {
    boolean bool = true;
    if (Build.VERSION.SDK_INT == 17) {
      bool = false;
    }
    while ((Build.VERSION.SDK_INT < 14) || (Build.VERSION.SDK_INT > 15) || (!paramCanvas.isHardwareAccelerated())) {
      return bool;
    }
    return false;
  }
  
  protected void draw(Canvas paramCanvas)
  {
    paramCanvas.save();
    Path localPath = new Path();
    this.outlinePaint.setStrokeWidth(this.outlineWidth);
    if (!hasFocus())
    {
      this.outlinePaint.setColor(-16777216);
      paramCanvas.drawRect(this.drawRect, this.outlinePaint);
      return;
    }
    Rect localRect = new Rect();
    this.viewContext.getDrawingRect(localRect);
    localPath.addRect(new RectF(this.drawRect), Path.Direction.CW);
    this.outlinePaint.setColor(this.highlightColor);
    if (isClipPathSupported(paramCanvas))
    {
      paramCanvas.clipPath(localPath, Region.Op.DIFFERENCE);
      paramCanvas.drawRect(localRect, this.outsidePaint);
    }
    for (;;)
    {
      paramCanvas.restore();
      paramCanvas.drawPath(localPath, this.outlinePaint);
      if (this.showThirds) {
        drawThirds(paramCanvas);
      }
      if (this.showCircle) {
        drawCircle(paramCanvas);
      }
      if ((this.handleMode != HandleMode.Always) && ((this.handleMode != HandleMode.Changing) || (this.modifyMode != ModifyMode.Grow))) {
        break;
      }
      drawHandles(paramCanvas);
      return;
      drawOutsideFallback(paramCanvas);
    }
  }
  
  public int getHit(float paramFloat1, float paramFloat2)
  {
    Rect localRect = computeLayout();
    int i = 1;
    int j;
    if ((paramFloat2 >= localRect.top - 20.0F) && (paramFloat2 < 20.0F + localRect.bottom))
    {
      j = 1;
      if ((paramFloat1 < localRect.left - 20.0F) || (paramFloat1 >= 20.0F + localRect.right)) {
        break label214;
      }
    }
    label214:
    for (int k = 1;; k = 0)
    {
      if ((Math.abs(localRect.left - paramFloat1) < 20.0F) && (j != 0)) {
        i |= 0x2;
      }
      if ((Math.abs(localRect.right - paramFloat1) < 20.0F) && (j != 0)) {
        i |= 0x4;
      }
      if ((Math.abs(localRect.top - paramFloat2) < 20.0F) && (k != 0)) {
        i |= 0x8;
      }
      if ((Math.abs(localRect.bottom - paramFloat2) < 20.0F) && (k != 0)) {
        i |= 0x10;
      }
      if ((i == 1) && (localRect.contains((int)paramFloat1, (int)paramFloat2))) {
        i = 32;
      }
      return i;
      j = 0;
      break;
    }
  }
  
  public Rect getScaledCropRect(float paramFloat)
  {
    return new Rect((int)(paramFloat * this.cropRect.left), (int)(paramFloat * this.cropRect.top), (int)(paramFloat * this.cropRect.right), (int)(paramFloat * this.cropRect.bottom));
  }
  
  void growBy(float paramFloat1, float paramFloat2)
  {
    float f = 25.0F;
    RectF localRectF;
    if (this.maintainAspectRatio)
    {
      if (paramFloat1 != 0.0F) {
        paramFloat2 = paramFloat1 / this.initialAspectRatio;
      }
    }
    else
    {
      localRectF = new RectF(this.cropRect);
      if ((paramFloat1 > 0.0F) && (localRectF.width() + 2.0F * paramFloat1 > this.imageRect.width()))
      {
        paramFloat1 = (this.imageRect.width() - localRectF.width()) / 2.0F;
        if (this.maintainAspectRatio) {
          paramFloat2 = paramFloat1 / this.initialAspectRatio;
        }
      }
      if ((paramFloat2 > 0.0F) && (localRectF.height() + 2.0F * paramFloat2 > this.imageRect.height()))
      {
        paramFloat2 = (this.imageRect.height() - localRectF.height()) / 2.0F;
        if (this.maintainAspectRatio) {
          paramFloat1 = paramFloat2 * this.initialAspectRatio;
        }
      }
      localRectF.inset(-paramFloat1, -paramFloat2);
      if (localRectF.width() < f) {
        localRectF.inset(-(f - localRectF.width()) / 2.0F, 0.0F);
      }
      if (this.maintainAspectRatio) {
        f /= this.initialAspectRatio;
      }
      if (localRectF.height() < f) {
        localRectF.inset(0.0F, -(f - localRectF.height()) / 2.0F);
      }
      if (localRectF.left >= this.imageRect.left) {
        break label335;
      }
      localRectF.offset(this.imageRect.left - localRectF.left, 0.0F);
      label259:
      if (localRectF.top >= this.imageRect.top) {
        break label374;
      }
      localRectF.offset(0.0F, this.imageRect.top - localRectF.top);
    }
    for (;;)
    {
      this.cropRect.set(localRectF);
      this.drawRect = computeLayout();
      this.viewContext.invalidate();
      return;
      if (paramFloat2 == 0.0F) {
        break;
      }
      paramFloat1 = paramFloat2 * this.initialAspectRatio;
      break;
      label335:
      if (localRectF.right <= this.imageRect.right) {
        break label259;
      }
      localRectF.offset(-(localRectF.right - this.imageRect.right), 0.0F);
      break label259;
      label374:
      if (localRectF.bottom > this.imageRect.bottom) {
        localRectF.offset(0.0F, -(localRectF.bottom - this.imageRect.bottom));
      }
    }
  }
  
  void handleMotion(int paramInt, float paramFloat1, float paramFloat2)
  {
    int i = -1;
    Rect localRect = computeLayout();
    if (paramInt == 32)
    {
      moveBy(paramFloat1 * (this.cropRect.width() / localRect.width()), paramFloat2 * (this.cropRect.height() / localRect.height()));
      return;
    }
    if ((paramInt & 0x6) == 0) {
      paramFloat1 = 0.0F;
    }
    if ((paramInt & 0x18) == 0) {
      paramFloat2 = 0.0F;
    }
    float f1 = paramFloat1 * (this.cropRect.width() / localRect.width());
    float f2 = paramFloat2 * (this.cropRect.height() / localRect.height());
    int j;
    float f3;
    if ((paramInt & 0x2) != 0)
    {
      j = i;
      f3 = f1 * j;
      if ((paramInt & 0x8) == 0) {
        break label150;
      }
    }
    for (;;)
    {
      growBy(f3, f2 * i);
      return;
      j = 1;
      break;
      label150:
      i = 1;
    }
  }
  
  public boolean hasFocus()
  {
    return this.isFocused;
  }
  
  public void invalidate()
  {
    this.drawRect = computeLayout();
  }
  
  void moveBy(float paramFloat1, float paramFloat2)
  {
    Rect localRect = new Rect(this.drawRect);
    this.cropRect.offset(paramFloat1, paramFloat2);
    this.cropRect.offset(Math.max(0.0F, this.imageRect.left - this.cropRect.left), Math.max(0.0F, this.imageRect.top - this.cropRect.top));
    this.cropRect.offset(Math.min(0.0F, this.imageRect.right - this.cropRect.right), Math.min(0.0F, this.imageRect.bottom - this.cropRect.bottom));
    this.drawRect = computeLayout();
    localRect.union(this.drawRect);
    localRect.inset(-(int)this.handleRadius, -(int)this.handleRadius);
    this.viewContext.invalidate(localRect);
  }
  
  public void setFocus(boolean paramBoolean)
  {
    this.isFocused = paramBoolean;
  }
  
  public void setMode(ModifyMode paramModifyMode)
  {
    if (paramModifyMode != this.modifyMode)
    {
      this.modifyMode = paramModifyMode;
      this.viewContext.invalidate();
    }
  }
  
  public void setup(Matrix paramMatrix, Rect paramRect, RectF paramRectF, boolean paramBoolean)
  {
    this.matrix = new Matrix(paramMatrix);
    this.cropRect = paramRectF;
    this.imageRect = new RectF(paramRect);
    this.maintainAspectRatio = paramBoolean;
    this.initialAspectRatio = (this.cropRect.width() / this.cropRect.height());
    this.drawRect = computeLayout();
    this.outsidePaint.setARGB(125, 50, 50, 50);
    this.outlinePaint.setStyle(Paint.Style.STROKE);
    this.outlinePaint.setAntiAlias(true);
    this.outlineWidth = dpToPx(2.0F);
    this.handlePaint.setColor(this.highlightColor);
    this.handlePaint.setStyle(Paint.Style.FILL);
    this.handlePaint.setAntiAlias(true);
    this.handleRadius = dpToPx(12.0F);
    this.modifyMode = ModifyMode.None;
  }
  
  static enum HandleMode
  {
    static
    {
      Always = new HandleMode("Always", 1);
      Never = new HandleMode("Never", 2);
      HandleMode[] arrayOfHandleMode = new HandleMode[3];
      arrayOfHandleMode[0] = Changing;
      arrayOfHandleMode[1] = Always;
      arrayOfHandleMode[2] = Never;
      $VALUES = arrayOfHandleMode;
    }
    
    private HandleMode() {}
  }
  
  static enum ModifyMode
  {
    static
    {
      Move = new ModifyMode("Move", 1);
      Grow = new ModifyMode("Grow", 2);
      ModifyMode[] arrayOfModifyMode = new ModifyMode[3];
      arrayOfModifyMode[0] = None;
      arrayOfModifyMode[1] = Move;
      arrayOfModifyMode[2] = Grow;
      $VALUES = arrayOfModifyMode;
    }
    
    private ModifyMode() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/HighlightView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */