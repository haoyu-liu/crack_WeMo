package com.belkin.wemo.rules;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.impl.RMRulesImpl;
import com.belkin.wemo.utils.RMRulesSharedPreferences;

public class RMRulesSDK
{
  private static final String TAG = RMRulesSDK.class.getSimpleName();
  private static boolean isInitialized;
  private static RMIRulesDependencyProvider provider;
  private static RMRulesSDK rulesSDK;
  private RMIRules rules;
  
  private RMRulesSDK()
  {
    if (this.rules == null) {
      this.rules = new RMRulesImpl();
    }
  }
  
  public static void init()
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "RULES SDK DEFAULT INIT REQUESTED. Is already initialized: " + isInitialized);
      if (!isInitialized)
      {
        provider = new RMRulesDependencyProviderImpl();
        isInitialized = true;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static void init(RMIRulesDependencyProvider paramRMIRulesDependencyProvider)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "RULES SDK INIT REQUESTED (CUSTOM DEPENDENCY PROVIDED). Is already initialized: " + isInitialized);
      if (!isInitialized)
      {
        provider = paramRMIRulesDependencyProvider;
        isInitialized = true;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static RMRulesSDK instance()
  {
    try
    {
      if ((isInitialized) && (rulesSDK == null)) {
        rulesSDK = new RMRulesSDK();
      }
      RMRulesSDK localRMRulesSDK = rulesSDK;
      return localRMRulesSDK;
    }
    finally {}
  }
  
  public static boolean isInitialized()
  {
    try
    {
      boolean bool = isInitialized;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static void tearDown()
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "RULES SDK TEARDOWN REQUESTED.");
      if (rulesSDK != null)
      {
        rulesSDK = null;
        isInitialized = false;
      }
      RMRulesSharedPreferences.instance().clearAll();
      return;
    }
    finally {}
  }
  
  public RMIRulesDependencyProvider getDependencyProvider()
  {
    try
    {
      RMIRulesDependencyProvider localRMIRulesDependencyProvider = provider;
      return localRMIRulesDependencyProvider;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public RMIRules getRules()
  {
    return this.rules;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/RMRulesSDK.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */