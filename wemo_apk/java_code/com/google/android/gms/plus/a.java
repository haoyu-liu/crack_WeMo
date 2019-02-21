package com.google.android.gms.plus;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public class a
  implements SafeParcelable
{
  public static final b CREATOR = new b();
  private final int ab;
  private final String g;
  private final String[] hY;
  private final String hZ;
  private final String ia;
  private final String ib;
  private final String[] ik;
  private final String[] il;
  
  public a(int paramInt, String paramString1, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3, String paramString2, String paramString3, String paramString4)
  {
    this.ab = paramInt;
    this.g = paramString1;
    this.ik = paramArrayOfString1;
    this.il = paramArrayOfString2;
    this.hY = paramArrayOfString3;
    this.hZ = paramString2;
    this.ia = paramString3;
    this.ib = paramString4;
  }
  
  public a(String paramString1, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3, String paramString2, String paramString3, String paramString4)
  {
    this.ab = 1;
    this.g = paramString1;
    this.ik = paramArrayOfString1;
    this.il = paramArrayOfString2;
    this.hY = paramArrayOfString3;
    this.hZ = paramString2;
    this.ia = paramString3;
    this.ib = paramString4;
  }
  
  public String[] bA()
  {
    return this.hY;
  }
  
  public String bB()
  {
    return this.hZ;
  }
  
  public String bC()
  {
    return this.ia;
  }
  
  public String bD()
  {
    return this.ib;
  }
  
  public String[] by()
  {
    return this.ik;
  }
  
  public String[] bz()
  {
    return this.il;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof a)) {}
    a locala;
    do
    {
      return false;
      locala = (a)paramObject;
    } while ((this.ab != locala.ab) || (!r.a(this.g, locala.g)) || (!r.a(this.ik, locala.ik)) || (!r.a(this.il, locala.il)) || (!r.a(this.hY, locala.hY)) || (!r.a(this.hZ, locala.hZ)) || (!r.a(this.ia, locala.ia)) || (!r.a(this.ib, locala.ib)));
    return true;
  }
  
  public String getAccountName()
  {
    return this.g;
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = Integer.valueOf(this.ab);
    arrayOfObject[1] = this.g;
    arrayOfObject[2] = this.ik;
    arrayOfObject[3] = this.il;
    arrayOfObject[4] = this.hY;
    arrayOfObject[5] = this.hZ;
    arrayOfObject[6] = this.ia;
    arrayOfObject[7] = this.ib;
    return r.hashCode(arrayOfObject);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    return r.c(this).a("versionCode", Integer.valueOf(this.ab)).a("accountName", this.g).a("requestedScopes", this.ik).a("visibleActivities", this.il).a("requiredFeatures", this.hY).a("packageNameForAuth", this.hZ).a("callingPackageName", this.ia).a("applicationName", this.ib).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    b.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */