package com.google.android.gms.common.data;

import java.util.Iterator;

public abstract class DataBuffer<T>
  implements Iterable<T>
{
  protected final d S;
  
  protected DataBuffer(d paramd)
  {
    this.S = paramd;
  }
  
  public void close()
  {
    this.S.close();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public abstract T get(int paramInt);
  
  public int getCount()
  {
    return this.S.getCount();
  }
  
  public boolean isClosed()
  {
    return this.S.isClosed();
  }
  
  public Iterator<T> iterator()
  {
    return new a(this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/DataBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */