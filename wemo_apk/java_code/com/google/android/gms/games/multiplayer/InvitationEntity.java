package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.av;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.internal.s;
import java.util.ArrayList;

public final class InvitationEntity
  extends av
  implements Invitation
{
  public static final Parcelable.Creator<InvitationEntity> CREATOR = new a();
  private final int ab;
  private final GameEntity eE;
  private final String eF;
  private final long eG;
  private final int eH;
  private final ParticipantEntity eI;
  private final ArrayList<ParticipantEntity> eJ;
  private final int eK;
  
  InvitationEntity(int paramInt1, GameEntity paramGameEntity, String paramString, long paramLong, int paramInt2, ParticipantEntity paramParticipantEntity, ArrayList<ParticipantEntity> paramArrayList, int paramInt3)
  {
    this.ab = paramInt1;
    this.eE = paramGameEntity;
    this.eF = paramString;
    this.eG = paramLong;
    this.eH = paramInt2;
    this.eI = paramParticipantEntity;
    this.eJ = paramArrayList;
    this.eK = paramInt3;
  }
  
  InvitationEntity(Invitation paramInvitation)
  {
    this.ab = 1;
    this.eE = new GameEntity(paramInvitation.getGame());
    this.eF = paramInvitation.getInvitationId();
    this.eG = paramInvitation.getCreationTimestamp();
    this.eH = paramInvitation.aL();
    this.eK = paramInvitation.getVariant();
    String str = paramInvitation.getInviter().getParticipantId();
    Object localObject = null;
    ArrayList localArrayList = paramInvitation.getParticipants();
    int i = localArrayList.size();
    this.eJ = new ArrayList(i);
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(str)) {
        localObject = localParticipant;
      }
      this.eJ.add((ParticipantEntity)localParticipant.freeze());
    }
    s.b(localObject, "Must have a valid inviter!");
    this.eI = ((ParticipantEntity)((Participant)localObject).freeze());
  }
  
  static int a(Invitation paramInvitation)
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = paramInvitation.getGame();
    arrayOfObject[1] = paramInvitation.getInvitationId();
    arrayOfObject[2] = Long.valueOf(paramInvitation.getCreationTimestamp());
    arrayOfObject[3] = Integer.valueOf(paramInvitation.aL());
    arrayOfObject[4] = paramInvitation.getInviter();
    arrayOfObject[5] = paramInvitation.getParticipants();
    arrayOfObject[6] = Integer.valueOf(paramInvitation.getVariant());
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(Invitation paramInvitation, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Invitation)) {
      bool = false;
    }
    Invitation localInvitation;
    do
    {
      do
      {
        return bool;
      } while (paramInvitation == paramObject);
      localInvitation = (Invitation)paramObject;
    } while ((r.a(localInvitation.getGame(), paramInvitation.getGame())) && (r.a(localInvitation.getInvitationId(), paramInvitation.getInvitationId())) && (r.a(Long.valueOf(localInvitation.getCreationTimestamp()), Long.valueOf(paramInvitation.getCreationTimestamp()))) && (r.a(Integer.valueOf(localInvitation.aL()), Integer.valueOf(paramInvitation.aL()))) && (r.a(localInvitation.getInviter(), paramInvitation.getInviter())) && (r.a(localInvitation.getParticipants(), paramInvitation.getParticipants())) && (r.a(Integer.valueOf(localInvitation.getVariant()), Integer.valueOf(paramInvitation.getVariant()))));
    return false;
  }
  
  static String b(Invitation paramInvitation)
  {
    return r.c(paramInvitation).a("Game", paramInvitation.getGame()).a("InvitationId", paramInvitation.getInvitationId()).a("CreationTimestamp", Long.valueOf(paramInvitation.getCreationTimestamp())).a("InvitationType", Integer.valueOf(paramInvitation.aL())).a("Inviter", paramInvitation.getInviter()).a("Participants", paramInvitation.getParticipants()).a("Variant", Integer.valueOf(paramInvitation.getVariant())).toString();
  }
  
  public int aL()
  {
    return this.eH;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public Invitation freeze()
  {
    return this;
  }
  
  public long getCreationTimestamp()
  {
    return this.eG;
  }
  
  public Game getGame()
  {
    return this.eE;
  }
  
  public String getInvitationId()
  {
    return this.eF;
  }
  
  public Participant getInviter()
  {
    return this.eI;
  }
  
  public ArrayList<Participant> getParticipants()
  {
    return new ArrayList(this.eJ);
  }
  
  public int getVariant()
  {
    return this.eK;
  }
  
  public int hashCode()
  {
    return a(this);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  public String toString()
  {
    return b(this);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!w()) {
      a.a(this, paramParcel, paramInt);
    }
    for (;;)
    {
      return;
      this.eE.writeToParcel(paramParcel, paramInt);
      paramParcel.writeString(this.eF);
      paramParcel.writeLong(this.eG);
      paramParcel.writeInt(this.eH);
      this.eI.writeToParcel(paramParcel, paramInt);
      int i = this.eJ.size();
      paramParcel.writeInt(i);
      for (int j = 0; j < i; j++) {
        ((ParticipantEntity)this.eJ.get(j)).writeToParcel(paramParcel, paramInt);
      }
    }
  }
  
  static final class a
    extends a
  {
    public InvitationEntity p(Parcel paramParcel)
    {
      if ((InvitationEntity.b(InvitationEntity.au())) || (InvitationEntity.s(InvitationEntity.class.getCanonicalName()))) {
        return super.p(paramParcel);
      }
      GameEntity localGameEntity = (GameEntity)GameEntity.CREATOR.createFromParcel(paramParcel);
      String str = paramParcel.readString();
      long l = paramParcel.readLong();
      int i = paramParcel.readInt();
      ParticipantEntity localParticipantEntity = (ParticipantEntity)ParticipantEntity.CREATOR.createFromParcel(paramParcel);
      int j = paramParcel.readInt();
      ArrayList localArrayList = new ArrayList(j);
      for (int k = 0; k < j; k++) {
        localArrayList.add(ParticipantEntity.CREATOR.createFromParcel(paramParcel));
      }
      return new InvitationEntity(1, localGameEntity, str, l, i, localParticipantEntity, localArrayList, -1);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/InvitationEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */