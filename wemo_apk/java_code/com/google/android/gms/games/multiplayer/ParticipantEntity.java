package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.ao;
import com.google.android.gms.internal.av;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public final class ParticipantEntity
  extends av
  implements Participant
{
  public static final Parcelable.Creator<ParticipantEntity> CREATOR = new a();
  private final int ab;
  private final String cl;
  private final String dX;
  private final Uri dk;
  private final Uri dl;
  private final int eN;
  private final String eO;
  private final boolean eP;
  private final PlayerEntity eQ;
  private final int eR;
  
  ParticipantEntity(int paramInt1, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, int paramInt2, String paramString3, boolean paramBoolean, PlayerEntity paramPlayerEntity, int paramInt3)
  {
    this.ab = paramInt1;
    this.dX = paramString1;
    this.cl = paramString2;
    this.dk = paramUri1;
    this.dl = paramUri2;
    this.eN = paramInt2;
    this.eO = paramString3;
    this.eP = paramBoolean;
    this.eQ = paramPlayerEntity;
    this.eR = paramInt3;
  }
  
  public ParticipantEntity(Participant paramParticipant)
  {
    this.ab = 1;
    this.dX = paramParticipant.getParticipantId();
    this.cl = paramParticipant.getDisplayName();
    this.dk = paramParticipant.getIconImageUri();
    this.dl = paramParticipant.getHiResImageUri();
    this.eN = paramParticipant.getStatus();
    this.eO = paramParticipant.aM();
    this.eP = paramParticipant.isConnectedToRoom();
    Player localPlayer = paramParticipant.getPlayer();
    if (localPlayer == null) {}
    for (PlayerEntity localPlayerEntity = null;; localPlayerEntity = new PlayerEntity(localPlayer))
    {
      this.eQ = localPlayerEntity;
      this.eR = paramParticipant.aN();
      return;
    }
  }
  
  static int a(Participant paramParticipant)
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = paramParticipant.getPlayer();
    arrayOfObject[1] = Integer.valueOf(paramParticipant.getStatus());
    arrayOfObject[2] = paramParticipant.aM();
    arrayOfObject[3] = Boolean.valueOf(paramParticipant.isConnectedToRoom());
    arrayOfObject[4] = paramParticipant.getDisplayName();
    arrayOfObject[5] = paramParticipant.getIconImageUri();
    arrayOfObject[6] = paramParticipant.getHiResImageUri();
    arrayOfObject[7] = Integer.valueOf(paramParticipant.aN());
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(Participant paramParticipant, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Participant)) {
      bool = false;
    }
    Participant localParticipant;
    do
    {
      do
      {
        return bool;
      } while (paramParticipant == paramObject);
      localParticipant = (Participant)paramObject;
    } while ((r.a(localParticipant.getPlayer(), paramParticipant.getPlayer())) && (r.a(Integer.valueOf(localParticipant.getStatus()), Integer.valueOf(paramParticipant.getStatus()))) && (r.a(localParticipant.aM(), paramParticipant.aM())) && (r.a(Boolean.valueOf(localParticipant.isConnectedToRoom()), Boolean.valueOf(paramParticipant.isConnectedToRoom()))) && (r.a(localParticipant.getDisplayName(), paramParticipant.getDisplayName())) && (r.a(localParticipant.getIconImageUri(), paramParticipant.getIconImageUri())) && (r.a(localParticipant.getHiResImageUri(), paramParticipant.getHiResImageUri())) && (r.a(Integer.valueOf(localParticipant.aN()), Integer.valueOf(paramParticipant.aN()))));
    return false;
  }
  
  static String b(Participant paramParticipant)
  {
    return r.c(paramParticipant).a("Player", paramParticipant.getPlayer()).a("Status", Integer.valueOf(paramParticipant.getStatus())).a("ClientAddress", paramParticipant.aM()).a("ConnectedToRoom", Boolean.valueOf(paramParticipant.isConnectedToRoom())).a("DisplayName", paramParticipant.getDisplayName()).a("IconImage", paramParticipant.getIconImageUri()).a("HiResImage", paramParticipant.getHiResImageUri()).a("Capabilities", Integer.valueOf(paramParticipant.aN())).toString();
  }
  
  public String aM()
  {
    return this.eO;
  }
  
  public int aN()
  {
    return this.eR;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public Participant freeze()
  {
    return this;
  }
  
  public String getDisplayName()
  {
    if (this.eQ == null) {
      return this.cl;
    }
    return this.eQ.getDisplayName();
  }
  
  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.eQ == null)
    {
      ao.b(this.cl, paramCharArrayBuffer);
      return;
    }
    this.eQ.getDisplayName(paramCharArrayBuffer);
  }
  
  public Uri getHiResImageUri()
  {
    if (this.eQ == null) {
      return this.dl;
    }
    return this.eQ.getHiResImageUri();
  }
  
  public Uri getIconImageUri()
  {
    if (this.eQ == null) {
      return this.dk;
    }
    return this.eQ.getIconImageUri();
  }
  
  public String getParticipantId()
  {
    return this.dX;
  }
  
  public Player getPlayer()
  {
    return this.eQ;
  }
  
  public int getStatus()
  {
    return this.eN;
  }
  
  public int hashCode()
  {
    return a(this);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public boolean isConnectedToRoom()
  {
    return this.eP;
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
    if (!w())
    {
      c.a(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.dX);
    paramParcel.writeString(this.cl);
    String str1;
    label39:
    String str2;
    label58:
    int i;
    label90:
    int j;
    if (this.dk == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.dl;
      str2 = null;
      if (localUri != null) {
        break label144;
      }
      paramParcel.writeString(str2);
      paramParcel.writeInt(this.eN);
      paramParcel.writeString(this.eO);
      if (!this.eP) {
        break label156;
      }
      i = 1;
      paramParcel.writeInt(i);
      PlayerEntity localPlayerEntity = this.eQ;
      j = 0;
      if (localPlayerEntity != null) {
        break label162;
      }
    }
    for (;;)
    {
      paramParcel.writeInt(j);
      if (this.eQ == null) {
        break;
      }
      this.eQ.writeToParcel(paramParcel, paramInt);
      return;
      str1 = this.dk.toString();
      break label39;
      label144:
      str2 = this.dl.toString();
      break label58;
      label156:
      i = 0;
      break label90;
      label162:
      j = 1;
    }
  }
  
  static final class a
    extends c
  {
    public ParticipantEntity q(Parcel paramParcel)
    {
      if ((ParticipantEntity.b(ParticipantEntity.au())) || (ParticipantEntity.s(ParticipantEntity.class.getCanonicalName()))) {
        return super.q(paramParcel);
      }
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      Uri localUri1;
      String str4;
      Uri localUri2;
      label64:
      int i;
      String str5;
      boolean bool;
      if (str3 == null)
      {
        localUri1 = null;
        str4 = paramParcel.readString();
        if (str4 != null) {
          break label157;
        }
        localUri2 = null;
        i = paramParcel.readInt();
        str5 = paramParcel.readString();
        if (paramParcel.readInt() <= 0) {
          break label167;
        }
        bool = true;
        label86:
        int j = paramParcel.readInt();
        int k = 0;
        if (j > 0) {
          k = 1;
        }
        if (k == 0) {
          break label173;
        }
      }
      label157:
      label167:
      label173:
      for (PlayerEntity localPlayerEntity = (PlayerEntity)PlayerEntity.CREATOR.createFromParcel(paramParcel);; localPlayerEntity = null)
      {
        return new ParticipantEntity(1, str1, str2, localUri1, localUri2, i, str5, bool, localPlayerEntity, 7);
        localUri1 = Uri.parse(str3);
        break;
        localUri2 = Uri.parse(str4);
        break label64;
        bool = false;
        break label86;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/ParticipantEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */