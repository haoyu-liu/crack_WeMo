package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class SetZigbeeDeviceStateRunnable
  extends WeMoRunnable
{
  private String bridgeUDN = "";
  private String capabilityID;
  private String capabilityName;
  private String capabilityValue;
  private Context context;
  private DeviceListManager devListManager;
  private String deviceId;
  private String isGroupAction = "NO";
  private DeviceInformation mDeviceInfo;
  private String tag = "SetZigbeeDeviceStateRunnable";
  
  public SetZigbeeDeviceStateRunnable(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.capabilityID = paramString1;
    this.capabilityName = paramString2;
    this.capabilityValue = paramString3;
    this.bridgeUDN = paramString4;
    this.deviceId = paramString5;
    this.isGroupAction = paramString6;
  }
  
  private String domXml(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    String str = null;
    try
    {
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
      Element localElement1 = localDocument.createElement("DeviceStatus");
      localDocument.appendChild(localElement1);
      if (paramString2.contains(","))
      {
        String[] arrayOfString = paramString2.split(",");
        for (int i = 0; i < arrayOfString.length; i++)
        {
          Element localElement6 = localDocument.createElement("IsGroupAction");
          localElement6.appendChild(localDocument.createTextNode(paramString4));
          localElement1.appendChild(localElement6);
          Element localElement7 = localDocument.createElement("DeviceID");
          localElement7.appendChild(localDocument.createTextNode(arrayOfString[i]));
          localElement1.appendChild(localElement7);
          Attr localAttr2 = localDocument.createAttribute("available");
          localAttr2.setValue("YES");
          localElement7.setAttributeNode(localAttr2);
          Element localElement8 = localDocument.createElement("CapabilityID");
          localElement8.appendChild(localDocument.createTextNode(paramString3));
          localElement1.appendChild(localElement8);
          Element localElement9 = localDocument.createElement("CapabilityValue");
          localElement9.appendChild(localDocument.createTextNode(paramString1));
          localElement1.appendChild(localElement9);
        }
      }
      Element localElement2 = localDocument.createElement("IsGroupAction");
      localElement2.appendChild(localDocument.createTextNode(paramString4));
      localElement1.appendChild(localElement2);
      Element localElement3 = localDocument.createElement("DeviceID");
      localElement3.appendChild(localDocument.createTextNode(paramString2));
      localElement1.appendChild(localElement3);
      Attr localAttr1 = localDocument.createAttribute("available");
      localAttr1.setValue("YES");
      localElement3.setAttributeNode(localAttr1);
      Element localElement4 = localDocument.createElement("CapabilityID");
      localElement4.appendChild(localDocument.createTextNode(paramString3));
      localElement1.appendChild(localElement4);
      Element localElement5 = localDocument.createElement("CapabilityValue");
      localElement5.appendChild(localDocument.createTextNode(paramString1));
      localElement1.appendChild(localElement5);
      Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
      StringWriter localStringWriter = new StringWriter();
      StreamResult localStreamResult = new StreamResult(localStringWriter);
      DOMSource localDOMSource = new DOMSource(localDocument);
      localTransformer.transform(localDOMSource, localStreamResult);
      str = localStringWriter.toString();
      Log.d(this.TAG, "File saved!" + str);
      return str;
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      localParserConfigurationException.printStackTrace();
      return str;
    }
    catch (TransformerException localTransformerException)
    {
      localTransformerException.printStackTrace();
    }
    return str;
  }
  
  private void processResult(Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      if ((TextUtils.isEmpty(this.isGroupAction)) || (!this.isGroupAction.equalsIgnoreCase("YES"))) {
        break label251;
      }
      ArrayList localArrayList = CacheManager.getInstance(this.context).getDevicesForGroup(this.deviceId);
      SDKLogUtils.infoLog(this.TAG, "grouped devices:" + localArrayList.size());
      if (localArrayList.size() > 0)
      {
        Iterator localIterator = localArrayList.iterator();
        while (localIterator.hasNext())
        {
          DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator.next();
          this.devListManager.updateZigbeeCapability(localDeviceInformation2.getUDN(), this.capabilityID, this.capabilityValue);
          SDKLogUtils.infoLog(this.TAG, "updated cache and db for :" + localDeviceInformation2.getUDN());
        }
        SDKLogUtils.infoLog(this.TAG, "sending positive notification :" + paramBoolean);
        DeviceListManager localDeviceListManager3 = this.devListManager;
        localDeviceListManager3.sendNotification("set_state", Boolean.toString(paramBoolean.booleanValue()), this.deviceId);
      }
    }
    else
    {
      return;
    }
    DeviceListManager localDeviceListManager2 = this.devListManager;
    localDeviceListManager2.sendNotification("set_state", Boolean.toString(false), this.deviceId);
    return;
    label251:
    DeviceInformation localDeviceInformation1 = DevicesArray.getInstance(this.context).getDeviceInformation(this.deviceId);
    SDKLogUtils.infoLog(this.TAG, "device info :" + localDeviceInformation1);
    if (!localDeviceInformation1.getCapabilities().isEmpty()) {
      this.devListManager.updateZigbeeCapability(localDeviceInformation1.getUDN(), this.capabilityID, this.capabilityValue);
    }
    for (;;)
    {
      DeviceListManager localDeviceListManager1 = this.devListManager;
      localDeviceListManager1.sendNotification("set_state", Boolean.toString(paramBoolean.booleanValue()), localDeviceInformation1.getUDN());
      return;
      SDKLogUtils.infoLog(this.TAG, "capabilities or state is empty:");
    }
  }
  
  public void run()
  {
    Boolean.valueOf(true);
    this.mDeviceInfo = DevicesArray.getInstance(this.context).getDeviceInformation(this.bridgeUDN);
    Device localDevice;
    if (this.mDeviceInfo != null)
    {
      localDevice = this.mDeviceInfo.getDevice();
      if (localDevice == null)
      {
        SDKLogUtils.infoLog(this.TAG, "ZigBeeDeviceStateSetter device is null");
        ControlPoint localControlPoint = this.devListManager.getUpnpControl();
        if (localControlPoint != null) {
          localDevice = localControlPoint.getDevice(this.bridgeUDN);
        }
      }
      SDKLogUtils.infoLog(this.TAG, "ZigBeeDeviceStateSetter mDeviceInfo.getDevice()::" + this.mDeviceInfo.getDevice() + " UDN: " + this.bridgeUDN + " state:" + this.capabilityValue);
      if (localDevice == null) {}
    }
    for (;;)
    {
      try
      {
        localAction = localDevice.getAction("SetDeviceStatus");
        if (localAction == null)
        {
          this.devListManager.updateDeviceDiscovery(this.deviceId);
          processResult(Boolean.valueOf(false));
          return;
        }
        DeviceListManager localDeviceListManager = this.devListManager;
        String[] arrayOfString1 = UpnpConstants.SET_LED_DEVICE_STATUS_SINGLE;
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = domXml(this.capabilityValue, this.deviceId, this.capabilityID, this.isGroupAction);
        localDeviceListManager.setArgument(localAction, arrayOfString1, arrayOfString2);
        SDKLogUtils.infoLog(this.TAG, "SetZigbeeDeviceStateRunnable Action:" + localAction);
      }
      catch (Exception localException1)
      {
        Action localAction;
        String str;
        Boolean localBoolean2;
        Boolean localBoolean3;
        Boolean localBoolean1;
        localException1.printStackTrace();
        this.devListManager.updateDeviceDiscovery(this.deviceId);
        localObject = Boolean.valueOf(false);
        continue;
      }
      try
      {
        str = localAction.postControlAction();
        SDKLogUtils.infoLog(this.TAG, "SetZigbeeDeviceStateRunnable action response)::" + str);
        if ((str != null) && (!str.contains(this.deviceId))) {
          continue;
        }
        localBoolean2 = Boolean.valueOf(false);
        localObject = localBoolean2;
      }
      catch (Exception localException2)
      {
        SDKLogUtils.errorLog(this.TAG, "SetZigbeeDeviceStateRunnable postControlAction exception", localException2);
        localBoolean1 = Boolean.valueOf(false);
        localObject = localBoolean1;
        continue;
      }
      processResult((Boolean)localObject);
      return;
      localBoolean3 = Boolean.valueOf(true);
      Object localObject = localBoolean3;
      continue;
      SDKLogUtils.errorLog(this.TAG, "SetZigbeeDeviceStateRunnable: Device object is NULL for bridge UDN: " + this.bridgeUDN);
      this.devListManager.updateDeviceDiscovery(this.deviceId);
      localObject = Boolean.valueOf(false);
      continue;
      SDKLogUtils.errorLog(this.TAG, "SetZigbeeDeviceStateRunnable: DeviceInformation is NULL for bridge UDN: " + this.bridgeUDN);
      localObject = Boolean.valueOf(false);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */