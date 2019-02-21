package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class x
  implements SafeParcelable
{
  public static final y CREATOR = new y();
  private final int aJ;
  private final int ab;
  private final int ci;
  private final String cj;
  private final String ck;
  private final String cl;
  private final String cm;
  
  public x(int paramInt1, int paramInt2, int paramInt3, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    this.ab = paramInt1;
    this.aJ = paramInt2;
    this.ci = paramInt3;
    this.cj = paramString1;
    this.ck = paramString2;
    this.cl = paramString3;
    this.cm = paramString4;
  }
  
  public int I()
  {
    return this.ci;
  }
  
  public String J()
  {
    return this.cj;
  }
  
  public String K()
  {
    return this.ck;
  }
  
  public String L()
  {
    return this.cm;
  }
  
  public boolean M()
  {
    return (this.aJ == 1) && (this.ci == -1);
  }
  
  public boolean N()
  {
    return this.aJ == 2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof x)) {}
    x localx;
    do
    {
      return false;
      localx = (x)paramObject;
    } while ((this.ab != localx.ab) || (this.aJ != localx.aJ) || (this.ci != localx.ci) || (!r.a(this.cj, localx.cj)) || (!r.a(this.ck, localx.ck)));
    return true;
  }
  
  public String getDisplayName()
  {
    return this.cl;
  }
  
  public int getType()
  {
    return this.aJ;
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = Integer.valueOf(this.ab);
    arrayOfObject[1] = Integer.valueOf(this.aJ);
    arrayOfObject[2] = Integer.valueOf(this.ci);
    arrayOfObject[3] = this.cj;
    arrayOfObject[4] = this.ck;
    return r.hashCode(arrayOfObject);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    if (N())
    {
      Object[] arrayOfObject3 = new Object[2];
      arrayOfObject3[0] = K();
      arrayOfObject3[1] = getDisplayName();
      return String.format("Person [%s] %s", arrayOfObject3);
    }
    if (M())
    {
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = J();
      arrayOfObject2[1] = getDisplayName();
      return String.format("Circle [%s] %s", arrayOfObject2);
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = J();
    arrayOfObject1[1] = getDisplayName();
    return String.format("Group [%s] %s", arrayOfObject1);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    y.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/x.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */