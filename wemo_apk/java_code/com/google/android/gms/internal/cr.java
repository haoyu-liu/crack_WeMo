package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;

public class cr
  implements Parcelable.Creator<cq>
{
  static void a(cq paramcq, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1000, paramcq.i());
    b.b(paramParcel, 2, paramcq.cK(), false);
    b.b(paramParcel, 3, paramcq.cL(), false);
    b.a(paramParcel, 4, paramcq.cM(), false);
    b.a(paramParcel, 5, paramcq.cN());
    b.c(paramParcel, 6, paramcq.cJ());
    b.C(paramParcel, i);
  }
  
  public cq J(Parcel paramParcel)
  {
    Bundle localBundle = null;
    int i = 0;
    int j = a.c(paramParcel);
    boolean bool = false;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = a.b(paramParcel);
      switch (a.m(m))
      {
      default: 
        a.b(paramParcel, m);
        break;
      case 1000: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        localArrayList2 = a.c(paramParcel, m, x.CREATOR);
        break;
      case 3: 
        localArrayList1 = a.c(paramParcel, m, x.CREATOR);
        break;
      case 4: 
        localBundle = a.n(paramParcel, m);
        break;
      case 5: 
        bool = a.c(paramParcel, m);
        break;
      case 6: 
        i = a.f(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new cq(k, localArrayList2, localArrayList1, localBundle, bool, i);
  }
  
  public cq[] aj(int paramInt)
  {
    return new cq[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/cr.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */