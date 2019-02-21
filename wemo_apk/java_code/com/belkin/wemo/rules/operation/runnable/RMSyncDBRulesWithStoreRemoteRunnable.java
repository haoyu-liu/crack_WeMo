package com.belkin.wemo.rules.operation.runnable;

import android.text.TextUtils;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestStoreRules;
import com.belkin.wemo.cache.cloud.RMCloudRequestStoreRules.PluginStoreRulesData;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RMSyncDBRulesWithStoreRemoteRunnable
  extends WeMoRunnable
  implements OnRequestCompleteListener
{
  protected List<DeviceInformation> devicesList;
  protected RMStoreRulesRemoteErrorCallback errorCallback;
  private HashMap<String, Object> params;
  private int processDB;
  private RMDBRule rule;
  private RMIRulesUtils rulesUtils;
  protected RMStoreRulesRemoteSuccessCallback succesCallback;
  
  public RMSyncDBRulesWithStoreRemoteRunnable(RMStoreRulesRemoteErrorCallback paramRMStoreRulesRemoteErrorCallback, RMStoreRulesRemoteSuccessCallback paramRMStoreRulesRemoteSuccessCallback, List<DeviceInformation> paramList, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMIRulesUtils paramRMIRulesUtils)
  {
    this.errorCallback = paramRMStoreRulesRemoteErrorCallback;
    this.succesCallback = paramRMStoreRulesRemoteSuccessCallback;
    this.devicesList = paramList;
    this.params = paramHashMap;
    this.rule = paramRMDBRule;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  protected String getProcessDBValue(RMDBRule paramRMDBRule, String paramString)
  {
    return String.valueOf(this.processDB);
  }
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.infoLog(this.TAG, "Store Rules (Store Support): StoreRules remote call response. status = " + paramInt);
    if ((paramInt != 200) && (paramInt != 206)) {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(), this.devicesList, 2);
      }
    }
    while (this.succesCallback == null) {
      return;
    }
    this.succesCallback.onSuccess(this.devicesList, 2);
  }
  
  public void run()
  {
    String str1 = (String)this.params.get("db_zip_file");
    Integer localInteger = (Integer)this.params.get("new_db_version");
    Object localObject = this.params.get("new_db_version");
    if (localObject != null) {
      this.processDB = ((Integer)localObject).intValue();
    }
    String str2;
    try
    {
      str2 = this.rulesUtils.getFileInBase64Encoding(str1);
      if (TextUtils.isEmpty(str2))
      {
        if (this.errorCallback != null) {
          this.errorCallback.onError(new RMRulesError(), this.devicesList, 2);
        }
        return;
      }
    }
    catch (InvalidArgumentsException localInvalidArgumentsException)
    {
      do
      {
        SDKLogUtils.errorLog(this.TAG, "Store Rules Remote (Store Support): InvalidArgumentsException while converting db zip to base64 encoding.", localInvalidArgumentsException);
      } while (this.errorCallback == null);
      new RMRuleDeviceError().setErrorMessage(localInvalidArgumentsException.getMessage());
      this.errorCallback.onError(new RMRulesError(), this.devicesList, 2);
      return;
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.devicesList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      localArrayList.add(new RMCloudRequestStoreRules.PluginStoreRulesData(localDeviceInformation.getPluginID(), localDeviceInformation.getMAC(), getProcessDBValue(this.rule, localDeviceInformation.getUDN())));
    }
    RMCloudRequestStoreRules localRMCloudRequestStoreRules = new RMCloudRequestStoreRules(localArrayList, this, str2, localInteger.intValue());
    this.rulesUtils.getCloudRequestManager().makeByteStreamRequest(localRMCloudRequestStoreRules);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */