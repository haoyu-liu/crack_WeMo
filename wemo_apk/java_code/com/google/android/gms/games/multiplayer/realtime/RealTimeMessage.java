package com.google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.s;

public final class RealTimeMessage
  implements Parcelable
{
  public static final Parcelable.Creator<RealTimeMessage> CREATOR = new Parcelable.Creator()
  {
    public RealTimeMessage[] J(int paramAnonymousInt)
    {
      return new RealTimeMessage[paramAnonymousInt];
    }
    
    public RealTimeMessage r(Parcel paramAnonymousParcel)
    {
      return new RealTimeMessage(paramAnonymousParcel, null);
    }
  };
  public static final int RELIABLE = 1;
  public static final int UNRELIABLE;
  private final String eT;
  private final byte[] eU;
  private final int eV;
  
  private RealTimeMessage(Parcel paramParcel)
  {
    this(paramParcel.readString(), paramParcel.createByteArray(), paramParcel.readInt());
  }
  
  public RealTimeMessage(String paramString, byte[] paramArrayOfByte, int paramInt)
  {
    this.eT = ((String)s.d(paramString));
    this.eU = ((byte[])((byte[])s.d(paramArrayOfByte)).clone());
    this.eV = paramInt;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public byte[] getMessageData()
  {
    return this.eU;
  }
  
  public String getSenderParticipantId()
  {
    return this.eT;
  }
  
  public boolean isReliable()
  {
    return this.eV == 1;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.eT);
    paramParcel.writeByteArray(this.eU);
    paramParcel.writeInt(this.eV);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/multiplayer/realtime/RealTimeMessage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */