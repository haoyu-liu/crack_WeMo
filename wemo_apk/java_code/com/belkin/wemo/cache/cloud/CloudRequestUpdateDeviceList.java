package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.Locks;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import com.belkin.wemo.cache.utils.WemoUtils;
import java.io.PrintStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CloudRequestUpdateDeviceList
  implements CloudRequestInterface
{
  private static final String KEY_ATTRIBUTE_LISTS = "attributeLists";
  private static final String KEY_CAPABILITIES = "capabilities";
  private static final String KEY_CAPABILITY_ID = "capabilityId";
  private static final String KEY_CAPABILITY_PROFILE = "capabilityProfile";
  private static final String KEY_CAPABILITY_ROOT = "deviceCapabilityProfiles";
  private static final String KEY_CAPABILITY_VALUE = "currentValue";
  private static final String KEY_COOKED_TIME = "cookedTime";
  private static final String KEY_DEVICE_TAG = "device";
  private static final String KEY_EVENT_DURATION = "eventDuration";
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_FW_STATUS = "fwUpgradeStatus";
  private static final String KEY_FW_VERSION = "firmwareVersion";
  private static final String KEY_LED_GROUP_ID = "id";
  private static final String KEY_LED_GROUP_NAME = "groupName";
  private static final String KEY_LED_GROUP_PROFILES = "groupProfiles";
  private static final String KEY_MAC_ADDRESS = "macAddress";
  private static final String KEY_MANUFACTURER = "manufacturer";
  private static final String KEY_MODEL_CODE = "modelCode";
  private static final String KEY_PARENT_PLUGIN_ID = "parentPluginId";
  private static final String KEY_PLUGIN_ID = "pluginId";
  private static final String KEY_PRODUCT_NAME = "productName";
  private static final String KEY_PRODUCT_TYPE = "productType";
  private static final String KEY_REFERENCEID = "referenceId";
  private static final String KEY_RULES_DB_VERSION = "dbVersion";
  private static final String KEY_SERIAL_NUMBER = "serialNumber";
  private static final String KEY_STATUS = "status";
  private static final String KEY_STATUSTS = "statusTS";
  private static final String KEY_STATUS_TIMESTAMP = "statusTS";
  private static final String KEY_UDN = "uniqueId";
  private static final String TAG = "SDK_CloudRequestUpdateDeviceList";
  private int TIMEOUT = 20000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/homeDevices/";
  private CacheManager cacheManager;
  private String cloudURL;
  private DevicesArray devicesArray;
  private ArrayList<DeviceInformation> devicesList = null;
  private final String endURL = "/remoteDataSynchronization";
  private Hashtable<String, JSONObject> mBridgeList;
  private Context mContext;
  private DeviceListManager mDevMgr;
  
  public CloudRequestUpdateDeviceList(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "CloudRequestUpdateDeviceList Called");
    this.mContext = paramContext;
    this.mDevMgr = paramDeviceListManager;
    CloudAuth localCloudAuth = new CloudAuth(this.mContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID() + "/remoteDataSynchronization");
    this.mBridgeList = new Hashtable();
    this.cacheManager = CacheManager.getInstance(paramContext);
    this.devicesArray = DevicesArray.getInstance(paramContext);
  }
  
  private String extractCapabilities(XMLParser paramXMLParser, Element paramElement, int paramInt)
  {
    localJSONObject = new JSONObject();
    try
    {
      Node localNode1 = paramElement.getElementsByTagName("capabilities").item(0);
      if (localNode1 != null) {
        for (int j = 0; j < localNode1.getChildNodes().getLength(); j++)
        {
          Element localElement2 = (Element)localNode1.getChildNodes().item(j);
          String str4 = paramXMLParser.getValue(localElement2, "capabilityId");
          String str5 = paramXMLParser.getValue(localElement2, "currentValue");
          if (DeviceListManager.capabalityProfileList == null) {
            DeviceListManager.updateCapabilityProfileTable();
          }
          String str6 = (String)DeviceListManager.capabalityProfileList.get(str4);
          if ((str4.equals("10006")) && (TextUtils.isEmpty(str5))) {
            str5 = String.valueOf(paramInt);
          }
          localJSONObject.put(str6, str5);
        }
      }
      Node localNode2 = paramElement.getElementsByTagName("deviceCapabilityProfiles").item(0);
      if (localNode2 != null) {
        for (int i = 0; i < localNode2.getChildNodes().getLength(); i++)
        {
          Element localElement1 = (Element)localNode2.getChildNodes().item(i);
          String str1 = paramXMLParser.getValue((Element)localElement1.getElementsByTagName("capabilityProfile").item(0), "capabilityId");
          String str2 = paramXMLParser.getValue(localElement1, "currentValue");
          if (DeviceListManager.capabalityProfileList == null) {
            DeviceListManager.updateCapabilityProfileTable();
          }
          String str3 = (String)DeviceListManager.capabalityProfileList.get(str1);
          if ((str1.equals("10006")) && (TextUtils.isEmpty(str2))) {
            str2 = String.valueOf(paramInt);
          }
          localJSONObject.put(str3, str2);
        }
      }
      return localJSONObject.toString();
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private String extractTimeStamp(XMLParser paramXMLParser, Element paramElement)
  {
    localObject = "";
    try
    {
      Node localNode = paramElement.getElementsByTagName("deviceCapabilityProfiles").item(0);
      if (localNode != null) {
        for (int i = 0; i < localNode.getChildNodes().getLength(); i++)
        {
          Element localElement = (Element)localNode.getChildNodes().item(i);
          if (paramXMLParser.getValue((Element)localElement.getElementsByTagName("capabilityProfile").item(0), "capabilityId").equals("10500"))
          {
            String str = paramXMLParser.getValue(localElement, "ts");
            localObject = str;
          }
        }
      }
      return (String)localObject;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "Exception in extracting last event time stamp", localException);
      SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "extractTimeStamp:: ts--> " + (String)localObject);
    }
  }
  
  private int getIconVersion(String paramString)
  {
    int i = Integer.parseInt("0");
    if (isEmptyOrNull(paramString)) {
      return i;
    }
    try
    {
      int j = Integer.parseInt(paramString);
      return j;
    }
    catch (Exception localException) {}
    return i;
  }
  
  private boolean isEmptyOrNull(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }
  
  private String makeAttributeList(Node paramNode)
  {
    NodeList localNodeList1 = paramNode.getChildNodes();
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("{");
    for (int i = 0; i < localNodeList1.getLength(); i++)
    {
      Node localNode1 = localNodeList1.item(i);
      if ((localNode1 instanceof Element))
      {
        NodeList localNodeList2 = localNode1.getChildNodes();
        for (int j = 0; j < localNodeList2.getLength(); j++)
        {
          Node localNode2 = localNodeList2.item(j);
          if ((localNode2 instanceof Element))
          {
            String str = MoreUtil.changeAttributes(localNode2.getLastChild().getTextContent().trim());
            if (localNode2.getNodeName().equals("name")) {
              localStringBuffer.append("\"" + str + "\":{");
            }
            localStringBuffer.append("\"" + localNode2.getNodeName() + "\":" + "\"" + str + "\",");
          }
        }
        localStringBuffer.setLength(-1 + localStringBuffer.length());
        localStringBuffer.append("},");
      }
    }
    localStringBuffer.setLength(-1 + localStringBuffer.length());
    localStringBuffer.append("}");
    SDKLogUtils.verboseLog("SDK_CloudRequestUpdateDeviceList", "Attributelist Update :" + localStringBuffer);
    return localStringBuffer.toString();
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
  
  /* Error */
  private boolean parseResponse(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: new 419	java/util/ArrayList
    //   4: dup
    //   5: invokespecial 420	java/util/ArrayList:<init>	()V
    //   8: putfield 151	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:devicesList	Ljava/util/ArrayList;
    //   11: ldc_w 273
    //   14: astore_3
    //   15: new 224	com/belkin/wemo/cache/cloud/XMLParser
    //   18: dup
    //   19: invokespecial 421	com/belkin/wemo/cache/cloud/XMLParser:<init>	()V
    //   22: astore 4
    //   24: aload 4
    //   26: aload_1
    //   27: invokevirtual 425	com/belkin/wemo/cache/cloud/XMLParser:getDomElement	(Ljava/lang/String;)Lorg/w3c/dom/Document;
    //   30: ldc 31
    //   32: invokeinterface 428 2 0
    //   37: astore 5
    //   39: aconst_null
    //   40: astore 6
    //   42: iconst_0
    //   43: istore 7
    //   45: aload 5
    //   47: invokeinterface 222 1 0
    //   52: istore 8
    //   54: iload 7
    //   56: iload 8
    //   58: if_icmpge +1662 -> 1720
    //   61: aload 5
    //   63: iload 7
    //   65: invokeinterface 212 2 0
    //   70: checkcast 202	org/w3c/dom/Element
    //   73: astore 9
    //   75: aload 4
    //   77: aload 9
    //   79: ldc 61
    //   81: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   84: astore 10
    //   86: aload 10
    //   88: ifnull +1647 -> 1735
    //   91: aload 10
    //   93: invokevirtual 321	java/lang/String:trim	()Ljava/lang/String;
    //   96: invokevirtual 301	java/lang/String:length	()I
    //   99: ifgt +6 -> 105
    //   102: goto +1633 -> 1735
    //   105: aload 4
    //   107: aload 9
    //   109: ldc 85
    //   111: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   114: astore 11
    //   116: ldc 95
    //   118: new 122	java/lang/StringBuilder
    //   121: dup
    //   122: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   125: ldc_w 430
    //   128: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   131: aload 11
    //   133: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   136: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   139: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   142: aload 10
    //   144: invokestatic 435	com/belkin/wemo/cache/utils/WemoUtils:isLEDModelCodeSupported	(Ljava/lang/String;)Z
    //   147: ifne +1588 -> 1735
    //   150: aload 10
    //   152: ldc_w 437
    //   155: invokevirtual 440	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   158: ifeq +202 -> 360
    //   161: aload_0
    //   162: getfield 178	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   165: invokevirtual 443	java/util/Hashtable:size	()I
    //   168: ifle +135 -> 303
    //   171: new 199	org/json/JSONObject
    //   174: dup
    //   175: invokespecial 200	org/json/JSONObject:<init>	()V
    //   178: astore 39
    //   180: aload_0
    //   181: getfield 178	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   184: invokevirtual 447	java/util/Hashtable:keys	()Ljava/util/Enumeration;
    //   187: astore 40
    //   189: aload 40
    //   191: invokeinterface 453 1 0
    //   196: ifeq +32 -> 228
    //   199: aload 40
    //   201: invokeinterface 457 1 0
    //   206: checkcast 245	java/lang/String
    //   209: astore 48
    //   211: aload_0
    //   212: getfield 178	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   215: aload 48
    //   217: invokevirtual 458	java/util/Hashtable:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   220: checkcast 199	org/json/JSONObject
    //   223: astore 39
    //   225: goto -36 -> 189
    //   228: aload 39
    //   230: ldc 85
    //   232: invokevirtual 461	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   235: ldc_w 463
    //   238: invokevirtual 464	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   241: ifeq +1494 -> 1735
    //   244: aload_0
    //   245: getfield 151	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:devicesList	Ljava/util/ArrayList;
    //   248: invokevirtual 468	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   251: astore 41
    //   253: aload 41
    //   255: invokeinterface 473 1 0
    //   260: ifeq +43 -> 303
    //   263: aload 41
    //   265: invokeinterface 476 1 0
    //   270: checkcast 478	com/belkin/wemo/cache/data/DeviceInformation
    //   273: astore 46
    //   275: aload 46
    //   277: invokevirtual 481	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   280: aload 39
    //   282: ldc 92
    //   284: invokevirtual 461	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   287: invokevirtual 251	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   290: ifeq -37 -> 253
    //   293: aload_0
    //   294: getfield 151	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:devicesList	Ljava/util/ArrayList;
    //   297: aload 46
    //   299: invokevirtual 484	java/util/ArrayList:remove	(Ljava/lang/Object;)Z
    //   302: pop
    //   303: new 199	org/json/JSONObject
    //   306: dup
    //   307: invokespecial 200	org/json/JSONObject:<init>	()V
    //   310: astore 42
    //   312: aload 4
    //   314: aload 9
    //   316: ldc 92
    //   318: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   321: astore_3
    //   322: aload 42
    //   324: ldc 92
    //   326: aload_3
    //   327: invokevirtual 265	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   330: pop
    //   331: aload 42
    //   333: ldc 85
    //   335: aload 11
    //   337: invokevirtual 265	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   340: pop
    //   341: aload_0
    //   342: getfield 178	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   345: aload 4
    //   347: aload 9
    //   349: ldc 67
    //   351: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   354: aload 42
    //   356: invokevirtual 487	java/util/Hashtable:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   359: pop
    //   360: new 489	com/belkin/wemo/cache/utils/SharePreferences
    //   363: dup
    //   364: aload_0
    //   365: getfield 161	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mContext	Landroid/content/Context;
    //   368: invokespecial 490	com/belkin/wemo/cache/utils/SharePreferences:<init>	(Landroid/content/Context;)V
    //   371: invokevirtual 493	com/belkin/wemo/cache/utils/SharePreferences:getHomeId	()Ljava/lang/String;
    //   374: astore 12
    //   376: aload 4
    //   378: aload 9
    //   380: ldc 92
    //   382: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   385: astore 13
    //   387: getstatic 496	com/belkin/wemo/cache/devicelist/DeviceListManager:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   390: astore 14
    //   392: aload 14
    //   394: ifnonnull +12 -> 406
    //   397: aload_0
    //   398: getfield 161	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:mContext	Landroid/content/Context;
    //   401: invokestatic 499	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   404: astore 14
    //   406: aload 14
    //   408: invokevirtual 503	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformationList	()Ljava/util/Map;
    //   411: astore 15
    //   413: aload 15
    //   415: ifnull +17 -> 432
    //   418: aload 15
    //   420: aload 13
    //   422: invokeinterface 506 2 0
    //   427: checkcast 478	com/belkin/wemo/cache/data/DeviceInformation
    //   430: astore 6
    //   432: aload 6
    //   434: ifnonnull +159 -> 593
    //   437: ldc 95
    //   439: ldc_w 508
    //   442: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   445: new 478	com/belkin/wemo/cache/data/DeviceInformation
    //   448: dup
    //   449: aload 4
    //   451: aload 9
    //   453: ldc 92
    //   455: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   458: aload 12
    //   460: aload 4
    //   462: aload 9
    //   464: ldc 55
    //   466: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   469: aload 4
    //   471: aload 9
    //   473: ldc 67
    //   475: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   478: invokespecial 511	com/belkin/wemo/cache/data/DeviceInformation:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   481: astore 6
    //   483: aload 6
    //   485: aload 4
    //   487: aload 9
    //   489: ldc 37
    //   491: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   494: invokevirtual 514	com/belkin/wemo/cache/data/DeviceInformation:setFriendlyName	(Ljava/lang/String;)V
    //   497: aload 6
    //   499: aload 10
    //   501: invokevirtual 517	com/belkin/wemo/cache/data/DeviceInformation:setModelCode	(Ljava/lang/String;)V
    //   504: aload 6
    //   506: aload 10
    //   508: invokevirtual 520	com/belkin/wemo/cache/data/DeviceInformation:setType	(Ljava/lang/String;)V
    //   511: aload 4
    //   513: aload 9
    //   515: ldc 70
    //   517: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   520: astore 16
    //   522: aload 16
    //   524: invokevirtual 522	java/lang/String:isEmpty	()Z
    //   527: ifeq +837 -> 1364
    //   530: aload 6
    //   532: getstatic 526	com/belkin/wemo/cache/data/DevicesArray:productNameMapping	Ljava/util/HashMap;
    //   535: aload 6
    //   537: invokevirtual 529	com/belkin/wemo/cache/data/DeviceInformation:getModelCode	()Ljava/lang/String;
    //   540: invokevirtual 532	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   543: checkcast 245	java/lang/String
    //   546: invokestatic 537	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   549: invokevirtual 540	com/belkin/wemo/cache/data/DeviceInformation:setProductName	(Ljava/lang/String;)V
    //   552: aload 4
    //   554: aload 9
    //   556: ldc 73
    //   558: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   561: astore 17
    //   563: aload 17
    //   565: invokevirtual 522	java/lang/String:isEmpty	()Z
    //   568: ifeq +809 -> 1377
    //   571: aload 6
    //   573: getstatic 543	com/belkin/wemo/cache/data/DevicesArray:productTypeMapping	Ljava/util/HashMap;
    //   576: aload 6
    //   578: invokevirtual 529	com/belkin/wemo/cache/data/DeviceInformation:getModelCode	()Ljava/lang/String;
    //   581: invokevirtual 532	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   584: checkcast 245	java/lang/String
    //   587: invokestatic 537	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   590: invokevirtual 546	com/belkin/wemo/cache/data/DeviceInformation:setProductType	(Ljava/lang/String;)V
    //   593: aload 6
    //   595: ifnull +1140 -> 1735
    //   598: aload 6
    //   600: invokevirtual 481	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   603: invokevirtual 301	java/lang/String:length	()I
    //   606: ifle +1129 -> 1735
    //   609: aload 6
    //   611: aload 4
    //   613: aload 9
    //   615: ldc 40
    //   617: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   620: invokevirtual 549	com/belkin/wemo/cache/data/DeviceInformation:setFwStatus	(Ljava/lang/String;)V
    //   623: aload 6
    //   625: aload 4
    //   627: aload 9
    //   629: ldc 43
    //   631: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   634: invokevirtual 552	com/belkin/wemo/cache/data/DeviceInformation:setFirmwareVersion	(Ljava/lang/String;)V
    //   637: aload 6
    //   639: aload 4
    //   641: aload 9
    //   643: ldc 88
    //   645: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   648: invokevirtual 555	com/belkin/wemo/cache/data/DeviceInformation:setLastTimestamp	(Ljava/lang/String;)V
    //   651: aload 6
    //   653: invokevirtual 558	com/belkin/wemo/cache/data/DeviceInformation:getIcon	()Ljava/lang/String;
    //   656: astore 18
    //   658: aload_0
    //   659: aload 4
    //   661: aload 9
    //   663: ldc_w 560
    //   666: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   669: invokespecial 562	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:getIconVersion	(Ljava/lang/String;)I
    //   672: istore 19
    //   674: aload_0
    //   675: aload 6
    //   677: invokevirtual 564	com/belkin/wemo/cache/data/DeviceInformation:getIconVersion	()Ljava/lang/String;
    //   680: invokespecial 562	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:getIconVersion	(Ljava/lang/String;)I
    //   683: istore 20
    //   685: iload 20
    //   687: iload 19
    //   689: if_icmpge +1058 -> 1747
    //   692: iconst_1
    //   693: istore 21
    //   695: iload 21
    //   697: ifne +15 -> 712
    //   700: aload_0
    //   701: aload 6
    //   703: invokevirtual 564	com/belkin/wemo/cache/data/DeviceInformation:getIconVersion	()Ljava/lang/String;
    //   706: invokespecial 298	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:isEmptyOrNull	(Ljava/lang/String;)Z
    //   709: ifeq +13 -> 722
    //   712: aload 6
    //   714: iload 19
    //   716: invokestatic 261	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   719: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:setIconVersion	(Ljava/lang/String;)V
    //   722: aload 18
    //   724: ldc_w 569
    //   727: invokevirtual 572	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   730: istore 22
    //   732: iload 22
    //   734: ifne +1007 -> 1741
    //   737: aload 18
    //   739: ldc_w 273
    //   742: if_acmpne +6 -> 748
    //   745: goto +996 -> 1741
    //   748: iload 21
    //   750: ifeq +84 -> 834
    //   753: aload 18
    //   755: invokestatic 577	com/belkin/wemo/storage/FileStorage:doesCustomIconExistAtLocation	(Ljava/lang/String;)Z
    //   758: istore 23
    //   760: ldc 95
    //   762: new 122	java/lang/StringBuilder
    //   765: dup
    //   766: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   769: ldc_w 579
    //   772: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   775: iload 23
    //   777: invokevirtual 582	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   780: ldc_w 584
    //   783: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   786: aload 18
    //   788: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   791: ldc_w 586
    //   794: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   797: aload 13
    //   799: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   802: ldc_w 588
    //   805: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   808: aload_0
    //   809: invokestatic 592	java/lang/System:identityHashCode	(Ljava/lang/Object;)I
    //   812: invokevirtual 595	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   815: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   818: invokestatic 598	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   821: iload 23
    //   823: ifeq +11 -> 834
    //   826: iload 22
    //   828: ifne +6 -> 834
    //   831: iconst_0
    //   832: istore 21
    //   834: aload 6
    //   836: iload 21
    //   838: invokevirtual 602	com/belkin/wemo/cache/data/DeviceInformation:setNeedIconUpdate	(Z)V
    //   841: ldc 95
    //   843: new 122	java/lang/StringBuilder
    //   846: dup
    //   847: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   850: ldc_w 604
    //   853: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   856: iload 21
    //   858: invokevirtual 582	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   861: ldc_w 606
    //   864: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   867: iload 20
    //   869: invokevirtual 595	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   872: ldc_w 608
    //   875: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   878: iload 19
    //   880: invokevirtual 595	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   883: ldc_w 610
    //   886: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   889: aload 13
    //   891: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   894: ldc_w 612
    //   897: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   900: aload 18
    //   902: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   905: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   908: invokestatic 598	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   911: aload 6
    //   913: aload 4
    //   915: aload 9
    //   917: ldc 82
    //   919: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   922: invokevirtual 615	com/belkin/wemo/cache/data/DeviceInformation:setSerialNumber	(Ljava/lang/String;)V
    //   925: aload 11
    //   927: invokestatic 257	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   930: istore 24
    //   932: iload 24
    //   934: ifne +493 -> 1427
    //   937: aload 6
    //   939: aload 11
    //   941: invokestatic 618	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   944: invokevirtual 621	java/lang/Integer:intValue	()I
    //   947: invokevirtual 624	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   950: aload 4
    //   952: aload 9
    //   954: ldc 88
    //   956: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   959: invokestatic 257	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   962: istore 25
    //   964: iload 25
    //   966: ifne +506 -> 1472
    //   969: aload 6
    //   971: aload 4
    //   973: aload 9
    //   975: ldc 88
    //   977: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   980: invokestatic 294	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   983: invokevirtual 627	com/belkin/wemo/cache/data/DeviceInformation:setStatusTS	(I)V
    //   986: ldc 95
    //   988: new 122	java/lang/StringBuilder
    //   991: dup
    //   992: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   995: ldc_w 629
    //   998: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1001: aload 6
    //   1003: invokevirtual 632	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   1006: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1009: ldc_w 634
    //   1012: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1015: aload 6
    //   1017: invokevirtual 637	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1020: invokevirtual 595	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1023: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1026: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1029: aload 6
    //   1031: invokevirtual 637	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1034: iconst_3
    //   1035: if_icmpne +448 -> 1483
    //   1038: aload 6
    //   1040: iconst_1
    //   1041: invokevirtual 640	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   1044: aload 6
    //   1046: iconst_0
    //   1047: invokevirtual 643	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   1050: aload 6
    //   1052: invokevirtual 637	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1055: ifne +443 -> 1498
    //   1058: aload 6
    //   1060: ldc_w 289
    //   1063: invokevirtual 646	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   1066: aload 6
    //   1068: iconst_0
    //   1069: invokevirtual 649	com/belkin/wemo/cache/data/DeviceInformation:setHide	(I)V
    //   1072: aload 4
    //   1074: aload 9
    //   1076: ldc 67
    //   1078: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1081: astore 26
    //   1083: ldc 95
    //   1085: new 122	java/lang/StringBuilder
    //   1088: dup
    //   1089: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1092: ldc_w 651
    //   1095: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1098: aload 26
    //   1100: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1103: ldc_w 586
    //   1106: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1109: aload 13
    //   1111: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1114: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1117: invokestatic 598	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1120: aload 6
    //   1122: aload 26
    //   1124: invokevirtual 654	com/belkin/wemo/cache/data/DeviceInformation:setPluginId	(Ljava/lang/String;)V
    //   1127: aload 6
    //   1129: aload 4
    //   1131: aload 9
    //   1133: ldc 37
    //   1135: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1138: invokevirtual 514	com/belkin/wemo/cache/data/DeviceInformation:setFriendlyName	(Ljava/lang/String;)V
    //   1141: aload 4
    //   1143: aload 9
    //   1145: ldc 79
    //   1147: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1150: astore 27
    //   1152: aload 27
    //   1154: ldc_w 273
    //   1157: invokevirtual 251	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1160: ifne +16 -> 1176
    //   1163: aload 6
    //   1165: aload 27
    //   1167: invokestatic 618	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   1170: invokevirtual 621	java/lang/Integer:intValue	()I
    //   1173: invokevirtual 657	com/belkin/wemo/cache/data/DeviceInformation:setRulesDBVersion	(I)V
    //   1176: aload 6
    //   1178: iconst_1
    //   1179: invokevirtual 660	com/belkin/wemo/cache/data/DeviceInformation:setRemote	(Z)V
    //   1182: aload 6
    //   1184: invokevirtual 481	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1187: invokestatic 665	com/belkin/wemo/cache/utils/IsDevice:Crockpot	(Ljava/lang/String;)Z
    //   1190: ifeq +349 -> 1539
    //   1193: aload 4
    //   1195: aload 9
    //   1197: ldc 28
    //   1199: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1202: astore 34
    //   1204: aload 4
    //   1206: aload 9
    //   1208: ldc 34
    //   1210: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1213: astore 35
    //   1215: aload 4
    //   1217: aload 9
    //   1219: ldc 88
    //   1221: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   1224: astore 36
    //   1226: ldc 95
    //   1228: new 122	java/lang/StringBuilder
    //   1231: dup
    //   1232: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1235: ldc_w 667
    //   1238: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1241: aload 34
    //   1243: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1246: ldc_w 669
    //   1249: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1252: aload 35
    //   1254: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1257: ldc_w 671
    //   1260: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1263: aload 36
    //   1265: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1268: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1271: invokestatic 598	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1274: aload 6
    //   1276: ldc 28
    //   1278: aload 34
    //   1280: invokevirtual 674	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   1283: aload 6
    //   1285: ldc 34
    //   1287: aload 35
    //   1289: invokevirtual 674	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   1292: aload 6
    //   1294: ldc_w 676
    //   1297: aload 35
    //   1299: invokevirtual 674	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   1302: aload 6
    //   1304: ldc_w 678
    //   1307: aload 36
    //   1309: invokevirtual 674	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   1312: aload 6
    //   1314: ifnull +421 -> 1735
    //   1317: ldc_w 680
    //   1320: new 122	java/lang/StringBuilder
    //   1323: dup
    //   1324: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1327: ldc_w 682
    //   1330: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1333: aload 6
    //   1335: invokevirtual 354	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1338: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1341: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1344: aload_0
    //   1345: getfield 151	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:devicesList	Ljava/util/ArrayList;
    //   1348: aload 6
    //   1350: invokevirtual 685	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   1353: pop
    //   1354: goto +381 -> 1735
    //   1357: astore_2
    //   1358: aload_2
    //   1359: invokevirtual 268	java/lang/Exception:printStackTrace	()V
    //   1362: iconst_0
    //   1363: ireturn
    //   1364: aload 6
    //   1366: aload 16
    //   1368: invokestatic 537	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   1371: invokevirtual 540	com/belkin/wemo/cache/data/DeviceInformation:setProductName	(Ljava/lang/String;)V
    //   1374: goto -822 -> 552
    //   1377: aload 6
    //   1379: aload 17
    //   1381: invokestatic 537	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   1384: invokevirtual 546	com/belkin/wemo/cache/data/DeviceInformation:setProductType	(Ljava/lang/String;)V
    //   1387: goto -794 -> 593
    //   1390: astore 38
    //   1392: ldc 95
    //   1394: new 122	java/lang/StringBuilder
    //   1397: dup
    //   1398: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1401: ldc_w 687
    //   1404: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1407: aload 11
    //   1409: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1412: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1415: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1418: aload 6
    //   1420: iconst_3
    //   1421: invokevirtual 624	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   1424: goto -474 -> 950
    //   1427: ldc 95
    //   1429: new 122	java/lang/StringBuilder
    //   1432: dup
    //   1433: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1436: ldc_w 689
    //   1439: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1442: aload 11
    //   1444: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1447: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1450: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1453: aload 6
    //   1455: iconst_3
    //   1456: invokevirtual 624	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   1459: goto -509 -> 950
    //   1462: astore 37
    //   1464: aload 37
    //   1466: invokevirtual 690	java/lang/NumberFormatException:printStackTrace	()V
    //   1469: goto -483 -> 986
    //   1472: ldc 95
    //   1474: ldc_w 692
    //   1477: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1480: goto -494 -> 986
    //   1483: aload 6
    //   1485: iconst_0
    //   1486: invokevirtual 640	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   1489: aload 6
    //   1491: iconst_1
    //   1492: invokevirtual 643	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   1495: goto -445 -> 1050
    //   1498: aload 6
    //   1500: invokevirtual 637	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1503: iconst_1
    //   1504: if_icmpne +14 -> 1518
    //   1507: aload 6
    //   1509: ldc_w 694
    //   1512: invokevirtual 646	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   1515: goto -449 -> 1066
    //   1518: aload 6
    //   1520: invokevirtual 637	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1523: bipush 8
    //   1525: if_icmpne -459 -> 1066
    //   1528: aload 6
    //   1530: ldc_w 696
    //   1533: invokevirtual 646	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   1536: goto -470 -> 1066
    //   1539: aload 9
    //   1541: ldc 10
    //   1543: invokeinterface 206 2 0
    //   1548: astore 28
    //   1550: iconst_0
    //   1551: istore 29
    //   1553: aload 28
    //   1555: invokeinterface 222 1 0
    //   1560: istore 30
    //   1562: iload 29
    //   1564: iload 30
    //   1566: if_icmpge +45 -> 1611
    //   1569: ldc 95
    //   1571: new 122	java/lang/StringBuilder
    //   1574: dup
    //   1575: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1578: ldc_w 698
    //   1581: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1584: aload 28
    //   1586: iload 29
    //   1588: invokeinterface 212 2 0
    //   1593: invokestatic 700	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:nodeToString	(Lorg/w3c/dom/Node;)Ljava/lang/String;
    //   1596: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1599: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1602: invokestatic 598	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1605: iinc 29 1
    //   1608: goto -55 -> 1553
    //   1611: aload 9
    //   1613: ldc 10
    //   1615: invokeinterface 206 2 0
    //   1620: ifnull -308 -> 1312
    //   1623: aload 9
    //   1625: ldc 10
    //   1627: invokeinterface 206 2 0
    //   1632: invokeinterface 222 1 0
    //   1637: ifle -325 -> 1312
    //   1640: aload 9
    //   1642: ldc 10
    //   1644: invokeinterface 206 2 0
    //   1649: iconst_0
    //   1650: invokeinterface 212 2 0
    //   1655: astore 31
    //   1657: aload 31
    //   1659: ifnull -347 -> 1312
    //   1662: new 702	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser
    //   1665: dup
    //   1666: invokespecial 703	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:<init>	()V
    //   1669: aload 31
    //   1671: invokestatic 700	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:nodeToString	(Lorg/w3c/dom/Node;)Ljava/lang/String;
    //   1674: invokevirtual 707	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:parseGetAttributeResponse	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   1677: astore 32
    //   1679: ldc 95
    //   1681: new 122	java/lang/StringBuilder
    //   1684: dup
    //   1685: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   1688: ldc_w 709
    //   1691: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1694: aload 32
    //   1696: invokevirtual 354	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1699: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1702: invokestatic 159	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1705: aload 32
    //   1707: ifnull -395 -> 1312
    //   1710: aload 6
    //   1712: aload 32
    //   1714: invokevirtual 713	com/belkin/wemo/cache/data/DeviceInformation:setAttributeList	(Lorg/json/JSONObject;)V
    //   1717: goto -405 -> 1312
    //   1720: ldc_w 273
    //   1723: aload_3
    //   1724: if_acmpeq +9 -> 1733
    //   1727: aload_0
    //   1728: aload_1
    //   1729: aload_3
    //   1730: invokespecial 716	com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList:searchForZigBee	(Ljava/lang/String;Ljava/lang/String;)V
    //   1733: iconst_1
    //   1734: ireturn
    //   1735: iinc 7 1
    //   1738: goto -1693 -> 45
    //   1741: iconst_1
    //   1742: istore 21
    //   1744: goto -996 -> 748
    //   1747: iconst_0
    //   1748: istore 21
    //   1750: goto -1055 -> 695
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1753	0	this	CloudRequestUpdateDeviceList
    //   0	1753	1	paramString	String
    //   1357	2	2	localException	Exception
    //   14	1716	3	str1	String
    //   22	1194	4	localXMLParser	XMLParser
    //   37	25	5	localNodeList1	NodeList
    //   40	1671	6	localDeviceInformation1	DeviceInformation
    //   43	1693	7	i	int
    //   52	7	8	j	int
    //   73	1568	9	localElement	Element
    //   84	423	10	str2	String
    //   114	1329	11	str3	String
    //   374	85	12	str4	String
    //   385	725	13	str5	String
    //   390	17	14	localDeviceListManager	DeviceListManager
    //   411	8	15	localMap	Map
    //   520	847	16	str6	String
    //   561	819	17	str7	String
    //   656	245	18	str8	String
    //   672	207	19	k	int
    //   683	185	20	m	int
    //   693	1056	21	bool1	boolean
    //   730	97	22	bool2	boolean
    //   758	64	23	bool3	boolean
    //   930	3	24	bool4	boolean
    //   962	3	25	bool5	boolean
    //   1081	42	26	str9	String
    //   1150	16	27	str10	String
    //   1548	37	28	localNodeList2	NodeList
    //   1551	55	29	n	int
    //   1560	7	30	i1	int
    //   1655	15	31	localNode	Node
    //   1677	36	32	localJSONObject1	JSONObject
    //   1202	77	34	str11	String
    //   1213	85	35	str12	String
    //   1224	84	36	str13	String
    //   1462	3	37	localNumberFormatException1	NumberFormatException
    //   1390	1	38	localNumberFormatException2	NumberFormatException
    //   178	103	39	localJSONObject2	JSONObject
    //   187	13	40	localEnumeration	java.util.Enumeration
    //   251	13	41	localIterator	Iterator
    //   310	45	42	localJSONObject3	JSONObject
    //   273	25	46	localDeviceInformation2	DeviceInformation
    //   209	7	48	str14	String
    // Exception table:
    //   from	to	target	type
    //   0	11	1357	java/lang/Exception
    //   15	39	1357	java/lang/Exception
    //   45	54	1357	java/lang/Exception
    //   61	86	1357	java/lang/Exception
    //   91	102	1357	java/lang/Exception
    //   105	189	1357	java/lang/Exception
    //   189	225	1357	java/lang/Exception
    //   228	253	1357	java/lang/Exception
    //   253	303	1357	java/lang/Exception
    //   303	360	1357	java/lang/Exception
    //   360	392	1357	java/lang/Exception
    //   397	406	1357	java/lang/Exception
    //   406	413	1357	java/lang/Exception
    //   418	432	1357	java/lang/Exception
    //   437	552	1357	java/lang/Exception
    //   552	593	1357	java/lang/Exception
    //   598	685	1357	java/lang/Exception
    //   700	712	1357	java/lang/Exception
    //   712	722	1357	java/lang/Exception
    //   722	732	1357	java/lang/Exception
    //   753	821	1357	java/lang/Exception
    //   834	932	1357	java/lang/Exception
    //   937	950	1357	java/lang/Exception
    //   950	964	1357	java/lang/Exception
    //   969	986	1357	java/lang/Exception
    //   986	1050	1357	java/lang/Exception
    //   1050	1066	1357	java/lang/Exception
    //   1066	1176	1357	java/lang/Exception
    //   1176	1312	1357	java/lang/Exception
    //   1317	1354	1357	java/lang/Exception
    //   1364	1374	1357	java/lang/Exception
    //   1377	1387	1357	java/lang/Exception
    //   1392	1424	1357	java/lang/Exception
    //   1427	1459	1357	java/lang/Exception
    //   1464	1469	1357	java/lang/Exception
    //   1472	1480	1357	java/lang/Exception
    //   1483	1495	1357	java/lang/Exception
    //   1498	1515	1357	java/lang/Exception
    //   1518	1536	1357	java/lang/Exception
    //   1539	1550	1357	java/lang/Exception
    //   1553	1562	1357	java/lang/Exception
    //   1569	1605	1357	java/lang/Exception
    //   1611	1657	1357	java/lang/Exception
    //   1662	1705	1357	java/lang/Exception
    //   1710	1717	1357	java/lang/Exception
    //   1727	1733	1357	java/lang/Exception
    //   937	950	1390	java/lang/NumberFormatException
    //   969	986	1462	java/lang/NumberFormatException
  }
  
  public static JSONArray parseResponseFromCloudByTagName(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      NodeList localNodeList = ((Element)new XMLParser().getDomElement(paramString1).getElementsByTagName(paramString2).item(0)).getElementsByTagName(paramString3);
      JSONArray localJSONArray = new JSONArray();
      for (int i = 0; i < localNodeList.getLength(); i++) {
        localJSONArray.put(localNodeList.item(i).getTextContent());
      }
      SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "parseResponseFromCloudByTagName: resultArray: " + localJSONArray);
      return localJSONArray;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "Caught Exception in parseResponseFromCloudByTagName: ", localException);
    }
    return null;
  }
  
  private void searchForZigBee(String paramString1, String paramString2)
  {
    for (;;)
    {
      int i;
      int k;
      DeviceInformation localDeviceInformation;
      try
      {
        SDKLogUtils.debugLog("SDK_CloudRequestUpdateDeviceList", "Searching for Zigbee Devices in CloudRequestUpdateDeviceList response. Bridge UDN: " + paramString2);
        XMLParser localXMLParser = new XMLParser();
        NodeList localNodeList = localXMLParser.getDomElement(paramString1).getElementsByTagName("device");
        Map localMap = DeviceListManager.devListManager.getDeviceInformationList();
        i = 0;
        int j = localNodeList.getLength();
        if (i >= j) {
          break label892;
        }
        Element localElement1 = (Element)localNodeList.item(i);
        String str1 = localXMLParser.getValue(localElement1, "modelCode");
        k = Integer.parseInt(localXMLParser.getValue(localElement1, "status"));
        if (!WemoUtils.isLEDModelCodeSupported(str1)) {
          break label900;
        }
        String str2 = extractCapabilities(localXMLParser, localElement1, k);
        String str3 = extractTimeStamp(localXMLParser, localElement1);
        String str4 = "";
        Object localObject = "";
        String str5;
        try
        {
          Node localNode = localElement1.getElementsByTagName("groupProfiles").item(0);
          if (localNode != null)
          {
            int m = 0;
            int n = localNode.getChildNodes().getLength();
            if (m < n)
            {
              Element localElement2 = (Element)localNode.getChildNodes().item(m);
              str4 = localXMLParser.getValue(localElement2, "referenceId");
              String str8 = localXMLParser.getValue(localElement2, "groupName");
              localObject = str8;
              m++;
              continue;
            }
          }
          localDeviceInformation = new DeviceInformation(((JSONObject)this.mBridgeList.get(localXMLParser.getValue(localElement1, "parentPluginId"))).getString("uniqueId"), localXMLParser.getValue(localElement1, "macAddress"), k, str2, "", localXMLParser.getValue(localElement1, "firmwareVersion"), str1, localXMLParser.getValue(localElement1, "friendlyName"), localXMLParser.getValue(localElement1, "pluginId"));
        }
        catch (Exception localException2)
        {
          SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "Exception in searchForZigBee: ", localException2);
          SDKLogUtils.infoLog("RemoteMode:", "groupID" + str4 + "groupName:" + (String)localObject);
          str5 = localXMLParser.getValue(localElement1, "macAddress");
          SDKLogUtils.infoLog("RemoteMode:", str5 + " led state:" + k);
          localDeviceInformation = null;
          if (localMap != null) {
            localDeviceInformation = (DeviceInformation)localMap.get(str5);
          }
          if (localDeviceInformation != null) {
            continue;
          }
        }
        String str6 = localXMLParser.getValue(localElement1, "productName");
        String str7;
        if (str6.isEmpty())
        {
          localDeviceInformation.setProductName(StringUtils.toLowerCamelCase((String)DevicesArray.productNameMapping.get(localDeviceInformation.getModelCode())));
          str7 = localXMLParser.getValue(localElement1, "productType");
          if (str7.isEmpty())
          {
            localDeviceInformation.setProductType(StringUtils.toLowerCamelCase((String)DevicesArray.productTypeMapping.get(localDeviceInformation.getModelCode())));
            localDeviceInformation.setGroupID(str4);
            localDeviceInformation.setGroupName((String)localObject);
            localDeviceInformation.setUDN(str5);
            localDeviceInformation.setMAC(str5);
            localDeviceInformation.setIcon(WemoUtils.getZigbeeIcon(localXMLParser.getValue(localElement1, "manufacturer"), str1));
            localDeviceInformation.setState(k);
            localDeviceInformation.setBridgeUDN(paramString2);
            if (!str4.isEmpty()) {
              localDeviceInformation.setGroupIcon(WemoUtils.getZigbeeIcon(localXMLParser.getValue(localElement1, "manufacturer"), str1));
            }
            if (!TextUtils.isEmpty(str3)) {
              localDeviceInformation.setStatusTS(Integer.parseInt(str3));
            }
            localDeviceInformation.setCapabilities(str2);
            localDeviceInformation.setRemote(true);
            localDeviceInformation.setGroupID(str4);
            localDeviceInformation.setGroupName((String)localObject);
            localDeviceInformation.setPluginId(localXMLParser.getValue(localElement1, "pluginId"));
            localDeviceInformation.setFriendlyName(localXMLParser.getValue(localElement1, "friendlyName"));
            localDeviceInformation.setFwStatus(localXMLParser.getValue(localElement1, "fwUpgradeStatus"));
            localDeviceInformation.setFirmwareVersion(localXMLParser.getValue(localElement1, "firmwareVersion"));
            if ((k != 3) && (k != 4)) {
              break label851;
            }
            SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "not reachable: " + k);
            localDeviceInformation.setInActive(1);
            localDeviceInformation.setIsDiscovered(false);
            SDKLogUtils.debugLog("SDK_CloudRequestUpdateDeviceList", "LED Device Found in Remote: " + localDeviceInformation);
            if (localDeviceInformation == null) {
              break label900;
            }
            this.devicesList.add(localDeviceInformation);
            break label900;
          }
        }
        else
        {
          localDeviceInformation.setProductName(StringUtils.toLowerCamelCase(str6));
          continue;
        }
        localDeviceInformation.setProductType(StringUtils.toLowerCamelCase(str7));
      }
      catch (Exception localException1)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "Exception in searchForZigBee: ", localException1);
        return;
      }
      continue;
      label851:
      localDeviceInformation.setInActive(0);
      localDeviceInformation.setIsDiscovered(true);
      SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "reachable: " + k);
      continue;
      label892:
      this.mDevMgr.getLEDDeviceIconInfo();
      return;
      label900:
      i++;
    }
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return null;
  }
  
  public ArrayList<DeviceInformation> getDevicesList()
  {
    return this.devicesList;
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
    Locks.getInstance().unsetLock(Locks.LOCK_GET_DEVICE_LIST);
    SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "Response success: " + paramBoolean + " isLocal: " + NetworkMode.isLocal());
    String str1;
    boolean bool;
    if (paramBoolean) {
      try
      {
        str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", str1);
        bool = parseResponse(str1);
        SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "Response parse: " + String.valueOf(bool));
        SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "printing parsed devicelist in cloudUpdateAPI");
        Iterator localIterator1 = this.devicesList.iterator();
        while (localIterator1.hasNext())
        {
          DeviceInformation localDeviceInformation5 = (DeviceInformation)localIterator1.next();
          SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "dev udn:" + localDeviceInformation5.getUDN() + " isDiscovered:" + localDeviceInformation5.getIsDiscovered());
          continue;
          Locks.getInstance().unsetLock(Locks.LOCK_GET_DEVICE_LIST);
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "Request error: ", localUnsupportedEncodingException);
      }
    }
    for (;;)
    {
      return;
      if (bool)
      {
        JSONArray localJSONArray1 = parseResponseFromCloudByTagName(str1, "groupSSIDs", "ssid");
        JSONArray localJSONArray2 = parseResponseFromCloudByTagName(str1, "groupArpMacs", "arpMac");
        SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "setDeviceListFromCloud: ssidArray: " + localJSONArray1 + " arpArray: " + localJSONArray2);
        if ((localJSONArray1 != null) && (localJSONArray2 != null)) {
          this.mDevMgr.setArpMacSSIDsFromCloud(localJSONArray1, localJSONArray2);
        }
        List localList = this.mDevMgr.getDeviceUDNListFromDB();
        Iterator localIterator2 = this.devicesList.iterator();
        for (;;)
        {
          if (localIterator2.hasNext())
          {
            DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator2.next();
            String str3 = localDeviceInformation1.getUDN();
            localList.remove(str3);
            SDKLogUtils.infoLog("RemoteMode:", " adding dev " + localDeviceInformation1.getUDN() + "  " + localDeviceInformation1.getIsDiscovered());
            JSONObject localJSONObject1;
            if (IsDevice.Crockpot(localDeviceInformation1.getUDN()))
            {
              DeviceInformation localDeviceInformation4 = this.devicesArray.getDeviceInformation(localDeviceInformation1.getUDN());
              if (localDeviceInformation4 != null) {
                localJSONObject1 = localDeviceInformation4.getAttributeList();
              }
            }
            try
            {
              JSONObject localJSONObject2 = localJSONObject1.getJSONObject("mode");
              localJSONObject2.put("value", localDeviceInformation1.getState());
              localJSONObject1.put("mode", localJSONObject2);
              localDeviceInformation1.setAttributeList(localJSONObject1);
              SDKLogUtils.debugLog("SDK_CloudRequestUpdateDeviceList", "Device found via remote: " + localDeviceInformation1 + " iconUpdateflag: " + localDeviceInformation1.getNeedIconUpdate());
              if (localDeviceInformation1.getState() != 3)
              {
                this.devicesArray.updateDeviceCache(localDeviceInformation1, localDeviceInformation1.getNeedIconUpdate());
                this.devicesArray.setDeviceDiscovered(localDeviceInformation1.getUDN(), true);
              }
              DeviceInformation localDeviceInformation2 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, true, true);
              if (localDeviceInformation2 != null)
              {
                localDeviceInformation1.setID(localDeviceInformation2.getID());
                this.cacheManager.updateDB(localDeviceInformation1, false, true, true);
                DeviceInformation localDeviceInformation3 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, false, true);
                if (localDeviceInformation3 == null) {
                  break label818;
                }
                localDeviceInformation1.setID(localDeviceInformation3.getID());
                this.cacheManager.updateDB(localDeviceInformation1, false, false, true);
                SDKLogUtils.infoLog("RemoteMode:", " sending update notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
                this.mDevMgr.sendNotification("update", "", localDeviceInformation1.getUDN());
                if (!IsDevice.Insight(str3)) {
                  continue;
                }
                CloudRequestGetInsightParams localCloudRequestGetInsightParams = new CloudRequestGetInsightParams(this.mContext, localDeviceInformation1);
                new CloudRequestManager(this.mContext).makeRequest(localCloudRequestGetInsightParams);
              }
            }
            catch (JSONException localJSONException)
            {
              for (;;)
              {
                localJSONException.printStackTrace();
                continue;
                if (localDeviceInformation1.getState() != 3) {
                  this.cacheManager.addDeviceToDB(localDeviceInformation1, false, true, true);
                }
                if (this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), true, false, false) == null)
                {
                  this.mDevMgr.addDeviceWithOnlyUDNToLocalOrRemoteTable(localDeviceInformation1.getUDN(), true, false);
                  continue;
                  label818:
                  if (localDeviceInformation1.getState() != 3)
                  {
                    this.cacheManager.addDeviceToDB(localDeviceInformation1, false, false, true);
                    SDKLogUtils.infoLog("RemoteMode:", " sending add notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
                    this.mDevMgr.sendNotification("add", "", localDeviceInformation1.getUDN());
                  }
                }
              }
            }
          }
        }
        if (!localList.isEmpty())
        {
          Iterator localIterator3 = localList.iterator();
          while (localIterator3.hasNext())
          {
            String str2 = (String)localIterator3.next();
            SDKLogUtils.errorLog("SDK_CloudRequestUpdateDeviceList", "DB Device NOT found in via CLOUD API. Device shall be removed from DB and device list. UDN: " + str2);
            this.mDevMgr.sendNotification("remove", "", str2);
            DevicesArray.getInstance(this.mContext).deleteDeviceInformation(str2);
            CacheManager.getInstance(this.mContext).deleteDeviceFromDB(str2, true, true, true);
          }
        }
        new MoreUtil().copyDbToDownloadDirectory("cache.db", this.mContext);
      }
      else
      {
        SDKLogUtils.infoLog("SDK_CloudRequestUpdateDeviceList", "DEVICELIST is NULL");
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */