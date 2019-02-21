package com.google.android.gms.plus;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a.a;

public class b
  implements Parcelable.Creator<a>
{
  static void a(a parama, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.b.d(paramParcel);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 1, parama.getAccountName(), false);
    com.google.android.gms.common.internal.safeparcel.b.c(paramParcel, 1000, parama.i());
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 2, parama.by(), false);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 3, parama.bz(), false);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 4, parama.bA(), false);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 5, parama.bB(), false);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 6, parama.bC(), false);
    com.google.android.gms.common.internal.safeparcel.b.a(paramParcel, 7, parama.bD(), false);
    com.google.android.gms.common.internal.safeparcel.b.C(paramParcel, i);
  }
  
  public a[] U(int paramInt)
  {
    return new a[paramInt];
  }
  
  public a u(Parcel paramParcel)
  {
    String str1 = null;
    int i = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel);
    int j = 0;
    String str2 = null;
    String str3 = null;
    String[] arrayOfString1 = null;
    String[] arrayOfString2 = null;
    String[] arrayOfString3 = null;
    String str4 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.a.b(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.a.m(k))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.a.b(paramParcel, k);
        break;
      case 1: 
        str4 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, k);
        break;
      case 1000: 
        j = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, k);
        break;
      case 2: 
        arrayOfString3 = com.google.android.gms.common.internal.safeparcel.a.w(paramParcel, k);
        break;
      case 3: 
        arrayOfString2 = com.google.android.gms.common.internal.safeparcel.a.w(paramParcel, k);
        break;
      case 4: 
        arrayOfString1 = com.google.android.gms.common.internal.safeparcel.a.w(paramParcel, k);
        break;
      case 5: 
        str3 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, k);
        break;
      case 6: 
        str2 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, k);
        break;
      case 7: 
        str1 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new a(j, str4, arrayOfString3, arrayOfString2, arrayOfString1, str3, str2, str1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/b.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */