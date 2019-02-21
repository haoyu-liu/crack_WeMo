package org.cybergarage.upnp;

import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.http.HTTPRequestListener;
import org.cybergarage.http.HTTPServerList;
import org.cybergarage.net.HostInterface;
import org.cybergarage.upnp.control.RenewSubscriber;
import org.cybergarage.upnp.device.DeviceChangeListener;
import org.cybergarage.upnp.device.Disposer;
import org.cybergarage.upnp.device.InvalidDescriptionException;
import org.cybergarage.upnp.device.NotifyListener;
import org.cybergarage.upnp.device.SearchResponseListener;
import org.cybergarage.upnp.device.USN;
import org.cybergarage.upnp.event.EventListener;
import org.cybergarage.upnp.event.NotifyRequest;
import org.cybergarage.upnp.event.Property;
import org.cybergarage.upnp.event.PropertyList;
import org.cybergarage.upnp.event.SubscriptionRequest;
import org.cybergarage.upnp.event.SubscriptionResponse;
import org.cybergarage.upnp.ssdp.SSDPNotifySocketList;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.upnp.ssdp.SSDPSearchRequest;
import org.cybergarage.upnp.ssdp.SSDPSearchResponseSocketList;
import org.cybergarage.util.Debug;
import org.cybergarage.util.ListenerList;
import org.cybergarage.util.Mutex;
import org.cybergarage.xml.Node;
import org.cybergarage.xml.NodeList;
import org.cybergarage.xml.Parser;
import org.cybergarage.xml.ParserException;
import org.cybergarage.xml.parser.GetNotifyStatusFirmwareParser;
import org.cybergarage.xml.parser.GetNotifyStatusResponseParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ControlPoint
  implements HTTPRequestListener
{
  private static final int DEFAULT_EVENTSUB_PORT = 8058;
  private static final String DEFAULT_EVENTSUB_URI = "/evetSub";
  private static final int DEFAULT_EXPIRED_DEVICE_MONITORING_INTERVAL = 40;
  private static final int DEFAULT_SSDP_PORT = 8008;
  private static final String TAG;
  private static NodeList devNodeList;
  private static boolean didMSearchFail = true;
  ListenerList deviceChangeListenerList = new ListenerList();
  private Disposer deviceDisposer;
  private ListenerList deviceNotifyListenerList = new ListenerList();
  private ListenerList deviceSearchResponseListenerList = new ListenerList();
  private ListenerList eventListenerList = new ListenerList();
  private String eventSubURI = "/evetSub";
  private long expiredDeviceMonitoringInterval;
  private int httpPort = 0;
  private HTTPServerList httpServerList = new HTTPServerList();
  private String mSSID = "";
  private Mutex mutex = new Mutex();
  private boolean nmprMode;
  private RenewSubscriber renewSubscriber;
  private int searchMx = 2;
  private SSDPNotifySocketList ssdpNotifySocketList;
  private int ssdpPort = 0;
  private SSDPSearchResponseSocketList ssdpSearchResponseSocketList;
  private Object userData = null;
  
  static
  {
    TAG = ControlPoint.class.getSimpleName();
    devNodeList = null;
    devNodeList = new NodeList();
    UPnP.initialize();
  }
  
  public ControlPoint()
  {
    this(8008, 8058);
  }
  
  public ControlPoint(int paramInt1, int paramInt2)
  {
    this(paramInt1, paramInt2, null);
  }
  
  public ControlPoint(int paramInt1, int paramInt2, InetAddress[] paramArrayOfInetAddress)
  {
    this.ssdpNotifySocketList = new SSDPNotifySocketList(paramArrayOfInetAddress);
    this.ssdpSearchResponseSocketList = new SSDPSearchResponseSocketList(paramArrayOfInetAddress);
    setSSDPPort(paramInt1);
    setHTTPPort(paramInt2);
    setDeviceDisposer(null);
    setExpiredDeviceMonitoringInterval(40L);
    setRenewSubscriber(null);
    setNMPRMode(false);
    setRenewSubscriber(null);
    setMSearchFail(true);
    SDKLogUtils.debugLog(TAG, "Control point constructor");
  }
  
  private void addDevice(SSDPPacket paramSSDPPacket, boolean paramBoolean)
  {
    SDKLogUtils.infoLog(TAG, "Get ssdpPacket: " + paramSSDPPacket.toString() + "/n Notify Listeners: " + paramBoolean);
    if (!paramSSDPPacket.isRootDevice()) {}
    String str1;
    do
    {
      do
      {
        do
        {
          for (;;)
          {
            return;
            str1 = USN.getUDN(paramSSDPPacket.getUSN());
            SDKLogUtils.infoLog(TAG, "Get UDN: " + str1);
            Device localDevice1 = getDevice(str1);
            if (localDevice1 == null) {
              break;
            }
            String str5 = localDevice1.getDeviceType();
            SDKLogUtils.debugLog(TAG, "addDevice: device type on existing device: " + str5);
            if ((str5.equalsIgnoreCase("urn:Belkin:device:socket:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:sensor:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:controllee:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:LinksysWNCSensor:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:bridge:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:lightswitch:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:insight:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:AirPurifier:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:Maker:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:HeaterA:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:HeaterB:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:Humidifier:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:HumidifierB:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:Crockpot:1")) || (str5.equalsIgnoreCase("urn:Belkin:device:dimmer:1")))
            {
              SDKLogUtils.errorLog(TAG, "Already available UDN = " + str1 + " ssdpPacket loc: " + paramSSDPPacket.getLocation() + " isNotify: " + paramSSDPPacket.isNotify() + " devhash: " + localDevice1.hashCode());
              localDevice1.setSSDPPacket(paramSSDPPacket);
              if (isLocationChange(str1, localDevice1, paramSSDPPacket)) {
                localDevice1.setLocationChange(true);
              }
              while (paramBoolean)
              {
                performAddDeviceListener(localDevice1);
                return;
                localDevice1.setLocationChange(false);
              }
            }
          }
          String str2 = paramSSDPPacket.getLocation();
          try
          {
            localURL = new URL(str2);
            SDKLogUtils.errorLog(TAG, "Added UDN = " + str1 + " locationUrl: " + localURL);
            localParser = UPnP.getXMLParser();
            i = str1.lastIndexOf("-");
            j = str1.indexOf(":", i);
            if (j != -1) {
              break;
            }
            localObject = str1.substring(i + 1, str1.length());
          }
          catch (MalformedURLException localMalformedURLException)
          {
            for (;;)
            {
              URL localURL;
              Parser localParser;
              int i;
              int j;
              Node localNode;
              Device localDevice2;
              String str3;
              Debug.warning(paramSSDPPacket.toString());
              Debug.warning(localMalformedURLException);
              return;
              int k = i + 1;
              String str4 = str1.substring(k, j);
              Object localObject = str4;
            }
          }
          catch (ParserException localParserException)
          {
            Debug.warning(paramSSDPPacket.toString());
            Debug.warning(localParserException);
          }
          localNode = localParser.parse(FileStorage.getInstance(null).getDescriptionFile(localURL, (String)localObject));
          if (localNode == null) {
            localNode = localParser.parse(localURL);
          }
          localDevice2 = getDevice(localNode);
        } while (localDevice2 == null);
        str3 = localDevice2.getDeviceType();
        SDKLogUtils.debugLog(TAG, "addDevice: device type on new device: " + str3);
      } while ((!str3.equalsIgnoreCase("urn:Belkin:device:socket:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:sensor:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:lightswitch:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:controllee:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:LinksysWNCSensor:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:bridge:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:insight:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:AirPurifier:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:HeaterA:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:HeaterB:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:Humidifier:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:HumidifierB:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:Maker:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:CoffeeMaker:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:Crockpot:1")) && (!str3.equalsIgnoreCase("urn:Belkin:device:dimmer:1")));
      localDevice2.setSSDPPacket(paramSSDPPacket);
      SDKLogUtils.debugLog(TAG, "New Device Added UDN = " + str1);
    } while ((!addDevice(localDevice2)) || (!paramBoolean));
    performAddDeviceListener(localDevice2);
    return;
  }
  
  private void addDevice(Node paramNode)
  {
    SDKLogUtils.errorLog(TAG, "device added");
    devNodeList.add(paramNode);
  }
  
  private boolean addDevice(Device paramDevice)
  {
    Device localDevice = getDevice(paramDevice.getUDN());
    boolean bool = false;
    if (localDevice == null)
    {
      addDevice(paramDevice.getRootNode());
      bool = true;
    }
    return bool;
  }
  
  private void cleanups()
  {
    CountDownLatch localCountDownLatch = new CountDownLatch(1);
    ControlPointCleanupsRunnable localControlPointCleanupsRunnable = new ControlPointCleanupsRunnable(localCountDownLatch);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(localControlPointCleanupsRunnable);
    try
    {
      boolean bool = localCountDownLatch.await(2000L, TimeUnit.MILLISECONDS);
      SDKLogUtils.debugLog(TAG, "Control Point cleanups completed in time: " + bool);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      SDKLogUtils.errorLog(TAG, "InterruptedException while cleaning up Control Point: ", localInterruptedException);
    }
  }
  
  public static boolean didMSearchFail()
  {
    try
    {
      boolean bool = didMSearchFail;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private Device getDevice(Node paramNode)
  {
    if (paramNode == null) {}
    for (;;)
    {
      return null;
      try
      {
        Node localNode = paramNode.getNode("device");
        if (localNode != null)
        {
          Device localDevice = new Device(paramNode, localNode);
          return localDevice;
        }
      }
      catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
      {
        SDKLogUtils.errorLog(TAG, "ArrayIndexOutOfBoundsException in getDevice: ", localArrayIndexOutOfBoundsException);
      }
    }
    return null;
  }
  
  private String getEventSubCallbackURL(String paramString)
  {
    return HostInterface.getHostURL(paramString, getHTTPPort(), getEventSubURI());
  }
  
  private HTTPServerList getHTTPServerList()
  {
    return this.httpServerList;
  }
  
  private SSDPNotifySocketList getSSDPNotifySocketList()
  {
    return this.ssdpNotifySocketList;
  }
  
  private SSDPSearchResponseSocketList getSSDPSearchResponseSocketList()
  {
    return this.ssdpSearchResponseSocketList;
  }
  
  private boolean isLocationChange(String paramString, Device paramDevice, SSDPPacket paramSSDPPacket)
  {
    String str1 = paramSSDPPacket.getLocation();
    String str2 = paramDevice.getSSDPPacket().getLocation();
    SDKLogUtils.debugLog(TAG, "isLocationChanged; UDN: " + paramString + "; currentLocation: " + str1 + "; newLocation: " + str2);
    return !str1.equals(str2);
  }
  
  private void removeDevice(SSDPPacket paramSSDPPacket)
  {
    if (!paramSSDPPacket.isByeBye()) {
      return;
    }
    String str = USN.getUDN(paramSSDPPacket.getUSN());
    SDKLogUtils.errorLog(TAG, "removed UDN = " + str);
    removeDevice(str);
  }
  
  private void removeDevice(Node paramNode)
  {
    Device localDevice = getDevice(paramNode);
    if ((localDevice != null) && (localDevice.isRootDevice()))
    {
      SDKLogUtils.errorLog(TAG, "calling performRemoveDeviceListener");
      performRemoveDeviceListener(localDevice);
    }
    devNodeList.remove(paramNode);
  }
  
  public static void setMSearchFail(boolean paramBoolean)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "CloudCache: Set Flag - didMSearchFail: " + paramBoolean);
      didMSearchFail = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void addDevice(String paramString)
  {
    SDKLogUtils.infoLog(TAG, " Device String : " + paramString);
    try
    {
      Device localDevice = new Device();
      localDevice.loadDescription(paramString);
      if (addDevice(localDevice)) {
        performAddDeviceListener(localDevice);
      }
      return;
    }
    catch (InvalidDescriptionException localInvalidDescriptionException)
    {
      localInvalidDescriptionException.printStackTrace();
    }
  }
  
  public void addDeviceChangeListener(DeviceChangeListener paramDeviceChangeListener)
  {
    synchronized (this.deviceChangeListenerList)
    {
      this.deviceChangeListenerList.add(paramDeviceChangeListener);
      SDKLogUtils.debugLog(TAG, "addDeviceChangeListener: Listener added: " + paramDeviceChangeListener.getClass().getSimpleName());
      return;
    }
  }
  
  public void addEventListener(EventListener paramEventListener)
  {
    this.eventListenerList.add(paramEventListener);
  }
  
  public void addNotifyListener(NotifyListener paramNotifyListener)
  {
    this.deviceNotifyListenerList.add(paramNotifyListener);
  }
  
  public void addSearchResponseListener(SearchResponseListener paramSearchResponseListener)
  {
    this.deviceSearchResponseListenerList.add(paramSearchResponseListener);
  }
  
  public void finalizeCP()
  {
    SDKLogUtils.debugLog("Discovery", "finalizeCP");
    stop();
    devNodeList.clear();
  }
  
  public void forceClose()
  {
    devNodeList.clear();
    cleanups();
  }
  
  public Device getDevice(String paramString)
  {
    for (;;)
    {
      int j;
      try
      {
        int i = devNodeList.size();
        j = 0;
        if (j < i)
        {
          Device localDevice1 = getDevice(devNodeList.getNode(j));
          if (localDevice1 == null) {
            break label80;
          }
          if (localDevice1.isDevice(paramString) == true) {
            return localDevice1;
          }
          Device localDevice2 = localDevice1.getDevice(paramString);
          if (localDevice2 == null) {
            break label80;
          }
          return localDevice2;
        }
      }
      catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
      {
        SDKLogUtils.errorLog(TAG, "ArrayIndexOutOfBoundsException in getDevice: ", localArrayIndexOutOfBoundsException);
      }
      return null;
      label80:
      j++;
    }
  }
  
  public Device getDeviceBySubscriber(String paramString)
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++)
    {
      Device localDevice = localDeviceList.getDevice(j);
      if ((localDevice.getSubscriberService(paramString) != null) && (localDevice != null)) {
        return localDevice;
      }
    }
    return null;
  }
  
  public Disposer getDeviceDisposer()
  {
    return this.deviceDisposer;
  }
  
  public DeviceList getDeviceList()
  {
    DeviceList localDeviceList = new DeviceList();
    int i = devNodeList.size();
    for (int j = 0;; j++)
    {
      if (j < i) {
        try
        {
          Device localDevice = getDevice(devNodeList.getNode(j));
          if (localDevice == null) {
            continue;
          }
          localDeviceList.add(localDevice);
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
        }
      }
      return localDeviceList;
    }
  }
  
  public String getEventSubURI()
  {
    return this.eventSubURI;
  }
  
  public long getExpiredDeviceMonitoringInterval()
  {
    return this.expiredDeviceMonitoringInterval;
  }
  
  public int getHTTPPort()
  {
    return this.httpPort;
  }
  
  public RenewSubscriber getRenewSubscriber()
  {
    return this.renewSubscriber;
  }
  
  public int getSSDPPort()
  {
    return this.ssdpPort;
  }
  
  public int getSearchMx()
  {
    return this.searchMx;
  }
  
  public Service getSubscriberService(String paramString)
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++)
    {
      Service localService = localDeviceList.getDevice(j).getSubscriberService(paramString);
      if (localService != null) {
        return localService;
      }
    }
    return null;
  }
  
  public Object getUserData()
  {
    return this.userData;
  }
  
  public boolean hasDevice(String paramString)
  {
    return getDevice(paramString) != null;
  }
  
  public void httpRequestRecieved(HTTPRequest paramHTTPRequest)
  {
    if (Debug.isOn() == true) {
      paramHTTPRequest.print();
    }
    if (paramHTTPRequest.isNotifyRequest() == true)
    {
      NotifyRequest localNotifyRequest = new NotifyRequest(paramHTTPRequest);
      SDKLogUtils.infoLog(TAG, "http Request received notifications: " + localNotifyRequest.getContentString());
      Object localObject1;
      String str2;
      String str3;
      String str4;
      int i;
      if (localNotifyRequest.getContentString().contains("StateEvent"))
      {
        if (localNotifyRequest.getContentString().contains("</StatusChange>"))
        {
          SDKLogUtils.infoLog(TAG, "notifyReq.getContentString() : " + localNotifyRequest.getContentString());
          String[] arrayOfString3 = localNotifyRequest.getContentString().split("<StatusChange>", -1)[1].split("</StatusChange>", -1);
          boolean bool3 = arrayOfString3[0].contains("StateEvent");
          localObject1 = null;
          str2 = null;
          str3 = null;
          str4 = null;
          JSONArray localJSONArray3;
          if (bool3)
          {
            new JSONArray();
            arrayOfString3[0] = arrayOfString3[0].replaceAll("&lt;", "<");
            arrayOfString3[0] = arrayOfString3[0].replaceAll("&gt;", ">");
            arrayOfString3[0] = arrayOfString3[0].replaceAll("&amp;", "&");
            arrayOfString3[0] = arrayOfString3[0].replaceAll("&quot;", "\"");
            SDKLogUtils.infoLog(TAG, "Contains state event replaces: " + arrayOfString3[0]);
            if (arrayOfString3[0].contains("DeviceIDavailable=")) {
              arrayOfString3[0] = arrayOfString3[0].replace("DeviceIDavailable=", "DeviceID available=");
            }
            SDKLogUtils.infoLog(TAG, "Contains state event: " + arrayOfString3[0]);
            localJSONArray3 = new GetNotifyStatusResponseParser().parseNotifyStatusResponse(arrayOfString3[0]);
          }
          try
          {
            str2 = localJSONArray3.getJSONObject(0).getString(JSONConstants.NOTIFY_DEVICE_ID);
            str4 = localJSONArray3.getJSONObject(0).getString(JSONConstants.NOTIFY_VALUE);
            str3 = localJSONArray3.getJSONObject(0).getString(JSONConstants.NOTIFY_CAPABILITY_ID);
            String str11 = localJSONArray3.getJSONObject(0).getString("Availability");
            localObject1 = str11;
          }
          catch (JSONException localJSONException3)
          {
            for (;;)
            {
              String str10;
              String[] arrayOfString2;
              JSONArray localJSONArray2;
              localJSONException3.printStackTrace();
              localObject1 = null;
            }
          }
          str10 = str4 + "::" + str3 + "::" + (String)localObject1;
          performEventListener(localNotifyRequest.getSID(), str2, localNotifyRequest.getSEQ(), "StatusChange", str10);
          if (localNotifyRequest.getContentString().contains("</SubDeviceFWUpdate>"))
          {
            arrayOfString2 = localNotifyRequest.getContentString().split("<SubDeviceFWUpdate>")[1].split("</SubDeviceFWUpdate>");
            if (arrayOfString2[0].contains("StateEvent"))
            {
              new JSONArray();
              arrayOfString2[0] = arrayOfString2[0].replaceAll("&lt;", "<");
              arrayOfString2[0] = arrayOfString2[0].replaceAll("&gt;", ">");
              arrayOfString2[0] = arrayOfString2[0].replaceAll("&amp;", "&");
              arrayOfString2[0] = arrayOfString2[0].replaceAll("&quot;", "\"");
              localJSONArray2 = new GetNotifyStatusFirmwareParser().parseNotifyStatusResponse(arrayOfString2[0]);
            }
          }
        }
        try
        {
          str2 = localJSONArray2.getJSONObject(0).getString(JSONConstants.NOTIFY_DEVICE_ID);
          str4 = localJSONArray2.getJSONObject(0).getString(JSONConstants.NOTIFY_VALUE);
          String str9 = localJSONArray2.getJSONObject(0).getString(JSONConstants.NOTIFY_TYPE);
          str7 = str9;
        }
        catch (JSONException localJSONException2)
        {
          for (;;)
          {
            String str8;
            boolean bool1;
            Object localObject2;
            String[] arrayOfString1;
            boolean bool2;
            JSONArray localJSONArray1;
            localJSONException2.printStackTrace();
            String str7 = null;
          }
        }
        str8 = str2 + "::" + str7 + "::" + str4;
        performEventListener(localNotifyRequest.getSID(), str8, localNotifyRequest.getSEQ(), "SubDeviceFWUpdate", str4);
        bool1 = localNotifyRequest.getContentString().contains("</SensorChange>");
        i = 0;
        if (bool1)
        {
          localObject2 = "";
          SDKLogUtils.infoLog("notifyReq.getContentString()", localNotifyRequest.getContentString());
          arrayOfString1 = localNotifyRequest.getContentString().split("<SensorChange>", -1)[1].split("</SensorChange>", -1);
          bool2 = arrayOfString1[0].contains("StateEvent");
          i = 0;
          if (bool2)
          {
            new JSONArray();
            arrayOfString1[0] = arrayOfString1[0].replaceAll("&lt;", "<");
            arrayOfString1[0] = arrayOfString1[0].replaceAll("&gt;", ">");
            arrayOfString1[0] = arrayOfString1[0].replaceAll("&amp;", "&");
            arrayOfString1[0] = arrayOfString1[0].replaceAll("&quot;", "\"");
            SDKLogUtils.infoLog("XML", "Contains state event replaces: " + arrayOfString1[0]);
            if (arrayOfString1[0].contains("DeviceIDavailable=")) {
              arrayOfString1[0] = arrayOfString1[0].replace("DeviceIDavailable=", "DeviceID available=");
            }
            SDKLogUtils.infoLog("XML", "Contains state event: " + arrayOfString1[0]);
            localJSONArray1 = new GetNotifyStatusResponseParser().parseNotifyStatusResponse(arrayOfString1[0]);
          }
        }
        try
        {
          str2 = localJSONArray1.getJSONObject(0).getString(JSONConstants.NOTIFY_DEVICE_ID);
          str4 = localJSONArray1.getJSONObject(0).getString(JSONConstants.NOTIFY_VALUE);
          str3 = localJSONArray1.getJSONObject(0).getString(JSONConstants.NOTIFY_CAPABILITY_ID);
          localObject1 = localJSONArray1.getJSONObject(0).getString("Availability");
          String str6 = localJSONArray1.getJSONObject(0).getString("statusTS");
          localObject2 = str6;
        }
        catch (JSONException localJSONException1)
        {
          for (;;)
          {
            String str5;
            SDKLogUtils.errorLog("XML", "JSONException in getting values for sensorChange", localJSONException1);
          }
        }
        str5 = str4 + "::" + str3 + "::" + (String)localObject1 + "::" + (String)localObject2;
        SDKLogUtils.infoLog("state: ", str5);
        performEventListener(localNotifyRequest.getSID(), str2, localNotifyRequest.getSEQ(), "SensorChange", str5);
      }
      for (;;)
      {
        if (i == 0) {
          break label1282;
        }
        paramHTTPRequest.returnOK();
        return;
        SDKLogUtils.infoLog(TAG, "Contains state event replaces: in else:  " + localNotifyRequest.getContentString());
        localObject1 = null;
        str2 = null;
        str3 = null;
        str4 = null;
        break;
        String str1 = localNotifyRequest.getSID();
        long l = localNotifyRequest.getSEQ();
        PropertyList localPropertyList = localNotifyRequest.getPropertyList();
        i = 0;
        if (localPropertyList != null) {
          i = localPropertyList.size();
        }
        for (int j = 0; j < i; j++)
        {
          Property localProperty = localPropertyList.getProperty(j);
          performEventListener(str1, str1, l, localProperty.getName(), localProperty.getValue());
        }
      }
      label1282:
      paramHTTPRequest.returnBadRequest();
      return;
    }
    paramHTTPRequest.returnBadRequest();
  }
  
  public boolean isNMPRMode()
  {
    return this.nmprMode;
  }
  
  public boolean isSubscribed(Service paramService)
  {
    if (paramService == null) {
      return false;
    }
    return paramService.isSubscribed();
  }
  
  public void lock()
  {
    this.mutex.lock();
  }
  
  public void notifyReceived(SSDPPacket paramSSDPPacket)
  {
    if (paramSSDPPacket.isRootDevice() == true)
    {
      if (paramSSDPPacket.isAlive() != true) {
        break label33;
      }
      paramSSDPPacket.setNotify(true);
      addDevice(paramSSDPPacket, true);
    }
    for (;;)
    {
      performNotifyListener(paramSSDPPacket);
      return;
      label33:
      if (paramSSDPPacket.isByeBye() == true) {
        removeDevice(paramSSDPPacket);
      }
    }
  }
  
  public void performAddDeviceListener(Device paramDevice)
  {
    SDKLogUtils.errorLog(TAG, "start calling the added listener##########");
    synchronized (this.deviceChangeListenerList)
    {
      int i = this.deviceChangeListenerList.size();
      SDKLogUtils.debugLog(TAG, "performAddDeviceListener: deviceChangeListenerList size: " + i);
      int j = 0;
      for (;;)
      {
        if (j < i)
        {
          DeviceChangeListener localDeviceChangeListener = (DeviceChangeListener)this.deviceChangeListenerList.get(j);
          SDKLogUtils.errorLog(TAG, "calling the added listener##########");
          try
          {
            SDKLogUtils.debugLog(TAG, "performAddDeviceListener: calling listener: " + localDeviceChangeListener.getClass().getSimpleName());
            localDeviceChangeListener.deviceAdded(paramDevice);
            SDKLogUtils.errorLog(TAG, "end of current its ... calling the added listener##########");
            j++;
          }
          catch (Exception localException)
          {
            for (;;)
            {
              localException.printStackTrace();
            }
          }
        }
      }
    }
    SDKLogUtils.errorLog(TAG, "end calling the added listener##########");
  }
  
  public void performEventListener(String paramString1, String paramString2, long paramLong, String paramString3, String paramString4)
  {
    try
    {
      int i = this.eventListenerList.size();
      for (int j = 0; j < i; j++) {
        ((EventListener)this.eventListenerList.get(j)).eventNotifyReceived(paramString1, paramString2, paramLong, paramString3, paramString4);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void performNotifyListener(SSDPPacket paramSSDPPacket)
  {
    int i = this.deviceNotifyListenerList.size();
    int j = 0;
    for (;;)
    {
      if (j < i)
      {
        NotifyListener localNotifyListener = (NotifyListener)this.deviceNotifyListenerList.get(j);
        try
        {
          localNotifyListener.deviceNotifyReceived(paramSSDPPacket);
          j++;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Debug.warning("NotifyListener returned an error:", localException);
          }
        }
      }
    }
  }
  
  public void performRemoveDeviceListener(Device paramDevice)
  {
    synchronized (this.deviceChangeListenerList)
    {
      int i = this.deviceChangeListenerList.size();
      SDKLogUtils.debugLog(TAG, "performRemoveDeviceListener: deviceChangeListenerList size: " + i);
      for (int j = 0; j < i; j++)
      {
        DeviceChangeListener localDeviceChangeListener = (DeviceChangeListener)this.deviceChangeListenerList.get(j);
        SDKLogUtils.debugLog(TAG, "performRemoveDeviceListener: calling listener: " + localDeviceChangeListener.getClass().getSimpleName());
        localDeviceChangeListener.deviceRemoved(paramDevice);
      }
      return;
    }
  }
  
  public void performSearchResponseListener(SSDPPacket paramSSDPPacket)
  {
    int i = this.deviceSearchResponseListenerList.size();
    int j = 0;
    for (;;)
    {
      if (j < i)
      {
        SearchResponseListener localSearchResponseListener = (SearchResponseListener)this.deviceSearchResponseListenerList.get(j);
        try
        {
          localSearchResponseListener.deviceSearchResponseReceived(paramSSDPPacket);
          j++;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Debug.warning("SearchResponseListener returned an error:", localException);
          }
        }
      }
    }
  }
  
  public void print()
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    Debug.message("Device Num = " + i);
    for (int j = 0; j < i; j++)
    {
      Device localDevice = localDeviceList.getDevice(j);
      Debug.message("[" + j + "] " + localDevice.getFriendlyName() + ", " + localDevice.getLeaseTime() + ", " + localDevice.getElapsedTime());
    }
  }
  
  public void removeAllDevices()
  {
    devNodeList.clear();
  }
  
  public void removeDevice(String paramString)
  {
    removeDevice(getDevice(paramString));
  }
  
  protected void removeDevice(Device paramDevice)
  {
    if (paramDevice == null) {
      return;
    }
    removeDevice(paramDevice.getRootNode());
  }
  
  public void removeDeviceChangeListener(DeviceChangeListener paramDeviceChangeListener)
  {
    synchronized (this.deviceChangeListenerList)
    {
      this.deviceChangeListenerList.remove(paramDeviceChangeListener);
      SDKLogUtils.debugLog(TAG, "removeDeviceChangeListener: Listener removed: " + paramDeviceChangeListener.getClass().getSimpleName());
      return;
    }
  }
  
  public void removeEventListener(EventListener paramEventListener)
  {
    this.eventListenerList.remove(paramEventListener);
  }
  
  public void removeExpiredDevices()
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    Device[] arrayOfDevice = new Device[i];
    for (int j = 0; j < i; j++) {
      arrayOfDevice[j] = localDeviceList.getDevice(j);
    }
    for (int k = 0; k < i; k++) {
      if (arrayOfDevice[k].isExpired() == true)
      {
        Debug.message("Expired device =  " + arrayOfDevice[k].getFriendlyName());
        SDKLogUtils.debugLog(TAG, "Removing expired device: " + arrayOfDevice[k]);
        removeDevice(arrayOfDevice[k]);
      }
    }
  }
  
  public void removeNotifyListener(NotifyListener paramNotifyListener)
  {
    this.deviceNotifyListenerList.remove(paramNotifyListener);
  }
  
  public void removeSearchResponseListener(SearchResponseListener paramSearchResponseListener)
  {
    this.deviceSearchResponseListenerList.remove(paramSearchResponseListener);
  }
  
  public void renewSubscriberService()
  {
    renewSubscriberService(-1L);
  }
  
  public void renewSubscriberService(long paramLong)
  {
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++) {
      renewSubscriberService(localDeviceList.getDevice(j), paramLong);
    }
  }
  
  public void renewSubscriberService(Device paramDevice, long paramLong)
  {
    ServiceList localServiceList = paramDevice.getServiceList();
    int i = localServiceList.size();
    int j = 0;
    if (j < i)
    {
      Service localService = localServiceList.getService(j);
      if (!localService.isSubscribed()) {}
      for (;;)
      {
        j++;
        break;
        if (!subscribe(localService, localService.getSID(), paramLong)) {
          subscribe(localService, paramLong);
        }
      }
    }
    DeviceList localDeviceList = paramDevice.getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0; m < k; m++) {
      renewSubscriberService(localDeviceList.getDevice(m), paramLong);
    }
  }
  
  public boolean search(int paramInt)
  {
    try
    {
      SDKLogUtils.infoLog(TAG, "ControlPoint search() sending mSearch. MX: " + paramInt);
      boolean bool = search("urn:Belkin:service:basicevent:1", paramInt);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean search(String paramString)
  {
    try
    {
      SDKLogUtils.infoLog(TAG, "ControlPoint search(String target) sending mSearch");
      boolean bool = search(paramString, 2);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean search(String paramString, int paramInt)
  {
    try
    {
      SSDPSearchRequest localSSDPSearchRequest = new SSDPSearchRequest(paramString, paramInt);
      boolean bool = getSSDPSearchResponseSocketList().post(localSSDPSearchRequest);
      SDKLogUtils.debugLog(TAG, "ControlPoint search(String target, int mx) POST response: " + bool);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void searchResponseReceived(SSDPPacket paramSSDPPacket)
  {
    searchResponseReceived(paramSSDPPacket, false, false);
  }
  
  public void searchResponseReceived(SSDPPacket paramSSDPPacket, boolean paramBoolean1, boolean paramBoolean2)
  {
    SDKLogUtils.debugLog(TAG, "SSDP Packet received. isViaCloudCache: " + paramBoolean1 + "; isViaUnicast: " + paramBoolean2);
    if ((!paramBoolean1) && (!paramBoolean2)) {}
    try
    {
      setMSearchFail(false);
      boolean bool;
      if (paramSSDPPacket.isRootDevice() == true)
      {
        bool = false;
        if (!paramBoolean2) {
          break label76;
        }
      }
      for (;;)
      {
        addDevice(paramSSDPPacket, bool);
        performSearchResponseListener(paramSSDPPacket);
        return;
        label76:
        bool = true;
      }
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception in searchResponseReceived(): ", localException);
    }
  }
  
  public void setDeviceDisposer(Disposer paramDisposer)
  {
    this.deviceDisposer = paramDisposer;
  }
  
  public void setEventSubURI(String paramString)
  {
    this.eventSubURI = paramString;
  }
  
  public void setExpiredDeviceMonitoringInterval(long paramLong)
  {
    this.expiredDeviceMonitoringInterval = paramLong;
  }
  
  public void setHTTPPort(int paramInt)
  {
    this.httpPort = paramInt;
  }
  
  public void setNMPRMode(boolean paramBoolean)
  {
    this.nmprMode = paramBoolean;
  }
  
  public void setRenewSubscriber(RenewSubscriber paramRenewSubscriber)
  {
    this.renewSubscriber = paramRenewSubscriber;
  }
  
  public void setSSDPPort(int paramInt)
  {
    this.ssdpPort = paramInt;
  }
  
  public void setSSID(String paramString)
  {
    this.mSSID = paramString;
  }
  
  public void setSearchMx(int paramInt)
  {
    this.searchMx = paramInt;
  }
  
  public void setUserData(Object paramObject)
  {
    this.userData = paramObject;
  }
  
  public boolean start()
  {
    SDKLogUtils.debugLog(TAG, "Starting control point");
    return start("urn:Belkin:service:basicevent:1", 2);
  }
  
  public boolean start(String paramString)
  {
    return start(paramString, 2);
  }
  
  public boolean start(String paramString, int paramInt)
  {
    try
    {
      stop();
      SDKLogUtils.infoLog(TAG, "Control Point start :: After Stop");
      int i = 0;
      j = getHTTPPort();
      localHTTPServerList = getHTTPServerList();
      if (!localHTTPServerList.open(j))
      {
        i++;
        if (100 < i) {
          return false;
        }
      }
    }
    catch (Exception localException)
    {
      HTTPServerList localHTTPServerList;
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "Control Point start  :: Exception in Stop ");
        continue;
        setHTTPPort(j + 1);
        int j = getHTTPPort();
      }
      localHTTPServerList.addRequestListener(this);
      localHTTPServerList.start();
      SSDPNotifySocketList localSSDPNotifySocketList = getSSDPNotifySocketList();
      if (!localSSDPNotifySocketList.open()) {
        return false;
      }
      localSSDPNotifySocketList.setControlPoint(this);
      localSSDPNotifySocketList.start();
      int k = getSSDPPort();
      int m = 0;
      SSDPSearchResponseSocketList localSSDPSearchResponseSocketList = getSSDPSearchResponseSocketList();
      while (!localSSDPSearchResponseSocketList.open(k))
      {
        m++;
        if (100 < m) {
          return false;
        }
        setSSDPPort(k + 1);
        k = getSSDPPort();
      }
      localSSDPSearchResponseSocketList.setControlPoint(this);
      localSSDPSearchResponseSocketList.start();
      Disposer localDisposer = new Disposer(this);
      setDeviceDisposer(localDisposer);
      localDisposer.start();
      if (isNMPRMode() == true)
      {
        RenewSubscriber localRenewSubscriber = new RenewSubscriber(this);
        setRenewSubscriber(localRenewSubscriber);
        localRenewSubscriber.start();
      }
    }
    return true;
  }
  
  public boolean stop()
  {
    cleanups();
    return true;
  }
  
  public boolean subscribe(Service paramService)
  {
    SDKLogUtils.infoLog(TAG, "Subscribe :: applied");
    return subscribe(paramService, -1L);
  }
  
  public boolean subscribe(Service paramService, long paramLong)
  {
    SDKLogUtils.infoLog(TAG, " UPnPImpl Subscribe :: Device fetched from Service Object" + paramService.getDevice().getUDN() + " :: Service Subscription Status = " + paramService.isSubscribed());
    boolean bool;
    if (paramService.isSubscribed() == true) {
      bool = subscribe(paramService, paramService.getSID(), paramLong);
    }
    Device localDevice;
    do
    {
      return bool;
      localDevice = paramService.getRootDevice();
      bool = false;
    } while (localDevice == null);
    String str = localDevice.getInterfaceAddress();
    SubscriptionRequest localSubscriptionRequest = new SubscriptionRequest();
    localSubscriptionRequest.setSubscribeRequest(paramService, getEventSubCallbackURL(str), paramLong);
    SubscriptionResponse localSubscriptionResponse = localSubscriptionRequest.post();
    if (localSubscriptionResponse.isSuccessful() == true)
    {
      paramService.setSID(localSubscriptionResponse.getSID());
      paramService.setTimeout(localSubscriptionResponse.getTimeout());
      SDKLogUtils.infoLog(TAG, "UPnPImpl Subscribe :: Subscription Successful :: " + localDevice.getUDN());
      return true;
    }
    paramService.clearSID();
    SDKLogUtils.errorLog(TAG, "UPnPImpl Subscribe :: Subscription failed" + localDevice.getUDN());
    return false;
  }
  
  public boolean subscribe(Service paramService, String paramString)
  {
    return subscribe(paramService, paramString, -1L);
  }
  
  public boolean subscribe(Service paramService, String paramString, long paramLong)
  {
    SubscriptionRequest localSubscriptionRequest = new SubscriptionRequest();
    localSubscriptionRequest.setRenewRequest(paramService, paramString, paramLong);
    if (Debug.isOn() == true) {
      localSubscriptionRequest.print();
    }
    SubscriptionResponse localSubscriptionResponse = localSubscriptionRequest.post();
    if (Debug.isOn() == true) {
      localSubscriptionResponse.print();
    }
    if (localSubscriptionResponse.isSuccessful() == true)
    {
      paramService.setSID(localSubscriptionResponse.getSID());
      paramService.setTimeout(localSubscriptionResponse.getTimeout());
      return true;
    }
    paramService.clearSID();
    return false;
  }
  
  public void unlock()
  {
    this.mutex.unlock();
  }
  
  public void unsubscribe()
  {
    SDKLogUtils.infoLog(TAG, "Subscribe :: unsubscribe() removed");
    DeviceList localDeviceList = getDeviceList();
    int i = localDeviceList.size();
    for (int j = 0; j < i; j++) {
      unsubscribe(localDeviceList.getDevice(j));
    }
  }
  
  public void unsubscribe(Device paramDevice)
  {
    SDKLogUtils.infoLog(TAG, "UPnPImpl Subscribe :: UnSubscription Called");
    ServiceList localServiceList = paramDevice.getServiceList();
    int i = localServiceList.size();
    for (int j = 0; j < i; j++)
    {
      Service localService = localServiceList.getService(j);
      if (localService.hasSID() == true) {
        unsubscribe(localService);
      }
    }
    DeviceList localDeviceList = paramDevice.getDeviceList();
    int k = localDeviceList.size();
    for (int m = 0; m < k; m++) {
      unsubscribe(localDeviceList.getDevice(m));
    }
  }
  
  public boolean unsubscribe(Service paramService)
  {
    SubscriptionRequest localSubscriptionRequest = new SubscriptionRequest();
    localSubscriptionRequest.setUnsubscribeRequest(paramService);
    if (localSubscriptionRequest.post().isSuccessful() == true)
    {
      paramService.clearSID();
      return true;
    }
    return false;
  }
  
  public void updateDevice(Device paramDevice)
    throws ParserException
  {
    SDKLogUtils.debugLog(TAG, "Updating device: " + paramDevice.getUDN());
    removeDevice(paramDevice);
    addDevice(paramDevice.getSSDPPacket(), true);
  }
  
  private class ControlPointCleanupsRunnable
    extends WeMoRunnable
  {
    private CountDownLatch timeoutLatch;
    
    public ControlPointCleanupsRunnable(CountDownLatch paramCountDownLatch)
    {
      this.timeoutLatch = paramCountDownLatch;
    }
    
    public void run()
    {
      SSDPNotifySocketList localSSDPNotifySocketList = ControlPoint.this.getSSDPNotifySocketList();
      localSSDPNotifySocketList.stop();
      localSSDPNotifySocketList.close();
      localSSDPNotifySocketList.clear();
      SSDPSearchResponseSocketList localSSDPSearchResponseSocketList = ControlPoint.this.getSSDPSearchResponseSocketList();
      localSSDPSearchResponseSocketList.stop();
      localSSDPSearchResponseSocketList.close();
      localSSDPSearchResponseSocketList.clear();
      HTTPServerList localHTTPServerList = ControlPoint.this.getHTTPServerList();
      localHTTPServerList.stop();
      localHTTPServerList.close();
      localHTTPServerList.clear();
      Disposer localDisposer = ControlPoint.this.getDeviceDisposer();
      if (localDisposer != null)
      {
        localDisposer.stop();
        ControlPoint.this.setDeviceDisposer(null);
      }
      RenewSubscriber localRenewSubscriber = ControlPoint.this.getRenewSubscriber();
      if (localRenewSubscriber != null)
      {
        localRenewSubscriber.stop();
        ControlPoint.this.setRenewSubscriber(null);
      }
      if (this.timeoutLatch != null) {
        this.timeoutLatch.countDown();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ControlPoint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */