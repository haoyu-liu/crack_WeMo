package com.google.android.gms.common.data;

import java.util.ArrayList;

public abstract class f<T>
  extends DataBuffer<T>
{
  private boolean ao = false;
  private ArrayList<Integer> ap;
  
  protected f(d paramd)
  {
    super(paramd);
  }
  
  private int h(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= this.ap.size())) {
      throw new IllegalArgumentException("Position " + paramInt + " is out of bounds for this buffer");
    }
    return ((Integer)this.ap.get(paramInt)).intValue();
  }
  
  private int i(int paramInt)
  {
    if ((paramInt < 0) || (paramInt == this.ap.size())) {
      return 0;
    }
    if (paramInt == -1 + this.ap.size()) {
      return this.S.getCount() - ((Integer)this.ap.get(paramInt)).intValue();
    }
    return ((Integer)this.ap.get(paramInt + 1)).intValue() - ((Integer)this.ap.get(paramInt)).intValue();
  }
  
  private void m()
  {
    for (;;)
    {
      int k;
      try
      {
        if (!this.ao)
        {
          int i = this.S.getCount();
          this.ap = new ArrayList();
          if (i > 0)
          {
            this.ap.add(Integer.valueOf(0));
            String str = getPrimaryDataMarkerColumn();
            int j = this.S.e(0);
            localObject2 = this.S.c(str, 0, j);
            k = 1;
            if (k < i)
            {
              int m = this.S.e(k);
              localObject3 = this.S.c(str, k, m);
              if (((String)localObject3).equals(localObject2)) {
                break label148;
              }
              this.ap.add(Integer.valueOf(k));
              break label152;
            }
          }
          this.ao = true;
        }
        else
        {
          return;
        }
      }
      finally {}
      label148:
      Object localObject3 = localObject2;
      label152:
      k++;
      Object localObject2 = localObject3;
    }
  }
  
  protected abstract T a(int paramInt1, int paramInt2);
  
  public final T get(int paramInt)
  {
    m();
    return (T)a(h(paramInt), i(paramInt));
  }
  
  public int getCount()
  {
    m();
    return this.ap.size();
  }
  
  protected abstract String getPrimaryDataMarkerColumn();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/f.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */