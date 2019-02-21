package com.belkin.wemo.rules.device.dbrules;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.util.RMIRulesUtils;

public enum RMDeviceRulesDBFactory
{
  public static final String TAG = RMDeviceRulesDBFactory.class.getSimpleName();
  private static RMIDeviceRules fetchSupportInstance;
  private static RMIDeviceRules noFetchSupportInstance;
  
  static
  {
    RMDeviceRulesDBFactory[] arrayOfRMDeviceRulesDBFactory = new RMDeviceRulesDBFactory[1];
    arrayOfRMDeviceRulesDBFactory[0] = INSTANCE;
    $VALUES = arrayOfRMDeviceRulesDBFactory;
  }
  
  private RMDeviceRulesDBFactory() {}
  
  private RMIDeviceRules getDeviceRulesInstanceNoFetchAPISupport(RMIRulesUtils paramRMIRulesUtils)
  {
    if (noFetchSupportInstance == null) {
      noFetchSupportInstance = new RMDeviceRulesDBNoFetchSupportImpl(paramRMIRulesUtils);
    }
    return noFetchSupportInstance;
  }
  
  private RMIDeviceRules getDeviceRulesInstanceWithFetchAPISupport(RMIRulesUtils paramRMIRulesUtils)
  {
    if (fetchSupportInstance == null) {
      fetchSupportInstance = new RMDeviceRulesDBFetchSupportImpl(paramRMIRulesUtils);
    }
    return fetchSupportInstance;
  }
  
  public RMIDeviceRules getDeviceRulesInstance(DeviceInformation paramDeviceInformation)
  {
    RMIDeviceRules localRMIDeviceRules = null;
    RMIRulesUtils localRMIRulesUtils;
    if (paramDeviceInformation != null)
    {
      RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
      localRMIDeviceRules = null;
      if (localRMRulesSDK != null)
      {
        localRMIRulesUtils = localRMRulesSDK.getDependencyProvider().provideIRulesUtils();
        if (!localRMIRulesUtils.isFetchStoreRulesSupportedInDevice(paramDeviceInformation)) {
          break label47;
        }
      }
    }
    label47:
    for (localRMIDeviceRules = getDeviceRulesInstanceWithFetchAPISupport(localRMIRulesUtils);; localRMIDeviceRules = getDeviceRulesInstanceNoFetchAPISupport(localRMIRulesUtils)) {
      return localRMIDeviceRules;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */