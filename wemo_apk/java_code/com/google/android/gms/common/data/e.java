package com.google.android.gms.common.data;

import android.database.CursorWindow;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class e
  implements Parcelable.Creator<d>
{
  static void a(d paramd, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, paramd.j(), false);
    b.c(paramParcel, 1000, paramd.i());
    b.a(paramParcel, 2, paramd.k(), paramInt, false);
    b.c(paramParcel, 3, paramd.getStatusCode());
    b.a(paramParcel, 4, paramd.l(), false);
    b.C(paramParcel, i);
  }
  
  public d a(Parcel paramParcel)
  {
    int i = 0;
    Bundle localBundle = null;
    int j = a.c(paramParcel);
    CursorWindow[] arrayOfCursorWindow = null;
    String[] arrayOfString = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = a.b(paramParcel);
      switch (a.m(m))
      {
      default: 
        a.b(paramParcel, m);
        break;
      case 1: 
        arrayOfString = a.w(paramParcel, m);
        break;
      case 1000: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        arrayOfCursorWindow = (CursorWindow[])a.b(paramParcel, m, CursorWindow.CREATOR);
        break;
      case 3: 
        i = a.f(paramParcel, m);
        break;
      case 4: 
        localBundle = a.n(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    d locald = new d(k, arrayOfString, arrayOfCursorWindow, i, localBundle);
    locald.h();
    return locald;
  }
  
  public d[] g(int paramInt)
  {
    return new d[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/e.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */