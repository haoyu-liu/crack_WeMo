package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public final class bz
  extends ae
  implements SafeParcelable, Moment
{
  public static final ca CREATOR = new ca();
  private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
  private final int ab;
  private final Set<Integer> iD;
  private bx jB;
  private bx jC;
  private String jh;
  private String js;
  private String jy;
  
  static
  {
    iC.put("id", ae.a.f("id", 2));
    iC.put("result", ae.a.a("result", 4, bx.class));
    iC.put("startDate", ae.a.f("startDate", 5));
    iC.put("target", ae.a.a("target", 6, bx.class));
    iC.put("type", ae.a.f("type", 7));
  }
  
  public bz()
  {
    this.ab = 1;
    this.iD = new HashSet();
  }
  
  bz(Set<Integer> paramSet, int paramInt, String paramString1, bx parambx1, String paramString2, bx parambx2, String paramString3)
  {
    this.iD = paramSet;
    this.ab = paramInt;
    this.jh = paramString1;
    this.jB = parambx1;
    this.js = paramString2;
    this.jC = parambx2;
    this.jy = paramString3;
  }
  
  public bz(Set<Integer> paramSet, String paramString1, bx parambx1, String paramString2, bx parambx2, String paramString3)
  {
    this.iD = paramSet;
    this.ab = 1;
    this.jh = paramString1;
    this.jB = parambx1;
    this.js = paramString2;
    this.jC = parambx2;
    this.jy = paramString3;
  }
  
  public HashMap<String, ae.a<?, ?>> T()
  {
    return iC;
  }
  
  protected boolean a(ae.a parama)
  {
    return this.iD.contains(Integer.valueOf(parama.aa()));
  }
  
  protected Object b(ae.a parama)
  {
    switch (parama.aa())
    {
    case 3: 
    default: 
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
    case 2: 
      return this.jh;
    case 4: 
      return this.jB;
    case 5: 
      return this.js;
    case 6: 
      return this.jC;
    }
    return this.jy;
  }
  
  Set<Integer> bH()
  {
    return this.iD;
  }
  
  bx bY()
  {
    return this.jB;
  }
  
  bx bZ()
  {
    return this.jC;
  }
  
  public bz ca()
  {
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof bz)) {
      return false;
    }
    if (this == paramObject) {
      return true;
    }
    bz localbz = (bz)paramObject;
    Iterator localIterator = iC.values().iterator();
    while (localIterator.hasNext())
    {
      ae.a locala = (ae.a)localIterator.next();
      if (a(locala))
      {
        if (localbz.a(locala))
        {
          if (!b(locala).equals(localbz.b(locala))) {
            return false;
          }
        }
        else {
          return false;
        }
      }
      else if (localbz.a(locala)) {
        return false;
      }
    }
    return true;
  }
  
  public String getId()
  {
    return this.jh;
  }
  
  public ItemScope getResult()
  {
    return this.jB;
  }
  
  public String getStartDate()
  {
    return this.js;
  }
  
  public ItemScope getTarget()
  {
    return this.jC;
  }
  
  public String getType()
  {
    return this.jy;
  }
  
  public boolean hasId()
  {
    return this.iD.contains(Integer.valueOf(2));
  }
  
  public boolean hasResult()
  {
    return this.iD.contains(Integer.valueOf(4));
  }
  
  public boolean hasStartDate()
  {
    return this.iD.contains(Integer.valueOf(5));
  }
  
  public boolean hasTarget()
  {
    return this.iD.contains(Integer.valueOf(6));
  }
  
  public boolean hasType()
  {
    return this.iD.contains(Integer.valueOf(7));
  }
  
  public int hashCode()
  {
    Iterator localIterator = iC.values().iterator();
    int i = 0;
    ae.a locala;
    if (localIterator.hasNext())
    {
      locala = (ae.a)localIterator.next();
      if (!a(locala)) {
        break label66;
      }
    }
    label66:
    for (int j = i + locala.aa() + b(locala).hashCode();; j = i)
    {
      i = j;
      break;
      return i;
    }
  }
  
  int i()
  {
    return this.ab;
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  protected Object m(String paramString)
  {
    return null;
  }
  
  protected boolean n(String paramString)
  {
    return false;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ca.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bz.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */