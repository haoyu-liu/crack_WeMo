package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.b;
import com.google.android.gms.common.data.d;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bd;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public final class e
  extends b
  implements LeaderboardVariant
{
  e(d paramd, int paramInt)
  {
    super(paramd, paramInt);
  }
  
  public String aI()
  {
    return getString("top_page_token_next");
  }
  
  public String aJ()
  {
    return getString("window_page_token_prev");
  }
  
  public String aK()
  {
    return getString("window_page_token_next");
  }
  
  public int getCollection()
  {
    return getInteger("collection");
  }
  
  public String getDisplayPlayerRank()
  {
    return getString("player_display_rank");
  }
  
  public String getDisplayPlayerScore()
  {
    return getString("player_display_score");
  }
  
  public long getNumScores()
  {
    if (e("total_scores")) {
      return -1L;
    }
    return getLong("total_scores");
  }
  
  public long getPlayerRank()
  {
    if (e("player_rank")) {
      return -1L;
    }
    return getLong("player_rank");
  }
  
  public long getRawPlayerScore()
  {
    if (e("player_raw_score")) {
      return -1L;
    }
    return getLong("player_raw_score");
  }
  
  public int getTimeSpan()
  {
    return getInteger("timespan");
  }
  
  public boolean hasPlayerInfo()
  {
    return !e("player_raw_score");
  }
  
  public String toString()
  {
    r.a locala1 = r.c(this).a("TimeSpan", bd.G(getTimeSpan())).a("Collection", bc.G(getCollection()));
    Object localObject1;
    String str1;
    label65:
    Object localObject2;
    label91:
    r.a locala4;
    if (hasPlayerInfo())
    {
      localObject1 = Long.valueOf(getRawPlayerScore());
      r.a locala2 = locala1.a("RawPlayerScore", localObject1);
      if (!hasPlayerInfo()) {
        break label173;
      }
      str1 = getDisplayPlayerScore();
      r.a locala3 = locala2.a("DisplayPlayerScore", str1);
      if (!hasPlayerInfo()) {
        break label180;
      }
      localObject2 = Long.valueOf(getPlayerRank());
      locala4 = locala3.a("PlayerRank", localObject2);
      if (!hasPlayerInfo()) {
        break label187;
      }
    }
    label173:
    label180:
    label187:
    for (String str2 = getDisplayPlayerRank();; str2 = "none")
    {
      return locala4.a("DisplayPlayerRank", str2).a("NumScores", Long.valueOf(getNumScores())).a("TopPageNextToken", aI()).a("WindowPageNextToken", aK()).a("WindowPagePrevToken", aJ()).toString();
      localObject1 = "none";
      break;
      str1 = "none";
      break label65;
      localObject2 = "none";
      break label91;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/e.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */