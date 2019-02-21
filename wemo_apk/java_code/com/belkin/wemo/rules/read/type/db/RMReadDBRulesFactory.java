package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.read.type.RMIReadRulesType;

public enum RMReadDBRulesFactory
{
  static
  {
    RMReadDBRulesFactory[] arrayOfRMReadDBRulesFactory = new RMReadDBRulesFactory[1];
    arrayOfRMReadDBRulesFactory[0] = INSTANCE;
    $VALUES = arrayOfRMReadDBRulesFactory;
  }
  
  private RMReadDBRulesFactory() {}
  
  public RMIReadRulesType getParseDBRulesInstance()
  {
    return new RMReadDBRules();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */