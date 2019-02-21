package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.maps.internal.q;

public final class MarkerOptions
  implements SafeParcelable
{
  public static final MarkerOptionsCreator CREATOR = new MarkerOptionsCreator();
  private final int ab;
  private boolean hc = true;
  private float hk = 0.5F;
  private float hl = 1.0F;
  private LatLng hr;
  private String hs;
  private String ht;
  private BitmapDescriptor hu;
  private boolean hv;
  private boolean hw = false;
  private float hx = 0.0F;
  private float hy = 0.5F;
  private float hz = 0.0F;
  
  public MarkerOptions()
  {
    this.ab = 1;
  }
  
  MarkerOptions(int paramInt, LatLng paramLatLng, String paramString1, String paramString2, IBinder paramIBinder, float paramFloat1, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    this.ab = paramInt;
    this.hr = paramLatLng;
    this.hs = paramString1;
    this.ht = paramString2;
    if (paramIBinder == null) {}
    for (BitmapDescriptor localBitmapDescriptor = null;; localBitmapDescriptor = new BitmapDescriptor(b.a.l(paramIBinder)))
    {
      this.hu = localBitmapDescriptor;
      this.hk = paramFloat1;
      this.hl = paramFloat2;
      this.hv = paramBoolean1;
      this.hc = paramBoolean2;
      this.hw = paramBoolean3;
      this.hx = paramFloat3;
      this.hy = paramFloat4;
      this.hz = paramFloat5;
      return;
    }
  }
  
  public MarkerOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.hk = paramFloat1;
    this.hl = paramFloat2;
    return this;
  }
  
  IBinder bq()
  {
    if (this.hu == null) {
      return null;
    }
    return this.hu.aW().asBinder();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public MarkerOptions draggable(boolean paramBoolean)
  {
    this.hv = paramBoolean;
    return this;
  }
  
  public MarkerOptions flat(boolean paramBoolean)
  {
    this.hw = paramBoolean;
    return this;
  }
  
  public float getAnchorU()
  {
    return this.hk;
  }
  
  public float getAnchorV()
  {
    return this.hl;
  }
  
  public BitmapDescriptor getIcon()
  {
    return this.hu;
  }
  
  public float getInfoWindowAnchorU()
  {
    return this.hy;
  }
  
  public float getInfoWindowAnchorV()
  {
    return this.hz;
  }
  
  public LatLng getPosition()
  {
    return this.hr;
  }
  
  public float getRotation()
  {
    return this.hx;
  }
  
  public String getSnippet()
  {
    return this.ht;
  }
  
  public String getTitle()
  {
    return this.hs;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public MarkerOptions icon(BitmapDescriptor paramBitmapDescriptor)
  {
    this.hu = paramBitmapDescriptor;
    return this;
  }
  
  public MarkerOptions infoWindowAnchor(float paramFloat1, float paramFloat2)
  {
    this.hy = paramFloat1;
    this.hz = paramFloat2;
    return this;
  }
  
  public boolean isDraggable()
  {
    return this.hv;
  }
  
  public boolean isFlat()
  {
    return this.hw;
  }
  
  public boolean isVisible()
  {
    return this.hc;
  }
  
  public MarkerOptions position(LatLng paramLatLng)
  {
    this.hr = paramLatLng;
    return this;
  }
  
  public MarkerOptions rotation(float paramFloat)
  {
    this.hx = paramFloat;
    return this;
  }
  
  public MarkerOptions snippet(String paramString)
  {
    this.ht = paramString;
    return this;
  }
  
  public MarkerOptions title(String paramString)
  {
    this.hs = paramString;
    return this;
  }
  
  public MarkerOptions visible(boolean paramBoolean)
  {
    this.hc = paramBoolean;
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      f.a(this, paramParcel, paramInt);
      return;
    }
    MarkerOptionsCreator.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/MarkerOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */