package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataBuffer;

public final class LeaderboardScoreBuffer
  extends DataBuffer<LeaderboardScore>
{
  private final b ep;
  
  public LeaderboardScoreBuffer(com.google.android.gms.common.data.d paramd)
  {
    super(paramd);
    this.ep = new b(paramd.l());
  }
  
  public b aF()
  {
    return this.ep;
  }
  
  public LeaderboardScore get(int paramInt)
  {
    return new d(this.S, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/LeaderboardScoreBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */