package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.data.b;
import com.google.android.gms.common.data.d;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;

public final class cb
  extends b
  implements Moment
{
  private bz jD;
  
  public cb(d paramd, int paramInt)
  {
    super(paramd, paramInt);
  }
  
  private bz cb()
  {
    try
    {
      if (this.jD == null)
      {
        byte[] arrayOfByte = getByteArray("momentImpl");
        Parcel localParcel = Parcel.obtain();
        localParcel.unmarshall(arrayOfByte, 0, arrayOfByte.length);
        localParcel.setDataPosition(0);
        this.jD = bz.CREATOR.x(localParcel);
        localParcel.recycle();
      }
      return this.jD;
    }
    finally {}
  }
  
  public bz ca()
  {
    return cb();
  }
  
  public String getId()
  {
    return cb().getId();
  }
  
  public ItemScope getResult()
  {
    return cb().getResult();
  }
  
  public String getStartDate()
  {
    return cb().getStartDate();
  }
  
  public ItemScope getTarget()
  {
    return cb().getTarget();
  }
  
  public String getType()
  {
    return cb().getType();
  }
  
  public boolean hasId()
  {
    return cb().hasId();
  }
  
  public boolean hasResult()
  {
    return cb().hasId();
  }
  
  public boolean hasStartDate()
  {
    return cb().hasStartDate();
  }
  
  public boolean hasTarget()
  {
    return cb().hasTarget();
  }
  
  public boolean hasType()
  {
    return cb().hasType();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/cb.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */