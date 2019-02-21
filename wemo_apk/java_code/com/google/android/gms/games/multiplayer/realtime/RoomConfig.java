package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.internal.s;
import java.util.ArrayList;
import java.util.Arrays;

public final class RoomConfig
{
  private final String eF;
  private final int eK;
  private final RoomUpdateListener eW;
  private final RoomStatusUpdateListener eX;
  private final RealTimeMessageReceivedListener eY;
  private final String[] eZ;
  private final Bundle fa;
  private final boolean fb;
  
  private RoomConfig(Builder paramBuilder)
  {
    this.eW = paramBuilder.eW;
    this.eX = paramBuilder.eX;
    this.eY = paramBuilder.eY;
    this.eF = paramBuilder.fc;
    this.eK = paramBuilder.eK;
    this.fa = paramBuilder.fa;
    this.fb = paramBuilder.fb;
    int i = paramBuilder.fd.size();
    this.eZ = ((String[])paramBuilder.fd.toArray(new String[i]));
    if (this.eY == null) {
      s.a(this.fb, "Must either enable sockets OR specify a message listener");
    }
  }
  
  public static Builder builder(RoomUpdateListener paramRoomUpdateListener)
  {
    return new Builder(paramRoomUpdateListener, null);
  }
  
  public static Bundle createAutoMatchCriteria(int paramInt1, int paramInt2, long paramLong)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("min_automatch_players", paramInt1);
    localBundle.putInt("max_automatch_players", paramInt2);
    localBundle.putLong("exclusive_bit_mask", paramLong);
    return localBundle;
  }
  
  public Bundle getAutoMatchCriteria()
  {
    return this.fa;
  }
  
  public String getInvitationId()
  {
    return this.eF;
  }
  
  public String[] getInvitedPlayerIds()
  {
    return this.eZ;
  }
  
  public RealTimeMessageReceivedListener getMessageReceivedListener()
  {
    return this.eY;
  }
  
  public RoomStatusUpdateListener getRoomStatusUpdateListener()
  {
    return this.eX;
  }
  
  public RoomUpdateListener getRoomUpdateListener()
  {
    return this.eW;
  }
  
  public int getVariant()
  {
    return this.eK;
  }
  
  public boolean isSocketEnabled()
  {
    return this.fb;
  }
  
  public static final class Builder
  {
    int eK = -1;
    final RoomUpdateListener eW;
    RoomStatusUpdateListener eX;
    RealTimeMessageReceivedListener eY;
    Bundle fa;
    boolean fb = false;
    String fc = null;
    ArrayList<String> fd = new ArrayList();
    
    private Builder(RoomUpdateListener paramRoomUpdateListener)
    {
      this.eW = ((RoomUpdateListener)s.b(paramRoomUpdateListener, "Must provide a RoomUpdateListener"));
    }
    
    public Builder addPlayersToInvite(ArrayList<String> paramArrayList)
    {
      s.d(paramArrayList);
      this.fd.addAll(paramArrayList);
      return this;
    }
    
    public Builder addPlayersToInvite(String... paramVarArgs)
    {
      s.d(paramVarArgs);
      this.fd.addAll(Arrays.asList(paramVarArgs));
      return this;
    }
    
    public RoomConfig build()
    {
      return new RoomConfig(this, null);
    }
    
    public Builder setAutoMatchCriteria(Bundle paramBundle)
    {
      this.fa = paramBundle;
      return this;
    }
    
    public Builder setInvitationIdToAccept(String paramString)
    {
      s.d(paramString);
      this.fc = paramString;
      return this;
    }
    
    public Builder setMessageReceivedListener(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      this.eY = paramRealTimeMessageReceivedListener;
      return this;
    }
    
    public Builder setRoomStatusUpdateListener(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      this.eX = paramRoomStatusUpdateListener;
      return this;
    }
    
    public Builder setSocketCommunicationEnabled(boolean paramBoolean)
    {
      this.fb = paramBoolean;
      return this;
    }
    
    public Builder setVariant(int paramInt)
    {
      this.eK = paramInt;
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/realtime/RoomConfig.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */