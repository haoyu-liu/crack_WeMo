package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class ag
  implements Parcelable.Creator<ah.b>
{
  static void a(ah.b paramb, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramb.versionCode);
    b.a(paramParcel, 2, paramb.cH, false);
    b.a(paramParcel, 3, paramb.cI, paramInt, false);
    b.C(paramParcel, i);
  }
  
  public ah.b j(Parcel paramParcel)
  {
    ae.a locala = null;
    int i = a.c(paramParcel);
    int j = 0;
    String str = null;
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
        str = a.l(paramParcel, k);
        break;
      case 3: 
        locala = (ae.a)a.a(paramParcel, k, ae.a.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new ah.b(j, str, locala);
  }
  
  public ah.b[] s(int paramInt)
  {
    return new ah.b[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ag.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */