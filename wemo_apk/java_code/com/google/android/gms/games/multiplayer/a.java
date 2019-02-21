package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import com.google.android.gms.games.GameEntity;
import java.util.ArrayList;

public class a
  implements Parcelable.Creator<InvitationEntity>
{
  static void a(InvitationEntity paramInvitationEntity, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.a(paramParcel, 1, paramInvitationEntity.getGame(), paramInt, false);
    b.c(paramParcel, 1000, paramInvitationEntity.i());
    b.a(paramParcel, 2, paramInvitationEntity.getInvitationId(), false);
    b.a(paramParcel, 3, paramInvitationEntity.getCreationTimestamp());
    b.c(paramParcel, 4, paramInvitationEntity.aL());
    b.a(paramParcel, 5, paramInvitationEntity.getInviter(), paramInt, false);
    b.b(paramParcel, 6, paramInvitationEntity.getParticipants(), false);
    b.c(paramParcel, 7, paramInvitationEntity.getVariant());
    b.C(paramParcel, i);
  }
  
  public InvitationEntity[] H(int paramInt)
  {
    return new InvitationEntity[paramInt];
  }
  
  public InvitationEntity p(Parcel paramParcel)
  {
    int i = 0;
    ArrayList localArrayList = null;
    int j = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel);
    long l = 0L;
    ParticipantEntity localParticipantEntity = null;
    int k = 0;
    String str = null;
    GameEntity localGameEntity = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = com.google.android.gms.common.internal.safeparcel.a.b(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.a.m(n))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.a.b(paramParcel, n);
        break;
      case 1: 
        localGameEntity = (GameEntity)com.google.android.gms.common.internal.safeparcel.a.a(paramParcel, n, GameEntity.CREATOR);
        break;
      case 1000: 
        m = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, n);
        break;
      case 2: 
        str = com.google.android.gms.common.internal.safeparcel.a.l(paramParcel, n);
        break;
      case 3: 
        l = com.google.android.gms.common.internal.safeparcel.a.g(paramParcel, n);
        break;
      case 4: 
        k = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, n);
        break;
      case 5: 
        localParticipantEntity = (ParticipantEntity)com.google.android.gms.common.internal.safeparcel.a.a(paramParcel, n, ParticipantEntity.CREATOR);
        break;
      case 6: 
        localArrayList = com.google.android.gms.common.internal.safeparcel.a.c(paramParcel, n, ParticipantEntity.CREATOR);
        break;
      case 7: 
        i = com.google.android.gms.common.internal.safeparcel.a.f(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new a.a("Overread allowed size end=" + j, paramParcel);
    }
    return new InvitationEntity(m, localGameEntity, str, l, k, localParticipantEntity, localArrayList, i);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */