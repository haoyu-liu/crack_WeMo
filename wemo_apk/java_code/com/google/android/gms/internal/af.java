package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class af
  implements Parcelable.Creator<ae.a>
{
  static void a(ae.a parama, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, parama.i());
    b.c(paramParcel, 2, parama.R());
    b.a(paramParcel, 3, parama.X());
    b.c(paramParcel, 4, parama.S());
    b.a(paramParcel, 5, parama.Y());
    b.a(paramParcel, 6, parama.Z(), false);
    b.c(paramParcel, 7, parama.aa());
    b.a(paramParcel, 8, parama.ac(), false);
    b.a(paramParcel, 9, parama.ae(), paramInt, false);
    b.C(paramParcel, i);
  }
  
  public ae.a i(Parcel paramParcel)
  {
    z localz = null;
    int i = 0;
    int j = a.c(paramParcel);
    String str1 = null;
    String str2 = null;
    boolean bool1 = false;
    int k = 0;
    boolean bool2 = false;
    int m = 0;
    int n = 0;
    while (paramParcel.dataPosition() < j)
    {
      int i1 = a.b(paramParcel);
      switch (a.m(i1))
      {
      default: 
        a.b(paramParcel, i1);
        break;
      case 1: 
        n = a.f(paramParcel, i1);
        break;
      case 2: 
        m = a.f(paramParcel, i1);
        break;
      case 3: 
        bool2 = a.c(paramParcel, i1);
        break;
      case 4: 
        k = a.f(paramParcel, i1);
        break;
      case 5: 
        bool1 = a.c(paramParcel, i1);
        break;
      case 6: 
        str2 = a.l(paramParcel, i1);
        break;
      case 7: 
        i = a.f(paramParcel, i1);
        break;
      case 8: 
        str1 = a.l(paramParcel, i1);
        break;
      case 9: 
        localz = (z)a.a(paramParcel, i1, z.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new ae.a(n, m, bool2, k, bool1, str2, i, str1, localz);
  }
  
  public ae.a[] r(int paramInt)
  {
    return new ae.a[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/af.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */