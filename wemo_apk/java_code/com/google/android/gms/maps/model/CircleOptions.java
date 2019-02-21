package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.q;

public final class CircleOptions
  implements SafeParcelable
{
  public static final CircleOptionsCreator CREATOR = new CircleOptionsCreator();
  private final int ab;
  private LatLng gW = null;
  private double gX = 0.0D;
  private float gY = 10.0F;
  private int gZ = -16777216;
  private int ha = 0;
  private float hb = 0.0F;
  private boolean hc = true;
  
  public CircleOptions()
  {
    this.ab = 1;
  }
  
  CircleOptions(int paramInt1, LatLng paramLatLng, double paramDouble, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean)
  {
    this.ab = paramInt1;
    this.gW = paramLatLng;
    this.gX = paramDouble;
    this.gY = paramFloat1;
    this.gZ = paramInt2;
    this.ha = paramInt3;
    this.hb = paramFloat2;
    this.hc = paramBoolean;
  }
  
  public CircleOptions center(LatLng paramLatLng)
  {
    this.gW = paramLatLng;
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public CircleOptions fillColor(int paramInt)
  {
    this.ha = paramInt;
    return this;
  }
  
  public LatLng getCenter()
  {
    return this.gW;
  }
  
  public int getFillColor()
  {
    return this.ha;
  }
  
  public double getRadius()
  {
    return this.gX;
  }
  
  public int getStrokeColor()
  {
    return this.gZ;
  }
  
  public float getStrokeWidth()
  {
    return this.gY;
  }
  
  public float getZIndex()
  {
    return this.hb;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public boolean isVisible()
  {
    return this.hc;
  }
  
  public CircleOptions radius(double paramDouble)
  {
    this.gX = paramDouble;
    return this;
  }
  
  public CircleOptions strokeColor(int paramInt)
  {
    this.gZ = paramInt;
    return this;
  }
  
  public CircleOptions strokeWidth(float paramFloat)
  {
    this.gY = paramFloat;
    return this;
  }
  
  public CircleOptions visible(boolean paramBoolean)
  {
    this.hc = paramBoolean;
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      b.a(this, paramParcel, paramInt);
      return;
    }
    CircleOptionsCreator.a(this, paramParcel, paramInt);
  }
  
  public CircleOptions zIndex(float paramFloat)
  {
    this.hb = paramFloat;
    return this;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/CircleOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */