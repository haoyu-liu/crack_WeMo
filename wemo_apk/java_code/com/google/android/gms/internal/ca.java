package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.HashSet;
import java.util.Set;

public class ca
  implements Parcelable.Creator<bz>
{
  static void a(bz parambz, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    Set localSet = parambz.bH();
    if (localSet.contains(Integer.valueOf(1))) {
      b.c(paramParcel, 1, parambz.i());
    }
    if (localSet.contains(Integer.valueOf(2))) {
      b.a(paramParcel, 2, parambz.getId(), true);
    }
    if (localSet.contains(Integer.valueOf(4))) {
      b.a(paramParcel, 4, parambz.bY(), paramInt, true);
    }
    if (localSet.contains(Integer.valueOf(5))) {
      b.a(paramParcel, 5, parambz.getStartDate(), true);
    }
    if (localSet.contains(Integer.valueOf(6))) {
      b.a(paramParcel, 6, parambz.bZ(), paramInt, true);
    }
    if (localSet.contains(Integer.valueOf(7))) {
      b.a(paramParcel, 7, parambz.getType(), true);
    }
    b.C(paramParcel, i);
  }
  
  public bz[] X(int paramInt)
  {
    return new bz[paramInt];
  }
  
  public bz x(Parcel paramParcel)
  {
    String str1 = null;
    int i = a.c(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    Object localObject1 = null;
    String str2 = null;
    Object localObject2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = a.b(paramParcel);
      switch (a.m(k))
      {
      case 3: 
      default: 
        a.b(paramParcel, k);
        break;
      case 1: 
        j = a.f(paramParcel, k);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2: 
        str3 = a.l(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 4: 
        bx localbx2 = (bx)a.a(paramParcel, k, bx.CREATOR);
        localHashSet.add(Integer.valueOf(4));
        localObject2 = localbx2;
        break;
      case 5: 
        str2 = a.l(paramParcel, k);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6: 
        bx localbx1 = (bx)a.a(paramParcel, k, bx.CREATOR);
        localHashSet.add(Integer.valueOf(6));
        localObject1 = localbx1;
        break;
      case 7: 
        str1 = a.l(paramParcel, k);
        localHashSet.add(Integer.valueOf(7));
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new bz(localHashSet, j, str3, (bx)localObject2, str2, (bx)localObject1, str1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ca.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */