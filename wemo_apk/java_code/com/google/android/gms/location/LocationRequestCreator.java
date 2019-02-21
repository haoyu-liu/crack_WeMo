package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class LocationRequestCreator
  implements Parcelable.Creator<LocationRequest>
{
  public static final int CONTENT_DESCRIPTION;
  
  static void a(LocationRequest paramLocationRequest, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramLocationRequest.mPriority);
    b.c(paramParcel, 1000, paramLocationRequest.i());
    b.a(paramParcel, 2, paramLocationRequest.fB);
    b.a(paramParcel, 3, paramLocationRequest.fC);
    b.a(paramParcel, 4, paramLocationRequest.fD);
    b.a(paramParcel, 5, paramLocationRequest.fw);
    b.c(paramParcel, 6, paramLocationRequest.fE);
    b.a(paramParcel, 7, paramLocationRequest.fF);
    b.C(paramParcel, i);
  }
  
  public LocationRequest createFromParcel(Parcel paramParcel)
  {
    boolean bool = false;
    int i = a.c(paramParcel);
    int j = 102;
    long l1 = 3600000L;
    long l2 = 600000L;
    long l3 = Long.MAX_VALUE;
    int k = Integer.MAX_VALUE;
    float f = 0.0F;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = a.b(paramParcel);
      switch (a.m(n))
      {
      default: 
        a.b(paramParcel, n);
        break;
      case 1: 
        j = a.f(paramParcel, n);
        break;
      case 1000: 
        m = a.f(paramParcel, n);
        break;
      case 2: 
        l1 = a.g(paramParcel, n);
        break;
      case 3: 
        l2 = a.g(paramParcel, n);
        break;
      case 4: 
        bool = a.c(paramParcel, n);
        break;
      case 5: 
        l3 = a.g(paramParcel, n);
        break;
      case 6: 
        k = a.f(paramParcel, n);
        break;
      case 7: 
        f = a.i(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new LocationRequest(m, j, l1, l2, bool, l3, k, f);
  }
  
  public LocationRequest[] newArray(int paramInt)
  {
    return new LocationRequest[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/location/LocationRequestCreator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */