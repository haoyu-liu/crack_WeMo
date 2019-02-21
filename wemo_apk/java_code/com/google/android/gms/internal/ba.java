package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.view.Display;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import java.lang.ref.WeakReference;

public class ba
{
  protected au dt;
  protected a ej;
  
  private ba(au paramau, int paramInt)
  {
    this.dt = paramau;
    F(paramInt);
  }
  
  public static ba a(au paramau, int paramInt)
  {
    if (as.ao()) {
      return new b(paramau, paramInt);
    }
    return new ba(paramau, paramInt);
  }
  
  protected void F(int paramInt)
  {
    this.ej = new a(paramInt, new Binder(), null);
  }
  
  public void a(View paramView) {}
  
  public void aB()
  {
    this.dt.a(this.ej.ek, this.ej.aE());
  }
  
  public Bundle aC()
  {
    return this.ej.aE();
  }
  
  public IBinder aD()
  {
    return this.ej.ek;
  }
  
  public void setGravity(int paramInt)
  {
    this.ej.gravity = paramInt;
  }
  
  public static final class a
  {
    public int bottom = 0;
    public IBinder ek;
    public int el = -1;
    public int gravity;
    public int left = 0;
    public int right = 0;
    public int top = 0;
    
    private a(int paramInt, IBinder paramIBinder)
    {
      this.gravity = paramInt;
      this.ek = paramIBinder;
    }
    
    public Bundle aE()
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("popupLocationInfo.gravity", this.gravity);
      localBundle.putInt("popupLocationInfo.displayId", this.el);
      localBundle.putInt("popupLocationInfo.left", this.left);
      localBundle.putInt("popupLocationInfo.top", this.top);
      localBundle.putInt("popupLocationInfo.right", this.right);
      localBundle.putInt("popupLocationInfo.bottom", this.bottom);
      return localBundle;
    }
  }
  
  private static final class b
    extends ba
    implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener
  {
    private boolean dE = false;
    private WeakReference<View> em;
    
    protected b(au paramau, int paramInt)
    {
      super(paramInt, null);
    }
    
    private void b(View paramView)
    {
      int i = -1;
      if (as.as())
      {
        Display localDisplay = paramView.getDisplay();
        if (localDisplay != null) {
          i = localDisplay.getDisplayId();
        }
      }
      IBinder localIBinder = paramView.getWindowToken();
      int[] arrayOfInt = new int[2];
      paramView.getLocationInWindow(arrayOfInt);
      int j = paramView.getWidth();
      int k = paramView.getHeight();
      this.ej.el = i;
      this.ej.ek = localIBinder;
      this.ej.left = arrayOfInt[0];
      this.ej.top = arrayOfInt[1];
      this.ej.right = (j + arrayOfInt[0]);
      this.ej.bottom = (k + arrayOfInt[1]);
      if (this.dE)
      {
        aB();
        this.dE = false;
      }
    }
    
    protected void F(int paramInt)
    {
      this.ej = new ba.a(paramInt, null, null);
    }
    
    public void a(View paramView)
    {
      this.dt.ax();
      ViewTreeObserver localViewTreeObserver;
      if (this.em != null)
      {
        View localView2 = (View)this.em.get();
        Context localContext2 = this.dt.getContext();
        if ((localView2 == null) && ((localContext2 instanceof Activity))) {
          localView2 = ((Activity)localContext2).getWindow().getDecorView();
        }
        if (localView2 != null)
        {
          localView2.removeOnAttachStateChangeListener(this);
          localViewTreeObserver = localView2.getViewTreeObserver();
          if (!as.ar()) {
            break label184;
          }
          localViewTreeObserver.removeOnGlobalLayoutListener(this);
        }
      }
      for (;;)
      {
        this.em = null;
        Context localContext1 = this.dt.getContext();
        if ((paramView == null) && ((localContext1 instanceof Activity)))
        {
          View localView1 = ((Activity)localContext1).findViewById(16908290);
          if (localView1 == null) {
            localView1 = ((Activity)localContext1).getWindow().getDecorView();
          }
          ax.b("PopupManager", "You have not specified a View to use as content view for popups. Falling back to the Activity content view which may not work properly in future versions of the API. Use setViewForPopups() to set your content view.");
          paramView = localView1;
        }
        if (paramView == null) {
          break;
        }
        b(paramView);
        this.em = new WeakReference(paramView);
        paramView.addOnAttachStateChangeListener(this);
        paramView.getViewTreeObserver().addOnGlobalLayoutListener(this);
        return;
        label184:
        localViewTreeObserver.removeGlobalOnLayoutListener(this);
      }
      ax.c("PopupManager", "No content view usable to display popups. Popups will not be displayed in response to this client's calls. Use setViewForPopups() to set your content view.");
    }
    
    public void aB()
    {
      if (this.ej.ek != null)
      {
        super.aB();
        return;
      }
      if (this.em != null) {}
      for (boolean bool = true;; bool = false)
      {
        this.dE = bool;
        return;
      }
    }
    
    public void onGlobalLayout()
    {
      if (this.em == null) {}
      View localView;
      do
      {
        return;
        localView = (View)this.em.get();
      } while (localView == null);
      b(localView);
    }
    
    public void onViewAttachedToWindow(View paramView)
    {
      b(paramView);
    }
    
    public void onViewDetachedFromWindow(View paramView)
    {
      this.dt.ax();
      paramView.removeOnAttachStateChangeListener(this);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ba.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */