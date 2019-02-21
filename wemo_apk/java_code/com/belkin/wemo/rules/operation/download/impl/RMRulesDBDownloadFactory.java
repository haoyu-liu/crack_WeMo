package com.belkin.wemo.rules.operation.download.impl;

import com.belkin.wemo.cache.utils.RMINetworkUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.operation.download.RMIRulesDBDownloader;
import com.belkin.wemo.rules.util.RMIRulesUtils;

public class RMRulesDBDownloadFactory
{
  public static RMIRulesDBDownloader getRulesDBDownloaderInstance()
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    Object localObject = null;
    RMIRulesUtils localRMIRulesUtils;
    if (localRMRulesSDK != null)
    {
      localRMIRulesUtils = localRMRulesSDK.getDependencyProvider().provideIRulesUtils();
      if (!localRMRulesSDK.getDependencyProvider().provideNetworkUtils().isLocal()) {
        break label48;
      }
    }
    label48:
    for (localObject = new RMRulesDBDownloadLocalImpl(localRMIRulesUtils);; localObject = new RMRulesDBDownloadRemoteImpl(localRMIRulesUtils)) {
      return (RMIRulesDBDownloader)localObject;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */