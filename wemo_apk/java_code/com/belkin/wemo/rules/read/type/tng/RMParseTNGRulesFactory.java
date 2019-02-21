package com.belkin.wemo.rules.read.type.tng;

import com.belkin.wemo.rules.read.type.RMIReadRulesType;

public enum RMParseTNGRulesFactory
{
  static
  {
    RMParseTNGRulesFactory[] arrayOfRMParseTNGRulesFactory = new RMParseTNGRulesFactory[1];
    arrayOfRMParseTNGRulesFactory[0] = INSTANCE;
    $VALUES = arrayOfRMParseTNGRulesFactory;
  }
  
  private RMParseTNGRulesFactory() {}
  
  public RMIReadRulesType getParseTNGRulesInstance()
  {
    return new RMParseTNGRules();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/tng/RMParseTNGRulesFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */