package com.google.android.gms.appstate;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.d;

public final class AppStateBuffer
  extends DataBuffer<AppState>
{
  public AppStateBuffer(d paramd)
  {
    super(paramd);
  }
  
  public AppState get(int paramInt)
  {
    return new b(this.S, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/appstate/AppStateBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */