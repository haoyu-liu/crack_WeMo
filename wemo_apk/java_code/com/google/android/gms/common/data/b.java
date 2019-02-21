package com.google.android.gms.common.data;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.s;

public abstract class b
{
  protected final d S;
  protected final int V;
  private final int W;
  
  public b(d paramd, int paramInt)
  {
    this.S = ((d)s.d(paramd));
    if ((paramInt >= 0) && (paramInt < paramd.getCount())) {}
    for (boolean bool = true;; bool = false)
    {
      s.a(bool);
      this.V = paramInt;
      this.W = paramd.e(this.V);
      return;
    }
  }
  
  protected void a(String paramString, CharArrayBuffer paramCharArrayBuffer)
  {
    this.S.a(paramString, this.V, this.W, paramCharArrayBuffer);
  }
  
  protected Uri d(String paramString)
  {
    return this.S.f(paramString, this.V, this.W);
  }
  
  protected boolean e(String paramString)
  {
    return this.S.g(paramString, this.V, this.W);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool1 = paramObject instanceof b;
    boolean bool2 = false;
    if (bool1)
    {
      b localb = (b)paramObject;
      boolean bool3 = r.a(Integer.valueOf(localb.V), Integer.valueOf(this.V));
      bool2 = false;
      if (bool3)
      {
        boolean bool4 = r.a(Integer.valueOf(localb.W), Integer.valueOf(this.W));
        bool2 = false;
        if (bool4)
        {
          d locald1 = localb.S;
          d locald2 = this.S;
          bool2 = false;
          if (locald1 == locald2) {
            bool2 = true;
          }
        }
      }
    }
    return bool2;
  }
  
  protected boolean getBoolean(String paramString)
  {
    return this.S.d(paramString, this.V, this.W);
  }
  
  protected byte[] getByteArray(String paramString)
  {
    return this.S.e(paramString, this.V, this.W);
  }
  
  protected int getInteger(String paramString)
  {
    return this.S.b(paramString, this.V, this.W);
  }
  
  protected long getLong(String paramString)
  {
    return this.S.a(paramString, this.V, this.W);
  }
  
  protected String getString(String paramString)
  {
    return this.S.c(paramString, this.V, this.W);
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.V);
    arrayOfObject[1] = Integer.valueOf(this.W);
    arrayOfObject[2] = this.S;
    return r.hashCode(arrayOfObject);
  }
  
  public boolean isDataValid()
  {
    return !this.S.isClosed();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/data/b.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */