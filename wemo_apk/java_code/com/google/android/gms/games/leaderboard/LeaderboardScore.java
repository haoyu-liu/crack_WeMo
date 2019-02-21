package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Player;

public abstract interface LeaderboardScore
  extends Freezable<LeaderboardScore>
{
  public abstract String getDisplayRank();
  
  public abstract void getDisplayRank(CharArrayBuffer paramCharArrayBuffer);
  
  public abstract String getDisplayScore();
  
  public abstract void getDisplayScore(CharArrayBuffer paramCharArrayBuffer);
  
  public abstract long getRank();
  
  public abstract long getRawScore();
  
  public abstract Player getScoreHolder();
  
  public abstract String getScoreHolderDisplayName();
  
  public abstract void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer);
  
  public abstract Uri getScoreHolderHiResImageUri();
  
  public abstract Uri getScoreHolderIconImageUri();
  
  public abstract long getTimestampMillis();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/LeaderboardScore.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */