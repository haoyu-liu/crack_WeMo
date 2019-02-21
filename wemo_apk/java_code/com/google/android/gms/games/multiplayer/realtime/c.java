package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.data.b;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import java.util.ArrayList;

public final class c
  extends b
  implements Room
{
  private final int eo;
  
  c(com.google.android.gms.common.data.d paramd, int paramInt1, int paramInt2)
  {
    super(paramd, paramInt1);
    this.eo = paramInt2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return RoomEntity.a(this, paramObject);
  }
  
  public Room freeze()
  {
    return new RoomEntity(this);
  }
  
  public Bundle getAutoMatchCriteria()
  {
    if (!getBoolean("has_automatch_criteria")) {
      return null;
    }
    return RoomConfig.createAutoMatchCriteria(getInteger("automatch_min_players"), getInteger("automatch_max_players"), getLong("automatch_bit_mask"));
  }
  
  public int getAutoMatchWaitEstimateSeconds()
  {
    return getInteger("automatch_wait_estimate_sec");
  }
  
  public long getCreationTimestamp()
  {
    return getLong("creation_timestamp");
  }
  
  public String getCreatorId()
  {
    return getString("creator_external");
  }
  
  public String getDescription()
  {
    return getString("description");
  }
  
  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    a("description", paramCharArrayBuffer);
  }
  
  public String getParticipantId(String paramString)
  {
    ArrayList localArrayList = getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString))) {
        return localParticipant.getParticipantId();
      }
    }
    return null;
  }
  
  public ArrayList<String> getParticipantIds()
  {
    ArrayList localArrayList1 = getParticipants();
    ArrayList localArrayList2 = new ArrayList(this.eo);
    for (int i = 0; i < this.eo; i++) {
      localArrayList2.add(((Participant)localArrayList1.get(i)).getParticipantId());
    }
    return localArrayList2;
  }
  
  public int getParticipantStatus(String paramString)
  {
    ArrayList localArrayList = getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString)) {
        return localParticipant.getStatus();
      }
    }
    throw new IllegalStateException("Participant " + paramString + " is not in room " + getRoomId());
  }
  
  public ArrayList<Participant> getParticipants()
  {
    ArrayList localArrayList = new ArrayList(this.eo);
    for (int i = 0; i < this.eo; i++) {
      localArrayList.add(new com.google.android.gms.games.multiplayer.d(this.S, i + this.V));
    }
    return localArrayList;
  }
  
  public String getRoomId()
  {
    return getString("external_match_id");
  }
  
  public int getStatus()
  {
    return getInteger("status");
  }
  
  public int getVariant()
  {
    return getInteger("variant");
  }
  
  public int hashCode()
  {
    return RoomEntity.a(this);
  }
  
  public String toString()
  {
    return RoomEntity.b(this);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((RoomEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/realtime/c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */