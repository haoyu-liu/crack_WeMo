package com.belkin.wemo.utils;

import com.belkin.wemo.WeMo;

public class RMRulesSharedPreferences
  extends RMWeMoSharedPreferences
{
  public static final String DEFAULT_RULES_DB_VERSION = "0";
  public static final String KEY_RULES_DB_VERSION = "rules_db_version";
  private static RMRulesSharedPreferences rulesUtils;
  
  public static RMRulesSharedPreferences instance()
  {
    if (rulesUtils == null)
    {
      rulesUtils = new RMRulesSharedPreferences();
      rulesUtils.init(WeMo.INSTANCE.getContext());
    }
    return rulesUtils;
  }
  
  protected String getFilename()
  {
    return RMRulesSharedPreferences.class.getSimpleName();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/RMRulesSharedPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */