package com.google.android.gms.common.data;

import com.google.android.gms.internal.s;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class a<T>
  implements Iterator<T>
{
  private final DataBuffer<T> T;
  private int U;
  
  public a(DataBuffer<T> paramDataBuffer)
  {
    this.T = ((DataBuffer)s.d(paramDataBuffer));
    this.U = -1;
  }
  
  public boolean hasNext()
  {
    return this.U < -1 + this.T.getCount();
  }
  
  public T next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException("Cannot advance the iterator beyond " + this.U);
    }
    DataBuffer localDataBuffer = this.T;
    int i = 1 + this.U;
    this.U = i;
    return (T)localDataBuffer.get(i);
  }
  
  public void remove()
  {
    throw new UnsupportedOperationException("Cannot remove elements from a DataBufferIterator");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */