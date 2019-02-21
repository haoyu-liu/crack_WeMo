package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class al
  implements Parcelable.Creator<ak>
{
  static void a(ak paramak, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramak.i());
    b.a(paramParcel, 2, paramak.al(), false);
    b.a(paramParcel, 3, paramak.am(), paramInt, false);
    b.C(paramParcel, i);
  }
  
  public ak m(Parcel paramParcel)
  {
    ah localah = null;
    int i = a.c(paramParcel);
    int j = 0;
    Parcel localParcel = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = a.b(paramParcel);
      switch (a.m(k))
      {
      default: 
        a.b(paramParcel, k);
        break;
      case 1: 
        j = a.f(paramParcel, k);
        break;
      case 2: 
        localParcel = a.y(paramParcel, k);
        break;
      case 3: 
        localah = (ah)a.a(paramParcel, k, ah.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new ak(j, localParcel, localah);
  }
  
  public ak[] v(int paramInt)
  {
    return new ak[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/al.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */