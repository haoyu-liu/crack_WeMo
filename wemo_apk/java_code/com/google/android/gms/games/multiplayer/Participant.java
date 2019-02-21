package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Player;

public abstract interface Participant
  extends Parcelable, Freezable<Participant>
{
  public static final int STATUS_DECLINED = 3;
  public static final int STATUS_INVITED = 1;
  public static final int STATUS_JOINED = 2;
  public static final int STATUS_LEFT = 4;
  
  public abstract String aM();
  
  public abstract int aN();
  
  public abstract String getDisplayName();
  
  public abstract void getDisplayName(CharArrayBuffer paramCharArrayBuffer);
  
  public abstract Uri getHiResImageUri();
  
  public abstract Uri getIconImageUri();
  
  public abstract String getParticipantId();
  
  public abstract Player getPlayer();
  
  public abstract int getStatus();
  
  public abstract boolean isConnectedToRoom();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/Participant.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */