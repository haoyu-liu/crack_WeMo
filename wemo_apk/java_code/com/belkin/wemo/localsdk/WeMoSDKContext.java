package com.belkin.wemo.localsdk;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.localsdk.parser.AttributeNotificationParser;
import com.belkin.wemo.storage.FileStorage;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.cybergarage.upnp.Service;
import org.cybergarage.upnp.ServiceList;
import org.cybergarage.upnp.device.DeviceChangeListener;
import org.cybergarage.upnp.event.EventListener;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.xml.ParserException;
import org.cybergarage.xml.SetAttributeResponseParser;
import org.json.JSONException;
import org.json.JSONObject;

public class WeMoSDKContext
  implements DeviceChangeListener, EventListener
{
  public static final String ADD_DEVICE = "add";
  public static final String BULB_FW_UPDATE = "SubDeviceFWUpdate";
  public static final String CHANGE_ATTRIBUTE = "change_attribute";
  public static final String CHANGE_STATE = "change_state";
  public static final String COUNTDOWN_TIME = "CountdownEndTime";
  public static final int MSEARCH_CONCURRENT_ATTEMPT = 2;
  public static final int MSEARCH_CONCURRENT_INTERVAL = 200;
  public static final int MSEARCH_FINAL_INTERVAL = 500;
  public static final int MSEARCH_INTERVAL = 600;
  public static final int MSEARCH_ITERATION = 3;
  public static final String REFRESH_LIST = "refresh";
  public static final String REMOVE_DEVICE = "remove";
  public static final String SET_ATTRIBUTE = "set_attribute";
  public static final String SET_STATE = "set_state";
  public static final String TIME_SYNC = "TimeSync";
  public static final String UPDATE_DEVICE = "update";
  public static final String UPDATE_FIRMWARE = "update_firmware";
  private static WeMoSDKContext mWeMoSDKInstance = null;
  private final int ADD_DEVICE_TO_CACHE = 3;
  private final int GET_DEVICE_BY_SID = 1;
  private final int GET_DEVICE_BY_UDN = 0;
  private final int GET_DEVICE_LIST = 2;
  private final int REMOVE_DEVICE_FROM_CACHE = 4;
  private String TAG = "WeMoSDKContext";
  private boolean checkIfServiceFilesReload = false;
  private Context context = null;
  private boolean isNotificationComes = false;
  private String lastSSID = "";
  private ArrayList<WeMoDevice> mActiveDeviceList = null;
  private ControlPoint mControlPoint = null;
  private CopyOnWriteArrayList<WeMoDevice> mDeviceCache = null;
  private ArrayList<NotificationListener> mListeners = new ArrayList();
  private Object mutex = new Object();
  private boolean serviceFilesSynched = false;
  
  public WeMoSDKContext(Context paramContext)
  {
    FileStorage.getInstance(paramContext);
    this.context = paramContext;
    this.mDeviceCache = new CopyOnWriteArrayList();
    this.mActiveDeviceList = new ArrayList();
    if (NetworkMode.isLocal()) {
      initControlPoint(paramContext);
    }
    SDKLogUtils.infoLog("ZZZ", "WeMoSDKContext constructor call");
  }
  
  /* Error */
  private void checkIfServiceFilesReload(Device paramDevice, String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   4: istore 6
    //   6: iload 6
    //   8: ifeq +9 -> 17
    //   11: aload_0
    //   12: iconst_0
    //   13: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   16: return
    //   17: aload_0
    //   18: iconst_1
    //   19: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   22: aload_2
    //   23: ifnull +282 -> 305
    //   26: aload_2
    //   27: astore 11
    //   29: aload_1
    //   30: invokevirtual 193	org/cybergarage/upnp/Device:getFirmwareVersion	()Ljava/lang/String;
    //   33: astore 10
    //   35: aload_0
    //   36: getfield 100	com/belkin/wemo/localsdk/WeMoSDKContext:TAG	Ljava/lang/String;
    //   39: new 195	java/lang/StringBuilder
    //   42: dup
    //   43: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   46: ldc -58
    //   48: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   51: aload 10
    //   53: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   56: ldc -52
    //   58: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   61: aload 11
    //   63: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: ldc -50
    //   68: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: aload_3
    //   72: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: ldc -48
    //   77: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: aload_0
    //   81: getfield 112	com/belkin/wemo/localsdk/WeMoSDKContext:mutex	Ljava/lang/Object;
    //   84: invokevirtual 212	java/lang/Object:hashCode	()I
    //   87: invokevirtual 215	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   90: invokevirtual 218	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   93: invokestatic 221	com/belkin/wemo/cache/utils/SDKLogUtils:verboseLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   96: aload 10
    //   98: ifnull +28 -> 126
    //   101: aload 11
    //   103: ifnull +23 -> 126
    //   106: aload 10
    //   108: invokevirtual 226	java/lang/String:trim	()Ljava/lang/String;
    //   111: aload 11
    //   113: invokevirtual 226	java/lang/String:trim	()Ljava/lang/String;
    //   116: invokevirtual 230	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   119: istore 12
    //   121: iload 12
    //   123: ifeq +9 -> 132
    //   126: aload_0
    //   127: iconst_0
    //   128: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   131: return
    //   132: aload_0
    //   133: getfield 112	com/belkin/wemo/localsdk/WeMoSDKContext:mutex	Ljava/lang/Object;
    //   136: astore 13
    //   138: aload 13
    //   140: monitorenter
    //   141: aload 10
    //   143: invokevirtual 226	java/lang/String:trim	()Ljava/lang/String;
    //   146: aload 11
    //   148: invokevirtual 226	java/lang/String:trim	()Ljava/lang/String;
    //   151: invokevirtual 230	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   154: ifne +89 -> 243
    //   157: aload_0
    //   158: aload_1
    //   159: aload_3
    //   160: invokespecial 234	com/belkin/wemo/localsdk/WeMoSDKContext:synchFiles	(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    //   163: aload 13
    //   165: monitorexit
    //   166: ldc -20
    //   168: new 195	java/lang/StringBuilder
    //   171: dup
    //   172: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   175: ldc -18
    //   177: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   180: aload 10
    //   182: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: ldc -52
    //   187: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: aload 11
    //   192: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   195: ldc -16
    //   197: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   200: aload_3
    //   201: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: ldc -48
    //   206: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload_0
    //   210: getfield 112	com/belkin/wemo/localsdk/WeMoSDKContext:mutex	Ljava/lang/Object;
    //   213: invokevirtual 212	java/lang/Object:hashCode	()I
    //   216: invokevirtual 215	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   219: ldc -16
    //   221: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   224: aload_0
    //   225: getfield 108	com/belkin/wemo/localsdk/WeMoSDKContext:serviceFilesSynched	Z
    //   228: invokevirtual 243	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   231: invokevirtual 218	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   234: invokestatic 221	com/belkin/wemo/cache/utils/SDKLogUtils:verboseLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   237: aload_0
    //   238: iconst_0
    //   239: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   242: return
    //   243: aload 13
    //   245: monitorexit
    //   246: aload_0
    //   247: iconst_0
    //   248: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   251: return
    //   252: astore 14
    //   254: aload 13
    //   256: monitorexit
    //   257: aload 14
    //   259: athrow
    //   260: astore 5
    //   262: ldc -20
    //   264: new 195	java/lang/StringBuilder
    //   267: dup
    //   268: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   271: ldc -11
    //   273: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   276: aload_3
    //   277: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   280: ldc -9
    //   282: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   285: aload 5
    //   287: invokevirtual 250	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   290: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   293: invokevirtual 218	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   296: invokestatic 253	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   299: aload_0
    //   300: iconst_0
    //   301: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   304: return
    //   305: aload_0
    //   306: getfield 108	com/belkin/wemo/localsdk/WeMoSDKContext:serviceFilesSynched	Z
    //   309: istore 7
    //   311: iload 7
    //   313: ifeq +9 -> 322
    //   316: aload_0
    //   317: iconst_0
    //   318: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   321: return
    //   322: aload_0
    //   323: getfield 112	com/belkin/wemo/localsdk/WeMoSDKContext:mutex	Ljava/lang/Object;
    //   326: astore 8
    //   328: aload 8
    //   330: monitorenter
    //   331: aload_0
    //   332: aload_1
    //   333: aload_3
    //   334: invokespecial 234	com/belkin/wemo/localsdk/WeMoSDKContext:synchFiles	(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    //   337: aload_0
    //   338: iconst_1
    //   339: putfield 108	com/belkin/wemo/localsdk/WeMoSDKContext:serviceFilesSynched	Z
    //   342: aload 8
    //   344: monitorexit
    //   345: aconst_null
    //   346: astore 10
    //   348: aconst_null
    //   349: astore 11
    //   351: goto -185 -> 166
    //   354: astore 9
    //   356: aload 8
    //   358: monitorexit
    //   359: aload 9
    //   361: athrow
    //   362: astore 4
    //   364: aload_0
    //   365: iconst_0
    //   366: putfield 110	com/belkin/wemo/localsdk/WeMoSDKContext:checkIfServiceFilesReload	Z
    //   369: aload 4
    //   371: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	372	0	this	WeMoSDKContext
    //   0	372	1	paramDevice	Device
    //   0	372	2	paramString1	String
    //   0	372	3	paramString2	String
    //   362	8	4	localObject1	Object
    //   260	26	5	localException	Exception
    //   4	3	6	bool1	boolean
    //   309	3	7	bool2	boolean
    //   354	6	9	localObject3	Object
    //   33	314	10	str1	String
    //   27	323	11	str2	String
    //   119	3	12	bool3	boolean
    //   252	6	14	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   141	166	252	finally
    //   243	246	252	finally
    //   254	257	252	finally
    //   0	6	260	java/lang/Exception
    //   17	22	260	java/lang/Exception
    //   29	96	260	java/lang/Exception
    //   106	121	260	java/lang/Exception
    //   132	141	260	java/lang/Exception
    //   166	237	260	java/lang/Exception
    //   257	260	260	java/lang/Exception
    //   305	311	260	java/lang/Exception
    //   322	331	260	java/lang/Exception
    //   359	362	260	java/lang/Exception
    //   331	345	354	finally
    //   356	359	354	finally
    //   0	6	362	finally
    //   17	22	362	finally
    //   29	96	362	finally
    //   106	121	362	finally
    //   132	141	362	finally
    //   166	237	362	finally
    //   257	260	362	finally
    //   262	299	362	finally
    //   305	311	362	finally
    //   322	331	362	finally
    //   359	362	362	finally
  }
  
  private String createAttributeList(JSONObject paramJSONObject)
  {
    localStringBuffer = new StringBuffer();
    try
    {
      Iterator localIterator = paramJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuffer.append("<attribute>");
        localStringBuffer.append("<name>");
        JSONObject localJSONObject = paramJSONObject.getJSONObject(str);
        localStringBuffer.append(str);
        localStringBuffer.append("</name>");
        localStringBuffer.append("<value>");
        localStringBuffer.append(localJSONObject.optString("value"));
        localStringBuffer.append("</value>");
        localStringBuffer.append("</attribute>");
      }
      return localStringBuffer.toString();
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      SDKLogUtils.verboseLog(this.TAG, "str.toString():::::::;" + localStringBuffer.toString());
    }
  }
  
  private String createAttributeList(JSONObject paramJSONObject, WeMoDevice paramWeMoDevice)
  {
    String[] arrayOfString = { "Switch", "Sensor", "SwitchMode", "SensorPresent" };
    StringBuffer localStringBuffer = new StringBuffer();
    for (;;)
    {
      int i;
      String str2;
      try
      {
        paramWeMoDevice.getDevice().getAttributeList();
        localJSONObject = new JSONObject(paramWeMoDevice.getAttribute());
        i = 0;
        if (i < arrayOfString.length)
        {
          Iterator localIterator = localJSONObject.keys();
          if (!localIterator.hasNext()) {
            break label317;
          }
          str1 = (String)localIterator.next();
        }
      }
      catch (JSONException localJSONException)
      {
        JSONObject localJSONObject;
        String str1;
        String str3;
        localJSONException.printStackTrace();
        SDKLogUtils.verboseLog(this.TAG + ".createAttributeList", "str.toString():::::::;" + localStringBuffer.toString());
        return localStringBuffer.toString();
      }
      try
      {
        str3 = paramJSONObject.getString(str1);
        str2 = str3;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        str2 = null;
        continue;
      }
      if (arrayOfString[i].equals(str1))
      {
        localStringBuffer.append("<attribute>");
        localStringBuffer.append("<name>");
        localStringBuffer.append(str1);
        localStringBuffer.append("</name>");
        localStringBuffer.append("<value>");
        if ((!str2.equals("null")) && (!str2.equals(null)) && (!str2.equals(""))) {
          localJSONObject.getJSONObject(str1).put("value", str2);
        }
        localStringBuffer.append(str2);
        localStringBuffer.append("</value>");
        localStringBuffer.append("</attribute>");
        continue;
        label317:
        i++;
      }
    }
  }
  
  public static String getFilteredUDN(String paramString)
  {
    return paramString.replace(":switch:sensor", ":sensor:switch");
  }
  
  public static WeMoSDKContext getInstance(Context paramContext)
  {
    try
    {
      if (mWeMoSDKInstance == null) {
        mWeMoSDKInstance = new WeMoSDKContext(paramContext);
      }
      WeMoSDKContext localWeMoSDKContext = mWeMoSDKInstance;
      return localWeMoSDKContext;
    }
    finally {}
  }
  
  private String getSSID(Context paramContext)
  {
    String str = ((WifiManager)paramContext.getSystemService("wifi")).getConnectionInfo().getSSID();
    if (str == null) {
      return "";
    }
    return str.replaceAll("\"", "").trim();
  }
  
  private WeMoDevice getWeMoDeviceBySID(String paramString)
  {
    return (WeMoDevice)performActionWithCache(1, paramString);
  }
  
  public static WeMoSDKContext getWeMoSDKInstance()
  {
    try
    {
      WeMoSDKContext localWeMoSDKContext = mWeMoSDKInstance;
      return localWeMoSDKContext;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void initControlPoint(Context paramContext)
  {
    if (this.mControlPoint != null) {
      this.mControlPoint.stop();
    }
    this.mControlPoint = new ControlPoint();
    String str = getSSID(paramContext);
    this.mControlPoint.setSSID(str);
    this.lastSSID = str;
    this.mControlPoint.start();
    try
    {
      Thread.sleep(100L);
      startListen();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;) {}
    }
  }
  
  private boolean isSmart(String paramString)
  {
    return (paramString.contains("Heater")) || (paramString.contains("Humidifier")) || (paramString.contains("AirPurifier")) || (paramString.contains("CoffeeMaker"));
  }
  
  private boolean isUDNinList(String paramString)
  {
    Iterator localIterator = this.mActiveDeviceList.iterator();
    while (localIterator.hasNext()) {
      if (((WeMoDevice)localIterator.next()).getUDN().equals(paramString)) {
        return true;
      }
    }
    return false;
  }
  
  private Object performActionWithCache(int paramInt, Object paramObject)
  {
    Object localObject1 = null;
    switch (paramInt)
    {
    }
    for (;;)
    {
      return localObject1;
      try
      {
        Iterator localIterator3 = this.mDeviceCache.iterator();
        while (localIterator3.hasNext())
        {
          WeMoDevice localWeMoDevice3 = (WeMoDevice)localIterator3.next();
          if (localWeMoDevice3.getUDN().equals((String)paramObject)) {
            localObject1 = localWeMoDevice3;
          }
        }
        Iterator localIterator2 = this.mDeviceCache.iterator();
        while (localIterator2.hasNext())
        {
          WeMoDevice localWeMoDevice2 = (WeMoDevice)localIterator2.next();
          if (localWeMoDevice2.getDevice().getSubscriberService((String)paramObject) != null) {
            localObject1 = localWeMoDevice2;
          }
        }
        CopyOnWriteArrayList localCopyOnWriteArrayList = new CopyOnWriteArrayList();
        Iterator localIterator1 = this.mDeviceCache.iterator();
        while (localIterator1.hasNext())
        {
          WeMoDevice localWeMoDevice1 = (WeMoDevice)localIterator1.next();
          if (localWeMoDevice1.isAvailable()) {
            localCopyOnWriteArrayList.add(localWeMoDevice1.getUDN());
          }
        }
        localObject1 = localCopyOnWriteArrayList;
      }
      finally {}
      continue;
      if (getWeMoDeviceByUDN(((WeMoDevice)paramObject).getUDN()) == null)
      {
        this.mDeviceCache.add((WeMoDevice)paramObject);
        localObject1 = Boolean.valueOf(true);
      }
      else
      {
        localObject1 = Boolean.valueOf(false);
        continue;
        Boolean localBoolean = Boolean.valueOf(this.mDeviceCache.remove((WeMoDevice)paramObject));
        localObject1 = localBoolean;
      }
    }
  }
  
  private void saveDeviceCache()
  {
    try
    {
      JSONObject localJSONObject1 = new JSONObject();
      Iterator localIterator = this.mDeviceCache.iterator();
      while (localIterator.hasNext())
      {
        WeMoDevice localWeMoDevice = (WeMoDevice)localIterator.next();
        if (localWeMoDevice.isAvailable())
        {
          JSONObject localJSONObject2 = new JSONObject();
          localJSONObject2.put("friendlyName", localWeMoDevice.getFriendlyName());
          localJSONObject2.put("type", localWeMoDevice.getType());
          localJSONObject2.put("udn", localWeMoDevice.getUDN());
          localJSONObject2.put("iconUrl", localWeMoDevice.getLogo());
          localJSONObject1.put(localWeMoDevice.getUDN(), localJSONObject2);
        }
      }
      FileStorage.getInstance(null).saveDeviceCache(localJSONObject1.toString());
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog(getClass().getName(), "Save device cache error " + localJSONException.toString());
      return;
    }
  }
  
  private void sendNotification(String paramString1, String paramString2, String paramString3)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
    {
      NotificationListener localNotificationListener = (NotificationListener)localIterator.next();
      if (localNotificationListener != null) {
        localNotificationListener.onNotify(paramString1, paramString2, paramString3);
      }
    }
  }
  
  private void setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if ((paramAction != null) && (paramArrayOfString1 != null) && (paramArrayOfString2 != null)) {
      for (int i = 0; i < paramArrayOfString1.length; i++) {
        paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      }
    }
  }
  
  private void startListen()
  {
    if (this.mControlPoint != null)
    {
      this.mControlPoint.addDeviceChangeListener(this);
      this.mControlPoint.addEventListener(this);
    }
  }
  
  private void stopListen()
  {
    if (this.mControlPoint != null)
    {
      this.mControlPoint.removeDeviceChangeListener(this);
      this.mControlPoint.removeEventListener(this);
    }
  }
  
  private boolean subscribeToService(Device paramDevice)
  {
    ServiceList localServiceList = paramDevice.getServiceList();
    for (int i = 0; i < localServiceList.size(); i++)
    {
      Service localService = localServiceList.getService(i);
      String str = localService.getServiceType();
      if ((str.equals("urn:Belkin:service:basicevent:1")) || (str.equals("urn:Belkin:service:firmwareupdate:1")) || (str.equals("urn:Belkin:service:timesync:1")) || (str.equals("urn:Belkin:service:bridge:1")) || ((str.equals("urn:Belkin:service:deviceevent:1")) && (isSmart(paramDevice.getDeviceType()))))
      {
        SDKLogUtils.infoLog("sdk wemosdkcontext: inside", "sdk wemosdkcontext: inside" + str);
        if ((!this.mControlPoint.subscribe(localService)) && (!this.mControlPoint.subscribe(localService))) {
          return false;
        }
      }
    }
    return true;
  }
  
  private void synchFiles(Device paramDevice, String paramString)
    throws MalformedURLException, ParserException
  {
    URL localURL = new URL(paramDevice.getSSDPPacket().getLocation());
    FileStorage localFileStorage = FileStorage.getInstance(null);
    localFileStorage.setReload(true);
    SDKLogUtils.infoLog(this.TAG, "syncFiles function is called :: " + localURL);
    localFileStorage.getDescriptionFile(localURL, paramString);
    if (this.mControlPoint != null) {
      this.mControlPoint.updateDevice(paramDevice);
    }
  }
  
  private String updateAttributeList(String paramString, WeMoDevice paramWeMoDevice)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("<attributelist>");
    localStringBuffer.append(paramString);
    localStringBuffer.append("</attributelist>");
    JSONObject localJSONObject1 = new AttributeNotificationParser().parseAttributeRespone(localStringBuffer.toString());
    localObject = null;
    if (localJSONObject1 != null) {}
    for (;;)
    {
      try
      {
        localJSONObject2 = new JSONObject(paramWeMoDevice.getAttribute());
        try
        {
          Iterator localIterator = localJSONObject1.keys();
          if (!localIterator.hasNext()) {
            continue;
          }
          str1 = (String)localIterator.next();
          if ((!localJSONObject1.has(str1)) || (!localJSONObject2.has(str1))) {
            continue;
          }
          JSONObject localJSONObject3 = localJSONObject1.getJSONObject(str1);
          localJSONObject4 = localJSONObject2.getJSONObject(str1);
          str2 = localJSONObject3.optString("value");
          str3 = localJSONObject2.optString("value");
          if (isSmart(paramWeMoDevice.getDevice().getDeviceType())) {
            continue;
          }
          JSONObject localJSONObject5 = localJSONObject2.getJSONObject("SwitchMode");
          SDKLogUtils.verboseLog(this.TAG, "Notification for" + str1);
          if (!localJSONObject5.optString("value").equals("1")) {
            continue;
          }
          if (!str1.equals("Switch")) {
            continue;
          }
          this.isNotificationComes = false;
          paramWeMoDevice.setState("0");
          localJSONObject4.put("value", "0");
          continue;
          localJSONException1.printStackTrace();
        }
        catch (JSONException localJSONException1)
        {
          localObject = localJSONObject2;
        }
      }
      catch (JSONException localJSONException2)
      {
        JSONObject localJSONObject2;
        String str1;
        JSONObject localJSONObject4;
        String str2;
        String str3;
        localObject = null;
        continue;
      }
      SDKLogUtils.verboseLog(this.TAG, "change preAttributeListJson" + ((JSONObject)localObject).toString());
      return ((JSONObject)localObject).toString();
      this.isNotificationComes = true;
      localJSONObject4.put("value", str2);
      continue;
      if (!str2.equals(str3))
      {
        this.isNotificationComes = true;
        if (str1.equals("Switch")) {
          paramWeMoDevice.setState(localJSONObject4.optString("value"));
        }
        localJSONObject4.put("value", str2);
        continue;
        if (!str2.equals(str3))
        {
          paramWeMoDevice.setState(localJSONObject4.optString("value"));
          localJSONObject4.put("value", str2);
          SDKLogUtils.verboseLog(this.TAG, "SMART: isNotificationComes comes attributeKey ::" + str1);
          this.isNotificationComes = true;
          continue;
          SDKLogUtils.verboseLog(this.TAG + ".updateAttributeList", "updateAttributeJsons " + localJSONObject1.toString());
          localObject = localJSONObject2;
        }
      }
    }
  }
  
  private boolean updateWeMoDevice(WeMoDevice paramWeMoDevice)
  {
    SDKLogUtils.errorLog(this.TAG, " on updateWeMoDevice is called in WEMOSDKCONTEXT :: " + paramWeMoDevice.getDevice().getUDN());
    for (;;)
    {
      String str3;
      String str7;
      Object localObject1;
      Object localObject2;
      Object localObject3;
      Object localObject4;
      try
      {
        localDevice = paramWeMoDevice.getDevice();
        String str1 = "";
        String str2 = "";
        str3 = "";
        String str4 = "";
        str5 = "";
        String str6 = "";
        str7 = "";
        String str8 = "";
        String str9 = "";
        String str10 = "";
        Action localAction1 = localDevice.getAction("GetInformation");
        Action localAction2 = localDevice.getAction("GetDeviceInformation");
        if (localAction1 != null)
        {
          Map localMap = localDevice.getCustomizedInformationFromDevice();
          if (localMap != null)
          {
            str5 = (String)localMap.get("firmwareVersion");
            str1 = (String)localMap.get("FriendlyName");
            str2 = (String)localMap.get("binaryState");
            str3 = (String)localMap.get("iconVersion");
            str4 = (String)localMap.get("CustomizedState");
            str6 = (String)localMap.get("CountdownEndTime");
            str7 = (String)localMap.get("hwVersion");
            str8 = (String)localMap.get("macAddress");
            if (localMap.get("brandName") != null) {
              str9 = (String)localMap.get("brandName");
            }
            if (localMap.get("productName") != null) {
              str10 = (String)localMap.get("productName");
            }
            if ((str7 == null) || (str7.isEmpty())) {
              break label1263;
            }
            SDKLogUtils.infoLog("WeMoSDK", "WeMoSDKContext : updateWeMoDevice customizedInformation: " + localMap + " friendlyName: " + str1 + " binaryState: " + str2 + " iconVersion: " + str3 + " udn: " + paramWeMoDevice.getUDN() + " macAddress : " + str8 + " countDownEndTime : " + str6 + " hash: " + localDevice.hashCode() + " brandName: " + str9 + " productName: " + str10);
            if ((str2 == null) || (str2.equals("")))
            {
              SDKLogUtils.errorLog("WeMoSDK", "WeMoSDKContext : remove " + paramWeMoDevice.getUDN());
              return false;
            }
          }
          else
          {
            if (localAction2 == null) {
              continue;
            }
            String[] arrayOfString1 = localDevice.getDeviceInformationFromDevice();
            if (arrayOfString1 == null) {
              continue;
            }
            str1 = arrayOfString1[5];
            str2 = arrayOfString1[4];
            str3 = arrayOfString1[2];
            str5 = arrayOfString1[1];
            str8 = arrayOfString1[0];
            if (arrayOfString1.length <= 6) {
              continue;
            }
            str9 = arrayOfString1[6];
            continue;
          }
        }
        else
        {
          if (localAction2 == null)
          {
            str1 = localDevice.getFriendlyNameFromDevice();
            SDKLogUtils.infoLog("WeMoSDK", "WeMoSDKContext : updateWeMoDevice friendlyName: " + str1 + " " + paramWeMoDevice.getUDN());
            if ((str1 == null) || (str1.trim().length() == 0)) {
              str1 = localDevice.getFriendlyName();
            }
            str8 = localDevice.getMacAddress();
            str2 = localDevice.getBinaryStateFromDevice();
            str5 = localDevice.getFirmwareVersionFromDevice();
            continue;
          }
          String[] arrayOfString2 = localDevice.getDeviceInformationFromDevice();
          if (arrayOfString2 == null) {
            continue;
          }
          str1 = arrayOfString2[5];
          str2 = arrayOfString2[4];
          str3 = arrayOfString2[2];
          str5 = arrayOfString2[1];
          str8 = arrayOfString2[0];
          continue;
        }
        if (!paramWeMoDevice.isSubscribed())
        {
          if (!subscribeToService(paramWeMoDevice.getDevice()))
          {
            SDKLogUtils.errorLog("WeMoSDK", "WeMoSDKContext : subscription failed " + paramWeMoDevice.getUDN());
            return false;
          }
          paramWeMoDevice.setSubscribed(true);
        }
        SDKLogUtils.infoLog("WeMoSDK", "WeMoSDKContext : update " + paramWeMoDevice.getUDN() + " friendlyName: " + str1 + " binaryState: " + str2 + " macAddress: " + str8 + " firmwareVersion " + str5 + " hwVersion: " + str7 + " hash: " + localDevice.hashCode() + " brandName: " + str9);
        paramWeMoDevice.setAvailability(true);
        paramWeMoDevice.setState(str2);
        localDevice.setFriendlyName(str1);
        paramWeMoDevice.setCustomizedState(str4);
        paramWeMoDevice.setBrandName(str9);
        paramWeMoDevice.setCountdownEndTime(str6);
        paramWeMoDevice.setMacAddress(str8);
        paramWeMoDevice.setProductName(str10);
        paramWeMoDevice.setFirmwareVersion(str5);
        paramWeMoDevice.setHwVersion(str7);
        localDevice.setConfigureState("");
        String str11 = localDevice.getDeviceType();
        if ((str11.contains("Maker")) || (isSmart(str11))) {
          str12 = paramWeMoDevice.getAttribute();
        }
        try
        {
          if ((!str12.equals("")) && (!str12.equals("null")) && (!str12.equals(null))) {
            continue;
          }
          JSONObject localJSONObject1 = localDevice.getAttriuteListFromDevice();
          localObject1 = localJSONObject1;
        }
        catch (Exception localException2)
        {
          FileStorage localFileStorage2;
          URL localURL2;
          String str16;
          File localFile2;
          String str14;
          JSONObject localJSONObject2;
          SDKLogUtils.errorLog(this.TAG, "Exception in attribute list " + localException2.toString());
          localObject1 = null;
          continue;
        }
        if (!isSmart(str11))
        {
          localObject2 = localDevice.updateAttributesList((JSONObject)localObject1, localDevice.getAttributetParameterFromDevice());
          if (localObject2 != null) {
            paramWeMoDevice.setAttribute(((JSONObject)localObject2).toString());
          }
        }
      }
      catch (Exception localException1)
      {
        Device localDevice;
        String str5;
        String str12;
        localException1.printStackTrace();
        return false;
      }
      try
      {
        if ((!str3.equals("0")) || (!paramWeMoDevice.getUDN().contains("uuid:Maker"))) {
          break label1181;
        }
        localFileStorage2 = FileStorage.getInstance(this.context);
        localURL2 = new URL(paramWeMoDevice.getLogoURL());
        str16 = paramWeMoDevice.getSerialNumber();
        localFile2 = localFileStorage2.storeDefaultIcon(localURL2, str3, str16);
        localObject3 = localFile2;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        label1181:
        FileStorage localFileStorage1;
        URL localURL1;
        String str15;
        File localFile1;
        SDKLogUtils.errorLog(getClass().getName(), "Incorrect logo url ", localMalformedURLException);
        localObject3 = null;
        continue;
        String str13 = ((File)localObject3).getAbsolutePath();
        localObject4 = str13;
        continue;
      }
      if (localObject3 == null)
      {
        localObject4 = "";
        paramWeMoDevice.setLogo((String)localObject4);
        str14 = paramWeMoDevice.getSerialNumber();
        checkIfServiceFilesReload(localDevice, str5, str14);
        return true;
        localJSONObject2 = new JSONObject(str12);
        localObject1 = localJSONObject2;
        continue;
        localObject2 = localObject1;
        continue;
        localFileStorage1 = FileStorage.getInstance(null);
        localURL1 = new URL(paramWeMoDevice.getLogoURL());
        str15 = paramWeMoDevice.getSerialNumber();
        localFile1 = localFileStorage1.getIconFile(localURL1, str3, str15);
        localObject3 = localFile1;
      }
      else
      {
        label1263:
        str7 = "v1";
      }
    }
  }
  
  public void addNotificationListener(NotificationListener paramNotificationListener)
  {
    if ((paramNotificationListener != null) && (!this.mListeners.contains(paramNotificationListener))) {
      this.mListeners.add(paramNotificationListener);
    }
  }
  
  public void deviceAdded(Device paramDevice) {}
  
  public void deviceRemoved(Device paramDevice) {}
  
  public void eventNotifyReceived(String paramString1, String paramString2, long paramLong, String paramString3, String paramString4)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceBySID(paramString1);
    if ((localWeMoDevice != null) && (paramString3 != null) && ((paramString3.equalsIgnoreCase("BinaryState")) || (paramString3.equalsIgnoreCase("StatusChange")) || (paramString3.equalsIgnoreCase("ParamString")) || (paramString3.equalsIgnoreCase("time")) || (paramString3.equalsIgnoreCase("mode")) || (paramString3.equalsIgnoreCase("cookedTime"))))
    {
      SDKLogUtils.infoLog(this.TAG, " Notification Type:: " + paramString3 + ":::Notification Value " + paramString4);
      localWeMoDevice.setState(paramString4);
      localWeMoDevice.setNotifyType(paramString3);
      sendNotification("change_state", paramString2, localWeMoDevice.getUDN());
    }
    do
    {
      return;
      if ((localWeMoDevice != null) && (paramString3 != null) && (paramString3.equalsIgnoreCase("SensorChange")))
      {
        localWeMoDevice.setState(paramString4);
        localWeMoDevice.setNotifyType(paramString3);
        sendNotification("SensorChange", paramString2, localWeMoDevice.getUDN());
        return;
      }
      if ((localWeMoDevice != null) && (paramString3 != null) && (paramString3.equalsIgnoreCase("CountdownEndTime")))
      {
        SDKLogUtils.infoLog(this.TAG, " Notification Type:: " + paramString3 + ":::Notification Value " + paramString4);
        localWeMoDevice.setCountdownEndTime(paramString4);
        sendNotification("CountdownEndTime", paramString2, localWeMoDevice.getUDN());
        return;
      }
      if ((localWeMoDevice != null) && (paramString3 != null) && (paramString3.equalsIgnoreCase("FirmwareUpdateStatus")))
      {
        SDKLogUtils.infoLog(this.TAG, " Notification Type:: " + paramString3 + ":::Notification Value " + paramString4);
        localWeMoDevice.setState(paramString4);
        localWeMoDevice.setNotifyType(paramString3);
        sendNotification("update_firmware", paramString2, localWeMoDevice.getUDN());
        return;
      }
      if ((localWeMoDevice != null) && (paramString3 != null) && (paramString3.equalsIgnoreCase("attributeList")))
      {
        SDKLogUtils.infoLog(this.TAG, " Notification Type:: " + paramString3 + ":::Notification Value " + paramString4);
        String str = updateAttributeList(paramString4, localWeMoDevice);
        if ((!str.equals("null")) || (!str.equals(null)) || (!str.equals("")))
        {
          localWeMoDevice.setAttribute(str);
          if (this.isNotificationComes) {
            sendNotification("change_attribute", paramString2, localWeMoDevice.getUDN());
          }
        }
        this.isNotificationComes = false;
        return;
      }
      if ((localWeMoDevice != null) && (paramString3 != null) && (paramString3.equalsIgnoreCase("SubDeviceFWUpdate")))
      {
        sendNotification("SubDeviceFWUpdate", paramString2, localWeMoDevice.getUDN());
        return;
      }
    } while ((localWeMoDevice == null) || (paramString3 == null) || (!paramString3.equalsIgnoreCase("TimeSyncRequest")));
    SDKLogUtils.infoLog(this.TAG, " Notification Type:: " + paramString3 + ":::Notification Value " + paramString4);
    localWeMoDevice.setNotifyType(paramString3);
    sendNotification("TimeSync", paramString2, localWeMoDevice.getUDN());
  }
  
  public ArrayList<WeMoDevice> getActiveDeviceList()
  {
    return this.mActiveDeviceList;
  }
  
  public String getDeviceCache()
  {
    return FileStorage.getInstance(null).getDeviceCache();
  }
  
  public String getDeviceState(String paramString)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceByUDN(paramString);
    if (localWeMoDevice == null) {
      return "-1";
    }
    return localWeMoDevice.getState();
  }
  
  public Object getUpnpControl()
  {
    if (this.mControlPoint == null) {
      this.mControlPoint = new ControlPoint();
    }
    return this.mControlPoint;
  }
  
  public WeMoDevice getWeMoDeviceByUDN(String paramString)
  {
    return (WeMoDevice)performActionWithCache(0, getFilteredUDN(paramString));
  }
  
  public int getWeMoDeviceCount()
  {
    return this.mControlPoint.getDeviceList().size();
  }
  
  /* Error */
  public boolean recreateControlPoint()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_0
    //   4: getfield 116	com/belkin/wemo/localsdk/WeMoSDKContext:context	Landroid/content/Context;
    //   7: invokespecial 399	com/belkin/wemo/localsdk/WeMoSDKContext:getSSID	(Landroid/content/Context;)Ljava/lang/String;
    //   10: astore 5
    //   12: aload_0
    //   13: getfield 120	com/belkin/wemo/localsdk/WeMoSDKContext:lastSSID	Ljava/lang/String;
    //   16: aload 5
    //   18: invokevirtual 823	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   21: ifeq +50 -> 71
    //   24: ldc -20
    //   26: new 195	java/lang/StringBuilder
    //   29: dup
    //   30: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   33: ldc_w 875
    //   36: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload_0
    //   40: getfield 120	com/belkin/wemo/localsdk/WeMoSDKContext:lastSSID	Ljava/lang/String;
    //   43: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: ldc_w 877
    //   49: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: aload 5
    //   54: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: invokevirtual 218	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   60: invokestatic 158	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   63: iconst_0
    //   64: istore 4
    //   66: aload_0
    //   67: monitorexit
    //   68: iload 4
    //   70: ireturn
    //   71: ldc -20
    //   73: new 195	java/lang/StringBuilder
    //   76: dup
    //   77: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   80: ldc_w 879
    //   83: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   86: aload_0
    //   87: getfield 120	com/belkin/wemo/localsdk/WeMoSDKContext:lastSSID	Ljava/lang/String;
    //   90: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: ldc_w 877
    //   96: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   99: aload 5
    //   101: invokevirtual 202	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: invokevirtual 218	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   107: invokestatic 158	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   110: aload_0
    //   111: getfield 102	com/belkin/wemo/localsdk/WeMoSDKContext:mDeviceCache	Ljava/util/concurrent/CopyOnWriteArrayList;
    //   114: invokevirtual 882	java/util/concurrent/CopyOnWriteArrayList:clear	()V
    //   117: aload_0
    //   118: getfield 104	com/belkin/wemo/localsdk/WeMoSDKContext:mControlPoint	Lorg/cybergarage/upnp/ControlPoint;
    //   121: ifnull +10 -> 131
    //   124: aload_0
    //   125: getfield 104	com/belkin/wemo/localsdk/WeMoSDKContext:mControlPoint	Lorg/cybergarage/upnp/ControlPoint;
    //   128: invokevirtual 885	org/cybergarage/upnp/ControlPoint:forceClose	()V
    //   131: ldc2_w 886
    //   134: invokestatic 413	java/lang/Thread:sleep	(J)V
    //   137: aload_0
    //   138: aload_0
    //   139: getfield 116	com/belkin/wemo/localsdk/WeMoSDKContext:context	Landroid/content/Context;
    //   142: invokespecial 148	com/belkin/wemo/localsdk/WeMoSDKContext:initControlPoint	(Landroid/content/Context;)V
    //   145: ldc2_w 886
    //   148: invokestatic 413	java/lang/Thread:sleep	(J)V
    //   151: iconst_1
    //   152: istore 4
    //   154: goto -88 -> 66
    //   157: astore_2
    //   158: aload_2
    //   159: invokevirtual 343	java/lang/Exception:printStackTrace	()V
    //   162: goto -17 -> 145
    //   165: astore_1
    //   166: aload_0
    //   167: monitorexit
    //   168: aload_1
    //   169: athrow
    //   170: astore_3
    //   171: aload_3
    //   172: invokevirtual 888	java/lang/InterruptedException:printStackTrace	()V
    //   175: goto -24 -> 151
    //   178: astore 6
    //   180: goto -49 -> 131
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	183	0	this	WeMoSDKContext
    //   165	4	1	localObject	Object
    //   157	2	2	localException1	Exception
    //   170	2	3	localInterruptedException	InterruptedException
    //   64	89	4	bool	boolean
    //   10	90	5	str	String
    //   178	1	6	localException2	Exception
    // Exception table:
    //   from	to	target	type
    //   2	63	157	java/lang/Exception
    //   71	110	157	java/lang/Exception
    //   131	145	157	java/lang/Exception
    //   2	63	165	finally
    //   71	110	165	finally
    //   110	131	165	finally
    //   131	145	165	finally
    //   145	151	165	finally
    //   158	162	165	finally
    //   171	175	165	finally
    //   145	151	170	java/lang/InterruptedException
    //   110	131	178	java/lang/Exception
  }
  
  public void refreshListOfWeMoDevicesOnLAN()
  {
    SDKLogUtils.infoLog(this.TAG, "TO BE REMOVED WHEN WeMoSDKContext is removed - Call to refreshListOfWeMoDevicesOnLAN ommitted");
  }
  
  public void removeNotificationListener(NotificationListener paramNotificationListener)
  {
    if (paramNotificationListener != null) {
      this.mListeners.remove(paramNotificationListener);
    }
  }
  
  public boolean removeWeMoDeviceByUDN(String paramString)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceByUDN(paramString);
    if (localWeMoDevice != null)
    {
      performActionWithCache(4, localWeMoDevice);
      return true;
    }
    return false;
  }
  
  public void setAttriuteState(String paramString, JSONObject paramJSONObject)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceByUDN(paramString);
    String[] arrayOfString;
    if (localWeMoDevice != null)
    {
      if (isSmart(localWeMoDevice.getDevice().getDeviceType())) {
        break label86;
      }
      arrayOfString = new String[1];
      arrayOfString[0] = createAttributeList(paramJSONObject, localWeMoDevice);
    }
    DeviceAttributeSetter localDeviceAttributeSetter;
    for (;;)
    {
      localDeviceAttributeSetter = new DeviceAttributeSetter(null);
      if (Build.VERSION.SDK_INT < 11) {
        break;
      }
      localDeviceAttributeSetter.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Object[] { arrayOfString, localWeMoDevice, paramJSONObject });
      return;
      label86:
      arrayOfString = new String[1];
      arrayOfString[0] = createAttributeList(paramJSONObject);
    }
    localDeviceAttributeSetter.execute(new Object[] { arrayOfString, localWeMoDevice, paramJSONObject });
  }
  
  public void setBlobStorage(String paramString1, String paramString2)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceByUDN(paramString1);
    DeviceBlobStorageTask localDeviceBlobStorageTask;
    if (localWeMoDevice != null)
    {
      localDeviceBlobStorageTask = new DeviceBlobStorageTask(null);
      if (Build.VERSION.SDK_INT >= 11) {
        localDeviceBlobStorageTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Object[] { localWeMoDevice, paramString2 });
      }
    }
    else
    {
      return;
    }
    localDeviceBlobStorageTask.execute(new Object[] { localWeMoDevice, paramString2 });
  }
  
  public void setDeviceState(String paramString1, String paramString2)
  {
    WeMoDevice localWeMoDevice = getWeMoDeviceByUDN(paramString2);
    DeviceStateSetter localDeviceStateSetter;
    if (localWeMoDevice != null)
    {
      localDeviceStateSetter = new DeviceStateSetter(null);
      if (Build.VERSION.SDK_INT >= 11) {
        localDeviceStateSetter.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Object[] { paramString1, localWeMoDevice });
      }
    }
    else
    {
      return;
    }
    localDeviceStateSetter.execute(new Object[] { paramString1, localWeMoDevice });
  }
  
  public void stop()
  {
    this.lastSSID = "";
    saveDeviceCache();
    this.mDeviceCache.clear();
    stopListen();
    new Thread(new Runnable()
    {
      public void run()
      {
        WeMoSDKContext.access$002(null);
        try
        {
          if (WeMoSDKContext.this.mControlPoint != null) {
            WeMoSDKContext.this.mControlPoint.finalizeCP();
          }
          return;
        }
        catch (Exception localException) {}
      }
    }).start();
  }
  
  private class DeviceAttributeSetter
    extends AsyncTask<Object, Void, Boolean>
  {
    private String[] argumetList;
    private JSONObject attributeList = null;
    private WeMoDevice mWeMoDevice;
    
    private DeviceAttributeSetter() {}
    
    private void updateAttributeList()
    {
      for (;;)
      {
        try
        {
          localJSONObject1 = new JSONObject(this.mWeMoDevice.getAttribute());
          try
          {
            Iterator localIterator = localJSONObject1.keys();
            if (!localIterator.hasNext()) {
              continue;
            }
            String str1 = (String)localIterator.next();
            if (!this.attributeList.has(str1)) {
              continue;
            }
            String str2 = this.attributeList.getString(str1);
            if ((str2 == null) || (str2.equals(null)) || (str2.equals("null")) || (str2.equals(""))) {
              continue;
            }
            localJSONObject1.getJSONObject(str1).put("value", str2);
            if (!str1.equals("Switch")) {
              continue;
            }
            this.mWeMoDevice.setState(str2);
            continue;
            localJSONException1.printStackTrace();
          }
          catch (JSONException localJSONException1)
          {
            localJSONObject2 = localJSONObject1;
          }
        }
        catch (JSONException localJSONException2)
        {
          JSONObject localJSONObject1;
          JSONObject localJSONObject2 = null;
          continue;
        }
        if ((localJSONObject2 != null) && (!localJSONObject2.equals(null)) && (!localJSONObject2.equals(""))) {
          this.mWeMoDevice.setAttribute(localJSONObject2.toString());
        }
        SDKLogUtils.infoLog(WeMoSDKContext.this.TAG + ".SetDeviceAttributeRunnable", "updateAttributeList attributeList " + localJSONObject2);
        return;
        localJSONObject2 = localJSONObject1;
      }
    }
    
    protected Boolean doInBackground(Object... paramVarArgs)
    {
      Boolean.valueOf(true);
      this.argumetList = ((String[])paramVarArgs[0]);
      this.mWeMoDevice = ((WeMoDevice)paramVarArgs[1]);
      this.attributeList = ((JSONObject)paramVarArgs[2]);
      Action localAction = this.mWeMoDevice.getDevice().getAction("SetAttributes");
      WeMoSDKContext.this.setArgument(localAction, UpnpConstants.SET_ATTRIBUTE_KEYS, this.argumetList);
      String str = localAction.postControlAction();
      if (str == null) {
        return Boolean.valueOf(false);
      }
      return Boolean.valueOf(new SetAttributeResponseParser().parseSetAttributeRespone(str));
    }
    
    protected void onPostExecute(Boolean paramBoolean)
    {
      SDKLogUtils.infoLog(WeMoSDKContext.this.TAG + ".SetDeviceAttributeRunnable", "Result " + paramBoolean);
      if (paramBoolean.booleanValue()) {
        updateAttributeList();
      }
      for (;;)
      {
        WeMoSDKContext.this.sendNotification("set_attribute", "", this.mWeMoDevice.getUDN());
        return;
        this.mWeMoDevice.setAvailability(false);
      }
    }
  }
  
  private class DeviceBlobStorageTask
    extends AsyncTask<Object, Void, Boolean>
  {
    private WeMoDevice mWeMoDevice;
    private String sensortype;
    
    private DeviceBlobStorageTask() {}
    
    protected Boolean doInBackground(Object... paramVarArgs)
    {
      Boolean localBoolean = Boolean.valueOf(true);
      this.mWeMoDevice = ((WeMoDevice)paramVarArgs[0]);
      this.sensortype = ((String)paramVarArgs[1]);
      Action localAction = this.mWeMoDevice.getDevice().getAction("SetBlobStorage");
      WeMoSDKContext localWeMoSDKContext = WeMoSDKContext.this;
      String[] arrayOfString1 = UpnpConstants.SET_BLOB_STORAGE_DATA;
      String[] arrayOfString2 = new String[2];
      arrayOfString2[0] = "Sensor";
      arrayOfString2[1] = this.sensortype;
      localWeMoSDKContext.setArgument(localAction, arrayOfString1, arrayOfString2);
      String str = localAction.postControlAction();
      if (str == null) {
        localBoolean = Boolean.valueOf(false);
      }
      while (!str.contains(UpnpConstants.ERROR)) {
        return localBoolean;
      }
      return Boolean.valueOf(WeMoSDKContext.this.updateWeMoDevice(this.mWeMoDevice));
    }
    
    protected void onPostExecute(Boolean paramBoolean)
    {
      if (!paramBoolean.booleanValue()) {
        this.mWeMoDevice.setAvailability(false);
      }
      this.mWeMoDevice.setBlobStrage(this.sensortype);
      WeMoSDKContext.this.sendNotification("set_attribute", "", this.mWeMoDevice.getUDN());
    }
  }
  
  private class DeviceGetter
    extends AsyncTask<Void, Void, Void>
  {
    private DeviceGetter() {}
    
    protected Void doInBackground(Void... paramVarArgs)
    {
      try
      {
        SDKLogUtils.errorLog(WeMoSDKContext.this.TAG, " on DeviceGetter is called in WEMOSDKCONTEXT :: ");
        localCopyOnWriteArrayList = (CopyOnWriteArrayList)WeMoSDKContext.this.mDeviceCache.clone();
        localDeviceList = WeMoSDKContext.this.mControlPoint.getDeviceList();
        i = localDeviceList.size();
        j = 0;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          CopyOnWriteArrayList localCopyOnWriteArrayList;
          DeviceList localDeviceList;
          int i;
          Device localDevice;
          Iterator localIterator1;
          boolean bool2;
          Iterator localIterator2;
          SDKLogUtils.errorLog(getClass().getName(), "Device list refresh has been aborted " + localInterruptedException.toString());
          return null;
          int m = 0;
          int n = 1;
          if (m < 2) {
            if (m == 1) {
              n = 2;
            }
          }
          try
          {
            if (!WeMoSDKContext.this.mControlPoint.search(n))
            {
              WeMoSDKContext.this.recreateControlPoint();
              WeMoSDKContext.this.mControlPoint.search(n);
              Thread.sleep(600L);
              k++;
            }
            else
            {
              m++;
              Thread.sleep(200L);
            }
          }
          catch (Exception localException2)
          {
            SDKLogUtils.errorLog(WeMoSDKContext.this.TAG, "DeviceGetter doInBackground mControlPoint.search Exception: ", localException2);
            WeMoSDKContext.this.recreateControlPoint();
          }
        }
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          int j;
          label387:
          localException1.printStackTrace();
          continue;
          label503:
          j++;
          continue;
          int k = 0;
        }
      }
      if (j < i)
      {
        localDevice = localDeviceList.getDevice(j);
        localIterator1 = localCopyOnWriteArrayList.iterator();
        do
        {
          boolean bool1 = localIterator1.hasNext();
          bool2 = false;
          if (!bool1) {
            break;
          }
        } while (!((WeMoDevice)localIterator1.next()).getUDN().equals(localDevice.getUDN()));
        bool2 = true;
        SDKLogUtils.debugLog(WeMoSDKContext.this.TAG, "wemoDeviceinCacheCP udn: " + localDevice.getUDN() + " found: " + bool2);
        if (!bool2)
        {
          SDKLogUtils.debugLog(WeMoSDKContext.this.TAG, "wemoDeviceinCacheCP not found in context, removing from CP udn: " + localDevice.getUDN());
          WeMoSDKContext.this.mControlPoint.removeDevice(localDevice.getUDN());
          break label503;
          if (k < 3)
          {
            if (k != 2) {
              break label387;
            }
            Thread.sleep(500L);
            if (!WeMoSDKContext.this.mControlPoint.search(2))
            {
              WeMoSDKContext.this.recreateControlPoint();
              WeMoSDKContext.this.mControlPoint.search(2);
            }
          }
          localIterator2 = localCopyOnWriteArrayList.iterator();
          while (localIterator2.hasNext())
          {
            final WeMoDevice localWeMoDevice = (WeMoDevice)localIterator2.next();
            SDKLogUtils.debugLog(WeMoSDKContext.this.TAG, "wemoDeviceinCacheContext udn: " + localWeMoDevice.getUDN());
            new Thread(new Runnable()
            {
              public void run()
              {
                localWeMoDevice.setAvailability(false);
                if (!WeMoSDKContext.this.updateWeMoDevice(localWeMoDevice))
                {
                  localWeMoDevice.setState("-1");
                  WeMoSDKContext.this.sendNotification("set_state", "", localWeMoDevice.getUDN());
                  return;
                }
                WeMoSDKContext.this.sendNotification("add", "", localWeMoDevice.getUDN());
              }
            }).start();
          }
        }
      }
    }
  }
  
  private class DeviceStateSetter
    extends AsyncTask<Object, Void, Boolean>
  {
    private WeMoDevice mWeMoDevice;
    
    private DeviceStateSetter() {}
    
    protected Boolean doInBackground(Object... paramVarArgs)
    {
      Boolean localBoolean = Boolean.valueOf(true);
      this.mWeMoDevice = ((WeMoDevice)paramVarArgs[1]);
      String str1 = (String)paramVarArgs[0];
      Action localAction = this.mWeMoDevice.getDevice().getAction("SetBinaryState");
      WeMoSDKContext.this.setArgument(localAction, UpnpConstants.SET_BINARY_STATE_ARGS, new String[] { str1 });
      if (localAction != null) {}
      for (String str2 = localAction.postControlAction(); str2 == null; str2 = null) {
        return Boolean.valueOf(false);
      }
      if (str2.contains(UpnpConstants.ERROR))
      {
        this.mWeMoDevice.setSubscribed(false);
        return Boolean.valueOf(WeMoSDKContext.this.updateWeMoDevice(this.mWeMoDevice));
      }
      this.mWeMoDevice.setState(str1);
      return localBoolean;
    }
    
    protected void onPostExecute(Boolean paramBoolean)
    {
      SDKLogUtils.infoLog(WeMoSDKContext.this.TAG, "onPostExecute >>> result is:: " + paramBoolean);
      if (!paramBoolean.booleanValue())
      {
        this.mWeMoDevice.setAvailability(false);
        this.mWeMoDevice.setState("-1");
      }
      WeMoSDKContext.this.sendNotification("set_state", "", this.mWeMoDevice.getUDN());
    }
  }
  
  public static abstract interface NotificationListener
  {
    public abstract void onNotify(String paramString1, String paramString2, String paramString3);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/WeMoSDKContext.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */