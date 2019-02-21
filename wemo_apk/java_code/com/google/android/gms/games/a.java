package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class a
  implements Parcelable.Creator<GameEntity>
{
  static void a(GameEntity paramGameEntity, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, paramGameEntity.getApplicationId(), false);
    b.a(paramParcel, 2, paramGameEntity.getDisplayName(), false);
    b.a(paramParcel, 3, paramGameEntity.getPrimaryCategory(), false);
    b.a(paramParcel, 4, paramGameEntity.getSecondaryCategory(), false);
    b.a(paramParcel, 5, paramGameEntity.getDescription(), false);
    b.a(paramParcel, 6, paramGameEntity.getDeveloperName(), false);
    b.a(paramParcel, 7, paramGameEntity.getIconImageUri(), paramInt, false);
    b.a(paramParcel, 8, paramGameEntity.getHiResImageUri(), paramInt, false);
    b.a(paramParcel, 9, paramGameEntity.getFeaturedImageUri(), paramInt, false);
    b.a(paramParcel, 10, paramGameEntity.isPlayEnabledGame());
    b.a(paramParcel, 11, paramGameEntity.isInstanceInstalled());
    b.a(paramParcel, 12, paramGameEntity.getInstancePackageName(), false);
    b.c(paramParcel, 13, paramGameEntity.getGameplayAclStatus());
    b.c(paramParcel, 14, paramGameEntity.getAchievementTotalCount());
    b.c(paramParcel, 15, paramGameEntity.getLeaderboardCount());
    b.c(paramParcel, 1000, paramGameEntity.i());
    b.C(paramParcel, i);
  }
  
  public GameEntity n(Parcel paramParcel)
  {
    int i = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    Uri localUri1 = null;
    Uri localUri2 = null;
    Uri localUri3 = null;
    boolean bool1 = false;
    boolean bool2 = false;
    String str7 = null;
    int k = 0;
    int m = 0;
    int n = 0;
    while (paramParcel.dataPosition() < i)
    {
      int i1 = com.google.android.gms.common.internal.safeparcel.a.b(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.a.m(i1))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.a.b(paramParcel, i1);
        break;
      case 1: 
        str1 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 2: 
        str2 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 3: 
        str3 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 4: 
        str4 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 5: 
        str5 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 6: 
        str6 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 7: 
        localUri1 = (Uri)com.google.android.gms.common.internal.safeparcel.a.a(paramParcel, i1, Uri.CREATOR);
        break;
      case 8: 
        localUri2 = (Uri)com.google.android.gms.common.internal.safeparcel.a.a(paramParcel, i1, Uri.CREATOR);
        break;
      case 9: 
        localUri3 = (Uri)com.google.android.gms.common.internal.safeparcel.a.a(paramParcel, i1, Uri.CREATOR);
        break;
      case 10: 
        bool1 = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel, i1);
        break;
      case 11: 
        bool2 = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel, i1);
        break;
      case 12: 
        str7 = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, i1);
        break;
      case 13: 
        k = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, i1);
        break;
      case 14: 
        m = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, i1);
        break;
      case 15: 
        n = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, i1);
        break;
      case 1000: 
        j = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new GameEntity(j, str1, str2, str3, str4, str5, str6, localUri1, localUri2, localUri3, bool1, bool2, str7, k, m, n);
  }
  
  public GameEntity[] z(int paramInt)
  {
    return new GameEntity[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */