package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.b;
import com.google.android.gms.games.Player;

public final class d
  extends b
  implements Participant
{
  private final com.google.android.gms.games.d eS;
  
  public d(com.google.android.gms.common.data.d paramd, int paramInt)
  {
    super(paramd, paramInt);
    this.eS = new com.google.android.gms.games.d(paramd, paramInt);
  }
  
  public String aM()
  {
    return getString("client_address");
  }
  
  public int aN()
  {
    return getInteger("capabilities");
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return ParticipantEntity.a(this, paramObject);
  }
  
  public Participant freeze()
  {
    return new ParticipantEntity(this);
  }
  
  public String getDisplayName()
  {
    if (e("external_player_id")) {
      return getString("default_display_name");
    }
    return this.eS.getDisplayName();
  }
  
  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (e("external_player_id"))
    {
      a("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.eS.getDisplayName(paramCharArrayBuffer);
  }
  
  public Uri getHiResImageUri()
  {
    if (e("external_player_id")) {
      return null;
    }
    return this.eS.getHiResImageUri();
  }
  
  public Uri getIconImageUri()
  {
    if (e("external_player_id")) {
      return d("default_display_image_uri");
    }
    return this.eS.getIconImageUri();
  }
  
  public String getParticipantId()
  {
    return getString("external_participant_id");
  }
  
  public Player getPlayer()
  {
    if (e("external_player_id")) {
      return null;
    }
    return this.eS;
  }
  
  public int getStatus()
  {
    return getInteger("player_status");
  }
  
  public int hashCode()
  {
    return ParticipantEntity.a(this);
  }
  
  public boolean isConnectedToRoom()
  {
    return getInteger("connected") > 0;
  }
  
  public String toString()
  {
    return ParticipantEntity.b(this);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((ParticipantEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/d.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */