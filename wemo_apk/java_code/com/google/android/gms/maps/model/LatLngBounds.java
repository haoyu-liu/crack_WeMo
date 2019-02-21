package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.q;

public final class LatLngBounds
  implements SafeParcelable
{
  public static final LatLngBoundsCreator CREATOR = new LatLngBoundsCreator();
  private final int ab;
  public final LatLng northeast;
  public final LatLng southwest;
  
  LatLngBounds(int paramInt, LatLng paramLatLng1, LatLng paramLatLng2)
  {
    s.b(paramLatLng1, "null southwest");
    s.b(paramLatLng2, "null northeast");
    if (paramLatLng2.latitude >= paramLatLng1.latitude) {}
    for (boolean bool = true;; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Double.valueOf(paramLatLng1.latitude);
      arrayOfObject[1] = Double.valueOf(paramLatLng2.latitude);
      s.a(bool, "southern latitude exceeds northern latitude (%s > %s)", arrayOfObject);
      this.ab = paramInt;
      this.southwest = paramLatLng1;
      this.northeast = paramLatLng2;
      return;
    }
  }
  
  public LatLngBounds(LatLng paramLatLng1, LatLng paramLatLng2)
  {
    this(1, paramLatLng1, paramLatLng2);
  }
  
  private boolean a(double paramDouble)
  {
    return (this.southwest.latitude <= paramDouble) && (paramDouble <= this.northeast.latitude);
  }
  
  private static double b(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble1 - paramDouble2)) % 360.0D;
  }
  
  private boolean b(double paramDouble)
  {
    if (this.southwest.longitude <= this.northeast.longitude) {
      return (this.southwest.longitude <= paramDouble) && (paramDouble <= this.northeast.longitude);
    }
    boolean bool1;
    if (this.southwest.longitude > paramDouble)
    {
      boolean bool2 = paramDouble < this.northeast.longitude;
      bool1 = false;
      if (bool2) {}
    }
    else
    {
      bool1 = true;
    }
    return bool1;
  }
  
  public static Builder builder()
  {
    return new Builder();
  }
  
  private static double c(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble2 - paramDouble1)) % 360.0D;
  }
  
  public boolean contains(LatLng paramLatLng)
  {
    return (a(paramLatLng.latitude)) && (b(paramLatLng.longitude));
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    LatLngBounds localLatLngBounds;
    do
    {
      return true;
      if (!(paramObject instanceof LatLngBounds)) {
        return false;
      }
      localLatLngBounds = (LatLngBounds)paramObject;
    } while ((this.southwest.equals(localLatLngBounds.southwest)) && (this.northeast.equals(localLatLngBounds.northeast)));
    return false;
  }
  
  public LatLng getCenter()
  {
    double d1 = (this.southwest.latitude + this.northeast.latitude) / 2.0D;
    double d2 = this.northeast.longitude;
    double d3 = this.southwest.longitude;
    if (d3 <= d2) {}
    for (double d4 = (d2 + d3) / 2.0D;; d4 = (d3 + (d2 + 360.0D)) / 2.0D) {
      return new LatLng(d1, d4);
    }
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.southwest;
    arrayOfObject[1] = this.northeast;
    return r.hashCode(arrayOfObject);
  }
  
  int i()
  {
    return this.ab;
  }
  
  public LatLngBounds including(LatLng paramLatLng)
  {
    double d1 = Math.min(this.southwest.latitude, paramLatLng.latitude);
    double d2 = Math.max(this.northeast.latitude, paramLatLng.latitude);
    double d3 = this.northeast.longitude;
    double d4 = this.southwest.longitude;
    double d5 = paramLatLng.longitude;
    double d6;
    if (!b(d5)) {
      if (b(d4, d5) < c(d3, d5)) {
        d6 = d3;
      }
    }
    for (;;)
    {
      return new LatLngBounds(new LatLng(d1, d5), new LatLng(d2, d6));
      d6 = d5;
      d5 = d4;
      continue;
      d5 = d4;
      d6 = d3;
    }
  }
  
  public String toString()
  {
    return r.c(this).a("southwest", this.southwest).a("northeast", this.northeast).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      d.a(this, paramParcel, paramInt);
      return;
    }
    LatLngBoundsCreator.a(this, paramParcel, paramInt);
  }
  
  public static final class Builder
  {
    private double hm = Double.POSITIVE_INFINITY;
    private double hn = Double.NEGATIVE_INFINITY;
    private double ho = NaN.0D;
    private double hp = NaN.0D;
    
    private boolean b(double paramDouble)
    {
      if (this.ho <= this.hp) {
        return (this.ho <= paramDouble) && (paramDouble <= this.hp);
      }
      boolean bool1;
      if (this.ho > paramDouble)
      {
        boolean bool2 = paramDouble < this.hp;
        bool1 = false;
        if (bool2) {}
      }
      else
      {
        bool1 = true;
      }
      return bool1;
    }
    
    public LatLngBounds build()
    {
      if (!Double.isNaN(this.ho)) {}
      for (boolean bool = true;; bool = false)
      {
        s.a(bool, "no included points");
        return new LatLngBounds(new LatLng(this.hm, this.ho), new LatLng(this.hn, this.hp));
      }
    }
    
    public Builder include(LatLng paramLatLng)
    {
      this.hm = Math.min(this.hm, paramLatLng.latitude);
      this.hn = Math.max(this.hn, paramLatLng.latitude);
      double d = paramLatLng.longitude;
      if (Double.isNaN(this.ho))
      {
        this.ho = d;
        this.hp = d;
      }
      while (b(d)) {
        return this;
      }
      if (LatLngBounds.d(this.ho, d) < LatLngBounds.e(this.hp, d))
      {
        this.ho = d;
        return this;
      }
      this.hp = d;
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/LatLngBounds.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */