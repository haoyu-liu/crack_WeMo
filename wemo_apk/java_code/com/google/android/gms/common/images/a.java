package com.google.android.gms.common.images;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.internal.as;
import com.google.android.gms.internal.f;
import com.google.android.gms.internal.g;
import com.google.android.gms.internal.h;
import com.google.android.gms.internal.r;
import java.lang.ref.WeakReference;

public final class a
{
  final a aG;
  private int aH = 0;
  private int aI = 0;
  int aJ;
  private int aK;
  private WeakReference<ImageManager.OnImageLoadedListener> aL;
  private WeakReference<ImageView> aM;
  private WeakReference<TextView> aN;
  private int aO = -1;
  private boolean aP = true;
  private boolean aQ = false;
  
  public a(int paramInt)
  {
    this.aG = new a(null);
    this.aI = paramInt;
  }
  
  public a(Uri paramUri)
  {
    this.aG = new a(paramUri);
    this.aI = 0;
  }
  
  private f a(Drawable paramDrawable1, Drawable paramDrawable2)
  {
    if (paramDrawable1 != null) {
      if (!(paramDrawable1 instanceof f)) {}
    }
    for (paramDrawable1 = ((f)paramDrawable1).r();; paramDrawable1 = null) {
      return new f(paramDrawable1, paramDrawable2);
    }
  }
  
  private void a(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    switch (this.aJ)
    {
    }
    TextView localTextView;
    do
    {
      ImageView localImageView;
      do
      {
        ImageManager.OnImageLoadedListener localOnImageLoadedListener;
        do
        {
          do
          {
            return;
          } while (paramBoolean2);
          localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)this.aL.get();
        } while (localOnImageLoadedListener == null);
        localOnImageLoadedListener.onImageLoaded(this.aG.uri, paramDrawable);
        return;
        localImageView = (ImageView)this.aM.get();
      } while (localImageView == null);
      a(localImageView, paramDrawable, paramBoolean1, paramBoolean2, paramBoolean3);
      return;
      localTextView = (TextView)this.aN.get();
    } while (localTextView == null);
    a(localTextView, this.aO, paramDrawable, paramBoolean1, paramBoolean2);
  }
  
  private void a(ImageView paramImageView, Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if ((!paramBoolean2) && (!paramBoolean3)) {}
    for (int i = 1; (i != 0) && ((paramImageView instanceof g)); i = 0)
    {
      int k = ((g)paramImageView).t();
      if ((this.aI == 0) || (k != this.aI)) {
        break;
      }
      return;
    }
    boolean bool = a(paramBoolean1, paramBoolean2);
    if (bool) {}
    for (Object localObject = a(paramImageView.getDrawable(), paramDrawable);; localObject = paramDrawable)
    {
      paramImageView.setImageDrawable((Drawable)localObject);
      g localg;
      Uri localUri;
      if ((paramImageView instanceof g))
      {
        localg = (g)paramImageView;
        if (!paramBoolean3) {
          break label157;
        }
        localUri = this.aG.uri;
        label115:
        localg.a(localUri);
        if (i == 0) {
          break label163;
        }
      }
      label157:
      label163:
      for (int j = this.aI;; j = 0)
      {
        localg.k(j);
        if (!bool) {
          break;
        }
        ((f)localObject).startTransition(250);
        return;
        localUri = null;
        break label115;
      }
    }
  }
  
  private void a(TextView paramTextView, int paramInt, Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2)
  {
    boolean bool = a(paramBoolean1, paramBoolean2);
    Drawable[] arrayOfDrawable;
    Drawable localDrawable;
    if (as.as())
    {
      arrayOfDrawable = paramTextView.getCompoundDrawablesRelative();
      localDrawable = arrayOfDrawable[paramInt];
      if (!bool) {
        break label172;
      }
    }
    label50:
    label59:
    label68:
    label77:
    label130:
    label139:
    label148:
    label157:
    label172:
    for (Object localObject1 = a(localDrawable, paramDrawable);; localObject1 = paramDrawable)
    {
      Object localObject2;
      Object localObject3;
      Object localObject4;
      Object localObject5;
      if (paramInt == 0)
      {
        localObject2 = localObject1;
        if (paramInt != 1) {
          break label130;
        }
        localObject3 = localObject1;
        if (paramInt != 2) {
          break label139;
        }
        localObject4 = localObject1;
        if (paramInt != 3) {
          break label148;
        }
        localObject5 = localObject1;
        if (!as.as()) {
          break label157;
        }
        paramTextView.setCompoundDrawablesRelativeWithIntrinsicBounds((Drawable)localObject2, (Drawable)localObject3, (Drawable)localObject4, (Drawable)localObject5);
      }
      for (;;)
      {
        if (bool) {
          ((f)localObject1).startTransition(250);
        }
        return;
        arrayOfDrawable = paramTextView.getCompoundDrawables();
        break;
        localObject2 = arrayOfDrawable[0];
        break label50;
        localObject3 = arrayOfDrawable[1];
        break label59;
        localObject4 = arrayOfDrawable[2];
        break label68;
        localObject5 = arrayOfDrawable[3];
        break label77;
        paramTextView.setCompoundDrawablesWithIntrinsicBounds((Drawable)localObject2, (Drawable)localObject3, (Drawable)localObject4, (Drawable)localObject5);
      }
    }
  }
  
  private boolean a(boolean paramBoolean1, boolean paramBoolean2)
  {
    return (this.aP) && (!paramBoolean2) && ((!paramBoolean1) || (this.aQ));
  }
  
  void a(Context paramContext, Bitmap paramBitmap, boolean paramBoolean)
  {
    h.b(paramBitmap);
    a(new BitmapDrawable(paramContext.getResources(), paramBitmap), paramBoolean, false, true);
  }
  
  public void a(ImageView paramImageView)
  {
    h.b(paramImageView);
    this.aL = null;
    this.aM = new WeakReference(paramImageView);
    this.aN = null;
    this.aO = -1;
    this.aJ = 2;
    this.aK = paramImageView.hashCode();
  }
  
  public void a(ImageManager.OnImageLoadedListener paramOnImageLoadedListener)
  {
    h.b(paramOnImageLoadedListener);
    this.aL = new WeakReference(paramOnImageLoadedListener);
    this.aM = null;
    this.aN = null;
    this.aO = -1;
    this.aJ = 1;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramOnImageLoadedListener;
    arrayOfObject[1] = this.aG;
    this.aK = r.hashCode(arrayOfObject);
  }
  
  void b(Context paramContext, boolean paramBoolean)
  {
    int i = this.aI;
    Drawable localDrawable = null;
    if (i != 0) {
      localDrawable = paramContext.getResources().getDrawable(this.aI);
    }
    a(localDrawable, paramBoolean, false, false);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof a)) {
      bool = false;
    }
    while ((this == paramObject) || (((a)paramObject).hashCode() == hashCode())) {
      return bool;
    }
    return false;
  }
  
  void f(Context paramContext)
  {
    int i = this.aH;
    Drawable localDrawable = null;
    if (i != 0) {
      localDrawable = paramContext.getResources().getDrawable(this.aH);
    }
    a(localDrawable, false, true, false);
  }
  
  public int hashCode()
  {
    return this.aK;
  }
  
  public void j(int paramInt)
  {
    this.aI = paramInt;
  }
  
  public static final class a
  {
    public final Uri uri;
    
    public a(Uri paramUri)
    {
      this.uri = paramUri;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool = true;
      if (!(paramObject instanceof a)) {
        bool = false;
      }
      while ((this == paramObject) || (((a)paramObject).hashCode() == hashCode())) {
        return bool;
      }
      return false;
    }
    
    public int hashCode()
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.uri;
      return r.hashCode(arrayOfObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/images/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */