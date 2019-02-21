package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.q;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolygonOptions
  implements SafeParcelable
{
  public static final PolygonOptionsCreator CREATOR = new PolygonOptionsCreator();
  private final int ab;
  private float gY = 10.0F;
  private int gZ = -16777216;
  private final List<LatLng> hB;
  private final List<List<LatLng>> hC;
  private boolean hD = false;
  private int ha = 0;
  private float hb = 0.0F;
  private boolean hc = true;
  
  public PolygonOptions()
  {
    this.ab = 1;
    this.hB = new ArrayList();
    this.hC = new ArrayList();
  }
  
  PolygonOptions(int paramInt1, List<LatLng> paramList, List paramList1, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.ab = paramInt1;
    this.hB = paramList;
    this.hC = paramList1;
    this.gY = paramFloat1;
    this.gZ = paramInt2;
    this.ha = paramInt3;
    this.hb = paramFloat2;
    this.hc = paramBoolean1;
    this.hD = paramBoolean2;
  }
  
  public PolygonOptions add(LatLng paramLatLng)
  {
    this.hB.add(paramLatLng);
    return this;
  }
  
  public PolygonOptions add(LatLng... paramVarArgs)
  {
    this.hB.addAll(Arrays.asList(paramVarArgs));
    return this;
  }
  
  public PolygonOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.hB.add(localLatLng);
    }
    return this;
  }
  
  public PolygonOptions addHole(Iterable<LatLng> paramIterable)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((LatLng)localIterator.next());
    }
    this.hC.add(localArrayList);
    return this;
  }
  
  List br()
  {
    return this.hC;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public PolygonOptions fillColor(int paramInt)
  {
    this.ha = paramInt;
    return this;
  }
  
  public PolygonOptions geodesic(boolean paramBoolean)
  {
    this.hD = paramBoolean;
    return this;
  }
  
  public int getFillColor()
  {
    return this.ha;
  }
  
  public List<List<LatLng>> getHoles()
  {
    return this.hC;
  }
  
  public List<LatLng> getPoints()
  {
    return this.hB;
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
  
  public boolean isGeodesic()
  {
    return this.hD;
  }
  
  public boolean isVisible()
  {
    return this.hc;
  }
  
  public PolygonOptions strokeColor(int paramInt)
  {
    this.gZ = paramInt;
    return this;
  }
  
  public PolygonOptions strokeWidth(float paramFloat)
  {
    this.gY = paramFloat;
    return this;
  }
  
  public PolygonOptions visible(boolean paramBoolean)
  {
    this.hc = paramBoolean;
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      g.a(this, paramParcel, paramInt);
      return;
    }
    PolygonOptionsCreator.a(this, paramParcel, paramInt);
  }
  
  public PolygonOptions zIndex(float paramFloat)
  {
    this.hb = paramFloat;
    return this;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/PolygonOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */