package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.q;

public final class GroundOverlayOptions
  implements SafeParcelable
{
  public static final GroundOverlayOptionsCreator CREATOR = new GroundOverlayOptionsCreator();
  public static final float NO_DIMENSION = -1.0F;
  private final int ab;
  private float gU;
  private float hb;
  private boolean hc = true;
  private BitmapDescriptor he;
  private LatLng hf;
  private float hg;
  private float hh;
  private LatLngBounds hi;
  private float hj = 0.0F;
  private float hk = 0.5F;
  private float hl = 0.5F;
  
  public GroundOverlayOptions()
  {
    this.ab = 1;
  }
  
  GroundOverlayOptions(int paramInt, IBinder paramIBinder, LatLng paramLatLng, float paramFloat1, float paramFloat2, LatLngBounds paramLatLngBounds, float paramFloat3, float paramFloat4, boolean paramBoolean, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    this.ab = paramInt;
    this.he = new BitmapDescriptor(b.a.l(paramIBinder));
    this.hf = paramLatLng;
    this.hg = paramFloat1;
    this.hh = paramFloat2;
    this.hi = paramLatLngBounds;
    this.gU = paramFloat3;
    this.hb = paramFloat4;
    this.hc = paramBoolean;
    this.hj = paramFloat5;
    this.hk = paramFloat6;
    this.hl = paramFloat7;
  }
  
  private GroundOverlayOptions a(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    this.hf = paramLatLng;
    this.hg = paramFloat1;
    this.hh = paramFloat2;
    return this;
  }
  
  public GroundOverlayOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.hk = paramFloat1;
    this.hl = paramFloat2;
    return this;
  }
  
  public GroundOverlayOptions bearing(float paramFloat)
  {
    this.gU = ((360.0F + paramFloat % 360.0F) % 360.0F);
    return this;
  }
  
  IBinder bp()
  {
    return this.he.aW().asBinder();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public float getAnchorU()
  {
    return this.hk;
  }
  
  public float getAnchorV()
  {
    return this.hl;
  }
  
  public float getBearing()
  {
    return this.gU;
  }
  
  public LatLngBounds getBounds()
  {
    return this.hi;
  }
  
  public float getHeight()
  {
    return this.hh;
  }
  
  public BitmapDescriptor getImage()
  {
    return this.he;
  }
  
  public LatLng getLocation()
  {
    return this.hf;
  }
  
  public float getTransparency()
  {
    return this.hj;
  }
  
  public float getWidth()
  {
    return this.hg;
  }
  
  public float getZIndex()
  {
    return this.hb;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public GroundOverlayOptions image(BitmapDescriptor paramBitmapDescriptor)
  {
    this.he = paramBitmapDescriptor;
    return this;
  }
  
  public boolean isVisible()
  {
    return this.hc;
  }
  
  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    if (this.hi == null)
    {
      bool2 = bool1;
      s.a(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null) {
        break label60;
      }
      bool3 = bool1;
      label26:
      s.b(bool3, "Location must be specified");
      if (paramFloat < 0.0F) {
        break label66;
      }
    }
    for (;;)
    {
      s.b(bool1, "Width must be non-negative");
      return a(paramLatLng, paramFloat, -1.0F);
      bool2 = false;
      break;
      label60:
      bool3 = false;
      break label26;
      label66:
      bool1 = false;
    }
  }
  
  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    label29:
    boolean bool4;
    if (this.hi == null)
    {
      bool2 = bool1;
      s.a(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null) {
        break label80;
      }
      bool3 = bool1;
      s.b(bool3, "Location must be specified");
      if (paramFloat1 < 0.0F) {
        break label86;
      }
      bool4 = bool1;
      label46:
      s.b(bool4, "Width must be non-negative");
      if (paramFloat2 < 0.0F) {
        break label92;
      }
    }
    for (;;)
    {
      s.b(bool1, "Height must be non-negative");
      return a(paramLatLng, paramFloat1, paramFloat2);
      bool2 = false;
      break;
      label80:
      bool3 = false;
      break label29;
      label86:
      bool4 = false;
      break label46;
      label92:
      bool1 = false;
    }
  }
  
  public GroundOverlayOptions positionFromBounds(LatLngBounds paramLatLngBounds)
  {
    if (this.hf == null) {}
    for (boolean bool = true;; bool = false)
    {
      s.a(bool, "Position has already been set using position: " + this.hf);
      this.hi = paramLatLngBounds;
      return this;
    }
  }
  
  public GroundOverlayOptions transparency(float paramFloat)
  {
    if ((paramFloat >= 0.0F) && (paramFloat <= 1.0F)) {}
    for (boolean bool = true;; bool = false)
    {
      s.b(bool, "Transparency must be in the range [0..1]");
      this.hj = paramFloat;
      return this;
    }
  }
  
  public GroundOverlayOptions visible(boolean paramBoolean)
  {
    this.hc = paramBoolean;
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      c.a(this, paramParcel, paramInt);
      return;
    }
    GroundOverlayOptionsCreator.a(this, paramParcel, paramInt);
  }
  
  public GroundOverlayOptions zIndex(float paramFloat)
  {
    this.hb = paramFloat;
    return this;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/GroundOverlayOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */