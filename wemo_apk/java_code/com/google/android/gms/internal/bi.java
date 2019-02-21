package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.Geofence;

public class bi
  implements SafeParcelable, Geofence
{
  public static final bj CREATOR = new bj();
  private final int ab;
  private final float fA;
  private final long fU;
  private final String fu;
  private final int fv;
  private final short fx;
  private final double fy;
  private final double fz;
  
  public bi(int paramInt1, String paramString, int paramInt2, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong)
  {
    A(paramString);
    b(paramFloat);
    a(paramDouble1, paramDouble2);
    int i = P(paramInt2);
    this.ab = paramInt1;
    this.fx = paramShort;
    this.fu = paramString;
    this.fy = paramDouble1;
    this.fz = paramDouble2;
    this.fA = paramFloat;
    this.fU = paramLong;
    this.fv = i;
  }
  
  public bi(String paramString, int paramInt, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong)
  {
    this(1, paramString, paramInt, paramShort, paramDouble1, paramDouble2, paramFloat, paramLong);
  }
  
  private static void A(String paramString)
  {
    if ((paramString == null) || (paramString.length() > 100)) {
      throw new IllegalArgumentException("requestId is null or too long: " + paramString);
    }
  }
  
  private static int P(int paramInt)
  {
    int i = paramInt & 0x3;
    if (i == 0) {
      throw new IllegalArgumentException("No supported transition specified: " + paramInt);
    }
    return i;
  }
  
  private static String Q(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return null;
    }
    return "CIRCLE";
  }
  
  private static void a(double paramDouble1, double paramDouble2)
  {
    if ((paramDouble1 > 90.0D) || (paramDouble1 < -90.0D)) {
      throw new IllegalArgumentException("invalid latitude: " + paramDouble1);
    }
    if ((paramDouble2 > 180.0D) || (paramDouble2 < -180.0D)) {
      throw new IllegalArgumentException("invalid longitude: " + paramDouble2);
    }
  }
  
  private static void b(float paramFloat)
  {
    if (paramFloat <= 0.0F) {
      throw new IllegalArgumentException("invalid radius: " + paramFloat);
    }
  }
  
  public static bi c(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    bi localbi = CREATOR.t(localParcel);
    localParcel.recycle();
    return localbi;
  }
  
  public short aT()
  {
    return this.fx;
  }
  
  public float aU()
  {
    return this.fA;
  }
  
  public int aV()
  {
    return this.fv;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    bi localbi;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (!(paramObject instanceof bi)) {
        return false;
      }
      localbi = (bi)paramObject;
      if (this.fA != localbi.fA) {
        return false;
      }
      if (this.fy != localbi.fy) {
        return false;
      }
      if (this.fz != localbi.fz) {
        return false;
      }
    } while (this.fx == localbi.fx);
    return false;
  }
  
  public long getExpirationTime()
  {
    return this.fU;
  }
  
  public double getLatitude()
  {
    return this.fy;
  }
  
  public double getLongitude()
  {
    return this.fz;
  }
  
  public String getRequestId()
  {
    return this.fu;
  }
  
  public int hashCode()
  {
    long l1 = Double.doubleToLongBits(this.fy);
    int i = 31 + (int)(l1 ^ l1 >>> 32);
    long l2 = Double.doubleToLongBits(this.fz);
    return 31 * (31 * (31 * (i * 31 + (int)(l2 ^ l2 >>> 32)) + Float.floatToIntBits(this.fA)) + this.fx) + this.fv;
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = Q(this.fx);
    arrayOfObject[1] = this.fu;
    arrayOfObject[2] = Integer.valueOf(this.fv);
    arrayOfObject[3] = Double.valueOf(this.fy);
    arrayOfObject[4] = Double.valueOf(this.fz);
    arrayOfObject[5] = Float.valueOf(this.fA);
    arrayOfObject[6] = Long.valueOf(this.fU);
    return String.format("Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, @%d]", arrayOfObject);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    bj.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */