package com.belkin.cybergarage.wrapper;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.beans.APListResponseBean;
import com.belkin.beans.CloseSetupResponseBean;
import com.belkin.beans.FriendlyNameResponseBean;
import com.belkin.beans.MetaDataResponseBean;
import com.belkin.beans.NetworkStatusResponseBean;
import com.belkin.beans.ResetCustomizedResponseBean;
import com.belkin.beans.SignalStrengthResponseBean;
import com.belkin.upnp.parser.CloseSetupResponseParser;
import com.belkin.upnp.parser.GetAttributeMakerParser;
import com.belkin.upnp.parser.GetEndDeviceListResponse;
import com.belkin.upnp.parser.LedDeviceResponseParser;
import com.belkin.upnp.parser.NetworkStatusResponseParser;
import com.belkin.upnp.parser.Parser;
import com.belkin.upnp.parser.RemoteAccessResponseParser;
import com.belkin.upnp.parser.ResetCustomizedResponseParser;
import com.belkin.utils.LogUtils;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.utils.WifiUtil;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.UploadFileUtil;
import com.belkin.wemo.localsdk.parser.SetAttributeResponseParser;
import com.belkin.wemo.storage.FileStorage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;
import java.util.concurrent.CopyOnWriteArrayList;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class UpnpDeviceSetup
  extends UpnpDeviceBase
{
  private static final String TAG = "UpnpDeviceSetup";
  private static UpnpDeviceSetup upnpDeviceSetupInstance = null;
  String ResponseString;
  String capabilityID = null;
  String deviceId = null;
  String isGroupAction = null;
  private JSONArray jsonArray = null;
  private JSONObject jsonObject = null;
  private Context mContext;
  String mResponseString;
  private SharePreferences mSharePreference;
  private SDKNetworkUtils networkUtil;
  String onORoff = null;
  private List<SortedRouterInfo> routerList;
  String strDevIds;
  private long timeOpenNetworkCheck;
  private WifiUtil wifiUtil;
  
  public UpnpDeviceSetup(Context paramContext)
  {
    super(paramContext);
    this.mContext = paramContext;
    this.wifiUtil = new WifiUtil(this.mContext);
    this.mSharePreference = new SharePreferences(this.mContext);
    this.networkUtil = new SDKNetworkUtils(this.mContext);
  }
  
  private String createAttributeList(JSONObject paramJSONObject)
  {
    String[] arrayOfString = { "Switch", "Sensor", "SwitchMode", "SensorPresent" };
    StringBuffer localStringBuffer = new StringBuffer();
    int i = 0;
    label195:
    for (;;)
    {
      try
      {
        if (i < arrayOfString.length)
        {
          Iterator localIterator = paramJSONObject.keys();
          if (!localIterator.hasNext()) {
            break label195;
          }
          String str = (String)localIterator.next();
          if (!arrayOfString[i].equals(str)) {
            continue;
          }
          localStringBuffer.append("<attribute>");
          localStringBuffer.append("<name>");
          JSONObject localJSONObject = paramJSONObject.getJSONObject(str);
          localStringBuffer.append(str);
          localStringBuffer.append("</name>");
          localStringBuffer.append("<value>");
          localStringBuffer.append(localJSONObject.optString("value"));
          localStringBuffer.append("</value>");
          localStringBuffer.append("</attribute>");
          continue;
        }
        i++;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        Log.v("setAttriuteState", "str.toString():::::::;" + localStringBuffer.toString());
        return localStringBuffer.toString();
      }
    }
  }
  
  public static UpnpDeviceSetup getInstance(Context paramContext)
  {
    try
    {
      if (upnpDeviceSetupInstance == null) {
        upnpDeviceSetupInstance = new UpnpDeviceSetup(paramContext);
      }
      UpnpDeviceSetup localUpnpDeviceSetup = upnpDeviceSetupInstance;
      return localUpnpDeviceSetup;
    }
    finally {}
  }
  
  private String[] getRemoteAccessAgrs()
  {
    String[] arrayOfString = new String[8];
    WiFiSecurityUtil localWiFiSecurityUtil = new WiFiSecurityUtil();
    arrayOfString[0] = localWiFiSecurityUtil.getDeviceID(this.mContext);
    Date localDate = new Date(System.currentTimeMillis());
    if (TimeZone.getDefault().inDaylightTime(localDate)) {
      arrayOfString[1] = "1";
    }
    for (;;)
    {
      arrayOfString[2] = this.mSharePreference.getHomeId();
      arrayOfString[3] = new MoreUtil().getDeviceUserName(this.mContext);
      arrayOfString[4] = "";
      arrayOfString[5] = "";
      arrayOfString[6] = "";
      arrayOfString[7] = localWiFiSecurityUtil.generateAuthCode(this.mContext);
      return arrayOfString;
      arrayOfString[1] = "0";
    }
  }
  
  private JSONArray parseAPList()
    throws JSONException
  {
    APListResponseBean localAPListResponseBean = new APListResponseBean();
    Action localAction = this.mDevice.getAction("GetNetworkList");
    System.out.println("newAction: " + localAction);
    if (localAction == null)
    {
      String str3 = this.mDevice.getAction("GetApList").postControlAction();
      if ((str3 != null) && (!str3.equals("app_error")))
      {
        Parser localParser2 = new Parser();
        localParser2.uPnPResponseParser(localAPListResponseBean, 1, str3);
        if (1 < localAPListResponseBean.totalPagesOfAPList) {
          for (int m = 1; m < localAPListResponseBean.totalPagesOfAPList; m++)
          {
            String str4 = this.mDevice.getAction("GetApList").postControlAction();
            Log.i("UpnpDeviceSetup", "Post of Action GET AP List Successful itr:::" + m);
            if ((str4 != null) && (!str4.equals("app_error"))) {
              localParser2.uPnPResponseParser(localAPListResponseBean, 1, str4);
            }
          }
        }
      }
    }
    else
    {
      String str1 = localAction.postControlAction();
      if ((str1 != null) && (!str1.equals("app_error")))
      {
        Parser localParser1 = new Parser();
        localParser1.uPnPResponseParser(localAPListResponseBean, 15, str1);
        if (1 < localAPListResponseBean.totalPagesOfAPList) {
          for (int k = 1; k < localAPListResponseBean.totalPagesOfAPList; k++)
          {
            String str2 = this.mDevice.getAction("GetNetworkList").postControlAction();
            Log.i("UpnpDeviceSetup", "Post of Action GET Network List Successful itr:::" + k);
            if ((str2 != null) && (!str2.equals("app_error"))) {
              localParser1.uPnPResponseParser(localAPListResponseBean, 15, str2);
            }
          }
        }
      }
    }
    CopyOnWriteArrayList localCopyOnWriteArrayList = new CopyOnWriteArrayList();
    if (localAPListResponseBean.strSSIDList != null) {
      for (int j = 0; j < localAPListResponseBean.strSSIDList.length; j++)
      {
        SortedRouterInfo localSortedRouterInfo2 = new SortedRouterInfo();
        localSortedRouterInfo2.ssid = localAPListResponseBean.strSSIDList[j];
        localSortedRouterInfo2.channel = localAPListResponseBean.nChannel[j];
        localSortedRouterInfo2.security = localAPListResponseBean.strSecurityStrength[j];
        localSortedRouterInfo2.signal = localAPListResponseBean.nSignalStrength[j];
        localCopyOnWriteArrayList.add(localSortedRouterInfo2);
      }
    }
    Iterator localIterator = localCopyOnWriteArrayList.iterator();
    while (localIterator.hasNext())
    {
      SortedRouterInfo localSortedRouterInfo1 = (SortedRouterInfo)localIterator.next();
      if ((localSortedRouterInfo1 == null) || (localSortedRouterInfo1.ssid == null) || (localSortedRouterInfo1.channel == null) || (localSortedRouterInfo1.security == null) || (localSortedRouterInfo1.signal == null)) {
        localCopyOnWriteArrayList.remove(localSortedRouterInfo1);
      }
    }
    this.routerList = new ArrayList();
    this.routerList.addAll(localCopyOnWriteArrayList);
    if ((this.routerList != null) && (this.routerList.size() > 1))
    {
      List localList = this.routerList;
      Comparator local1 = new Comparator()
      {
        public int compare(UpnpDeviceSetup.SortedRouterInfo paramAnonymousSortedRouterInfo1, UpnpDeviceSetup.SortedRouterInfo paramAnonymousSortedRouterInfo2)
        {
          if (paramAnonymousSortedRouterInfo1.signal == paramAnonymousSortedRouterInfo2.signal) {
            return 0;
          }
          if (paramAnonymousSortedRouterInfo1.signal.intValue() > paramAnonymousSortedRouterInfo2.signal.intValue()) {
            return -1;
          }
          return 1;
        }
      };
      Collections.sort(localList, local1);
    }
    System.out.println("router list size is : " + this.routerList.size());
    int i = 0;
    if (i < this.routerList.size())
    {
      JSONObject localJSONObject;
      if ((((SortedRouterInfo)this.routerList.get(i)).ssid != null) || (((SortedRouterInfo)this.routerList.get(i)).security != null) || (((SortedRouterInfo)this.routerList.get(i)).channel != null))
      {
        localJSONObject = new JSONObject();
        if ((!((SortedRouterInfo)this.routerList.get(i)).ssid.toLowerCase().startsWith("wemo.")) && (!((SortedRouterInfo)this.routerList.get(i)).ssid.startsWith("NetCam"))) {
          break label748;
        }
      }
      for (;;)
      {
        i++;
        break;
        label748:
        localJSONObject.put("SSID", ((SortedRouterInfo)this.routerList.get(i)).ssid);
        localJSONObject.put("Channel", ((SortedRouterInfo)this.routerList.get(i)).channel);
        localJSONObject.put("SignalStrength", ((SortedRouterInfo)this.routerList.get(i)).signal);
        localJSONObject.put("SecurityStrength", ((SortedRouterInfo)this.routerList.get(i)).security);
        this.jsonArray.put(localJSONObject);
      }
    }
    return this.jsonArray;
  }
  
  private String preparePairDataXML(String[] paramArrayOfString)
  {
    return "<PairingData><ssid><![CDATA[" + paramArrayOfString[0] + "]]>" + "</ssid>" + "<auth>" + paramArrayOfString[1] + "</auth>" + "<password>" + paramArrayOfString[2] + "</password>" + "<encrypt>" + paramArrayOfString[3] + "</encrypt>" + "<channel>" + paramArrayOfString[4] + "</channel>" + "</PairingData>";
  }
  
  private String prepareRegistrationArgXML(String[] paramArrayOfString)
  {
    StringBuilder localStringBuilder1 = new StringBuilder().append("<RegistrationData><DeviceId>").append(paramArrayOfString[0]).append("</DeviceId>").append("<DeviceName>").append("<![CDATA[").append(paramArrayOfString[1]).append("]]>").append("</DeviceName>").append("<smartprivateKey>");
    String str1;
    StringBuilder localStringBuilder2;
    if ((!this.mSharePreference.isRemoteEnabled()) || (paramArrayOfString[2] == null))
    {
      str1 = "";
      localStringBuilder2 = localStringBuilder1.append(str1).append("</smartprivateKey>").append("<ReUnionKey>");
      if (!this.mSharePreference.isRemoteEnabled()) {
        break label144;
      }
    }
    label144:
    for (String str2 = "";; str2 = paramArrayOfString[3])
    {
      return str2 + "</ReUnionKey>" + "</RegistrationData>";
      str1 = paramArrayOfString[2];
      break;
    }
  }
  
  private String prepareRegistrationArgs()
  {
    String[] arrayOfString = new String[4];
    arrayOfString[0] = new WiFiSecurityUtil().getDeviceID(this.mContext);
    arrayOfString[1] = new MoreUtil().getDeviceUserName(this.mContext);
    arrayOfString[2] = this.mSharePreference.getPrivateKey();
    arrayOfString[3] = new MoreUtil().generateReUnionKey(this.mSharePreference);
    return prepareRegistrationArgXML(arrayOfString);
  }
  
  private boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    int i;
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null)) {
      i = 0;
    }
    while (i < paramArrayOfString1.length)
    {
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
        break label155;
      }
      arrayOfString[3] = "1";
    }
    for (;;)
    {
      arrayOfString[0] = String.valueOf(System.currentTimeMillis() / 1000L);
      return arrayOfString;
      arrayOfString[2] = "0";
      break;
      label155:
      arrayOfString[3] = "0";
    }
  }
  
  public JSONArray addBridgeDevices(JSONArray paramJSONArray)
  {
    JSONArray localJSONArray = new JSONArray();
    for (;;)
    {
      int i;
      int j;
      try
      {
        LogUtils.infoLog("UpnpDeviceSetup", "LED DEVICE IDS: " + paramJSONArray);
        StringBuffer localStringBuffer1 = new StringBuffer();
        i = 0;
        if (i < paramJSONArray.getJSONArray(0).length())
        {
          localStringBuffer1.append(paramJSONArray.getJSONArray(0).get(i).toString());
          if (i < -1 + paramJSONArray.getJSONArray(0).length()) {
            localStringBuffer1.append(",");
          }
        }
        else
        {
          String str1 = localStringBuffer1.toString();
          StringBuffer localStringBuffer2 = new StringBuffer();
          j = 0;
          if (j < paramJSONArray.getJSONArray(1).length())
          {
            localStringBuffer2.append(paramJSONArray.getJSONArray(1).get(j).toString());
            if (j >= -1 + paramJSONArray.getJSONArray(1).length()) {
              break label377;
            }
            localStringBuffer2.append(",");
            break label377;
          }
          String str2 = localStringBuffer2.toString();
          LogUtils.infoLog("UpnpDeviceSetup", "----- add dev ids:" + str1 + "---" + str2);
          ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
          String str3 = localControlPoint.getDeviceList().getDevice(0).getUDN();
          Action localAction = localControlPoint.getDevice(str3).getAction("AddDeviceName");
          setArgument(localAction, UpnpConstants.ARGS_LED_ADD_DEVICEIDS, new String[] { str1, str2 });
          this.mResponseString = localAction.postControlAction();
          LogUtils.infoLog("UpnpDeviceSetup", "get add devices n/w===+" + this.mResponseString);
          JSONObject localJSONObject = new LedDeviceResponseParser().parseNetworkStatus(this.mResponseString);
          localJSONObject.put("bridgeUDN", str3);
          localJSONArray.put(localJSONObject);
          return localJSONArray;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return localJSONArray;
      }
      i++;
      continue;
      label377:
      j++;
    }
  }
  
  public JSONObject closeBridgeNetwork()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      postTimeSync();
      Action localAction = this.mDevice.getAction("CloseNetwork");
      String[] arrayOfString1 = UpnpConstants.ARGS_DEVUDN;
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDeviceList().getDevice(0).getUDN().toString();
      setArgument(localAction, arrayOfString1, arrayOfString2);
      String str = localAction.postControlAction();
      System.out.println("CLOSE NETWORK RESPOMSE: " + str);
      if (str != null) {
        return this.jsonObject.put("CloseNetwork", true);
      }
      JSONObject localJSONObject = this.jsonObject.put("CloseNetwork", false);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("CloseNetwork", false);
  }
  
  public JSONObject closeSetup()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      postTimeSync();
      storeAPData();
      String str = this.mDevice.getAction("CloseSetup").postControlAction();
      if (new CloseSetupResponseParser().parseCloseSetupResponse(str).getCloseSetupStatus().equalsIgnoreCase("success")) {
        return this.jsonObject.put("CloseSetup", true);
      }
      JSONObject localJSONObject = this.jsonObject.put("CloseSetup", false);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("CloseSetup", false);
  }
  
  public String connectHomeNetwork(String[] paramArrayOfString)
  {
    try
    {
      Action localAction = this.mDevice.getAction("ConnectHomeNetwork");
      setArgument(localAction, UpnpConstants.keyList, paramArrayOfString);
      String str = localAction.postControlAction();
      Log.v("UpnpDeviceSetup", "connectHomeNetwork :: " + str);
      return "true";
    }
    catch (Exception localException)
    {
      Log.e("UpnpDeviceSetup", "connectHomeNetwork :: exception");
    }
    return "false";
  }
  
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
      Log.d("UpnpDeviceSetup", "File saved!" + str);
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
  
  public boolean editIcon(String paramString)
  {
    boolean bool1 = TextUtils.isEmpty(paramString);
    bool2 = false;
    if (!bool1) {
      LogUtils.debugLog("UpnpDeviceSetup", "editIcon during setup. Icon location: " + paramString);
    }
    for (;;)
    {
      try
      {
        if (!paramString.startsWith("file:///android_asset/")) {
          continue;
        }
        String str = paramString.substring("file:///android_asset/".length());
        localBitmap = BitmapFactory.decodeStream(this.mContext.getAssets().open(str));
        if (localBitmap == null) {
          continue;
        }
        boolean bool3 = UploadFileUtil.uploadFileToDevice("http://" + this.mDevice.getIPAddress() + ":" + this.mDevice.getPort() + "/icon.jpg", UploadFileUtil.getByteArray(localBitmap), 15000);
        bool2 = bool3;
      }
      catch (IOException localIOException)
      {
        Bitmap localBitmap;
        LogUtils.errorLog("UpnpDeviceSetup", "IOException while reading file in editIcon during setup: ", localIOException);
        bool2 = false;
        continue;
      }
      LogUtils.debugLog("UpnpDeviceSetup", "editIcon during setup. isSuccess:" + bool2);
      return bool2;
      localBitmap = BitmapFactory.decodeFile(paramString);
      continue;
      LogUtils.debugLog("UpnpDeviceSetup", "Failed to get bitmap from file in editIcon during setup");
      bool2 = false;
    }
  }
  
  public JSONObject enableRemoteAccess()
  {
    this.jsonObject = new JSONObject();
    String[] arrayOfString = getRemoteAccessAgrs();
    try
    {
      Action localAction = this.mDevice.getAction("RemoteAccess");
      setArgument(localAction, UpnpConstants.SET_REMOTE_ACESS_ARGS, arrayOfString);
      String str = localAction.postControlAction();
      if ((str != null) && (!str.isEmpty())) {
        this.jsonObject = new RemoteAccessResponseParser().parseRemoteAccessRespone(str);
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
  
  public JSONArray getAllApList()
    throws JSONException
  {
    this.jsonArray = new JSONArray();
    this.jsonArray = parseAPList();
    return this.jsonArray;
  }
  
  public JSONObject getAttribute()
  {
    this.jsonObject = null;
    try
    {
      String str = this.mDevice.getAction("GetAttributes").postControlAction();
      if (str != null) {
        this.jsonObject = new GetAttributeMakerParser().parseGetAttributeRespone(str);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Log.e("UpnpDeviceSetup", "Exception in getAttribute:: " + localException.toString());
      }
    }
    return this.jsonObject;
  }
  
  public JSONObject getCustomState()
  {
    this.jsonObject = new JSONObject();
    try
    {
      String str1 = this.mDevice.getAction("GetCustomizedState").postControlAction();
      if (str1 != null)
      {
        String str2 = new ResetCustomizedResponseParser().parseCustomizedResponse(str1).getCustomizedState();
        JSONObject localJSONObject = this.jsonObject.put("SetCustomizedState", str2);
        return localJSONObject;
      }
    }
    catch (Exception localException)
    {
      Log.e("UpnpDeviceSetup", "Exception in getCustomState:: " + localException.toString());
    }
    return this.jsonObject;
  }
  
  public String getDeviceType(Device paramDevice)
  {
    return paramDevice.getDeviceType();
  }
  
  public String getFirstDeviceType()
  {
    return this.mDevice.getDeviceType();
  }
  
  public JSONObject getIconUrl()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    String str = "";
    try
    {
      Action localAction = this.mDevice.getAction("GetIconURL");
      localAction.postControlAction();
      ArgumentList localArgumentList = localAction.getOutputArgumentList();
      if (localArgumentList.size() > 0)
      {
        Iterator localIterator = localArgumentList.iterator();
        do
        {
          if (!localIterator.hasNext()) {
            break;
          }
          str = ((Argument)localIterator.next()).getValue();
        } while (str == null);
      }
      JSONObject localJSONObject = this.jsonObject.put("GetIconURL", str);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("GetIconURL", "");
  }
  
  public String[] getMetaInfo(Context paramContext)
  {
    Log.i("UpnpDeviceSetup", "getMetaInfo");
    String str = this.mDevice.getAction("GetMetaInfo").postControlAction();
    Log.v("UpnpDeviceSetup", "Value : " + str);
    MetaDataResponseBean localMetaDataResponseBean = new MetaDataResponseBean();
    if ((str != null) && (!str.equals("app_error")))
    {
      new Parser().uPnPResponseParser(localMetaDataResponseBean, 9, str);
      String[] arrayOfString = null;
      if (localMetaDataResponseBean != null) {
        arrayOfString = localMetaDataResponseBean.getMetadata().split("\\|");
      }
      return arrayOfString;
    }
    Log.i("UpnpDeviceSetup", "metaArray is null or response has error");
    return null;
  }
  
  public int getNetworkStatus()
  {
    try
    {
      String str = this.mDevice.getAction("GetNetworkStatus").postControlAction();
      Log.v("UpnpDeviceSetup", "getNetworkStatus() :: " + str);
      int i = new NetworkStatusResponseParser().parseNetworkStatus(str).getStatus();
      return i;
    }
    catch (Exception localException)
    {
      Log.v("UpnpDeviceSetup", "getNetworkStatus() :: Exception");
    }
    return 0;
  }
  
  public boolean isSmartSetup()
  {
    return (this.mDevice != null) && (this.mDevice.getAction("GetRegistrationData") != null);
  }
  
  public boolean isSuperSmartSetup()
  {
    return (this.mDevice != null) && (this.mDevice.getAction("GetCustomizedState") != null);
  }
  
  public JSONObject networkStatus()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      String str = this.mDevice.getAction("GetNetworkStatus").postControlAction();
      if (new NetworkStatusResponseParser().parseNetworkStatus(str).getStatus() == 1) {
        return this.jsonObject.put("GetNetworkStatus", true);
      }
      JSONObject localJSONObject = this.jsonObject.put("GetNetworkStatus", false);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("GetNetworkStatus", false);
  }
  
  public JSONArray openBridgeNetwork()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    JSONArray localJSONArray = new JSONArray();
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.mContext).getUpnpControl();
    System.out.println("IN OPEN NETWORK SIZE" + localControlPoint.getDeviceList().size() + "---" + this.mDevice.getDeviceList().size());
    for (;;)
    {
      try
      {
        Action localAction = this.mDevice.getAction("OpenNetwork");
        String[] arrayOfString1 = UpnpConstants.ARGS_DEVUDN;
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = localControlPoint.getDeviceList().getDevice(0).getUDN();
        setArgument(localAction, arrayOfString1, arrayOfString2);
        String str = localAction.postControlAction();
        Log.v("UpnpDeviceSetup", "=========open network====" + str);
        if (str == null) {
          continue;
        }
        this.jsonObject.put("OpenNetwork", true);
        this.timeOpenNetworkCheck = (255L + System.currentTimeMillis() / 1000L);
      }
      catch (Exception localException)
      {
        Log.d("UpnpDeviceSetup", localException.getMessage());
        continue;
      }
      localJSONArray.put(this.jsonObject);
      return localJSONArray;
      this.jsonObject.put("OpenNetwork", false);
    }
  }
  
  public String pairAndRegister(String[] paramArrayOfString)
  {
    try
    {
      postTimeSync();
      String[] arrayOfString = new String[2];
      arrayOfString[0] = preparePairDataXML(paramArrayOfString);
      arrayOfString[1] = prepareRegistrationArgs();
      Action localAction = this.mDevice.getAction("PairAndRegister");
      setArgument(localAction, UpnpConstants.PAIR_AND_REGISTER_ARGS, arrayOfString);
      String str = localAction.postControlAction();
      Log.v("UpnpDeviceSetup", "pairAndRegister response :" + str);
      return "true";
    }
    catch (Exception localException)
    {
      Log.e("UpnpDeviceSetup", "pairAndRegister Exception: " + localException.getMessage());
    }
    return "false";
  }
  
  public JSONArray parseGetEndDeviceList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    long l = System.currentTimeMillis() / 1000L;
    Log.e("UpnpDeviceSetup", "seconds***" + l + "----" + this.timeOpenNetworkCheck);
    try
    {
      Thread.sleep(500L);
      String str = DeviceListManager.getInstance(this.mContext).getUpnpControl().getDeviceList().getDevice(0).getUDN();
      Action localAction = this.mDevice.getAction("GetEndDevices");
      String[] arrayOfString1 = UpnpConstants.GET_END_DEVICES_ARGS;
      String[] arrayOfString2 = new String[2];
      arrayOfString2[0] = str;
      arrayOfString2[1] = String.valueOf(getEndList.SCAN_LIST);
      setArgument(localAction, arrayOfString1, arrayOfString2);
      this.mResponseString = localAction.postControlAction();
      System.out.println("RESPONSE of Get end devices IS :" + this.mResponseString);
      if (this.mResponseString != null)
      {
        localJSONArray = new GetEndDeviceListResponse().parseForGetEndDeviceList(this.mResponseString);
        if (localJSONArray.length() == 0) {
          localJSONArray.put("0");
        }
      }
      System.out.println("LED get end devices******" + localJSONArray);
      return localJSONArray;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException.printStackTrace();
      }
    }
  }
  
  public JSONObject postTimeSync()
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      Action localAction = this.mDevice.getAction("TimeSync");
      setArgument(localAction, UpnpConstants.SET_TIME_SYNC_ARGS, timeSync());
      if (localAction.postControlAction().contains("failure")) {
        return this.jsonObject.put("TimeSync", false);
      }
      JSONObject localJSONObject = this.jsonObject.put("TimeSync", true);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("TimeSync", false);
  }
  
  public boolean setAttribute(JSONObject paramJSONObject)
    throws JSONException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = createAttributeList(paramJSONObject);
      Action localAction = this.mDevice.getAction("SetAttributes");
      setArgument(localAction, UpnpConstants.SET_ATTRIBUTE_KEYS, arrayOfString);
      String str = localAction.postControlAction();
      if (str == null) {
        return false;
      }
      boolean bool = new SetAttributeResponseParser().parseSetAttributeRespone(str);
      return bool;
    }
    catch (Exception localException)
    {
      Log.e("UpnpDeviceSetup", "Exception in setAttribute:: " + localException.toString());
    }
    return true;
  }
  
  public JSONObject setCustomState()
  {
    this.jsonObject = new JSONObject();
    try
    {
      String str1 = this.mDevice.getAction("SetCustomizedState").postControlAction();
      if (str1 != null)
      {
        String str2 = new ResetCustomizedResponseParser().parseCustomizedResponse(str1).getCustomizedState();
        JSONObject localJSONObject = this.jsonObject.put("SetCustomizedState", str2);
        return localJSONObject;
      }
    }
    catch (Exception localException)
    {
      Log.e("UpnpDeviceSetup", "Exception in setCustomState:: " + localException.toString());
    }
    return this.jsonObject;
  }
  
  public JSONObject setFriendlyName(String[] paramArrayOfString)
    throws JSONException
  {
    this.jsonObject = new JSONObject();
    try
    {
      Action localAction = this.mDevice.getAction("ChangeFriendlyName");
      setArgument(localAction, UpnpConstants.SET_FRIENDLY_NAME_ARGS_KEYS, paramArrayOfString);
      if (localAction.postControlAction() == null) {
        return this.jsonObject.put("ChangeFriendlyName", false);
      }
      JSONObject localJSONObject = this.jsonObject.put("ChangeFriendlyName", true);
      return localJSONObject;
    }
    catch (Exception localException) {}
    return this.jsonObject.put("ChangeFriendlyName", false);
  }
  
  public void setIcon(Bitmap paramBitmap, String paramString)
  {
    if (paramBitmap != null) {
      UploadFileUtil.uploadFileToDevice(paramString, UploadFileUtil.getByteArray(paramBitmap), 15000);
    }
  }
  
  public void setIconUsingUri(Uri paramUri, String paramString)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inSampleSize = 1;
    localOptions.inDither = false;
    for (;;)
    {
      try
      {
        if (!paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_sensor_small.png")) {
          continue;
        }
        Bitmap localBitmap2 = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_sensor_small.png"), null, localOptions);
        localObject = localBitmap2;
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        Device localDevice;
        Bitmap localBitmap1;
        localFileNotFoundException.printStackTrace();
        localObject = null;
        continue;
      }
      catch (IOException localIOException)
      {
        localIOException.printStackTrace();
        Object localObject = null;
        continue;
      }
      if (localObject != null)
      {
        UploadFileUtil.uploadFileToDevice(paramString, UploadFileUtil.getByteArray((Bitmap)localObject), 15000);
        localDevice = getSetupDevice();
        if (localDevice != null) {
          FileStorage.getInstance(this.mContext).saveIconFile(paramString, "0", localDevice.getSerialNumber());
        }
      }
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
      else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_icbulb_small.png"))
      {
        localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_icbulb_small.png"), null, localOptions);
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
      else if (paramUri.toString().equalsIgnoreCase("file:///android_asset/www/img/belkin_maker_small.png"))
      {
        localObject = BitmapFactory.decodeStream(this.mContext.getAssets().open("www/img/belkin_maker_small.png"), null, localOptions);
      }
      else
      {
        localBitmap1 = BitmapFactory.decodeStream(this.mContext.getContentResolver().openInputStream(paramUri), null, localOptions);
        localObject = localBitmap1;
      }
    }
  }
  
  public JSONArray setLedDeviceStatus(JSONArray paramJSONArray1, JSONArray paramJSONArray2)
  {
    JSONArray localJSONArray = new JSONArray();
    this.jsonObject = new JSONObject();
    Log.d("UpnpDeviceSetup", "status of set status array:********" + paramJSONArray1 + "--" + paramJSONArray2);
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
          Log.d("UpnpDeviceSetup", "status of set status:********" + this.onORoff + "------" + this.deviceId);
          new Thread(new Runnable()
          {
            public void run()
            {
              ControlPoint localControlPoint = DeviceListManager.getInstance(UpnpDeviceSetup.this.mContext).getUpnpControl();
              if ((localControlPoint != null) && (localControlPoint.getDeviceList().size() > 0))
              {
                Action localAction = localControlPoint.getDevice(localControlPoint.getDeviceList().getDevice(0).getUDN()).getAction("SetDeviceStatus");
                UpnpDeviceSetup localUpnpDeviceSetup = UpnpDeviceSetup.this;
                String[] arrayOfString1 = UpnpConstants.SET_LED_DEVICE_STATUS_SINGLE;
                String[] arrayOfString2 = new String[1];
                arrayOfString2[0] = UpnpDeviceSetup.this.domXml(UpnpDeviceSetup.this.onORoff, UpnpDeviceSetup.this.deviceId, UpnpDeviceSetup.this.capabilityID, UpnpDeviceSetup.this.isGroupAction);
                localUpnpDeviceSetup.setArgument(localAction, arrayOfString1, arrayOfString2);
                UpnpDeviceSetup.this.mResponseString = localAction.postControlAction();
                Log.d("UpnpDeviceSetup", "set led devices status ===+" + UpnpDeviceSetup.this.mResponseString);
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
  
  public void storeAPData()
  {
    String str1 = "";
    String str2 = "";
    String str3 = getMetaInfo(this.mContext)[1];
    System.out.println("serialNumber is : " + str3);
    Action localAction1 = this.mDevice.getAction("GetFriendlyName");
    if (localAction1 != null)
    {
      String str6 = localAction1.postControlAction();
      if (str6 != null)
      {
        FriendlyNameResponseBean localFriendlyNameResponseBean = new FriendlyNameResponseBean();
        new Parser().uPnPResponseParser(localFriendlyNameResponseBean, 4, str6);
        if ((localFriendlyNameResponseBean != null) && (localFriendlyNameResponseBean.getStrFriendlyName() != null))
        {
          str2 = localFriendlyNameResponseBean.getStrFriendlyName();
          System.out.println("friendly name is : " + str2);
        }
      }
    }
    Action localAction2 = this.mDevice.getAction("GetSignalStrength");
    if (localAction2 != null)
    {
      String str5 = localAction2.postControlAction();
      if (str5 != null)
      {
        SignalStrengthResponseBean localSignalStrengthResponseBean = new SignalStrengthResponseBean();
        new Parser().uPnPResponseParser(localSignalStrengthResponseBean, 14, str5);
        if ((localSignalStrengthResponseBean != null) && (localSignalStrengthResponseBean.getSignalStrength() != null))
        {
          str1 = localSignalStrengthResponseBean.getSignalStrength();
          System.out.println("signal strength is : " + str1);
        }
      }
    }
    String str4 = str1 + '|' + str2 + '|' + str3;
    this.mSharePreference.saveAPValues(str4);
  }
  
  class SortedRouterInfo
  {
    Integer channel;
    String security;
    Integer signal;
    String ssid;
    
    SortedRouterInfo() {}
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cybergarage/wrapper/UpnpDeviceSetup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */