package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.ao;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.internal.s;

public final class c
  implements LeaderboardScore
{
  private final long er;
  private final String es;
  private final String et;
  private final long eu;
  private final long ev;
  private final String ew;
  private final Uri ex;
  private final Uri ey;
  private final PlayerEntity ez;
  
  public c(LeaderboardScore paramLeaderboardScore)
  {
    this.er = paramLeaderboardScore.getRank();
    this.es = ((String)s.d(paramLeaderboardScore.getDisplayRank()));
    this.et = ((String)s.d(paramLeaderboardScore.getDisplayScore()));
    this.eu = paramLeaderboardScore.getRawScore();
    this.ev = paramLeaderboardScore.getTimestampMillis();
    this.ew = paramLeaderboardScore.getScoreHolderDisplayName();
    this.ex = paramLeaderboardScore.getScoreHolderIconImageUri();
    this.ey = paramLeaderboardScore.getScoreHolderHiResImageUri();
    Player localPlayer = paramLeaderboardScore.getScoreHolder();
    if (localPlayer == null) {}
    for (PlayerEntity localPlayerEntity = null;; localPlayerEntity = (PlayerEntity)localPlayer.freeze())
    {
      this.ez = localPlayerEntity;
      return;
    }
  }
  
  static int a(LeaderboardScore paramLeaderboardScore)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = Long.valueOf(paramLeaderboardScore.getRank());
    arrayOfObject[1] = paramLeaderboardScore.getDisplayRank();
    arrayOfObject[2] = Long.valueOf(paramLeaderboardScore.getRawScore());
    arrayOfObject[3] = paramLeaderboardScore.getDisplayScore();
    arrayOfObject[4] = Long.valueOf(paramLeaderboardScore.getTimestampMillis());
    arrayOfObject[5] = paramLeaderboardScore.getScoreHolderDisplayName();
    arrayOfObject[6] = paramLeaderboardScore.getScoreHolderIconImageUri();
    arrayOfObject[7] = paramLeaderboardScore.getScoreHolderHiResImageUri();
    arrayOfObject[8] = paramLeaderboardScore.getScoreHolder();
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(LeaderboardScore paramLeaderboardScore, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof LeaderboardScore)) {
      bool = false;
    }
    LeaderboardScore localLeaderboardScore;
    do
    {
      do
      {
        return bool;
      } while (paramLeaderboardScore == paramObject);
      localLeaderboardScore = (LeaderboardScore)paramObject;
    } while ((r.a(Long.valueOf(localLeaderboardScore.getRank()), Long.valueOf(paramLeaderboardScore.getRank()))) && (r.a(localLeaderboardScore.getDisplayRank(), paramLeaderboardScore.getDisplayRank())) && (r.a(Long.valueOf(localLeaderboardScore.getRawScore()), Long.valueOf(paramLeaderboardScore.getRawScore()))) && (r.a(localLeaderboardScore.getDisplayScore(), paramLeaderboardScore.getDisplayScore())) && (r.a(Long.valueOf(localLeaderboardScore.getTimestampMillis()), Long.valueOf(paramLeaderboardScore.getTimestampMillis()))) && (r.a(localLeaderboardScore.getScoreHolderDisplayName(), paramLeaderboardScore.getScoreHolderDisplayName())) && (r.a(localLeaderboardScore.getScoreHolderIconImageUri(), paramLeaderboardScore.getScoreHolderIconImageUri())) && (r.a(localLeaderboardScore.getScoreHolderHiResImageUri(), paramLeaderboardScore.getScoreHolderHiResImageUri())) && (r.a(localLeaderboardScore.getScoreHolder(), paramLeaderboardScore.getScoreHolder())));
    return false;
  }
  
  static String b(LeaderboardScore paramLeaderboardScore)
  {
    r.a locala = r.c(paramLeaderboardScore).a("Rank", Long.valueOf(paramLeaderboardScore.getRank())).a("DisplayRank", paramLeaderboardScore.getDisplayRank()).a("Score", Long.valueOf(paramLeaderboardScore.getRawScore())).a("DisplayScore", paramLeaderboardScore.getDisplayScore()).a("Timestamp", Long.valueOf(paramLeaderboardScore.getTimestampMillis())).a("DisplayName", paramLeaderboardScore.getScoreHolderDisplayName()).a("IconImageUri", paramLeaderboardScore.getScoreHolderIconImageUri()).a("HiResImageUri", paramLeaderboardScore.getScoreHolderHiResImageUri());
    if (paramLeaderboardScore.getScoreHolder() == null) {}
    for (Object localObject = null;; localObject = paramLeaderboardScore.getScoreHolder()) {
      return locala.a("Player", localObject).toString();
    }
  }
  
  public LeaderboardScore aH()
  {
    return this;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public String getDisplayRank()
  {
    return this.es;
  }
  
  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.es, paramCharArrayBuffer);
  }
  
  public String getDisplayScore()
  {
    return this.et;
  }
  
  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.et, paramCharArrayBuffer);
  }
  
  public long getRank()
  {
    return this.er;
  }
  
  public long getRawScore()
  {
    return this.eu;
  }
  
  public Player getScoreHolder()
  {
    return this.ez;
  }
  
  public String getScoreHolderDisplayName()
  {
    if (this.ez == null) {
      return this.ew;
    }
    return this.ez.getDisplayName();
  }
  
  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.ez == null)
    {
      ao.b(this.ew, paramCharArrayBuffer);
      return;
    }
    this.ez.getDisplayName(paramCharArrayBuffer);
  }
  
  public Uri getScoreHolderHiResImageUri()
  {
    if (this.ez == null) {
      return this.ey;
    }
    return this.ez.getHiResImageUri();
  }
  
  public Uri getScoreHolderIconImageUri()
  {
    if (this.ez == null) {
      return this.ex;
    }
    return this.ez.getIconImageUri();
  }
  
  public long getTimestampMillis()
  {
    return this.ev;
  }
  
  public int hashCode()
  {
    return a(this);
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  public String toString()
  {
    return b(this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */