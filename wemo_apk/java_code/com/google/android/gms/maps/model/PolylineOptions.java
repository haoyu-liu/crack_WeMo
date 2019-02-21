package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.q;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolylineOptions
  implements SafeParcelable
{
  public static final PolylineOptionsCreator CREATOR = new PolylineOptionsCreator();
  private int P = -16777216;
  private final int ab;
  private final List<LatLng> hB;
  private boolean hD = false;
  private float hb = 0.0F;
  private boolean hc = true;
  private float hg = 10.0F;
  
  public PolylineOptions()
  {
    this.ab = 1;
    this.hB = new ArrayList();
  }
  
  PolylineOptions(int paramInt1, List paramList, float paramFloat1, int paramInt2, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.ab = paramInt1;
    this.hB = paramList;
    this.hg = paramFloat1;
    this.P = paramInt2;
    this.hb = paramFloat2;
    this.hc = paramBoolean1;
    this.hD = paramBoolean2;
  }
  
  public PolylineOptions add(LatLng paramLatLng)
  {
    this.hB.add(paramLatLng);
    return this;
  }
  
  public PolylineOptions add(LatLng... paramVarArgs)
  {
    this.hB.addAll(Arrays.asList(paramVarArgs));
    return this;
  }
  
  public PolylineOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.hB.add(localLatLng);
    }
    return this;
  }
  
  public PolylineOptions color(int paramInt)
  {
    this.P = paramInt;
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public PolylineOptions geodesic(boolean paramBoolean)
  {
    this.hD = paramBoolean;
    return this;
  }
  
  public int getColor()
  {
    return this.P;
  }
  
  public List<LatLng> getPoints()
  {
    return this.hB;
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
  
  public boolean isGeodesic()
  {
    return this.hD;
  }
  
  public boolean isVisible()
  {
    return this.hc;
  }
  
  public PolylineOptions visible(boolean paramBoolean)
  {
    this.hc = paramBoolean;
    return this;
  }
  
  public PolylineOptions width(float paramFloat)
  {
    this.hg = paramFloat;
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      h.a(this, paramParcel, paramInt);
      return;
    }
    PolylineOptionsCreator.a(this, paramParcel, paramInt);
  }
  
  public PolylineOptions zIndex(float paramFloat)
  {
    this.hb = paramFloat;
    return this;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/PolylineOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */