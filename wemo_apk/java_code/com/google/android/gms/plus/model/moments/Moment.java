package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.bx;
import com.google.android.gms.internal.bz;
import java.util.HashSet;
import java.util.Set;

public abstract interface Moment
  extends Freezable<Moment>
{
  public abstract String getId();
  
  public abstract ItemScope getResult();
  
  public abstract String getStartDate();
  
  public abstract ItemScope getTarget();
  
  public abstract String getType();
  
  public abstract boolean hasId();
  
  public abstract boolean hasResult();
  
  public abstract boolean hasStartDate();
  
  public abstract boolean hasTarget();
  
  public abstract boolean hasType();
  
  public static class Builder
  {
    private final Set<Integer> iD = new HashSet();
    private bx jB;
    private bx jC;
    private String jh;
    private String js;
    private String jy;
    
    public Moment build()
    {
      return new bz(this.iD, this.jh, this.jB, this.js, this.jC, this.jy);
    }
    
    public Builder setId(String paramString)
    {
      this.jh = paramString;
      this.iD.add(Integer.valueOf(2));
      return this;
    }
    
    public Builder setResult(ItemScope paramItemScope)
    {
      this.jB = ((bx)paramItemScope);
      this.iD.add(Integer.valueOf(4));
      return this;
    }
    
    public Builder setStartDate(String paramString)
    {
      this.js = paramString;
      this.iD.add(Integer.valueOf(5));
      return this;
    }
    
    public Builder setTarget(ItemScope paramItemScope)
    {
      this.jC = ((bx)paramItemScope);
      this.iD.add(Integer.valueOf(6));
      return this;
    }
    
    public Builder setType(String paramString)
    {
      this.jy = paramString;
      this.iD.add(Integer.valueOf(7));
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/model/moments/Moment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */