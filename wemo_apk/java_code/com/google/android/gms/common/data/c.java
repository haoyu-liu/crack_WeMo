package com.google.android.gms.common.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class c<T extends SafeParcelable>
  extends DataBuffer<T>
{
  private static final String[] X = { "data" };
  private final Parcelable.Creator<T> Y;
  
  public c(d paramd, Parcelable.Creator<T> paramCreator)
  {
    super(paramd);
    this.Y = paramCreator;
  }
  
  public T d(int paramInt)
  {
    byte[] arrayOfByte = this.S.e("data", paramInt, 0);
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(arrayOfByte, 0, arrayOfByte.length);
    localParcel.setDataPosition(0);
    SafeParcelable localSafeParcelable = (SafeParcelable)this.Y.createFromParcel(localParcel);
    localParcel.recycle();
    return localSafeParcelable;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */