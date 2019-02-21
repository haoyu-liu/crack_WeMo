package com.google.android.gms.games.multiplayer;

import com.google.android.gms.games.Player;
import com.google.android.gms.internal.s;
import java.util.ArrayList;

public final class ParticipantUtils
{
  public static String getParticipantId(ArrayList<Participant> paramArrayList, String paramString)
  {
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)paramArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString))) {
        return localParticipant.getParticipantId();
      }
    }
    return null;
  }
  
  public static boolean z(String paramString)
  {
    s.b(paramString, "Participant ID must not be null");
    return paramString.startsWith("p_");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/ParticipantUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */