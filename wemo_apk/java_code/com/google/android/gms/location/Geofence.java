package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.internal.bi;

public abstract interface Geofence
{
  public static final int GEOFENCE_TRANSITION_ENTER = 1;
  public static final int GEOFENCE_TRANSITION_EXIT = 2;
  public static final long NEVER_EXPIRE = -1L;
  
  public abstract String getRequestId();
  
  public static final class Builder
  {
    private float fA;
    private String fu = null;
    private int fv = 0;
    private long fw = Long.MIN_VALUE;
    private short fx = -1;
    private double fy;
    private double fz;
    
    public Geofence build()
    {
      if (this.fu == null) {
        throw new IllegalArgumentException("Request ID not set.");
      }
      if (this.fv == 0) {
        throw new IllegalArgumentException("Transitions types not set.");
      }
      if (this.fw == Long.MIN_VALUE) {
        throw new IllegalArgumentException("Expiration not set.");
      }
      if (this.fx == -1) {
        throw new IllegalArgumentException("Geofence region not set.");
      }
      return new bi(this.fu, this.fv, (short)1, this.fy, this.fz, this.fA, this.fw);
    }
    
    public Builder setCircularRegion(double paramDouble1, double paramDouble2, float paramFloat)
    {
      this.fx = 1;
      this.fy = paramDouble1;
      this.fz = paramDouble2;
      this.fA = paramFloat;
      return this;
    }
    
    public Builder setExpirationDuration(long paramLong)
    {
      if (paramLong < 0L)
      {
        this.fw = -1L;
        return this;
      }
      this.fw = (paramLong + SystemClock.elapsedRealtime());
      return this;
    }
    
    public Builder setRequestId(String paramString)
    {
      this.fu = paramString;
      return this;
    }
    
    public Builder setTransitionTypes(int paramInt)
    {
      this.fv = paramInt;
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/location/Geofence.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */