package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class ai
  implements Parcelable.Creator<ah>
{
  static void a(ah paramah, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramah.i());
    b.b(paramParcel, 2, paramah.ai(), false);
    b.a(paramParcel, 3, paramah.aj(), false);
    b.C(paramParcel, i);
  }
  
  public ah k(Parcel paramParcel)
  {
    String str = null;
    int i = a.c(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
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
        localArrayList = a.c(paramParcel, k, ah.a.CREATOR);
        break;
      case 3: 
        str = a.l(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new ah(j, localArrayList, str);
  }
  
  public ah[] t(int paramInt)
  {
    return new ah[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ai.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */