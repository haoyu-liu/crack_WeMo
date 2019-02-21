package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class c
  implements Parcelable.Creator<PlayerEntity>
{
  static void a(PlayerEntity paramPlayerEntity, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, paramPlayerEntity.getPlayerId(), false);
    b.c(paramParcel, 1000, paramPlayerEntity.i());
    b.a(paramParcel, 2, paramPlayerEntity.getDisplayName(), false);
    b.a(paramParcel, 3, paramPlayerEntity.getIconImageUri(), paramInt, false);
    b.a(paramParcel, 4, paramPlayerEntity.getHiResImageUri(), paramInt, false);
    b.a(paramParcel, 5, paramPlayerEntity.getRetrievedTimestamp());
    b.C(paramParcel, i);
  }
  
  public PlayerEntity[] A(int paramInt)
  {
    return new PlayerEntity[paramInt];
  }
  
  public PlayerEntity o(Parcel paramParcel)
  {
    Uri localUri1 = null;
    int i = a.c(paramParcel);
    int j = 0;
    long l = 0L;
    Uri localUri2 = null;
    String str1 = null;
    String str2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = a.b(paramParcel);
      switch (a.m(k))
      {
      default: 
        a.b(paramParcel, k);
        break;
      case 1: 
        str2 = a.l(paramParcel, k);
        break;
      case 1000: 
        j = a.f(paramParcel, k);
        break;
      case 2: 
        str1 = a.l(paramParcel, k);
        break;
      case 3: 
        localUri2 = (Uri)a.a(paramParcel, k, Uri.CREATOR);
        break;
      case 4: 
        localUri1 = (Uri)a.a(paramParcel, k, Uri.CREATOR);
        break;
      case 5: 
        l = a.g(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new PlayerEntity(j, str2, str1, localUri2, localUri1, l);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */