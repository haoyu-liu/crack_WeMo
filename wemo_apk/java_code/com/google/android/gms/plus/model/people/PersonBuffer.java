package com.google.android.gms.plus.model.people;

import android.os.Bundle;
import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.c;
import com.google.android.gms.common.data.d;
import com.google.android.gms.internal.cc;
import com.google.android.gms.internal.cn;

public final class PersonBuffer
  extends DataBuffer<Person>
{
  private final c<cc> kp;
  
  public PersonBuffer(d paramd)
  {
    super(paramd);
    if ((paramd.l() != null) && (paramd.l().getBoolean("com.google.android.gms.plus.IsSafeParcelable", false)))
    {
      this.kp = new c(paramd, cc.CREATOR);
      return;
    }
    this.kp = null;
  }
  
  public Person get(int paramInt)
  {
    if (this.kp != null) {
      return (Person)this.kp.d(paramInt);
    }
    return new cn(this.S, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/model/people/PersonBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */