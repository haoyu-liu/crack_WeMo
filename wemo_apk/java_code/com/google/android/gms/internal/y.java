package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class y
  implements Parcelable.Creator<x>
{
  static void a(x paramx, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramx.getType());
    b.c(paramParcel, 1000, paramx.i());
    b.c(paramParcel, 2, paramx.I());
    b.a(paramParcel, 3, paramx.J(), false);
    b.a(paramParcel, 4, paramx.K(), false);
    b.a(paramParcel, 5, paramx.getDisplayName(), false);
    b.a(paramParcel, 6, paramx.L(), false);
    b.C(paramParcel, i);
  }
  
  public x e(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = a.c(paramParcel);
    String str2 = null;
    String str3 = null;
    String str4 = null;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = a.b(paramParcel);
      switch (a.m(n))
      {
      default: 
        a.b(paramParcel, n);
        break;
      case 1: 
        k = a.f(paramParcel, n);
        break;
      case 1000: 
        m = a.f(paramParcel, n);
        break;
      case 2: 
        i = a.f(paramParcel, n);
        break;
      case 3: 
        str4 = a.l(paramParcel, n);
        break;
      case 4: 
        str3 = a.l(paramParcel, n);
        break;
      case 5: 
        str2 = a.l(paramParcel, n);
        break;
      case 6: 
        str1 = a.l(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new x(m, k, i, str4, str3, str2, str1);
  }
  
  public x[] n(int paramInt)
  {
    return new x[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/y.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */