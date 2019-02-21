package com.belkin.wemo.cache.remoteaccess;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.Locks;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WiFiSecurityUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TimeZone;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;
import org.json.JSONObject;

public class RemoteAccessManager
{
  private static String TAG = "RemoteAccessManager";
  private static int lastDeviceIndex = 0;
  private DeviceListManagerCallbacksActivity mActivity;
  private Context mContext;
  private SDKNetworkUtils mNetworkUtils;
  private SharePreferences mSharePreference;
  
  public RemoteAccessManager(DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity, Context paramContext)
  {
    this.mContext = paramContext;
    this.mActivity = paramDeviceListManagerCallbacksActivity;
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mNetworkUtils = new SDKNetworkUtils(this.mContext);
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
      arrayOfString[3] = Build.MODEL;
      arrayOfString[4] = "";
      arrayOfString[5] = "";
      arrayOfString[6] = "";
      arrayOfString[7] = localWiFiSecurityUtil.generateAuthCode(this.mContext);
      return arrayOfString;
      arrayOfString[1] = "0";
    }
  }
  
  private void sendRemoteEnabledBroadcast()
  {
    SDKLogUtils.infoLog(TAG, "Enable Remote Access ACTION successful. Notifying all listeners.");
    RemoteAccessBroadcastService.getInstance().remoteEnabledNotify();
  }
  
  private boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    int i;
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null)) {
      i = 0;
    }
    while (i < paramArrayOfString1.length)
    {
      Log.v(TAG, "Key " + paramArrayOfString1[i] + " = " + paramArrayOfString2[i] + " Value");
      paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      i++;
      continue;
      return false;
    }
    return true;
  }
  
  /* Error */
  public com.belkin.wemo.cache.location.Location enableLocationRemoteAccess(String paramString)
  {
    // Byte code:
    //   0: new 147	org/json/JSONObject
    //   3: dup
    //   4: invokespecial 148	org/json/JSONObject:<init>	()V
    //   7: pop
    //   8: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   11: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   14: invokevirtual 161	com/belkin/wemo/cache/utils/Locks:isLocked	(Ljava/lang/Integer;)Z
    //   17: ifne +323 -> 340
    //   20: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   23: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   26: invokevirtual 165	com/belkin/wemo/cache/utils/Locks:setLock	(Ljava/lang/Integer;)V
    //   29: aload_0
    //   30: invokespecial 167	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:getRemoteAccessAgrs	()[Ljava/lang/String;
    //   33: astore 5
    //   35: aload_0
    //   36: getfield 32	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:mActivity	Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
    //   39: aload_0
    //   40: getfield 30	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:mContext	Landroid/content/Context;
    //   43: invokestatic 172	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   46: astore 6
    //   48: aload 6
    //   50: ifnull +281 -> 331
    //   53: aload 6
    //   55: invokevirtual 176	com/belkin/wemo/cache/devicelist/DeviceListManager:getActiveDeviceInfoList	()Ljava/util/ArrayList;
    //   58: astore 7
    //   60: aload 7
    //   62: ifnull +269 -> 331
    //   65: aload 7
    //   67: invokevirtual 182	java/util/ArrayList:size	()I
    //   70: ifle +261 -> 331
    //   73: getstatic 24	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:lastDeviceIndex	I
    //   76: aload 7
    //   78: invokevirtual 182	java/util/ArrayList:size	()I
    //   81: if_icmplt +7 -> 88
    //   84: iconst_0
    //   85: putstatic 24	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:lastDeviceIndex	I
    //   88: aload 7
    //   90: getstatic 24	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:lastDeviceIndex	I
    //   93: invokevirtual 186	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   96: checkcast 188	com/belkin/wemo/cache/data/DeviceInformation
    //   99: astore 8
    //   101: iconst_1
    //   102: getstatic 24	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:lastDeviceIndex	I
    //   105: iadd
    //   106: putstatic 24	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:lastDeviceIndex	I
    //   109: aload 8
    //   111: invokevirtual 192	com/belkin/wemo/cache/data/DeviceInformation:getDevice	()Lorg/cybergarage/upnp/Device;
    //   114: astore 9
    //   116: aload 9
    //   118: ifnull +213 -> 331
    //   121: aload 9
    //   123: ldc -62
    //   125: invokevirtual 200	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   128: astore 10
    //   130: aload_0
    //   131: aload 10
    //   133: getstatic 206	com/belkin/wemo/cache/devicelist/UpnpConstants:SET_REMOTE_ACESS_ARGS	[Ljava/lang/String;
    //   136: aload 5
    //   138: invokespecial 208	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    //   141: pop
    //   142: aload 10
    //   144: invokevirtual 211	org/cybergarage/upnp/Action:postControlAction	()Ljava/lang/String;
    //   147: astore 12
    //   149: aload 12
    //   151: ifnonnull +23 -> 174
    //   154: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   157: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   160: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   163: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   166: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   169: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   172: aconst_null
    //   173: areturn
    //   174: getstatic 22	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:TAG	Ljava/lang/String;
    //   177: new 116	java/lang/StringBuilder
    //   180: dup
    //   181: invokespecial 117	java/lang/StringBuilder:<init>	()V
    //   184: ldc -40
    //   186: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: aload 12
    //   191: invokevirtual 123	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: invokevirtual 130	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   197: invokestatic 219	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   200: pop
    //   201: new 221	com/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser
    //   204: dup
    //   205: invokespecial 222	com/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser:<init>	()V
    //   208: aload 12
    //   210: invokevirtual 226	com/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser:parseRemoteAccessRespone	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   213: astore 14
    //   215: aload 14
    //   217: ldc -28
    //   219: invokevirtual 232	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   222: ifeq +109 -> 331
    //   225: aload 14
    //   227: ldc -28
    //   229: invokevirtual 236	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   232: ldc -18
    //   234: invokevirtual 241	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   237: ifeq +94 -> 331
    //   240: new 243	com/belkin/wemo/cache/location/Location
    //   243: dup
    //   244: aload 14
    //   246: ldc -11
    //   248: invokevirtual 236	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   251: aload_1
    //   252: invokespecial 247	com/belkin/wemo/cache/location/Location:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   255: astore 15
    //   257: new 249	java/util/HashSet
    //   260: dup
    //   261: invokespecial 250	java/util/HashSet:<init>	()V
    //   264: astore 16
    //   266: aload 16
    //   268: aload_0
    //   269: getfield 44	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:mNetworkUtils	Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    //   272: invokevirtual 253	com/belkin/wemo/cache/utils/SDKNetworkUtils:getSSID	()Ljava/lang/String;
    //   275: invokevirtual 257	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   278: pop
    //   279: aload 15
    //   281: aload 16
    //   283: invokevirtual 261	com/belkin/wemo/cache/location/Location:setSsids	(Ljava/util/Set;)V
    //   286: new 249	java/util/HashSet
    //   289: dup
    //   290: invokespecial 250	java/util/HashSet:<init>	()V
    //   293: astore 18
    //   295: aload 18
    //   297: aload_0
    //   298: getfield 44	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:mNetworkUtils	Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    //   301: invokevirtual 264	com/belkin/wemo/cache/utils/SDKNetworkUtils:getMacFromArpCache	()Ljava/lang/String;
    //   304: invokevirtual 257	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   307: pop
    //   308: aload 15
    //   310: aload 18
    //   312: invokevirtual 267	com/belkin/wemo/cache/location/Location:setArpMacs	(Ljava/util/Set;)V
    //   315: aload_0
    //   316: invokespecial 269	com/belkin/wemo/cache/remoteaccess/RemoteAccessManager:sendRemoteEnabledBroadcast	()V
    //   319: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   322: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   325: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   328: aload 15
    //   330: areturn
    //   331: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   334: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   337: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   340: aconst_null
    //   341: areturn
    //   342: astore 4
    //   344: aload 4
    //   346: invokevirtual 272	java/lang/Exception:printStackTrace	()V
    //   349: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   352: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   355: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   358: goto -18 -> 340
    //   361: astore_3
    //   362: invokestatic 153	com/belkin/wemo/cache/utils/Locks:getInstance	()Lcom/belkin/wemo/cache/utils/Locks;
    //   365: getstatic 157	com/belkin/wemo/cache/utils/Locks:LOCK_REMOTE_ACCESS_ENABLE	Ljava/lang/Integer;
    //   368: invokevirtual 214	com/belkin/wemo/cache/utils/Locks:unsetLock	(Ljava/lang/Integer;)V
    //   371: aload_3
    //   372: athrow
    //   373: astore_3
    //   374: goto -12 -> 362
    //   377: astore 4
    //   379: goto -35 -> 344
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	382	0	this	RemoteAccessManager
    //   0	382	1	paramString	String
    //   361	11	3	localObject1	Object
    //   373	1	3	localObject2	Object
    //   342	3	4	localException1	Exception
    //   377	1	4	localException2	Exception
    //   33	104	5	arrayOfString	String[]
    //   46	8	6	localDeviceListManager	DeviceListManager
    //   58	31	7	localArrayList	ArrayList
    //   99	11	8	localDeviceInformation	DeviceInformation
    //   114	8	9	localDevice	Device
    //   128	15	10	localAction	Action
    //   147	62	12	str	String
    //   213	32	14	localJSONObject	JSONObject
    //   255	74	15	localLocation	com.belkin.wemo.cache.location.Location
    //   264	18	16	localHashSet1	HashSet
    //   293	18	18	localHashSet2	HashSet
    // Exception table:
    //   from	to	target	type
    //   29	48	342	java/lang/Exception
    //   53	60	342	java/lang/Exception
    //   65	88	342	java/lang/Exception
    //   88	116	342	java/lang/Exception
    //   121	149	342	java/lang/Exception
    //   154	163	342	java/lang/Exception
    //   174	257	342	java/lang/Exception
    //   29	48	361	finally
    //   53	60	361	finally
    //   65	88	361	finally
    //   88	116	361	finally
    //   121	149	361	finally
    //   154	163	361	finally
    //   174	257	361	finally
    //   344	349	361	finally
    //   257	319	373	finally
    //   257	319	377	java/lang/Exception
  }
  
  public boolean enableRemoteAccess()
  {
    new JSONObject();
    if (!Locks.getInstance().isLocked(Locks.LOCK_REMOTE_ACCESS_ENABLE)) {
      Locks.getInstance().setLock(Locks.LOCK_REMOTE_ACCESS_ENABLE);
    }
    try
    {
      String[] arrayOfString = getRemoteAccessAgrs();
      DeviceListManager localDeviceListManager = DeviceListManager.getInstance(this.mActivity, this.mContext);
      if (localDeviceListManager != null)
      {
        ArrayList localArrayList = localDeviceListManager.getActiveDeviceInfoList();
        if ((localArrayList != null) && (localArrayList.size() > 0))
        {
          if (lastDeviceIndex >= localArrayList.size()) {
            lastDeviceIndex = 0;
          }
          lastDeviceIndex = 1 + lastDeviceIndex;
          Iterator localIterator = localArrayList.iterator();
          while (localIterator.hasNext())
          {
            DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
            Device localDevice = localDeviceInformation.getDevice();
            SDKLogUtils.infoLog(TAG, "Trying remote enable for : " + localDeviceInformation.getUDN());
            if (localDevice != null)
            {
              Action localAction = localDevice.getAction("RemoteAccess");
              setArgument(localAction, UpnpConstants.SET_REMOTE_ACESS_ARGS, arrayOfString);
              String str1 = localAction.postControlAction();
              if (str1 == null)
              {
                Locks.getInstance().unsetLock(Locks.LOCK_REMOTE_ACCESS_ENABLE);
                SDKLogUtils.infoLog(TAG, "remote enable failed for : " + localDeviceInformation.getUDN());
              }
              SDKLogUtils.infoLog(TAG, "enableRemoteAccess response: " + str1);
              JSONObject localJSONObject = new RemoteAccessResponseParser().parseRemoteAccessRespone(str1);
              if ((localJSONObject.has("statusCode")) && (localJSONObject.getString("statusCode").equalsIgnoreCase("S")))
              {
                String str2 = localJSONObject.getString("privateKeyPhone");
                if (!str2.equalsIgnoreCase("NOKEY")) {
                  this.mSharePreference.storePrivateKey(str2);
                }
                this.mSharePreference.storeHomeId(localJSONObject.getString("homeId"));
                HashSet localHashSet1 = new HashSet();
                localHashSet1.add(this.mNetworkUtils.getSSID());
                this.mSharePreference.setHomeSSIDs(localHashSet1);
                HashSet localHashSet2 = new HashSet();
                localHashSet2.add(this.mNetworkUtils.getMacFromArpCache());
                this.mSharePreference.setARPMacs(localHashSet2);
                this.mSharePreference.setRemoteEnabled(true);
                if (1 == 0) {
                  this.mSharePreference.setDBVersion("0");
                }
                SDKLogUtils.infoLog(TAG, "remote enable succeeded for : " + localDeviceInformation.getUDN());
                localDeviceListManager.getNestDevicesFromCloud();
                sendRemoteEnabledBroadcast();
                return true;
              }
            }
          }
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        Locks.getInstance().unsetLock(Locks.LOCK_REMOTE_ACCESS_ENABLE);
      }
    }
    finally
    {
      Locks.getInstance().unsetLock(Locks.LOCK_REMOTE_ACCESS_ENABLE);
    }
    return false;
  }
  
  public Set<String> getARPMacs()
  {
    return this.mSharePreference.getARPMacs();
  }
  
  public String getHomeId()
  {
    String str = this.mSharePreference.getCurrentLocationHomeId();
    if ((str == null) || (str.length() == 0)) {
      str = this.mSharePreference.getHomeId();
    }
    return str;
  }
  
  public Set<String> getHomeSSID()
  {
    return this.mSharePreference.getHomeSSIDs();
  }
  
  public Set<String> getHomeSSIDs()
  {
    return this.mSharePreference.getHomeSSIDs();
  }
  
  public boolean isRemoteEnabled()
  {
    return this.mSharePreference.isRemoteEnabled();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/remoteaccess/RemoteAccessManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */