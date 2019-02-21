package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class bj
  implements Parcelable.Creator<bi>
{
  static void a(bi parambi, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, parambi.getRequestId(), false);
    b.c(paramParcel, 1000, parambi.i());
    b.a(paramParcel, 2, parambi.getExpirationTime());
    b.a(paramParcel, 3, parambi.aT());
    b.a(paramParcel, 4, parambi.getLatitude());
    b.a(paramParcel, 5, parambi.getLongitude());
    b.a(paramParcel, 6, parambi.aU());
    b.c(paramParcel, 7, parambi.aV());
    b.C(paramParcel, i);
  }
  
  public bi[] R(int paramInt)
  {
    return new bi[paramInt];
  }
  
  public bi t(Parcel paramParcel)
  {
    double d1 = 0.0D;
    short s = 0;
    int i = a.c(paramParcel);
    String str = null;
    float f = 0.0F;
    long l = 0L;
    double d2 = d1;
    int j = 0;
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
        str = a.l(paramParcel, m);
        break;
      case 1000: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        l = a.g(paramParcel, m);
        break;
      case 3: 
        s = a.e(paramParcel, m);
        break;
      case 4: 
        d2 = a.j(paramParcel, m);
        break;
      case 5: 
        d1 = a.j(paramParcel, m);
        break;
      case 6: 
        f = a.i(paramParcel, m);
        break;
      case 7: 
        j = a.f(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new bi(k, str, j, s, d2, d1, f, l);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bj.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */