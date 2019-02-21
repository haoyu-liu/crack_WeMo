package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.Locks;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import com.belkin.wemo.cache.utils.WemoAppRecovery;
import com.belkin.wemo.cache.utils.WemoUtils;
import java.io.PrintStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
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

public class CloudRequestGetDeviceList
  implements CloudRequestInterface
{
  private static final String KEY_ARPMAC = "arpMac";
  private static final String KEY_ATTRIBUTE_LISTS = "attributeLists";
  private static final String KEY_CAPABILITIES = "capabilities";
  private static final String KEY_CAPABILITY_ID = "capabilityId";
  private static final String KEY_CAPABILITY_PROFILE = "capabilityProfile";
  private static final String KEY_CAPABILITY_ROOT = "deviceCapabilityProfiles";
  private static final String KEY_CAPABILITY_VALUE = "currentValue";
  private static final String KEY_DEVICE_TAG = "device";
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_FW_STATUS = "fwUpgradeStatus";
  private static final String KEY_FW_VERSION = "firmwareVersion";
  private static final String KEY_GROUP_ARPMAC = "groupArpMacs";
  private static final String KEY_GROUP_SSID = "groupSSIDs";
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
  private static final String KEY_SSID = "ssid";
  private static final String KEY_STATUS = "status";
  private static final String KEY_STATUSTS = "statusTS";
  private static final String KEY_UDN = "uniqueId";
  private final String TAG = "SDK_CloudRequestGetDeviceList";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/homeDevices/";
  private CacheManager cacheManager;
  private String cloudURL;
  private DevicesArray devicesArray;
  private ArrayList<DeviceInformation> devicesList = null;
  private Hashtable<String, JSONObject> mBridgeList;
  private Context mContext;
  private DeviceListManager mDevMgr;
  private WemoAppRecovery mWemoAppRecovery;
  
  public CloudRequestGetDeviceList(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    this.mContext = paramContext;
    this.mDevMgr = paramDeviceListManager;
    this.cacheManager = CacheManager.getInstance(paramContext);
    this.devicesArray = DevicesArray.getInstance(paramContext);
    CloudAuth localCloudAuth = new CloudAuth(this.mContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID());
    this.mBridgeList = new Hashtable();
    this.mWemoAppRecovery = WemoAppRecovery.getInstance(paramContext);
  }
  
  private String extractCapabilities(XMLParser paramXMLParser, Element paramElement)
  {
    localJSONObject = new JSONObject();
    try
    {
      Node localNode1 = paramElement.getElementsByTagName("capabilities").item(0);
      if (localNode1 != null) {
        for (int j = 0; j < localNode1.getChildNodes().getLength(); j++)
        {
          Element localElement2 = (Element)localNode1.getChildNodes().item(j);
          String str3 = paramXMLParser.getValue(localElement2, "capabilityId");
          String str4 = paramXMLParser.getValue(localElement2, "currentValue");
          if (DeviceListManager.capabalityProfileList == null) {
            DeviceListManager.updateCapabilityProfileTable();
          }
          localJSONObject.put((String)DeviceListManager.capabalityProfileList.get(str3), str4);
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
          localJSONObject.put((String)DeviceListManager.capabalityProfileList.get(str1), str2);
        }
      }
      return localJSONObject.toString();
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", "Exception in extractCapabilities: ", localException);
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
      SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", "Exception in extracting last event time stamp", localException);
      SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "extractTimeStamp:: ts--> " + (String)localObject);
    }
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
    SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "Attributelist Get :" + localStringBuffer);
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
  
  private String parseErrorCode(String paramString)
  {
    try
    {
      String str = new XMLParser().getDomElement(paramString).getElementsByTagName("code").item(0).getTextContent();
      SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "parseErrorCode: resultCode: " + str);
      return str;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", "Caught Exception in parseErrorCode: ", localException);
    }
    return null;
  }
  
  /* Error */
  private boolean parseResponse(String paramString)
  {
    // Byte code:
    //   0: ldc -113
    //   2: new 123	java/lang/StringBuilder
    //   5: dup
    //   6: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   9: ldc_w 410
    //   12: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   15: aload_1
    //   16: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   19: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   22: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   25: aload_0
    //   26: new 412	java/util/ArrayList
    //   29: dup
    //   30: invokespecial 413	java/util/ArrayList:<init>	()V
    //   33: putfield 152	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:devicesList	Ljava/util/ArrayList;
    //   36: new 224	com/belkin/wemo/cache/cloud/XMLParser
    //   39: dup
    //   40: invokespecial 391	com/belkin/wemo/cache/cloud/XMLParser:<init>	()V
    //   43: astore_3
    //   44: aload_3
    //   45: aload_1
    //   46: invokevirtual 395	com/belkin/wemo/cache/cloud/XMLParser:getDomElement	(Ljava/lang/String;)Lorg/w3c/dom/Document;
    //   49: ldc 31
    //   51: invokeinterface 400 2 0
    //   56: astore 4
    //   58: aconst_null
    //   59: astore 5
    //   61: iconst_0
    //   62: istore 6
    //   64: iload 6
    //   66: aload 4
    //   68: invokeinterface 222 1 0
    //   73: if_icmpge +1078 -> 1151
    //   76: aload 4
    //   78: iload 6
    //   80: invokeinterface 212 2 0
    //   85: checkcast 202	org/w3c/dom/Element
    //   88: astore 7
    //   90: aload_3
    //   91: aload 7
    //   93: ldc 64
    //   95: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   98: astore 8
    //   100: ldc -113
    //   102: new 123	java/lang/StringBuilder
    //   105: dup
    //   106: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   109: ldc_w 415
    //   112: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: aload 8
    //   117: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   120: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   123: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   126: aload 8
    //   128: ifnull +1030 -> 1158
    //   131: aload 8
    //   133: invokevirtual 297	java/lang/String:trim	()Ljava/lang/String;
    //   136: invokevirtual 416	java/lang/String:length	()I
    //   139: ifgt +6 -> 145
    //   142: goto +1016 -> 1158
    //   145: aload_3
    //   146: aload 7
    //   148: ldc 88
    //   150: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   153: astore 9
    //   155: ldc -113
    //   157: new 123	java/lang/StringBuilder
    //   160: dup
    //   161: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   164: ldc_w 418
    //   167: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   170: aload 9
    //   172: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   178: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   181: aload 8
    //   183: invokestatic 423	com/belkin/wemo/cache/utils/WemoUtils:isLEDModelCodeSupported	(Ljava/lang/String;)Z
    //   186: ifne +972 -> 1158
    //   189: aload 8
    //   191: ldc_w 425
    //   194: invokevirtual 428	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   197: ifeq +198 -> 395
    //   200: aload_0
    //   201: getfield 186	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   204: invokevirtual 431	java/util/Hashtable:size	()I
    //   207: ifle +135 -> 342
    //   210: new 199	org/json/JSONObject
    //   213: dup
    //   214: invokespecial 200	org/json/JSONObject:<init>	()V
    //   217: astore 23
    //   219: aload_0
    //   220: getfield 186	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   223: invokevirtual 435	java/util/Hashtable:keys	()Ljava/util/Enumeration;
    //   226: astore 24
    //   228: aload 24
    //   230: invokeinterface 441 1 0
    //   235: ifeq +32 -> 267
    //   238: aload 24
    //   240: invokeinterface 445 1 0
    //   245: checkcast 245	java/lang/String
    //   248: astore 32
    //   250: aload_0
    //   251: getfield 186	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   254: aload 32
    //   256: invokevirtual 446	java/util/Hashtable:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   259: checkcast 199	org/json/JSONObject
    //   262: astore 23
    //   264: goto -36 -> 228
    //   267: aload 23
    //   269: ldc 88
    //   271: invokevirtual 449	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   274: ldc_w 451
    //   277: invokevirtual 452	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   280: ifeq +878 -> 1158
    //   283: aload_0
    //   284: getfield 152	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:devicesList	Ljava/util/ArrayList;
    //   287: invokevirtual 456	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   290: astore 25
    //   292: aload 25
    //   294: invokeinterface 461 1 0
    //   299: ifeq +43 -> 342
    //   302: aload 25
    //   304: invokeinterface 464 1 0
    //   309: checkcast 466	com/belkin/wemo/cache/data/DeviceInformation
    //   312: astore 30
    //   314: aload 30
    //   316: invokevirtual 469	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   319: aload 23
    //   321: ldc 94
    //   323: invokevirtual 449	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   326: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   329: ifeq -37 -> 292
    //   332: aload_0
    //   333: getfield 152	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:devicesList	Ljava/util/ArrayList;
    //   336: aload 30
    //   338: invokevirtual 472	java/util/ArrayList:remove	(Ljava/lang/Object;)Z
    //   341: pop
    //   342: new 199	org/json/JSONObject
    //   345: dup
    //   346: invokespecial 200	org/json/JSONObject:<init>	()V
    //   349: astore 26
    //   351: aload 26
    //   353: ldc 94
    //   355: aload_3
    //   356: aload 7
    //   358: ldc 94
    //   360: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   363: invokevirtual 249	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   366: pop
    //   367: aload 26
    //   369: ldc 88
    //   371: aload 9
    //   373: invokevirtual 249	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   376: pop
    //   377: aload_0
    //   378: getfield 186	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:mBridgeList	Ljava/util/Hashtable;
    //   381: aload_3
    //   382: aload 7
    //   384: ldc 70
    //   386: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   389: aload 26
    //   391: invokevirtual 475	java/util/Hashtable:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   394: pop
    //   395: aload_3
    //   396: aload 7
    //   398: ldc 94
    //   400: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   403: astore 10
    //   405: new 477	com/belkin/wemo/cache/utils/SharePreferences
    //   408: dup
    //   409: aload_0
    //   410: getfield 154	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:mContext	Landroid/content/Context;
    //   413: invokespecial 478	com/belkin/wemo/cache/utils/SharePreferences:<init>	(Landroid/content/Context;)V
    //   416: invokevirtual 481	com/belkin/wemo/cache/utils/SharePreferences:getHomeId	()Ljava/lang/String;
    //   419: astore 11
    //   421: getstatic 484	com/belkin/wemo/cache/devicelist/DeviceListManager:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   424: invokevirtual 488	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformationList	()Ljava/util/Map;
    //   427: astore 12
    //   429: aload 12
    //   431: ifnull +17 -> 448
    //   434: aload 12
    //   436: aload 10
    //   438: invokeinterface 491 2 0
    //   443: checkcast 466	com/belkin/wemo/cache/data/DeviceInformation
    //   446: astore 5
    //   448: aload 5
    //   450: ifnonnull +105 -> 555
    //   453: ldc -113
    //   455: ldc_w 493
    //   458: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   461: new 466	com/belkin/wemo/cache/data/DeviceInformation
    //   464: dup
    //   465: aload 10
    //   467: aload 11
    //   469: aload_3
    //   470: aload 7
    //   472: ldc 58
    //   474: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   477: aload_3
    //   478: aload 7
    //   480: ldc 70
    //   482: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   485: invokespecial 496	com/belkin/wemo/cache/data/DeviceInformation:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   488: astore 5
    //   490: aload 5
    //   492: aload_3
    //   493: aload 7
    //   495: ldc 34
    //   497: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   500: invokevirtual 499	com/belkin/wemo/cache/data/DeviceInformation:setFriendlyName	(Ljava/lang/String;)V
    //   503: aload 5
    //   505: aload 8
    //   507: invokevirtual 502	com/belkin/wemo/cache/data/DeviceInformation:setModelCode	(Ljava/lang/String;)V
    //   510: aload 5
    //   512: aload 8
    //   514: invokevirtual 505	com/belkin/wemo/cache/data/DeviceInformation:setType	(Ljava/lang/String;)V
    //   517: aload 5
    //   519: getstatic 509	com/belkin/wemo/cache/data/DevicesArray:productTypeMapping	Ljava/util/HashMap;
    //   522: aload 8
    //   524: invokevirtual 512	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   527: checkcast 245	java/lang/String
    //   530: invokestatic 517	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   533: invokevirtual 520	com/belkin/wemo/cache/data/DeviceInformation:setProductType	(Ljava/lang/String;)V
    //   536: aload 5
    //   538: getstatic 523	com/belkin/wemo/cache/data/DevicesArray:productNameMapping	Ljava/util/HashMap;
    //   541: aload 8
    //   543: invokevirtual 512	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   546: checkcast 245	java/lang/String
    //   549: invokestatic 517	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   552: invokevirtual 526	com/belkin/wemo/cache/data/DeviceInformation:setProductName	(Ljava/lang/String;)V
    //   555: aload 5
    //   557: ifnull +601 -> 1158
    //   560: aload 5
    //   562: invokevirtual 469	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   565: invokevirtual 416	java/lang/String:length	()I
    //   568: ifle +590 -> 1158
    //   571: aload 5
    //   573: iconst_1
    //   574: invokevirtual 530	com/belkin/wemo/cache/data/DeviceInformation:setRemote	(Z)V
    //   577: aload 5
    //   579: aload_3
    //   580: aload 7
    //   582: ldc 37
    //   584: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   587: invokevirtual 533	com/belkin/wemo/cache/data/DeviceInformation:setFwStatus	(Ljava/lang/String;)V
    //   590: aload 5
    //   592: aload_3
    //   593: aload 7
    //   595: ldc 40
    //   597: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   600: invokevirtual 536	com/belkin/wemo/cache/data/DeviceInformation:setFirmwareVersion	(Ljava/lang/String;)V
    //   603: aload_3
    //   604: aload 7
    //   606: ldc_w 538
    //   609: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   612: astore 13
    //   614: aload 5
    //   616: invokevirtual 541	com/belkin/wemo/cache/data/DeviceInformation:getIconVersion	()Ljava/lang/String;
    //   619: aload 13
    //   621: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   624: ifeq +372 -> 996
    //   627: iconst_0
    //   628: istore 14
    //   630: aload 13
    //   632: ldc_w 543
    //   635: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   638: ifeq +14 -> 652
    //   641: aload 5
    //   643: ldc_w 261
    //   646: invokevirtual 546	com/belkin/wemo/cache/data/DeviceInformation:setIcon	(Ljava/lang/String;)V
    //   649: iconst_0
    //   650: istore 14
    //   652: aload 5
    //   654: iload 14
    //   656: invokevirtual 549	com/belkin/wemo/cache/data/DeviceInformation:setNeedIconUpdate	(Z)V
    //   659: aload 5
    //   661: aload 13
    //   663: invokevirtual 552	com/belkin/wemo/cache/data/DeviceInformation:setIconVersion	(Ljava/lang/String;)V
    //   666: aload_3
    //   667: aload 7
    //   669: ldc 82
    //   671: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   674: astore 15
    //   676: aload 15
    //   678: ldc_w 261
    //   681: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   684: ifne +16 -> 700
    //   687: aload 5
    //   689: aload 15
    //   691: invokestatic 558	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   694: invokevirtual 561	java/lang/Integer:intValue	()I
    //   697: invokevirtual 564	com/belkin/wemo/cache/data/DeviceInformation:setRulesDBVersion	(I)V
    //   700: aload 9
    //   702: invokestatic 570	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   705: istore 16
    //   707: iload 16
    //   709: ifne +330 -> 1039
    //   712: aload 5
    //   714: aload 9
    //   716: invokestatic 558	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   719: invokevirtual 561	java/lang/Integer:intValue	()I
    //   722: invokevirtual 573	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   725: aload_3
    //   726: aload 7
    //   728: ldc 91
    //   730: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   733: invokestatic 570	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   736: istore 17
    //   738: iload 17
    //   740: ifne +344 -> 1084
    //   743: aload 5
    //   745: aload_3
    //   746: aload 7
    //   748: ldc 91
    //   750: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   753: invokestatic 577	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   756: invokevirtual 580	com/belkin/wemo/cache/data/DeviceInformation:setStatusTS	(I)V
    //   759: aload 5
    //   761: invokevirtual 583	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   764: iconst_3
    //   765: if_icmpne +330 -> 1095
    //   768: aload 5
    //   770: iconst_1
    //   771: invokevirtual 586	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   774: aload 5
    //   776: iconst_0
    //   777: invokevirtual 589	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   780: aload 5
    //   782: invokevirtual 583	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   785: ifne +325 -> 1110
    //   788: aload 5
    //   790: ldc_w 543
    //   793: invokevirtual 592	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   796: aload 5
    //   798: iconst_0
    //   799: invokevirtual 595	com/belkin/wemo/cache/data/DeviceInformation:setHide	(I)V
    //   802: aload 5
    //   804: aload_3
    //   805: aload 7
    //   807: ldc 70
    //   809: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   812: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:setPluginId	(Ljava/lang/String;)V
    //   815: aload 5
    //   817: aload_3
    //   818: aload 7
    //   820: ldc 34
    //   822: invokevirtual 228	com/belkin/wemo/cache/cloud/XMLParser:getValue	(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    //   825: invokevirtual 499	com/belkin/wemo/cache/data/DeviceInformation:setFriendlyName	(Ljava/lang/String;)V
    //   828: aload 5
    //   830: invokevirtual 469	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   833: invokestatic 603	com/belkin/wemo/cache/utils/IsDevice:Crockpot	(Ljava/lang/String;)Z
    //   836: ifne +109 -> 945
    //   839: aload 7
    //   841: ldc 13
    //   843: invokeinterface 206 2 0
    //   848: ifnull +97 -> 945
    //   851: aload 7
    //   853: ldc 13
    //   855: invokeinterface 206 2 0
    //   860: invokeinterface 222 1 0
    //   865: ifle +80 -> 945
    //   868: aload 7
    //   870: ldc 13
    //   872: invokeinterface 206 2 0
    //   877: iconst_0
    //   878: invokeinterface 212 2 0
    //   883: astore 19
    //   885: aload 19
    //   887: ifnull +58 -> 945
    //   890: new 605	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser
    //   893: dup
    //   894: invokespecial 606	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:<init>	()V
    //   897: aload 19
    //   899: invokestatic 608	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:nodeToString	(Lorg/w3c/dom/Node;)Ljava/lang/String;
    //   902: invokevirtual 612	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:parseGetAttributeResponse	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   905: astore 20
    //   907: ldc -113
    //   909: new 123	java/lang/StringBuilder
    //   912: dup
    //   913: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   916: ldc_w 614
    //   919: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   922: aload 20
    //   924: invokevirtual 332	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   927: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   930: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   933: aload 20
    //   935: ifnull +10 -> 945
    //   938: aload 5
    //   940: aload 20
    //   942: invokevirtual 618	com/belkin/wemo/cache/data/DeviceInformation:setAttributeList	(Lorg/json/JSONObject;)V
    //   945: aload 5
    //   947: ifnull +211 -> 1158
    //   950: ldc -113
    //   952: new 123	java/lang/StringBuilder
    //   955: dup
    //   956: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   959: ldc_w 620
    //   962: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   965: aload 5
    //   967: invokevirtual 332	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   970: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   973: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   976: aload_0
    //   977: getfield 152	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:devicesList	Ljava/util/ArrayList;
    //   980: aload 5
    //   982: invokevirtual 623	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   985: pop
    //   986: goto +172 -> 1158
    //   989: astore_2
    //   990: aload_2
    //   991: invokevirtual 626	java/lang/Exception:printStackTrace	()V
    //   994: iconst_0
    //   995: ireturn
    //   996: iconst_1
    //   997: istore 14
    //   999: goto -369 -> 630
    //   1002: astore 22
    //   1004: ldc -113
    //   1006: new 123	java/lang/StringBuilder
    //   1009: dup
    //   1010: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   1013: ldc_w 628
    //   1016: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1019: aload 9
    //   1021: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1024: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1027: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1030: aload 5
    //   1032: iconst_3
    //   1033: invokevirtual 573	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   1036: goto -311 -> 725
    //   1039: ldc -113
    //   1041: new 123	java/lang/StringBuilder
    //   1044: dup
    //   1045: invokespecial 124	java/lang/StringBuilder:<init>	()V
    //   1048: ldc_w 630
    //   1051: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1054: aload 9
    //   1056: invokevirtual 133	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1059: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1062: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1065: aload 5
    //   1067: iconst_3
    //   1068: invokevirtual 573	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   1071: goto -346 -> 725
    //   1074: astore 21
    //   1076: aload 21
    //   1078: invokevirtual 631	java/lang/NumberFormatException:printStackTrace	()V
    //   1081: goto -322 -> 759
    //   1084: ldc -113
    //   1086: ldc_w 633
    //   1089: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1092: goto -333 -> 759
    //   1095: aload 5
    //   1097: iconst_0
    //   1098: invokevirtual 586	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   1101: aload 5
    //   1103: iconst_1
    //   1104: invokevirtual 589	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   1107: goto -327 -> 780
    //   1110: aload 5
    //   1112: invokevirtual 583	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1115: iconst_1
    //   1116: if_icmpne +14 -> 1130
    //   1119: aload 5
    //   1121: ldc_w 635
    //   1124: invokevirtual 592	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   1127: goto -331 -> 796
    //   1130: aload 5
    //   1132: invokevirtual 583	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1135: bipush 8
    //   1137: if_icmpne -341 -> 796
    //   1140: aload 5
    //   1142: ldc_w 637
    //   1145: invokevirtual 592	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   1148: goto -352 -> 796
    //   1151: aload_0
    //   1152: aload_1
    //   1153: invokespecial 640	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList:searchForZigBee	(Ljava/lang/String;)V
    //   1156: iconst_1
    //   1157: ireturn
    //   1158: iinc 6 1
    //   1161: goto -1097 -> 64
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1164	0	this	CloudRequestGetDeviceList
    //   0	1164	1	paramString	String
    //   989	2	2	localException	Exception
    //   43	775	3	localXMLParser	XMLParser
    //   56	21	4	localNodeList	NodeList
    //   59	1082	5	localDeviceInformation1	DeviceInformation
    //   62	1097	6	i	int
    //   88	781	7	localElement	Element
    //   98	444	8	str1	String
    //   153	902	9	str2	String
    //   403	63	10	str3	String
    //   419	49	11	str4	String
    //   427	8	12	localMap	Map
    //   612	50	13	str5	String
    //   628	370	14	bool1	boolean
    //   674	16	15	str6	String
    //   705	3	16	bool2	boolean
    //   736	3	17	bool3	boolean
    //   883	15	19	localNode	Node
    //   905	36	20	localJSONObject1	JSONObject
    //   1074	3	21	localNumberFormatException1	NumberFormatException
    //   1002	1	22	localNumberFormatException2	NumberFormatException
    //   217	103	23	localJSONObject2	JSONObject
    //   226	13	24	localEnumeration	java.util.Enumeration
    //   290	13	25	localIterator	Iterator
    //   349	41	26	localJSONObject3	JSONObject
    //   312	25	30	localDeviceInformation2	DeviceInformation
    //   248	7	32	str7	String
    // Exception table:
    //   from	to	target	type
    //   0	58	989	java/lang/Exception
    //   64	126	989	java/lang/Exception
    //   131	142	989	java/lang/Exception
    //   145	228	989	java/lang/Exception
    //   228	264	989	java/lang/Exception
    //   267	292	989	java/lang/Exception
    //   292	342	989	java/lang/Exception
    //   342	395	989	java/lang/Exception
    //   395	429	989	java/lang/Exception
    //   434	448	989	java/lang/Exception
    //   453	555	989	java/lang/Exception
    //   560	627	989	java/lang/Exception
    //   630	649	989	java/lang/Exception
    //   652	700	989	java/lang/Exception
    //   700	707	989	java/lang/Exception
    //   712	725	989	java/lang/Exception
    //   725	738	989	java/lang/Exception
    //   743	759	989	java/lang/Exception
    //   759	780	989	java/lang/Exception
    //   780	796	989	java/lang/Exception
    //   796	885	989	java/lang/Exception
    //   890	933	989	java/lang/Exception
    //   938	945	989	java/lang/Exception
    //   950	986	989	java/lang/Exception
    //   1004	1036	989	java/lang/Exception
    //   1039	1071	989	java/lang/Exception
    //   1076	1081	989	java/lang/Exception
    //   1084	1092	989	java/lang/Exception
    //   1095	1107	989	java/lang/Exception
    //   1110	1127	989	java/lang/Exception
    //   1130	1148	989	java/lang/Exception
    //   1151	1156	989	java/lang/Exception
    //   712	725	1002	java/lang/NumberFormatException
    //   743	759	1074	java/lang/NumberFormatException
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
      SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "parseResponseFromCloudByTagName: resultArray: " + localJSONArray);
      return localJSONArray;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", "Caught Exception in parseResponseFromCloudByTagName: ", localException);
    }
    return null;
  }
  
  private void searchForZigBee(String paramString)
  {
    for (;;)
    {
      int i;
      DeviceInformation localDeviceInformation;
      String str8;
      try
      {
        XMLParser localXMLParser = new XMLParser();
        NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("device");
        Map localMap = DeviceListManager.devListManager.getDeviceInformationList();
        i = 0;
        int j = localNodeList.getLength();
        if (i < j)
        {
          Element localElement1 = (Element)localNodeList.item(i);
          String str1 = localXMLParser.getValue(localElement1, "modelCode");
          if (!WemoUtils.isLEDModelCodeSupported(str1)) {
            break label782;
          }
          String str2 = extractCapabilities(localXMLParser, localElement1);
          String str3 = "";
          String str4 = extractTimeStamp(localXMLParser, localElement1);
          String str5 = "";
          int k;
          String str6;
          try
          {
            Node localNode = localElement1.getElementsByTagName("groupProfiles").item(0);
            if (localNode != null)
            {
              SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "Grouped device exist");
              int m = 0;
              int n = localNode.getChildNodes().getLength();
              if (m < n)
              {
                Element localElement2 = (Element)localNode.getChildNodes().item(m);
                str3 = localXMLParser.getValue(localElement2, "referenceId");
                str5 = localXMLParser.getValue(localElement2, "groupName");
                SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "ledGroupId:" + str3 + "ledGroupName:" + str5);
                m++;
                continue;
              }
            }
            localDeviceInformation = new DeviceInformation(((JSONObject)this.mBridgeList.get(localXMLParser.getValue(localElement1, "parentPluginId"))).getString("uniqueId"), localXMLParser.getValue(localElement1, "macAddress"), k, str2, "", localXMLParser.getValue(localElement1, "firmwareVersion"), str1, localXMLParser.getValue(localElement1, "friendlyName"), localXMLParser.getValue(localElement1, "pluginId"));
          }
          catch (Exception localException2)
          {
            SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", "Exception while searching for ZB: ", localException2);
            k = Integer.parseInt(localXMLParser.getValue(localElement1, "status"));
            str6 = localXMLParser.getValue(localElement1, "macAddress");
            SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", str6 + " led state:" + k);
            localDeviceInformation = null;
            if (localMap != null) {
              localDeviceInformation = (DeviceInformation)localMap.get(str6);
            }
            if (localDeviceInformation != null) {
              continue;
            }
          }
          String str7 = localXMLParser.getValue(localElement1, "productName");
          if (str7.isEmpty())
          {
            localDeviceInformation.setProductName(StringUtils.toLowerCamelCase((String)DevicesArray.productNameMapping.get(localDeviceInformation.getModelCode())));
            str8 = localXMLParser.getValue(localElement1, "productType");
            if (str8.isEmpty())
            {
              localDeviceInformation.setProductType(StringUtils.toLowerCamelCase((String)DevicesArray.productTypeMapping.get(localDeviceInformation.getModelCode())));
              localDeviceInformation.setGroupID(str3);
              localDeviceInformation.setUDN(str6);
              localDeviceInformation.setMAC(str6);
              if (str5.length() <= 0) {
                break label788;
              }
              str9 = str5;
              localDeviceInformation.setGroupName(str9);
              localDeviceInformation.setIcon(WemoUtils.getZigbeeIcon(localXMLParser.getValue(localElement1, "manufacturer"), str1));
              if (!str3.isEmpty()) {
                localDeviceInformation.setGroupIcon(WemoUtils.getZigbeeIcon(localXMLParser.getValue(localElement1, "manufacturer"), str1));
              }
              if (!TextUtils.isEmpty(str4)) {
                localDeviceInformation.setStatusTS(Integer.parseInt(str4));
              }
              localDeviceInformation.setCapabilities(str2);
              localDeviceInformation.setRemote(true);
              localDeviceInformation.setGroupID(str3);
              localDeviceInformation.setGroupName(str5);
              localDeviceInformation.setPluginId(localXMLParser.getValue(localElement1, "pluginId"));
              localDeviceInformation.setFriendlyName(localXMLParser.getValue(localElement1, "friendlyName"));
              localDeviceInformation.setFwStatus(localXMLParser.getValue(localElement1, "fwUpgradeStatus"));
              localDeviceInformation.setFirmwareVersion(localXMLParser.getValue(localElement1, "firmwareVersion"));
              if ((k != 3) && (k != 4)) {
                break label767;
              }
              localDeviceInformation.setInActive(1);
              localDeviceInformation.setIsDiscovered(false);
              SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "device added:" + localDeviceInformation);
              this.devicesList.add(localDeviceInformation);
              break label782;
            }
          }
          else
          {
            localDeviceInformation.setProductName(StringUtils.toLowerCamelCase(str7));
            continue;
          }
        }
        else
        {
          return;
        }
      }
      catch (Exception localException1)
      {
        localException1.printStackTrace();
      }
      localDeviceInformation.setProductType(StringUtils.toLowerCamelCase(str8));
      continue;
      label767:
      localDeviceInformation.setInActive(0);
      localDeviceInformation.setIsDiscovered(true);
      continue;
      label782:
      i++;
      continue;
      label788:
      String str9 = "";
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
    Locks.getInstance().unsetLock(Locks.LOCK_GET_DEVICE_LIST);
    SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "in requestComplete :: Response success is :: " + paramBoolean + " :: statusCode is :: " + paramInt);
    Object localObject = null;
    if (paramArrayOfByte != null) {}
    try
    {
      String str2 = new String(paramArrayOfByte, "UTF-8");
      localObject = str2;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        Iterator localIterator1;
        SDKLogUtils.errorLog("SDK_CloudRequestGetDeviceList", " ::Exception during encoding of cloud getDeviceList response :: ", localUnsupportedEncodingException);
        localObject = null;
      }
      localJSONArray1 = parseResponseFromCloudByTagName((String)localObject, "groupSSIDs", "ssid");
      localJSONArray2 = parseResponseFromCloudByTagName((String)localObject, "groupArpMacs", "arpMac");
      SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "setDeviceListFromCloud: ssidArray: " + localJSONArray1 + " arpArray: " + localJSONArray2);
      if ((localJSONArray1 == null) || (localJSONArray2 == null)) {
        break label328;
      }
      this.mDevMgr.setArpMacSSIDsFromCloud(localJSONArray1, localJSONArray2);
      localIterator2 = this.devicesList.iterator();
      while (localIterator2.hasNext())
      {
        localDeviceInformation1 = (DeviceInformation)localIterator2.next();
        SDKLogUtils.infoLog("RemoteMode:", " adding dev " + localDeviceInformation1.getUDN() + "  " + localDeviceInformation1.getIsDiscovered());
        if (IsDevice.Crockpot(localDeviceInformation1.getUDN()))
        {
          localDeviceInformation4 = this.devicesArray.getDeviceInformation(localDeviceInformation1.getUDN());
          if (localDeviceInformation4 != null)
          {
            localJSONObject1 = localDeviceInformation4.getAttributeList();
            Log.i("SDK_CloudRequestGetDeviceList", "attributeList" + localJSONObject1);
          }
        }
        try
        {
          localJSONObject2 = localJSONObject1.getJSONObject("mode");
          localJSONObject2.put("value", localDeviceInformation1.getState());
          localJSONObject1.put("mode", localJSONObject2);
          localDeviceInformation1.setAttributeList(localJSONObject1);
          this.devicesArray.updateDeviceCache(localDeviceInformation1, localDeviceInformation1.getNeedIconUpdate());
          this.devicesArray.setDeviceDiscovered(localDeviceInformation1.getUDN(), true);
          localDeviceInformation2 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, true, false);
          if (localDeviceInformation2 != null)
          {
            localDeviceInformation1.setID(localDeviceInformation2.getID());
            this.cacheManager.updateDB(localDeviceInformation1, false, true, true);
            localDeviceInformation3 = this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, false, true);
            if (localDeviceInformation3 == null) {
              break label747;
            }
            localDeviceInformation1.setID(localDeviceInformation3.getID());
            this.cacheManager.updateDB(localDeviceInformation1, false, false, true);
            SDKLogUtils.infoLog("RemoteMode:", " sending update notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
            this.mDevMgr.sendNotification("update", "", localDeviceInformation1.getUDN());
          }
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
            continue;
            this.cacheManager.addDeviceToDB(localDeviceInformation1, false, true, false);
            if (this.mDevMgr.getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), true, false, false) == null) {
              this.mDevMgr.addDeviceWithOnlyUDNToLocalOrRemoteTable(localDeviceInformation1.getUDN(), true, false);
            }
          }
          this.cacheManager.addDeviceToDB(localDeviceInformation1, false, false, true);
          SDKLogUtils.infoLog("RemoteMode:", " sending add notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
          this.mDevMgr.sendNotification("add", "", localDeviceInformation1.getUDN());
        }
      }
      new MoreUtil().copyDbToDownloadDirectory("cache.db", this.mContext);
      this.mWemoAppRecovery.consistentFlag = true;
      this.mWemoAppRecovery.counter = 0;
      this.mWemoAppRecovery.setAppRecoveryData(this.mWemoAppRecovery);
      this.mDevMgr.makeCloudRequestForUpdateDeviceList();
    }
    SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", ":: cloud response of getDeviceList is :: " + String.valueOf(localObject));
    if (paramBoolean)
    {
      DeviceListManager.firstRemoteCall = false;
      if (parseResponse((String)localObject))
      {
        SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "Response in success case : deviceList size ::  " + this.devicesList.size());
        SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "printing parsed devicelist in cloudGetAPI  ");
        localIterator1 = this.devicesList.iterator();
        while (localIterator1.hasNext())
        {
          DeviceInformation localDeviceInformation5 = (DeviceInformation)localIterator1.next();
          SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "dev udn:" + localDeviceInformation5.getUDN() + " isDiscovered:" + localDeviceInformation5.getIsDiscovered());
        }
      }
    }
    for (;;)
    {
      JSONArray localJSONArray1;
      JSONArray localJSONArray2;
      label328:
      Iterator localIterator2;
      DeviceInformation localDeviceInformation1;
      DeviceInformation localDeviceInformation4;
      JSONObject localJSONObject1;
      JSONObject localJSONObject2;
      DeviceInformation localDeviceInformation2;
      DeviceInformation localDeviceInformation3;
      label747:
      Locks.getInstance().unsetLock(Locks.LOCK_GET_DEVICE_LIST);
      return;
      if ((paramInt == 403) || (paramInt == 400))
      {
        String str1 = parseErrorCode((String)localObject);
        if ((!TextUtils.isEmpty(str1)) && (((str1.equals("ERR_002")) && (paramInt == 403)) || (((str1.equals("WEMO_415")) || (str1.equals("WEMO_414"))) && (paramInt == 400))))
        {
          this.mWemoAppRecovery.consistentFlag = false;
          WemoAppRecovery localWemoAppRecovery = this.mWemoAppRecovery;
          localWemoAppRecovery.counter = (1 + localWemoAppRecovery.counter);
          this.mWemoAppRecovery.setAppRecoveryData(this.mWemoAppRecovery);
        }
      }
      SDKLogUtils.infoLog("SDK_CloudRequestGetDeviceList", "DEVICELIST is NULL");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetDeviceList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */