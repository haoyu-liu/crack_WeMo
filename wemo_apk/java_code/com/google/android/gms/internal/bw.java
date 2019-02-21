package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class bw
  implements Parcelable.Creator<bv>
{
  static void a(bv parambv, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, parambv.getDescription(), false);
    b.c(paramParcel, 1000, parambv.i());
    b.b(paramParcel, 2, parambv.bE(), false);
    b.b(paramParcel, 3, parambv.bF(), false);
    b.a(paramParcel, 4, parambv.bG());
    b.C(paramParcel, i);
  }
  
  public bv[] V(int paramInt)
  {
    return new bv[paramInt];
  }
  
  public bv v(Parcel paramParcel)
  {
    boolean bool = false;
    ArrayList localArrayList1 = null;
    int i = a.c(paramParcel);
    ArrayList localArrayList2 = null;
    String str = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = a.b(paramParcel);
      switch (a.m(k))
      {
      default: 
        a.b(paramParcel, k);
        break;
      case 1: 
        str = a.l(paramParcel, k);
        break;
      case 1000: 
        j = a.f(paramParcel, k);
        break;
      case 2: 
        localArrayList2 = a.c(paramParcel, k, x.CREATOR);
        break;
      case 3: 
        localArrayList1 = a.c(paramParcel, k, x.CREATOR);
        break;
      case 4: 
        bool = a.c(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new bv(j, str, localArrayList2, localArrayList1, bool);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bw.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */