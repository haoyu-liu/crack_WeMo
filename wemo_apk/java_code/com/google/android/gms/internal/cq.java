package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;

public class cq
  implements SafeParcelable
{
  public static final cr CREATOR = new cr();
  private final int ab;
  private final ArrayList<x> kA;
  private final Bundle kB;
  private final boolean kC;
  private final int ky;
  private final ArrayList<x> kz;
  
  public cq(int paramInt1, ArrayList<x> paramArrayList1, ArrayList<x> paramArrayList2, Bundle paramBundle, boolean paramBoolean, int paramInt2)
  {
    this.ab = paramInt1;
    this.kz = paramArrayList1;
    this.kA = paramArrayList2;
    this.kB = paramBundle;
    this.kC = paramBoolean;
    this.ky = paramInt2;
  }
  
  public int cJ()
  {
    return this.ky;
  }
  
  public ArrayList<x> cK()
  {
    return this.kz;
  }
  
  public ArrayList<x> cL()
  {
    return this.kA;
  }
  
  public Bundle cM()
  {
    return this.kB;
  }
  
  public boolean cN()
  {
    return this.kC;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof cq)) {}
    cq localcq;
    do
    {
      return false;
      localcq = (cq)paramObject;
    } while ((this.ab != localcq.ab) || (!r.a(this.kz, localcq.kz)) || (!r.a(this.kA, localcq.kA)) || (!r.a(this.kB, localcq.kB)) || (!r.a(Integer.valueOf(this.ky), Integer.valueOf(localcq.ky))));
    return true;
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = Integer.valueOf(this.ab);
    arrayOfObject[1] = this.kz;
    arrayOfObject[2] = this.kA;
    arrayOfObject[3] = this.kB;
    arrayOfObject[4] = Integer.valueOf(this.ky);
    return r.hashCode(arrayOfObject);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    cr.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/cq.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */