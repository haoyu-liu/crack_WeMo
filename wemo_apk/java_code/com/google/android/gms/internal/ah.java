package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class ah
  implements SafeParcelable
{
  public static final ai CREATOR = new ai();
  private final int ab;
  private final HashMap<String, HashMap<String, ae.a<?, ?>>> cD;
  private final ArrayList<a> cE;
  private final String cF;
  
  ah(int paramInt, ArrayList<a> paramArrayList, String paramString)
  {
    this.ab = paramInt;
    this.cE = null;
    this.cD = b(paramArrayList);
    this.cF = ((String)s.d(paramString));
    ag();
  }
  
  public ah(Class<? extends ae> paramClass)
  {
    this.ab = 1;
    this.cE = null;
    this.cD = new HashMap();
    this.cF = paramClass.getCanonicalName();
  }
  
  private static HashMap<String, HashMap<String, ae.a<?, ?>>> b(ArrayList<a> paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      a locala = (a)paramArrayList.get(j);
      localHashMap.put(locala.className, locala.ak());
    }
    return localHashMap;
  }
  
  public void a(Class<? extends ae> paramClass, HashMap<String, ae.a<?, ?>> paramHashMap)
  {
    this.cD.put(paramClass.getCanonicalName(), paramHashMap);
  }
  
  public void ag()
  {
    Iterator localIterator1 = this.cD.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str = (String)localIterator1.next();
      HashMap localHashMap = (HashMap)this.cD.get(str);
      Iterator localIterator2 = localHashMap.keySet().iterator();
      while (localIterator2.hasNext()) {
        ((ae.a)localHashMap.get((String)localIterator2.next())).a(this);
      }
    }
  }
  
  public void ah()
  {
    Iterator localIterator1 = this.cD.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      HashMap localHashMap1 = (HashMap)this.cD.get(str1);
      HashMap localHashMap2 = new HashMap();
      Iterator localIterator2 = localHashMap1.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localHashMap2.put(str2, ((ae.a)localHashMap1.get(str2)).W());
      }
      this.cD.put(str1, localHashMap2);
    }
  }
  
  ArrayList<a> ai()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.cD.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new a(str, (HashMap)this.cD.get(str)));
    }
    return localArrayList;
  }
  
  public String aj()
  {
    return this.cF;
  }
  
  public boolean b(Class<? extends ae> paramClass)
  {
    return this.cD.containsKey(paramClass.getCanonicalName());
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public HashMap<String, ae.a<?, ?>> q(String paramString)
  {
    return (HashMap)this.cD.get(paramString);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator1 = this.cD.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      localStringBuilder.append(str1).append(":\n");
      HashMap localHashMap = (HashMap)this.cD.get(str1);
      Iterator localIterator2 = localHashMap.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localStringBuilder.append("  ").append(str2).append(": ");
        localStringBuilder.append(localHashMap.get(str2));
      }
    }
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ai.a(this, paramParcel, paramInt);
  }
  
  public static class a
    implements SafeParcelable
  {
    public static final aj CREATOR = new aj();
    final ArrayList<ah.b> cG;
    final String className;
    final int versionCode;
    
    a(int paramInt, String paramString, ArrayList<ah.b> paramArrayList)
    {
      this.versionCode = paramInt;
      this.className = paramString;
      this.cG = paramArrayList;
    }
    
    a(String paramString, HashMap<String, ae.a<?, ?>> paramHashMap)
    {
      this.versionCode = 1;
      this.className = paramString;
      this.cG = a(paramHashMap);
    }
    
    private static ArrayList<ah.b> a(HashMap<String, ae.a<?, ?>> paramHashMap)
    {
      if (paramHashMap == null) {
        return null;
      }
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localArrayList.add(new ah.b(str, (ae.a)paramHashMap.get(str)));
      }
      return localArrayList;
    }
    
    HashMap<String, ae.a<?, ?>> ak()
    {
      HashMap localHashMap = new HashMap();
      int i = this.cG.size();
      for (int j = 0; j < i; j++)
      {
        ah.b localb = (ah.b)this.cG.get(j);
        localHashMap.put(localb.cH, localb.cI);
      }
      return localHashMap;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      aj.a(this, paramParcel, paramInt);
    }
  }
  
  public static class b
    implements SafeParcelable
  {
    public static final ag CREATOR = new ag();
    final String cH;
    final ae.a<?, ?> cI;
    final int versionCode;
    
    b(int paramInt, String paramString, ae.a<?, ?> parama)
    {
      this.versionCode = paramInt;
      this.cH = paramString;
      this.cI = parama;
    }
    
    b(String paramString, ae.a<?, ?> parama)
    {
      this.versionCode = 1;
      this.cH = paramString;
      this.cI = parama;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ag.a(this, paramParcel, paramInt);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ah.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */