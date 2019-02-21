package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class r
{
  public static boolean a(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }
  
  public static a c(Object paramObject)
  {
    return new a(paramObject, null);
  }
  
  public static int hashCode(Object... paramVarArgs)
  {
    return Arrays.hashCode(paramVarArgs);
  }
  
  public static final class a
  {
    private final List<String> bY;
    private final Object bZ;
    
    private a(Object paramObject)
    {
      this.bZ = s.d(paramObject);
      this.bY = new ArrayList();
    }
    
    public a a(String paramString, Object paramObject)
    {
      this.bY.add((String)s.d(paramString) + "=" + String.valueOf(paramObject));
      return this;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(100).append(this.bZ.getClass().getSimpleName()).append('{');
      int i = this.bY.size();
      for (int j = 0; j < i; j++)
      {
        localStringBuilder.append((String)this.bY.get(j));
        if (j < i - 1) {
          localStringBuilder.append(", ");
        }
      }
      return '}';
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/r.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */