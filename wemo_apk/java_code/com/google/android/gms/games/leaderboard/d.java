package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.b;
import com.google.android.gms.games.Player;

public final class d
  extends b
  implements LeaderboardScore
{
  private final com.google.android.gms.games.d eA;
  
  d(com.google.android.gms.common.data.d paramd, int paramInt)
  {
    super(paramd, paramInt);
    this.eA = new com.google.android.gms.games.d(paramd, paramInt);
  }
  
  public LeaderboardScore aH()
  {
    return new c(this);
  }
  
  public boolean equals(Object paramObject)
  {
    return c.a(this, paramObject);
  }
  
  public String getDisplayRank()
  {
    return getString("display_rank");
  }
  
  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    a("display_rank", paramCharArrayBuffer);
  }
  
  public String getDisplayScore()
  {
    return getString("display_score");
  }
  
  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    a("display_score", paramCharArrayBuffer);
  }
  
  public long getRank()
  {
    return getLong("rank");
  }
  
  public long getRawScore()
  {
    return getLong("raw_score");
  }
  
  public Player getScoreHolder()
  {
    if (e("external_player_id")) {
      return null;
    }
    return this.eA;
  }
  
  public String getScoreHolderDisplayName()
  {
    if (e("external_player_id")) {
      return getString("default_display_name");
    }
    return this.eA.getDisplayName();
  }
  
  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (e("external_player_id"))
    {
      a("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.eA.getDisplayName(paramCharArrayBuffer);
  }
  
  public Uri getScoreHolderHiResImageUri()
  {
    if (e("external_player_id")) {
      return null;
    }
    return this.eA.getHiResImageUri();
  }
  
  public Uri getScoreHolderIconImageUri()
  {
    if (e("external_player_id")) {
      return d("default_display_image_uri");
    }
    return this.eA.getIconImageUri();
  }
  
  public long getTimestampMillis()
  {
    return getLong("achieved_timestamp");
  }
  
  public int hashCode()
  {
    return c.a(this);
  }
  
  public String toString()
  {
    return c.b(this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/d.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */