package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class z
  implements SafeParcelable
{
  public static final aa CREATOR = new aa();
  private final int ab;
  private final ab cn;
  
  z(int paramInt, ab paramab)
  {
    this.ab = paramInt;
    this.cn = paramab;
  }
  
  private z(ab paramab)
  {
    this.ab = 1;
    this.cn = paramab;
  }
  
  public static z a(ae.b<?, ?> paramb)
  {
    if ((paramb instanceof ab)) {
      return new z((ab)paramb);
    }
    throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
  }
  
  ab O()
  {
    return this.cn;
  }
  
  public ae.b<?, ?> P()
  {
    if (this.cn != null) {
      return this.cn;
    }
    throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    aa.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/z.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */