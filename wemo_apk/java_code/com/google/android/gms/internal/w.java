package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class w<K, V>
{
  private final LinkedHashMap<K, V> cb;
  private int cc;
  private int cd;
  private int ce;
  private int cf;
  private int cg;
  private int ch;
  private int size;
  
  public w(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    this.cc = paramInt;
    this.cb = new LinkedHashMap(0, 0.75F, true);
  }
  
  private int c(K paramK, V paramV)
  {
    int i = sizeOf(paramK, paramV);
    if (i < 0) {
      throw new IllegalStateException("Negative size: " + paramK + "=" + paramV);
    }
    return i;
  }
  
  protected V create(K paramK)
  {
    return null;
  }
  
  protected void entryRemoved(boolean paramBoolean, K paramK, V paramV1, V paramV2) {}
  
  public final void evictAll()
  {
    trimToSize(-1);
  }
  
  public final V get(K paramK)
  {
    if (paramK == null) {
      throw new NullPointerException("key == null");
    }
    Object localObject3;
    try
    {
      Object localObject2 = this.cb.get(paramK);
      if (localObject2 != null)
      {
        this.cg = (1 + this.cg);
        return (V)localObject2;
      }
      this.ch = (1 + this.ch);
      localObject3 = create(paramK);
      if (localObject3 == null) {
        return null;
      }
    }
    finally {}
    try
    {
      this.ce = (1 + this.ce);
      Object localObject5 = this.cb.put(paramK, localObject3);
      if (localObject5 != null) {
        this.cb.put(paramK, localObject5);
      }
      for (;;)
      {
        if (localObject5 == null) {
          break;
        }
        entryRemoved(false, paramK, localObject3, localObject5);
        return (V)localObject5;
        this.size += c(paramK, localObject3);
      }
      trimToSize(this.cc);
    }
    finally {}
    return (V)localObject3;
  }
  
  public final V put(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null)) {
      throw new NullPointerException("key == null || value == null");
    }
    try
    {
      this.cd = (1 + this.cd);
      this.size += c(paramK, paramV);
      Object localObject2 = this.cb.put(paramK, paramV);
      if (localObject2 != null) {
        this.size -= c(paramK, localObject2);
      }
      if (localObject2 != null) {
        entryRemoved(false, paramK, localObject2, paramV);
      }
      trimToSize(this.cc);
      return (V)localObject2;
    }
    finally {}
  }
  
  public final int size()
  {
    try
    {
      int i = this.size;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  protected int sizeOf(K paramK, V paramV)
  {
    return 1;
  }
  
  public final String toString()
  {
    try
    {
      int i = this.cg + this.ch;
      int j = 0;
      if (i != 0) {
        j = 100 * this.cg / i;
      }
      Object[] arrayOfObject = new Object[4];
      arrayOfObject[0] = Integer.valueOf(this.cc);
      arrayOfObject[1] = Integer.valueOf(this.cg);
      arrayOfObject[2] = Integer.valueOf(this.ch);
      arrayOfObject[3] = Integer.valueOf(j);
      String str = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", arrayOfObject);
      return str;
    }
    finally {}
  }
  
  public void trimToSize(int paramInt)
  {
    Object localObject2;
    Object localObject3;
    try
    {
      if ((this.size < 0) || ((this.cb.isEmpty()) && (this.size != 0))) {
        throw new IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
      }
    }
    finally
    {
      throw ((Throwable)localObject1);
      if ((this.size <= paramInt) || (this.cb.isEmpty())) {
        return;
      }
      Map.Entry localEntry = (Map.Entry)this.cb.entrySet().iterator().next();
      localObject2 = localEntry.getKey();
      localObject3 = localEntry.getValue();
      this.cb.remove(localObject2);
      this.size -= c(localObject2, localObject3);
      this.cf = (1 + this.cf);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/w.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */