package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import java.util.ArrayList;

public abstract interface Leaderboard
{
  public static final int SCORE_ORDER_LARGER_IS_BETTER = 1;
  public static final int SCORE_ORDER_SMALLER_IS_BETTER;
  
  public abstract String getDisplayName();
  
  public abstract void getDisplayName(CharArrayBuffer paramCharArrayBuffer);
  
  public abstract Uri getIconImageUri();
  
  public abstract String getLeaderboardId();
  
  public abstract int getScoreOrder();
  
  public abstract ArrayList<LeaderboardVariant> getVariants();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/Leaderboard.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */