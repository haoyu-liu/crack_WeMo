package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class PolylineOptionsCreator
  implements Parcelable.Creator<PolylineOptions>
{
  public static final int CONTENT_DESCRIPTION;
  
  static void a(PolylineOptions paramPolylineOptions, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramPolylineOptions.i());
    b.b(paramParcel, 2, paramPolylineOptions.getPoints(), false);
    b.a(paramParcel, 3, paramPolylineOptions.getWidth());
    b.c(paramParcel, 4, paramPolylineOptions.getColor());
    b.a(paramParcel, 5, paramPolylineOptions.getZIndex());
    b.a(paramParcel, 6, paramPolylineOptions.isVisible());
    b.a(paramParcel, 7, paramPolylineOptions.isGeodesic());
    b.C(paramParcel, i);
  }
  
  public PolylineOptions createFromParcel(Parcel paramParcel)
  {
    float f1 = 0.0F;
    boolean bool1 = false;
    int i = a.c(paramParcel);
    ArrayList localArrayList = null;
    boolean bool2 = false;
    int j = 0;
    float f2 = 0.0F;
    int k = 0;
    while (paramParcel.dataPosition() < i)
    {
      int m = a.b(paramParcel);
      switch (a.m(m))
      {
      default: 
        a.b(paramParcel, m);
        break;
      case 1: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        localArrayList = a.c(paramParcel, m, LatLng.CREATOR);
        break;
      case 3: 
        f2 = a.i(paramParcel, m);
        break;
      case 4: 
        j = a.f(paramParcel, m);
        break;
      case 5: 
        f1 = a.i(paramParcel, m);
        break;
      case 6: 
        bool2 = a.c(paramParcel, m);
        break;
      case 7: 
        bool1 = a.c(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new PolylineOptions(k, localArrayList, f2, j, f1, bool2, bool1);
  }
  
  public PolylineOptions[] newArray(int paramInt)
  {
    return new PolylineOptions[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/PolylineOptionsCreator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */