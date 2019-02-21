package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.maps.internal.q;

public final class VisibleRegion
  implements SafeParcelable
{
  public static final VisibleRegionCreator CREATOR = new VisibleRegionCreator();
  private final int ab;
  public final LatLng farLeft;
  public final LatLng farRight;
  public final LatLngBounds latLngBounds;
  public final LatLng nearLeft;
  public final LatLng nearRight;
  
  VisibleRegion(int paramInt, LatLng paramLatLng1, LatLng paramLatLng2, LatLng paramLatLng3, LatLng paramLatLng4, LatLngBounds paramLatLngBounds)
  {
    this.ab = paramInt;
    this.nearLeft = paramLatLng1;
    this.nearRight = paramLatLng2;
    this.farLeft = paramLatLng3;
    this.farRight = paramLatLng4;
    this.latLngBounds = paramLatLngBounds;
  }
  
  public VisibleRegion(LatLng paramLatLng1, LatLng paramLatLng2, LatLng paramLatLng3, LatLng paramLatLng4, LatLngBounds paramLatLngBounds)
  {
    this(1, paramLatLng1, paramLatLng2, paramLatLng3, paramLatLng4, paramLatLngBounds);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    VisibleRegion localVisibleRegion;
    do
    {
      return true;
      if (!(paramObject instanceof VisibleRegion)) {
        return false;
      }
      localVisibleRegion = (VisibleRegion)paramObject;
    } while ((this.nearLeft.equals(localVisibleRegion.nearLeft)) && (this.nearRight.equals(localVisibleRegion.nearRight)) && (this.farLeft.equals(localVisibleRegion.farLeft)) && (this.farRight.equals(localVisibleRegion.farRight)) && (this.latLngBounds.equals(localVisibleRegion.latLngBounds)));
    return false;
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.nearLeft;
    arrayOfObject[1] = this.nearRight;
    arrayOfObject[2] = this.farLeft;
    arrayOfObject[3] = this.farRight;
    arrayOfObject[4] = this.latLngBounds;
    return r.hashCode(arrayOfObject);
  }
  
  int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    return r.c(this).a("nearLeft", this.nearLeft).a("nearRight", this.nearRight).a("farLeft", this.farLeft).a("farRight", this.farRight).a("latLngBounds", this.latLngBounds).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      k.a(this, paramParcel, paramInt);
      return;
    }
    VisibleRegionCreator.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/VisibleRegion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */