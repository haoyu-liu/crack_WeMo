package com.google.android.gms.plus;

import android.app.PendingIntent;
import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.google.android.gms.internal.br;
import com.google.android.gms.internal.br.a;
import com.google.android.gms.internal.bu;
import com.google.android.gms.internal.s;

public final class PlusOneButtonWithPopup
  extends ViewGroup
{
  private int O;
  private String g;
  private View ic;
  private int id;
  private String ie;
  private View.OnClickListener ij;
  
  public PlusOneButtonWithPopup(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PlusOneButtonWithPopup(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.O = PlusOneButton.getSize(paramContext, paramAttributeSet);
    this.id = PlusOneButton.getAnnotation(paramContext, paramAttributeSet);
    this.ic = new PlusOneDummyView(paramContext, this.O);
    addView(this.ic);
  }
  
  private void bv()
  {
    if (this.ic != null) {
      removeView(this.ic);
    }
    this.ic = bu.a(getContext(), this.O, this.id, this.ie, this.g);
    if (this.ij != null) {
      setOnClickListener(this.ij);
    }
    addView(this.ic);
  }
  
  private br bw()
    throws RemoteException
  {
    br localbr = br.a.aa((IBinder)this.ic.getTag());
    if (localbr == null)
    {
      if (Log.isLoggable("PlusOneButtonWithPopup", 5)) {
        Log.w("PlusOneButtonWithPopup", "Failed to get PlusOneDelegate");
      }
      throw new RemoteException();
    }
    return localbr;
  }
  
  private int c(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt1);
    switch (i)
    {
    default: 
      return paramInt1;
    }
    return View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt1) - paramInt2, i);
  }
  
  public void cancelClick()
  {
    if (this.ic != null) {}
    try
    {
      bw().cancelClick();
      return;
    }
    catch (RemoteException localRemoteException) {}
  }
  
  public PendingIntent getResolution()
  {
    if (this.ic != null) {
      try
      {
        PendingIntent localPendingIntent = bw().getResolution();
        return localPendingIntent;
      }
      catch (RemoteException localRemoteException) {}
    }
    return null;
  }
  
  public void initialize(String paramString1, String paramString2)
  {
    s.b(paramString1, "Url must not be null");
    this.ie = paramString1;
    this.g = paramString2;
    bv();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.ic.layout(getPaddingLeft(), getPaddingTop(), paramInt3 - paramInt1 - getPaddingRight(), paramInt4 - paramInt2 - getPaddingBottom());
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = getPaddingLeft() + getPaddingRight();
    int j = getPaddingTop() + getPaddingBottom();
    this.ic.measure(c(paramInt1, i), c(paramInt2, j));
    setMeasuredDimension(i + this.ic.getMeasuredWidth(), j + this.ic.getMeasuredHeight());
  }
  
  public void reinitialize()
  {
    if (this.ic != null) {}
    try
    {
      bw().reinitialize();
      return;
    }
    catch (RemoteException localRemoteException) {}
  }
  
  public void setAnnotation(int paramInt)
  {
    this.id = paramInt;
    bv();
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.ij = paramOnClickListener;
    this.ic.setOnClickListener(paramOnClickListener);
  }
  
  public void setSize(int paramInt)
  {
    this.O = paramInt;
    bv();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/PlusOneButtonWithPopup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */