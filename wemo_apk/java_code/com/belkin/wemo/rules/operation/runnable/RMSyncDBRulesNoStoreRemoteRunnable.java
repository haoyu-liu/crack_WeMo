package com.belkin.wemo.rules.operation.runnable;

import android.text.TextUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestSendDBFile;
import com.belkin.wemo.cache.cloud.RMCloudRequestSetDBVersion;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RMSyncDBRulesNoStoreRemoteRunnable
  extends WeMoRunnable
{
  protected List<DeviceInformation> devicesList;
  protected RMStoreRulesRemoteErrorCallback errorCallback;
  protected HashMap<String, Object> params;
  protected RMIRulesUtils rulesUtils;
  protected RMStoreRulesRemoteSuccessCallback succesCallback;
  
  public RMSyncDBRulesNoStoreRemoteRunnable(RMStoreRulesRemoteErrorCallback paramRMStoreRulesRemoteErrorCallback, RMStoreRulesRemoteSuccessCallback paramRMStoreRulesRemoteSuccessCallback, List<DeviceInformation> paramList, HashMap<String, Object> paramHashMap, RMIRulesUtils paramRMIRulesUtils)
  {
    this.errorCallback = paramRMStoreRulesRemoteErrorCallback;
    this.succesCallback = paramRMStoreRulesRemoteSuccessCallback;
    this.devicesList = paramList;
    this.params = paramHashMap;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  public void run()
  {
    sendDBFileToCloud();
  }
  
  protected void sendDBFileToCloud()
  {
    String str1 = (String)this.params.get("db_zip_file");
    if (TextUtils.isEmpty(str1))
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(), this.devicesList, 1);
      }
      return;
    }
    String str2 = new SharePreferences(WeMo.INSTANCE.getContext()).getHomeId();
    SDKLogUtils.debugLog(this.TAG, "Store Rules (No Store): Sending RULES DB via remote to home ID = " + str2);
    RMCloudRequestSendDBFile localRMCloudRequestSendDBFile = new RMCloudRequestSendDBFile(str2, new SendDBFileResponse(null), this.rulesUtils.readFile(str1));
    this.rulesUtils.getCloudRequestManager().makeByteStreamRequest(localRMCloudRequestSendDBFile);
  }
  
  private class SendDBFileResponse
    implements OnRequestCompleteListener
  {
    private SendDBFileResponse() {}
    
    public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
    {
      SDKLogUtils.infoLog(RMSyncDBRulesNoStoreRemoteRunnable.this.TAG, "Store Rules (No Store): Send DB File remote call response. status = " + paramInt);
      if ((paramInt != 200) && (paramInt != 206))
      {
        if (RMSyncDBRulesNoStoreRemoteRunnable.this.errorCallback != null) {
          RMSyncDBRulesNoStoreRemoteRunnable.this.errorCallback.onError(new RMRulesError(), RMSyncDBRulesNoStoreRemoteRunnable.this.devicesList, 1);
        }
        return;
      }
      Integer localInteger = (Integer)RMSyncDBRulesNoStoreRemoteRunnable.this.params.get("new_db_version");
      HashMap localHashMap = new HashMap();
      Iterator localIterator = RMSyncDBRulesNoStoreRemoteRunnable.this.devicesList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        localHashMap.put(localDeviceInformation.getPluginID(), localDeviceInformation.getMAC());
      }
      RMCloudRequestSetDBVersion localRMCloudRequestSetDBVersion = new RMCloudRequestSetDBVersion(localHashMap, localInteger.intValue(), new RMSyncDBRulesNoStoreRemoteRunnable.SetDBVersionResponse(RMSyncDBRulesNoStoreRemoteRunnable.this, null));
      new CloudRequestManager(WeMo.INSTANCE.getContext()).makeRequest(localRMCloudRequestSetDBVersion);
    }
  }
  
  private class SetDBVersionResponse
    implements OnRequestCompleteListener
  {
    private SetDBVersionResponse() {}
    
    public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
    {
      SDKLogUtils.infoLog(RMSyncDBRulesNoStoreRemoteRunnable.this.TAG, "Store Rules (No Store): Set DB Version remote call response. status = " + paramInt);
      if (paramInt != 200) {
        if (RMSyncDBRulesNoStoreRemoteRunnable.this.errorCallback != null) {
          RMSyncDBRulesNoStoreRemoteRunnable.this.errorCallback.onError(new RMRulesError(), RMSyncDBRulesNoStoreRemoteRunnable.this.devicesList, 1);
        }
      }
      while (RMSyncDBRulesNoStoreRemoteRunnable.this.succesCallback == null) {
        return;
      }
      RMSyncDBRulesNoStoreRemoteRunnable.this.succesCallback.onSuccess(RMSyncDBRulesNoStoreRemoteRunnable.this.devicesList, 1);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */