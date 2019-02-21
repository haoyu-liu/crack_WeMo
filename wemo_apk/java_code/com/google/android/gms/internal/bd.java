package com.google.android.gms.internal;

public final class bd
{
  public static String G(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Unknown time span " + paramInt);
    case 0: 
      return "DAILY";
    case 1: 
      return "WEEKLY";
    }
    return "ALL_TIME";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bd.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */