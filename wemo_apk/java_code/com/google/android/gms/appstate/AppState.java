package com.google.android.gms.appstate;

import com.google.android.gms.common.data.Freezable;

public abstract interface AppState
  extends Freezable<AppState>
{
  public abstract byte[] getConflictData();
  
  public abstract String getConflictVersion();
  
  public abstract int getKey();
  
  public abstract byte[] getLocalData();
  
  public abstract String getLocalVersion();
  
  public abstract boolean hasConflict();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/appstate/AppState.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */