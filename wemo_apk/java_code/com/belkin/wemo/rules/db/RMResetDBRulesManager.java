package com.belkin.wemo.rules.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class RMResetDBRulesManager
{
  private final String TAG = RMResetDBRulesManager.class.getSimpleName();
  private String udn;
  
  public RMResetDBRulesManager(String paramString)
  {
    this.udn = paramString;
  }
  
  public int resetDeviceRules()
  {
    ArrayList localArrayList;
    try
    {
      Set localSet = RMRulesDBManager.getInstance().getRuleIDsForDevice(this.udn);
      int i = localSet.size();
      SDKLogUtils.debugLog(this.TAG, "resetDeviceRules(): Rules count = " + i + "; UDN = " + this.udn);
      if (i > 0)
      {
        localArrayList = new ArrayList();
        Iterator localIterator1 = localSet.iterator();
        while (localIterator1.hasNext())
        {
          Integer localInteger = (Integer)localIterator1.next();
          int k = RMRulesDBManager.getInstance().getRuleDevicesCount(localInteger.intValue());
          String str = RMRulesDBManager.getInstance().getDBRuleType(localInteger.intValue());
          SDKLogUtils.debugLog(this.TAG, "resetDeviceRules(): Rule type = " + str + "; UDN = " + this.udn + "; total rule device count = " + k);
          try
          {
            RMDBRuleType localRMDBRuleType2 = RMDBRuleType.fromString(str);
            localArrayList.add(new DeviceRule(localInteger.intValue(), localRMDBRuleType2, k));
          }
          catch (IllegalArgumentException localIllegalArgumentException)
          {
            SDKLogUtils.errorLog(this.TAG, "IllegalArgumentException while fetching RMDBRuleType from ruleTypeStr: ", localIllegalArgumentException);
          }
        }
      }
      return i;
    }
    catch (RuleDBException localRuleDBException)
    {
      SDKLogUtils.errorLog(this.TAG, "RuleDBException while deleting all rules for a device during reset: ", localRuleDBException);
      i = -1;
    }
    for (;;)
    {
      Iterator localIterator2 = localArrayList.iterator();
      while (localIterator2.hasNext())
      {
        DeviceRule localDeviceRule = (DeviceRule)localIterator2.next();
        RMDBRuleType localRMDBRuleType1 = localDeviceRule.getRuleType();
        int j = localDeviceRule.getRuleId();
        switch (localRMDBRuleType1)
        {
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (localDeviceRule.getDeviceCount() <= 2) {
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteTargetDevicesEnrtiesByUDN(this.udn);
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount()) {
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount())
          {
            RMRulesDBManager.getInstance().deleteRowRules(j);
            RMRulesDBManager.getInstance().deleteRulesNotifyMessageEnrties(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount()) {
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteTargetDevicesEnrtiesByUDN(this.udn);
          if ((this.udn.toLowerCase(Locale.getDefault()).contains("dimmer")) || (RMRulesDBManager.getInstance().getTargetDevices(j).size() == 0))
          {
            RMRulesDBManager.getInstance().deleteRowRuleDevices(j);
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount())
          {
            RMRulesDBManager.getInstance().deleteRowRules(j);
            RMRulesDBManager.getInstance().deleteSensorNotificationEnrties(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if ((this.udn.toLowerCase(Locale.getDefault()).contains("sensor")) || (localDeviceRule.getDeviceCount() <= 2))
          {
            RMRulesDBManager.getInstance().deleteRowRuleDevices(j);
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          RMRulesDBManager.getInstance().deleteDeviceCombinationEnrtiesByUDN(this.udn);
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount())
          {
            RMRulesDBManager.getInstance().deleteRowRules(j);
            RMRulesDBManager.getInstance().deleteSensorNotificationEnrties(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if ((this.udn.toLowerCase(Locale.getDefault()).contains("sensor")) || (localDeviceRule.getDeviceCount() <= 2))
          {
            RMRulesDBManager.getInstance().deleteRowRuleDevices(j);
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          RMRulesDBManager.getInstance().deleteDeviceCombinationEnrtiesByUDN(this.udn);
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount()) {
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        case ???: 
          RMRulesDBManager.getInstance().deleteRuleDevicesEnrtiesByUDN(this.udn, j);
          if (1 == localDeviceRule.getDeviceCount()) {
            RMRulesDBManager.getInstance().deleteRowRules(j);
          }
          break;
        }
      }
    }
  }
  
  private class DeviceRule
  {
    private int deviceCount;
    private int ruleId;
    private RMDBRuleType ruleType;
    
    public DeviceRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2)
    {
      this.ruleId = paramInt1;
      this.ruleType = paramRMDBRuleType;
      this.deviceCount = paramInt2;
    }
    
    public int getDeviceCount()
    {
      return this.deviceCount;
    }
    
    public int getRuleId()
    {
      return this.ruleId;
    }
    
    public RMDBRuleType getRuleType()
    {
      return this.ruleType;
    }
    
    public void setDeviceCount(int paramInt)
    {
      this.deviceCount = paramInt;
    }
    
    public void setRuleId(int paramInt)
    {
      this.ruleId = paramInt;
    }
    
    public void setRuleType(RMDBRuleType paramRMDBRuleType)
    {
      this.ruleType = paramRMDBRuleType;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/RMResetDBRulesManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */