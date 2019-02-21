package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class ak
  extends ae
  implements SafeParcelable
{
  public static final al CREATOR = new al();
  private final int ab;
  private final ah cB;
  private final Parcel cJ;
  private final int cK;
  private int cL;
  private int cM;
  private final String mClassName;
  
  ak(int paramInt, Parcel paramParcel, ah paramah)
  {
    this.ab = paramInt;
    this.cJ = ((Parcel)s.d(paramParcel));
    this.cK = 2;
    this.cB = paramah;
    if (this.cB == null) {}
    for (this.mClassName = null;; this.mClassName = this.cB.aj())
    {
      this.cL = 2;
      return;
    }
  }
  
  private ak(SafeParcelable paramSafeParcelable, ah paramah, String paramString)
  {
    this.ab = 1;
    this.cJ = Parcel.obtain();
    paramSafeParcelable.writeToParcel(this.cJ, 0);
    this.cK = 1;
    this.cB = ((ah)s.d(paramah));
    this.mClassName = ((String)s.d(paramString));
    this.cL = 2;
  }
  
  public static <T extends ae,  extends SafeParcelable> ak a(T paramT)
  {
    String str = paramT.getClass().getCanonicalName();
    ah localah = b(paramT);
    return new ak((SafeParcelable)paramT, localah, str);
  }
  
  public static HashMap<String, String> a(Bundle paramBundle)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramBundle.getString(str));
    }
    return localHashMap;
  }
  
  private static void a(ah paramah, ae paramae)
  {
    Class localClass1 = paramae.getClass();
    if (!paramah.b(localClass1))
    {
      HashMap localHashMap = paramae.T();
      paramah.a(localClass1, paramae.T());
      Iterator localIterator = localHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localHashMap.get((String)localIterator.next());
        Class localClass2 = locala.ab();
        if (localClass2 != null) {
          try
          {
            a(paramah, (ae)localClass2.newInstance());
          }
          catch (InstantiationException localInstantiationException)
          {
            throw new IllegalStateException("Could not instantiate an object of type " + locala.ab().getCanonicalName(), localInstantiationException);
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            throw new IllegalStateException("Could not access object of type " + locala.ab().getCanonicalName(), localIllegalAccessException);
          }
        }
      }
    }
  }
  
  private void a(StringBuilder paramStringBuilder, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Unknown type = " + paramInt);
    case 0: 
    case 1: 
    case 2: 
    case 3: 
    case 4: 
    case 5: 
    case 6: 
      paramStringBuilder.append(paramObject);
      return;
    case 7: 
      paramStringBuilder.append("\"").append(aq.r(paramObject.toString())).append("\"");
      return;
    case 8: 
      paramStringBuilder.append("\"").append(an.a((byte[])paramObject)).append("\"");
      return;
    case 9: 
      paramStringBuilder.append("\"").append(an.b((byte[])paramObject));
      paramStringBuilder.append("\"");
      return;
    case 10: 
      ar.a(paramStringBuilder, (HashMap)paramObject);
      return;
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }
  
  private void a(StringBuilder paramStringBuilder, ae.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    switch (parama.S())
    {
    default: 
      throw new IllegalArgumentException("Unknown field out type = " + parama.S());
    case 0: 
      b(paramStringBuilder, parama, a(parama, Integer.valueOf(a.f(paramParcel, paramInt))));
      return;
    case 1: 
      b(paramStringBuilder, parama, a(parama, a.h(paramParcel, paramInt)));
      return;
    case 2: 
      b(paramStringBuilder, parama, a(parama, Long.valueOf(a.g(paramParcel, paramInt))));
      return;
    case 3: 
      b(paramStringBuilder, parama, a(parama, Float.valueOf(a.i(paramParcel, paramInt))));
      return;
    case 4: 
      b(paramStringBuilder, parama, a(parama, Double.valueOf(a.j(paramParcel, paramInt))));
      return;
    case 5: 
      b(paramStringBuilder, parama, a(parama, a.k(paramParcel, paramInt)));
      return;
    case 6: 
      b(paramStringBuilder, parama, a(parama, Boolean.valueOf(a.c(paramParcel, paramInt))));
      return;
    case 7: 
      b(paramStringBuilder, parama, a(parama, a.l(paramParcel, paramInt)));
      return;
    case 8: 
    case 9: 
      b(paramStringBuilder, parama, a(parama, a.o(paramParcel, paramInt)));
      return;
    case 10: 
      b(paramStringBuilder, parama, a(parama, a(a.n(paramParcel, paramInt))));
      return;
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }
  
  private void a(StringBuilder paramStringBuilder, String paramString, ae.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    paramStringBuilder.append("\"").append(paramString).append("\":");
    if (parama.ad())
    {
      a(paramStringBuilder, parama, paramParcel, paramInt);
      return;
    }
    b(paramStringBuilder, parama, paramParcel, paramInt);
  }
  
  private void a(StringBuilder paramStringBuilder, HashMap<String, ae.a<?, ?>> paramHashMap, Parcel paramParcel)
  {
    HashMap localHashMap = b(paramHashMap);
    paramStringBuilder.append('{');
    int i = a.c(paramParcel);
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = a.b(paramParcel);
      Map.Entry localEntry = (Map.Entry)localHashMap.get(Integer.valueOf(a.m(k)));
      if (localEntry != null)
      {
        if (j != 0) {
          paramStringBuilder.append(",");
        }
        a(paramStringBuilder, (String)localEntry.getKey(), (ae.a)localEntry.getValue(), paramParcel, k);
        j = 1;
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    paramStringBuilder.append('}');
  }
  
  private static ah b(ae paramae)
  {
    ah localah = new ah(paramae.getClass());
    a(localah, paramae);
    localah.ah();
    localah.ag();
    return localah;
  }
  
  private static HashMap<Integer, Map.Entry<String, ae.a<?, ?>>> b(HashMap<String, ae.a<?, ?>> paramHashMap)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localHashMap.put(Integer.valueOf(((ae.a)localEntry.getValue()).aa()), localEntry);
    }
    return localHashMap;
  }
  
  private void b(StringBuilder paramStringBuilder, ae.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    if (parama.Y())
    {
      paramStringBuilder.append("[");
      switch (parama.S())
      {
      default: 
        throw new IllegalStateException("Unknown field type out.");
      case 0: 
        am.a(paramStringBuilder, a.q(paramParcel, paramInt));
      }
      for (;;)
      {
        paramStringBuilder.append("]");
        return;
        am.a(paramStringBuilder, a.s(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.r(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.t(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.u(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.v(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.p(paramParcel, paramInt));
        continue;
        am.a(paramStringBuilder, a.w(paramParcel, paramInt));
        continue;
        throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
        Parcel[] arrayOfParcel = a.z(paramParcel, paramInt);
        int j = arrayOfParcel.length;
        for (int k = 0; k < j; k++)
        {
          if (k > 0) {
            paramStringBuilder.append(",");
          }
          arrayOfParcel[k].setDataPosition(0);
          a(paramStringBuilder, parama.af(), arrayOfParcel[k]);
        }
      }
    }
    switch (parama.S())
    {
    default: 
      throw new IllegalStateException("Unknown field type out");
    case 0: 
      paramStringBuilder.append(a.f(paramParcel, paramInt));
      return;
    case 1: 
      paramStringBuilder.append(a.h(paramParcel, paramInt));
      return;
    case 2: 
      paramStringBuilder.append(a.g(paramParcel, paramInt));
      return;
    case 3: 
      paramStringBuilder.append(a.i(paramParcel, paramInt));
      return;
    case 4: 
      paramStringBuilder.append(a.j(paramParcel, paramInt));
      return;
    case 5: 
      paramStringBuilder.append(a.k(paramParcel, paramInt));
      return;
    case 6: 
      paramStringBuilder.append(a.c(paramParcel, paramInt));
      return;
    case 7: 
      String str2 = a.l(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(aq.r(str2)).append("\"");
      return;
    case 8: 
      byte[] arrayOfByte2 = a.o(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(an.a(arrayOfByte2)).append("\"");
      return;
    case 9: 
      byte[] arrayOfByte1 = a.o(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(an.b(arrayOfByte1));
      paramStringBuilder.append("\"");
      return;
    case 10: 
      Bundle localBundle = a.n(paramParcel, paramInt);
      Set localSet = localBundle.keySet();
      localSet.size();
      paramStringBuilder.append("{");
      Iterator localIterator = localSet.iterator();
      for (int i = 1; localIterator.hasNext(); i = 0)
      {
        String str1 = (String)localIterator.next();
        if (i == 0) {
          paramStringBuilder.append(",");
        }
        paramStringBuilder.append("\"").append(str1).append("\"");
        paramStringBuilder.append(":");
        paramStringBuilder.append("\"").append(aq.r(localBundle.getString(str1))).append("\"");
      }
      paramStringBuilder.append("}");
      return;
    }
    Parcel localParcel = a.y(paramParcel, paramInt);
    localParcel.setDataPosition(0);
    a(paramStringBuilder, parama.af(), localParcel);
  }
  
  private void b(StringBuilder paramStringBuilder, ae.a<?, ?> parama, Object paramObject)
  {
    if (parama.X())
    {
      b(paramStringBuilder, parama, (ArrayList)paramObject);
      return;
    }
    a(paramStringBuilder, parama.R(), paramObject);
  }
  
  private void b(StringBuilder paramStringBuilder, ae.a<?, ?> parama, ArrayList<?> paramArrayList)
  {
    paramStringBuilder.append("[");
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      if (j != 0) {
        paramStringBuilder.append(",");
      }
      a(paramStringBuilder, parama.R(), paramArrayList.get(j));
    }
    paramStringBuilder.append("]");
  }
  
  public HashMap<String, ae.a<?, ?>> T()
  {
    if (this.cB == null) {
      return null;
    }
    return this.cB.q(this.mClassName);
  }
  
  public Parcel al()
  {
    switch (this.cL)
    {
    }
    for (;;)
    {
      return this.cJ;
      this.cM = b.d(this.cJ);
      b.C(this.cJ, this.cM);
      this.cL = 2;
      continue;
      b.C(this.cJ, this.cM);
      this.cL = 2;
    }
  }
  
  ah am()
  {
    switch (this.cK)
    {
    default: 
      throw new IllegalStateException("Invalid creation type: " + this.cK);
    case 0: 
      return null;
    case 1: 
      return this.cB;
    }
    return this.cB;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int i()
  {
    return this.ab;
  }
  
  protected Object m(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }
  
  protected boolean n(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }
  
  public String toString()
  {
    s.b(this.cB, "Cannot convert to JSON on client side.");
    Parcel localParcel = al();
    localParcel.setDataPosition(0);
    StringBuilder localStringBuilder = new StringBuilder(100);
    a(localStringBuilder, this.cB.q(this.mClassName), localParcel);
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    al.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ak.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */