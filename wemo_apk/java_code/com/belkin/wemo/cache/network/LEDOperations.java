package com.belkin.wemo.cache.network;

import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class LEDOperations
  extends WeMoRunnable
{
  private final String CREATE_GROUP = "CreateGroup";
  private final String REMOVE_GROUP = "RemoveGroup";
  private String bridgeUDN;
  private StringBuilder capabilityIDs;
  private StringBuilder capabilityValues;
  private Device device;
  private JSONObject deviceCapabilities;
  private JSONArray deviceIDs;
  private String groupIcon;
  private String groupName;
  private JSONObject groupProperties;
  private boolean isNewGroup = false;
  private CacheManager mCacheManager;
  private DeviceInformation mDeviceInfo;
  private DeviceListManager mDeviceListManager = null;
  private DevicesArray mDevicesArray;
  private String mGroupId;
  private String operation;
  private String removedDeviceID = "";
  private String tag = "LEDOperations";
  
  public LEDOperations(String paramString1, String paramString2, int paramInt)
  {
    this.operation = paramString1;
    this.bridgeUDN = paramString2;
    this.mGroupId = Integer.toString(paramInt);
  }
  
  public LEDOperations(String paramString1, String paramString2, JSONObject paramJSONObject, Boolean paramBoolean)
  {
    this.operation = paramString1;
    this.bridgeUDN = paramString2;
    this.groupProperties = paramJSONObject;
    this.isNewGroup = paramBoolean.booleanValue();
  }
  
  private String generateActionXMLInput(JSONArray paramJSONArray, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    String str1 = null;
    try
    {
      ArrayList localArrayList = new ArrayList();
      StringBuffer localStringBuffer = new StringBuffer();
      for (int i = 0; i < paramJSONArray.length(); i++)
      {
        localStringBuffer.append(paramJSONArray.get(i).toString());
        if (i < -1 + paramJSONArray.length()) {
          localStringBuffer.append(",");
        }
        localArrayList.add(paramJSONArray.get(i).toString());
      }
      String str2 = localStringBuffer.toString();
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
      Element localElement1 = localDocument.createElement("CreateGroup");
      localDocument.appendChild(localElement1);
      Element localElement2 = localDocument.createElement("GroupID");
      localElement2.appendChild(localDocument.createTextNode(paramString4));
      localElement1.appendChild(localElement2);
      Element localElement3 = localDocument.createElement("GroupName");
      localElement3.appendChild(localDocument.createTextNode(paramString3));
      localElement1.appendChild(localElement3);
      Element localElement4 = localDocument.createElement("DeviceIDList");
      localElement4.appendChild(localDocument.createTextNode(str2));
      localElement1.appendChild(localElement4);
      Element localElement5 = localDocument.createElement("GroupCapabilityIDs");
      localElement5.appendChild(localDocument.createTextNode(paramString1));
      localElement1.appendChild(localElement5);
      Element localElement6 = localDocument.createElement("GroupCapabilityValues");
      localElement6.appendChild(localDocument.createTextNode(paramString2));
      localElement1.appendChild(localElement6);
      Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
      StringWriter localStringWriter = new StringWriter();
      StreamResult localStreamResult = new StreamResult(localStringWriter);
      DOMSource localDOMSource = new DOMSource(localDocument);
      localTransformer.transform(localDOMSource, localStreamResult);
      str1 = localStringWriter.toString();
      SDKLogUtils.debugLog(this.tag, "File saved!" + str1);
      return str1;
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      localParserConfigurationException.printStackTrace();
      return str1;
    }
    catch (TransformerException localTransformerException)
    {
      localTransformerException.printStackTrace();
      return str1;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return str1;
  }
  
  private void processResult(Boolean paramBoolean)
  {
    SDKLogUtils.infoLog(this.tag, "result is :" + paramBoolean);
    if (this.operation.equalsIgnoreCase("CreateGroup"))
    {
      if (paramBoolean.booleanValue())
      {
        i = 0;
        for (;;)
        {
          if (i >= this.deviceIDs.length()) {
            break label177;
          }
          try
          {
            str = this.deviceIDs.getString(i);
            localDeviceInformation3 = this.mDeviceListManager.updateZigbeeCapabilities(str, this.deviceCapabilities);
            localDeviceInformation3.setGroupID(this.mGroupId);
            localDeviceInformation3.setGroupName(this.groupName);
            if (this.groupIcon.isEmpty()) {
              this.groupIcon = WemoUtils.getZigbeeIcon(localDeviceInformation3.getManufacturerName(), localDeviceInformation3.getModelCode());
            }
            localDeviceInformation3.setGroupIcon(this.groupIcon);
            this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation3);
            this.mCacheManager.updateDB(localDeviceInformation3, false, false, true);
            i++;
          }
          catch (JSONException localJSONException)
          {
            for (;;)
            {
              localJSONException.printStackTrace();
            }
          }
        }
        label177:
        if ((this.removedDeviceID != null) && (!this.removedDeviceID.isEmpty()))
        {
          localDeviceInformation2 = this.mDeviceListManager.getDeviceInformationFromDevicesArray(this.removedDeviceID);
          localDeviceInformation2.setGroupID("");
          localDeviceInformation2.setGroupName("");
          this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation2);
          this.mCacheManager.updateDB(localDeviceInformation2, false, false, true);
        }
      }
      this.mDeviceListManager.sendNotification("set_state", Boolean.toString(paramBoolean.booleanValue()), this.bridgeUDN);
    }
    while (!this.operation.equalsIgnoreCase("RemoveGroup"))
    {
      int i;
      String str;
      DeviceInformation localDeviceInformation3;
      DeviceInformation localDeviceInformation2;
      return;
    }
    if (paramBoolean.booleanValue())
    {
      ArrayList localArrayList = this.mCacheManager.getDevicesForGroup(this.mGroupId);
      SDKLogUtils.infoLog(this.tag, "removing devices:" + localArrayList.size());
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator.next();
        localDeviceInformation1.setGroupID("");
        localDeviceInformation1.setGroupName("");
        this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation1);
        this.mCacheManager.updateDB(localDeviceInformation1, false, false, true);
        SDKLogUtils.infoLog(this.tag, "updated cache and db for :" + localDeviceInformation1.getUDN());
      }
    }
    this.mDeviceListManager.sendNotification("set_state", Boolean.toString(paramBoolean.booleanValue()), this.bridgeUDN);
  }
  
  private void setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    SDKLogUtils.infoLog(this.tag, "in setArguments::" + paramArrayOfString1.length + "::values len:" + paramArrayOfString2.length);
    if ((paramAction != null) && (paramArrayOfString1 != null) && (paramArrayOfString2 != null)) {
      for (int i = 0; i < paramArrayOfString1.length; i++)
      {
        SDKLogUtils.infoLog(this.tag, "setArguments key:" + paramArrayOfString1[i] + "::values:" + paramArrayOfString2[i]);
        paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      }
    }
  }
  
  private void updateCapabilities()
  {
    this.capabilityIDs = new StringBuilder("");
    this.capabilityValues = new StringBuilder("");
    LinkedHashMap localLinkedHashMap = DeviceListManager.capabalityProfileList;
    do
    {
      try
      {
        Iterator localIterator = new ArrayList(Arrays.asList(new String[] { "10008", "10006", "10300", "30008", "30009", "3000A", "30301", "10500", "20500", "30501", "20502" })).iterator();
        while (localIterator.hasNext())
        {
          String str1 = (String)localIterator.next();
          String str2 = (String)localLinkedHashMap.get(str1);
          if (this.deviceCapabilities.has(str2))
          {
            this.capabilityIDs = this.capabilityIDs.append(str1).append(",");
            String str3 = (String)this.deviceCapabilities.get(str2);
            this.capabilityValues = this.capabilityValues.append(str3).append(",");
          }
        }
        if (this.capabilityIDs.length() <= 0) {
          continue;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
      this.capabilityIDs.deleteCharAt(-1 + this.capabilityIDs.length());
    } while (this.capabilityValues.length() <= 0);
    this.capabilityValues.deleteCharAt(-1 + this.capabilityValues.length());
  }
  
  public void run()
  {
    this.mDeviceListManager = DeviceListManager.devListManager;
    this.mCacheManager = CacheManager.getInstance(DeviceListManager.context);
    Object localObject = Boolean.valueOf(true);
    this.mDevicesArray = DevicesArray.getInstance();
    this.mDeviceInfo = this.mDevicesArray.getDeviceInformation(this.bridgeUDN);
    if (this.mDeviceInfo != null)
    {
      this.device = this.mDeviceInfo.getDevice();
      if (this.device == null)
      {
        SDKLogUtils.infoLog(this.tag, "device is null");
        this.device = this.mDeviceListManager.getUpnpControl().getDevice(this.bridgeUDN);
      }
      if ((!this.operation.equalsIgnoreCase("CreateGroup")) || (this.groupProperties == null)) {
        break label606;
      }
      for (;;)
      {
        try
        {
          this.groupName = this.groupProperties.getString("groupName");
          this.mGroupId = this.groupProperties.getString("groupID");
          this.groupIcon = this.groupProperties.getString("groupIcon");
          this.deviceCapabilities = this.groupProperties.getJSONObject("deviceCapabilities");
          this.deviceIDs = this.groupProperties.getJSONArray("deviceID");
          if (this.isNewGroup) {
            continue;
          }
          ArrayList localArrayList = this.mCacheManager.getDevicesForGroup(this.mGroupId);
          if ((localArrayList == null) || (localArrayList.size() <= 0) || (localArrayList.size() <= this.deviceIDs.length())) {
            continue;
          }
          SDKLogUtils.infoLog(this.tag, "removing device from existing group");
          Iterator localIterator = localArrayList.iterator();
          if (!localIterator.hasNext()) {
            continue;
          }
          localDeviceInformation = (DeviceInformation)localIterator.next();
          i = 0;
        }
        catch (JSONException localJSONException)
        {
          try
          {
            DeviceInformation localDeviceInformation;
            int i;
            int j;
            int k;
            int m;
            Action localAction2 = this.device.getAction("CreateGroup");
            if (localAction2 == null)
            {
              processResult(Boolean.valueOf(false));
              return;
              processResult(Boolean.valueOf(false));
              return;
              i++;
              continue;
              localJSONException = localJSONException;
              localJSONException.printStackTrace();
              continue;
            }
            String[] arrayOfString3 = UpnpConstants.CREATE_GROUP_ARGS;
            String[] arrayOfString4 = new String[1];
            arrayOfString4[0] = generateActionXMLInput(this.deviceIDs, this.capabilityIDs.toString(), this.capabilityValues.toString(), this.groupName, this.mGroupId);
            setArgument(localAction2, arrayOfString3, arrayOfString4);
            SDKLogUtils.infoLog(this.tag, "Action:" + localAction2);
            String str2;
            processResult(Boolean.valueOf(false));
          }
          catch (Exception localException3)
          {
            try
            {
              str2 = localAction2.postControlAction();
              SDKLogUtils.infoLog(this.tag, "action response)::" + str2);
              if ((str2 != null) && (!str2.contains("0"))) {
                break label777;
              }
              processResult(Boolean.valueOf(false));
              return;
            }
            catch (Exception localException4)
            {
              processResult(Boolean.valueOf(false));
              return;
            }
            localException3 = localException3;
            localException3.printStackTrace();
            processResult(Boolean.valueOf(false));
            return;
          }
          return;
        }
        j = this.deviceIDs.length();
        k = i;
        m = 0;
        if (k < j)
        {
          if (!this.deviceIDs.getString(i).equalsIgnoreCase(localDeviceInformation.getUDN())) {
            continue;
          }
          m = 1;
        }
        if (m == 0)
        {
          this.removedDeviceID = localDeviceInformation.getUDN();
          SDKLogUtils.infoLog(this.tag, "removedDeviceID:" + this.removedDeviceID);
        }
      }
      updateCapabilities();
      if (this.device == null) {
        break label597;
      }
    }
    label597:
    label606:
    Action localAction1;
    if (this.operation.equalsIgnoreCase("RemoveGroup"))
    {
      if (this.device != null)
      {
        try
        {
          localAction1 = this.device.getAction("DeleteGroup");
          if (localAction1 == null)
          {
            processResult(Boolean.valueOf(false));
            return;
          }
        }
        catch (Exception localException1)
        {
          localException1.printStackTrace();
          processResult(Boolean.valueOf(false));
          return;
        }
        String[] arrayOfString1 = UpnpConstants.ARGS_GROUPID;
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = this.mGroupId;
        setArgument(localAction1, arrayOfString1, arrayOfString2);
        SDKLogUtils.infoLog(this.tag, "Action:" + localAction1);
      }
    }
    else {
      try
      {
        String str1 = localAction1.postControlAction();
        SDKLogUtils.infoLog(this.tag, "action response::" + str1);
        if ((str1 == null) || (str1.contains("0")))
        {
          Boolean localBoolean = Boolean.valueOf(false);
          localObject = localBoolean;
        }
        label777:
        processResult((Boolean)localObject);
        return;
      }
      catch (Exception localException2)
      {
        processResult(Boolean.valueOf(false));
        return;
      }
    }
    processResult(Boolean.valueOf(false));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/network/LEDOperations.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */