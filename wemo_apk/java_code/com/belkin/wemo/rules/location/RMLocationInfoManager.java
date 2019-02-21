package com.belkin.wemo.rules.location;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMLocationInfo;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTLocationInfo;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.location.callback.RMReadLocationErrorCallback;
import com.belkin.wemo.rules.location.callback.RMReadLocationSuccessCallback;
import com.belkin.wemo.rules.location.callback.RMUpdateLocationErrorCallback;
import com.belkin.wemo.rules.location.callback.RMUpdateLocationSuccessCallback;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;

public enum RMLocationInfoManager
{
  private static final String TAG = RMLocationInfoManager.class.getSimpleName();
  
  static
  {
    RMLocationInfoManager[] arrayOfRMLocationInfoManager = new RMLocationInfoManager[1];
    arrayOfRMLocationInfoManager[0] = INSTANCE;
    $VALUES = arrayOfRMLocationInfoManager;
  }
  
  private RMLocationInfoManager() {}
  
  public void read(RMReadLocationSuccessCallback paramRMReadLocationSuccessCallback, RMReadLocationErrorCallback paramRMReadLocationErrorCallback)
  {
    try
    {
      RMTLocationInfo localRMTLocationInfo = RMRulesDBManager.getInstance().readLocationInfo();
      if (localRMTLocationInfo != null)
      {
        RMLocationInfo localRMLocationInfo = new RMLocationInfo();
        localRMLocationInfo.setCityName(localRMTLocationInfo.getCityName());
        localRMLocationInfo.setCountryCode(localRMTLocationInfo.getCountryCode());
        localRMLocationInfo.setCountryName(localRMTLocationInfo.getCountryName());
        localRMLocationInfo.setLatitude(Float.valueOf(localRMTLocationInfo.getLatitude()).floatValue());
        localRMLocationInfo.setLongitude(Float.valueOf(localRMTLocationInfo.getLongitude()).floatValue());
        localRMLocationInfo.setRegion(localRMTLocationInfo.getRegion());
        SDKLogUtils.debugLog(TAG, "Fetch Rules: Location Info in DB = " + localRMLocationInfo.toString());
        if (paramRMReadLocationSuccessCallback != null) {
          paramRMReadLocationSuccessCallback.onLocationRead(localRMLocationInfo);
        }
      }
      else if (paramRMReadLocationSuccessCallback != null)
      {
        paramRMReadLocationSuccessCallback.onNoInfoLocationFound();
        return;
      }
    }
    catch (RuleDBException localRuleDBException)
    {
      SDKLogUtils.errorLog(TAG, "RuleDBException while reading location: ", localRuleDBException);
      if (paramRMReadLocationSuccessCallback != null) {
        paramRMReadLocationSuccessCallback.onNoInfoLocationFound();
      }
    }
  }
  
  public void update(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, RMUpdateLocationSuccessCallback paramRMUpdateLocationSuccessCallback, RMUpdateLocationErrorCallback paramRMUpdateLocationErrorCallback)
  {
    RMTLocationInfo localRMTLocationInfo = new RMTLocationInfo(paramString1, paramString2, paramString3, paramString4, paramString5, paramString6);
    try
    {
      if (RMRulesDBManager.getInstance().replaceLocationInfo(localRMTLocationInfo) != -1L)
      {
        if (paramRMUpdateLocationSuccessCallback != null) {
          paramRMUpdateLocationSuccessCallback.onLocationUpdated();
        }
      }
      else if (paramRMUpdateLocationErrorCallback != null)
      {
        paramRMUpdateLocationErrorCallback.onLocationUpdateFailed(new RMRulesError());
        return;
      }
    }
    catch (RuleDBException localRuleDBException)
    {
      SDKLogUtils.errorLog(TAG, "RuleDBException while updating LOCATIONINFO table: ", localRuleDBException);
      if (paramRMUpdateLocationErrorCallback != null) {
        paramRMUpdateLocationErrorCallback.onLocationUpdateFailed(new RMRulesError(-1, localRuleDBException.getMessage()));
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/location/RMLocationInfoManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */