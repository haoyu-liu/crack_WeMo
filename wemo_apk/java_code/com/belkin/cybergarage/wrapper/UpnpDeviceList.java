package com.belkin.cybergarage.wrapper;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.text.TextUtils;
import com.belkin.beans.FirmwareVersionResponseBean;
import com.belkin.beans.MetaDataResponseBean;
import com.belkin.beans.SignalStrengthResponseBean;
import com.belkin.beans.ValueFromSoapResponse;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.DevicePlugin;
import com.belkin.devices.callback.GetDataStoreOnLinkCallBack;
import com.belkin.devices.callback.SetDataStoreOnLinkCallBack;
import com.belkin.devices.callback.SetDeviceNameOnLinkCallBack;
import com.belkin.exception.DatabaseException;
import com.belkin.rules.beans.RulesDBPathResponseBean;
import com.belkin.rules.beans.RulesDBVersionResponseBean;
import com.belkin.upnp.parser.DeletePresetResponseParser;
import com.belkin.upnp.parser.GenericGetAttributeResponseParser;
import com.belkin.upnp.parser.GetCreateGroupResponseParser;
import com.belkin.upnp.parser.GetDataStoreResponseParser;
import com.belkin.upnp.parser.GetDeviceCapabilitiesResponse;
import com.belkin.upnp.parser.GetDeviceListStatusResponse;
import com.belkin.upnp.parser.GetEndDeviceListResponse;
import com.belkin.upnp.parser.GetLedProfileIDResponseParser;
import com.belkin.upnp.parser.GetLedProfileListResponse;
import com.belkin.upnp.parser.GetPresetResponseParser;
import com.belkin.upnp.parser.GetRulesResponseParser;
import com.belkin.upnp.parser.LedDeviceResponseParser;
import com.belkin.upnp.parser.Parser;
import com.belkin.upnp.parser.RegistrationDataResponseParser;
import com.belkin.upnp.parser.RemoteAccessResponseParser;
import com.belkin.upnp.parser.SetBlobStorageResponseParser;
import com.belkin.upnp.parser.SetDataStoreResponseParser;
import com.belkin.upnp.parser.SetMultipleDeviceNameResponseParser;
import com.belkin.upnp.parser.SetPresetResponseParser;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.utils.UploadFileUtil;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import com.belkin.wemo.localsdk.WeMoDevice;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.utils.WeMoUtils;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Argument;
import org.cybergarage.upnp.ArgumentList;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.cybergarage.upnp.Service;
import org.cybergarage.upnp.ServiceList;
import org.cybergarage.upnp.device.DeviceChangeListener;
import org.cybergarage.upnp.device.NotifyListener;
import org.cybergarage.upnp.device.SearchResponseListener;
import org.cybergarage.upnp.event.EventListener;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class UpnpDeviceList
  extends UpnpDeviceBase
  implements SearchResponseListener, EventListener, NotifyListener, DeviceChangeListener
{
  private static final String BULB_UPGRADE = "0";
  private static final String FWUPDATETAG = "FIRMWARE UPGRADE";
  public static final String SET_STATE = "set_state";
  private static final String TAG = "UpnpDeviceList";
  private static HashMap<String, String> udnIcons = new HashMap();
  private static HashMap<String, Date> udns;
  private static UpnpDeviceList upnpDeviceListInstance = null;
  long SEARCH_EXPIRY_INTERVAL = 2000L;
  private String[] airPurifierFw = null;
  private String[] argumentsArray = new String[2];
  private String[] bridgeFW = null;
  private String capabilityID = null;
  private String[] cofeeMakerFw = null;
  private String deviceId = null;
  private String[] euFW = null;
  private String[] filesToBeZipped = new String[1];
  private ArrayList<String> firmDetailsList = null;
  private String[] flexLEDFw = null;
  private String[] gardenSpotFw = null;
  private String[] heaterAFw = null;
  private String[] heaterBFw = null;
  private String[] heaterFw = null;
  private String[] humidifierBFw = null;
  private String[] humidifierFw = null;
  private String[] insightFW = null;
  private String isGroupAction = null;
  private JSONArray jsonBridgeArray;
  private JSONObject jsonObject = new JSONObject();
  private String[] lightSwitchFW = null;
  private String mBridgeUdn = "";
  private Context mContext;
  private DeviceList mDeviceList = new DeviceList();
  private String mGroupId = null;
  private MoreUtil mMoreUtil;
  private int mOpenBridgeRetryCount = 7;
  private String mResponseString;
  private String[] makerFW = null;
  private int numofTries = 1;
  private String onORoff = null;
  private String[] openWRTAirPurifierFw = null;
  private String[] openWRTCoffeeMakerFw = null;
  private String[] openWRTHeaterAFw = null;
  private String[] openWRTHeaterBFw = null;
  private String[] openWRTHumidifierBFw = null;
  private String[] openWRTHumidifierFw = null;
  private String[] openWRTInsightV2 = null;
  private String[] openWRTLSFw = null;
  private String[] openWRTMakerFw = null;
  private String[] openWRTSlowCookerFw = null;
  private String[] openWRTTransAirPurifierFw = null;
  private String[] openWRTTransCoffeeMakerFw = null;
  private String[] openWRTTransHeaterAFw = null;
  private String[] openWRTTransHeaterBFw = null;
  private String[] openWRTTransHumidifierBFw = null;
  private String[] openWRTTransHumidifierFw = null;
  private String[] openWRTTransLSFw = null;
  private String[] openWRTTransMakerFw = null;
  private String[] openWRTTransSlowCookerFw = null;
  private String[] openWRTTransinsightFw = null;
  private String[] openWRTTranssnsFw = null;
  private String[] openWRTinsightFw = null;
  private String[] openWRTsnsFw = null;
  private String[] signedEUFW = null;
  private String[] signedInsightFW = null;
  private String[] signedLightSwitchFW = null;
  private String[] signedUSFW = null;
  private String[] slowCookerFw = null;
  private String[] tempTunableFw = null;
  private long timeOpenNetworkCheck;
  private String[] usFW = null;
  private String[] wemobulbFw = null;
  
  static
  {
    udns = new HashMap();
  }
  
  public UpnpDeviceList(Context paramContext)
  {
    super(paramContext);
    this.mContext = paramContext;
    this.mMoreUtil = new MoreUtil();
  }
  
  private String createGetEmergencyContactRequest()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("<DataStore>");
    localStringBuilder.append("<Name>");
    localStringBuilder.append("EmergencyContacts");
    localStringBuilder.append("</Name>");
    localStringBuilder.append("</DataStore>");
    return localStringBuilder.toString();
  }
  
  private String createGetPresetRequest(JSONArray paramJSONArray)
    throws JSONException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("<presetList>\n");
    localStringBuilder.append("<devicePreset>\n");
    localStringBuilder.append("<version>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getInt("version"));
    localStringBuilder.append("</version>\n");
    localStringBuilder.append("<isGroupID>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getInt("isGroupID"));
    localStringBuilder.append("</isGroupID>\n");
    localStringBuilder.append("<id>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getString("id"));
    localStringBuilder.append("</id>\n");
    localStringBuilder.append("<presets>\n");
    localStringBuilder.append("<preset>\n");
    localStringBuilder.append("</preset>\n");
    localStringBuilder.append("</presets>\n");
    localStringBuilder.append("</devicePreset>\n");
    localStringBuilder.append("</presetList>\n");
    LogUtils.infoLog("UpnpDeviceList", "createGetPresetRequest XML: " + localStringBuilder.toString());
    return localStringBuilder.toString();
  }
  
  private String createSetDeletePresetRequest(JSONArray paramJSONArray)
    throws JSONException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("<presetList>\n");
    localStringBuilder.append("<devicePreset>\n");
    localStringBuilder.append("<version>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getInt("version"));
    localStringBuilder.append("</version>\n");
    localStringBuilder.append("<isGroupID>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getInt("isGroupID"));
    localStringBuilder.append("</isGroupID>\n");
    localStringBuilder.append("<id>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getString("id"));
    localStringBuilder.append("</id>\n");
    localStringBuilder.append("<presets>\n");
    localStringBuilder.append("<preset>\n");
    localStringBuilder.append("<name>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getString("name"));
    localStringBuilder.append("</name>\n");
    localStringBuilder.append("<value>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getString("value"));
    localStringBuilder.append("</value>\n");
    localStringBuilder.append("<type>");
    localStringBuilder.append(paramJSONArray.getJSONObject(0).getString("type"));
    localStringBuilder.append("</type>\n");
    localStringBuilder.append("</preset>\n");
    localStringBuilder.append("</presets>\n");
    localStringBuilder.append("</devicePreset>\n");
    localStringBuilder.append("</presetList>\n");
    LogUtils.infoLog("UpnpDeviceList", "createSetPresetRequest XML: " + localStringBuilder.toString());
    return localStringBuilder.toString();
  }
  
  private String createSetEmergencyContactRequest(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("<DataStore>");
    localStringBuilder.append("<Name>");
    localStringBuilder.append("EmergencyContacts");
    localStringBuilder.append("</Name>");
    localStringBuilder.append("<Value>");
    localStringBuilder.append(paramString);
    localStringBuilder.append("</Value>");
    localStringBuilder.append("</DataStore>");
    return localStringBuilder.toString();
  }
  
  private String createSimulatedRuleBridgeXml(String[] paramArrayOfString)
  {
    String str1 = null;
    for (;;)
    {
      int i;
      try
      {
        Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
        Element localElement1 = localDocument.createElement("SimulatedRuleData");
        localDocument.appendChild(localElement1);
        i = 0;
        if (i < paramArrayOfString.length)
        {
          Element localElement2 = localDocument.createElement("Device");
          localElement1.appendChild(localElement2);
          String str2 = paramArrayOfString[i];
          if (!TextUtils.isEmpty(str2))
          {
            String str3 = str2.replace("[", "").replace("]", "").replaceAll("\"", "");
            Element localElement3 = localDocument.createElement("UDN");
            localElement3.appendChild(localDocument.createTextNode(str3));
            localElement2.appendChild(localElement3);
            Element localElement4 = localDocument.createElement("index");
            localElement4.appendChild(localDocument.createTextNode(String.valueOf(i)));
            localElement2.appendChild(localElement4);
          }
        }
        else
        {
          Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
          StringWriter localStringWriter = new StringWriter();
          StreamResult localStreamResult = new StreamResult(localStringWriter);
          DOMSource localDOMSource = new DOMSource(localDocument);
          localTransformer.transform(localDOMSource, localStreamResult);
          str1 = localStringWriter.toString();
          LogUtils.debugLog("UpnpDeviceList", "File simulated ruled saved!" + str1);
          return str1;
        }
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
      i++;
    }
  }
  
  private String createSimulatedRuleXml(String[] paramArrayOfString)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("\n");
    localStringBuffer.append("<SimulatedRuleData>");
    localStringBuffer.append("\n");
    for (int i = 0; i < paramArrayOfString.length; i++)
    {
      String str = paramArrayOfString[i];
      if (!TextUtils.isEmpty(str))
      {
        localStringBuffer.append("<Device>");
        localStringBuffer.append("\n");
        localStringBuffer.append("<UDN>");
        localStringBuffer.append(str);
        localStringBuffer.append("</UDN>");
        localStringBuffer.append("\n");
        localStringBuffer.append("<index>");
        localStringBuffer.append(i);
        localStringBuffer.append("</index>");
        localStringBuffer.append("\n");
        localStringBuffer.append("</Device>");
        localStringBuffer.append("\n");
      }
    }
    localStringBuffer.append("</SimulatedRuleData>");
    return localStringBuffer.toString().replace("[", "").replace("]", "").replaceAll("\"", "");
  }
  
  private String doBridgeXml(JSONArray paramJSONArray, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    str1 = null;
    long l = System.currentTimeMillis() / 1000L;
    LogUtils.debugLog("UpnpDeviceList", "Seconds*******: " + l + "--" + paramString4);
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
      this.mGroupId = String.valueOf(l);
      if (paramString4.equals("0")) {
        localElement2.appendChild(localDocument.createTextNode(this.mGroupId));
      }
      for (;;)
      {
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
        LogUtils.debugLog("UpnpDeviceList", "File saved!" + str1);
        return str1;
        localElement2.appendChild(localDocument.createTextNode(paramString4));
      }
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
  }
  
  public static UpnpDeviceList getInstance(Context paramContext)
  {
    try
    {
      if (upnpDeviceListInstance == null) {
        upnpDeviceListInstance = new UpnpDeviceList(paramContext);
      }
      UpnpDeviceList localUpnpDeviceList = upnpDeviceListInstance;
      return localUpnpDeviceList;
    }
    finally {}
  }
  
  private String getRegistrationDataArgs()
  {
    WiFiSecurityUtil localWiFiSecurityUtil = new WiFiSecurityUtil();
    return "<SmartDeviceData><SmartUniqueId>" + localWiFiSecurityUtil.getDeviceID(this.mContext) + "</SmartUniqueId>" + "<ReUnionKey>" + new MoreUtil().getReUnionKey(new SharePreferences(this.mContext)) + "</ReUnionKey></SmartDeviceData>";
  }
  
  private JSONObject getRegistrationWorker(Action paramAction)
  {
    this.jsonObject = null;
    try
    {
      String str = paramAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "Response : " + str);
      this.jsonObject = new RegistrationDataResponseParser().parseResponse(str);
      JSONObject localJSONObject = this.jsonObject;
      return localJSONObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return this.jsonObject;
  }
  
  private String[] getRemoteAccessAgrs()
  {
    String[] arrayOfString = new String[8];
    SharePreferences localSharePreferences = new SharePreferences(this.mContext);
    WiFiSecurityUtil localWiFiSecurityUtil = new WiFiSecurityUtil();
    arrayOfString[0] = localWiFiSecurityUtil.getDeviceID(this.mContext);
    Date localDate = new Date(System.currentTimeMillis());
    if (TimeZone.getDefault().inDaylightTime(localDate)) {
      arrayOfString[1] = "1";
    }
    for (;;)
    {
      arrayOfString[2] = localSharePreferences.getHomeId();
      arrayOfString[3] = new MoreUtil().getDeviceUserName(this.mContext);
      arrayOfString[4] = "";
      arrayOfString[5] = "";
      arrayOfString[6] = "";
      arrayOfString[7] = localWiFiSecurityUtil.generateAuthCode(this.mContext);
      return arrayOfString;
      arrayOfString[1] = "0";
    }
  }
  
  private boolean isWeMo(String paramString)
  {
    return (paramString.equalsIgnoreCase("urn:Belkin:device:socket:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:controllee:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:sensor:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:lightswitch:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:bridge:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:Crockpot:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:Crockpot:1".toLowerCase(Locale.getDefault()))) || (paramString.equalsIgnoreCase("urn:Belkin:device:insight:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:Heater:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:AirPurifier:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:Humidifier:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:HumidifierB:1")) || (paramString.equalsIgnoreCase("urn:Belkin:device:Maker:1"));
  }
  
  private void printDeviceList()
  {
    Iterator localIterator = getDeviceList().iterator();
    while (localIterator.hasNext())
    {
      Device localDevice = (Device)localIterator.next();
      try
      {
        LogUtils.verboseLog("UpnpDeviceList", "printDeviceList inner device:" + localDevice + " hash: " + localDevice.hashCode() + " location: " + localDevice.getLocation() + " isRoot: " + localDevice.isRootDevice());
      }
      catch (Exception localException)
      {
        LogUtils.verboseLog("UpnpDeviceList", "printDeviceList Exception: " + localException.getMessage());
      }
    }
  }
  
  private JSONObject sendSmartSetupRequest(Action paramAction, JSONObject paramJSONObject)
    throws JSONException
  {
    int i = 0;
    long l = System.currentTimeMillis();
    for (;;)
    {
      StringBuilder localStringBuilder = new StringBuilder().append("sendSmartSetupRequest Trying:");
      i++;
      LogUtils.verboseLog("UpnpDeviceList", i);
      JSONObject localJSONObject = getRegistrationWorker(paramAction);
      boolean bool1 = "F".equals(localJSONObject.get("registrationStatus"));
      boolean bool2 = "RETRY".equals(localJSONObject.get("statusCode"));
      LogUtils.verboseLog("UpnpDeviceList", "sendSmartSetupRequest failed: " + bool1 + " retry: " + bool2);
      if ((bool1) && (bool2)) {}
      try
      {
        Thread.sleep(10000L);
        if ((bool1) && (bool2) && (System.currentTimeMillis() - l < 60000L)) {
          continue;
        }
        LogUtils.verboseLog("UpnpDeviceList", "sendSmartSetupRequest Exiting failed: " + bool1 + " retry: " + bool2 + " timediff(secs): " + (System.currentTimeMillis() - l) / 1000L);
        return localJSONObject;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
      }
    }
  }
  
  private boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    int i;
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null)) {
      i = 0;
    }
    while (i < paramArrayOfString1.length)
    {
      LogUtils.verboseLog("UpnpDeviceList", "Key " + paramArrayOfString1[i] + " = " + paramArrayOfString2[i] + " Value");
      paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      i++;
      continue;
      return false;
    }
    return true;
  }
  
  private String[] timeSync()
  {
    String[] arrayOfString = new String[4];
    TimeZone localTimeZone = TimeZone.getDefault();
    int i = localTimeZone.getOffset(System.currentTimeMillis());
    int j = i / 1000 / 60 / 60;
    int k = i / 1000 / 60 % 60;
    arrayOfString[1] = ("" + j);
    if (k == 30) {
      arrayOfString[1] = (arrayOfString[1] + ".5");
    }
    if (localTimeZone.inDaylightTime(new Date(System.currentTimeMillis())))
    {
      arrayOfString[2] = "1";
      if (!localTimeZone.useDaylightTime()) {
        break label157;
      }
      arrayOfString[3] = "1";
    }
    for (;;)
    {
      arrayOfString[0] = String.valueOf(System.currentTimeMillis() / 1000L);
      return arrayOfString;
      arrayOfString[2] = "0";
      break;
      label157:
      arrayOfString[3] = "0";
    }
  }
  
  public static String upperCaseFirstChar(String paramString)
  {
    if (paramString.length() == 0) {
      return "";
    }
    char c = Character.toUpperCase(paramString.charAt(0));
    String str = "" + c;
    for (int i = 1; i < paramString.length(); i++) {
      str = str + paramString.charAt(i);
    }
    return str;
  }
  
  public JSONArray UpdateBulbFirmware(String paramString1, String paramString2)
  {
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("UpgradeSubDeviceFirmware");
      setArgument(localAction, UpnpConstants.ARGS_UPDATE_BULB_FIRMWARE, new String[] { paramString1, paramString2, "0" });
      String str = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "BULB FIRMWARE RESPOMSE: " + str);
      return localJSONArray;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return localJSONArray;
  }
  
  public boolean UpnpInitialization()
  {
    this.mDeviceList.clear();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    if (getDeviceList() != null)
    {
      localControlPoint.addEventListener(this);
      localControlPoint.addNotifyListener(this);
      localControlPoint.addDeviceChangeListener(this);
      return true;
    }
    return false;
  }
  
  public JSONArray addBridgeDevices(JSONArray paramJSONArray)
  {
    LogUtils.infoLog("UpnpDeviceList", "addBridgeDevices()");
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    for (;;)
    {
      int j;
      int k;
      try
      {
        StringBuffer localStringBuffer1 = new StringBuffer();
        j = 0;
        if (j < paramJSONArray.getJSONArray(0).length())
        {
          localStringBuffer1.append(paramJSONArray.getJSONArray(0).get(j).toString());
          if (j < -1 + paramJSONArray.getJSONArray(0).length()) {
            localStringBuffer1.append(",");
          }
        }
        else
        {
          StringBuffer localStringBuffer2 = new StringBuffer();
          k = 0;
          if (k < paramJSONArray.getJSONArray(1).length())
          {
            localStringBuffer2.append(paramJSONArray.getJSONArray(1).get(k).toString());
            if (k >= -1 + paramJSONArray.getJSONArray(1).length()) {
              break label426;
            }
            localStringBuffer2.append(",");
            break label426;
          }
          String str1 = localStringBuffer1.toString();
          String str2 = localStringBuffer2.toString();
          System.out.println("----- add dev ids:" + str1 + "---" + str2 + "---" + this.mBridgeUdn);
          Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("AddDeviceName");
          setArgument(localAction, UpnpConstants.ARGS_LED_ADD_DEVICEIDS, new String[] { str1, str2 });
          this.mResponseString = localAction.postControlAction();
          LogUtils.debugLog("UpnpDeviceList", "get add devices n/w===+" + this.mResponseString);
          if (this.mResponseString != null)
          {
            localJSONArray.put(new LedDeviceResponseParser().parseNetworkStatus(this.mResponseString));
            DeviceListManager.getInstance(this.mContext).initiateScanZigBeeDevice(this.mBridgeUdn);
          }
          return localJSONArray;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return localJSONArray;
      }
      j++;
      continue;
      label426:
      k++;
    }
  }
  
  public JSONObject callAction(String paramString1, String paramString2, String paramString3, JSONObject paramJSONObject)
    throws Exception
  {
    Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1);
    if (localDevice == null) {
      throw new Exception("Device not found " + paramString1);
    }
    Action localAction = localDevice.getAction(paramString3);
    if (localAction == null) {
      throw new Exception("Invalid action " + paramString3);
    }
    if ((paramJSONObject != null) && (paramJSONObject.length() > 0))
    {
      Iterator localIterator2 = paramJSONObject.keys();
      while (localIterator2.hasNext())
      {
        String str2 = localIterator2.next().toString();
        localAction.setArgumentValue(str2, paramJSONObject.get(str2).toString());
      }
    }
    String str1 = localAction.postControlAction();
    LogUtils.infoLog("UpnpDeviceList", "call action response: " + str1);
    if ((str1 == null) && (this.numofTries <= 3))
    {
      this.numofTries = (1 + this.numofTries);
      LogUtils.debugLog("UpnpDeviceList", "num of tries: " + this.numofTries);
      callAction(paramString1, paramString2, paramString3, paramJSONObject);
    }
    while ((0 == 0) && (str1 == null) && (this.numofTries > 3))
    {
      throw new Exception("Null response");
      if (str1 != null)
      {
        this.numofTries = 1;
        if (str1.contains(UpnpConstants.ERROR)) {
          throw new Exception("Action response: " + str1);
        }
        JSONObject localJSONObject;
        if ((paramString3.equals("GetAttributes")) || (paramString3.equals("GetBlobStorage"))) {
          localJSONObject = new GenericGetAttributeResponseParser().parseGetAttributeResponse(str1);
        }
        for (;;)
        {
          LogUtils.infoLog("UpnpDeviceList", "output json elements:" + localJSONObject);
          return localJSONObject;
          if ((paramString3.equals("GetRules")) || (paramString3.equals("SetRules")))
          {
            localJSONObject = new GetRulesResponseParser().parseGetRulesResponse(str1);
          }
          else if (paramString3.equals("GetInsightParams"))
          {
            localJSONObject = getInsightParamsOutputObject(localAction, paramString1);
          }
          else if (paramString3.equals("SetBlobStorage"))
          {
            localJSONObject = new SetBlobStorageResponseParser().parseSetlobStorageRespone(str1);
          }
          else
          {
            localJSONObject = new JSONObject();
            Iterator localIterator1 = localAction.getOutputArgumentList().iterator();
            LogUtils.infoLog("UpnpDeviceList", "getoutputArgument List size:" + localAction.getOutputArgumentList().size());
            while (localIterator1.hasNext())
            {
              Argument localArgument = (Argument)localIterator1.next();
              localJSONObject.put(localArgument.getName(), localArgument.getValue());
            }
          }
        }
      }
    }
    return null;
  }
  
  public boolean checkIfWemoPresent(String paramString)
  {
    int i = 0;
    long l = System.currentTimeMillis();
    do
    {
      StringBuilder localStringBuilder = new StringBuilder().append("checkIfWemoPresent Trying:");
      i++;
      LogUtils.verboseLog("UpnpDeviceList", i);
      try
      {
        this.mDeviceList = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDeviceList();
        LogUtils.verboseLog("UpnpDeviceList", "checkIfWemoPresent serialNo: " + paramString + " mDeviceList size " + this.mDeviceList.size() + " Try: " + i);
        j = 0;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          int j;
          String str;
          localException.printStackTrace();
          continue;
          j++;
        }
      }
      if (j < this.mDeviceList.size())
      {
        str = getWeMoSSID(this.mDeviceList.getDevice(j).getUDN());
        LogUtils.debugLog("UpnpDeviceList", "checkIfWemoPresent Devices " + j + " tempSerialNo is " + str + " location: " + this.mDeviceList.getDevice(j).getLocation());
        if (!str.equalsIgnoreCase(paramString)) {
          break;
        }
        this.mDevice = this.mDeviceList.getDevice(j);
        return true;
      }
      Thread.sleep(10000L);
    } while (System.currentTimeMillis() - l < 60000L);
    LogUtils.infoLog("UpnpDeviceList", "checkIfWemoPresent WeMO not present");
    return false;
  }
  
  public void clearBridgeDevices()
  {
    this.jsonBridgeArray = null;
  }
  
  public boolean clearNameIconRule(String paramString)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString).getAction("ReSetup");
      localAction.setArgumentValue("Reset", "1");
      String str = localAction.postControlAction();
      LogUtils.infoLog("UpnpDeviceList", "clearNameIconRule response: " + str);
      boolean bool;
      if (str != null) {
        bool = str.contains(UpnpConstants.ERROR);
      }
      return !bool;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("UpnpDeviceList", "exception in clearNameIconRule: " + localException);
    }
    return false;
  }
  
  public JSONObject closeBridgeNetwork()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("CloseNetwork");
      String[] arrayOfString1 = UpnpConstants.ARGS_DEVUDN;
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = this.mBridgeUdn;
      setArgument(localAction, arrayOfString1, arrayOfString2);
      String str = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "CLOSE NETWORK RESPOMSE: " + str);
      if (str != null) {
        return this.jsonObject.put("CloseNetwork", true);
      }
      JSONObject localJSONObject = this.jsonObject.put("CloseNetwork", false);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("CloseNetwork", false);
  }
  
  public String createCalendarList(String[] paramArrayOfString)
  {
    str = null;
    try
    {
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
      Element localElement1 = localDocument.createElement("CalendarList");
      localDocument.appendChild(localElement1);
      Element localElement2 = localDocument.createElement("Calendar");
      localElement1.appendChild(localElement2);
      if (Pattern.compile("([0-9]*)").matcher(paramArrayOfString[0]).matches())
      {
        Element localElement11 = localDocument.createElement("GroupID");
        localElement11.appendChild(localDocument.createTextNode(paramArrayOfString[0]));
        localElement2.appendChild(localElement11);
      }
      for (;;)
      {
        Element localElement4 = localDocument.createElement("Mon");
        localElement4.appendChild(localDocument.createTextNode(paramArrayOfString[1]));
        localElement2.appendChild(localElement4);
        Element localElement5 = localDocument.createElement("Tues");
        localElement5.appendChild(localDocument.createTextNode(paramArrayOfString[2]));
        localElement2.appendChild(localElement5);
        Element localElement6 = localDocument.createElement("Wed");
        localElement6.appendChild(localDocument.createTextNode(paramArrayOfString[3]));
        localElement2.appendChild(localElement6);
        Element localElement7 = localDocument.createElement("Thurs");
        localElement7.appendChild(localDocument.createTextNode(paramArrayOfString[4]));
        localElement2.appendChild(localElement7);
        Element localElement8 = localDocument.createElement("Fri");
        localElement8.appendChild(localDocument.createTextNode(paramArrayOfString[5]));
        localElement2.appendChild(localElement8);
        Element localElement9 = localDocument.createElement("Sat");
        localElement9.appendChild(localDocument.createTextNode(paramArrayOfString[6]));
        localElement2.appendChild(localElement9);
        Element localElement10 = localDocument.createElement("Sun");
        localElement10.appendChild(localDocument.createTextNode(paramArrayOfString[7]));
        localElement2.appendChild(localElement10);
        Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
        StringWriter localStringWriter = new StringWriter();
        StreamResult localStreamResult = new StreamResult(localStringWriter);
        DOMSource localDOMSource = new DOMSource(localDocument);
        localTransformer.transform(localDOMSource, localStreamResult);
        str = localStringWriter.toString();
        LogUtils.debugLog("UpnpDeviceList", "File saved calendar!" + str);
        return str;
        Element localElement3 = localDocument.createElement("DeviceID");
        localElement3.appendChild(localDocument.createTextNode(paramArrayOfString[0]));
        localElement2.appendChild(localElement3);
      }
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
  }
  
  /* Error */
  public JSONArray createGroup(JSONArray paramJSONArray)
    throws JSONException
  {
    // Byte code:
    //   0: new 313	org/json/JSONArray
    //   3: dup
    //   4: invokespecial 827	org/json/JSONArray:<init>	()V
    //   7: astore_2
    //   8: aload_0
    //   9: new 129	org/json/JSONObject
    //   12: dup
    //   13: invokespecial 130	org/json/JSONObject:<init>	()V
    //   16: putfield 132	com/belkin/cybergarage/wrapper/UpnpDeviceList:jsonObject	Lorg/json/JSONObject;
    //   19: aload_0
    //   20: getfield 254	com/belkin/cybergarage/wrapper/UpnpDeviceList:mContext	Landroid/content/Context;
    //   23: invokestatic 832	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   26: invokevirtual 836	com/belkin/wemo/cache/devicelist/DeviceListManager:getUpnpControl	()Lorg/cybergarage/upnp/ControlPoint;
    //   29: astore_3
    //   30: iconst_0
    //   31: istore 4
    //   33: iload 4
    //   35: aload_3
    //   36: invokevirtual 839	org/cybergarage/upnp/ControlPoint:getDeviceList	()Lorg/cybergarage/upnp/DeviceList;
    //   39: invokevirtual 842	org/cybergarage/upnp/DeviceList:size	()I
    //   42: if_icmpge +46 -> 88
    //   45: aload_3
    //   46: invokevirtual 839	org/cybergarage/upnp/ControlPoint:getDeviceList	()Lorg/cybergarage/upnp/DeviceList;
    //   49: iload 4
    //   51: invokevirtual 846	org/cybergarage/upnp/DeviceList:getDevice	(I)Lorg/cybergarage/upnp/Device;
    //   54: invokevirtual 849	org/cybergarage/upnp/Device:getUDN	()Ljava/lang/String;
    //   57: ldc_w 851
    //   60: invokevirtual 854	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   63: ifeq +19 -> 82
    //   66: aload_0
    //   67: aload_3
    //   68: invokevirtual 839	org/cybergarage/upnp/ControlPoint:getDeviceList	()Lorg/cybergarage/upnp/DeviceList;
    //   71: iload 4
    //   73: invokevirtual 846	org/cybergarage/upnp/DeviceList:getDevice	(I)Lorg/cybergarage/upnp/Device;
    //   76: invokevirtual 849	org/cybergarage/upnp/Device:getUDN	()Ljava/lang/String;
    //   79: putfield 170	com/belkin/cybergarage/wrapper/UpnpDeviceList:mBridgeUdn	Ljava/lang/String;
    //   82: iinc 4 1
    //   85: goto -52 -> 33
    //   88: aload_3
    //   89: aload_0
    //   90: getfield 170	com/belkin/cybergarage/wrapper/UpnpDeviceList:mBridgeUdn	Ljava/lang/String;
    //   93: invokevirtual 857	org/cybergarage/upnp/ControlPoint:getDevice	(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    //   96: ldc_w 567
    //   99: invokevirtual 863	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   102: astore 6
    //   104: getstatic 1100	com/belkin/wemo/cache/devicelist/UpnpConstants:CREATE_GROUP_ARGS	[Ljava/lang/String;
    //   107: astore 7
    //   109: iconst_1
    //   110: anewarray 134	java/lang/String
    //   113: astore 8
    //   115: aload 8
    //   117: iconst_0
    //   118: aload_0
    //   119: aload_1
    //   120: iconst_0
    //   121: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   124: aload_1
    //   125: iconst_1
    //   126: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   129: iconst_0
    //   130: invokevirtual 1102	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   133: invokevirtual 1103	java/lang/String:toString	()Ljava/lang/String;
    //   136: aload_1
    //   137: iconst_2
    //   138: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   141: iconst_0
    //   142: invokevirtual 1102	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   145: invokevirtual 1103	java/lang/String:toString	()Ljava/lang/String;
    //   148: aload_1
    //   149: iconst_3
    //   150: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   153: iconst_0
    //   154: invokevirtual 1102	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   157: invokevirtual 1103	java/lang/String:toString	()Ljava/lang/String;
    //   160: aload_1
    //   161: iconst_4
    //   162: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   165: iconst_0
    //   166: invokevirtual 1102	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   169: invokevirtual 1103	java/lang/String:toString	()Ljava/lang/String;
    //   172: invokespecial 1105	com/belkin/cybergarage/wrapper/UpnpDeviceList:doBridgeXml	(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   175: aastore
    //   176: aload_0
    //   177: aload 6
    //   179: aload 7
    //   181: aload 8
    //   183: invokespecial 275	com/belkin/cybergarage/wrapper/UpnpDeviceList:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    //   186: pop
    //   187: aload 6
    //   189: invokevirtual 621	org/cybergarage/upnp/Action:postControlAction	()Ljava/lang/String;
    //   192: astore 10
    //   194: ldc 25
    //   196: new 283	java/lang/StringBuilder
    //   199: dup
    //   200: invokespecial 284	java/lang/StringBuilder:<init>	()V
    //   203: ldc_w 1107
    //   206: invokevirtual 290	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload 10
    //   211: invokevirtual 290	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: invokevirtual 301	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   217: invokestatic 495	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   220: new 1109	com/belkin/upnp/parser/GetCreateGroupResponseParser
    //   223: dup
    //   224: invokespecial 1110	com/belkin/upnp/parser/GetCreateGroupResponseParser:<init>	()V
    //   227: aload 10
    //   229: invokevirtual 1114	com/belkin/upnp/parser/GetCreateGroupResponseParser:parseCreateGroupResponse	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   232: astore_2
    //   233: aload_2
    //   234: invokevirtual 1115	org/json/JSONArray:toString	()Ljava/lang/String;
    //   237: ldc 16
    //   239: invokevirtual 854	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   242: ifne +65 -> 307
    //   245: aload_1
    //   246: iconst_4
    //   247: invokevirtual 894	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   250: iconst_0
    //   251: invokevirtual 1102	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   254: invokevirtual 1103	java/lang/String:toString	()Ljava/lang/String;
    //   257: ldc 16
    //   259: invokevirtual 669	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   262: ifeq +45 -> 307
    //   265: new 313	org/json/JSONArray
    //   268: dup
    //   269: invokespecial 827	org/json/JSONArray:<init>	()V
    //   272: astore 11
    //   274: new 129	org/json/JSONObject
    //   277: dup
    //   278: invokespecial 130	org/json/JSONObject:<init>	()V
    //   281: astore 12
    //   283: aload 12
    //   285: ldc_w 1117
    //   288: aload_0
    //   289: getfield 172	com/belkin/cybergarage/wrapper/UpnpDeviceList:mGroupId	Ljava/lang/String;
    //   292: invokevirtual 1010	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   295: pop
    //   296: aload 11
    //   298: aload 12
    //   300: invokevirtual 925	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   303: pop
    //   304: aload 11
    //   306: astore_2
    //   307: aload_2
    //   308: areturn
    //   309: astore 5
    //   311: aload 5
    //   313: invokevirtual 634	java/lang/Exception:printStackTrace	()V
    //   316: aload_2
    //   317: areturn
    //   318: astore 5
    //   320: aload 11
    //   322: astore_2
    //   323: goto -12 -> 311
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	326	0	this	UpnpDeviceList
    //   0	326	1	paramJSONArray	JSONArray
    //   7	316	2	localObject	Object
    //   29	60	3	localControlPoint	ControlPoint
    //   31	52	4	i	int
    //   309	3	5	localException1	Exception
    //   318	1	5	localException2	Exception
    //   102	86	6	localAction	Action
    //   107	73	7	arrayOfString1	String[]
    //   113	69	8	arrayOfString2	String[]
    //   192	36	10	str	String
    //   272	49	11	localJSONArray	JSONArray
    //   281	18	12	localJSONObject	JSONObject
    // Exception table:
    //   from	to	target	type
    //   88	274	309	java/lang/Exception
    //   274	304	318	java/lang/Exception
  }
  
  public String deleteCalendarList(String paramString)
  {
    str = null;
    try
    {
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
      Element localElement1 = localDocument.createElement("CalendarList");
      localDocument.appendChild(localElement1);
      Element localElement2 = localDocument.createElement("Calendar");
      localElement1.appendChild(localElement2);
      if (Pattern.compile("([0-9]*)").matcher(paramString).matches())
      {
        Element localElement4 = localDocument.createElement("GroupID");
        localElement4.appendChild(localDocument.createTextNode(paramString));
        localElement2.appendChild(localElement4);
      }
      for (;;)
      {
        Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
        StringWriter localStringWriter = new StringWriter();
        StreamResult localStreamResult = new StreamResult(localStringWriter);
        localTransformer.transform(new DOMSource(localDocument), localStreamResult);
        str = localStringWriter.toString();
        LogUtils.debugLog("UpnpDeviceList", "File saved calendar delete!" + str);
        return str;
        Element localElement3 = localDocument.createElement("DeviceID");
        localElement3.appendChild(localDocument.createTextNode(paramString));
        localElement2.appendChild(localElement3);
      }
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
  }
  
  public void deleteDevicePreset(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mBridgeUdn = paramJSONArray.getJSONObject(0).getString("bridgeUdn");
    String str = this.mBridgeUdn;
    int i = 0;
    if (str != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      i = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("deleteDevicePreset");
        i = 0;
        if (localAction != null)
        {
          localAction.setArgumentValue("devicePresetData", createSetDeletePresetRequest(paramJSONArray));
          DeletePresetCallback localDeletePresetCallback = new DeletePresetCallback(paramSetAndGetActionCallBack);
          i = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localDeletePresetCallback, localDeletePresetCallback);
        }
      }
    }
    if (i == 0) {
      paramSetAndGetActionCallBack.onError();
    }
  }
  
  public JSONArray deleteGroup(String paramString)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    Object localObject = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("DeleteGroup");
      setArgument(localAction, UpnpConstants.ARGS_GROUPID, new String[] { paramString });
      String str = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "DELETE GROUP RESPOMSE: " + str);
      if (str != null)
      {
        JSONArray localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str);
        localObject = localJSONArray;
      }
      return (JSONArray)localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return (JSONArray)localObject;
  }
  
  public String deleteNotifyRule(String[] paramArrayOfString)
  {
    try
    {
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramArrayOfString[1]).getAction("DeleteRuleID");
      setArgument(localAction, Constants.DELETE_RULE_ID, paramArrayOfString);
      localAction.postControlAction();
      return "true";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "false";
  }
  
  public String deleteWeeklyCalendarString(String[] paramArrayOfString)
  {
    String str1 = "";
    String str2 = paramArrayOfString[0];
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    if (paramArrayOfString != null) {}
    for (;;)
    {
      int i;
      try
      {
        if (paramArrayOfString[1] != null)
        {
          Action localAction2 = localControlPoint.getDevice(paramArrayOfString[1]).getAction("DeleteWeeklyCalendar");
          setArgument(localAction2, UpnpConstants.ARGS_DEVICEID, new String[] { str2 });
          localAction2.postControlAction();
          return "true";
        }
        if ((paramArrayOfString != null) && (paramArrayOfString[0] != null))
        {
          String str3 = deleteCalendarList(str2);
          i = 0;
          if (i < localControlPoint.getDeviceList().size())
          {
            if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
              str1 = localControlPoint.getDeviceList().getDevice(i).getUDN();
            }
          }
          else
          {
            Action localAction1 = localControlPoint.getDevice(str1).getAction("DeleteWeeklyCalendar");
            setArgument(localAction1, Constants.SET_UPDATE_WEEKLY_CALENDER_LED_ARGS, new String[] { str3 });
            localAction1.postControlAction();
            return "true";
          }
        }
        else
        {
          return "false";
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return "false";
      }
      i++;
    }
  }
  
  public void destroyControlPointNow()
  {
    super.destroyControlPointNow();
  }
  
  public void deviceAdded(Device paramDevice)
  {
    LogUtils.verboseLog("UpnpDeviceList", "deviceAdded(Device device) : Friendly Name : " + paramDevice.getFriendlyName());
    if (isWeMo(paramDevice.getDeviceType())) {
      this.mDeviceList.addElement(paramDevice);
    }
  }
  
  public void deviceNotifyReceived(SSDPPacket paramSSDPPacket) {}
  
  public void deviceRemoved(Device paramDevice)
  {
    LogUtils.verboseLog("UpnpDeviceList", "deviceRemoved(Device device) : Friendly Name : " + paramDevice.getFriendlyName());
  }
  
  public void deviceSearchResponseReceived(SSDPPacket paramSSDPPacket) {}
  
  public String domXml(String paramString1, String paramString2, String paramString3, String paramString4)
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
      LogUtils.debugLog("UpnpDeviceList", "File saved!" + str);
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
  
  public void editWeeklyCalenderString(String paramString)
  {
    String[] arrayOfString = { "2", paramString };
    Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString).getAction("EditWeeklycalendar");
    setArgument(localAction, Constants.SET_EDIT_WEEKLY_CALENDER_ARGS, arrayOfString);
    localAction.postControlAction();
  }
  
  public JSONObject enableRemoteAccess(DeviceInformation paramDeviceInformation)
  {
    this.jsonObject = new JSONObject();
    try
    {
      String[] arrayOfString = getRemoteAccessAgrs();
      if (paramDeviceInformation != null)
      {
        Device localDevice = paramDeviceInformation.getDevice();
        LogUtils.infoLog("UpnpDeviceList", "enabling remote access for device :: " + localDevice.getUDN());
        Action localAction = localDevice.getAction("RemoteAccess");
        setArgument(localAction, UpnpConstants.SET_REMOTE_ACESS_ARGS, arrayOfString);
        String str = localAction.postControlAction();
        if ((str != null) && (!str.isEmpty())) {
          this.jsonObject = new RemoteAccessResponseParser().parseRemoteAccessRespone(str);
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return this.jsonObject;
  }
  
  public void eventNotifyReceived(String paramString1, String paramString2, long paramLong, String paramString3, String paramString4)
  {
    try
    {
      Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDeviceBySubscriber(paramString1);
      if ((localDevice != null) && (isWeMo(localDevice.getDeviceType())) && (paramString3.equalsIgnoreCase("TimeSyncRequest"))) {
        postTimeSync(localDevice);
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.verboseLog("UpnpDeviceList", "eventNotifyReceived(String uuid, long seq, String varName, String value)");
      localException.printStackTrace();
    }
  }
  
  public JSONArray findLedBulb(String paramString)
    throws JSONException
  {
    Object localObject = new JSONArray();
    for (;;)
    {
      int i;
      try
      {
        ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
        if (localControlPoint != null)
        {
          i = 0;
          if (i < localControlPoint.getDeviceList().size())
          {
            if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
              this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
            }
          }
          else {
            LogUtils.debugLog("UpnpDeviceList", "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + this.mBridgeUdn);
          }
        }
        else
        {
          if ((this.mBridgeUdn != null) && (this.mBridgeUdn.length() != 0))
          {
            Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("IdentifyDevice");
            setArgument(localAction, UpnpConstants.ARGS_DEVICEID, new String[] { paramString });
            String str = localAction.postControlAction();
            LogUtils.debugLog("UpnpDeviceList", "FIND BULB RESPOMSE: " + str);
            if (str != null)
            {
              JSONArray localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str);
              localObject = localJSONArray;
            }
          }
          return (JSONArray)localObject;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return (JSONArray)localObject;
      }
      i++;
    }
  }
  
  public JSONObject firmwareUpdateList(String paramString, JSONArray paramJSONArray)
  {
    LogUtils.infoLog("UpnpDeviceList", " firmwareUpdateList url: " + paramString + " :: currentFirmwareArray ::" + paramJSONArray.toString());
    LogUtils.infoLog("FIRMWARE UPGRADE", " firmwareUpdateList url: " + paramString + " :: currentFirmwareArray ::" + paramJSONArray.toString());
    JSONObject localJSONObject1 = new JSONObject();
    String[] arrayOfString1 = new String[3];
    if (this.firmDetailsList == null) {
      this.firmDetailsList = getFirmwareDetailsList(paramString);
    }
    String[] arrayOfString2;
    int i;
    if ((this.firmDetailsList != null) && (this.firmDetailsList.size() > 0) && (paramJSONArray != null))
    {
      arrayOfString2 = (String[])this.firmDetailsList.toArray(new String[this.firmDetailsList.size()]);
      i = 0;
    }
    for (;;)
    {
      String str1;
      JSONObject localJSONObject2;
      String str2;
      int k;
      try
      {
        if (i >= paramJSONArray.length()) {
          continue;
        }
        str1 = "";
        localJSONObject2 = paramJSONArray.getJSONObject(i);
        if (localJSONObject2 == null) {
          break label4687;
        }
        str2 = localJSONObject2.getString("type");
        int j = arrayOfString2.length;
        k = 0;
        if (k >= j) {
          break label4738;
        }
        arrayOfString2[k];
        if (!localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:lightswitch:1")) {
          break label765;
        }
        if (this.openWRTLSFw == null) {
          break label634;
        }
        str1 = this.mMoreUtil.compareOpenWRTFirmwareForLightSwitch(localJSONObject2.getString("devicefirmware"), this.lightSwitchFW, this.openWRTTransLSFw, this.openWRTLSFw);
        if (!str1.equalsIgnoreCase("light")) {
          continue;
        }
        arrayOfString1[0] = this.lightSwitchFW[1];
        arrayOfString1[1] = this.lightSwitchFW[3];
        arrayOfString1[2] = this.lightSwitchFW[2];
      }
      catch (JSONException localJSONException)
      {
        JSONObject localJSONObject3;
        LogUtils.errorLog("UpnpDeviceList", " JSON Exception is :: " + localJSONException);
        return localJSONObject1;
        if (!str1.equalsIgnoreCase("openWRTTranslight")) {
          continue;
        }
        arrayOfString1[0] = this.openWRTTransLSFw[1];
        arrayOfString1[1] = this.openWRTTransLSFw[3];
        arrayOfString1[2] = this.openWRTTransLSFw[2];
        continue;
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("UpnpDeviceList", "Exception while showing release notes and the exception is :: " + localException);
        return localJSONObject1;
      }
      if ((str1 != null) && (!str1.equals("")))
      {
        localJSONObject3 = new JSONObject();
        localJSONObject3.put("udn", localJSONObject2.getString("udn"));
        localJSONObject3.put("devicefirmware", localJSONObject2.getString("devicefirmware"));
        localJSONObject3.put("pluginId", localJSONObject2.getString("pluginId"));
        localJSONObject3.put("macAddress", localJSONObject2.getString("macAddress"));
        localJSONObject3.put("friendlyName", localJSONObject2.getString("friendlyName"));
        localJSONObject3.put("type", localJSONObject2.getString("type"));
        localJSONObject3.put(JSONConstants.NEW_FIRMWARE_VERSION, arrayOfString1[0]);
        localJSONObject3.put(JSONConstants.NEW_FIRMWARE_URL, arrayOfString1[1]);
        localJSONObject3.put(JSONConstants.NEW_FIRMWARE_SIGNATURE, arrayOfString1[2]);
        localJSONObject1.put(localJSONObject2.getString("udn"), localJSONObject3);
        if (str1.equalsIgnoreCase("openWRTlight"))
        {
          arrayOfString1[0] = this.openWRTLSFw[1];
          arrayOfString1[1] = this.openWRTLSFw[3];
          arrayOfString1[2] = this.openWRTLSFw[2];
        }
        else
        {
          label634:
          if (this.lightSwitchFW != null)
          {
            str1 = this.mMoreUtil.compareNEWFirmwareDataForLightSwitch(localJSONObject2.getString("devicefirmware"), this.lightSwitchFW, this.signedLightSwitchFW);
            if (str1.equalsIgnoreCase("light"))
            {
              arrayOfString1[0] = this.lightSwitchFW[1];
              arrayOfString1[1] = this.lightSwitchFW[3];
              arrayOfString1[2] = this.lightSwitchFW[2];
            }
            else if (str1.equalsIgnoreCase("signedlight"))
            {
              arrayOfString1[0] = this.signedLightSwitchFW[1];
              arrayOfString1[1] = this.signedLightSwitchFW[3];
              arrayOfString1[2] = this.signedLightSwitchFW[2];
            }
          }
          else
          {
            LogUtils.errorLog("UpnpDeviceList", "Either openWRTLSFw or lightSwitchFW is null");
            continue;
            label765:
            if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:insight:1"))
            {
              String str18 = localJSONObject2.getString("hwVersion");
              if ((str18.isEmpty()) || (str18.equalsIgnoreCase("v1")))
              {
                if (this.openWRTTransinsightFw != null)
                {
                  str1 = this.mMoreUtil.compareOpenWRTFirmwareForInsight(localJSONObject2.getString("devicefirmware"), this.insightFW, this.openWRTTransinsightFw, this.openWRTinsightFw);
                  if (str1.equalsIgnoreCase("insight"))
                  {
                    arrayOfString1[0] = this.insightFW[1];
                    arrayOfString1[1] = this.insightFW[3];
                    arrayOfString1[2] = this.insightFW[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTinsight"))
                  {
                    arrayOfString1[0] = this.openWRTinsightFw[1];
                    arrayOfString1[1] = this.openWRTinsightFw[3];
                    arrayOfString1[2] = this.openWRTinsightFw[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTTransinsight"))
                  {
                    arrayOfString1[0] = this.openWRTTransinsightFw[1];
                    arrayOfString1[1] = this.openWRTTransinsightFw[3];
                    arrayOfString1[2] = this.openWRTTransinsightFw[2];
                  }
                }
                else if (this.insightFW != null)
                {
                  str1 = this.mMoreUtil.compareNEWFirmwareDataForInsight(localJSONObject2.getString("devicefirmware"), this.insightFW, this.signedInsightFW);
                  if (str1.equalsIgnoreCase("insight"))
                  {
                    arrayOfString1[0] = this.insightFW[1];
                    arrayOfString1[1] = this.insightFW[3];
                    arrayOfString1[2] = this.insightFW[2];
                  }
                  else if (str1.equalsIgnoreCase("signedInsight"))
                  {
                    arrayOfString1[0] = this.signedInsightFW[1];
                    arrayOfString1[1] = this.signedInsightFW[3];
                    arrayOfString1[2] = this.signedInsightFW[2];
                  }
                }
                else
                {
                  LogUtils.errorLog("UpnpDeviceList", "Either openWRTTransinsightFw or insightFW is null");
                }
              }
              else if (str18.equalsIgnoreCase("v2")) {
                if (this.openWRTInsightV2 != null)
                {
                  str1 = this.mMoreUtil.compareOpenWRTFirmwareForInsightV2(localJSONObject2.getString("devicefirmware"), this.openWRTInsightV2);
                  if (str1.equalsIgnoreCase("insightV2"))
                  {
                    arrayOfString1[0] = this.openWRTInsightV2[1];
                    arrayOfString1[1] = this.openWRTInsightV2[3];
                    arrayOfString1[2] = this.openWRTInsightV2[2];
                  }
                }
                else
                {
                  LogUtils.errorLog("UpnpDeviceList", "openWRTInsightV2 is null");
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:Maker:1"))
            {
              String str17 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransMakerFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str17, this.openWRTMakerFw, "Maker");
                if (str1.equalsIgnoreCase("Maker"))
                {
                  arrayOfString1[0] = this.makerFW[1];
                  arrayOfString1[1] = this.makerFW[3];
                  arrayOfString1[2] = this.makerFW[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransMaker"))
                {
                  arrayOfString1[0] = this.openWRTTransMakerFw[1];
                  arrayOfString1[1] = this.openWRTTransMakerFw[3];
                  arrayOfString1[2] = this.openWRTTransMakerFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTMaker"))
                {
                  arrayOfString1[0] = this.openWRTMakerFw[1];
                  arrayOfString1[1] = this.openWRTMakerFw[3];
                  arrayOfString1[2] = this.openWRTMakerFw[2];
                }
              }
              else if (this.makerFW != null)
              {
                str1 = this.mMoreUtil.compareNEWFirmwareDataForMaker(localJSONObject2.getString("devicefirmware"), this.makerFW);
                if (str1.equalsIgnoreCase("Maker"))
                {
                  arrayOfString1[0] = this.makerFW[1];
                  arrayOfString1[1] = this.makerFW[3];
                  arrayOfString1[2] = this.makerFW[2];
                }
              }
              else
              {
                LogUtils.errorLog("UpnpDeviceList", "makerFW  is null");
              }
            }
            else if ((localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:sensor:1")) || (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:controllee:1")))
            {
              String str3 = localJSONObject2.getString("devicefirmware");
              if ((str3.contains("WeMo_US")) || (str3.contains("WeMo_WW_1.0")))
              {
                if (this.openWRTTranssnsFw != null)
                {
                  str1 = this.mMoreUtil.compareOpenWRTFirmwareForSNS(str3, this.usFW, this.openWRTTranssnsFw, this.openWRTsnsFw);
                  if (str1.equalsIgnoreCase("US"))
                  {
                    arrayOfString1[0] = this.usFW[1];
                    arrayOfString1[1] = this.usFW[3];
                    arrayOfString1[2] = this.usFW[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTSNS"))
                  {
                    arrayOfString1[0] = this.openWRTsnsFw[1];
                    arrayOfString1[1] = this.openWRTsnsFw[3];
                    arrayOfString1[2] = this.openWRTsnsFw[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTTransSNS"))
                  {
                    arrayOfString1[0] = this.openWRTTranssnsFw[1];
                    arrayOfString1[1] = this.openWRTTranssnsFw[3];
                    arrayOfString1[2] = this.openWRTTranssnsFw[2];
                  }
                }
                else if (this.usFW != null)
                {
                  str1 = this.mMoreUtil.compareNEWFirmwareDataForSwitchSensor(str3, this.usFW, this.signedUSFW);
                  if (str1.equalsIgnoreCase("US"))
                  {
                    arrayOfString1[0] = this.usFW[1];
                    arrayOfString1[1] = this.usFW[3];
                    arrayOfString1[2] = this.usFW[2];
                  }
                  else if (str1.equalsIgnoreCase("US_SIGNED"))
                  {
                    arrayOfString1[0] = this.signedUSFW[1];
                    arrayOfString1[1] = this.signedUSFW[3];
                    arrayOfString1[2] = this.signedUSFW[2];
                  }
                }
                else
                {
                  LogUtils.errorLog("UpnpDeviceList", "Either openWRTTranssnsFw or usFW is null");
                }
              }
              else if ((str3.contains("WeMo_EU")) || (str3.contains("WeMo_WW_2.0"))) {
                if (this.openWRTTranssnsFw != null)
                {
                  str1 = this.mMoreUtil.compareOpenWRTFirmwareForSNS(str3, this.euFW, this.openWRTTranssnsFw, this.openWRTsnsFw);
                  if (str1.equalsIgnoreCase("EU"))
                  {
                    arrayOfString1[0] = this.euFW[1];
                    arrayOfString1[1] = this.euFW[3];
                    arrayOfString1[2] = this.euFW[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTSNS"))
                  {
                    arrayOfString1[0] = this.openWRTsnsFw[1];
                    arrayOfString1[1] = this.openWRTsnsFw[3];
                    arrayOfString1[2] = this.openWRTsnsFw[2];
                  }
                  else if (str1.equalsIgnoreCase("openWRTTransSNS"))
                  {
                    arrayOfString1[0] = this.openWRTTranssnsFw[1];
                    arrayOfString1[1] = this.openWRTTranssnsFw[3];
                    arrayOfString1[2] = this.openWRTTranssnsFw[2];
                  }
                }
                else if (this.euFW != null)
                {
                  str1 = this.mMoreUtil.compareNEWFirmwareDataForSwitchSensor(str3, this.euFW, this.signedEUFW);
                  if (str1.equalsIgnoreCase("EU"))
                  {
                    arrayOfString1[0] = this.euFW[1];
                    arrayOfString1[1] = this.euFW[3];
                    arrayOfString1[2] = this.euFW[2];
                  }
                  else if (str1.equalsIgnoreCase("EU_SIGNED"))
                  {
                    arrayOfString1[0] = this.signedEUFW[1];
                    arrayOfString1[1] = this.signedEUFW[3];
                    arrayOfString1[2] = this.signedEUFW[2];
                  }
                }
                else
                {
                  LogUtils.errorLog("UpnpDeviceList", "Either openWRTTranssnsFw or euFW is null");
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:Crockpot:1"))
            {
              String str16 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransSlowCookerFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str16, this.openWRTSlowCookerFw, "SlowCooker");
                if (str1.equalsIgnoreCase("slowCookerFlag"))
                {
                  arrayOfString1[0] = this.slowCookerFw[1];
                  arrayOfString1[1] = this.slowCookerFw[3];
                  arrayOfString1[2] = this.slowCookerFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransSlowCooker"))
                {
                  arrayOfString1[0] = this.openWRTTransSlowCookerFw[1];
                  arrayOfString1[1] = this.openWRTTransSlowCookerFw[3];
                  arrayOfString1[2] = this.openWRTTransSlowCookerFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTSlowCooker"))
                {
                  arrayOfString1[0] = this.openWRTSlowCookerFw[1];
                  arrayOfString1[1] = this.openWRTSlowCookerFw[3];
                  arrayOfString1[2] = this.openWRTSlowCookerFw[2];
                }
              }
              else if (this.slowCookerFw != null)
              {
                str1 = this.mMoreUtil.compareNEWFirmwareDataForCrockpot(str16, this.slowCookerFw);
                if (str1.equalsIgnoreCase("slowCookerFlag"))
                {
                  arrayOfString1[0] = this.slowCookerFw[1];
                  arrayOfString1[1] = this.slowCookerFw[3];
                  arrayOfString1[2] = this.slowCookerFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1"))
            {
              String str15 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransCoffeeMakerFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str15, this.openWRTCoffeeMakerFw, "CoffeeMaker");
                if (str1.equalsIgnoreCase("wemoSmartFlag"))
                {
                  arrayOfString1[0] = this.cofeeMakerFw[1];
                  arrayOfString1[1] = this.cofeeMakerFw[3];
                  arrayOfString1[2] = this.cofeeMakerFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransCoffeeMaker"))
                {
                  arrayOfString1[0] = this.openWRTTransCoffeeMakerFw[1];
                  arrayOfString1[1] = this.openWRTTransCoffeeMakerFw[3];
                  arrayOfString1[2] = this.openWRTTransCoffeeMakerFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTCoffeeMaker"))
                {
                  arrayOfString1[0] = this.openWRTCoffeeMakerFw[1];
                  arrayOfString1[1] = this.openWRTCoffeeMakerFw[3];
                  arrayOfString1[2] = this.openWRTCoffeeMakerFw[2];
                }
              }
              else if (this.cofeeMakerFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str15, this.cofeeMakerFw, "CoffeeMaker");
                if (str1.equalsIgnoreCase("CoffeeMakerFlag"))
                {
                  arrayOfString1[0] = this.cofeeMakerFw[1];
                  arrayOfString1[1] = this.cofeeMakerFw[3];
                  arrayOfString1[2] = this.cofeeMakerFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:Heater:1"))
            {
              String str14 = localJSONObject2.getString("devicefirmware");
              if (this.heaterFw != null)
              {
                str1 = this.mMoreUtil.compareNEWFirmwareDataForWeMoSmart(str14, this.heaterFw);
                if (str1.equalsIgnoreCase("wemoSmartFlag"))
                {
                  arrayOfString1[0] = this.heaterFw[1];
                  arrayOfString1[1] = this.heaterFw[3];
                  arrayOfString1[2] = this.heaterFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:HeaterA:1"))
            {
              String str13 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransHeaterAFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str13, this.openWRTHeaterAFw, "HeaterA");
                if (str1.equalsIgnoreCase("wemoSmartFlag"))
                {
                  arrayOfString1[0] = this.heaterAFw[1];
                  arrayOfString1[1] = this.heaterAFw[3];
                  arrayOfString1[2] = this.heaterAFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransHeaterA"))
                {
                  arrayOfString1[0] = this.openWRTTransHeaterAFw[1];
                  arrayOfString1[1] = this.openWRTTransHeaterAFw[3];
                  arrayOfString1[2] = this.openWRTTransHeaterAFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTHeaterA"))
                {
                  arrayOfString1[0] = this.openWRTHeaterAFw[1];
                  arrayOfString1[1] = this.openWRTHeaterAFw[3];
                  arrayOfString1[2] = this.openWRTHeaterAFw[2];
                }
              }
              else if (this.heaterAFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str13, this.heaterAFw, "HeaterA");
                if (str1.equalsIgnoreCase("HeaterAFlag"))
                {
                  arrayOfString1[0] = this.heaterAFw[1];
                  arrayOfString1[1] = this.heaterAFw[3];
                  arrayOfString1[2] = this.heaterAFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:HeaterB:1"))
            {
              String str12 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransHeaterBFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str12, this.openWRTHeaterBFw, "HeaterB");
                if (str1.equalsIgnoreCase("wemoSmartFlag"))
                {
                  arrayOfString1[0] = this.heaterBFw[1];
                  arrayOfString1[1] = this.heaterBFw[3];
                  arrayOfString1[2] = this.heaterBFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransHeaterB"))
                {
                  arrayOfString1[0] = this.openWRTTransHeaterBFw[1];
                  arrayOfString1[1] = this.openWRTTransHeaterBFw[3];
                  arrayOfString1[2] = this.openWRTTransHeaterBFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTHeaterB"))
                {
                  arrayOfString1[0] = this.openWRTHeaterBFw[1];
                  arrayOfString1[1] = this.openWRTHeaterBFw[3];
                  arrayOfString1[2] = this.openWRTHeaterBFw[2];
                }
              }
              else if (this.heaterBFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str12, this.heaterBFw, "HeaterB");
                if (str1.equalsIgnoreCase("HeaterBFlag"))
                {
                  arrayOfString1[0] = this.heaterBFw[1];
                  arrayOfString1[1] = this.heaterBFw[3];
                  arrayOfString1[2] = this.heaterBFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:Humidifier:1"))
            {
              String str11 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransHumidifierFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str11, this.openWRTHumidifierFw, "Humidifier");
                if (str1.equalsIgnoreCase("HumidifierFlag"))
                {
                  arrayOfString1[0] = this.humidifierFw[1];
                  arrayOfString1[1] = this.humidifierFw[3];
                  arrayOfString1[2] = this.humidifierFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransHumidifier"))
                {
                  arrayOfString1[0] = this.openWRTTransHumidifierFw[1];
                  arrayOfString1[1] = this.openWRTTransHumidifierFw[3];
                  arrayOfString1[2] = this.openWRTTransHumidifierFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTHumidifier"))
                {
                  arrayOfString1[0] = this.openWRTHumidifierFw[1];
                  arrayOfString1[1] = this.openWRTHumidifierFw[3];
                  arrayOfString1[2] = this.openWRTHumidifierFw[2];
                }
              }
              else if (this.humidifierFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str11, this.humidifierFw, "Humidifier");
                if (str1.equalsIgnoreCase("HumidifierFlag"))
                {
                  arrayOfString1[0] = this.humidifierFw[1];
                  arrayOfString1[1] = this.humidifierFw[3];
                  arrayOfString1[2] = this.humidifierFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:HumidifierB:1"))
            {
              String str10 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransHumidifierBFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str10, this.openWRTHumidifierBFw, "HumidifierB");
                if (str1.equalsIgnoreCase("HumidifierBFlag"))
                {
                  arrayOfString1[0] = this.humidifierBFw[1];
                  arrayOfString1[1] = this.humidifierBFw[3];
                  arrayOfString1[2] = this.humidifierBFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransHumidifierB"))
                {
                  arrayOfString1[0] = this.openWRTTransHumidifierBFw[1];
                  arrayOfString1[1] = this.openWRTTransHumidifierBFw[3];
                  arrayOfString1[2] = this.openWRTTransHumidifierBFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTHumidifierB"))
                {
                  arrayOfString1[0] = this.openWRTHumidifierBFw[1];
                  arrayOfString1[1] = this.openWRTHumidifierBFw[3];
                  arrayOfString1[2] = this.openWRTHumidifierBFw[2];
                }
              }
              else if (this.humidifierBFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str10, this.humidifierBFw, "HumidifierB");
                if (str1.equalsIgnoreCase("HumidifierBFlag"))
                {
                  arrayOfString1[0] = this.humidifierBFw[1];
                  arrayOfString1[1] = this.humidifierBFw[3];
                  arrayOfString1[2] = this.humidifierBFw[2];
                }
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:AirPurifier:1"))
            {
              String str9 = localJSONObject2.getString("devicefirmware");
              if (this.openWRTTransAirPurifierFw != null)
              {
                str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str9, this.openWRTAirPurifierFw, "AirPurifier");
                if (str1.equalsIgnoreCase("wemoSmartFlag"))
                {
                  arrayOfString1[0] = this.airPurifierFw[1];
                  arrayOfString1[1] = this.airPurifierFw[3];
                  arrayOfString1[2] = this.airPurifierFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTTransAirPurifier"))
                {
                  arrayOfString1[0] = this.openWRTTransAirPurifierFw[1];
                  arrayOfString1[1] = this.openWRTTransAirPurifierFw[3];
                  arrayOfString1[2] = this.openWRTTransAirPurifierFw[2];
                }
                else if (str1.equalsIgnoreCase("openWRTAirPurifier"))
                {
                  arrayOfString1[0] = this.openWRTAirPurifierFw[1];
                  arrayOfString1[1] = this.openWRTAirPurifierFw[3];
                  arrayOfString1[2] = this.openWRTAirPurifierFw[2];
                }
              }
              else if (this.airPurifierFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersions(str9, this.airPurifierFw, "AirPurifier");
                if (str1.equalsIgnoreCase("AirPurifierFlag"))
                {
                  arrayOfString1[0] = this.airPurifierFw[1];
                  arrayOfString1[1] = this.airPurifierFw[3];
                  arrayOfString1[2] = this.airPurifierFw[2];
                }
              }
            }
            else if ((localJSONObject2.getString("type").equalsIgnoreCase("urn:Belkin:device:bridge:1")) && (localJSONObject2.getString("devicefirmware").contains("WeMo_WW_2.0")))
            {
              LogUtils.infoLog("UpnpDeviceList", "Type Bridge" + localJSONObject2.getString("type"));
              String str8 = localJSONObject2.getString("devicefirmware");
              str1 = this.mMoreUtil.compareNEWFirmwareDataForBridge(str8, this.bridgeFW[1]);
              if (str1.equalsIgnoreCase("Bridge"))
              {
                arrayOfString1[0] = this.bridgeFW[1];
                arrayOfString1[1] = this.bridgeFW[3];
                arrayOfString1[2] = this.bridgeFW[2];
              }
            }
            else if (localJSONObject2.getString("type").equalsIgnoreCase("MZ100"))
            {
              LogUtils.infoLog("UpnpDeviceList", "Type Bulb" + localJSONObject2.getString("type"));
              String str7 = localJSONObject2.getString("devicefirmware");
              if (this.wemobulbFw != null)
              {
                str1 = this.mMoreUtil.compareNEWFirmwareDataForBulb(str7, this.wemobulbFw[1]);
                if (str1.equalsIgnoreCase("Bulb"))
                {
                  arrayOfString1[0] = this.wemobulbFw[1];
                  arrayOfString1[1] = this.wemobulbFw[3];
                  arrayOfString1[2] = this.wemobulbFw[2];
                }
              }
            }
            else if ((str2.equalsIgnoreCase("Gardenspot RGB")) || (str2.equalsIgnoreCase("LIGHTIFY Gardenspot RGB")))
            {
              LogUtils.infoLog("UpnpDeviceList", "Type OSRAM Gardenspot" + localJSONObject2.getString("type"));
              String str4 = localJSONObject2.getString("devicefirmware");
              if (this.gardenSpotFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersionsBulb(str4, this.gardenSpotFw[1], "Gardenspot RGB".replaceAll("\\s+", ""));
                if (str1.equalsIgnoreCase("GardenspotRGBFlag"))
                {
                  arrayOfString1[0] = this.gardenSpotFw[1];
                  arrayOfString1[1] = this.gardenSpotFw[3];
                  arrayOfString1[2] = this.gardenSpotFw[2];
                }
              }
            }
            else if ((str2.equalsIgnoreCase("Classic A60 TW")) || (str2.equalsIgnoreCase("LIGHTIFY A19 Tunable White")))
            {
              LogUtils.infoLog("UpnpDeviceList", "Type OSRAM TEMPTunable" + localJSONObject2.getString("type"));
              String str5 = localJSONObject2.getString("devicefirmware");
              if (this.tempTunableFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersionsBulb(str5, this.tempTunableFw[1], "Classic A60 TW".replaceAll("\\s+", ""));
                if (str1.equalsIgnoreCase("ClassicA60TWFlag"))
                {
                  arrayOfString1[0] = this.tempTunableFw[1];
                  arrayOfString1[1] = this.tempTunableFw[3];
                  arrayOfString1[2] = this.tempTunableFw[2];
                }
              }
            }
            else if ((str2.equalsIgnoreCase("Flex RGBW")) || (str2.equalsIgnoreCase("LIGHTIFY Flex RGBW")))
            {
              LogUtils.infoLog("UpnpDeviceList", "Type OSRAM FLEX LED" + localJSONObject2.getString("type"));
              String str6 = localJSONObject2.getString("devicefirmware");
              if (this.flexLEDFw != null)
              {
                str1 = this.mMoreUtil.compareFirmwareVersionsBulb(str6, this.flexLEDFw[1], "Flex RGBW".replaceAll("\\s+", ""));
                if (str1.equalsIgnoreCase("FlexRGBWFlag"))
                {
                  arrayOfString1[0] = this.flexLEDFw[1];
                  arrayOfString1[1] = this.flexLEDFw[3];
                  arrayOfString1[2] = this.flexLEDFw[2];
                  continue;
                  label4687:
                  LogUtils.errorLog("UpnpDeviceList", " currentFirmwareVersion is NULL");
                  break label4738;
                  LogUtils.errorLog("UpnpDeviceList", " Null value passed:: currentFirmwreArray ::" + paramJSONArray + " firmDetailsList:: " + this.firmDetailsList);
                  return localJSONObject1;
                  label4738:
                  i++;
                }
              }
            }
          }
        }
      }
      else
      {
        k++;
      }
    }
  }
  
  public String getActionResultValue(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      String str = getStringFromResponse(DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction(paramString2).postControlAction(), paramString3);
      return str;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("UpnpDeviceList", "Get insight parameters exception: " + localException);
    }
    return "";
  }
  
  public JSONObject getActionResultValuesJSONObject(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction(paramString2);
        if (localAction != null)
        {
          String str1 = localAction.postControlAction();
          LogUtils.infoLog("UpnpDeviceList", "getActionResultValuesJSONObject >> response " + str1);
          if (str1 != null)
          {
            for (int i = 0; i < paramArrayOfString.length; i++) {
              localJSONObject.put(paramArrayOfString[i], getStringFromResponse(str1, paramArrayOfString[i]));
            }
            boolean bool1 = localJSONObject.has(JSONConstants.INSIGHT_CURRENCY);
            boolean bool2 = localJSONObject.has(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST);
            if ((bool1) && (bool2))
            {
              String str2 = (String)localJSONObject.get(JSONConstants.INSIGHT_CURRENCY);
              String str3 = (String)localJSONObject.get(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST);
              new SharePreferences(this.mContext).saveInsightHomeSettingsParams(str2, str3);
            }
          }
        }
      }
      return localJSONObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return localJSONObject;
  }
  
  public JSONArray getBridgeList()
    throws JSONException
  {
    JSONArray localJSONArray1 = new JSONArray();
    if ((this.jsonBridgeArray != null) && (this.jsonBridgeArray.length() > 0))
    {
      int i = 0;
      if (i < this.jsonBridgeArray.length())
      {
        JSONObject localJSONObject1 = new JSONObject();
        new JSONObject();
        JSONObject localJSONObject2 = this.jsonBridgeArray.getJSONObject(i);
        String str1 = localJSONObject2.toString();
        int j;
        if ((!TextUtils.isEmpty(str1)) && (str1.contains("GroupID")))
        {
          JSONObject localJSONObject3 = new JSONObject();
          JSONArray localJSONArray2 = localJSONObject2.getJSONArray("GroupIDS");
          if (localJSONArray2 != null)
          {
            j = 0;
            label118:
            if (j < localJSONArray2.length())
            {
              String str4 = localJSONArray2.getJSONObject(j).getString("ModelCode");
              if ((TextUtils.isEmpty(str4)) || (!WeMoUtils.isLEDModelCodeSupported(str4))) {
                break label223;
              }
              String str5 = localJSONObject2.getString("GroupID");
              localJSONObject3.put("friendlyName", localJSONObject2.getString("GroupName"));
              localJSONObject3.put("udn", str5);
              localJSONObject3.put("bridgeudn", this.mBridgeUdn);
              localJSONArray1.put(localJSONObject3);
            }
          }
        }
        for (;;)
        {
          i++;
          break;
          label223:
          j++;
          break label118;
          String str2 = localJSONObject2.getString("ModelCode");
          if ((!TextUtils.isEmpty(str2)) && (WeMoUtils.isLEDModelCodeSupported(str2)))
          {
            String str3 = localJSONObject2.getString("DeviceID");
            localJSONObject1.put("friendlyName", localJSONObject2.getString("FriendlyName"));
            localJSONObject1.put("udn", str3);
            localJSONObject1.put("bridgeudn", this.mBridgeUdn);
            localJSONArray1.put(localJSONObject1);
          }
        }
      }
      LogUtils.infoLog("UpnpDeviceList", "LED DEVICES**" + localJSONArray1);
      return localJSONArray1;
    }
    localJSONArray1.put(0);
    return localJSONArray1;
  }
  
  public JSONArray getCapabilityProfileIdList()
    throws JSONException
  {
    new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("GetCapabilityProfileIDList");
      String[] arrayOfString1 = UpnpConstants.ARGS_DEVUDN;
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = this.mBridgeUdn;
      setArgument(localAction, arrayOfString1, arrayOfString2);
      String str = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "GET capabilities profiel id list: " + str);
      JSONArray localJSONArray = new GetLedProfileIDResponseParser().parseProfileIdListResponse(str);
      return localJSONArray;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public JSONArray getCapabilityProfileList(String paramString)
    throws JSONException
  {
    Object localObject = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      Action localAction1 = localControlPoint.getDevice(this.mBridgeUdn).getAction("GetDeviceCapabilities");
      setArgument(localAction1, UpnpConstants.ARGS_DEVICEIDS, new String[] { paramString });
      String str1 = localAction1.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "GET capabilities device list: " + str1);
      if (str1 != null)
      {
        JSONArray localJSONArray1 = new GetDeviceCapabilitiesResponse().parseForDeviceCapabilitiesList(str1);
        LogUtils.debugLog("UpnpDeviceList", "get device capabilities************" + localJSONArray1.getJSONObject(0).getString("deviceCapabilityIds").toString());
        String str2 = localJSONArray1.getJSONObject(0).getString("deviceCapabilityIds").toString();
        if (str2 != null)
        {
          Action localAction2 = localControlPoint.getDevice(this.mBridgeUdn).getAction("GetCapabilityProfileList");
          setArgument(localAction2, UpnpConstants.ARGS_CAPABILITYIDS, new String[] { str2 });
          String str3 = localAction2.postControlAction();
          LogUtils.debugLog("UpnpDeviceList", "GET capabilities profiel id list: " + str3);
          if (str3 != null)
          {
            JSONArray localJSONArray2 = new GetLedProfileListResponse().parseForLedprofileList(str3);
            localObject = localJSONArray2;
          }
        }
      }
      return (JSONArray)localObject;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public boolean getCountdownFirmwareVersionByUDN(String paramString)
    throws JSONException
  {
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      LogUtils.debugLog("UpnpDeviceList", "version udn::::" + paramString);
      Device localDevice = localControlPoint.getDevice(paramString);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("GetFirmwareVersion");
        if (localAction.postControlAction() != null)
        {
          ArgumentList localArgumentList = localAction.getOutputArgumentList();
          if ((localArgumentList != null) && (localArgumentList.size() > 0))
          {
            String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
            this.jsonObject = new JSONObject();
            String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
            LogUtils.verboseLog("UpnpDeviceList", "FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
            boolean bool = localRuleUtility.isFirmwareValidForCountdownRule(arrayOfString2[1]);
            LogUtils.debugLog("UpnpDeviceList", "fw : " + bool);
            return bool;
          }
        }
      }
    }
    catch (Exception localException)
    {
      LogUtils.debugLog("UpnpDeviceList", "getCountdownFirmwareVersionByUDN Exception: " + localException.getMessage());
      LogUtils.debugLog("UpnpDeviceList", "getCountdownFirmwareVersionByUDN returning default");
    }
    return true;
  }
  
  public String getCurrentFirmwareVersion(Device paramDevice)
  {
    String str1 = "";
    ServiceList localServiceList = paramDevice.getServiceList();
    for (int i = 0; i < localServiceList.size(); i++)
    {
      Action localAction = localServiceList.getService(i).getAction("GetFirmwareVersion");
      if (localAction != null)
      {
        String str2 = localAction.postControlAction();
        if (str2 != null)
        {
          FirmwareVersionResponseBean localFirmwareVersionResponseBean = new FirmwareVersionResponseBean();
          new Parser().uPnPResponseParser(localFirmwareVersionResponseBean, 6, str2);
          if ((localFirmwareVersionResponseBean != null) && (localFirmwareVersionResponseBean.getFirmwareVersion() != null) && (localFirmwareVersionResponseBean.getSkuNumber() != null))
          {
            str1 = localFirmwareVersionResponseBean.getFirmwareVersion();
            System.out.println(" firmware version is : " + str1);
          }
        }
      }
    }
    return str1;
  }
  
  public JSONArray getCurrentFirmwareVersion(JSONArray paramJSONArray)
    throws JSONException
  {
    JSONArray localJSONArray = DeviceListController.getInstance(this.mContext).getFirmwareList();
    for (int i = 0; i < paramJSONArray.length(); i++) {
      if (paramJSONArray != null) {
        localJSONArray.put(paramJSONArray.getJSONObject(i));
      }
    }
    return localJSONArray;
  }
  
  public String getCurrentFirmwareVersionByUDN(String paramString1, String paramString2)
    throws JSONException
  {
    LogUtils.verboseLog("UpnpDeviceList", "FW <>  :FirmWare currFW: " + paramString2);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      Device localDevice = localControlPoint.getDevice(paramString1);
      Action localAction = localDevice.getAction("GetFirmwareVersion");
      if (localAction.postControlAction() != null)
      {
        ArgumentList localArgumentList = localAction.getOutputArgumentList();
        if (localArgumentList.size() < 0)
        {
          String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
          this.jsonObject = new JSONObject();
          String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
          LogUtils.verboseLog("UpnpDeviceList", "FW <>  FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
          String str = arrayOfString2[1];
          return str;
        }
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "";
  }
  
  public boolean getCurrentFirmwareVersionByUDN(String paramString)
    throws JSONException
  {
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      Device localDevice = localControlPoint.getDevice(paramString);
      String str = localDevice.getDeviceType();
      Action localAction = localDevice.getAction("GetFirmwareVersion");
      if (localAction.postControlAction() != null)
      {
        ArgumentList localArgumentList = localAction.getOutputArgumentList();
        if (localArgumentList.size() < 0)
        {
          String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
          this.jsonObject = new JSONObject();
          String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
          LogUtils.verboseLog("UpnpDeviceList", "FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
          boolean bool = localRuleUtility.frimwareSupportSRSS(arrayOfString2[1], str);
          return bool;
        }
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return true;
  }
  
  public ArrayList<String> getDBPathAllDevices(Context paramContext, String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    RulesDBPathResponseBean localRulesDBPathResponseBean = new RulesDBPathResponseBean();
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    String str1 = String.valueOf(1 + Integer.parseInt(localSharePreferences.getDBVersion()));
    for (int i = 0; i < this.mDeviceList.size(); i++)
    {
      String str2 = this.mDeviceList.getDevice(i).getAction("GetRulesDBPath").postControlAction();
      String[] arrayOfString = { str1 };
      if ((str2 != null) && (!str2.equals("app_error")))
      {
        new Parser().uPnPResponseParser(localRulesDBPathResponseBean, 12, str2);
        localArrayList.add(localRulesDBPathResponseBean.getStrRulesDBPath());
        if (paramString != null) {
          UploadFileUtil.writeDBToDevice(paramString, localRulesDBPathResponseBean.getStrRulesDBPath().toString());
        }
        Action localAction = this.mDeviceList.getDevice(i).getAction("SetRulesDBVersion");
        setArgument(localAction, Constants.SET_DB_VER_ARGS, arrayOfString);
        String str3 = localAction.postControlAction();
        LogUtils.infoLog("UpnpDeviceList", "SET DB VERSION UPNP CMD RESPONSE: " + str3);
      }
    }
    if (localArrayList.size() > 0) {
      localSharePreferences.setDBVersion(str1);
    }
    return localArrayList;
  }
  
  public JSONObject getDevice(String paramString)
    throws JSONException
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    DeviceInformation localDeviceInformation = DevicePlugin.mDLM.getDevice(paramString);
    LogUtils.infoLog("UpnpDeviceList", "control point size:" + localControlPoint.getDeviceList().size());
    if (localControlPoint.getDeviceList().size() == 0)
    {
      if (DevicePlugin.mWeMoSDKContext == null) {
        DevicePlugin.mWeMoSDKContext = WeMoSDKContext.getInstance(this.mContext);
      }
      localControlPoint = (ControlPoint)DevicePlugin.mWeMoSDKContext.getUpnpControl();
    }
    Device localDevice = localControlPoint.getDevice(paramString);
    JSONObject localJSONObject1 = null;
    String str3;
    if (localDevice != null)
    {
      localJSONObject1 = new JSONObject();
      localJSONObject1.put("friendlyName", localDevice.getFriendlyName());
      localJSONObject1.put("type", localDevice.getDeviceType());
      localJSONObject1.put("udn", localDevice.getUDN());
      String str1 = localDevice.getBrandName();
      String str2 = localDeviceInformation.getCountDownEndTime();
      if (!str1.equals("")) {
        localJSONObject1.put("brandName", str1);
      }
      if (!str2.equals("")) {
        localJSONObject1.put("RuleAutoOffTime", str2);
      }
      str3 = paramString.trim();
    }
    for (;;)
    {
      String str6;
      try
      {
        if ((udns.get(str3) == null) || (System.currentTimeMillis() - ((Date)udns.get(str3)).getTime() > this.SEARCH_EXPIRY_INTERVAL))
        {
          String str4 = localDevice.getLocation();
          String str5;
          if (str4 != null)
          {
            str5 = str4.replace("setup.xml", "icon.jpg");
            if (str5 != null)
            {
              udns.put(str3, new Date());
              udnIcons.put(str3, str5);
            }
            localJSONObject1.put("iconUrl", localDeviceInformation.getIcon());
            localJSONObject1.put("serialNumber", localDevice.getSerialNumber());
            str6 = WeMoSDKContext.getInstance(this.mContext).getWeMoDeviceByUDN(str3).getAttribute();
            if (!str6.equals("")) {
              break label552;
            }
            if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:insight:1"))
            {
              localJSONObject1.put("attributeList", getInsightParamsJSONObjectFramework(localDevice.getUDN()));
              LogUtils.infoLog("UpnpDeviceList", "get device crockpot:" + localJSONObject1 + "---" + localControlPoint.getDeviceList().size() + "---" + this.mDeviceList.size());
              return localJSONObject1;
            }
          }
          else
          {
            str5 = getIconUrl(str3);
            continue;
          }
        }
        else
        {
          LogUtils.infoLog("UpnpDeviceList", "getDevice() got icon url from cache for udn: " + str3);
          continue;
        }
        localJSONObject2 = new JSONObject();
      }
      finally {}
      JSONObject localJSONObject2;
      localJSONObject2.put(JSONConstants.BINARY_STATE, WeMoSDKContext.getInstance(this.mContext).getWeMoDeviceByUDN(str3).getState());
      localJSONObject1.put("attributeList", localJSONObject2);
      continue;
      label552:
      localJSONObject1.put("attributeList", str6);
    }
  }
  
  protected DeviceList getDeviceList()
  {
    return DeviceListManager.getInstance(this.mContext).getUpnpControl().getDeviceList();
  }
  
  public void getDevicePreset(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    LogUtils.infoLog("UpnpDeviceList", "getDevicePreset: presetsInfo: " + paramJSONArray.toString());
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mBridgeUdn = paramJSONArray.getJSONObject(0).getString("bridgeUdn");
    LogUtils.infoLog("UpnpDeviceList", "mBridgeUdn: " + this.mBridgeUdn);
    String str = this.mBridgeUdn;
    int i = 0;
    if (str != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      i = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("getDevicePreset");
        i = 0;
        if (localAction != null)
        {
          localAction.setArgumentValue("devicePresetData", createGetPresetRequest(paramJSONArray));
          GetPresetCallback localGetPresetCallback = new GetPresetCallback(paramSetAndGetActionCallBack);
          i = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localGetPresetCallback, localGetPresetCallback);
        }
      }
    }
    if (i == 0) {
      paramSetAndGetActionCallBack.onError();
    }
  }
  
  public String getDeviceState(Device paramDevice)
  {
    Object localObject = "0";
    try
    {
      Action localAction = paramDevice.getAction("GetBinaryState");
      localAction.postControlAction();
      ArgumentList localArgumentList = localAction.getOutputArgumentList();
      for (int i = 0;; i++) {
        if (i < localArgumentList.size())
        {
          String str = localArgumentList.getArgument(i).getValue();
          localObject = str;
          if (localObject == null) {}
        }
        else
        {
          return (String)localObject;
        }
      }
      return "0";
    }
    catch (Exception localException) {}
  }
  
  public JSONArray getDoorWindowSensorsList()
    throws JSONException
  {
    JSONArray localJSONArray1 = new JSONArray();
    if ((this.jsonBridgeArray != null) && (this.jsonBridgeArray.length() > 0)) {
      for (int i = 0; i < this.jsonBridgeArray.length(); i++)
      {
        new JSONObject();
        JSONObject localJSONObject1 = this.jsonBridgeArray.getJSONObject(i);
        String str1 = localJSONObject1.toString();
        JSONArray localJSONArray2;
        int j;
        if ((!TextUtils.isEmpty(str1)) && (str1.contains("GroupID")))
        {
          localJSONArray2 = localJSONObject1.getJSONArray("GroupIDS");
          if (localJSONArray2 != null) {
            j = 0;
          }
        }
        else
        {
          while (j < localJSONArray2.length())
          {
            JSONObject localJSONObject3 = localJSONArray2.getJSONObject(j);
            JSONObject localJSONObject4 = new JSONObject();
            String str4 = localJSONObject3.getString("ModelCode");
            if ((!TextUtils.isEmpty(str4)) && (str4.equals("F7C038")))
            {
              String str5 = this.mBridgeUdn + ":" + localJSONObject3.getString("DeviceID");
              localJSONObject4.put("friendlyName", localJSONObject3.getString("FriendlyName"));
              localJSONObject4.put("udn", str5);
              localJSONObject4.put("bridgeudn", this.mBridgeUdn);
              localJSONObject4.put("ProductName", WemoUtils.getProductName(str4));
              localJSONArray1.put(localJSONObject4);
            }
            j++;
            continue;
            if ((!TextUtils.isEmpty(str1)) && (!str1.contains("GroupID")))
            {
              String str2 = localJSONObject1.getString("ModelCode");
              if ((!TextUtils.isEmpty(str2)) && (str2.equals("F7C038")))
              {
                JSONObject localJSONObject2 = new JSONObject();
                String str3 = this.mBridgeUdn + ":" + localJSONObject1.getString("DeviceID");
                localJSONObject2.put("friendlyName", localJSONObject1.getString("FriendlyName"));
                localJSONObject2.put("udn", str3);
                localJSONObject2.put("bridgeudn", this.mBridgeUdn);
                localJSONObject2.put("ProductName", WemoUtils.getProductName(str2));
                localJSONArray1.put(localJSONObject2);
              }
            }
          }
        }
      }
    }
    LogUtils.infoLog("UpnpDeviceList", "Door and Window Sensor Devices** " + localJSONArray1);
    return localJSONArray1;
  }
  
  public String getEmailData()
    throws JSONException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    int i = 0;
    if (i < localControlPoint.getDeviceList().size())
    {
      Device localDevice = localControlPoint.getDeviceList().getDevice(i);
      label64:
      String str;
      if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:controllee:1"))
      {
        localStringBuilder.append("Switch, ");
        if (!localDevice.getFriendlyName().contains("Bridge")) {
          break label587;
        }
        str = "WeMo Link";
        label83:
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1"))
        {
          if (str.lastIndexOf(';') <= 0) {
            break label597;
          }
          str = str.substring(0, str.lastIndexOf(';'));
        }
      }
      for (;;)
      {
        localStringBuilder.append(getMacAddress(localDevice) + ", ").append(getCurrentFirmwareVersion(localDevice) + ", ").append(getSignalStrenght(localDevice) + ", ").append(str + ", ").append("Unavailable : NO, ").append("Device Extended Meta Info : NA").append("\n").append("\n");
        i++;
        break;
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:sensor:1"))
        {
          localStringBuilder.append("Sensor, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:lightswitch:1"))
        {
          localStringBuilder.append("Light Switch, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1"))
        {
          localStringBuilder.append("NetCam, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:insight:1"))
        {
          localStringBuilder.append("Insight, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:bridge:1"))
        {
          localStringBuilder.append("WeMo Link, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1"))
        {
          localStringBuilder.append("Coffee Maker, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:Crockpot:1"))
        {
          localStringBuilder.append("Slow Cooker, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:HeaterA:1"))
        {
          localStringBuilder.append("Heater A, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:HeaterB:1"))
        {
          localStringBuilder.append("Heater B, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:AirPurifier:1"))
        {
          localStringBuilder.append("Air Purifier, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:Humidifier:1"))
        {
          localStringBuilder.append("Humidifier, ");
          break label64;
        }
        if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:HumidifierB:1"))
        {
          localStringBuilder.append("HumidifierB, ");
          break label64;
        }
        if (!localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:Maker:1")) {
          break label64;
        }
        localStringBuilder.append("Maker, ");
        break label64;
        label587:
        str = localDevice.getFriendlyName();
        break label83;
        label597:
        if (str.lastIndexOf(',') > 0) {
          str = str.substring(0, str.lastIndexOf(','));
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  public void getEmergencyContacts(GetDataStoreOnLinkCallBack paramGetDataStoreOnLinkCallBack)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    String str = this.mBridgeUdn;
    int j = 0;
    if (str != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      j = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("GetDataStores");
        j = 0;
        if (localAction != null)
        {
          localAction.setArgumentValue("DataStores", createGetEmergencyContactRequest());
          GetPostActionCallback localGetPostActionCallback = new GetPostActionCallback(paramGetDataStoreOnLinkCallBack);
          j = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localGetPostActionCallback, localGetPostActionCallback);
        }
      }
    }
    if (j == 0) {
      paramGetDataStoreOnLinkCallBack.onError();
    }
  }
  
  public ArrayList<String> getFirmwareDetailsList(String paramString)
  {
    ArrayList localArrayList = this.mMoreUtil.getFirmwareDetailsUSWW(paramString);
    if ((localArrayList != null) && (localArrayList.size() > 0))
    {
      String[] arrayOfString1 = (String[])localArrayList.toArray(new String[localArrayList.size()]);
      int i = arrayOfString1.length;
      for (int j = 0; j < i; j++)
      {
        String[] arrayOfString2 = arrayOfString1[j].split("\\r?\\n");
        if (arrayOfString2[0].equalsIgnoreCase("WeMoLightSwitch")) {
          this.lightSwitchFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoSignedLightSwitch")) {
          this.signedLightSwitchFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoInsight")) {
          this.insightFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoSignedInsight")) {
          this.signedInsightFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoEU")) {
          this.euFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoUS")) {
          this.usFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoSignedEU")) {
          this.signedEUFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoSignedUS")) {
          this.signedUSFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_BRIDGE")) {
          this.bridgeFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_CROCKPOT")) {
          this.slowCookerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_Maker")) {
          this.makerFW = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_CoffeeMaker")) {
          this.cofeeMakerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_Heater")) {
          this.heaterFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_HeaterA")) {
          this.heaterAFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_HeaterB")) {
          this.heaterBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_Humidifier")) {
          this.humidifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_HumidifierB")) {
          this.humidifierBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_AirPurifier")) {
          this.airPurifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_Bulb")) {
          this.wemobulbFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_OsramGardenSpotLED")) {
          this.gardenSpotFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_OsramTWBulb")) {
          this.tempTunableFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoWW_OsramFlexLED")) {
          this.flexLEDFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTAirPurifier")) {
          this.openWRTAirPurifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTCoffeeMaker")) {
          this.openWRTCoffeeMakerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTCROCKPOT")) {
          this.openWRTSlowCookerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTHeaterA")) {
          this.openWRTHeaterAFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTHeaterB")) {
          this.openWRTHeaterBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTHumidifier")) {
          this.openWRTHumidifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTHumidifierB")) {
          this.openWRTHumidifierBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTInsight")) {
          this.openWRTinsightFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTLightSwitch")) {
          this.openWRTLSFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTMaker")) {
          this.openWRTMakerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTSNS")) {
          this.openWRTsnsFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransAirPurifier")) {
          this.openWRTTransAirPurifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransCoffeeMaker")) {
          this.openWRTTransCoffeeMakerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransCROCKPOT")) {
          this.openWRTTransSlowCookerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransHeaterA")) {
          this.openWRTTransHeaterAFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransHeaterB")) {
          this.openWRTTransHeaterBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransHumidifier")) {
          this.openWRTTransHumidifierFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransHumidifierB")) {
          this.openWRTTransHumidifierBFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransInsight")) {
          this.openWRTTransinsightFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransLightSwitch")) {
          this.openWRTTransLSFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransMaker")) {
          this.openWRTTransMakerFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTTransSNS")) {
          this.openWRTTranssnsFw = arrayOfString2;
        }
        if (arrayOfString2[0].equalsIgnoreCase("WeMoOpenWRTInsight_v2")) {
          this.openWRTInsightV2 = arrayOfString2;
        }
      }
    }
    return localArrayList;
  }
  
  public JSONArray getFobSensorList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    if ((this.jsonBridgeArray != null) && (this.jsonBridgeArray.length() > 0)) {
      for (int i = 0; i < this.jsonBridgeArray.length(); i++)
      {
        JSONObject localJSONObject1 = new JSONObject();
        new JSONObject();
        JSONObject localJSONObject2 = this.jsonBridgeArray.getJSONObject(i);
        String str1 = localJSONObject2.toString();
        if ((!TextUtils.isEmpty(str1)) && (!str1.contains("GroupID")))
        {
          String str2 = localJSONObject2.getString("ModelCode");
          if ((!TextUtils.isEmpty(str2)) && (str2.equals("F7C039")))
          {
            String str3 = this.mBridgeUdn + ":" + localJSONObject2.getString("DeviceID");
            localJSONObject1.put("friendlyName", localJSONObject2.getString("FriendlyName"));
            localJSONObject1.put("udn", str3);
            localJSONObject1.put("bridgeudn", this.mBridgeUdn);
            localJSONObject1.put("ProductName", WemoUtils.getProductName(str2));
            localJSONArray.put(localJSONObject1);
          }
        }
        LogUtils.infoLog("UpnpDeviceList", "Fob Sensor Devices**" + localJSONArray);
      }
    }
    return localJSONArray;
  }
  
  public String getFriendlyName(String paramString)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.jsonObject = new JSONObject();
    try
    {
      String str = localControlPoint.getDevice(paramString).getFriendlyName();
      return str;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("UpnpDeviceList", "exception in getFriendlyName: " + localException);
    }
    return "";
  }
  
  public String getIconURLByUDN(String paramString)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    try
    {
      String str = localControlPoint.getDevice(paramString).getAction("GetIconURL").postControlAction();
      return str;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "";
  }
  
  public String getIconUrl(String paramString)
    throws JSONException
  {
    Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString);
    localObject = "";
    try
    {
      Action localAction = localDevice.getAction("GetIconURL");
      localAction.postControlAction();
      ArgumentList localArgumentList = localAction.getOutputArgumentList();
      if (localArgumentList.size() > 0)
      {
        Iterator localIterator = localArgumentList.iterator();
        while (localIterator.hasNext())
        {
          String str = ((Argument)localIterator.next()).getValue();
          localObject = str;
        }
      }
      return (String)localObject;
    }
    catch (Exception localException)
    {
      localObject = "";
    }
  }
  
  public JSONArray getInsightList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++)
    {
      Device localDevice = localControlPoint.getDeviceList().getDevice(i);
      LogUtils.infoLog("Device friendly name", localDevice.getFriendlyName());
      JSONObject localJSONObject = new JSONObject();
      if (localDevice.getDeviceType().equalsIgnoreCase("urn:Belkin:device:insight:1"))
      {
        localJSONObject.put("friendlyName", localDevice.getFriendlyName());
        localJSONObject.put("udn", localDevice.getUDN());
        localJSONArray.put(localJSONObject);
      }
    }
    return localJSONArray;
  }
  
  public JSONObject getInsightParamsJSONObject(String paramString)
    throws JSONException
  {
    Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString).getAction("GetInsightParams");
    localAction.postControlAction();
    String str = null;
    ArgumentList localArgumentList = localAction.getOutputArgumentList();
    for (int i = 0; i < localArgumentList.size(); i++) {
      str = localArgumentList.getArgument(i).getValue();
    }
    String[] arrayOfString = str.split("\\|");
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("state", arrayOfString[0]);
    localJSONObject.put(JSONConstants.INSIGHT_STATE_CHANGE_TS, arrayOfString[1]);
    localJSONObject.put(JSONConstants.INSIGHT_ON_FOR, arrayOfString[2]);
    localJSONObject.put(JSONConstants.INSIGHT_TTTON, arrayOfString[3]);
    localJSONObject.put(JSONConstants.INSIGHT_PAST_14_TOTAL_TIME, arrayOfString[4]);
    localJSONObject.put(JSONConstants.INSIGHT_HRS_CONNECTED, arrayOfString[5]);
    localJSONObject.put(JSONConstants.INSIGHT_AVG_POWER_ON, arrayOfString[6]);
    localJSONObject.put(JSONConstants.INSIGHT_POWER_NOW, arrayOfString[7]);
    localJSONObject.put(JSONConstants.INSIGHT_TODAY_TOTAL_KWH, arrayOfString[8]);
    localJSONObject.put(JSONConstants.INSIGHT_PAST_14_DAYS_KWH, arrayOfString[9]);
    localJSONObject.put(JSONConstants.INSIGHT_POWER_THRESHOLD, arrayOfString[10]);
    return localJSONObject;
  }
  
  public JSONObject getInsightParamsJSONObjectFramework(String paramString)
    throws JSONException
  {
    JSONObject localJSONObject1 = new JSONObject("{}");
    try
    {
      JSONObject localJSONObject2 = getInsightParamsOutputObject(postActionObjectControlAction(paramString, "GetInsightParams"), paramString);
      return localJSONObject2;
    }
    catch (Exception localException) {}
    return localJSONObject1;
  }
  
  public JSONObject getInsightParamsOutputObject(Action paramAction, String paramString)
    throws JSONException
  {
    String str = null;
    ArgumentList localArgumentList = paramAction.getOutputArgumentList();
    for (int i = 0; i < localArgumentList.size(); i++) {
      str = localArgumentList.getArgument(i).getValue();
    }
    String[] arrayOfString = str.split("\\|");
    new JSONObject();
    JSONObject localJSONObject = getActionResultValuesJSONObject(paramString, "GetInsightHomeSettings", UpnpConstants.GET_ENERGY_PER_UNIT_COST_DATA);
    localJSONObject.put(JSONConstants.BINARY_STATE, arrayOfString[0]);
    localJSONObject.put(JSONConstants.INSIGHT_STATE_CHANGE_TS, arrayOfString[1]);
    localJSONObject.put(JSONConstants.INSIGHT_ON_FOR, arrayOfString[2]);
    localJSONObject.put(JSONConstants.INSIGHT_TTTON, arrayOfString[3]);
    localJSONObject.put(JSONConstants.INSIGHT_PAST_14_TOTAL_TIME, arrayOfString[4]);
    localJSONObject.put(JSONConstants.INSIGHT_HRS_CONNECTED, arrayOfString[5]);
    localJSONObject.put(JSONConstants.INSIGHT_AVG_POWER_ON, arrayOfString[6]);
    localJSONObject.put(JSONConstants.INSIGHT_POWER_NOW, arrayOfString[7]);
    localJSONObject.put(JSONConstants.INSIGHT_TODAY_TOTAL_KWH, arrayOfString[8]);
    localJSONObject.put(JSONConstants.INSIGHT_PAST_14_DAYS_KWH, arrayOfString[9]);
    localJSONObject.put(JSONConstants.INSIGHT_POWER_THRESHOLD, arrayOfString[10]);
    return localJSONObject;
  }
  
  public String getLatestDBVersion(Context paramContext)
  {
    LogUtils.infoLog("Inside getLatestDBVersion", "1");
    RulesDBVersionResponseBean localRulesDBVersionResponseBean = new RulesDBVersionResponseBean();
    RulesDBPathResponseBean localRulesDBPathResponseBean = new RulesDBPathResponseBean();
    Object localObject = "";
    String str1 = "";
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    LogUtils.infoLog("UpnpDeviceList", "getLatestDBVersion :: the device list size is:: " + this.mDeviceList.size());
    int i = 0;
    label202:
    label252:
    String str2;
    if (i < this.mDeviceList.size())
    {
      String str3 = this.mDeviceList.getDevice(i).getAction("GetRulesDBVersion").postControlAction();
      String str4 = this.mDeviceList.getDevice(i).getAction("GetRulesDBPath").postControlAction();
      if ((str3 != null) && (!str3.equals("app_error")) && (str4 != null))
      {
        Parser localParser = new Parser();
        localParser.uPnPResponseParser(localRulesDBVersionResponseBean, 13, str3);
        localParser.uPnPResponseParser(localRulesDBPathResponseBean, 12, str4);
        if (localRulesDBVersionResponseBean != null) {
          str1 = localRulesDBVersionResponseBean.getStrRulesDBVersion();
        }
        int m;
        if (((String)localObject).equalsIgnoreCase(""))
        {
          m = 0;
          if (!str1.equalsIgnoreCase("")) {
            break label252;
          }
        }
        for (int n = 0;; n = Integer.parseInt(str1))
        {
          if ((((String)localObject).equalsIgnoreCase("")) || (m < n)) {
            localObject = str1;
          }
          i++;
          break;
          m = Integer.parseInt((String)localObject);
          break label202;
        }
      }
      str2 = null;
    }
    int j;
    int k;
    do
    {
      return str2;
      if ((localObject == null) || (((String)localObject).equalsIgnoreCase(""))) {
        break label409;
      }
      j = Integer.parseInt(localSharePreferences.getDBVersion());
      LogUtils.infoLog("UpnpDeviceList", "Local DB Version --- " + j);
      k = Integer.parseInt((String)localObject);
      LogUtils.infoLog("UpnpDeviceList", "Remote DB Version --- " + k);
      if (j >= k) {
        break;
      }
      System.out.println("Download and use the plugin db");
      str2 = localRulesDBPathResponseBean.getStrRulesDBPath();
    } while (str2 == null);
    localSharePreferences.setDBVersion((String)localObject);
    return str2;
    if (j >= k)
    {
      System.out.println("Use the local db");
      return "Use local DB";
    }
    label409:
    return null;
  }
  
  public JSONArray getLedDeviceStatus(String paramString)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    Object localObject = new JSONArray();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      LogUtils.debugLog("UpnpDeviceList", "device ID getled***" + paramString + "--" + this.mBridgeUdn);
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("GetDeviceStatus");
      setArgument(localAction, UpnpConstants.ARGS_DEVICEIDS, new String[] { paramString });
      String str = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "get led devices status ===+" + str);
      if (str != null)
      {
        JSONArray localJSONArray = new GetDeviceListStatusResponse().parseForDeviceListStatus(str);
        localObject = localJSONArray;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    LogUtils.debugLog("UpnpDeviceList", "json array of getleddevice status:" + localObject);
    return (JSONArray)localObject;
  }
  
  public String getMacAddress(Device paramDevice)
  {
    String str1 = "";
    String str2 = paramDevice.getAction("GetMetaInfo").postControlAction();
    MetaDataResponseBean localMetaDataResponseBean = new MetaDataResponseBean();
    if ((str2 != null) && (!str2.equals("app_error")))
    {
      localMetaDataResponseBean.setMetadata(str2);
      if (localMetaDataResponseBean.strMacAddress.contains(">")) {
        str1 = localMetaDataResponseBean.strMacAddress.substring(1 + localMetaDataResponseBean.strMacAddress.lastIndexOf(">"));
      }
    }
    else
    {
      return str1;
    }
    return localMetaDataResponseBean.strMacAddress;
  }
  
  public String getMacAddressByUDN(String paramString)
  {
    Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString);
    String str1 = "";
    String str2 = localDevice.getAction("GetMetaInfo").postControlAction();
    MetaDataResponseBean localMetaDataResponseBean = new MetaDataResponseBean();
    if ((str2 != null) && (!str2.equals("app_error")))
    {
      localMetaDataResponseBean.setMetadata(str2);
      if (!localMetaDataResponseBean.strMacAddress.contains(">")) {
        break label164;
      }
    }
    StringBuffer localStringBuffer;
    label164:
    for (str1 = localMetaDataResponseBean.strMacAddress.substring(1 + localMetaDataResponseBean.strMacAddress.lastIndexOf(">"));; str1 = localMetaDataResponseBean.strMacAddress)
    {
      localStringBuffer = new StringBuffer();
      for (int i = 1; i <= str1.length(); i++)
      {
        localStringBuffer.append(str1.charAt(i - 1));
        if ((i % 2 == 0) && (i < str1.length())) {
          localStringBuffer.append(":");
        }
      }
    }
    return localStringBuffer.toString();
  }
  
  public String getMacAddresswithColon(String paramString)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    for (int i = 1; i <= paramString.length(); i++)
    {
      localStringBuffer.append(paramString.charAt(i - 1));
      if ((i % 2 == 0) && (i < paramString.length())) {
        localStringBuffer.append(":");
      }
    }
    return localStringBuffer.toString();
  }
  
  public boolean getMakerFirmwareVersion(String paramString)
    throws JSONException
  {
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      Device localDevice = localControlPoint.getDevice(paramString);
      String str = localDevice.getDeviceType();
      Action localAction = localDevice.getAction("GetFirmwareVersion");
      if (localAction.postControlAction() != null)
      {
        ArgumentList localArgumentList = localAction.getOutputArgumentList();
        if (localArgumentList.size() < 0)
        {
          String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
          this.jsonObject = new JSONObject();
          String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
          LogUtils.verboseLog("UpnpDeviceList", "FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
          boolean bool = localRuleUtility.firmwareSupportMakerRule(arrayOfString2[1], str);
          return bool;
        }
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return true;
  }
  
  public boolean getMotionNotifyFirmwareVersionByUDN(String paramString)
    throws JSONException
  {
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      LogUtils.debugLog("UpnpDeviceList", "version udn::::" + paramString);
      Device localDevice = localControlPoint.getDevice(paramString);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("GetFirmwareVersion");
        if (localAction.postControlAction() != null)
        {
          ArgumentList localArgumentList = localAction.getOutputArgumentList();
          if ((localArgumentList != null) && (localArgumentList.size() > 0))
          {
            String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
            this.jsonObject = new JSONObject();
            String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
            LogUtils.verboseLog("UpnpDeviceList", "FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
            boolean bool = localRuleUtility.isFirmwareValidForMotionNotify(arrayOfString2[1]);
            LogUtils.debugLog("UpnpDeviceList", "fw : " + bool);
            return bool;
          }
        }
      }
    }
    catch (Exception localException)
    {
      LogUtils.debugLog("UpnpDeviceList", "getSOFirmwareVersionByUDN Exception: " + localException.getMessage());
      LogUtils.debugLog("UpnpDeviceList", "getSOFirmwareVersionByUDN returning default");
    }
    return true;
  }
  
  public String getNightLightStatus(String[] paramArrayOfString)
  {
    Object localObject = "0";
    try
    {
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramArrayOfString[0]).getAction("GetNightLightStatus");
      String str1 = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "GET NIGHT LIGHT STATUS :: " + str1);
      ArgumentList localArgumentList = localAction.getOutputArgumentList();
      for (int i = 0;; i++) {
        if (i < localArgumentList.size())
        {
          String str2 = localArgumentList.getArgument(i).getValue();
          localObject = str2;
          if (localObject == null) {}
        }
        else
        {
          return (String)localObject;
        }
      }
      return "0";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      LogUtils.errorLog("UpnpDeviceList", "GET NIGHT LIGHT STATUS :: " + localException);
    }
  }
  
  public JSONArray getPIRSensorList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    if ((this.jsonBridgeArray != null) && (this.jsonBridgeArray.length() > 0)) {
      for (int i = 0; i < this.jsonBridgeArray.length(); i++)
      {
        JSONObject localJSONObject1 = new JSONObject();
        new JSONObject();
        JSONObject localJSONObject2 = this.jsonBridgeArray.getJSONObject(i);
        String str1 = localJSONObject2.toString();
        if ((!TextUtils.isEmpty(str1)) && (!str1.contains("GroupID")))
        {
          String str2 = localJSONObject2.getString("ModelCode");
          if ((!TextUtils.isEmpty(str2)) && (str2.equals("F7C041")))
          {
            String str3 = this.mBridgeUdn + ":" + localJSONObject2.getString("DeviceID");
            localJSONObject1.put("friendlyName", localJSONObject2.getString("FriendlyName"));
            localJSONObject1.put("udn", str3);
            localJSONObject1.put("bridgeudn", this.mBridgeUdn);
            localJSONObject1.put("ProductName", WemoUtils.getProductName(str2));
            localJSONArray.put(localJSONObject1);
          }
        }
      }
    }
    LogUtils.infoLog("UpnpDeviceList", "PIR Sensor Devices**" + localJSONArray);
    return localJSONArray;
  }
  
  public String getPragmaFromDB(Context paramContext)
  {
    RuleUtility localRuleUtility = new RuleUtility(paramContext);
    try
    {
      String str = localRuleUtility.getPragmaVersion();
      return str;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("getPragmaFromDB", localException.getMessage());
    }
    return "";
  }
  
  public JSONObject getRegistrationData()
  {
    this.jsonObject = null;
    String[] arrayOfString = new String[1];
    arrayOfString[0] = getRegistrationDataArgs();
    try
    {
      LogUtils.verboseLog("UpnpDeviceList", "getRegistrationData before MDevice:" + this.mDevice + " hash: " + this.mDevice.hashCode() + " this: " + this);
      printDeviceList();
      Action localAction = this.mDevice.getAction("GetRegistrationData");
      setArgument(localAction, UpnpConstants.SET_REGISTRATION_DATA_ARGS, arrayOfString);
      this.jsonObject = sendSmartSetupRequest(localAction, this.jsonObject);
      return this.jsonObject;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public JSONObject getRegistrationStatus()
  {
    this.jsonObject = null;
    try
    {
      LogUtils.verboseLog("UpnpDeviceList", "getRegistrationStatus before MDevice:" + this.mDevice + " hash: " + this.mDevice.hashCode() + " this: " + this);
      printDeviceList();
      Action localAction = this.mDevice.getAction("GetRegistrationStatus");
      LogUtils.verboseLog("UpnpDeviceList", "getRegistrationStatus after MDevice:" + this.mDevice.getSerialNumber() + " hash: " + this.mDevice.hashCode() + " action: " + localAction);
      if (localAction == null)
      {
        LogUtils.errorLog("UpnpDeviceList", "getRegistrationStatus MDevice:" + this.mDevice.getSerialNumber() + " action is null, not supported FW");
        return null;
      }
      this.jsonObject = sendSmartSetupRequest(localAction, this.jsonObject);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return this.jsonObject;
  }
  
  public boolean getSOFirmwareVersionByUDN(String paramString)
    throws JSONException
  {
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList = localControlPoint.getDeviceList();
    try
    {
      LogUtils.debugLog("UpnpDeviceList", "version udn::::" + paramString);
      Device localDevice = localControlPoint.getDevice(paramString);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("GetFirmwareVersion");
        if (localAction.postControlAction() != null)
        {
          ArgumentList localArgumentList = localAction.getOutputArgumentList();
          if ((localArgumentList != null) && (localArgumentList.size() > 0))
          {
            String[] arrayOfString1 = localArgumentList.getArgument(0).getValue().toString().split("\\|");
            this.jsonObject = new JSONObject();
            String[] arrayOfString2 = arrayOfString1[0].toString().split(":");
            LogUtils.verboseLog("UpnpDeviceList", "FirmWare : " + arrayOfString2[1] + " : UDN - " + localDevice.getUDN());
            boolean bool = localRuleUtility.isFirmwareValidForSO(arrayOfString2[1]);
            LogUtils.debugLog("UpnpDeviceList", "fw : " + bool);
            return bool;
          }
        }
      }
    }
    catch (Exception localException)
    {
      LogUtils.debugLog("UpnpDeviceList", "getSOFirmwareVersionByUDN Exception: " + localException.getMessage());
      LogUtils.debugLog("UpnpDeviceList", "getSOFirmwareVersionByUDN returning default");
    }
    return true;
  }
  
  public String getSignalStrenght(Device paramDevice)
  {
    String str1 = "";
    ServiceList localServiceList = paramDevice.getServiceList();
    for (int i = 0; i < localServiceList.size(); i++)
    {
      Action localAction = localServiceList.getService(i).getAction("GetSignalStrength");
      if (localAction != null)
      {
        String str2 = localAction.postControlAction();
        if (str2 != null)
        {
          SignalStrengthResponseBean localSignalStrengthResponseBean = new SignalStrengthResponseBean();
          new Parser().uPnPResponseParser(localSignalStrengthResponseBean, 14, str2);
          if ((localSignalStrengthResponseBean != null) && (localSignalStrengthResponseBean.getSignalStrength() != null))
          {
            str1 = localSignalStrengthResponseBean.getSignalStrength();
            System.out.println(" signal strength is ***************   " + str1);
          }
        }
      }
    }
    return str1;
  }
  
  public String getStringFromResponse(String paramString1, String paramString2)
  {
    Parser localParser = new Parser();
    ValueFromSoapResponse localValueFromSoapResponse = new ValueFromSoapResponse();
    localParser.uPnPResponseParserSOAP(localValueFromSoapResponse, 16, paramString1, paramString2);
    return localValueFromSoapResponse.getStrValue();
  }
  
  public JSONObject getWeMoDeviceList()
    throws JSONException, DatabaseException
  {
    this.jsonObject = new JSONObject();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mDeviceList.clear();
    this.mDeviceList = localControlPoint.getDeviceList();
    LogUtils.verboseLog("UpnpDeviceList", "JSONArray getWeMoDeviceList() :: Size() " + this.mDeviceList.size());
    if (this.mDeviceList.size() > 0)
    {
      ArrayList localArrayList = new ArrayList();
      for (int i = 0; i < this.mDeviceList.size(); i++) {
        localArrayList.add(this.mDeviceList.getDevice(i).getUDN());
      }
      this.jsonObject.put("deviceUdnList", localArrayList);
    }
    return this.jsonObject;
  }
  
  public String getWeMoSSID(String paramString)
  {
    try
    {
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString).getAction("GetMetaInfo");
      LogUtils.infoLog("UpnpDeviceList", "getWeMoSSID :: udn is::" + paramString + " action  is::" + localAction);
      String str = localAction.postControlAction();
      String[] arrayOfString = new String[7];
      MetaDataResponseBean localMetaDataResponseBean = new MetaDataResponseBean();
      if ((str != null) && (!str.equals("app_error")))
      {
        new Parser().uPnPResponseParser(localMetaDataResponseBean, 9, str);
        if (localMetaDataResponseBean != null) {
          return localMetaDataResponseBean.getMetadata().split("\\|")[4];
        }
      }
      LogUtils.verboseLog("UpnpDeviceList", "getWeMoSSID(String udn) :: SSID - " + arrayOfString[4]);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return "";
  }
  
  public boolean isFirmwareAvailable(String paramString, JSONArray paramJSONArray)
  {
    this.firmDetailsList = getFirmwareDetailsList(paramString);
    int i;
    if ((this.firmDetailsList != null) && (this.firmDetailsList.size() > 0) && (paramJSONArray != null))
    {
      i = 0;
      for (;;)
      {
        try
        {
          if (i >= paramJSONArray.length()) {
            continue;
          }
          str1 = "";
          localJSONObject = paramJSONArray.getJSONObject(i);
          LogUtils.infoLog("UpnpDeviceList", "currentFirmwareVersion:" + localJSONObject.toString());
          str2 = localJSONObject.getString("devicefirmware");
          if (localJSONObject == null) {
            continue;
          }
          str3 = localJSONObject.getString("type");
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:lightswitch:1")) {
            continue;
          }
          if (this.openWRTTransLSFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareForLightSwitch(localJSONObject.getString("devicefirmware"), this.lightSwitchFW, this.openWRTTransLSFw, this.openWRTLSFw);
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
          return false;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:insight:1")) {
            continue;
          }
          str4 = localJSONObject.getString("hwVersion");
          if ((!str4.isEmpty()) && (!str4.equalsIgnoreCase("v1"))) {
            continue;
          }
          if (this.openWRTTransinsightFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareForInsight(localJSONObject.getString("devicefirmware"), this.insightFW, this.openWRTTransinsightFw, this.openWRTinsightFw);
          continue;
          if (this.insightFW == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForInsight(localJSONObject.getString("devicefirmware"), this.insightFW, this.signedInsightFW);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "Either openWRTTransinsightFw or insightFW is null");
          continue;
        }
        catch (Exception localException)
        {
          JSONObject localJSONObject;
          String str2;
          String str3;
          LogUtils.errorLog("UpnpDeviceList", "Exception while comparing the FW versions and the exception is :: " + localException);
          continue;
          if (!str4.equalsIgnoreCase("v2")) {
            continue;
          }
          if (this.openWRTInsightV2 == null) {
            continue;
          }
          String str1 = this.mMoreUtil.compareOpenWRTFirmwareForInsightV2(localJSONObject.getString("devicefirmware"), this.openWRTInsightV2);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "openWRTInsightV2 is null");
          continue;
          if ((!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:sensor:1")) && (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:controllee:1"))) {
            continue;
          }
          if ((!str2.contains("WeMo_US")) && (!str2.contains("WeMo_WW_1.0"))) {
            continue;
          }
          if (this.openWRTTranssnsFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareForSNS(str2, this.usFW, this.openWRTTranssnsFw, this.openWRTsnsFw);
          LogUtils.infoLog("UpnpDeviceList", "the value of status is ::" + str1);
          continue;
          if (this.usFW == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForSwitchSensor(str2, this.usFW, this.signedUSFW);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "Either openWRTTranssnsFw or usFW is null");
          continue;
          if ((!str2.contains("WeMo_EU")) && (!str2.contains("WeMo_WW_2.0"))) {
            continue;
          }
          if (this.openWRTTranssnsFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareForSNS(str2, this.euFW, this.openWRTTranssnsFw, this.openWRTsnsFw);
          continue;
          if (this.euFW == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForSwitchSensor(str2, this.euFW, this.signedEUFW);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "Either openWRTTranssnsFw or euFW is null");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:Crockpot:1")) {
            continue;
          }
          if (this.openWRTTransSlowCookerFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTSlowCookerFw, "SlowCooker");
          continue;
          if (this.slowCookerFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForCrockpot(localJSONObject.getString("devicefirmware"), this.slowCookerFw);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "crockpotFw is null");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1")) {
            continue;
          }
          if (this.openWRTTransCoffeeMakerFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTCoffeeMakerFw, "CoffeeMaker");
          continue;
          if (this.cofeeMakerFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.cofeeMakerFw, "CoffeeMaker");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:Heater:1")) {
            continue;
          }
          if (this.heaterFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForWeMoSmart(localJSONObject.getString("devicefirmware"), this.heaterFw);
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:HeaterA:1")) {
            continue;
          }
          if (this.openWRTTransHeaterAFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTHeaterAFw, "HeaterA");
          continue;
          if (this.heaterAFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.heaterAFw, "HeaterA");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:HeaterB:1")) {
            continue;
          }
          if (this.openWRTTransHeaterBFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTHeaterBFw, "HeaterB");
          continue;
          if (this.heaterBFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.heaterBFw, "HeaterB");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:AirPurifier:1")) {
            continue;
          }
          if (this.openWRTTransAirPurifierFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTAirPurifierFw, "AirPurifier");
          continue;
          if (this.airPurifierFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.airPurifierFw, "AirPurifier");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:Humidifier:1")) {
            continue;
          }
          if (this.openWRTTransHumidifierFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTHumidifierFw, "Humidifier");
          continue;
          if (this.humidifierFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.humidifierFw, "Humidifier");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:HumidifierB:1")) {
            continue;
          }
          if (this.openWRTTransHumidifierBFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTHumidifierBFw, "HumidifierB");
          continue;
          if (this.humidifierBFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersions(localJSONObject.getString("devicefirmware"), this.humidifierFw, "HumidifierB");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:bridge:1")) {
            continue;
          }
          if (this.bridgeFW == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForBridge(localJSONObject.getString("devicefirmware"), this.bridgeFW[1]);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "bridgeFW is null");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("MZ100")) {
            continue;
          }
          if (this.wemobulbFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForBulb(localJSONObject.getString("devicefirmware"), this.wemobulbFw[1]);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "wemobulbFw is null");
          continue;
          if ((!str3.equalsIgnoreCase("Gardenspot RGB")) && (!str3.equalsIgnoreCase("LIGHTIFY Gardenspot RGB"))) {
            continue;
          }
          if (this.gardenSpotFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersionsBulb(localJSONObject.getString("devicefirmware"), this.gardenSpotFw[1], "Gardenspot RGB".replaceAll("\\s+", ""));
          continue;
          LogUtils.errorLog("UpnpDeviceList", "gardenSpotFw is null");
          continue;
          if ((!str3.equalsIgnoreCase("Classic A60 TW")) && (!str3.equalsIgnoreCase("LIGHTIFY A19 Tunable White"))) {
            continue;
          }
          if (this.tempTunableFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersionsBulb(localJSONObject.getString("devicefirmware"), this.tempTunableFw[1], "Classic A60 TW".replaceAll("\\s+", ""));
          continue;
          LogUtils.errorLog("UpnpDeviceList", "tempTunableFw is null");
          continue;
          if (!localJSONObject.getString("type").equalsIgnoreCase("urn:Belkin:device:Maker:1")) {
            continue;
          }
          if (this.openWRTTransMakerFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareOpenWRTFirmwareVersions(str2, this.openWRTMakerFw, "Maker");
          continue;
          if (this.makerFW == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareNEWFirmwareDataForMaker(localJSONObject.getString("devicefirmware"), this.makerFW);
          continue;
          LogUtils.errorLog("UpnpDeviceList", "makerFW is null");
          continue;
          if ((!str3.equalsIgnoreCase("Flex RGBW")) && (!str3.equalsIgnoreCase("LIGHTIFY Flex RGBW"))) {
            continue;
          }
          if (this.flexLEDFw == null) {
            continue;
          }
          str1 = this.mMoreUtil.compareFirmwareVersionsBulb(localJSONObject.getString("devicefirmware"), this.flexLEDFw[1], "Flex RGBW".replaceAll("\\s+", ""));
          continue;
          LogUtils.errorLog("UpnpDeviceList", "flexLEDFW is null");
          continue;
          i++;
        }
        if ((str1 == null) || (str1.equals(""))) {
          continue;
        }
        return true;
        if (this.lightSwitchFW != null) {
          str1 = this.mMoreUtil.compareNEWFirmwareDataForLightSwitch(localJSONObject.getString("devicefirmware"), this.lightSwitchFW, this.signedLightSwitchFW);
        } else {
          LogUtils.errorLog("UpnpDeviceList", "Either openWRTTransLSFw or lightSwitchFW is null");
        }
      }
    }
    for (;;)
    {
      String str4;
      break;
      LogUtils.infoLog("UpnpDeviceList", " Null value passed:: currentFirmwreArray ::" + paramJSONArray + " firmDetailsList:: " + this.firmDetailsList);
    }
  }
  
  public boolean newOptionsReset(String paramString1, String paramString2)
  {
    this.jsonObject = new JSONObject();
    try
    {
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction("ReSetup");
      localAction.setArgumentValue("Reset", paramString2);
      String str = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "Response : reset option : UDN : " + paramString1 + " : " + paramString2 + " : " + str);
      boolean bool;
      if (str != null) {
        bool = str.contains(UpnpConstants.ERROR);
      }
      return !bool;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("UpnpDeviceList", "Exception in resetOption: key: " + paramString2 + " : " + localException);
    }
    return false;
  }
  
  public JSONArray openBridgeNetwork()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    String str1 = "";
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    if (localControlPoint != null) {
      for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
        if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
          str1 = localControlPoint.getDeviceList().getDevice(i).getUDN();
        }
      }
    }
    localControlPoint = (ControlPoint)DevicePlugin.mWeMoSDKContext.getUpnpControl();
    str1 = localControlPoint.getDeviceList().getDevice(0).getUDN();
    LogUtils.infoLog("UpnpDeviceList", "IN OPEN NETWORK SIZE" + str1);
    if (str1.isEmpty())
    {
      if (this.mOpenBridgeRetryCount > 0)
      {
        LogUtils.infoLog("UpnpDeviceList", "mOpenBridgeRetryCount: " + this.mOpenBridgeRetryCount);
        this.mOpenBridgeRetryCount = (-1 + this.mOpenBridgeRetryCount);
        return openBridgeNetwork();
      }
      this.jsonObject.put("OpenNetwork", false);
      localJSONArray.put(this.jsonObject);
      resetOpenBridgeCounter();
      LogUtils.infoLog("UpnpDeviceList", "openBridgeNetwork() tempJsonArray: " + localJSONArray);
      return localJSONArray;
    }
    for (;;)
    {
      try
      {
        Action localAction = localControlPoint.getDevice(str1).getAction("OpenNetwork");
        setArgument(localAction, UpnpConstants.ARGS_DEVUDN, new String[] { str1 });
        String str2 = localAction.postControlAction();
        LogUtils.verboseLog("UpnpDeviceList", "=========open network====" + str2);
        if (str2 == null) {
          continue;
        }
        this.jsonObject.put("OpenNetwork", true);
        this.timeOpenNetworkCheck = (255L + System.currentTimeMillis() / 1000L);
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("UpnpDeviceList", "Exception in openBridgeNetwork(): ", localException);
        continue;
      }
      localJSONArray.put(this.jsonObject);
      break;
      this.jsonObject.put("OpenNetwork", false);
    }
  }
  
  public JSONArray parseGetEndDeviceList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    String str1 = "";
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    int j;
    if (localControlPoint != null) {
      j = 0;
    }
    for (;;)
    {
      try
      {
        if (j < localControlPoint.getDeviceList().size())
        {
          LogUtils.infoLog("UpnpDeviceList", "Control point inside*****" + localControlPoint.getDeviceList().getDevice(j).getUDN());
          if (!localControlPoint.getDeviceList().getDevice(j).getUDN().contains("Bridge")) {
            continue;
          }
          str1 = localControlPoint.getDeviceList().getDevice(j).getUDN();
          continue;
        }
        if (str1.length() > 0)
        {
          Action localAction = localControlPoint.getDevice(str1).getAction("GetEndDevices");
          String[] arrayOfString1 = UpnpConstants.GET_END_DEVICES_ARGS;
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = str1;
          arrayOfString2[1] = String.valueOf(getEndList.SCAN_LIST);
          setArgument(localAction, arrayOfString1, arrayOfString2);
          this.mResponseString = localAction.postControlAction();
          LogUtils.infoLog("UpnpDeviceList", "RESPONSE of Get end devices IS :" + this.mResponseString);
          if (this.mResponseString != null)
          {
            localJSONArray = new GetEndDeviceListResponse().parseForGetEndDeviceList(this.mResponseString);
            if ((localJSONArray == null) || (localJSONArray.length() != 0)) {
              continue;
            }
            localJSONArray.put("0");
          }
        }
      }
      catch (Exception localException)
      {
        JSONObject localJSONObject;
        String str2;
        localException.printStackTrace();
        continue;
        j++;
      }
      LogUtils.infoLog("UpnpDeviceList", "LED get end devices******" + localJSONArray);
      return localJSONArray;
      int i = 0;
      if (i < localJSONArray.length())
      {
        localJSONObject = localJSONArray.getJSONObject(i);
        if (!localJSONObject.has("ModelCode"))
        {
          str2 = (String)localJSONObject.get("FriendlyName");
          if (str2.contains("Lightbulb"))
          {
            localJSONObject.put("ModelCode", "MZ100");
            localJSONObject.put("ManufacturerName", "MRVL");
            localJSONObject.put("WemoCertified", "YES");
            localJSONObject.put("Availability", "YES");
            localJSONArray.put(localJSONObject);
            LogUtils.infoLog("UpnpDeviceList", "updated LED :" + localJSONObject);
          }
          else if (str2.contains("OSRAM"))
          {
            localJSONObject.put("ModelCode", "iQBR30");
            localJSONObject.put("ManufacturerName", "OSRAM SYLVANIA");
            localJSONObject.put("WemoCertified", "NO");
            localJSONObject.put("Availability", "YES");
            localJSONArray.put(localJSONObject);
            LogUtils.infoLog("UpnpDeviceList", "updated LED :" + localJSONObject);
            break label525;
            continue;
          }
        }
        label525:
        i++;
      }
    }
  }
  
  public JSONArray parseGetEndDeviceList(JSONArray paramJSONArray)
    throws JSONException
  {
    String str1 = "";
    this.jsonBridgeArray = new JSONArray();
    JSONArray localJSONArray = new JSONArray();
    String str2 = paramJSONArray.getString(0).toString();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    if (localControlPoint != null) {
      for (int i = 0; i < localControlPoint.getDeviceList().size(); i++)
      {
        LogUtils.errorLog("UpnpDeviceList", "Control point inside*****" + localControlPoint.getDeviceList().getDevice(i).getUDN());
        if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
          str1 = localControlPoint.getDeviceList().getDevice(i).getUDN();
        }
      }
    }
    if (str1.length() > 0) {}
    try
    {
      if (str2.equalsIgnoreCase("pairedlist"))
      {
        Action localAction2 = localControlPoint.getDevice(str1).getAction("GetEndDevices");
        String[] arrayOfString1 = UpnpConstants.GET_END_DEVICES_ARGS;
        String[] arrayOfString2 = new String[2];
        arrayOfString2[0] = str1;
        arrayOfString2[1] = String.valueOf(getEndList.PAIRED_LIST);
        setArgument(localAction2, arrayOfString1, arrayOfString2);
        this.mResponseString = localAction2.postControlAction();
        LogUtils.debugLog("UpnpDeviceList", "RESPONSE of Get end devices IS :" + this.mResponseString);
        if (this.mResponseString != null)
        {
          GetEndDeviceListResponse localGetEndDeviceListResponse = new GetEndDeviceListResponse();
          localJSONArray = localGetEndDeviceListResponse.parseForGetEndDeviceList(this.mResponseString);
          this.jsonBridgeArray = localGetEndDeviceListResponse.parseForGetEndDeviceList(this.mResponseString);
        }
        LogUtils.infoLog("UpnpDeviceList", "get end list response:******" + this.jsonBridgeArray);
        return localJSONArray;
      }
      if (str2.equalsIgnoreCase("unpairedlist")) {}
      String str3;
      for (Object localObject = String.valueOf(getEndList.SCAN_LIST);; localObject = str3)
      {
        Action localAction1 = localControlPoint.getDevice(str1).getAction("GetEndDevices");
        setArgument(localAction1, UpnpConstants.GET_END_DEVICES_ARGS, new String[] { str1, localObject });
        this.mResponseString = localAction1.postControlAction();
        LogUtils.debugLog("UpnpDeviceList", "RESPONSE of Get end devices IS :" + this.mResponseString);
        if (this.mResponseString == null) {
          break;
        }
        localJSONArray = new GetEndDeviceListResponse().parseForGetEndDeviceList(this.mResponseString);
        break;
        str3 = String.valueOf(getEndList.ALL_LIST);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        LogUtils.errorLog("UpnpDeviceList", "Exception: " + localException);
      }
    }
  }
  
  public Action postActionObjectControlAction(String paramString1, String paramString2)
  {
    Action localAction = null;
    try
    {
      localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction(paramString2);
      localAction.postControlAction();
      return localAction;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("postActionObjectControlAction()", localException.getMessage());
    }
    return localAction;
  }
  
  public JSONObject postTimeSync(Device paramDevice)
    throws JSONException
  {
    JSONObject localJSONObject1 = new JSONObject();
    if (paramDevice != null) {
      try
      {
        Action localAction = paramDevice.getAction("TimeSync");
        if (localAction != null)
        {
          setArgument(localAction, UpnpConstants.SET_TIME_SYNC_ARGS, timeSync());
          String str = localAction.postControlAction();
          if ((str != null) && (!str.contains("failure")))
          {
            JSONObject localJSONObject2 = localJSONObject1.put("TimeSync", true);
            return localJSONObject2;
          }
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    return localJSONObject1.put("TimeSync", false);
  }
  
  public String readDBDataFromPlugin(Context paramContext)
  {
    RuleUtility localRuleUtility = new RuleUtility(paramContext);
    try
    {
      String str1 = RuleUtility.getLocalDBPath();
      String str2 = getLatestDBVersion(paramContext);
      if ((str1 != null) && (str2 != null) && (!str2.equalsIgnoreCase("Use local DB")))
      {
        LogUtils.infoLog("Reading DB if ", "  Local DB - " + str1 + " Remote DB - " + str2);
        return localRuleUtility.DownloadFromUrl(str2, "pluginrulesCompressed.zip");
      }
      LogUtils.infoLog("Reading DB else ", "  Local DB - " + str1 + " Remote DB - " + str2);
      LogUtils.infoLog("Reading DB", "Using local DB as Remote DB is either unavailable or has lesser version");
      String str3 = localRuleUtility.getPragmaVersion();
      return str3;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("UpnpDeviceList", "Exception in readDBDataFromPlugin(): ", localException);
    }
    return "";
  }
  
  public JSONArray removeBridgeDevices(JSONArray paramJSONArray)
  {
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    try
    {
      ArrayList localArrayList = new ArrayList();
      StringBuffer localStringBuffer = new StringBuffer();
      for (int j = 0; j < paramJSONArray.getJSONArray(0).length(); j++)
      {
        localStringBuffer.append(paramJSONArray.getJSONArray(0).get(j).toString());
        if (j < -1 + paramJSONArray.getJSONArray(0).length()) {
          localStringBuffer.append(",");
        }
        localArrayList.add(paramJSONArray.getJSONArray(0).get(j).toString());
      }
      String str = localStringBuffer.toString();
      LogUtils.debugLog("UpnpDeviceList", "----- remove dev ids:" + str);
      Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("RemoveDevice");
      setArgument(localAction, UpnpConstants.ARGS_DEVICEIDS, new String[] { str });
      this.mResponseString = localAction.postControlAction();
      LogUtils.debugLog("UpnpDeviceList", "get remove devices n/w===+" + this.mResponseString);
      this.mMoreUtil.resetFWFlags("MZ100");
      localJSONArray.put(new LedDeviceResponseParser().parseNetworkStatus(this.mResponseString));
      return localJSONArray;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return localJSONArray;
  }
  
  public boolean removeLed(String paramString)
    throws JSONException
  {
    LogUtils.infoLog("UpnpDeviceList", "removeLed():: deviceID--> " + paramString + " jsonBridgeArray--> " + this.jsonBridgeArray.toString());
    JSONArray localJSONArray = new JSONArray();
    int i = 0;
    if ((this.jsonBridgeArray != null) && (this.jsonBridgeArray.length() > 0))
    {
      int j = 0;
      if (j < this.jsonBridgeArray.length())
      {
        if (this.jsonBridgeArray.getJSONObject(j).toString().contains("GroupID"))
        {
          String str2 = this.jsonBridgeArray.getJSONObject(j).getString("GroupID");
          LogUtils.infoLog("UpnpDeviceList", "removeLed():: groupId--> " + str2);
          if ((str2 != null) && (!str2.equals(paramString)))
          {
            localJSONArray.put(i, this.jsonBridgeArray.getJSONObject(j));
            i++;
          }
        }
        for (;;)
        {
          j++;
          break;
          String str1 = this.jsonBridgeArray.getJSONObject(j).getString("DeviceID");
          LogUtils.infoLog("UpnpDeviceList", "removeLed():: ledDeviceId--> " + str1);
          if ((str1 != null) && (!str1.equals(paramString)))
          {
            localJSONArray.put(i, this.jsonBridgeArray.getJSONObject(j));
            i++;
          }
        }
      }
    }
    this.jsonBridgeArray = localJSONArray;
    LogUtils.infoLog("UpnpDeviceList", "removeLed():: returning jsonBridgeArray--> " + this.jsonBridgeArray.toString());
    return true;
  }
  
  public void resetOpenBridgeCounter()
  {
    this.mOpenBridgeRetryCount = 7;
  }
  
  public boolean resetPlugIn(String paramString)
    throws JSONException
  {
    if (paramString == null) {}
    for (;;)
    {
      return false;
      this.jsonObject = new JSONObject();
      try
      {
        Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString);
        DeviceInformation localDeviceInformation = DeviceListManager.getInstance(this.mContext).getDevice(paramString);
        if (localDevice != null)
        {
          Action localAction = localDevice.getAction("ReSetup");
          localAction.setArgumentValue("Reset", "2");
          String str1 = localAction.postControlAction();
          LogUtils.infoLog("UpnpDeviceList", "resetAllContentAndSettings response: " + str1);
          if ((str1 != null) && (!str1.contains(UpnpConstants.ERROR)))
          {
            String str2 = localDevice.getDeviceType();
            if ((str2 != null) && (str2.contains("insight")))
            {
              String str3 = localDeviceInformation.getHwVersion();
              if ((str3 != null) && (str3.equalsIgnoreCase("v2"))) {
                str2 = str2 + "v2";
              }
            }
            this.mMoreUtil.resetFWFlags(str2);
            return true;
          }
        }
      }
      catch (Exception localException)
      {
        LogUtils.infoLog("UpnpDeviceList", "exception in resetAllContentAndSettings: " + localException);
      }
    }
    return false;
  }
  
  public String sendDBDataToPlugin(Context paramContext)
  {
    RuleUtility localRuleUtility = new RuleUtility(paramContext);
    try
    {
      localRuleUtility.copyDataBase(RuleUtility.getLocalDBPath() + "pluginrules2.db", RuleUtility.getStoragePath() + "/" + "temppluginRules.db", "false");
      this.filesToBeZipped[0] = (RuleUtility.getStoragePath() + "/" + "temppluginRules.db");
      localRuleUtility.zip(this.filesToBeZipped, RuleUtility.getStoragePath() + "/" + "pluginrulesCompressed.zip");
      String str = RuleUtility.getStoragePath() + "/" + "pluginrules2.db";
      ArrayList localArrayList = getDBPathAllDevices(paramContext, str);
      if ((str != null) && (localArrayList != null)) {
        for (int i = 0; i < localArrayList.size(); i++) {
          UploadFileUtil.writeDBToDevice(str, ((String)localArrayList.get(i)).toString());
        }
      }
      return "";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void setDevicePreset(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    this.mBridgeUdn = paramJSONArray.getJSONObject(0).getString("bridgeUdn");
    String str = this.mBridgeUdn;
    int i = 0;
    if (str != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      i = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("setDevicePreset");
        i = 0;
        if (localAction != null)
        {
          localAction.setArgumentValue("devicePresetData", createSetDeletePresetRequest(paramJSONArray));
          SetPresetCallback localSetPresetCallback = new SetPresetCallback(paramSetAndGetActionCallBack);
          i = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localSetPresetCallback, localSetPresetCallback);
        }
      }
    }
    if (i == 0) {
      paramSetAndGetActionCallBack.onError();
    }
  }
  
  public JSONObject setDeviceState(String paramString1, String paramString2)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    this.jsonObject.put(JSONConstants.NOTIFY_TYPE, "BinaryState");
    try
    {
      Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString2);
      LogUtils.infoLog("UpnpDeviceList", "setDeviceState(Device device, String state, String udn) :: UDN " + paramString2);
      LogUtils.infoLog("UpnpDeviceList", "setDeviceState(Device device, String state, String udn) :: FNAME " + localDevice.getFriendlyName());
      LogUtils.infoLog("UpnpDeviceList", "setDeviceState(Device device, String state, String udn) :: DEVICE UDN " + localDevice.getUDN());
      Action localAction = localDevice.getAction("SetBinaryState");
      setArgument(localAction, UpnpConstants.SET_BINARY_STATE_ARGS, new String[] { paramString1 });
      String str = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "setDeviceState(Device device, String state) :: " + str);
      if (str.contains(UpnpConstants.ERROR))
      {
        if (paramString1.equals("0"))
        {
          this.jsonObject.put("state", "1");
          this.jsonObject.put("udn", paramString2);
          return this.jsonObject;
        }
        this.jsonObject.put("state", "0");
        this.jsonObject.put("udn", paramString2);
        return this.jsonObject;
      }
      String[] arrayOfString = getStringFromResponse(str, JSONConstants.BINARY_STATE).split("\\|");
      this.jsonObject.put("state", arrayOfString[0]);
      this.jsonObject.put("udn", paramString2);
      JSONObject localJSONObject = this.jsonObject;
      return localJSONObject;
    }
    catch (Exception localException)
    {
      if (paramString1.equals("0"))
      {
        this.jsonObject.put("state", "1");
        this.jsonObject.put("udn", paramString2);
        return this.jsonObject;
      }
      this.jsonObject.put("state", "0");
      this.jsonObject.put("udn", paramString2);
    }
    return this.jsonObject;
  }
  
  public void setEmergencyContacts(String paramString, SetDataStoreOnLinkCallBack paramSetDataStoreOnLinkCallBack)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    String str = this.mBridgeUdn;
    int j = 0;
    if (str != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      j = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("SetDataStores");
        j = 0;
        if (localAction != null)
        {
          localAction.setArgumentValue("DataStores", createSetEmergencyContactRequest(paramString));
          SetPostActionCallback localSetPostActionCallback = new SetPostActionCallback(paramSetDataStoreOnLinkCallBack);
          j = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localSetPostActionCallback, localSetPostActionCallback);
        }
      }
    }
    if (j == 0) {
      paramSetDataStoreOnLinkCallBack.onError();
    }
  }
  
  public boolean setFriendlyName(String paramString, String[] paramArrayOfString)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString);
      if ((localDevice != null) && (paramArrayOfString != null) && (paramArrayOfString[0] != null)) {
        localDevice.setFriendlyName(paramArrayOfString[0]);
      }
      Action localAction = localDevice.getAction("ChangeFriendlyName");
      setArgument(localAction, UpnpConstants.SET_FRIENDLY_NAME_ARGS_KEYS, paramArrayOfString);
      String str = localAction.postControlAction();
      return str != null;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("UpnpDeviceList", "set friendly name exception: " + localException);
    }
    return false;
  }
  
  public void setIconUsingUri(Uri paramUri, String paramString)
  {
    Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString);
    String str = localDevice.getLogoURLFromDevice();
    LogUtils.infoLog("UpnpDeviceList", "URI: " + paramUri + " URL: " + str);
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inSampleSize = 1;
    localOptions.inDither = false;
    try
    {
      Object localObject;
      if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_sensor_small.png")) {
        localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_sensor_small.png"), null, localOptions);
      }
      while (localObject != null)
      {
        UploadFileUtil.uploadFileToDevice(str, UploadFileUtil.getByteArray((Bitmap)localObject), 15000);
        FileStorage.getInstance(this.mContext).saveIconFile(str, "0", localDevice.getSerialNumber());
        return;
        if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_switch_small.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_switch_small.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_light_switch_small.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_light_switch_small.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_insight_small.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_insight_small.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_maker_small.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_maker_small.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_heater.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_heater.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_airpurifier.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_airpurifier.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_humidifier.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_humidifier.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_humidifierb.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_humidifierb.png"), null, localOptions);
        }
        else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_coffeemaker.png"))
        {
          localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_coffeemaker.png"), null, localOptions);
        }
        else
        {
          Bitmap localBitmap = BitmapFactory.decodeStream(this.mContext.getContentResolver().openInputStream(paramUri), null, localOptions);
          localObject = localBitmap;
        }
      }
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      localFileNotFoundException.printStackTrace();
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public JSONArray setLedDeviceStatus(JSONArray paramJSONArray1, JSONArray paramJSONArray2)
  {
    JSONArray localJSONArray = new JSONArray();
    this.jsonObject = new JSONObject();
    LogUtils.infoLog("UpnpDeviceList", "status of set status array:********" + paramJSONArray1 + "--" + paramJSONArray2);
    for (;;)
    {
      int i;
      try
      {
        this.onORoff = paramJSONArray1.get(0).toString();
        StringBuffer localStringBuffer = new StringBuffer();
        i = 0;
        if (i < paramJSONArray2.length())
        {
          localStringBuffer.append(paramJSONArray2.get(i).toString());
          if (i < -1 + paramJSONArray2.length()) {
            localStringBuffer.append(",");
          }
        }
        else
        {
          this.deviceId = localStringBuffer.toString();
          this.capabilityID = paramJSONArray1.get(1).toString();
          this.isGroupAction = paramJSONArray1.get(2).toString();
          LogUtils.infoLog("UpnpDeviceList", "status of set status:********" + this.onORoff + "------" + this.deviceId);
          new Thread(new Runnable()
          {
            public void run()
            {
              ControlPoint localControlPoint = DeviceListManager.getInstance(UpnpDeviceList.this.mContext).getUpnpControl();
              for (int i = 0; i < localControlPoint.getDeviceList().size(); i++) {
                if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
                  UpnpDeviceList.access$102(UpnpDeviceList.this, localControlPoint.getDeviceList().getDevice(i).getUDN());
                }
              }
              if ((UpnpDeviceList.this.mBridgeUdn != null) && (localControlPoint != null) && (localControlPoint.getDevice(UpnpDeviceList.this.mBridgeUdn) != null))
              {
                Action localAction = localControlPoint.getDevice(UpnpDeviceList.this.mBridgeUdn).getAction("SetDeviceStatus");
                UpnpDeviceList localUpnpDeviceList = UpnpDeviceList.this;
                String[] arrayOfString1 = UpnpConstants.SET_LED_DEVICE_STATUS_SINGLE;
                String[] arrayOfString2 = new String[1];
                arrayOfString2[0] = UpnpDeviceList.this.domXml(UpnpDeviceList.this.onORoff, UpnpDeviceList.this.deviceId, UpnpDeviceList.this.capabilityID, UpnpDeviceList.this.isGroupAction);
                localUpnpDeviceList.setArgument(localAction, arrayOfString1, arrayOfString2);
                UpnpDeviceList.access$702(UpnpDeviceList.this, localAction.postControlAction());
                LogUtils.infoLog("UpnpDeviceList", "set led devices status ===+" + UpnpDeviceList.this.mResponseString);
              }
            }
          }).start();
          return localJSONArray;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return localJSONArray;
      }
      i++;
    }
  }
  
  public JSONArray setLedFriendlyName(JSONArray paramJSONArray)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    String str1 = paramJSONArray.getString(0).toString();
    String str2 = paramJSONArray.getString(1).toString();
    LogUtils.infoLog("UpnpDeviceList", "devId: " + str1 + " :friendlyName: " + str2);
    for (;;)
    {
      int i;
      try
      {
        ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
        if (localControlPoint != null)
        {
          i = 0;
          if (i < localControlPoint.getDeviceList().size())
          {
            if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
              this.mBridgeUdn = localControlPoint.getDeviceList().getDevice(i).getUDN();
            }
          }
          else {
            LogUtils.debugLog("UpnpDeviceList", "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + this.mBridgeUdn);
          }
        }
        else
        {
          if (this.mBridgeUdn != null)
          {
            Action localAction = localControlPoint.getDevice(this.mBridgeUdn).getAction("SetDeviceName");
            setArgument(localAction, UpnpConstants.ARGS_LED_FRIENDLY_NAME, new String[] { str1, str2 });
            String str3 = localAction.postControlAction();
            LogUtils.debugLog("UpnpDeviceList", "set friendly name: " + str3);
            if (str3 != null) {
              localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str3);
            }
          }
          DeviceListManager.getInstance(this.mContext).updateFriendlyName(str1, str2);
          return localJSONArray;
        }
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("UpnpDeviceList", "Exception in setLedFriendlyName(): ", localException);
        return localJSONArray;
      }
      i++;
    }
  }
  
  public void setMultipleDeviceName(JSONArray paramJSONArray, SetDeviceNameOnLinkCallBack paramSetDeviceNameOnLinkCallBack)
    throws JSONException
  {
    String str1 = paramJSONArray.getString(0);
    String str2 = paramJSONArray.getString(1);
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (int i = 0; i < localControlPoint.getDeviceList().size(); i++)
    {
      String str4 = localControlPoint.getDeviceList().getDevice(i).getUDN();
      if (str4.contains("Bridge")) {
        this.mBridgeUdn = str4;
      }
    }
    String str3 = this.mBridgeUdn;
    int j = 0;
    if (str3 != null)
    {
      Device localDevice = localControlPoint.getDevice(this.mBridgeUdn);
      j = 0;
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("SetDeviceNames");
        j = 0;
        if (localAction != null)
        {
          setArgument(localAction, UpnpConstants.ARGS_MULTIPLE_DEVICE_FRIENDLY_NAME, new String[] { str1, str2 });
          SetDeviceNamePostActionCallback localSetDeviceNamePostActionCallback = new SetDeviceNamePostActionCallback(paramSetDeviceNameOnLinkCallBack);
          j = 1;
          ControlActionHandler.newInstance().postControlAction(localAction, localSetDeviceNamePostActionCallback, localSetDeviceNamePostActionCallback);
        }
      }
    }
    if (j == 0) {
      paramSetDeviceNameOnLinkCallBack.onError();
    }
  }
  
  public String setNightLightStatus(String[] paramArrayOfString)
  {
    try
    {
      Device localDevice = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramArrayOfString[0]);
      LogUtils.verboseLog("UpnpDeviceList", "setNightLightStatus device: " + localDevice + " argList[0]: " + paramArrayOfString[0]);
      Action localAction = localDevice.getAction("SetNightLightStatus");
      LogUtils.verboseLog("UpnpDeviceList", "setNightLightStatus argList[1]: " + paramArrayOfString[1]);
      String[] arrayOfString1 = UpnpConstants.NIGHT_LIGHT_STATUS;
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = paramArrayOfString[1];
      setArgument(localAction, arrayOfString1, arrayOfString2);
      String str = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "SET NIGHT LIGHT STATUS :: " + str);
      return "true";
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("UpnpDeviceList", "SET NIGHT LIGHT STATUS :: " + localException);
    }
    return "false";
  }
  
  public String setNotifyMessage(String[] paramArrayOfString)
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    try
    {
      String str = paramArrayOfString[3];
      LogUtils.verboseLog("UpnpDeviceList", "Set Notify Message. Device UDN: " + paramArrayOfString[3]);
      if (!WeMoUtils.areFetchStoreAPIsSupportedInLocal(str, this.mContext))
      {
        boolean bool = str.contains("uuid:Maker");
        int i = 0;
        if (bool)
        {
          i = 1;
          str = str.replace(":sensor", ":sensor:switch");
        }
        if (i != 0) {}
        Action localAction;
        for (Object localObject = localControlPoint.getDevice(str).getAction("SetRuleID");; localObject = localAction)
        {
          setArgument((Action)localObject, Constants.SET_RULE_ID, paramArrayOfString);
          ((Action)localObject).postControlAction();
          break;
          localAction = localControlPoint.getDevice(paramArrayOfString[3]).getAction("SetRuleID");
        }
      }
      return "true";
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("UpnpDeviceList", "Exception during SET_RULE_ID action to device: ", localException);
      return "false";
    }
  }
  
  public boolean setParametersValues(String paramString1, String paramString2, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction(paramString2);
    if (localAction != null)
    {
      setArgument(localAction, paramArrayOfString1, paramArrayOfString2);
      String str = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "Set new values, action :  res : UDN : " + paramString1 + " : " + str + " : " + paramString2);
      if (str == null) {
        return false;
      }
    }
    return true;
  }
  
  public void setPragmaInDB(Context paramContext, int paramInt)
  {
    RuleUtility localRuleUtility = new RuleUtility(paramContext);
    try
    {
      localRuleUtility.setPragmaVersion(paramInt);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public boolean setValueFromAction(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction(paramString2);
    if (localAction != null)
    {
      localAction.setArgumentValue(paramString4, paramString3);
      String str = localAction.postControlAction();
      LogUtils.verboseLog("UpnpDeviceList", "Set new value res : constant : UDN : " + paramString1 + " : " + paramString2 + " : " + str);
      if (str == null) {
        return false;
      }
    }
    return true;
  }
  
  public boolean simulatedRuleDataAction(String[] paramArrayOfString)
    throws JSONException
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    for (;;)
    {
      int i;
      try
      {
        paramArrayOfString[0];
        i = 0;
        if (i <= paramArrayOfString.length)
        {
          String str1 = paramArrayOfString[i];
          if (TextUtils.isEmpty(str1)) {
            break label493;
          }
          String str2 = str1.replace("[", "").replace("]", "").replaceAll("\"", "");
          String[] arrayOfString = str2.split(":");
          String str3 = arrayOfString[0] + ":" + arrayOfString[1];
          if (arrayOfString[1].contains("Bridge"))
          {
            String str6 = createSimulatedRuleBridgeXml(paramArrayOfString);
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "final xml BRIDGE::" + str6);
            this.argumentsArray[0] = str6;
            this.argumentsArray[1] = Integer.toString(paramArrayOfString.length);
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "simulateddata: " + str3);
            Action localAction2 = localControlPoint.getDevice(str3).getAction("SimulatedRuleData");
            setArgument(localAction2, UpnpConstants.SIMULATED_DEVICELIST_COUNTER, this.argumentsArray);
            String str7 = localAction2.postControlAction();
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "action response bridge:: " + str7);
          }
          else
          {
            String str4 = createSimulatedRuleXml(paramArrayOfString);
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "final xml SNS::" + str4);
            this.argumentsArray[0] = str4;
            this.argumentsArray[1] = Integer.toString(paramArrayOfString.length);
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "repUdn2" + str2);
            if (str2.contains("uuid:Maker")) {
              str2 = arrayOfString[0] + ":" + arrayOfString[1] + ":sensor:switch";
            }
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "Changed repUdn2" + str2);
            Action localAction1 = localControlPoint.getDevice(str2).getAction("SimulatedRuleData");
            setArgument(localAction1, UpnpConstants.SIMULATED_DEVICELIST_COUNTER, this.argumentsArray);
            String str5 = localAction1.postControlAction();
            LogUtils.verboseLog("UpnpDeviceList.simulatedRuleDatadeviceList", "action response SNS:: " + str5);
          }
        }
      }
      catch (Exception localException)
      {
        return false;
      }
      return true;
      label493:
      i++;
    }
  }
  
  public boolean updateFirmware(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    LogUtils.infoLog("FIRMWARE UPGRADE", "UDN:" + paramString1 + " Upgrade FirmwareVersion:" + paramString2 + " Upgrade FirmwareVersionURL:" + paramString3);
    try
    {
      SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
      Date localDate = new Date();
      Action localAction = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDevice(paramString1).getAction("UpdateFirmware");
      if (localAction != null)
      {
        String[] arrayOfString1 = UpnpConstants.SET_UPDATE_FIRMWARE_ARGS;
        String[] arrayOfString2 = new String[5];
        arrayOfString2[0] = paramString2;
        arrayOfString2[1] = localSimpleDateFormat.format(localDate);
        arrayOfString2[2] = paramString3;
        arrayOfString2[3] = paramString4;
        arrayOfString2[4] = paramString5;
        setArgument(localAction, arrayOfString1, arrayOfString2);
        String str = localAction.postControlAction();
        LogUtils.infoLog("FIRMWARE UPGRADE", "UDN:" + paramString1 + " Firmware Upgrade UPNP Response:" + str);
        boolean bool = str.toLowerCase().contains("success");
        if (bool) {
          return true;
        }
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("FIRMWARE UPGRADE", localException.getMessage());
    }
    return false;
  }
  
  public String updateWeeklyCalenderString(String[] paramArrayOfString)
  {
    String str1 = "";
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    if (paramArrayOfString != null) {}
    for (;;)
    {
      int i;
      try
      {
        if ((paramArrayOfString[7] == null) || (!paramArrayOfString[7].contains("uuid"))) {
          break label249;
        }
        LogUtils.infoLog("UpnpDeviceList", "updateWeeklyCalenderString controlPoint.getDevice(weeklyRecord[7]) : " + localControlPoint.getDevice(paramArrayOfString[7]));
        Action localAction2 = localControlPoint.getDevice(paramArrayOfString[7]).getAction("UpdateWeeklyCalendar");
        setArgument(localAction2, Constants.SET_UPDATE_WEEKLY_CALENDER_ARGS, paramArrayOfString);
        localAction2.postControlAction();
      }
      catch (Exception localException)
      {
        String str2;
        Action localAction1;
        String str3;
        localException.printStackTrace();
        return "false";
      }
      if (i < localControlPoint.getDeviceList().size())
      {
        if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
          str1 = localControlPoint.getDeviceList().getDevice(i).getUDN();
        }
      }
      else
      {
        str2 = createCalendarList(paramArrayOfString);
        localAction1 = localControlPoint.getDevice(str1).getAction("UpdateWeeklyCalendar");
        setArgument(localAction1, Constants.SET_UPDATE_WEEKLY_CALENDER_LED_ARGS, new String[] { str2 });
        str3 = localAction1.postControlAction();
        LogUtils.infoLog("UpnpDeviceList", "response : " + str3);
        break label245;
        return "false";
        label245:
        return "true";
        label249:
        i = 0;
        continue;
      }
      i++;
    }
  }
  
  private class DeletePresetCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetAndGetActionCallBack callback;
    
    public DeletePresetCallback(SetAndGetActionCallBack paramSetAndGetActionCallBack)
    {
      this.callback = paramSetAndGetActionCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      LogUtils.errorLog("UpnpDeviceList", "DeletePresetCallback: onActionError", paramException);
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString)) {
        if ((new DeletePresetResponseParser().parseResponse(paramString).equals("Success")) && (this.callback != null)) {
          this.callback.onSuccess("Success");
        }
      }
      while (this.callback == null)
      {
        do
        {
          return;
        } while (this.callback == null);
        this.callback.onError();
        return;
      }
      this.callback.onError();
    }
  }
  
  private class GetPostActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetAndGetActionCallBack callback;
    
    public GetPostActionCallback(SetAndGetActionCallBack paramSetAndGetActionCallBack)
    {
      this.callback = paramSetAndGetActionCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        GetDataStoreResponseParser localGetDataStoreResponseParser = new GetDataStoreResponseParser();
        if (this.callback != null) {
          this.callback.onSuccess(localGetDataStoreResponseParser.parseResponse(paramString));
        }
        return;
      }
      this.callback.onError();
    }
  }
  
  private class GetPresetCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetAndGetActionCallBack callback;
    
    public GetPresetCallback(SetAndGetActionCallBack paramSetAndGetActionCallBack)
    {
      this.callback = paramSetAndGetActionCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      LogUtils.errorLog("UpnpDeviceList", "GetPresetCallback: onActionError", paramException);
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      LogUtils.infoLog("UpnpDeviceList", "GetPresetCallback: onActionSuccess");
      if (!TextUtils.isEmpty(paramString))
      {
        GetPresetResponseParser localGetPresetResponseParser = new GetPresetResponseParser();
        LogUtils.infoLog("UpnpDeviceList", "response: " + localGetPresetResponseParser.parseResponse(paramString));
        if (this.callback != null) {
          this.callback.onSuccess(localGetPresetResponseParser.parseResponse(paramString));
        }
        return;
      }
      this.callback.onError();
    }
  }
  
  private class SetDeviceNamePostActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetDeviceNameOnLinkCallBack callback;
    
    public SetDeviceNamePostActionCallback(SetDeviceNameOnLinkCallBack paramSetDeviceNameOnLinkCallBack)
    {
      this.callback = paramSetDeviceNameOnLinkCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        SetMultipleDeviceNameResponseParser localSetMultipleDeviceNameResponseParser = new SetMultipleDeviceNameResponseParser();
        if (this.callback != null) {
          this.callback.onSuccess(localSetMultipleDeviceNameResponseParser.parseResponse(paramString));
        }
        while (this.callback == null) {
          return;
        }
        this.callback.onError();
        return;
      }
      this.callback.onError();
    }
  }
  
  private class SetPostActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetAndGetActionCallBack callback;
    
    public SetPostActionCallback(SetAndGetActionCallBack paramSetAndGetActionCallBack)
    {
      this.callback = paramSetAndGetActionCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString)) {
        if ((new SetDataStoreResponseParser().parseResponse(paramString).equals("0")) && (this.callback != null)) {
          this.callback.onSuccess("Success in setting emergency contacts");
        }
      }
      while (this.callback == null)
      {
        do
        {
          return;
        } while (this.callback == null);
        this.callback.onError();
        return;
      }
      this.callback.onError();
    }
  }
  
  private class SetPresetCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private SetAndGetActionCallBack callback;
    
    public SetPresetCallback(SetAndGetActionCallBack paramSetAndGetActionCallBack)
    {
      this.callback = paramSetAndGetActionCallBack;
    }
    
    public void onActionError(Exception paramException)
    {
      LogUtils.errorLog("UpnpDeviceList", "SetPresetCallback: onActionError", paramException);
      if (this.callback != null) {
        this.callback.onError();
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString)) {
        if ((new SetPresetResponseParser().parseResponse(paramString).equals("Success")) && (this.callback != null)) {
          this.callback.onSuccess("Success");
        }
      }
      while (this.callback == null)
      {
        do
        {
          return;
        } while (this.callback == null);
        this.callback.onError();
        return;
      }
      this.callback.onError();
    }
  }
  
  private static enum getEndList
  {
    static
    {
      ALL_LIST = new getEndList("ALL_LIST", 1);
      PAIRED_LIST = new getEndList("PAIRED_LIST", 2);
      UNPAIRED_LIST = new getEndList("UNPAIRED_LIST", 3);
      getEndList[] arrayOfgetEndList = new getEndList[4];
      arrayOfgetEndList[0] = SCAN_LIST;
      arrayOfgetEndList[1] = ALL_LIST;
      arrayOfgetEndList[2] = PAIRED_LIST;
      arrayOfgetEndList[3] = UNPAIRED_LIST;
      $VALUES = arrayOfgetEndList;
    }
    
    private getEndList() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cybergarage/wrapper/UpnpDeviceList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */