package com.google.android.gms.common;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.FrameLayout;
import com.google.android.gms.dynamic.e.a;
import com.google.android.gms.internal.s;
import com.google.android.gms.internal.t;
import com.google.android.gms.internal.u;

public final class SignInButton
  extends FrameLayout
  implements View.OnClickListener
{
  public static final int COLOR_DARK = 0;
  public static final int COLOR_LIGHT = 1;
  public static final int SIZE_ICON_ONLY = 2;
  public static final int SIZE_STANDARD = 0;
  public static final int SIZE_WIDE = 1;
  private int O;
  private int P;
  private View Q;
  private View.OnClickListener R = null;
  
  public SignInButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SignInButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public SignInButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setStyle(0, 0);
  }
  
  private static Button c(Context paramContext, int paramInt1, int paramInt2)
  {
    u localu = new u(paramContext);
    localu.a(paramContext.getResources(), paramInt1, paramInt2);
    return localu;
  }
  
  private void d(Context paramContext)
  {
    if (this.Q != null) {
      removeView(this.Q);
    }
    try
    {
      this.Q = t.d(paramContext, this.O, this.P);
      addView(this.Q);
      this.Q.setEnabled(isEnabled());
      this.Q.setOnClickListener(this);
      return;
    }
    catch (e.a locala)
    {
      for (;;)
      {
        Log.w("SignInButton", "Sign in button not found, using placeholder instead");
        this.Q = c(paramContext, this.O, this.P);
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if ((this.R != null) && (paramView == this.Q)) {
      this.R.onClick(this);
    }
  }
  
  public void setColorScheme(int paramInt)
  {
    setStyle(this.O, paramInt);
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    this.Q.setEnabled(paramBoolean);
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.R = paramOnClickListener;
    if (this.Q != null) {
      this.Q.setOnClickListener(this);
    }
  }
  
  public void setSize(int paramInt)
  {
    setStyle(paramInt, this.P);
  }
  
  public void setStyle(int paramInt1, int paramInt2)
  {
    boolean bool1 = true;
    boolean bool2;
    if ((paramInt1 >= 0) && (paramInt1 < 3))
    {
      bool2 = bool1;
      s.a(bool2, "Unknown button size " + paramInt1);
      if ((paramInt2 < 0) || (paramInt2 >= 2)) {
        break label95;
      }
    }
    for (;;)
    {
      s.a(bool1, "Unknown color scheme " + paramInt2);
      this.O = paramInt1;
      this.P = paramInt2;
      d(getContext());
      return;
      bool2 = false;
      break;
      label95:
      bool1 = false;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/SignInButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */