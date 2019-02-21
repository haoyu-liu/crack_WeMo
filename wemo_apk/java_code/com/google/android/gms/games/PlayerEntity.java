package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ao;
import com.google.android.gms.internal.av;
import com.google.android.gms.internal.h;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public final class PlayerEntity
  extends av
  implements Player
{
  public static final Parcelable.Creator<PlayerEntity> CREATOR = new a();
  private final int ab;
  private final String cl;
  private final Uri dk;
  private final Uri dl;
  private final String dx;
  private final long dy;
  
  PlayerEntity(int paramInt, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, long paramLong)
  {
    this.ab = paramInt;
    this.dx = paramString1;
    this.cl = paramString2;
    this.dk = paramUri1;
    this.dl = paramUri2;
    this.dy = paramLong;
  }
  
  public PlayerEntity(Player paramPlayer)
  {
    this.ab = i;
    this.dx = paramPlayer.getPlayerId();
    this.cl = paramPlayer.getDisplayName();
    this.dk = paramPlayer.getIconImageUri();
    this.dl = paramPlayer.getHiResImageUri();
    this.dy = paramPlayer.getRetrievedTimestamp();
    h.b(this.dx);
    h.b(this.cl);
    if (this.dy > 0L) {}
    for (;;)
    {
      h.a(i);
      return;
      i = 0;
    }
  }
  
  static int a(Player paramPlayer)
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = paramPlayer.getPlayerId();
    arrayOfObject[1] = paramPlayer.getDisplayName();
    arrayOfObject[2] = paramPlayer.getIconImageUri();
    arrayOfObject[3] = paramPlayer.getHiResImageUri();
    arrayOfObject[4] = Long.valueOf(paramPlayer.getRetrievedTimestamp());
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(Player paramPlayer, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Player)) {
      bool = false;
    }
    Player localPlayer;
    do
    {
      do
      {
        return bool;
      } while (paramPlayer == paramObject);
      localPlayer = (Player)paramObject;
    } while ((r.a(localPlayer.getPlayerId(), paramPlayer.getPlayerId())) && (r.a(localPlayer.getDisplayName(), paramPlayer.getDisplayName())) && (r.a(localPlayer.getIconImageUri(), paramPlayer.getIconImageUri())) && (r.a(localPlayer.getHiResImageUri(), paramPlayer.getHiResImageUri())) && (r.a(Long.valueOf(localPlayer.getRetrievedTimestamp()), Long.valueOf(paramPlayer.getRetrievedTimestamp()))));
    return false;
  }
  
  static String b(Player paramPlayer)
  {
    return r.c(paramPlayer).a("PlayerId", paramPlayer.getPlayerId()).a("DisplayName", paramPlayer.getDisplayName()).a("IconImageUri", paramPlayer.getIconImageUri()).a("HiResImageUri", paramPlayer.getHiResImageUri()).a("RetrievedTimestamp", Long.valueOf(paramPlayer.getRetrievedTimestamp())).toString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public Player freeze()
  {
    return this;
  }
  
  public String getDisplayName()
  {
    return this.cl;
  }
  
  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.cl, paramCharArrayBuffer);
  }
  
  public Uri getHiResImageUri()
  {
    return this.dl;
  }
  
  public Uri getIconImageUri()
  {
    return this.dk;
  }
  
  public String getPlayerId()
  {
    return this.dx;
  }
  
  public long getRetrievedTimestamp()
  {
    return this.dy;
  }
  
  public boolean hasHiResImage()
  {
    return getHiResImageUri() != null;
  }
  
  public boolean hasIconImage()
  {
    return getIconImageUri() != null;
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
    if (!w())
    {
      c.a(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.dx);
    paramParcel.writeString(this.cl);
    String str1;
    String str2;
    if (this.dk == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.dl;
      str2 = null;
      if (localUri != null) {
        break label84;
      }
    }
    for (;;)
    {
      paramParcel.writeString(str2);
      paramParcel.writeLong(this.dy);
      return;
      str1 = this.dk.toString();
      break;
      label84:
      str2 = this.dl.toString();
    }
  }
  
  static final class a
    extends c
  {
    public PlayerEntity o(Parcel paramParcel)
    {
      if ((PlayerEntity.b(PlayerEntity.au())) || (PlayerEntity.s(PlayerEntity.class.getCanonicalName()))) {
        return super.o(paramParcel);
      }
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      String str4 = paramParcel.readString();
      Uri localUri1;
      Uri localUri2;
      if (str3 == null)
      {
        localUri1 = null;
        localUri2 = null;
        if (str4 != null) {
          break label93;
        }
      }
      for (;;)
      {
        return new PlayerEntity(1, str1, str2, localUri1, localUri2, paramParcel.readLong());
        localUri1 = Uri.parse(str3);
        break;
        label93:
        localUri2 = Uri.parse(str4);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/PlayerEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */