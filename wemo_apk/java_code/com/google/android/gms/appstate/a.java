package com.google.android.gms.appstate;

import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public final class a
  implements AppState
{
  private final int h;
  private final String i;
  private final byte[] j;
  private final boolean k;
  private final String l;
  private final byte[] m;
  
  public a(AppState paramAppState)
  {
    this.h = paramAppState.getKey();
    this.i = paramAppState.getLocalVersion();
    this.j = paramAppState.getLocalData();
    this.k = paramAppState.hasConflict();
    this.l = paramAppState.getConflictVersion();
    this.m = paramAppState.getConflictData();
  }
  
  static int a(AppState paramAppState)
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = Integer.valueOf(paramAppState.getKey());
    arrayOfObject[1] = paramAppState.getLocalVersion();
    arrayOfObject[2] = paramAppState.getLocalData();
    arrayOfObject[3] = Boolean.valueOf(paramAppState.hasConflict());
    arrayOfObject[4] = paramAppState.getConflictVersion();
    arrayOfObject[5] = paramAppState.getConflictData();
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(AppState paramAppState, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppState)) {
      bool = false;
    }
    AppState localAppState;
    do
    {
      do
      {
        return bool;
      } while (paramAppState == paramObject);
      localAppState = (AppState)paramObject;
    } while ((r.a(Integer.valueOf(localAppState.getKey()), Integer.valueOf(paramAppState.getKey()))) && (r.a(localAppState.getLocalVersion(), paramAppState.getLocalVersion())) && (r.a(localAppState.getLocalData(), paramAppState.getLocalData())) && (r.a(Boolean.valueOf(localAppState.hasConflict()), Boolean.valueOf(paramAppState.hasConflict()))) && (r.a(localAppState.getConflictVersion(), paramAppState.getConflictVersion())) && (r.a(localAppState.getConflictData(), paramAppState.getConflictData())));
    return false;
  }
  
  static String b(AppState paramAppState)
  {
    return r.c(paramAppState).a("Key", Integer.valueOf(paramAppState.getKey())).a("LocalVersion", paramAppState.getLocalVersion()).a("LocalData", paramAppState.getLocalData()).a("HasConflict", Boolean.valueOf(paramAppState.hasConflict())).a("ConflictVersion", paramAppState.getConflictVersion()).a("ConflictData", paramAppState.getConflictData()).toString();
  }
  
  public AppState a()
  {
    return this;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public byte[] getConflictData()
  {
    return this.m;
  }
  
  public String getConflictVersion()
  {
    return this.l;
  }
  
  public int getKey()
  {
    return this.h;
  }
  
  public byte[] getLocalData()
  {
    return this.j;
  }
  
  public String getLocalVersion()
  {
    return this.i;
  }
  
  public boolean hasConflict()
  {
    return this.k;
  }
  
  public int hashCode()
  {
    return a(this);
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  public String toString()
  {
    return b(this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/appstate/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */