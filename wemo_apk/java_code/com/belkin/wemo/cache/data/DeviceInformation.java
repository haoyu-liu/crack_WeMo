package com.belkin.wemo.cache.data;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.text.TextUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestGetInsightParams;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.exception.InvalidActionException;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.upnp.parser.GetExtMetaInfoResponseParser;
import com.belkin.wemo.upnp.parser.GetMetaInfoResponseParser;
import com.belkin.wemo.upnp.parser.GetNightModeConfigurationResponseParser;
import com.belkin.wemo.upnp.response.ExtMetaInfo;
import com.belkin.wemo.upnp.response.MetaInfo;
import com.belkin.wemo.upnp.response.NightModeConfiguration;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Argument;
import org.cybergarage.upnp.ArgumentList;
import org.cybergarage.upnp.Device;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceInformation
{
  private int ID;
  private String IP = "";
  private String LEDCapabilities = "";
  private int LEDGroupID = 0;
  private String LEDGroupName = "";
  private String LEDUniqueID = "";
  private String LEDbridgeUDN = "";
  private final String TAG;
  private String UDN = "";
  private JSONObject attrList = new JSONObject();
  private boolean availablity = false;
  private String binaryState = "";
  private String brandName;
  private String bridgeUDN = "";
  private String capabilities = "";
  private String capabilityID = "";
  private String capabilityvalue = "";
  private String checkingStatus;
  private String countDownEndTime;
  private String currentState = "";
  private String customizedState = "";
  private String deviceId = "";
  private String deviceIdAvailablity = "";
  private String deviceIndex = "";
  private String deviceListType = "";
  private String discoveryState;
  private long endDiscoveryTime = 0L;
  private String firmwareVersion = "";
  private String foundTime = "";
  private String friendlyName = "";
  private String fwStatus = "";
  private String groupCapabilities = "";
  private String groupCapabilityID = "";
  private String groupID = "";
  private String groupIcon = "";
  private String groupName = "";
  public HashMap<String, DeviceInformation> groupedDevices = null;
  private int hide;
  private String homeID = "";
  private String html = "";
  private String hwVersion;
  private String icon = "";
  private String iconURL = "";
  private String iconUploadId = "";
  private String iconVersion = "0";
  private int inActive = -1;
  private String info = "";
  private boolean isDiscovered = false;
  private String isGroupAction;
  private boolean isRemote = false;
  private int lastEventTimeStamp = -1;
  private String lastSeen = "";
  private String lastTimestamp = "";
  private String ledGroupCapability = "";
  Device mDevice = null;
  private String mac = "";
  private String manufacturerName = "";
  private String modelCode = "";
  private boolean needIconUpdate = false;
  private String notificationType = "";
  private String parentExternalId = "";
  private String parentName = "";
  private String pluginID = "";
  private int port;
  private String productName = "";
  private String productType = "";
  private int rulesDBVersion;
  private String serialNumber = "";
  private String signalStrength = "";
  private String ssid = "";
  private long startDiscoveryTime = 0L;
  private int state;
  private int statusTS = -1;
  private String timestamp = "";
  private String type = "";
  private String wemoCertified = "";
  private String whichDiscovered = "";
  private String whichFound = "";
  private boolean zigbee = false;
  
  public DeviceInformation()
  {
    this.TAG = (getClass().getSimpleName() + ":" + this.UDN);
  }
  
  public DeviceInformation(String paramString1, String paramString2, int paramInt)
  {
    if (paramString1 != null) {}
    for (String str = DeviceListManager.getFilteredUDN(paramString1);; str = "")
    {
      this.UDN = str;
      this.TAG = (getClass().getSimpleName() + ":" + this.UDN);
      setIP(paramString2);
      setPort(paramInt);
      return;
    }
  }
  
  public DeviceInformation(String paramString1, String paramString2, int paramInt, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8)
  {
    this.TAG = (getClass().getSimpleName() + ":" + paramString2);
    this.LEDbridgeUDN = paramString1;
    this.LEDUniqueID = paramString2;
    this.state = paramInt;
    this.capabilities = paramString3;
    try
    {
      extractCapabilities(new JSONObject(this.capabilities));
      this.icon = paramString4;
      this.firmwareVersion = paramString5;
      this.modelCode = paramString6;
      this.friendlyName = paramString7;
      this.zigbee = true;
      this.pluginID = paramString8;
      SDKLogUtils.debugLog(this.TAG, "New LED Device. BridgeUDN: " + paramString1 + "; UniqueID: " + paramString2 + "; State: " + this.state + "; Friendly Name: " + paramString7 + "; capabilities: " + this.capabilities);
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "JSONException while parsing capabilities: ", localJSONException);
      }
    }
  }
  
  public DeviceInformation(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    if (paramString1 != null) {}
    for (String str = DeviceListManager.getFilteredUDN(paramString1);; str = "")
    {
      this.UDN = str;
      this.TAG = (getClass().getSimpleName() + ":" + this.UDN);
      this.homeID = paramString2;
      this.mac = paramString3;
      this.pluginID = paramString4;
      return;
    }
  }
  
  public DeviceInformation(String paramString1, String paramString2, String paramString3, String paramString4, int paramInt1, String paramString5, int paramInt2, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, String paramString11, int paramInt3)
  {
    if (paramString1 != null) {}
    for (String str = DeviceListManager.getFilteredUDN(paramString1);; str = "")
    {
      this.UDN = str;
      this.TAG = (getClass().getSimpleName() + ":" + this.UDN);
      update(paramString2, paramString3, paramString4, paramInt1, paramString5, paramInt2, paramString6, paramString7, paramString8, paramString9, paramString10, paramString11, paramInt3);
      return;
    }
  }
  
  public DeviceInformation(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    if (paramString5 != null) {}
    for (String str = DeviceListManager.getFilteredUDN(paramString5);; str = "")
    {
      this.UDN = str;
      this.TAG = (getClass().getSimpleName() + ":" + paramString5);
      this.friendlyName = paramString1;
      this.state = Integer.valueOf(paramString2).intValue();
      this.icon = paramString3;
      SDKLogUtils.debugLog(this.TAG, "Creating DeviceInformation instance - 1. icon: " + paramString3);
      this.iconURL = paramString4;
      this.discoveryState = paramString6;
      this.type = paramString7;
      return;
    }
  }
  
  public DeviceInformation(Device paramDevice)
  {
    if (paramDevice == null) {
      throw new IllegalArgumentException();
    }
    this.mDevice = paramDevice;
    if (this.mDevice.getUDN() != null) {}
    for (String str = DeviceListManager.getFilteredUDN(this.mDevice.getUDN());; str = "")
    {
      this.UDN = str;
      this.TAG = (getClass().getSimpleName() + ":" + this.UDN);
      setParametersFromDevice();
      return;
    }
  }
  
  private String changeModelName(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    String str1 = "";
    SDKLogUtils.infoLog(this.TAG, " ModelName Incorrect: " + this.modelCode);
    if (paramString.contains("-"))
    {
      String[] arrayOfString1 = paramString.split("-");
      if (arrayOfString1.length > 0)
      {
        String str2 = arrayOfString1[0];
        SDKLogUtils.infoLog(this.TAG, " firstPart: " + str2);
        if (str2.contains(":"))
        {
          String[] arrayOfString2 = str2.split(":");
          if (arrayOfString2.length > 1)
          {
            str1 = arrayOfString2[1];
            SDKLogUtils.infoLog(this.TAG, " changedModelName: " + str1);
          }
        }
      }
    }
    return str1.toLowerCase(Locale.getDefault());
  }
  
  private void extractCapabilities(JSONObject paramJSONObject)
  {
    SDKLogUtils.debugLog(this.TAG, "extractCapabilities: capabilities JO received: " + paramJSONObject + "; UDN: " + this.UDN);
    ArrayList localArrayList1;
    int i;
    if (this.capabilityID.equals(""))
    {
      localArrayList1 = new ArrayList();
      i = localArrayList1.size();
      SDKLogUtils.debugLog(this.TAG, "extractCapabilities: Existing capability IDs: " + this.capabilityID + "; SIZE: " + i);
      if (!this.capabilityvalue.equals("")) {
        break label236;
      }
    }
    label236:
    for (ArrayList localArrayList2 = new ArrayList();; localArrayList2 = new ArrayList(Arrays.asList(this.capabilityvalue.split("\\s*,\\s*"))))
    {
      int j = localArrayList2.size();
      SDKLogUtils.debugLog(this.TAG, "extractCapabilities: Existing capability Values: " + this.capabilityvalue + "; SIZE: " + j);
      if (j >= i) {
        break label261;
      }
      for (int m = 0; m < i - j; m++) {
        localArrayList2.add("");
      }
      localArrayList1 = new ArrayList(Arrays.asList(this.capabilityID.split("\\s*,\\s*")));
      break;
    }
    label261:
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str2;
      int k;
      try
      {
        String str1 = (String)localIterator.next();
        str2 = paramJSONObject.getString(str1);
        String str3 = DeviceListManager.getCapabilityIDFromTag(str1);
        SDKLogUtils.debugLog(this.TAG, "extractCapabilities: New capability key: " + str1 + "; value: " + str2 + "; corresponding ID: " + str3);
        k = localArrayList1.indexOf(str3);
        if (k != -1) {
          break label409;
        }
        localArrayList1.add(0, str3);
        localArrayList2.add(0, str2);
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog(this.TAG, "extractCapabilities: JSONException while extracting capabilities: ", localJSONException);
      }
      continue;
      label409:
      localArrayList2.set(k, str2);
    }
    this.capabilityID = TextUtils.join(",", localArrayList1);
    this.capabilityvalue = TextUtils.join(",", localArrayList2);
    SDKLogUtils.debugLog(this.TAG, "extractCapabilities: UPDATED Capability IDs: " + this.capabilityID + "; UPDATED Capability Values: " + this.capabilityvalue);
  }
  
  private void fetchIconFromDevice()
  {
    this.iconURL = ("http://" + this.IP + ":" + this.port + "/icon.jpg");
    setIcon(DeviceListManager.saveIconToStorage(this.iconURL, this.mac, this.iconVersion));
    SDKLogUtils.debugLog(this.TAG, "Custom Icon - Downloading icon from URL: " + this.iconURL + "; UDN: " + this.UDN + "; Downloaded Icon: " + this.icon + "; Object: " + System.identityHashCode(this));
  }
  
  private void fetchNightModeConfiguration()
  {
    SDKLogUtils.debugLog(this.TAG, "fetchNightModeConfiguration: STARTING...");
    if (this.mDevice != null)
    {
      Action localAction = this.mDevice.getAction("GetNightModeConfiguration");
      if (localAction != null)
      {
        String str = localAction.postControlAction();
        if (!TextUtils.isEmpty(str))
        {
          NightModeConfiguration localNightModeConfiguration = new GetNightModeConfigurationResponseParser().parseResponse(str);
          try
          {
            setAttributeValue("nightMode", localNightModeConfiguration.getNightMode());
            setAttributeValue("startTime", localNightModeConfiguration.getStartTime());
            setAttributeValue("endTime", localNightModeConfiguration.getEndTime());
            setAttributeValue("nightModeBrightness", localNightModeConfiguration.getNightModeBrightness());
            return;
          }
          catch (JSONException localJSONException)
          {
            SDKLogUtils.errorLog(this.TAG, "fetchNightModeConfiguration: JSONException while setting attributes: ", localJSONException);
            return;
          }
        }
        SDKLogUtils.errorLog(this.TAG, "fetchNightModeConfiguration: GetNightModeConfiguration Action Response is EMPTY");
        return;
      }
      SDKLogUtils.errorLog(this.TAG, "fetchNightModeConfiguration: GetNightModeConfiguration Action is NULL");
      return;
    }
    SDKLogUtils.errorLog(this.TAG, "fetchNightModeConfiguration: Control Point device is null");
  }
  
  private JSONObject getAttributeList(Device paramDevice)
    throws Exception
  {
    if (paramDevice == null) {
      return null;
    }
    String str1 = paramDevice.getUDN();
    JSONObject localJSONObject1;
    if (IsDevice.Crockpot(str1))
    {
      Action localAction = paramDevice.getAction("GetCrockpotState");
      if (localAction == null) {
        throw new Exception("Invalid action GetCrockpotState");
      }
      String str2 = localAction.postControlAction();
      SDKLogUtils.infoLog(this.TAG, "GetCrockpotState response: " + str2);
      localJSONObject1 = null;
      if (str2 != null)
      {
        localJSONObject1 = new JSONObject();
        Iterator localIterator = localAction.getOutputArgumentList().iterator();
        while (localIterator.hasNext())
        {
          Argument localArgument = (Argument)localIterator.next();
          String str3 = localArgument.getName();
          JSONObject localJSONObject2 = new JSONObject();
          localJSONObject2.put("name", str3);
          localJSONObject2.put("value", localArgument.getValue());
          localJSONObject1.put(str3, localJSONObject2);
        }
      }
    }
    else
    {
      if ((!IsDevice.Smart(str1)) && (!IsDevice.Maker(str1))) {
        break label236;
      }
      localJSONObject1 = paramDevice.getAttributetParameterFromDevice();
    }
    for (;;)
    {
      SDKLogUtils.infoLog(this.TAG, "attributeList for UDN:" + str1 + " --" + localJSONObject1);
      return localJSONObject1;
      label236:
      boolean bool = IsDevice.Insight(str1);
      localJSONObject1 = null;
      if (bool)
      {
        getInsightData();
        localJSONObject1 = null;
      }
    }
  }
  
  private String getDiscoveryTimeString()
  {
    if ((this.startDiscoveryTime > 0L) && (this.endDiscoveryTime > 0L) && (this.endDiscoveryTime > this.startDiscoveryTime))
    {
      int i = (int)getDiscoveryTime() / 1000;
      String str = String.valueOf((int)getDiscoveryTime() % 1000);
      if (str.length() > 3) {
        str = str.substring(0, 2);
      }
      if (i > 0) {
        return i + ":" + str;
      }
      return "0:" + str;
    }
    return "";
  }
  
  private JSONObject parseActionResponseToJSON(JSONObject paramJSONObject, Iterator<?> paramIterator, String[] paramArrayOfString)
  {
    int i = 0;
    try
    {
      while (paramIterator.hasNext())
      {
        Argument localArgument = (Argument)paramIterator.next();
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("value", localArgument.getValue());
        paramJSONObject.put(paramArrayOfString[i], localJSONObject);
        i++;
      }
      return paramJSONObject;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception while getting insight attributes ", localException);
    }
  }
  
  private void refreshGetInformationAttributes(Map<String, String> paramMap)
  {
    if (paramMap != null)
    {
      this.firmwareVersion = ((String)paramMap.get("firmwareVersion"));
      this.friendlyName = ((String)paramMap.get("FriendlyName"));
      this.binaryState = ((String)paramMap.get("binaryState"));
      if (!TextUtils.isEmpty(this.binaryState)) {
        this.state = Integer.valueOf(this.binaryState).intValue();
      }
      this.iconVersion = ((String)paramMap.get("iconVersion"));
      this.customizedState = ((String)paramMap.get("CustomizedState"));
      this.countDownEndTime = ((String)paramMap.get("CountdownEndTime"));
      this.hwVersion = ((String)paramMap.get("hwVersion"));
      this.mac = ((String)paramMap.get("macAddress"));
      if ((this.hwVersion == null) || (this.hwVersion.isEmpty())) {
        this.hwVersion = "v1";
      }
      if (paramMap.get("brandName") != null) {
        this.brandName = ((String)paramMap.get("brandName"));
      }
      if (paramMap.get("productName") != null) {
        this.productName = ((String)paramMap.get("productName"));
      }
    }
    try
    {
      setAttributeValue("brightness", (String)paramMap.get("brightness"));
      setAttributeValue("fader", (String)paramMap.get("fader"));
      setAttributeValue("nightMode", (String)paramMap.get("nightMode"));
      setAttributeValue("startTime", (String)paramMap.get("startTime"));
      setAttributeValue("endTime", (String)paramMap.get("endTime"));
      setAttributeValue("nightModeBrightness", (String)paramMap.get("nightModeBrightness"));
      setAttributeValue("hushMode", (String)paramMap.get("hushMode"));
      setAttributeValue("longPressRuleDeviceCnt", (String)paramMap.get("longPressRuleDeviceCnt"));
      setAttributeValue("longPressRuleDeviceUdn", (String)paramMap.get("longPressRuleDeviceUdn"));
      setAttributeValue("longPressRuleAction", (String)paramMap.get("longPressRuleAction"));
      setAttributeValue("longPressRuleState", (String)paramMap.get("longPressRuleState"));
      setAttributeValue("overTemp", (String)paramMap.get("OverTemp"));
      setAttributeValue("bulbType", (String)paramMap.get("bulbType"));
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog(this.TAG, "JSONException while setting brightness / fader / long press rule info from GetInformation action");
    }
  }
  
  private void setParametersFromDevice()
  {
    for (;;)
    {
      JSONObject localJSONObject;
      try
      {
        this.type = this.mDevice.getDeviceType();
        this.friendlyName = this.mDevice.getFriendlyName();
        this.UDN = this.mDevice.getUDN();
        this.mac = this.mDevice.getMacAddress();
        this.serialNumber = this.mDevice.getSerialNumber();
        setIP(this.mDevice.getIPAddress());
        setPort(this.mDevice.getPort());
        SDKLogUtils.debugLog(this.TAG, "DeviceInformation: New IP: " + this.IP + "; PORT: " + this.port);
        this.modelCode = this.mDevice.getModelName();
        if (!verifyModelName(this.modelCode, this.type))
        {
          String str4 = changeModelName(this.UDN);
          if (!TextUtils.isEmpty(str4)) {
            this.modelCode = str4;
          }
        }
        this.productName = this.mDevice.getProductName();
        if ((this.productName.isEmpty()) && (!this.modelCode.isEmpty()))
        {
          this.productName = StringUtils.toLowerCamelCase((String)DevicesArray.productNameMapping.get(this.modelCode));
          SDKLogUtils.infoLog(this.TAG, " setting productName " + this.productName);
          this.productType = this.mDevice.getProductType();
          if ((!this.productType.isEmpty()) || (this.modelCode.isEmpty())) {
            break label954;
          }
          this.productType = StringUtils.toLowerCamelCase((String)DevicesArray.productTypeMapping.get(this.modelCode));
          SDKLogUtils.infoLog(this.TAG, " setting productType " + this.productType);
        }
      }
      finally {}
      try
      {
        localJSONObject = getAttributeList(this.mDevice);
        if (localJSONObject != null) {
          this.attrList = localJSONObject;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        continue;
        SDKLogUtils.errorLog(this.TAG, "setParametersForDevice: GetExtMetaInfo response is null. Thus, resetting fsStatus. UDN: " + this.UDN);
        this.fwStatus = "";
        continue;
        SDKLogUtils.errorLog(this.TAG, "setParametersForDevice: GetExtMetaInfo ACTION is null. Thus, resetting fsStatus. UDN: " + this.UDN);
        this.fwStatus = "";
        continue;
        if (localAction2 == null) {
          continue;
        }
        String[] arrayOfString1 = this.mDevice.getDeviceInformationFromDevice();
        if (arrayOfString1 == null) {
          break label1133;
        }
        this.friendlyName = arrayOfString1[5];
        this.binaryState = arrayOfString1[4];
        this.iconVersion = arrayOfString1[2];
        this.firmwareVersion = arrayOfString1[1];
        this.mac = arrayOfString1[0];
        if (arrayOfString1.length <= 6) {
          continue;
        }
        this.brandName = arrayOfString1[6];
        continue;
        SDKLogUtils.infoLog(this.TAG, "device is not reachable");
        this.isDiscovered = false;
        this.inActive = 1;
        continue;
        if (localAction2 != null) {
          break label1242;
        }
        this.friendlyName = this.mDevice.getFriendlyNameFromDevice();
        if ((this.friendlyName != null) && (this.friendlyName.trim().length() != 0)) {
          break label1203;
        }
        this.friendlyName = this.mDevice.getFriendlyName();
        this.mac = this.mDevice.getMacAddress();
        this.binaryState = this.mDevice.getBinaryStateFromDevice();
        this.firmwareVersion = this.mDevice.getFirmwareVersionFromDevice();
        localMap = null;
        continue;
        String[] arrayOfString2 = this.mDevice.getDeviceInformationFromDevice();
        localMap = null;
        if (arrayOfString2 == null) {
          continue;
        }
        this.friendlyName = arrayOfString2[5];
        this.binaryState = arrayOfString2[4];
        this.iconVersion = arrayOfString2[2];
        this.firmwareVersion = arrayOfString2[1];
        this.mac = arrayOfString2[0];
        localMap = null;
        continue;
        if (this.iconVersion.equals("0")) {
          continue;
        }
        boolean bool2 = FileStorage.doesCustomIconExistAtLocation(this.icon);
        SDKLogUtils.debugLog(this.TAG, "setParametersForDevice(): Custom Icon - Does Icon Exist: " + bool2 + "; Icon Location: " + this.icon + "; UDN: " + this.UDN + "; Object: " + System.identityHashCode(this));
        if (bool2) {
          continue;
        }
        fetchIconFromDevice();
        continue;
        bool1 = true;
        continue;
      }
      SDKLogUtils.infoLog(this.TAG, " attribute List: " + this.attrList);
      Action localAction1 = this.mDevice.getAction("GetInformation");
      localAction2 = this.mDevice.getAction("GetDeviceInformation");
      Action localAction3 = this.mDevice.getAction("GetMetaInfo");
      Action localAction4 = this.mDevice.getAction("GetExtMetaInfo");
      SDKLogUtils.infoLog(this.TAG, "Fetching MetaInfo for device: " + this.UDN);
      if (localAction3 != null)
      {
        String str1 = localAction3.postControlAction();
        if (str1 != null)
        {
          SDKLogUtils.infoLog(this.TAG, "GetMetaInfo Response: " + str1);
          MetaInfo localMetaInfo = new GetMetaInfoResponseParser().parseResponse(str1);
          setSSID(localMetaInfo.getSSID());
          this.firmwareVersion = localMetaInfo.getFirmwareVersion();
        }
      }
      SDKLogUtils.infoLog(this.TAG, "Fetching ExtMetaInfo for device: " + this.UDN);
      if (localAction4 == null) {
        break label1015;
      }
      String str2 = localAction4.postControlAction();
      if (str2 == null) {
        break;
      }
      this.fwStatus = new GetExtMetaInfoResponseParser().parseResponse(str2).getFwStatus();
      String str3 = this.iconVersion;
      if (localAction1 == null) {
        break label1156;
      }
      localMap = this.mDevice.getCustomizedInformationFromDevice();
      if (localMap == null) {
        break label1054;
      }
      refreshGetInformationAttributes(localMap);
      if (!this.iconVersion.equals(str3)) {
        break label1405;
      }
      bool1 = false;
      this.needIconUpdate = bool1;
      if (this.iconVersion.equals("0"))
      {
        this.icon = "";
        this.needIconUpdate = false;
      }
      SDKLogUtils.debugLog(this.TAG, "setParametersForDevice(): newIconVersion: " + this.iconVersion + "prevIconVersion: " + str3 + "; UDN: " + this.UDN);
      if (!this.needIconUpdate) {
        break label1305;
      }
      fetchIconFromDevice();
      if (this.modelCode.toLowerCase(Locale.getDefault()).contains("NetCam".toLowerCase(Locale.getDefault())))
      {
        int i = this.friendlyName.lastIndexOf(";");
        if (i >= 0) {
          this.friendlyName = this.friendlyName.substring(0, i);
        }
      }
      SDKLogUtils.infoLog(this.TAG, " updateDeviceInfo customizedInformation: " + localMap + " friendlyName: " + this.friendlyName + " binaryState: " + this.binaryState + " iconVersion: " + this.iconVersion + " udn: " + this.UDN + " macAddress : " + this.mac + " countDownEndTime : " + this.countDownEndTime + " brandName: " + this.brandName + "hwVersion:" + this.hwVersion);
      return;
      this.productName = StringUtils.toLowerCamelCase(this.productName);
      continue;
      label954:
      this.productType = StringUtils.toLowerCamelCase(this.productType);
    }
  }
  
  private boolean verifyModelName(String paramString1, String paramString2)
  {
    return paramString2.toUpperCase(Locale.getDefault()).contains(paramString1.toUpperCase(Locale.getDefault()));
  }
  
  public void addLEDInGrp(DeviceInformation paramDeviceInformation)
  {
    if (this.groupedDevices == null) {
      this.groupedDevices = new HashMap();
    }
    this.groupedDevices.put(paramDeviceInformation.getUDN(), paramDeviceInformation);
  }
  
  public JSONObject getAttributeList()
  {
    SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Get Attribute List called: " + this.attrList.toString());
    return this.attrList;
  }
  
  public String getAttributeValue(String paramString)
    throws JSONException
  {
    SDKLogUtils.debugLog(this.TAG, "attrList: " + this.attrList + ";attribute: " + paramString);
    String str = this.attrList.getJSONObject(paramString).getString("value");
    SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Get Attribute Value. Attr: " + paramString + "; Value: " + str);
    return str;
  }
  
  public boolean getAvailablity()
  {
    return this.availablity;
  }
  
  public String getBinaryState()
  {
    return this.binaryState;
  }
  
  public String getBridgeUDN()
  {
    return this.bridgeUDN;
  }
  
  public String getCapabilities()
  {
    return this.capabilities;
  }
  
  public String getCapabilityID()
  {
    return this.capabilityID;
  }
  
  public String getCapabilityvalue()
  {
    return this.capabilityvalue;
  }
  
  public String getCheckingStatus()
  {
    if (this.checkingStatus == null) {
      this.checkingStatus = "First time discovered";
    }
    return this.checkingStatus;
  }
  
  public String getCountDownEndTime()
  {
    return this.countDownEndTime;
  }
  
  public String getCurrentState()
  {
    return this.currentState;
  }
  
  public String getCustomizedState()
  {
    if (this.customizedState == null) {
      return "";
    }
    return this.customizedState;
  }
  
  public Device getDevice()
  {
    return this.mDevice;
  }
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public String getDeviceIdAvailablity()
  {
    return this.deviceIdAvailablity;
  }
  
  public String getDeviceIndex()
  {
    return this.deviceIndex;
  }
  
  public String getDeviceListType()
  {
    return this.deviceListType;
  }
  
  public String getDiscoverySpeed()
  {
    if ((this.discoveryState.equals("Loaded from cloud")) || (this.discoveryState.equals("Discovery Success"))) {
      return getDiscoveryTimeString();
    }
    return "";
  }
  
  public String getDiscoveryState()
  {
    if (this.discoveryState == null) {
      this.discoveryState = "Loaded from cache";
    }
    return this.discoveryState;
  }
  
  public long getDiscoveryTime()
  {
    return this.endDiscoveryTime - this.startDiscoveryTime;
  }
  
  public long getEndDiscoveryTime()
  {
    return this.endDiscoveryTime;
  }
  
  public String getFirmwareVersion()
  {
    return this.firmwareVersion;
  }
  
  public String getFoundTime()
  {
    return this.foundTime;
  }
  
  public String getFriendlyName()
  {
    this.friendlyName = this.friendlyName.replaceAll("\"", "&quot;");
    this.friendlyName = this.friendlyName.replaceAll("'", "&apos;");
    SDKLogUtils.debugLog(this.TAG, "getFriendlyName(): Name = " + this.friendlyName + "; UDN: " + this.UDN);
    return this.friendlyName;
  }
  
  public String getFwStatus()
  {
    if (this.fwStatus == null) {
      this.fwStatus = "";
    }
    return this.fwStatus;
  }
  
  public String getGroupCapabilities()
  {
    return this.groupCapabilities;
  }
  
  public String getGroupCapabilityID()
  {
    return this.groupCapabilityID;
  }
  
  public String getGroupID()
  {
    return this.groupID;
  }
  
  public String getGroupIcon()
  {
    return this.groupIcon;
  }
  
  public String getGroupName()
  {
    return this.groupName;
  }
  
  public HashMap<String, DeviceInformation> getGroupedDevices()
  {
    return this.groupedDevices;
  }
  
  public int getHide()
  {
    return this.hide;
  }
  
  public String getHomeID()
  {
    return this.homeID;
  }
  
  public String getHtml()
  {
    return this.html;
  }
  
  public String getHwVersion()
  {
    return this.hwVersion;
  }
  
  public int getID()
  {
    return this.ID;
  }
  
  public String getIP()
  {
    if ((this.IP.isEmpty()) && (NetworkMode.isLocal())) {
      this.IP = DeviceListManager.getIPForDevice(getUDN());
    }
    SDKLogUtils.debugLog(this.TAG, "Getting IP: " + this.IP + "; UDN: " + this.UDN);
    return this.IP;
  }
  
  public String getIcon()
  {
    SDKLogUtils.debugLog(this.TAG, "getIcon(): Icon = " + this.icon + "; UDN: " + this.UDN + "; icon version: " + this.iconVersion);
    if (this.iconVersion == "")
    {
      this.icon = "";
      SDKLogUtils.debugLog(this.TAG, "getIcon(): Icon version = 0. This clearing icon.");
    }
    for (;;)
    {
      return this.icon;
      boolean bool1 = FileStorage.doesCustomIconExistAtLocation(this.icon);
      boolean bool2 = this.icon.contains("com.belkin.wemo.storage");
      SDKLogUtils.debugLog(this.TAG, "getIcon(): does icon exist: " + bool1);
      if ((!bool1) || (bool2)) {
        this.icon = "";
      }
    }
  }
  
  public String getIconURL()
  {
    return this.iconURL;
  }
  
  public String getIconUploadID()
  {
    return this.iconUploadId;
  }
  
  public String getIconVersion()
  {
    SDKLogUtils.debugLog(this.TAG, "getIconVersion(): icon version = " + this.iconVersion + "; UDN: " + this.UDN);
    return this.iconVersion;
  }
  
  public int getInActive()
  {
    return this.inActive;
  }
  
  public String getInfo()
  {
    if (this.info == null) {
      return "";
    }
    return this.info;
  }
  
  public void getInsightData()
  {
    SDKLogUtils.infoLog(this.TAG, "Network Mode is - " + NetworkMode.isLocal());
    if (NetworkMode.isLocal()) {
      try
      {
        String[] arrayOfString = { "GetInsightParams", "GetInsightHomeSettings", "GetDataExportInfo" };
        for (int i = 0; i < arrayOfString.length; i++)
        {
          Device localDevice = getDevice();
          if (localDevice != null)
          {
            Action localAction = localDevice.getAction(arrayOfString[i]);
            InsightGetActionCallback localInsightGetActionCallback = new InsightGetActionCallback(localAction, arrayOfString[i], null);
            ControlActionHandler.newInstance().postControlAction(localAction, localInsightGetActionCallback, localInsightGetActionCallback);
          }
        }
        return;
      }
      catch (Exception localException)
      {
        this.isDiscovered = false;
        SDKLogUtils.errorLog(this.TAG, "Exception while getting insight attributes ", localException);
      }
    }
    CloudRequestGetInsightParams localCloudRequestGetInsightParams = new CloudRequestGetInsightParams(WeMo.INSTANCE.getContext(), this);
    new CloudRequestManager(WeMo.INSTANCE.getContext()).makeRequest(localCloudRequestGetInsightParams);
  }
  
  public boolean getIsDiscovered()
  {
    return this.isDiscovered;
  }
  
  public String getIsGroupAction()
  {
    return this.isGroupAction;
  }
  
  public boolean getIsRemote()
  {
    return this.isRemote;
  }
  
  public String getLEDGroupCapability()
  {
    return this.ledGroupCapability;
  }
  
  public int getLEDGroupID()
  {
    return this.LEDGroupID;
  }
  
  public String getLEDGroupName()
  {
    return this.LEDGroupName;
  }
  
  public String getLEDbridgeUDN()
  {
    return this.LEDbridgeUDN;
  }
  
  public String getLEDcapabilities()
  {
    return this.LEDCapabilities;
  }
  
  public String getLEDuniqueID()
  {
    return this.LEDUniqueID;
  }
  
  public int getLastEventTimeStamp()
  {
    return this.lastEventTimeStamp;
  }
  
  public String getLastSeen()
  {
    if (this.lastSeen == null) {
      return "";
    }
    return this.lastSeen;
  }
  
  public String getLastTimestamp()
  {
    return this.lastTimestamp;
  }
  
  public String getMAC()
  {
    return this.mac;
  }
  
  public String getManufacturerName()
  {
    return this.manufacturerName;
  }
  
  public String getModelCode()
  {
    if (this.modelCode == null) {
      return "";
    }
    return this.modelCode;
  }
  
  public boolean getNeedIconUpdate()
  {
    return this.needIconUpdate;
  }
  
  public String getNotificationType()
  {
    return this.notificationType;
  }
  
  public String getParentExternalId()
  {
    return this.parentExternalId;
  }
  
  public String getParentName()
  {
    return this.parentName;
  }
  
  public String getPluginID()
  {
    return this.pluginID;
  }
  
  public int getPort()
  {
    if ((this.port <= 0) && (NetworkMode.isLocal())) {
      this.port = DeviceListManager.getPortForDevice(getUDN());
    }
    SDKLogUtils.debugLog(this.TAG, "Getting Port: " + this.port + "; UDN: " + this.UDN);
    return this.port;
  }
  
  public String getProductName()
  {
    return this.productName;
  }
  
  public String getProductType()
  {
    return this.productType;
  }
  
  public int getRulesDBVersion()
  {
    return this.rulesDBVersion;
  }
  
  public String getSSID()
  {
    SDKLogUtils.debugLog(this.TAG, "getSSID(): SSID = " + this.ssid + "; UDN: " + this.UDN);
    return this.ssid;
  }
  
  public String getSerialNumber()
  {
    return this.serialNumber;
  }
  
  public String getSignalStrength()
  {
    return this.signalStrength;
  }
  
  public long getStartDiscoveryTime()
  {
    return this.startDiscoveryTime;
  }
  
  public int getState()
  {
    if (this.state == -1) {
      this.state = 0;
    }
    return this.state;
  }
  
  public int getStatusTS()
  {
    return this.statusTS;
  }
  
  public String getTimestamp()
  {
    return this.timestamp;
  }
  
  public String getType()
  {
    return this.type;
  }
  
  public String getUDN()
  {
    return this.UDN;
  }
  
  public String getWemoCertified()
  {
    return this.wemoCertified;
  }
  
  public String getWhichDiscovered()
  {
    return this.whichDiscovered;
  }
  
  public String getWhichFound()
  {
    return this.whichFound;
  }
  
  public boolean isAttributePresent(String paramString)
  {
    boolean bool = this.attrList.has(paramString);
    SDKLogUtils.debugLog(this.TAG, "DeviceInformation: UDN: " + this.UDN + "; Is Attribute Present: " + paramString + " = " + bool + "; Attribute List: " + this.attrList.toString());
    return bool;
  }
  
  public boolean isZigbee()
  {
    return !this.LEDbridgeUDN.isEmpty();
  }
  
  public void postUPnPActionGetInformtion()
  {
    if (this.mDevice != null)
    {
      refreshGetInformationAttributes(this.mDevice.getCustomizedInformationFromDevice());
      return;
    }
    SDKLogUtils.errorLog(this.TAG, "refreshUPnPActionGetInformtion: Control Point device is NULL");
  }
  
  public void removeIcon()
  {
    String str = String.valueOf(getUDN().hashCode());
    File localFile = new File(DeviceListManager.getIconsDir() + "/" + str + ".png");
    if (localFile.exists()) {
      localFile.delete();
    }
  }
  
  public void saveIconToFile(Bitmap paramBitmap, Context paramContext)
  {
    String str1 = String.valueOf(getUDN().hashCode());
    String str2 = str1 + ".png";
    FileOutputStream localFileOutputStream = null;
    for (;;)
    {
      try
      {
        localFileOutputStream = paramContext.openFileOutput(str2, 0);
        paramBitmap.compress(Bitmap.CompressFormat.PNG, 90, localFileOutputStream);
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        if (localFileOutputStream == null) {
          continue;
        }
        try
        {
          localFileOutputStream.close();
          return;
        }
        catch (IOException localIOException2)
        {
          localIOException2.printStackTrace();
          return;
        }
      }
      finally
      {
        if (localFileOutputStream == null) {
          break label114;
        }
      }
      try
      {
        localFileOutputStream.close();
        return;
      }
      catch (IOException localIOException3)
      {
        localIOException3.printStackTrace();
        return;
      }
    }
    try
    {
      localFileOutputStream.close();
      label114:
      throw ((Throwable)localObject);
    }
    catch (IOException localIOException1)
    {
      for (;;)
      {
        localIOException1.printStackTrace();
      }
    }
  }
  
  public void setAttributeList(JSONObject paramJSONObject)
  {
    SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Set Attribute List called. New attr list: " + paramJSONObject.toString());
    this.attrList = paramJSONObject;
    try
    {
      SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Previous binary state: " + this.state + " :attributeList: " + paramJSONObject + ";UDN: " + this.UDN);
      if (this.UDN.contains("AirPurifier")) {
        if (paramJSONObject.has("mode")) {
          this.state = Integer.valueOf(getAttributeValue("mode")).intValue();
        }
      }
      for (;;)
      {
        SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Updated binary state: " + this.state);
        return;
        if (paramJSONObject.has("binaryState")) {
          this.state = Integer.valueOf(getAttributeValue("binaryState")).intValue();
        }
      }
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      SDKLogUtils.errorLog(this.TAG, "NumberFormatException while getting binaryState value from attributes List");
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog(this.TAG, "JSONException while getting binaryState value from attributes List");
    }
  }
  
  public void setAttributeValue(String paramString1, String paramString2)
    throws JSONException
  {
    if (paramString2 != null)
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("value", paramString2);
      this.attrList.put(paramString1, localJSONObject);
      SDKLogUtils.debugLog(this.TAG, "DeviceInformation: Attribute list after update: " + this.attrList.toString());
      return;
    }
    SDKLogUtils.errorLog(this.TAG, "DeviceInformation: Attribute List NOT updated as value is NULL for attribute: " + paramString1);
  }
  
  public void setAvailablity(boolean paramBoolean)
  {
    this.availablity = paramBoolean;
  }
  
  public void setBinaryState(String paramString)
  {
    this.binaryState = paramString;
  }
  
  public void setBridgeUDN(String paramString)
  {
    this.bridgeUDN = paramString;
  }
  
  public void setCapabilities(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Device: " + getUDN() + "; Set Device Capabilities String: " + paramString);
    this.capabilities = paramString;
    try
    {
      extractCapabilities(new JSONObject(this.capabilities));
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog(this.TAG, "JSONException while converting capabilities to JO: ", localJSONException);
    }
  }
  
  public void setCapabilityID(String paramString)
  {
    this.capabilityID = paramString;
  }
  
  public void setCapabilityvalue(String paramString)
  {
    this.capabilityvalue = paramString;
  }
  
  public void setCheckingStatus(String paramString)
  {
    this.checkingStatus = paramString;
  }
  
  public void setCountDownEndTime(String paramString)
  {
    this.countDownEndTime = paramString;
  }
  
  public void setCurrentState(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Set current state: " + paramString + "; UDN: " + this.UDN);
    this.currentState = paramString;
  }
  
  public void setCustomizedState(String paramString)
  {
    this.customizedState = paramString;
  }
  
  public void setDevice(Device paramDevice)
  {
    setDevice(paramDevice, true);
  }
  
  public void setDevice(Device paramDevice, boolean paramBoolean)
  {
    if ((paramDevice == null) || (paramDevice.getLocation() == null) || (paramDevice.getLocation().length() == 0)) {}
    do
    {
      return;
      this.mDevice = paramDevice;
    } while (!paramBoolean);
    setParametersFromDevice();
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setDeviceIdAvailablity(String paramString)
  {
    this.deviceIdAvailablity = paramString;
  }
  
  public void setDeviceIndex(String paramString)
  {
    this.deviceIndex = paramString;
  }
  
  public void setDeviceListType(String paramString)
  {
    this.deviceListType = paramString;
  }
  
  public void setDiscoveryState(String paramString)
  {
    if (paramString != null)
    {
      if (((paramString.equals("Discovery Success")) || (paramString.equals("Loaded from cloud"))) && ((this.discoveryState == null) || (this.discoveryState.equals("Loaded from cache"))))
      {
        this.foundTime = getDiscoveryTimeString();
        this.whichFound = this.whichDiscovered;
      }
      this.discoveryState = paramString;
    }
  }
  
  public void setEndDiscoveryTime(long paramLong)
  {
    this.endDiscoveryTime = paramLong;
  }
  
  public void setFirmwareVersion(String paramString)
  {
    this.firmwareVersion = paramString;
  }
  
  public void setFoundTime(String paramString)
  {
    this.foundTime = paramString;
  }
  
  public void setFriendlyName(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "setFriendlyName(): new Name = " + paramString + "; UDN: " + this.UDN);
    this.friendlyName = paramString;
  }
  
  public void setFwStatus(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Setting fwStatus: " + paramString + "; UDN: " + this.UDN);
    this.fwStatus = paramString;
  }
  
  public void setGroupCapabilities(String paramString)
  {
    this.groupCapabilities = paramString;
  }
  
  public void setGroupCapabilityID(String paramString)
  {
    this.groupCapabilityID = paramString;
  }
  
  public void setGroupID(String paramString)
  {
    this.groupID = paramString;
  }
  
  public void setGroupIcon(String paramString)
  {
    this.groupIcon = paramString;
  }
  
  public void setGroupName(String paramString)
  {
    this.groupName = paramString;
  }
  
  public void setGroupedDevices(HashMap<String, DeviceInformation> paramHashMap)
  {
    this.groupedDevices = paramHashMap;
  }
  
  public void setHide(int paramInt)
  {
    this.hide = paramInt;
  }
  
  public void setHomeID(String paramString)
  {
    this.homeID = paramString;
  }
  
  public void setHtml(String paramString)
  {
    this.html = paramString;
  }
  
  public void setHwVersion(String paramString)
  {
    this.hwVersion = paramString;
  }
  
  public void setID(int paramInt)
  {
    this.ID = paramInt;
  }
  
  public void setIP(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Setting IP: " + paramString + "; UDN: " + this.UDN);
    this.IP = paramString;
  }
  
  public void setIcon(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "setIcon(): Icon = " + paramString + "; UDN: " + this.UDN);
    this.icon = paramString;
  }
  
  public void setIconURL(String paramString)
  {
    this.iconURL = paramString;
  }
  
  public void setIconUploadId(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Setting Icon Upload ID: " + paramString);
    this.iconUploadId = paramString;
  }
  
  public void setIconVersion(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "setIconVersion(): new icon version = " + paramString + "; UDN: " + this.UDN);
    this.iconVersion = paramString;
  }
  
  public void setInActive(int paramInt)
  {
    this.inActive = paramInt;
  }
  
  public void setInfo(String paramString)
  {
    this.info = paramString;
  }
  
  public void setIsDiscovered(boolean paramBoolean)
  {
    this.isDiscovered = paramBoolean;
  }
  
  public void setIsGroupAction(String paramString)
  {
    this.isGroupAction = paramString;
  }
  
  public void setLEDGroupCapability(String paramString)
  {
    this.ledGroupCapability = paramString;
  }
  
  public void setLEDGroupID(int paramInt)
  {
    this.LEDGroupID = paramInt;
  }
  
  public void setLEDGroupName(String paramString)
  {
    this.LEDGroupName = paramString;
  }
  
  public void setLEDbridgeUDN(String paramString)
  {
    this.LEDbridgeUDN = paramString;
  }
  
  public void setLEDcapabilities(String paramString)
  {
    this.LEDCapabilities = paramString;
  }
  
  public void setLEDuniqueID(String paramString)
  {
    this.LEDUniqueID = paramString;
  }
  
  public void setLastEventTimeStamp(int paramInt)
  {
    this.lastEventTimeStamp = paramInt;
  }
  
  public void setLastSeen(String paramString)
  {
    this.lastSeen = paramString;
  }
  
  public void setLastTimestamp(String paramString)
  {
    this.lastTimestamp = paramString;
  }
  
  public void setMAC(String paramString)
  {
    this.mac = paramString;
  }
  
  public void setManufacturerName(String paramString)
  {
    this.manufacturerName = paramString;
  }
  
  public void setModelCode(String paramString)
  {
    this.modelCode = paramString;
  }
  
  public void setNeedIconUpdate(boolean paramBoolean)
  {
    this.needIconUpdate = paramBoolean;
  }
  
  public void setNotificationType(String paramString)
  {
    this.notificationType = paramString;
  }
  
  public void setParentExternalId(String paramString)
  {
    this.parentExternalId = paramString;
  }
  
  public void setParentName(String paramString)
  {
    this.parentName = paramString;
  }
  
  public void setPluginId(String paramString)
  {
    this.pluginID = paramString;
  }
  
  public void setPort(int paramInt)
  {
    SDKLogUtils.debugLog(this.TAG, "Setting Port: " + paramInt + "; UDN: " + this.UDN);
    this.port = paramInt;
  }
  
  public void setProductName(String paramString)
  {
    this.productName = paramString;
  }
  
  public void setProductType(String paramString)
  {
    this.productType = paramString;
  }
  
  public void setRemote(boolean paramBoolean)
  {
    this.isRemote = paramBoolean;
  }
  
  public void setRulesDBVersion(int paramInt)
  {
    this.rulesDBVersion = paramInt;
  }
  
  public void setSSID(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "setSSID(): new SSID = " + paramString + "; UDN: " + this.UDN);
    this.ssid = paramString;
  }
  
  public void setSerialNumber(String paramString)
  {
    this.serialNumber = paramString;
  }
  
  public void setSignalStrength(String paramString)
  {
    this.signalStrength = paramString;
  }
  
  public void setStartDiscoveryTime(long paramLong)
  {
    this.startDiscoveryTime = paramLong;
  }
  
  public void setState(int paramInt)
  {
    this.state = paramInt;
  }
  
  public void setStatusTS(int paramInt)
  {
    this.statusTS = paramInt;
  }
  
  public void setTimestamp()
  {
    this.timestamp = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date());
  }
  
  public void setTimestamp(String paramString)
  {
    this.timestamp = paramString;
  }
  
  public void setType(String paramString)
  {
    this.type = paramString;
  }
  
  public void setUDN(String paramString)
  {
    if (paramString != null) {}
    for (String str = DeviceListManager.getFilteredUDN(paramString);; str = "")
    {
      this.UDN = str;
      return;
    }
  }
  
  public void setWemoCertified(String paramString)
  {
    this.wemoCertified = paramString;
  }
  
  public void setWhichDiscovered(String paramString)
  {
    this.whichDiscovered = paramString;
  }
  
  public void setWhichFound(String paramString)
  {
    this.whichFound = paramString;
  }
  
  public void setZigbee(boolean paramBoolean)
  {
    this.zigbee = paramBoolean;
  }
  
  public String toString()
  {
    return "id: " + this.ID + " " + "udn: " + this.UDN + " " + "type: " + this.type + " " + "friendlyName: " + this.friendlyName + " " + "icon: " + this.icon + " " + "state: " + this.state + " " + "attributeList: " + this.attrList + " " + "inActive: " + this.inActive + " " + "modelName: " + this.modelCode + " " + "customized: " + this.customizedState + " " + "fwVersion: " + this.firmwareVersion + " " + "info: " + this.info + " " + "fwStatus: " + this.fwStatus + " " + "ip: " + this.IP + " " + "port: " + this.port + " " + "mac: " + this.mac + " " + "pluginID" + this.pluginID + " " + "homeID: " + this.homeID + " " + "lastSeen" + this.lastSeen + " " + "hide" + this.hide + "  Manufacturer:" + this.manufacturerName + " wemoCertified:" + this.wemoCertified + "productType:" + this.productType + "productName:" + this.productName + " bridgeUDN:" + this.bridgeUDN + "capabilities:" + this.capabilities + " statusTS:" + this.statusTS + "binaryState: " + this.binaryState + " groupID:" + this.groupID + " groupName:" + this.groupName + " capabilityvalue:" + this.capabilityvalue + " lastEventTimeStamp:" + this.lastEventTimeStamp + " capabilityID:" + this.capabilityID + " deviceIdAvailablity:" + this.deviceIdAvailablity + " isGroupAction:" + this.isGroupAction + "; groupIcon: " + this.groupIcon + "; Icon Version: " + this.iconVersion + "; rulesDBVersion: " + this.rulesDBVersion + "; serialNumber: " + this.serialNumber + "; notificationType: " + this.notificationType + "; signalStrength: " + this.signalStrength;
  }
  
  public void update(String paramString1, String paramString2, String paramString3, int paramInt1, String paramString4, int paramInt2, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, int paramInt3)
  {
    this.type = paramString1;
    this.friendlyName = paramString2;
    this.icon = paramString3;
    SDKLogUtils.debugLog(this.TAG, "Creating DeviceInformation instance. icon: " + paramString3);
    this.iconURL = paramString3;
    this.state = paramInt1;
    try
    {
      this.attrList = new JSONObject(paramString4);
      this.inActive = paramInt2;
      this.modelCode = paramString5;
      this.customizedState = paramString6;
      this.firmwareVersion = paramString7;
      this.info = paramString8;
      this.fwStatus = paramString9;
      this.lastSeen = paramString10;
      this.hide = paramInt3;
      if (this.inActive == 0)
      {
        this.isDiscovered = true;
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
      this.isDiscovered = false;
    }
  }
  
  private class GetIconURLActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private Action actionObj;
    
    private GetIconURLActionCallback(Action paramAction)
    {
      this.actionObj = paramAction;
    }
    
    public void onActionError(Exception paramException)
    {
      DeviceInformation.access$502(DeviceInformation.this, "");
      SDKLogUtils.errorLog(DeviceInformation.this.TAG, "Exception while icon url ", paramException);
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        ArgumentList localArgumentList = this.actionObj.getOutputArgumentList();
        if (localArgumentList.size() > 0)
        {
          String str = localArgumentList.getArgument(0).getValue();
          DeviceInformation.access$502(DeviceInformation.this, DeviceListManager.saveIconToStorage(str, DeviceInformation.this.mac, DeviceInformation.this.iconVersion));
          SDKLogUtils.infoLog(DeviceInformation.this.TAG, " iconURL: " + DeviceInformation.this.icon);
        }
        return;
      }
      onActionError(new InvalidActionException("ACTION is invalid!"));
    }
  }
  
  private class InsightGetActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private String actionName;
    private Action actionObj;
    
    private InsightGetActionCallback(Action paramAction, String paramString)
    {
      this.actionObj = paramAction;
      this.actionName = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      SDKLogUtils.errorLog(DeviceInformation.this.TAG, "Exception while getting insight attributes ", paramException);
      DeviceInformation.access$402(DeviceInformation.this, false);
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        SDKLogUtils.infoLog(DeviceInformation.this.TAG, "responseXMLStr - " + paramString);
        ArgumentList localArgumentList = this.actionObj.getOutputArgumentList();
        JSONObject localJSONObject1 = DeviceInformation.this.attrList;
        try
        {
          if (localArgumentList.size() == 1)
          {
            String[] arrayOfString2 = localArgumentList.getArgument(0).getValue().split("\\|");
            String[] arrayOfString3 = UpnpConstants.GET_INSIGHT_PARAMS_DATA;
            for (int i = 1; i < arrayOfString2.length; i++)
            {
              JSONObject localJSONObject2 = new JSONObject();
              localJSONObject2.put("value", arrayOfString2[i]);
              localJSONObject1.put(arrayOfString3[i], localJSONObject2);
            }
          }
          if (this.actionName.equals("GetInsightHomeSettings")) {}
          for (String[] arrayOfString1 = UpnpConstants.GET_INSIGHT_HOME_SETTINGS_DATA;; arrayOfString1 = UpnpConstants.GET_INSIGHT_EXPORT_DATA)
          {
            localJSONObject1 = DeviceInformation.this.parseActionResponseToJSON(localJSONObject1, localArgumentList.iterator(), arrayOfString1);
            DeviceInformation.this.setAttributeList(localJSONObject1);
            SDKLogUtils.infoLog(DeviceInformation.this.TAG, "INSIGHT PARAMS " + localJSONObject1.toString());
            return;
          }
          onActionError(new InvalidActionException("ACTION is invalid!" + this.actionName));
        }
        catch (Exception localException)
        {
          SDKLogUtils.errorLog(DeviceInformation.this.TAG, "Exception while getting insight attributes ", localException);
          return;
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/data/DeviceInformation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */