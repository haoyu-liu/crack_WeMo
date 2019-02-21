package com.google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import com.google.android.gms.internal.bu;
import com.google.android.gms.internal.s;
import com.google.android.gms.internal.v;

public final class PlusOneButton
  extends FrameLayout
{
  public static final int ANNOTATION_BUBBLE = 1;
  public static final int ANNOTATION_INLINE = 2;
  public static final int ANNOTATION_NONE = 0;
  public static final int DEFAULT_ACTIVITY_REQUEST_CODE = -1;
  public static final int SIZE_MEDIUM = 1;
  public static final int SIZE_SMALL = 0;
  public static final int SIZE_STANDARD = 3;
  public static final int SIZE_TALL = 2;
  private int O;
  private View ic;
  private int id;
  private String ie;
  private int jdField_if;
  private OnPlusOneClickListener ig;
  
  public PlusOneButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PlusOneButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.O = getSize(paramContext, paramAttributeSet);
    this.id = getAnnotation(paramContext, paramAttributeSet);
    this.jdField_if = -1;
    d(getContext());
    if (isInEditMode()) {}
  }
  
  private void d(Context paramContext)
  {
    if (this.ic != null) {
      removeView(this.ic);
    }
    this.ic = bu.a(paramContext, this.O, this.id, this.ie, this.jdField_if);
    setOnPlusOneClickListener(this.ig);
    addView(this.ic);
  }
  
  protected static int getAnnotation(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = v.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "annotation", paramContext, paramAttributeSet, true, false, "PlusOneButton");
    int i;
    if ("INLINE".equalsIgnoreCase(str)) {
      i = 2;
    }
    boolean bool;
    do
    {
      return i;
      bool = "NONE".equalsIgnoreCase(str);
      i = 0;
    } while (bool);
    return 1;
  }
  
  protected static int getSize(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = v.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "size", paramContext, paramAttributeSet, true, false, "PlusOneButton");
    if ("SMALL".equalsIgnoreCase(str)) {
      return 0;
    }
    if ("MEDIUM".equalsIgnoreCase(str)) {
      return 1;
    }
    if ("TALL".equalsIgnoreCase(str)) {
      return 2;
    }
    return 3;
  }
  
  public void initialize(String paramString, int paramInt)
  {
    s.a(getContext() instanceof Activity, "To use this method, the PlusOneButton must be placed in an Activity. Use initialize(PlusClient, String, OnPlusOneClickListener).");
    this.ie = paramString;
    this.jdField_if = paramInt;
    d(getContext());
  }
  
  public void initialize(String paramString, OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.ie = paramString;
    this.jdField_if = 0;
    d(getContext());
    setOnPlusOneClickListener(paramOnPlusOneClickListener);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.ic.layout(0, 0, paramInt3 - paramInt1, paramInt4 - paramInt2);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    View localView = this.ic;
    measureChild(localView, paramInt1, paramInt2);
    setMeasuredDimension(localView.getMeasuredWidth(), localView.getMeasuredHeight());
  }
  
  public void setAnnotation(int paramInt)
  {
    this.id = paramInt;
    d(getContext());
  }
  
  public void setOnPlusOneClickListener(OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.ig = paramOnPlusOneClickListener;
    this.ic.setOnClickListener(new DefaultOnPlusOneClickListener(paramOnPlusOneClickListener));
  }
  
  public void setSize(int paramInt)
  {
    this.O = paramInt;
    d(getContext());
  }
  
  protected class DefaultOnPlusOneClickListener
    implements View.OnClickListener, PlusOneButton.OnPlusOneClickListener
  {
    private final PlusOneButton.OnPlusOneClickListener ih;
    
    public DefaultOnPlusOneClickListener(PlusOneButton.OnPlusOneClickListener paramOnPlusOneClickListener)
    {
      this.ih = paramOnPlusOneClickListener;
    }
    
    public void onClick(View paramView)
    {
      Intent localIntent = (Intent)PlusOneButton.a(PlusOneButton.this).getTag();
      if (this.ih != null)
      {
        this.ih.onPlusOneClick(localIntent);
        return;
      }
      onPlusOneClick(localIntent);
    }
    
    public void onPlusOneClick(Intent paramIntent)
    {
      Context localContext = PlusOneButton.this.getContext();
      if (((localContext instanceof Activity)) && (paramIntent != null)) {
        ((Activity)localContext).startActivityForResult(paramIntent, PlusOneButton.b(PlusOneButton.this));
      }
    }
  }
  
  public static abstract interface OnPlusOneClickListener
  {
    public abstract void onPlusOneClick(Intent paramIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/PlusOneButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */