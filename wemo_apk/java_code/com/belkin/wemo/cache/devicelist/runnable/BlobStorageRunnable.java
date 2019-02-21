package com.belkin.wemo.cache.devicelist.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.GetSetBlobStorageCallback;
import com.belkin.wemo.cache.utils.BlobStorageParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.localsdk.parser.GetAttributeResponseParser;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.Iterator;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;
import org.json.JSONObject;

public class BlobStorageRunnable
  extends WeMoRunnable
{
  private static final String ACTION_GET_BLOB_STORAGE = "GetBlobStorage";
  private static final String ACTION_SET_BLOB_STORAGE = "SetBlobStorage";
  private String mBlobStorageOpType;
  private GetSetBlobStorageCallback mCallback;
  private DeviceListManager mDLM;
  private JSONObject mData;
  private Device mLocalDevice;
  private String mUdn;
  
  public BlobStorageRunnable(String paramString1, GetSetBlobStorageCallback paramGetSetBlobStorageCallback, DeviceListManager paramDeviceListManager, String paramString2, JSONObject paramJSONObject, Device paramDevice)
  {
    this.mBlobStorageOpType = paramString1;
    this.mCallback = paramGetSetBlobStorageCallback;
    this.mDLM = paramDeviceListManager;
    this.mUdn = paramString2;
    this.mData = paramJSONObject;
    this.mLocalDevice = paramDevice;
  }
  
  public void run()
  {
    Action localAction;
    for (;;)
    {
      try
      {
        String str1 = BlobStorageParser.createArgumentList(this.mData);
        JSONObject localJSONObject = new JSONObject().put("attributeList", str1);
        if (this.mBlobStorageOpType.equals("getBlobStorage"))
        {
          localAction = this.mLocalDevice.getAction("GetBlobStorage");
          if ((localJSONObject == null) || (localJSONObject.length() <= 0)) {
            break;
          }
          Iterator localIterator = localJSONObject.keys();
          if (!localIterator.hasNext()) {
            break;
          }
          String str2 = localIterator.next().toString();
          localAction.setArgumentValue(str2, localJSONObject.get(str2).toString());
          continue;
        }
        bool = this.mBlobStorageOpType.equals("setBlobStorage");
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog(this.TAG, "Exception in BlobStorageRunnable", localException);
        return;
      }
      boolean bool;
      localAction = null;
      if (bool) {
        localAction = this.mLocalDevice.getAction("SetBlobStorage");
      }
    }
    GetSetBlobStorageActionCallback localGetSetBlobStorageActionCallback = new GetSetBlobStorageActionCallback(localAction, "SetBlobStorage", null);
    ControlActionHandler.newInstance().postControlAction(localAction, localGetSetBlobStorageActionCallback, localGetSetBlobStorageActionCallback);
  }
  
  private class GetSetBlobStorageActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private final String TAG = "GetBlobStorageActionCallback";
    private String actionName;
    private Action actionObj;
    
    private GetSetBlobStorageActionCallback(Action paramAction, String paramString)
    {
      this.actionObj = paramAction;
      this.actionName = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      SDKLogUtils.errorLog("GetBlobStorageActionCallback", "Exception in GetBlobStorageActionCallback ", paramException);
      if (BlobStorageRunnable.this.mBlobStorageOpType.equals("getBlobStorage"))
      {
        DeviceListManager localDeviceListManager2 = BlobStorageRunnable.this.mDLM;
        localDeviceListManager2.sendNotification("get_blob_storage", "false", BlobStorageRunnable.this.mUdn);
      }
      for (;;)
      {
        BlobStorageRunnable.this.mCallback.onError(paramException + "");
        return;
        DeviceListManager localDeviceListManager1 = BlobStorageRunnable.this.mDLM;
        localDeviceListManager1.sendNotification("set_blob_storage", "false", BlobStorageRunnable.this.mUdn);
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      DeviceInformation localDeviceInformation;
      JSONObject localJSONObject1;
      try
      {
        SDKLogUtils.infoLog("GetBlobStorageActionCallback", "Success in GetBlobStorageActionCallback responseXMLStr: " + paramString + "PARSED STRING: " + new GetAttributeResponseParser().parseGetAttributeResponse(paramString).toString());
        localDeviceInformation = BlobStorageRunnable.this.mDLM.getDevice(BlobStorageRunnable.this.mUdn);
        localJSONObject1 = localDeviceInformation.getAttributeList();
        JSONObject localJSONObject2 = new GetAttributeResponseParser().parseGetAttributeResponse(paramString);
        Iterator localIterator = localJSONObject2.keys();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          localJSONObject1.put(str, localJSONObject2.getJSONObject(str));
        }
        SDKLogUtils.infoLog("GetBlobStorageActionCallback", "Attribute list to set: " + localJSONObject1);
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("GetBlobStorageActionCallback", "Exception in onActionSuccess", localException);
        return;
      }
      localDeviceInformation.setAttributeList(localJSONObject1);
      BlobStorageRunnable.this.mDLM.setDeviceInformationToDevicesArrayLocal(localDeviceInformation, false);
      if (BlobStorageRunnable.this.mBlobStorageOpType.equals("getBlobStorage"))
      {
        DeviceListManager localDeviceListManager2 = BlobStorageRunnable.this.mDLM;
        localDeviceListManager2.sendNotification("get_blob_storage", "true", BlobStorageRunnable.this.mUdn);
      }
      for (;;)
      {
        BlobStorageRunnable.this.mCallback.onSuccess(paramString);
        return;
        DeviceListManager localDeviceListManager1 = BlobStorageRunnable.this.mDLM;
        localDeviceListManager1.sendNotification("set_blob_storage", "true", BlobStorageRunnable.this.mUdn);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */