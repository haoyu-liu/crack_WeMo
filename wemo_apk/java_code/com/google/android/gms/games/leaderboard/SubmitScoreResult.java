package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.d;
import com.google.android.gms.internal.bd;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.internal.s;
import java.util.HashMap;

public final class SubmitScoreResult
{
  private static final String[] eB = { "leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest" };
  private String dx;
  private String eC;
  private HashMap<Integer, Result> eD;
  private int p;
  
  public SubmitScoreResult(int paramInt, String paramString1, String paramString2)
  {
    this(paramInt, paramString1, paramString2, new HashMap());
  }
  
  public SubmitScoreResult(int paramInt, String paramString1, String paramString2, HashMap<Integer, Result> paramHashMap)
  {
    this.p = paramInt;
    this.eC = paramString1;
    this.dx = paramString2;
    this.eD = paramHashMap;
  }
  
  public SubmitScoreResult(d paramd)
  {
    this.p = paramd.getStatusCode();
    this.eD = new HashMap();
    int j = paramd.getCount();
    if (j == 3) {}
    for (boolean bool = true;; bool = false)
    {
      s.c(bool);
      while (i < j)
      {
        int k = paramd.e(i);
        if (i == 0)
        {
          this.eC = paramd.c("leaderboardId", i, k);
          this.dx = paramd.c("playerId", i, k);
        }
        if (paramd.d("hasResult", i, k)) {
          a(new Result(paramd.a("rawScore", i, k), paramd.c("formattedScore", i, k), paramd.d("newBest", i, k)), paramd.b("timeSpan", i, k));
        }
        i++;
      }
    }
  }
  
  private void a(Result paramResult, int paramInt)
  {
    this.eD.put(Integer.valueOf(paramInt), paramResult);
  }
  
  public String getLeaderboardId()
  {
    return this.eC;
  }
  
  public String getPlayerId()
  {
    return this.dx;
  }
  
  public Result getScoreResult(int paramInt)
  {
    return (Result)this.eD.get(Integer.valueOf(paramInt));
  }
  
  public int getStatusCode()
  {
    return this.p;
  }
  
  public String toString()
  {
    r.a locala = r.c(this).a("PlayerId", this.dx).a("StatusCode", Integer.valueOf(this.p));
    int i = 0;
    if (i < 3)
    {
      Result localResult = (Result)this.eD.get(Integer.valueOf(i));
      locala.a("TimesSpan", bd.G(i));
      if (localResult == null) {}
      for (String str = "null";; str = localResult.toString())
      {
        locala.a("Result", str);
        i++;
        break;
      }
    }
    return locala.toString();
  }
  
  public static final class Result
  {
    public final String formattedScore;
    public final boolean newBest;
    public final long rawScore;
    
    public Result(long paramLong, String paramString, boolean paramBoolean)
    {
      this.rawScore = paramLong;
      this.formattedScore = paramString;
      this.newBest = paramBoolean;
    }
    
    public String toString()
    {
      return r.c(this).a("RawScore", Long.valueOf(this.rawScore)).a("FormattedScore", this.formattedScore).a("NewBest", Boolean.valueOf(this.newBest)).toString();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/leaderboard/SubmitScoreResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */