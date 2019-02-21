package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class cp
  implements Parcelable.Creator<co>
{
  static void a(co paramco, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, paramco.getId(), false);
    b.c(paramParcel, 1000, paramco.i());
    b.b(paramParcel, 2, paramco.cB(), false);
    b.b(paramParcel, 3, paramco.cC(), false);
    b.a(paramParcel, 4, paramco.cD(), paramInt, false);
    b.a(paramParcel, 5, paramco.cE(), false);
    b.a(paramParcel, 6, paramco.cF(), false);
    b.a(paramParcel, 7, paramco.cG(), false);
    b.a(paramParcel, 8, paramco.cH(), false);
    b.a(paramParcel, 9, paramco.cI(), false);
    b.c(paramParcel, 10, paramco.cJ());
    b.C(paramParcel, i);
  }
  
  public co I(Parcel paramParcel)
  {
    int i = 0;
    Bundle localBundle1 = null;
    int j = a.c(paramParcel);
    Bundle localBundle2 = null;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    Uri localUri = null;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    String str4 = null;
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
        str4 = a.l(paramParcel, m);
        break;
      case 1000: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        localArrayList2 = a.c(paramParcel, m, x.CREATOR);
        break;
      case 3: 
        localArrayList1 = a.c(paramParcel, m, Uri.CREATOR);
        break;
      case 4: 
        localUri = (Uri)a.a(paramParcel, m, Uri.CREATOR);
        break;
      case 5: 
        str3 = a.l(paramParcel, m);
        break;
      case 6: 
        str2 = a.l(paramParcel, m);
        break;
      case 7: 
        str1 = a.l(paramParcel, m);
        break;
      case 8: 
        localBundle2 = a.n(paramParcel, m);
        break;
      case 9: 
        localBundle1 = a.n(paramParcel, m);
        break;
      case 10: 
        i = a.f(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new co(k, str4, localArrayList2, localArrayList1, localUri, str3, str2, str1, localBundle2, localBundle1, i);
  }
  
  public co[] ai(int paramInt)
  {
    return new co[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/cp.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */