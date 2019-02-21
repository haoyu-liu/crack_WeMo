package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;

public class bv
  implements SafeParcelable
{
  public static final bw CREATOR = new bw();
  private final int ab;
  private final String di;
  private final ArrayList<x> iA;
  private final boolean iB;
  private final ArrayList<x> iz;
  
  public bv(int paramInt, String paramString, ArrayList<x> paramArrayList1, ArrayList<x> paramArrayList2, boolean paramBoolean)
  {
    this.ab = paramInt;
    this.di = paramString;
    this.iz = paramArrayList1;
    this.iA = paramArrayList2;
    this.iB = paramBoolean;
  }
  
  public ArrayList<x> bE()
  {
    return this.iz;
  }
  
  public ArrayList<x> bF()
  {
    return this.iA;
  }
  
  public boolean bG()
  {
    return this.iB;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getDescription()
  {
    return this.di;
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    bw.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bv.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */