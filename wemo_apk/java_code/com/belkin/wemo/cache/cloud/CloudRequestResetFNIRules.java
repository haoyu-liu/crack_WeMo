package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestResetFNIRules
  implements CloudRequestInterface
{
  public static final int STEP_ONE_RESET_FNIRULES = 1;
  private static final int STEP_TWO_RESET_FNIRULES = 2;
  private final String TAG = "CloudRequestResetFNIRules";
  private final int TIMEOUT = 15000;
  private final int TIMEOUTLIMIT = 45000;
  private final String URLDeviceMessage = "https://api.xbcs.net:8443/apis/http/plugin/message/";
  private final String URLInsightParamsMessage = "https://api.xbcs.net:8443/apis/http/plugin/insight/message/";
  private OnRequestCompleteListener listener;
  private Context mContext;
  private DeviceListManager mDLM;
  private String mFN;
  private String mMac;
  private String mModelCode = "";
  private String mPluginId;
  private int mStepNumber = 1;
  private String mUdn;
  
  public CloudRequestResetFNIRules(DeviceListManager paramDeviceListManager, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, OnRequestCompleteListener paramOnRequestCompleteListener, int... paramVarArgs)
  {
    this.mMac = paramString3;
    this.mDLM = paramDeviceListManager;
    this.mContext = paramContext;
    if ((paramVarArgs != null) && (paramVarArgs.length > 0)) {
      this.mStepNumber = paramVarArgs[0];
    }
    this.mUdn = paramString1;
    this.mPluginId = paramString2;
    this.mFN = paramString4;
    this.mModelCode = paramString5;
    this.listener = paramOnRequestCompleteListener;
  }
  
  private String buildBody(int paramInt)
  {
    String str = "<plugins><plugin><recipientId>" + this.mPluginId + "</recipientId>" + "<macAddress>" + this.mMac + "</macAddress>" + "<modelCode>" + this.mModelCode + "</modelCode>";
    if (paramInt == 1) {
      str = str + "<content><![CDATA[<resetNameRulesData><plugin><macAddress>" + this.mMac + "</macAddress>" + "<resetType>" + "1" + "</resetType>" + "</plugin>" + "</resetNameRulesData>]]></content>";
    }
    for (;;)
    {
      return str + "</plugin></plugins>";
      if (paramInt == 2) {
        str = str + "<content><![CDATA[<changeFriendlyName><plugin><pluginID>" + this.mPluginId + "</pluginID>" + "<macAddress>" + this.mMac + "</macAddress>" + "<friendlyName>" + this.mFN + "</friendlyName>" + "</plugin>" + "</changeFriendlyName>]]></content>";
      }
    }
  }
  
  private void performNextStep(CloudRequestInterface paramCloudRequestInterface)
  {
    new CloudRequestManager(this.mContext).makeRequest(paramCloudRequestInterface);
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return buildBody(this.mStepNumber);
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return 15000;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    if (this.mStepNumber == 1) {
      return "https://api.xbcs.net:8443/apis/http/plugin/insight/message/";
    }
    if (this.mStepNumber == 2) {
      return "https://api.xbcs.net:8443/apis/http/plugin/message/";
    }
    return null;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    if (this.mStepNumber == 1) {
      if (paramBoolean)
      {
        SDKLogUtils.infoLog("CloudRequestResetFNIRules", "Finished reset of Name/Rules Data " + paramArrayOfByte + ",starting friendly name work");
        performNextStep(new CloudRequestResetFNIRules(this.mDLM, this.mContext, this.mUdn, this.mPluginId, this.mMac, this.mFN, this.mModelCode, this.listener, new int[] { 2 }));
      }
    }
    while (this.mStepNumber != 2)
    {
      return;
      if (this.listener != null) {
        this.listener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
      }
      this.mDLM.sendNotification("reset_fn_icon_rules", paramBoolean + "", this.mUdn);
      return;
    }
    DeviceInformation localDeviceInformation = this.mDLM.getDevice(this.mUdn);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setFriendlyName(this.mFN);
      localDeviceInformation.setIcon("");
      localDeviceInformation.setIconVersion("");
      localDeviceInformation.setIsDiscovered(true);
      localDeviceInformation.setInActive(0);
      this.mDLM.setDeviceInformationToDevicesArray(localDeviceInformation, false);
    }
    SDKLogUtils.infoLog("CloudRequestResetFNIRules", "Finished request to insight params request for FN update " + paramArrayOfByte + ", sending notification.");
    if (this.listener != null) {
      this.listener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
    this.mDLM.sendNotification("reset_fn_icon_rules", paramBoolean + "", this.mUdn);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestResetFNIRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */