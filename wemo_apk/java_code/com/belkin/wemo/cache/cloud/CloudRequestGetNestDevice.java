package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.localsdk.parser.GetAttributeResponseParser;
import java.io.PrintStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CloudRequestGetNestDevice
  implements CloudRequestInterface
{
  private static final String KEY_ATTRIBUTE_LISTS = "attributeLists";
  private static final String KEY_CUSTOMIZED_STATE = "customizedState";
  private static final String KEY_DB_VERSION = "dbVersion";
  private static final String KEY_DEVICE_TAG = "device";
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_FW_STATUS = "fwUpgradeStatus";
  private static final String KEY_FW_VERSION = "firmwareVersion";
  private static final String KEY_HW_VERSION = "hwVersion";
  private static final String KEY_MAC_ADDRESS = "macAddress";
  private static final String KEY_MODEL_CODE = "modelCode";
  private static final String KEY_NOTIFICATION_TYPE = "notificationType";
  private static final String KEY_PARENT_EXTERNAL_ID = "parentExternalId";
  private static final String KEY_PARENT_NAME = "parentName";
  private static final String KEY_PLUGIN_ID = "pluginId";
  private static final String KEY_PRODUCT_NAME = "productName";
  private static final String KEY_PRODUCT_TYPE = "productType";
  private static final String KEY_SERIAL_NUMBER = "serialNumber";
  private static final String KEY_SIGNAL_STRENGTH = "signalStrength";
  private static final String KEY_STATUS = "status";
  private static final String KEY_UDN = "uniqueId";
  private final String TAG = CloudRequestGetNestDevice.class.getSimpleName();
  private int TIMEOUT = 20000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/remoteHomeDevices/";
  private CacheManager cacheManager;
  private String cloudURL;
  private DevicesArray devicesArray;
  private ArrayList<DeviceInformation> devicesList = null;
  private Context mContext;
  private DeviceListManager mDevMgr;
  public SharePreferences mSharePreference;
  
  public CloudRequestGetNestDevice(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    this.mContext = paramContext;
    this.mDevMgr = paramDeviceListManager;
    CloudAuth localCloudAuth = new CloudAuth(this.mContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID());
    this.cacheManager = CacheManager.getInstance(paramContext);
    this.devicesArray = DevicesArray.getInstance(paramContext);
    SDKLogUtils.infoLog(this.TAG, "Nest URL " + this.cloudURL);
    this.mSharePreference = new SharePreferences(this.mContext);
  }
  
  private static String nodeToString(Node paramNode)
  {
    StringWriter localStringWriter = new StringWriter();
    try
    {
      Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
      localTransformer.setOutputProperty("omit-xml-declaration", "yes");
      localTransformer.setOutputProperty("indent", "yes");
      localTransformer.transform(new DOMSource(paramNode), new StreamResult(localStringWriter));
      return localStringWriter.toString();
    }
    catch (TransformerException localTransformerException)
    {
      for (;;)
      {
        System.out.println("nodeToString Transformer Exception");
      }
    }
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      this.devicesList = new ArrayList();
      XMLParser localXMLParser = new XMLParser();
      NodeList localNodeList1 = localXMLParser.getDomElement(paramString).getElementsByTagName("device");
      DeviceInformation localDeviceInformation = null;
      for (int i = 0;; i++)
      {
        int j = localNodeList1.getLength();
        if (i >= j) {
          break;
        }
        Element localElement = (Element)localNodeList1.item(i);
        String str1 = localXMLParser.getValue(localElement, "modelCode");
        String str2 = localXMLParser.getValue(localElement, "pluginId");
        String str3 = localXMLParser.getValue(localElement, "uniqueId");
        String str4 = localXMLParser.getValue(localElement, "macAddress");
        String str5 = localXMLParser.getValue(localElement, "serialNumber");
        String str6 = localXMLParser.getValue(localElement, "productType");
        String str7 = localXMLParser.getValue(localElement, "productName");
        String str8 = localXMLParser.getValue(localElement, "notificationType");
        String str9 = localXMLParser.getValue(localElement, "hwVersion");
        String str10 = localXMLParser.getValue(localElement, "signalStrength");
        String str11 = localXMLParser.getValue(localElement, "dbVersion");
        String str12 = localXMLParser.getValue(localElement, "friendlyName");
        String str13 = localXMLParser.getValue(localElement, "fwUpgradeStatus");
        String str14 = localXMLParser.getValue(localElement, "firmwareVersion");
        String str15 = localXMLParser.getValue(localElement, "status");
        String str16 = localXMLParser.getValue(localElement, "customizedState");
        String str17 = localXMLParser.getValue(localElement, "parentName");
        String str18 = localXMLParser.getValue(localElement, "parentExternalId");
        SDKLogUtils.infoLog(this.TAG, " friendlyName: " + str12);
        String str19 = str12.replaceAll("'", "&#39;");
        String str20 = str17.replaceAll("'", "&#39;");
        SDKLogUtils.infoLog(this.TAG, " friendlyName: " + str19);
        SDKLogUtils.infoLog(this.TAG, "Nest modelCode: " + str1 + " :pluginId: " + str2 + " :macAddress: " + str4 + " :serialNumber: " + str5 + " :productType: " + str6 + " :productName: " + str7 + " :notificationType: " + str8 + " :hwVersion: " + str9 + " :signalStrength: " + str10 + " :dbVersion: " + str11 + " :udn: " + str3);
        String str21 = new SharePreferences(this.mContext).getHomeId();
        DeviceListManager localDeviceListManager = DeviceListManager.devListManager;
        if (localDeviceListManager == null) {
          localDeviceListManager = DeviceListManager.getInstance(this.mContext);
        }
        Map localMap = localDeviceListManager.getDeviceInformationList();
        if (localMap != null) {
          localDeviceInformation = (DeviceInformation)localMap.get(str3);
        }
        if (localDeviceInformation == null)
        {
          SDKLogUtils.infoLog(this.TAG, "Nest device is null creating new object ");
          localDeviceInformation = new DeviceInformation(str3, str21, str4, str2);
        }
        if ((localDeviceInformation != null) && (localDeviceInformation.getUDN().length() > 0))
        {
          localDeviceInformation.setFriendlyName(str19);
          localDeviceInformation.setModelCode(str1);
          localDeviceInformation.setType(str1);
          localDeviceInformation.setProductName(str7);
          localDeviceInformation.setProductType(str6);
          localDeviceInformation.setHwVersion(str9);
          if (!str11.equals("")) {
            localDeviceInformation.setRulesDBVersion(Integer.valueOf(str11).intValue());
          }
          localDeviceInformation.setSignalStrength(str10);
          localDeviceInformation.setNotificationType(str8);
          localDeviceInformation.setSerialNumber(str5);
          localDeviceInformation.setParentName(str20);
          localDeviceInformation.setParentExternalId(str18);
          localDeviceInformation.setFwStatus(str13);
          localDeviceInformation.setFirmwareVersion(str14);
          localDeviceInformation.setStatusTS(Integer.parseInt(str15));
          localDeviceInformation.setPluginId(str2);
          localDeviceInformation.setFriendlyName(str19);
          localDeviceInformation.setCustomizedState(str16);
          localDeviceInformation.setHwVersion(str9);
          localDeviceInformation.setIsDiscovered(true);
          localDeviceInformation.setInActive(0);
        }
        NodeList localNodeList2 = localElement.getElementsByTagName("attributeLists");
        for (int k = 0;; k++)
        {
          int m = localNodeList2.getLength();
          if (k >= m) {
            break;
          }
          SDKLogUtils.debugLog(this.TAG, "Nest GET ATTRIBUTES. Attr: " + nodeToString(localNodeList2.item(k)));
        }
        if ((localElement.getElementsByTagName("attributeLists") != null) && (localElement.getElementsByTagName("attributeLists").getLength() > 0))
        {
          Node localNode = localElement.getElementsByTagName("attributeLists").item(0);
          if (localNode != null)
          {
            JSONObject localJSONObject = new GetAttributeResponseParser().parseGetAttributeResponse(nodeToString(localNode));
            SDKLogUtils.infoLog(this.TAG, "Nest attributeList" + localJSONObject);
            if (localJSONObject != null) {
              localDeviceInformation.setAttributeList(localJSONObject);
            }
          }
        }
        if (localDeviceInformation != null)
        {
          SDKLogUtils.infoLog(this.TAG, "Nest device updated:" + localDeviceInformation);
          this.devicesList.add(localDeviceInformation);
        }
      }
      return true;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return null;
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 2;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 40000;
  }
  
  public String getURL()
  {
    return this.cloudURL;
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
    SDKLogUtils.infoLog(this.TAG, "Nest Response success: " + paramBoolean);
    boolean bool;
    if (paramBoolean) {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(this.TAG, "Nest: " + str1);
        bool = parseResponse(str1);
        SDKLogUtils.infoLog(this.TAG, "Nest Response parse: " + String.valueOf(bool));
        Iterator localIterator2 = this.devicesList.iterator();
        while (localIterator2.hasNext())
        {
          DeviceInformation localDeviceInformation5 = (DeviceInformation)localIterator2.next();
          SDKLogUtils.infoLog(this.TAG, "Nest dev udn:" + localDeviceInformation5.getUDN() + " isDiscovered:" + localDeviceInformation5.getIsDiscovered());
          continue;
          return;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "Nest Request error: ", localUnsupportedEncodingException);
      }
    }
    for (;;)
    {
      if (bool)
      {
        List localList = this.mDevMgr.getDeviceUDNListFromDB();
        SDKLogUtils.infoLog(this.TAG, "No. of nest devices in home : " + this.devicesList.size());
        Iterator localIterator3 = this.devicesList.iterator();
        while (localIterator3.hasNext())
        {
          DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator3.next();
          localList.remove(localDeviceInformation2.getUDN());
          this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation2);
          DeviceInformation localDeviceInformation3 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation2.getUDN(), false, true, true);
          if (localDeviceInformation3 != null)
          {
            localDeviceInformation2.setID(localDeviceInformation3.getID());
            this.cacheManager.updateDB(localDeviceInformation2, false, true, true);
          }
          for (;;)
          {
            DeviceInformation localDeviceInformation4 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation2.getUDN(), false, false, true);
            if (localDeviceInformation4 == null) {
              break label507;
            }
            localDeviceInformation2.setID(localDeviceInformation4.getID());
            this.cacheManager.updateDB(localDeviceInformation2, false, false, true);
            SDKLogUtils.infoLog(this.TAG, "Nest sending update notification " + localDeviceInformation2.getUDN() + " name:" + localDeviceInformation2.getFriendlyName());
            this.mDevMgr.sendNotification("update", "", localDeviceInformation2.getUDN());
            break;
            this.cacheManager.addDeviceToDB(localDeviceInformation2, false, true, true);
            if (this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation2.getUDN(), true, false, false) == null) {
              this.mDevMgr.addDeviceWithOnlyUDNToLocalOrRemoteTable(localDeviceInformation2.getUDN(), true, false);
            }
          }
          label507:
          this.cacheManager.addDeviceToDB(localDeviceInformation2, false, false, true);
          SDKLogUtils.infoLog(this.TAG, " Nest sending add notification " + localDeviceInformation2.getUDN() + " name:" + localDeviceInformation2.getFriendlyName());
          this.mDevMgr.sendNotification("add", "", localDeviceInformation2.getUDN());
        }
        if (!localList.isEmpty())
        {
          Iterator localIterator4 = localList.iterator();
          while (localIterator4.hasNext())
          {
            String str2 = (String)localIterator4.next();
            if (str2.contains("WEMO00"))
            {
              SDKLogUtils.errorLog(this.TAG, "Nest DB Device NOT found in via CLOUD API. Device shall be removed from DB and device list. UDN: " + str2);
              this.mDevMgr.sendNotification("remove", "", str2);
              DevicesArray.getInstance(this.mContext).deleteDeviceInformation(str2);
              CacheManager.getInstance(this.mContext).deleteDeviceFromDB(str2, true, true, true);
            }
          }
        }
        new MoreUtil().copyDbToDownloadDirectory("cache.db", this.mContext);
        return;
      }
      SDKLogUtils.infoLog(this.TAG, "DEVICELIST is NULL");
      return;
      ArrayList localArrayList = this.mDevMgr.getDeviceInformationFromDB(false, false, true);
      if (localArrayList != null)
      {
        Iterator localIterator1 = localArrayList.iterator();
        while (localIterator1.hasNext())
        {
          DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
          SDKLogUtils.infoLog(this.TAG, "Nest dev udn:" + localDeviceInformation1.getUDN() + " isDiscovered:" + localDeviceInformation1.getIsDiscovered());
          if (localDeviceInformation1.getUDN().contains("WEMO00"))
          {
            localDeviceInformation1.setIsDiscovered(false);
            localDeviceInformation1.setInActive(1);
            this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation1);
            this.cacheManager.updateDB(localDeviceInformation1, false, false, true);
            this.mDevMgr.setUnicastFailedForAnyDevice(true);
            this.mDevMgr.sendNotification("update", "", localDeviceInformation1.getUDN());
          }
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetNestDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */