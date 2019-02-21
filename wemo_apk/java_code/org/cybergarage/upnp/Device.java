package org.cybergarage.upnp;

import android.util.Log;
import android.util.Xml;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.localsdk.parser.CustomizedDeviceInfoParser;
import com.belkin.wemo.localsdk.parser.GetAttributeListResponseParser;
import com.belkin.wemo.localsdk.parser.GetAttributeResponseParser;
import com.belkin.wemo.localsdk.parser.GetBlobStorageParser;
import java.io.File;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TimeZone;
import org.cybergarage.http.HTTP;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.http.HTTPRequestListener;
import org.cybergarage.http.HTTPResponse;
import org.cybergarage.http.HTTPServerList;
import org.cybergarage.net.HostInterface;
import org.cybergarage.soap.SOAPResponse;
import org.cybergarage.upnp.control.ActionListener;
import org.cybergarage.upnp.control.ActionRequest;
import org.cybergarage.upnp.control.ActionResponse;
import org.cybergarage.upnp.control.ControlRequest;
import org.cybergarage.upnp.control.ControlResponse;
import org.cybergarage.upnp.control.QueryListener;
import org.cybergarage.upnp.control.QueryRequest;
import org.cybergarage.upnp.device.Advertiser;
import org.cybergarage.upnp.device.InvalidDescriptionException;
import org.cybergarage.upnp.device.ST;
import org.cybergarage.upnp.device.SearchListener;
import org.cybergarage.upnp.event.Subscriber;
import org.cybergarage.upnp.event.Subscription;
import org.cybergarage.upnp.event.SubscriptionRequest;
import org.cybergarage.upnp.event.SubscriptionResponse;
import org.cybergarage.upnp.ssdp.SSDPNotifyRequest;
import org.cybergarage.upnp.ssdp.SSDPNotifySocket;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.upnp.ssdp.SSDPSearchResponse;
import org.cybergarage.upnp.ssdp.SSDPSearchResponseSocket;
import org.cybergarage.upnp.ssdp.SSDPSearchSocketList;
import org.cybergarage.upnp.xml.DeviceData;
import org.cybergarage.util.Debug;
import org.cybergarage.util.FileUtil;
import org.cybergarage.util.Mutex;
import org.cybergarage.util.TimerUtil;
import org.cybergarage.xml.Node;
import org.cybergarage.xml.Parser;
import org.cybergarage.xml.ParserException;
import org.json.JSONException;
import org.json.JSONObject;

public class Device
  implements HTTPRequestListener, SearchListener
{
  private static final String BRAND_NAME = "brandName";
  private static final String CONFIGURE_STATE = "CONFIGURE_STATE";
  public static final String DEFAULT_DESCRIPTION_URI = "/description.xml";
  public static final int DEFAULT_DISCOVERY_WAIT_TIME = 300;
  public static final int DEFAULT_LEASE_TIME = 1800;
  public static final int DEFAULT_STARTUP_WAIT_TIME = 1000;
  private static final String DEVICE_TYPE = "deviceType";
  public static final String ELEM_NAME = "device";
  private static final String FIRMWARE_VERSION = "firmwareVersion";
  private static final String FRIENDLY_NAME = "friendlyName";
  public static final int HTTP_DEFAULT_PORT = 4004;
  private static final String MAC_ADDRESS = "macAddress";
  private static final String MANUFACTURE = "manufacturer";
  private static final String MANUFACTURE_URL = "manufacturerURL";
  private static final String MODEL_DESCRIPTION = "modelDescription";
  private static final String MODEL_NAME = "modelName";
  private static final String MODEL_NUMBER = "modelNumber";
  private static final String MODEL_URL = "modelURL";
  private static final String PRODUCT_NAME = "productName";
  private static final String PRODUCT_TYPE = "productType";
  private static final String SERIAL_NUMBER = "serialNumber";
  private static final String UDN = "UDN";
  private static final String UPC = "UPC";
  public static final String UPNP_ROOTDEVICE = "upnp:rootdevice";
  public static final String URLBASE_NAME = "URLBase";
  private static Calendar cal = Calendar.getInstance();
  private static final String presentationURL = "presentationURL";
  JSONObject attributeListJSON = null;
  private boolean available = false;
  private String devUUID;
  private Node deviceNode;
  private boolean locationChange = false;
  private Mutex mutex = new Mutex();
  private Node rootNode;
  private Object userData = null;
  private boolean wirelessMode;
  
  static {}
  
  public Device()
  {
    this(null, null);
  }
  
  public Device(File paramFile)
    throws InvalidDescriptionException
  {
    this(null, null);
    loadDescription(paramFile);
  }
  
  public Device(InputStream paramInputStream)
    throws InvalidDescriptionException
  {
    this(null, null);
    loadDescription(paramInputStream);
  }
  
  public Device(String paramString)
    throws InvalidDescriptionException
  {
    this(new File(paramString));
  }
  
  public Device(Node paramNode)
  {
    this(null, paramNode);
  }
  
  public Device(Node paramNode1, Node paramNode2)
  {
    this.rootNode = paramNode1;
    this.deviceNode = paramNode2;
    setUUID(UPnP.createUUID());
    setWirelessMode(false);
  }
  
  private void deviceActionControlRecieved(ActionRequest paramActionRequest, Service paramService)
  {
    if (Debug.isOn() == true) {
      paramActionRequest.print();
    }
    Action localAction = paramService.getAction(paramActionRequest.getActionName());
    if (localAction == null) {
      invalidActionControlRecieved(paramActionRequest);
    }
    for (;;)
    {
      return;
      ArgumentList localArgumentList1 = localAction.getArgumentList();
      ArgumentList localArgumentList2 = paramActionRequest.getArgumentList();
      try
      {
        localArgumentList1.setReqArgs(localArgumentList2);
        if (!localAction.performActionListener(paramActionRequest))
        {
          invalidActionControlRecieved(paramActionRequest);
          return;
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        invalidArgumentsControlRecieved(paramActionRequest);
      }
    }
  }
  
  private void deviceControlRequestRecieved(ControlRequest paramControlRequest, Service paramService)
  {
    if (paramControlRequest.isQueryControl() == true)
    {
      deviceQueryControlRecieved(new QueryRequest(paramControlRequest), paramService);
      return;
    }
    deviceActionControlRecieved(new ActionRequest(paramControlRequest), paramService);
  }
  
  private void deviceEventNewSubscriptionRecieved(Service paramService, SubscriptionRequest paramSubscriptionRequest)
  {
    String str1 = paramSubscriptionRequest.getCallback();
    try
    {
      new URL(str1);
      long l = paramSubscriptionRequest.getTimeout();
      String str2 = Subscription.createSID();
      Subscriber localSubscriber = new Subscriber();
      localSubscriber.setDeliveryURL(str1);
      localSubscriber.setTimeOut(l);
      localSubscriber.setSID(str2);
      paramService.addSubscriber(localSubscriber);
      SubscriptionResponse localSubscriptionResponse = new SubscriptionResponse();
      localSubscriptionResponse.setStatusCode(200);
      localSubscriptionResponse.setSID(str2);
      localSubscriptionResponse.setTimeout(l);
      if (Debug.isOn() == true) {
        localSubscriptionResponse.print();
      }
      paramSubscriptionRequest.post(localSubscriptionResponse);
      if (Debug.isOn() == true) {
        localSubscriptionResponse.print();
      }
      paramService.notifyAllStateVariables();
      return;
    }
    catch (Exception localException)
    {
      upnpBadSubscriptionRecieved(paramSubscriptionRequest, 412);
    }
  }
  
  private void deviceEventRenewSubscriptionRecieved(Service paramService, SubscriptionRequest paramSubscriptionRequest)
  {
    String str = paramSubscriptionRequest.getSID();
    Subscriber localSubscriber = paramService.getSubscriber(str);
    if (localSubscriber == null) {
      upnpBadSubscriptionRecieved(paramSubscriptionRequest, 412);
    }
    SubscriptionResponse localSubscriptionResponse;
    do
    {
      return;
      long l = paramSubscriptionRequest.getTimeout();
      localSubscriber.setTimeOut(l);
      localSubscriber.renew();
      localSubscriptionResponse = new SubscriptionResponse();
      localSubscriptionResponse.setStatusCode(200);
      localSubscriptionResponse.setSID(str);
      localSubscriptionResponse.setTimeout(l);
      paramSubscriptionRequest.post(localSubscriptionResponse);
    } while (Debug.isOn() != true);
    localSubscriptionResponse.print();
  }
  
  private void deviceEventSubscriptionRecieved(SubscriptionRequest paramSubscriptionRequest)
  {
    Service localService = getServiceByEventSubURL(paramSubscriptionRequest.getURI());
    if (localService == null)
    {
      paramSubscriptionRequest.returnBadRequest();
      return;
    }
    if ((!paramSubscriptionRequest.hasCallback()) && (!paramSubscriptionRequest.hasSID()))
    {
      upnpBadSubscriptionRecieved(paramSubscriptionRequest, 412);
      return;
    }
    if (paramSubscriptionRequest.isUnsubscribeRequest() == true)
    {
      deviceEventUnsubscriptionRecieved(localService, paramSubscriptionRequest);
      return;
    }
    if (paramSubscriptionRequest.hasCallback() == true)
    {
      deviceEventNewSubscriptionRecieved(localService, paramSubscriptionRequest);
      return;
    }
    if (paramSubscriptionRequest.hasSID() == true)
    {
      deviceEventRenewSubscriptionRecieved(localService, paramSubscriptionRequest);
      return;
    }
    upnpBadSubscriptionRecieved(paramSubscriptionRequest, 412);
  }
  
  private void deviceEventUnsubscriptionRecieved(Service paramService, SubscriptionRequest paramSubscriptionRequest)
  {
    Subscriber localSubscriber = paramService.getSubscriber(paramSubscriptionRequest.getSID());
    if (localSubscriber == null) {
      upnpBadSubscriptionRecieved(paramSubscriptionRequest, 412);
    }
    SubscriptionResponse localSubscriptionResponse;
    do
    {
      return;
      paramService.removeSubscriber(localSubscriber);
      localSubscriptionResponse = new SubscriptionResponse();
      localSubscriptionResponse.setStatusCode(200);
      paramSubscriptionRequest.post(localSubscriptionResponse);
    } while (Debug.isOn() != true);
    localSubscriptionResponse.print();
  }
  
  private void deviceQueryControlRecieved(QueryRequest paramQueryRequest, Service paramService)
  {
    if (Debug.isOn() == true) {
      paramQueryRequest.print();
    }
    String str = paramQueryRequest.getVarName();
    if (!paramService.hasStateVariable(str)) {
      invalidActionControlRecieved(paramQueryRequest);
    }
    while (getStateVariable(str).performQueryListener(paramQueryRequest)) {
      return;
    }
    invalidActionControlRecieved(paramQueryRequest);
  }
  
  private Advertiser getAdvertiser()
  {
    return getDeviceData().getAdvertiser();
  }
  
  /* Error */
  private byte[] getDescriptionData(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 367	org/cybergarage/upnp/Device:isNMPRMode	()Z
    //   6: ifne +8 -> 14
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 370	org/cybergarage/upnp/Device:updateURLBase	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: invokevirtual 374	org/cybergarage/upnp/Device:getRootNode	()Lorg/cybergarage/xml/Node;
    //   18: astore_3
    //   19: aload_3
    //   20: ifnonnull +13 -> 33
    //   23: iconst_0
    //   24: newarray <illegal type>
    //   26: astore 4
    //   28: aload_0
    //   29: monitorexit
    //   30: aload 4
    //   32: areturn
    //   33: new 376	java/lang/String
    //   36: dup
    //   37: invokespecial 377	java/lang/String:<init>	()V
    //   40: astore 5
    //   42: new 379	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 380	java/lang/StringBuilder:<init>	()V
    //   49: aload 5
    //   51: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: ldc_w 386
    //   57: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: invokevirtual 389	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   63: astore 6
    //   65: new 379	java/lang/StringBuilder
    //   68: dup
    //   69: invokespecial 380	java/lang/StringBuilder:<init>	()V
    //   72: aload 6
    //   74: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: ldc_w 391
    //   80: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   83: invokevirtual 389	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   86: astore 7
    //   88: new 379	java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 380	java/lang/StringBuilder:<init>	()V
    //   95: aload 7
    //   97: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: aload_3
    //   101: invokevirtual 394	org/cybergarage/xml/Node:toString	()Ljava/lang/String;
    //   104: invokevirtual 384	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: invokevirtual 389	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   110: invokevirtual 398	java/lang/String:getBytes	()[B
    //   113: astore 8
    //   115: aload 8
    //   117: astore 4
    //   119: goto -91 -> 28
    //   122: astore_2
    //   123: aload_0
    //   124: monitorexit
    //   125: aload_2
    //   126: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	127	0	this	Device
    //   0	127	1	paramString	String
    //   122	4	2	localObject1	Object
    //   18	83	3	localNode	Node
    //   26	92	4	localObject2	Object
    //   40	10	5	str1	String
    //   63	10	6	str2	String
    //   86	10	7	str3	String
    //   113	3	8	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   2	14	122	finally
    //   14	19	122	finally
    //   23	28	122	finally
    //   33	115	122	finally
  }
  
  private String getDescriptionURI()
  {
    return getDeviceData().getDescriptionURI();
  }
  
  private DeviceData getDeviceData()
  {
    Node localNode = getDeviceNode();
    DeviceData localDeviceData = (DeviceData)localNode.getUserData();
    if (localDeviceData == null)
    {
      localDeviceData = new DeviceData();
      localNode.setUserData(localDeviceData);
      localDeviceData.setNode(localNode);
    }
    return localDeviceData;
  }
  
  private HTTPServerList getHTTPServerList()
  {
    return getDeviceData().getHTTPServerList();
  }
  
  private String getNotifyDeviceNT()
  {
    if (!isRootDevice()) {
      return getUDN();
    }
    return "upnp:rootdevice";
  }
  
  private String getNotifyDeviceTypeNT()
  {
    return getDeviceType();
  }
  
  private String getNotifyDeviceTypeUSN()
  {
    return getUDN() + "::" + getDeviceType();
  }
  
  private String getNotifyDeviceUSN()
  {
    if (!isRootDevice()) {
      return getUDN();
    }
    return getUDN() + "::" + "upnp:rootdevice";
  }
  
  private String getParameterFromDevice(String paramString)
  {
    String str = "";
    Action localAction = getAction(paramString);
    ArgumentList localArgumentList = new ArgumentList();
    if (localAction != null)
    {
      if ((paramString.equals("GetInformation")) || (paramString.equals("GetDeviceInformation"))) {
        setArgument(localAction, UpnpConstants.SET_TIME_SYNC_ARGS, timeSync());
      }
      localArgumentList = localAction.getOutputArgumentList();
      if (localAction.postControlAction() == null) {
        return null;
      }
      str = localAction.postControlAction();
    }
    if ((str == "") && (localArgumentList.size() > 0)) {
      str = localArgumentList.getArgument(0).getValue();
    }
    return str;
  }
  
  private SSDPSearchSocketList getSSDPSearchSocketList()
  {
    return getDeviceData().getSSDPSearchSocketList();
  }
  
  private String getUUID()
  {
    return this.devUUID;
  }
  
  private String getUrlBaseStr()
  {
    String str = "";
    if (this != null) {
      str = getURLBase();
    }
    if ((str == null) || (str.length() <= 0))
    {
      Device localDevice1 = getRootDevice();
      if (localDevice1 != null) {
        str = localDevice1.getURLBase();
      }
    }
    if ((str == null) || (str.length() <= 0))
    {
      Device localDevice2 = getRootDevice();
      if (localDevice2 != null) {
        str = localDevice2.getLocation();
      }
    }
    return str;
  }
  
  private void httpGetRequestRecieved(HTTPRequest paramHTTPRequest)
  {
    String str = paramHTTPRequest.getURI();
    Debug.message("httpGetRequestRecieved = " + str);
    if (str == null)
    {
      paramHTTPRequest.returnBadRequest();
      return;
    }
    new byte[0];
    byte[] arrayOfByte;
    if (isDescriptionURI(str) == true)
    {
      paramHTTPRequest.getLocalAddress();
      arrayOfByte = getDescriptionData(HostInterface.getInterface());
    }
    for (;;)
    {
      HTTPResponse localHTTPResponse = new HTTPResponse();
      if (FileUtil.isXMLFileName(str) == true) {
        localHTTPResponse.setContentType("text/xml; charset=\"utf-8\"");
      }
      localHTTPResponse.setStatusCode(200);
      localHTTPResponse.setContent(arrayOfByte);
      paramHTTPRequest.post(localHTTPResponse);
      return;
      Device localDevice = getDeviceByDescriptionURI(str);
      if (localDevice != null)
      {
        arrayOfByte = localDevice.getDescriptionData(paramHTTPRequest.getLocalAddress());
      }
      else
      {
        Service localService = getServiceBySCPDURL(str);
        if (localService == null) {
          break;
        }
        arrayOfByte = localService.getSCPDData();
      }
    }
    paramHTTPRequest.returnBadRequest();
  }
  
  private void httpPostRequestRecieved(HTTPRequest paramHTTPRequest)
  {
    if (paramHTTPRequest.isSOAPAction() == true)
    {
      soapActionRecieved(paramHTTPRequest);
      return;
    }
    paramHTTPRequest.returnBadRequest();
  }
  
  private boolean initializeLoadedDescription()
  {
    setDescriptionURI("/description.xml");
    setLeaseTime(1800);
    setHTTPPort(4004);
    if (!hasUDN()) {
      updateUDN();
    }
    return true;
  }
  
  private void invalidActionControlRecieved(ControlRequest paramControlRequest)
  {
    ActionResponse localActionResponse = new ActionResponse();
    localActionResponse.setFaultResponse(401);
    paramControlRequest.post(localActionResponse);
  }
  
  private void invalidArgumentsControlRecieved(ControlRequest paramControlRequest)
  {
    ActionResponse localActionResponse = new ActionResponse();
    localActionResponse.setFaultResponse(402);
    paramControlRequest.post(localActionResponse);
  }
  
  private boolean isDescriptionURI(String paramString)
  {
    String str = getDescriptionURI();
    if ((paramString == null) || (str == null)) {
      return false;
    }
    return str.equals(paramString);
  }
  
  public static boolean isDeviceNode(Node paramNode)
  {
    return "device".equals(paramNode.getName());
  }
  
  public static final void notifyWait()
  {
    TimerUtil.waitRandom(300);
  }
  
  private void setAdvertiser(Advertiser paramAdvertiser)
  {
    getDeviceData().setAdvertiser(paramAdvertiser);
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
  
  private void setDescriptionFile(File paramFile)
  {
    getDeviceData().setDescriptionFile(paramFile);
  }
  
  private void setDescriptionURI(String paramString)
  {
    getDeviceData().setDescriptionURI(paramString);
  }
  
  private void setURLBase(String paramString)
  {
    if (isRootDevice() == true)
    {
      Node localNode1 = getRootNode().getNode("URLBase");
      if (localNode1 != null) {
        localNode1.setValue(paramString);
      }
    }
    else
    {
      return;
    }
    Node localNode2 = new Node("URLBase");
    localNode2.setValue(paramString);
    int i = 1;
    if (!getRootNode().hasNodes()) {
      i = 1;
    }
    getRootNode().insertNode(localNode2, i);
  }
  
  private void setUUID(String paramString)
  {
    this.devUUID = paramString;
  }
  
  private void soapActionRecieved(HTTPRequest paramHTTPRequest)
  {
    Service localService = getServiceByControlURL(paramHTTPRequest.getURI());
    if (localService != null)
    {
      deviceControlRequestRecieved(new ActionRequest(paramHTTPRequest), localService);
      return;
    }
    soapBadActionRecieved(paramHTTPRequest);
  }
  
  private void soapBadActionRecieved(HTTPRequest paramHTTPRequest)
  {
    SOAPResponse localSOAPResponse = new SOAPResponse();
    localSOAPResponse.setStatusCode(400);
    paramHTTPRequest.post(localSOAPResponse);
  }
  
  private boolean stop(boolean paramBoolean)
  {
    if (paramBoolean == true) {
      byebye();
    }
    HTTPServerList localHTTPServerList = getHTTPServerList();
    localHTTPServerList.stop();
    localHTTPServerList.close();
    localHTTPServerList.clear();
    SSDPSearchSocketList localSSDPSearchSocketList = getSSDPSearchSocketList();
    localSSDPSearchSocketList.stop();
    localSSDPSearchSocketList.close();
    localSSDPSearchSocketList.clear();
    Advertiser localAdvertiser = getAdvertiser();
    if (localAdvertiser != null)
    {
      localAdvertiser.stop();
      setAdvertiser(null);
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
        break label159;
      }
      arrayOfString[3] = "1";
    }
    for (;;)
    {
      arrayOfString[0] = String.valueOf(System.currentTimeMillis() / 1000L);
      return arrayOfString;
      arrayOfString[2] = "0";
      break;
      label159:
      arrayOfString[3] = "0";
    }
  }
  
  private void updateUDN()
  {
    setUDN("uuid:" + getUUID());
  }
  
  private void updateURLBase(String paramString)
  {
    setURLBase(HostInterface.getHostURL(paramString, getHTTPPort(), ""));
  }
  
  private void upnpBadSubscriptionRecieved(SubscriptionRequest paramSubscriptionRequest, int paramInt)
  {
    SubscriptionResponse localSubscriptionResponse = new SubscriptionResponse();
    localSubscriptionResponse.setErrorResponse(paramInt);
    paramSubscriptionRequest.post(localSubscriptionResponse);
  }
  
  public void addDevice(Device paramDevice)
  {
    Node localNode1 = getDeviceNode().getNode("deviceList");
    if (localNode1 == null)
    {
      localNode1 = new Node("deviceList");
      getDeviceNode().addNode(localNode1);
    }
    localNode1.addNode(paramDevice.getDeviceNode());
    paramDevice.setRootNode(null);
    if (getRootNode() == null)
    {
      Node localNode2 = new Node("root");
      localNode2.setNameSpace("", "urn:schemas-upnp-org:device-1-0");
      Node localNode3 = new Node("specVersion");
      Node localNode4 = new Node("major");
      localNode4.setValue("1");
      Node localNode5 = new Node("minor");
      localNode5.setValue("0");
      localNode3.addNode(localNode4);
      localNode3.addNode(localNode5);
      localNode2.addNode(localNode3);
      setRootNode(localNode2);
    }
  }
  
  public void addService(Service paramService)
  {
    Node localNode = getDeviceNode().getNode("serviceList");
    if (localNode == null)
    {
      localNode = new Node("serviceList");
      getDeviceNode().addNode(localNode);
    }
    localNode.addNode(paramService.getServiceNode());
  }
  
  public void announce()
  {
    notifyWait();
    InetAddress[] arrayOfInetAddress = getDeviceData().getHTTPBindAddress();
    if (arrayOfInetAddress != null)
    {
      arrayOfString = new String[arrayOfInetAddress.length];
      for (int i1 = 0; i1 < arrayOfInetAddress.length; i1++) {
        arrayOfString[i1] = arrayOfInetAddress[i1].getHostAddress();
      }
    }
    int i = HostInterface.getNHostAddresses();
    String[] arrayOfString = new String[i];
    for (int j = 0; j < i; j++) {
      arrayOfString[j] = HostInterface.getHostAddress(j);
    }
    int k = 0;
    if (k < arrayOfString.length)
    {
      if ((arrayOfString[k] == null) || (arrayOfString[k].length() == 0)) {}
      for (;;)
      {
        k++;
        break;
        int m = getSSDPAnnounceCount();
        for (int n = 0; n < m; n++) {
          announce(arrayOfString[k]);
        }
      }
    }
  }
  
  public void announce(String paramString)
  {
    String str1 = getLocationURL(paramString);
    SSDPNotifySocket localSSDPNotifySocket = new SSDPNotifySocket(paramString);
    SSDPNotifyRequest localSSDPNotifyRequest = new SSDPNotifyRequest();
    localSSDPNotifyRequest.setServer(UPnP.getServerName());
    localSSDPNotifyRequest.setLeaseTime(getLeaseTime());
    localSSDPNotifyRequest.setLocation(str1);
    localSSDPNotifyRequest.setNTS("ssdp:alive");
    if (isRootDevice() == true)
    {
      String str4 = getNotifyDeviceNT();
      String str5 = getNotifyDeviceUSN();
      localSSDPNotifyRequest.setNT(str4);
      localSSDPNotifyRequest.setUSN(str5);
      localSSDPNotifySocket.post(localSSDPNotifyRequest);
      String str6 = getUDN();
      localSSDPNotifyRequest.setNT(str6);
      localSSDPNotifyRequest.setUSN(str6);
      localSSDPNotifySocket.post(localSSDPNotifyRequest);
    }
    String str2 = getNotifyDeviceTypeNT();
    String str3 = getNotifyDeviceTypeUSN();
    localSSDPNotifyRequest.setNT(str2);
    localSSDPNotifyRequest.setUSN(str3);
    localSSDPNotifySocket.post(localSSDPNotifyRequest);
    localSSDPNotifySocket.close();
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    for (int j = 0; j < i; j++) {
      localServiceList.getService(j).announce(paramString);
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0; m < k; m++) {
      localDeviceList.getDevice(m).announce(paramString);
    }
  }
  
  public void byebye()
  {
    InetAddress[] arrayOfInetAddress = getDeviceData().getHTTPBindAddress();
    if (arrayOfInetAddress != null)
    {
      arrayOfString = new String[arrayOfInetAddress.length];
      for (int i1 = 0; i1 < arrayOfInetAddress.length; i1++) {
        arrayOfString[i1] = arrayOfInetAddress[i1].getHostAddress();
      }
    }
    int i = HostInterface.getNHostAddresses();
    String[] arrayOfString = new String[i];
    for (int j = 0; j < i; j++) {
      arrayOfString[j] = HostInterface.getHostAddress(j);
    }
    int k = 0;
    if (k < arrayOfString.length)
    {
      if ((arrayOfString[k] == null) || (arrayOfString[k].length() <= 0)) {}
      for (;;)
      {
        k++;
        break;
        int m = getSSDPAnnounceCount();
        for (int n = 0; n < m; n++) {
          byebye(arrayOfString[k]);
        }
      }
    }
  }
  
  public void byebye(String paramString)
  {
    SSDPNotifySocket localSSDPNotifySocket = new SSDPNotifySocket(paramString);
    SSDPNotifyRequest localSSDPNotifyRequest = new SSDPNotifyRequest();
    localSSDPNotifyRequest.setNTS("ssdp:byebye");
    if (isRootDevice() == true)
    {
      String str3 = getNotifyDeviceNT();
      String str4 = getNotifyDeviceUSN();
      localSSDPNotifyRequest.setNT(str3);
      localSSDPNotifyRequest.setUSN(str4);
      localSSDPNotifySocket.post(localSSDPNotifyRequest);
    }
    String str1 = getNotifyDeviceTypeNT();
    String str2 = getNotifyDeviceTypeUSN();
    localSSDPNotifyRequest.setNT(str1);
    localSSDPNotifyRequest.setUSN(str2);
    localSSDPNotifySocket.post(localSSDPNotifyRequest);
    localSSDPNotifySocket.close();
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    for (int j = 0; j < i; j++) {
      localServiceList.getService(j).byebye(paramString);
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0; m < k; m++) {
      localDeviceList.getDevice(m).byebye(paramString);
    }
  }
  
  public void deviceSearchReceived(SSDPPacket paramSSDPPacket)
  {
    deviceSearchResponse(paramSSDPPacket);
  }
  
  public void deviceSearchResponse(SSDPPacket paramSSDPPacket)
  {
    String str1 = paramSSDPPacket.getST();
    if (str1 == null) {}
    for (;;)
    {
      return;
      boolean bool = isRootDevice();
      String str2 = getUDN();
      if (bool == true) {
        str2 = str2 + "::upnp:rootdevice";
      }
      if (ST.isAllDevice(str1) == true)
      {
        String str5 = getNotifyDeviceNT();
        if (bool == true) {}
        for (int n = 3;; n = 2) {
          for (int i1 = 0; i1 < n; i1++) {
            postSearchResponse(paramSSDPPacket, str5, str2);
          }
        }
      }
      if (ST.isRootDevice(str1) == true) {
        if (bool == true) {
          postSearchResponse(paramSSDPPacket, "urn:Belkin:service:basicevent:1", str2);
        }
      }
      for (;;)
      {
        ServiceList localServiceList = getServiceList();
        int i = localServiceList.size();
        for (int j = 0; j < i; j++) {
          localServiceList.getService(j).serviceSearchResponse(paramSSDPPacket);
        }
        if (ST.isUUIDDevice(str1) == true)
        {
          String str4 = getUDN();
          if (str1.equals(str4) == true) {
            postSearchResponse(paramSSDPPacket, str4, str2);
          }
        }
        else if (ST.isURNDevice(str1) == true)
        {
          String str3 = getDeviceType();
          if (str1.equals(str3) == true) {
            postSearchResponse(paramSSDPPacket, str3, getUDN() + "::" + str3);
          }
        }
      }
      DeviceList localDeviceList = getDeviceList();
      int k = localDeviceList.size();
      for (int m = 0; m < k; m++) {
        localDeviceList.getDevice(m).deviceSearchResponse(paramSSDPPacket);
      }
    }
  }
  
  public String getAbsoluteURL(String paramString)
  {
    try
    {
      String str8 = new URL(paramString).toString();
      return str8;
    }
    catch (Exception localException1)
    {
      Device localDevice = getRootDevice();
      String str1 = localDevice.getURLBase();
      if ((str1 == null) || (str1.length() <= 0))
      {
        String str2 = localDevice.getLocation();
        str1 = HTTP.getRequestHostURL(HTTP.getHost(str2), HTTP.getPort(str2));
      }
      String str3 = HTTP.toRelativeURL(paramString);
      String str4 = str1 + str3;
      try
      {
        String str7 = new URL(str4).toString();
        return str7;
      }
      catch (Exception localException2)
      {
        String str5 = HTTP.getAbsoluteURL(str1, str3);
        try
        {
          String str6 = new URL(str5).toString();
          return str6;
        }
        catch (Exception localException3) {}
      }
    }
    return "";
  }
  
  public Action getAction(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Action localAction;
    for (int j = 0; j < i; j++)
    {
      ActionList localActionList = localServiceList.getService(j).getActionList();
      int n = localActionList.size();
      int i1 = 0;
      if (i1 < n)
      {
        localAction = localActionList.getAction(i1);
        String str = localAction.getName();
        if (str == null) {}
        while (str.equals(paramString) != true)
        {
          i1++;
          break;
        }
        return localAction;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label140;
      }
      localAction = localDeviceList.getDevice(m).getAction(paramString);
      if (localAction != null) {
        break;
      }
    }
    label140:
    return null;
  }
  
  public JSONObject getAttributeList()
  {
    return this.attributeListJSON;
  }
  
  public JSONObject getAttributeListParameterFromDevice()
  {
    try
    {
      Action localAction = getAction("GetAttributeList");
      if (localAction != null)
      {
        String str = localAction.postControlAction();
        if (str == null) {
          return null;
        }
        JSONObject localJSONObject = new GetAttributeListResponseParser().parseGetAttributeListResponse(str);
        return localJSONObject;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      this.attributeListJSON = null;
    }
    return null;
  }
  
  public JSONObject getAttributetParameterFromDevice()
  {
    try
    {
      String str = getAction("GetAttributes").postControlAction();
      if (str == null) {
        return null;
      }
      JSONObject localJSONObject = new GetAttributeResponseParser().parseGetAttributeResponse(str);
      return localJSONObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public JSONObject getAttriuteListFromDevice()
  {
    return updateAttributesList(getAttributeListParameterFromDevice(), getAttributetParameterFromDevice());
  }
  
  public String getBinaryStateFromDevice()
  {
    return getParameterFromDevice("GetBinaryState");
  }
  
  public String getBlobStorageFromDevice()
  {
    String[] arrayOfString = { "Sensor" };
    Action localAction = getAction("GetBlobStorage");
    setArgument(localAction, UpnpConstants.GET_BLOB_STORAGE_DATA, arrayOfString);
    String str = localAction.postControlAction();
    return new GetBlobStorageParser().parseGetBlobStorageRespone(str);
  }
  
  public String getBrandName()
  {
    return getDeviceNode().getNodeValue("brandName");
  }
  
  public String getConfigureState()
  {
    return getDeviceNode().getNodeValue("CONFIGURE_STATE");
  }
  
  public Map<String, String> getCustomizedInformationFromDevice()
  {
    String str1 = getParameterFromDevice("GetInformation");
    Log.e("WeMoSDK", "getCustomizedInformationFromDevice info: " + str1 + " location: " + getLocation());
    if ((str1 == null) || (str1.equals(""))) {
      return null;
    }
    String str2 = str1.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
    CustomizedDeviceInfoParser localCustomizedDeviceInfoParser = new CustomizedDeviceInfoParser();
    try
    {
      Xml.parse(str2, localCustomizedDeviceInfoParser);
      return localCustomizedDeviceInfoParser.getCustomizedDeviceInfoArray();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Log.e("WeMoSDK", "getCustomizedInformationFromDevice Exception: " + localException.getMessage() + " info: " + str2);
      }
    }
  }
  
  public File getDescriptionFile()
  {
    return getDeviceData().getDescriptionFile();
  }
  
  public String getDescriptionFilePath()
  {
    File localFile = getDescriptionFile();
    if (localFile == null) {
      return "";
    }
    return localFile.getAbsoluteFile().getParent();
  }
  
  public Device getDevice(String paramString)
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++)
    {
      Device localDevice1 = localDeviceList.getDevice(j);
      if (localDevice1.isDevice(paramString) == true) {
        return localDevice1;
      }
      Device localDevice2 = localDevice1.getDevice(paramString);
      if (localDevice2 != null) {
        return localDevice2;
      }
    }
    return null;
  }
  
  public Device getDeviceByDescriptionURI(String paramString)
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++)
    {
      Device localDevice1 = localDeviceList.getDevice(j);
      if (localDevice1.isDescriptionURI(paramString) == true) {
        return localDevice1;
      }
      Device localDevice2 = localDevice1.getDeviceByDescriptionURI(paramString);
      if (localDevice2 != null) {
        return localDevice2;
      }
    }
    return null;
  }
  
  public String[] getDeviceInformationFromDevice()
  {
    try
    {
      String str = getParameterFromDevice("GetDeviceInformation");
      if (str.equals("")) {
        return null;
      }
      String[] arrayOfString = str.split("\\|");
      return arrayOfString;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public DeviceList getDeviceList()
  {
    DeviceList localDeviceList = new DeviceList();
    Node localNode1 = getDeviceNode().getNode("deviceList");
    if (localNode1 == null) {
      return localDeviceList;
    }
    int i = localNode1.getNNodes();
    int j = 0;
    label33:
    Node localNode2;
    if (j < i)
    {
      localNode2 = localNode1.getNode(j);
      if (isDeviceNode(localNode2)) {
        break label61;
      }
    }
    for (;;)
    {
      j++;
      break label33;
      break;
      label61:
      localDeviceList.add(new Device(localNode2));
    }
  }
  
  public Node getDeviceNode()
  {
    return this.deviceNode;
  }
  
  public String getDeviceType()
  {
    return getDeviceNode().getNodeValue("deviceType");
  }
  
  public long getElapsedTime()
  {
    return (System.currentTimeMillis() - getTimeStamp()) / 1000L;
  }
  
  public String getFirmwareVersion()
  {
    return getDeviceNode().getNodeValue("firmwareVersion");
  }
  
  public String getFirmwareVersionFromDevice()
  {
    str1 = null;
    try
    {
      Action localAction = getAction("GetFirmwareVersion");
      String str2 = localAction.postControlAction();
      str1 = null;
      if (str2 != null)
      {
        ArgumentList localArgumentList = localAction.getOutputArgumentList();
        for (int i = 0; i < localArgumentList.size(); i++)
        {
          String[] arrayOfString = localArgumentList.getArgument(i).getValue().toString().split("\\|")[0].toString().split(":");
          Log.v("WeMoSDK", "getFirmwareVersionFromDevice >> currentFW is: " + arrayOfString[1]);
          str1 = arrayOfString[1];
        }
      }
      return str1;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public String getFriendlyName()
  {
    return getDeviceNode().getNodeValue("friendlyName");
  }
  
  public String getFriendlyNameFromDevice()
  {
    String str1 = null;
    try
    {
      Action localAction = getAction("GetFriendlyName");
      str1 = null;
      if (localAction != null) {
        str1 = localAction.postControlAction();
      }
      String str2 = str1.substring(str1.indexOf("<FriendlyName>") + "<FriendlyName>".length(), str1.indexOf("</FriendlyName>"));
      return str2;
    }
    catch (Exception localException) {}
    return str1;
  }
  
  public InetAddress[] getHTTPBindAddress()
  {
    return getDeviceData().getHTTPBindAddress();
  }
  
  public int getHTTPPort()
  {
    return getDeviceData().getHTTPPort();
  }
  
  public String getIPAddress()
  {
    String str = getUrlBaseStr();
    if (str != null) {
      return HTTP.getHost(str);
    }
    return null;
  }
  
  public Icon getIcon(int paramInt)
  {
    IconList localIconList = getIconList();
    if ((paramInt < 0) && (-1 + localIconList.size() < paramInt)) {
      return null;
    }
    return localIconList.getIcon(paramInt);
  }
  
  public IconList getIconList()
  {
    IconList localIconList = new IconList();
    Node localNode1 = getDeviceNode().getNode("iconList");
    if (localNode1 == null) {
      return localIconList;
    }
    int i = localNode1.getNNodes();
    int j = 0;
    label33:
    Node localNode2;
    if (j < i)
    {
      localNode2 = localNode1.getNode(j);
      if (Icon.isIconNode(localNode2)) {
        break label61;
      }
    }
    for (;;)
    {
      j++;
      break label33;
      break;
      label61:
      localIconList.add(new Icon(localNode2));
    }
  }
  
  public String getInterfaceAddress()
  {
    SSDPPacket localSSDPPacket = getSSDPPacket();
    if (localSSDPPacket == null) {
      return "";
    }
    return localSSDPPacket.getLocalAddress();
  }
  
  public int getLeaseTime()
  {
    SSDPPacket localSSDPPacket = getSSDPPacket();
    if (localSSDPPacket != null) {
      return localSSDPPacket.getLeaseTime();
    }
    return getDeviceData().getLeaseTime();
  }
  
  public String getLocation()
  {
    SSDPPacket localSSDPPacket = getSSDPPacket();
    if (localSSDPPacket != null) {
      return localSSDPPacket.getLocation();
    }
    return getDeviceData().getLocation();
  }
  
  public String getLocationURL(String paramString)
  {
    return HostInterface.getHostURL(paramString, getHTTPPort(), getDescriptionURI());
  }
  
  public String getLogoURLFromDevice()
  {
    String str = getLocation();
    if (str != null) {
      return str.replace("setup.xml", "icon.jpg");
    }
    return getParameterFromDevice("GetIconURL");
  }
  
  public String getMacAddress()
  {
    return getDeviceNode().getNodeValue("macAddress");
  }
  
  public String getManufacture()
  {
    return getDeviceNode().getNodeValue("manufacturer");
  }
  
  public String getManufactureURL()
  {
    return getDeviceNode().getNodeValue("manufacturerURL");
  }
  
  public String[] getMetaInfoFromDevice()
  {
    String str = getAction("GetMetaInfo").postControlAction();
    if (str != null)
    {
      int i = str.indexOf("<MetaInfo>") + "<MetaInfo>".length();
      int j = str.indexOf("</MetaInfo>");
      if (i < j) {
        return str.substring(i, j).split("\\|");
      }
    }
    return null;
  }
  
  public String getModelDescription()
  {
    return getDeviceNode().getNodeValue("modelDescription");
  }
  
  public String getModelName()
  {
    return getDeviceNode().getNodeValue("modelName");
  }
  
  public String getModelNumber()
  {
    return getDeviceNode().getNodeValue("modelNumber");
  }
  
  public String getModelURL()
  {
    return getDeviceNode().getNodeValue("modelURL");
  }
  
  public String getMulticastIPv4Address()
  {
    return getDeviceData().getMulticastIPv4Address();
  }
  
  public String getMulticastIPv6Address()
  {
    return getDeviceData().getMulticastIPv6Address();
  }
  
  public Device getParentDevice()
  {
    if (isRootDevice()) {
      return null;
    }
    return new Device(getDeviceNode().getParentNode().getParentNode());
  }
  
  public int getPort()
  {
    String str = getUrlBaseStr();
    if (str != null) {
      return HTTP.getPort(str);
    }
    return 0;
  }
  
  public String getPresentationURL()
  {
    return getDeviceNode().getNodeValue("presentationURL");
  }
  
  public String getProductName()
  {
    return getDeviceNode().getNodeValue("productName");
  }
  
  public String getProductType()
  {
    return getDeviceNode().getNodeValue("productType");
  }
  
  public Device getRootDevice()
  {
    Node localNode1 = getRootNode();
    if (localNode1 == null) {}
    Node localNode2;
    do
    {
      return null;
      localNode2 = localNode1.getNode("device");
    } while (localNode2 == null);
    return new Device(localNode1, localNode2);
  }
  
  public Node getRootNode()
  {
    if (this.rootNode != null) {
      return this.rootNode;
    }
    if (this.deviceNode == null) {
      return null;
    }
    return this.deviceNode.getRootNode();
  }
  
  public int getSSDPAnnounceCount()
  {
    int i = 1;
    if ((isNMPRMode() == i) && (isWirelessMode() == i)) {
      i = 4;
    }
    return i;
  }
  
  public InetAddress[] getSSDPBindAddress()
  {
    return getDeviceData().getSSDPBindAddress();
  }
  
  public String getSSDPIPv4MulticastAddress()
  {
    return getDeviceData().getMulticastIPv4Address();
  }
  
  public void getSSDPIPv4MulticastAddress(String paramString)
  {
    getDeviceData().setMulticastIPv4Address(paramString);
  }
  
  public String getSSDPIPv6MulticastAddress()
  {
    return getDeviceData().getMulticastIPv6Address();
  }
  
  public void getSSDPIPv6MulticastAddress(String paramString)
  {
    getDeviceData().setMulticastIPv6Address(paramString);
  }
  
  public SSDPPacket getSSDPPacket()
  {
    if (!isRootDevice()) {
      return null;
    }
    return getDeviceData().getSSDPPacket();
  }
  
  public int getSSDPPort()
  {
    return getDeviceData().getSSDPPort();
  }
  
  public String getSerialNumber()
  {
    return getDeviceNode().getNodeValue("serialNumber");
  }
  
  public Service getService(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Service localService;
    for (int j = 0; j < i; j++)
    {
      localService = localServiceList.getService(j);
      if (localService.isService(paramString) == true) {
        return localService;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label93;
      }
      localService = localDeviceList.getDevice(m).getService(paramString);
      if (localService != null) {
        break;
      }
    }
    label93:
    return null;
  }
  
  public Service getServiceByControlURL(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Service localService;
    for (int j = 0; j < i; j++)
    {
      localService = localServiceList.getService(j);
      if (localService.isControlURL(paramString) == true) {
        return localService;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label93;
      }
      localService = localDeviceList.getDevice(m).getServiceByControlURL(paramString);
      if (localService != null) {
        break;
      }
    }
    label93:
    return null;
  }
  
  public Service getServiceByEventSubURL(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Service localService;
    for (int j = 0; j < i; j++)
    {
      localService = localServiceList.getService(j);
      if (localService.isEventSubURL(paramString) == true) {
        return localService;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label93;
      }
      localService = localDeviceList.getDevice(m).getServiceByEventSubURL(paramString);
      if (localService != null) {
        break;
      }
    }
    label93:
    return null;
  }
  
  public Service getServiceBySCPDURL(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Service localService;
    for (int j = 0; j < i; j++)
    {
      localService = localServiceList.getService(j);
      if (localService.isSCPDURL(paramString) == true) {
        return localService;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label93;
      }
      localService = localDeviceList.getDevice(m).getServiceBySCPDURL(paramString);
      if (localService != null) {
        break;
      }
    }
    label93:
    return null;
  }
  
  public ServiceList getServiceList()
  {
    ServiceList localServiceList = new ServiceList();
    Node localNode1 = getDeviceNode().getNode("serviceList");
    if (localNode1 == null) {
      return localServiceList;
    }
    int i = localNode1.getNNodes();
    int j = 0;
    label33:
    Node localNode2;
    if (j < i)
    {
      localNode2 = localNode1.getNode(j);
      if (Service.isServiceNode(localNode2)) {
        break label61;
      }
    }
    for (;;)
    {
      j++;
      break label33;
      break;
      label61:
      localServiceList.add(new Service(localNode2));
    }
  }
  
  public Icon getSmallestIcon()
  {
    Object localObject = null;
    IconList localIconList = getIconList();
    int i = localIconList.size();
    int j = 0;
    if (j < i)
    {
      Icon localIcon = localIconList.getIcon(j);
      if (localObject == null) {
        localObject = localIcon;
      }
      for (;;)
      {
        j++;
        break;
        if (localIcon.getWidth() < ((Icon)localObject).getWidth()) {
          localObject = localIcon;
        }
      }
    }
    return (Icon)localObject;
  }
  
  public StateVariable getStateVariable(String paramString)
  {
    return getStateVariable(null, paramString);
  }
  
  public StateVariable getStateVariable(String paramString1, String paramString2)
  {
    StateVariable localStateVariable1;
    if ((paramString1 == null) && (paramString2 == null))
    {
      localStateVariable1 = null;
      return localStateVariable1;
    }
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    int j = 0;
    if (j < i)
    {
      Service localService = localServiceList.getService(j);
      if ((paramString1 != null) && (!localService.getServiceType().equals(paramString1))) {}
      StateVariable localStateVariable2;
      do
      {
        j++;
        break;
        localStateVariable2 = localService.getStateVariable(paramString2);
      } while (localStateVariable2 == null);
      return localStateVariable2;
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label129;
      }
      localStateVariable1 = localDeviceList.getDevice(m).getStateVariable(paramString1, paramString2);
      if (localStateVariable1 != null) {
        break;
      }
    }
    label129:
    return null;
  }
  
  public Service getSubscriberService(String paramString)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    Service localService;
    for (int j = 0; j < i; j++)
    {
      localService = localServiceList.getService(j);
      if (paramString.equals(localService.getSID()) == true) {
        return localService;
      }
    }
    DeviceList localDeviceList = getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0;; m++)
    {
      if (m >= k) {
        break label96;
      }
      localService = localDeviceList.getDevice(m).getSubscriberService(paramString);
      if (localService != null) {
        break;
      }
    }
    label96:
    return null;
  }
  
  public long getTimeStamp()
  {
    SSDPPacket localSSDPPacket = getSSDPPacket();
    if (localSSDPPacket != null) {
      return localSSDPPacket.getTimeStamp();
    }
    return 0L;
  }
  
  public String getUDN()
  {
    return WeMoSDKContext.getFilteredUDN(getDeviceNode().getNodeValue("UDN"));
  }
  
  public String getUPC()
  {
    return getDeviceNode().getNodeValue("UPC");
  }
  
  public String getURLBase()
  {
    if (isRootDevice() == true) {
      return getRootNode().getNodeValue("URLBase");
    }
    return "";
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public boolean hasUDN()
  {
    String str = getUDN();
    return (str != null) && (str.length() > 0);
  }
  
  public void httpRequestRecieved(HTTPRequest paramHTTPRequest)
  {
    if (Debug.isOn() == true) {
      paramHTTPRequest.print();
    }
    if ((paramHTTPRequest.isGetRequest() == true) || (paramHTTPRequest.isHeadRequest() == true))
    {
      httpGetRequestRecieved(paramHTTPRequest);
      return;
    }
    if (paramHTTPRequest.isPostRequest() == true)
    {
      httpPostRequestRecieved(paramHTTPRequest);
      return;
    }
    if ((paramHTTPRequest.isSubscribeRequest() == true) || (paramHTTPRequest.isUnsubscribeRequest() == true))
    {
      deviceEventSubscriptionRecieved(new SubscriptionRequest(paramHTTPRequest));
      return;
    }
    paramHTTPRequest.returnBadRequest();
  }
  
  public boolean isAvailable()
  {
    return this.available;
  }
  
  public boolean isDevice(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return false;
      if (paramString.endsWith(getUDN()) == true) {
        return true;
      }
      if (paramString.equals(getFriendlyName()) == true) {
        return true;
      }
    } while (paramString.endsWith(getDeviceType()) != true);
    return true;
  }
  
  public boolean isDeviceType(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return paramString.equals(getDeviceType());
  }
  
  public boolean isExpired()
  {
    long l = getElapsedTime();
    return 60 + getLeaseTime() < l;
  }
  
  public boolean isLocationChange()
  {
    return this.locationChange;
  }
  
  public boolean isNMPRMode()
  {
    Node localNode = getDeviceNode();
    if (localNode == null) {}
    while (localNode.getNode("INMPR03") == null) {
      return false;
    }
    return true;
  }
  
  public boolean isRootDevice()
  {
    return WeMoSDKContext.getFilteredUDN(getRootNode().getNode("device").getNodeValue("UDN")).equals(getUDN());
  }
  
  public boolean isRunning()
  {
    return getAdvertiser() != null;
  }
  
  public boolean isWirelessMode()
  {
    return this.wirelessMode;
  }
  
  public boolean loadDescription(File paramFile)
    throws InvalidDescriptionException
  {
    try
    {
      this.rootNode = UPnP.getXMLParser().parse(paramFile);
      if (this.rootNode == null) {
        throw new InvalidDescriptionException("Couldn't find a root node", paramFile);
      }
    }
    catch (ParserException localParserException)
    {
      throw new InvalidDescriptionException(localParserException);
    }
    this.deviceNode = this.rootNode.getNode("device");
    if (this.deviceNode == null) {
      throw new InvalidDescriptionException("Couldn't find a root device node", paramFile);
    }
    if (!initializeLoadedDescription()) {
      return false;
    }
    setDescriptionFile(paramFile);
    return true;
  }
  
  public boolean loadDescription(InputStream paramInputStream)
    throws InvalidDescriptionException
  {
    try
    {
      this.rootNode = UPnP.getXMLParser().parse(paramInputStream);
      if (this.rootNode == null) {
        throw new InvalidDescriptionException("Couldn't find a root node");
      }
    }
    catch (ParserException localParserException)
    {
      throw new InvalidDescriptionException(localParserException);
    }
    this.deviceNode = this.rootNode.getNode("device");
    if (this.deviceNode == null) {
      throw new InvalidDescriptionException("Couldn't find a root device node");
    }
    if (!initializeLoadedDescription()) {
      return false;
    }
    setDescriptionFile(null);
    return true;
  }
  
  public boolean loadDescription(String paramString)
    throws InvalidDescriptionException
  {
    try
    {
      this.rootNode = UPnP.getXMLParser().parse(paramString);
      if (this.rootNode == null) {
        throw new InvalidDescriptionException("Couldn't find a root node");
      }
    }
    catch (ParserException localParserException)
    {
      throw new InvalidDescriptionException(localParserException);
    }
    this.deviceNode = this.rootNode.getNode("device");
    if (this.deviceNode == null) {
      throw new InvalidDescriptionException("Couldn't find a root device node");
    }
    if (!initializeLoadedDescription()) {
      return false;
    }
    setDescriptionFile(null);
    return true;
  }
  
  public void lock()
  {
    this.mutex.lock();
  }
  
  public boolean postSearchResponse(SSDPPacket paramSSDPPacket, String paramString1, String paramString2)
  {
    String str1 = paramSSDPPacket.getLocalAddress();
    String str2 = getRootDevice().getLocationURL(str1);
    SSDPSearchResponse localSSDPSearchResponse = new SSDPSearchResponse();
    localSSDPSearchResponse.setLeaseTime(getLeaseTime());
    localSSDPSearchResponse.setDate(cal);
    localSSDPSearchResponse.setST(paramString1);
    localSSDPSearchResponse.setUSN(paramString2);
    localSSDPSearchResponse.setLocation(str2);
    localSSDPSearchResponse.setMYNAME(getFriendlyName());
    TimerUtil.waitRandom(1000 * paramSSDPPacket.getMX());
    String str3 = paramSSDPPacket.getRemoteAddress();
    int i = paramSSDPPacket.getRemotePort();
    SSDPSearchResponseSocket localSSDPSearchResponseSocket = new SSDPSearchResponseSocket();
    if (Debug.isOn() == true) {
      localSSDPSearchResponse.print();
    }
    int j = getSSDPAnnounceCount();
    for (int k = 0; k < j; k++) {
      localSSDPSearchResponseSocket.post(str3, i, localSSDPSearchResponse);
    }
    return true;
  }
  
  public void setActionListener(ActionListener paramActionListener)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    for (int j = 0; j < i; j++) {
      localServiceList.getService(j).setActionListener(paramActionListener);
    }
  }
  
  public void setActionListener(ActionListener paramActionListener, boolean paramBoolean)
  {
    setActionListener(paramActionListener);
    if (paramBoolean == true)
    {
      DeviceList localDeviceList = getDeviceList();
      int i = localDeviceList.size();
      for (int j = 0; j < i; j++) {
        localDeviceList.getDevice(j).setActionListener(paramActionListener, true);
      }
    }
  }
  
  public void setAvailable(boolean paramBoolean)
  {
    this.available = paramBoolean;
  }
  
  public void setBrandName(String paramString)
  {
    getDeviceNode().setNode("brandName", paramString);
  }
  
  public void setConfigureState(String paramString)
  {
    getDeviceNode().setNode("CONFIGURE_STATE", paramString);
  }
  
  public void setDeviceNode(Node paramNode)
  {
    this.deviceNode = paramNode;
  }
  
  public void setDeviceType(String paramString)
  {
    getDeviceNode().setNode("deviceType", paramString);
  }
  
  public void setFriendlyName(String paramString)
  {
    getDeviceNode().setNode("friendlyName", paramString);
  }
  
  public void setHTTPBindAddress(InetAddress[] paramArrayOfInetAddress)
  {
    getDeviceData().setHTTPBindAddress(paramArrayOfInetAddress);
  }
  
  public void setHTTPPort(int paramInt)
  {
    getDeviceData().setHTTPPort(paramInt);
  }
  
  public void setLeaseTime(int paramInt)
  {
    getDeviceData().setLeaseTime(paramInt);
    Advertiser localAdvertiser = getAdvertiser();
    if (localAdvertiser != null)
    {
      announce();
      localAdvertiser.restart();
    }
  }
  
  public void setLocation(String paramString)
  {
    getDeviceData().setLocation(paramString);
  }
  
  public void setLocationChange(boolean paramBoolean)
  {
    this.locationChange = paramBoolean;
  }
  
  public void setMacAddress(String paramString)
  {
    getDeviceNode().setNode("macAddress", paramString);
  }
  
  public void setManufacture(String paramString)
  {
    getDeviceNode().setNode("manufacturer", paramString);
  }
  
  public void setManufactureURL(String paramString)
  {
    getDeviceNode().setNode("manufacturerURL", paramString);
  }
  
  public void setModelDescription(String paramString)
  {
    getDeviceNode().setNode("modelDescription", paramString);
  }
  
  public void setModelName(String paramString)
  {
    getDeviceNode().setNode("modelName", paramString);
  }
  
  public void setModelNumber(String paramString)
  {
    getDeviceNode().setNode("modelNumber", paramString);
  }
  
  public void setModelURL(String paramString)
  {
    getDeviceNode().setNode("modelURL", paramString);
  }
  
  public void setMulticastIPv4Address(String paramString)
  {
    getDeviceData().setMulticastIPv4Address(paramString);
  }
  
  public void setMulticastIPv6Address(String paramString)
  {
    getDeviceData().setMulticastIPv6Address(paramString);
  }
  
  public void setNMPRMode(boolean paramBoolean)
  {
    Node localNode = getDeviceNode();
    if (localNode == null) {
      return;
    }
    if (paramBoolean == true)
    {
      localNode.setNode("INMPR03", "1.0");
      localNode.removeNode("URLBase");
      return;
    }
    localNode.removeNode("INMPR03");
  }
  
  public void setPresentationURL(String paramString)
  {
    getDeviceNode().setNode("presentationURL", paramString);
  }
  
  public void setProductName(String paramString)
  {
    getDeviceNode().setNode("productName", paramString);
  }
  
  public void setProductType(String paramString)
  {
    getDeviceNode().setNode("productType", paramString);
  }
  
  public void setQueryListener(QueryListener paramQueryListener)
  {
    ServiceList localServiceList = getServiceList();
    int i = localServiceList.size();
    for (int j = 0; j < i; j++) {
      localServiceList.getService(j).setQueryListener(paramQueryListener);
    }
  }
  
  public void setQueryListener(QueryListener paramQueryListener, boolean paramBoolean)
  {
    setQueryListener(paramQueryListener);
    if (paramBoolean == true)
    {
      DeviceList localDeviceList = getDeviceList();
      int i = localDeviceList.size();
      for (int j = 0; j < i; j++) {
        localDeviceList.getDevice(j).setQueryListener(paramQueryListener, true);
      }
    }
  }
  
  public void setRootNode(Node paramNode)
  {
    this.rootNode = paramNode;
  }
  
  public void setSSDPBindAddress(InetAddress[] paramArrayOfInetAddress)
  {
    getDeviceData().setSSDPBindAddress(paramArrayOfInetAddress);
  }
  
  public void setSSDPPacket(SSDPPacket paramSSDPPacket)
  {
    getDeviceData().setSSDPPacket(paramSSDPPacket);
  }
  
  public void setSSDPPort(int paramInt)
  {
    getDeviceData().setSSDPPort(paramInt);
  }
  
  public void setSerialNumber(String paramString)
  {
    getDeviceNode().setNode("serialNumber", paramString);
  }
  
  public void setUDN(String paramString)
  {
    String str = WeMoSDKContext.getFilteredUDN(paramString);
    getDeviceNode().setNode("UDN", str);
  }
  
  public void setUPC(String paramString)
  {
    getDeviceNode().setNode("UPC", paramString);
  }
  
  public void setUserData(Object paramObject)
  {
    this.userData = paramObject;
  }
  
  public void setWirelessMode(boolean paramBoolean)
  {
    this.wirelessMode = paramBoolean;
  }
  
  public boolean start()
  {
    stop(true);
    int i = 0;
    int j = getHTTPPort();
    HTTPServerList localHTTPServerList = getHTTPServerList();
    if (!localHTTPServerList.open(j))
    {
      i++;
      if (100 >= i) {}
    }
    SSDPSearchSocketList localSSDPSearchSocketList;
    do
    {
      return false;
      setHTTPPort(j + 1);
      j = getHTTPPort();
      break;
      localHTTPServerList.addRequestListener(this);
      localHTTPServerList.start();
      localSSDPSearchSocketList = getSSDPSearchSocketList();
    } while (!localSSDPSearchSocketList.open());
    localSSDPSearchSocketList.addSearchListener(this);
    localSSDPSearchSocketList.start();
    announce();
    Advertiser localAdvertiser = new Advertiser(this);
    setAdvertiser(localAdvertiser);
    localAdvertiser.start();
    return true;
  }
  
  public boolean stop()
  {
    return stop(true);
  }
  
  public void unlock()
  {
    this.mutex.unlock();
  }
  
  public JSONObject updateAttributesList(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if ((paramJSONObject1 != null) && (paramJSONObject2 != null))
    {
      Iterator localIterator = paramJSONObject2.keys();
      while (localIterator.hasNext()) {
        try
        {
          String str1 = (String)localIterator.next();
          if ((paramJSONObject2.has(str1)) && (paramJSONObject1.has(str1)))
          {
            JSONObject localJSONObject1 = paramJSONObject2.getJSONObject(str1);
            JSONObject localJSONObject2 = paramJSONObject1.getJSONObject(str1);
            String str2 = localJSONObject1.optString("value");
            if ((str2 != null) && (!str2.equals("")) && (!str2.equals(null)) && (!str2.equals("null"))) {
              localJSONObject2.put("value", str2);
            }
          }
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    }
    return paramJSONObject1;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/Device.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */