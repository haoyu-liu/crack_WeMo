package com.google.android.gms.games.multiplayer.realtime;

import com.google.android.gms.common.data.d;
import com.google.android.gms.common.data.f;

public final class a
  extends f<Room>
{
  public a(d paramd)
  {
    super(paramd);
  }
  
  protected Room b(int paramInt1, int paramInt2)
  {
    return new c(this.S, paramInt1, paramInt2);
  }
  
  protected String getPrimaryDataMarkerColumn()
  {
    return "external_match_id";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/realtime/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */