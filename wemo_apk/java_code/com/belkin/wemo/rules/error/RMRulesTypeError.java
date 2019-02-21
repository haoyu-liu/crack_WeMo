package com.belkin.wemo.rules.error;

import com.belkin.wemo.error.WeMoError;

public class RMRulesTypeError
  extends WeMoError
{
  private int rulesType;
  
  public RMRulesTypeError() {}
  
  public RMRulesTypeError(int paramInt, String paramString)
  {
    super(paramInt, paramString);
  }
  
  public RMRulesTypeError(int paramInt1, String paramString, int paramInt2)
  {
    super(paramInt1, paramString);
    this.rulesType = paramInt2;
  }
  
  public int getRulesType()
  {
    return this.rulesType;
  }
  
  public void setRulesType(int paramInt)
  {
    this.rulesType = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/error/RMRulesTypeError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */