package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public final class ab
  implements SafeParcelable, ae.b<String, Integer>
{
  public static final ac CREATOR = new ac();
  private final int ab;
  private final HashMap<String, Integer> co;
  private final HashMap<Integer, String> cp;
  private final ArrayList<a> cq;
  
  public ab()
  {
    this.ab = 1;
    this.co = new HashMap();
    this.cp = new HashMap();
    this.cq = null;
  }
  
  ab(int paramInt, ArrayList<a> paramArrayList)
  {
    this.ab = paramInt;
    this.co = new HashMap();
    this.cp = new HashMap();
    this.cq = null;
    a(paramArrayList);
  }
  
  private void a(ArrayList<a> paramArrayList)
  {
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      a locala = (a)localIterator.next();
      b(locala.cr, locala.cs);
    }
  }
  
  ArrayList<a> Q()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.co.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new a(str, ((Integer)this.co.get(str)).intValue()));
    }
    return localArrayList;
  }
  
  public int R()
  {
    return 7;
  }
  
  public int S()
  {
    return 0;
  }
  
  public String a(Integer paramInteger)
  {
    String str = (String)this.cp.get(paramInteger);
    if ((str == null) && (this.co.containsKey("gms_unknown"))) {
      str = "gms_unknown";
    }
    return str;
  }
  
  public ab b(String paramString, int paramInt)
  {
    this.co.put(paramString, Integer.valueOf(paramInt));
    this.cp.put(Integer.valueOf(paramInt), paramString);
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ac.a(this, paramParcel, paramInt);
  }
  
  public static final class a
    implements SafeParcelable
  {
    public static final ad CREATOR = new ad();
    final String cr;
    final int cs;
    final int versionCode;
    
    a(int paramInt1, String paramString, int paramInt2)
    {
      this.versionCode = paramInt1;
      this.cr = paramString;
      this.cs = paramInt2;
    }
    
    a(String paramString, int paramInt)
    {
      this.versionCode = 1;
      this.cr = paramString;
      this.cs = paramInt;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ad.a(this, paramParcel, paramInt);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/ab.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */