package com.belkin.wemo.cache.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.ConnectivityManager.NetworkCallback;
import android.net.DhcpInfo;
import android.net.Network;
import android.net.NetworkInfo;
import android.net.NetworkRequest.Builder;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build.VERSION;
import android.util.Base64;
import com.belkin.wemo.cache.cloud.SmartDiscovery;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONArray;

public class SDKNetworkUtils
{
  private static final String TAG = "SDK_NetworkUtils";
  public static DeviceListManager mDLM = null;
  final int MAX_DISCOVERY_ATTEMPT = 1;
  final int SLEEP_TIME = 400;
  private Context mContext;
  private SharePreferences sharePreference;
  
  public SDKNetworkUtils(Context paramContext)
  {
    this.mContext = paramContext;
    this.sharePreference = new SharePreferences(paramContext);
  }
  
  /* Error */
  private static String getMacFromArpCache(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: ifnonnull +5 -> 8
    //   6: aload_1
    //   7: areturn
    //   8: aconst_null
    //   9: astore_2
    //   10: new 43	java/io/BufferedReader
    //   13: dup
    //   14: new 45	java/io/FileReader
    //   17: dup
    //   18: ldc 47
    //   20: invokespecial 50	java/io/FileReader:<init>	(Ljava/lang/String;)V
    //   23: invokespecial 53	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   26: astore_3
    //   27: aload_3
    //   28: invokevirtual 57	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   31: astore 8
    //   33: aload 8
    //   35: ifnull +116 -> 151
    //   38: aload 8
    //   40: ldc 59
    //   42: invokevirtual 65	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   45: astore 9
    //   47: aload 9
    //   49: ifnull -22 -> 27
    //   52: aload 9
    //   54: arraylength
    //   55: iconst_4
    //   56: if_icmplt -29 -> 27
    //   59: aload_0
    //   60: aload 9
    //   62: iconst_0
    //   63: aaload
    //   64: invokevirtual 69	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   67: ifeq -40 -> 27
    //   70: aload 9
    //   72: iconst_3
    //   73: aaload
    //   74: astore 10
    //   76: aload 10
    //   78: ldc 71
    //   80: invokevirtual 75	java/lang/String:matches	(Ljava/lang/String;)Z
    //   83: ifeq +43 -> 126
    //   86: aload_3
    //   87: invokevirtual 78	java/io/BufferedReader:close	()V
    //   90: aload 10
    //   92: ldc 80
    //   94: ldc 82
    //   96: invokevirtual 86	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   99: invokevirtual 89	java/lang/String:toUpperCase	()Ljava/lang/String;
    //   102: astore 12
    //   104: aload 12
    //   106: astore_1
    //   107: aload_3
    //   108: ifnull -102 -> 6
    //   111: aload_3
    //   112: invokevirtual 78	java/io/BufferedReader:close	()V
    //   115: aload_1
    //   116: areturn
    //   117: astore 13
    //   119: aload 13
    //   121: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   124: aload_1
    //   125: areturn
    //   126: aload_3
    //   127: invokevirtual 78	java/io/BufferedReader:close	()V
    //   130: aconst_null
    //   131: astore_1
    //   132: aload_3
    //   133: ifnull -127 -> 6
    //   136: aload_3
    //   137: invokevirtual 78	java/io/BufferedReader:close	()V
    //   140: aconst_null
    //   141: areturn
    //   142: astore 11
    //   144: aload 11
    //   146: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   149: aconst_null
    //   150: areturn
    //   151: aload_3
    //   152: ifnull +83 -> 235
    //   155: aload_3
    //   156: invokevirtual 78	java/io/BufferedReader:close	()V
    //   159: aconst_null
    //   160: areturn
    //   161: astore 14
    //   163: aload 14
    //   165: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   168: aconst_null
    //   169: areturn
    //   170: astore 4
    //   172: aload 4
    //   174: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   177: aconst_null
    //   178: astore_1
    //   179: aload_2
    //   180: ifnull -174 -> 6
    //   183: aload_2
    //   184: invokevirtual 78	java/io/BufferedReader:close	()V
    //   187: aconst_null
    //   188: areturn
    //   189: astore 7
    //   191: aload 7
    //   193: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   196: aconst_null
    //   197: areturn
    //   198: astore 5
    //   200: aload_2
    //   201: ifnull +7 -> 208
    //   204: aload_2
    //   205: invokevirtual 78	java/io/BufferedReader:close	()V
    //   208: aload 5
    //   210: athrow
    //   211: astore 6
    //   213: aload 6
    //   215: invokevirtual 92	java/lang/Exception:printStackTrace	()V
    //   218: goto -10 -> 208
    //   221: astore 5
    //   223: aload_3
    //   224: astore_2
    //   225: goto -25 -> 200
    //   228: astore 4
    //   230: aload_3
    //   231: astore_2
    //   232: goto -60 -> 172
    //   235: aconst_null
    //   236: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	237	0	paramString	String
    //   1	178	1	localObject1	Object
    //   9	223	2	localObject2	Object
    //   26	205	3	localBufferedReader	java.io.BufferedReader
    //   170	3	4	localException1	Exception
    //   228	1	4	localException2	Exception
    //   198	11	5	localObject3	Object
    //   221	1	5	localObject4	Object
    //   211	3	6	localException3	Exception
    //   189	3	7	localException4	Exception
    //   31	8	8	str1	String
    //   45	26	9	arrayOfString	String[]
    //   74	17	10	str2	String
    //   142	3	11	localException5	Exception
    //   102	3	12	str3	String
    //   117	3	13	localException6	Exception
    //   161	3	14	localException7	Exception
    // Exception table:
    //   from	to	target	type
    //   111	115	117	java/lang/Exception
    //   136	140	142	java/lang/Exception
    //   155	159	161	java/lang/Exception
    //   10	27	170	java/lang/Exception
    //   183	187	189	java/lang/Exception
    //   10	27	198	finally
    //   172	177	198	finally
    //   204	208	211	java/lang/Exception
    //   27	33	221	finally
    //   38	47	221	finally
    //   52	104	221	finally
    //   126	130	221	finally
    //   27	33	228	java/lang/Exception
    //   38	47	228	java/lang/Exception
    //   52	104	228	java/lang/Exception
    //   126	130	228	java/lang/Exception
  }
  
  private static String intToIp(int paramInt)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(paramInt & 0xFF);
    arrayOfObject[1] = Integer.valueOf(0xFF & paramInt >> 8);
    arrayOfObject[2] = Integer.valueOf(0xFF & paramInt >> 16);
    arrayOfObject[3] = Integer.valueOf(0xFF & paramInt >> 24);
    return String.format("%d.%d.%d.%d", arrayOfObject);
  }
  
  public void bindToNetwork()
  {
    final ConnectivityManager localConnectivityManager = (ConnectivityManager)this.mContext.getSystemService("connectivity");
    NetworkRequest.Builder localBuilder;
    if (Build.VERSION.SDK_INT >= 23)
    {
      localBuilder = new NetworkRequest.Builder();
      localBuilder.addTransportType(1);
    }
    try
    {
      localConnectivityManager.requestNetwork(localBuilder.build(), new ConnectivityManager.NetworkCallback()
      {
        @TargetApi(23)
        public void onAvailable(Network paramAnonymousNetwork)
        {
          try
          {
            localConnectivityManager.bindProcessToNetwork(paramAnonymousNetwork);
            return;
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
            SDKNetworkUtils.this.unRegisterNetwork();
          }
        }
      });
      return;
    }
    catch (SecurityException localSecurityException)
    {
      localSecurityException.printStackTrace();
    }
  }
  
  public String deviceNetworkType()
  {
    String str = getSSID();
    mDLM = DeviceListManager.getInstance(this.mContext);
    if (str != null)
    {
      if ("Home".equals(getNetworkType())) {
        return "devices";
      }
      if (("Remote_WiFi".equals(getNetworkType())) || ("Remote_Mobile".equals(getNetworkType()))) {
        return "devices";
      }
      return "index";
    }
    return "index";
  }
  
  public boolean forceConnectToAP(String paramString, boolean paramBoolean)
  {
    String str1 = getSSID();
    if (!paramBoolean) {
      return paramString.equalsIgnoreCase(str1);
    }
    int i = 0;
    for (;;)
    {
      if (i < 5)
      {
        String str2 = getNetworkType();
        String str3 = getSSID();
        if (("WEMO".equals(str2)) && (paramString.equalsIgnoreCase(str3))) {
          break;
        }
      }
      try
      {
        Thread.sleep(2000L);
        i++;
        continue;
        return false;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;) {}
      }
    }
  }
  
  public JSONArray generateAuthCode()
  {
    JSONArray localJSONArray = new JSONArray();
    long l = 200L + System.currentTimeMillis() / 1000L;
    String str1 = new WiFiSecurityUtil().getDeviceID(this.mContext);
    String str2 = str1 + "\n" + "\n" + l;
    String str3 = this.sharePreference.getCurrentLocationHomeId();
    if ((str3 == null) || (str3.length() == 0)) {
      str3 = this.sharePreference.getHomeId();
    }
    String str4 = this.sharePreference.getPrivateKey();
    localObject = null;
    if (str4 != null) {}
    try
    {
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(new SecretKeySpec(str4.getBytes(), localMac.getAlgorithm()));
      String str5 = new String(Base64.encode(localMac.doFinal(str2.getBytes()), 0)).trim();
      String str6 = "SDU " + str1 + ":" + str5 + ":" + l;
      localObject = str6;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        localObject = null;
      }
    }
    localJSONArray.put(localObject);
    localJSONArray.put(str3);
    return localJSONArray;
  }
  
  public String getAPData()
  {
    String str = "";
    int i = 100;
    String[] arrayOfString = this.sharePreference.getAPValues().split("\\|");
    if (arrayOfString.length > 1)
    {
      i = Integer.parseInt(arrayOfString[0]);
      str = arrayOfString[1];
    }
    if (i > 30) {
      str = "";
    }
    while (i < 30) {
      return str;
    }
    this.sharePreference.saveAPValues("100");
    return str;
  }
  
  public String getArpMac()
  {
    return getMacFromArpCache();
  }
  
  public String getCurrentLocationHomeId()
  {
    return this.sharePreference.getCurrentLocationHomeId();
  }
  
  public String getDefaultGatewayIP()
  {
    try
    {
      String str = intToIp(((WifiManager)this.mContext.getSystemService("wifi")).getDhcpInfo().gateway);
      return str;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public String getMacFromArpCache()
  {
    String str1 = getDefaultGatewayIP();
    Object localObject = getMacFromArpCache(str1);
    int i = 0;
    while ((localObject != null) && (Constants.DEFAULT_MAC.equals(localObject)) && (i < Constants.ARPMAC_RETRIES))
    {
      i++;
      try
      {
        Thread.sleep(Constants.ARPMAC_RETRIES_INTERVAL);
        String str2 = getMacFromArpCache(str1);
        localObject = str2;
      }
      catch (InterruptedException localInterruptedException)
      {
        localInterruptedException.printStackTrace();
      }
    }
    if ((localObject != null) && (Constants.DEFAULT_MAC.equals(localObject))) {
      localObject = null;
    }
    SDKLogUtils.infoLog("SDK_NetworkUtils", "getMacFromArpCach mac: " + (String)localObject + " defaultGtwIP: " + str1 + " tries: " + i);
    return (String)localObject;
  }
  
  public String getNetworkName()
  {
    try
    {
      if (!isPluginConnected())
      {
        NetworkInfo localNetworkInfo = ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
        if (localNetworkInfo == null) {
          return "No Network";
        }
        if (localNetworkInfo.isConnected())
        {
          if (localNetworkInfo.getTypeName().equalsIgnoreCase("MOBILE")) {
            return "Cellular";
          }
          return getSSID();
        }
      }
      else
      {
        String str = getSSID();
        return str;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "No Network";
  }
  
  public String getNetworkType()
  {
    boolean bool1 = true;
    for (;;)
    {
      try
      {
        localNetworkInfo = ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
        if (localNetworkInfo != null) {
          continue;
        }
        str1 = "No_Network";
      }
      catch (Exception localException)
      {
        NetworkInfo localNetworkInfo;
        boolean bool2;
        String str2;
        Set localSet;
        String str3;
        boolean bool3;
        Object localObject;
        String str4;
        Iterator localIterator2;
        String str6;
        Iterator localIterator1;
        String str5;
        localException.printStackTrace();
        String str1 = null;
        continue;
        NetworkMode.setLocal(true);
        continue;
        boolean bool4 = true;
        continue;
        bool4 = false;
        continue;
        str1 = "Home";
        continue;
        str1 = "Home";
        continue;
      }
      SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: appNetworkType: " + str1 + " SmartDiscovery.isForcedRemoteEnabled: " + SmartDiscovery.isForcedRemoteEnabled);
      if (str1 == null) {
        str1 = "No_Network";
      }
      if ((!"Remote_Mobile".equals(str1)) && (!"Remote_WiFi".equals(str1))) {
        continue;
      }
      NetworkMode.setLocal(false);
      if (SmartDiscovery.isForcedRemoteEnabled) {
        NetworkMode.setLocal(false);
      }
      SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: NetworkMode.setLocal(false): " + NetworkMode.isLocal());
      return str1;
      if (!isPluginConnected())
      {
        bool2 = localNetworkInfo.isConnected();
        str1 = null;
        if (bool2)
        {
          str2 = localNetworkInfo.getTypeName();
          if (str2.equalsIgnoreCase("MOBILE"))
          {
            str1 = "Remote_Mobile";
          }
          else
          {
            localSet = this.sharePreference.getHomeSSIDs();
            str3 = getSSID();
            bool3 = str2.equalsIgnoreCase("WIFI");
            str1 = null;
            if (bool3)
            {
              str1 = null;
              if (str3 != null) {
                if (str3.toLowerCase().startsWith("wemo."))
                {
                  str1 = "WEMO";
                }
                else if (str3.startsWith("NetCam"))
                {
                  str1 = "net_cam";
                }
                else
                {
                  if (!this.sharePreference.isRemoteEnabled()) {
                    continue;
                  }
                  SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: isRemoteMode: " + true);
                  localObject = this.sharePreference.getARPMacs();
                  str4 = getArpMac();
                  if (((localObject == null) || (((Set)localObject).size() == 0)) && (str4 != null) && (!str4.isEmpty()) && (str3.equals(this.sharePreference.getRemoteAccessSSID())))
                  {
                    localObject = new HashSet();
                    ((Set)localObject).add(str4);
                    this.sharePreference.setARPMacs((Set)localObject);
                  }
                  SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: currentArpMac: " + str4 + " :storedArpMacs: " + localObject);
                  if ((str4 != null) && (!str4.isEmpty()) && (localObject != null) && (((Set)localObject).size() > 0))
                  {
                    localIterator2 = ((Set)localObject).iterator();
                    if (localIterator2.hasNext())
                    {
                      str6 = (String)localIterator2.next();
                      SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: string: " + str6);
                      if ((str6 == null) || (str6.isEmpty()) || (!str6.equalsIgnoreCase(str4))) {
                        continue;
                      }
                      bool1 = false;
                      continue;
                    }
                  }
                  else
                  {
                    localIterator1 = localSet.iterator();
                    if (localIterator1.hasNext())
                    {
                      str5 = (String)localIterator1.next();
                      SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: string1: " + str5);
                      if ((str5 == null) || (str5.isEmpty()) || (!str5.equalsIgnoreCase(str3))) {
                        continue;
                      }
                      bool1 = false;
                      continue;
                    }
                  }
                  if (SmartDiscovery.isForcedRemoteEnabled) {
                    continue;
                  }
                  if (!bool1) {
                    continue;
                  }
                  continue;
                  SDKLogUtils.infoLog("SDK_NetworkUtils", "Forced Remote: isRemoteMode1: " + bool4 + " :onRemote: " + bool1);
                  if (!bool4) {
                    continue;
                  }
                  str1 = "Remote_WiFi";
                }
              }
            }
          }
        }
      }
      else
      {
        str1 = "WEMO";
      }
    }
  }
  
  public String getSSID()
  {
    try
    {
      String str1 = ((WifiManager)this.mContext.getSystemService("wifi")).getConnectionInfo().getSSID();
      if ((str1.startsWith("\"")) && (str1.endsWith("\""))) {
        str1 = str1.substring(1, -1 + str1.length());
      }
      String str2 = str1.trim();
      return str2;
    }
    catch (Exception localException)
    {
      System.out.println("exception occured :" + localException.getStackTrace());
    }
    return null;
  }
  
  public boolean isHomeNetwork()
  {
    return "Home".equals(getNetworkType());
  }
  
  public boolean isNetworkConnected()
  {
    return ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo() != null;
  }
  
  public boolean isPluginConnected()
  {
    String str = getSSID();
    boolean bool1 = false;
    if (str != null)
    {
      boolean bool2 = str.toLowerCase().startsWith("wemo.");
      bool1 = false;
      if (bool2) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public Set<String> mergeArpMacs(Set<String> paramSet1, Set<String> paramSet2)
  {
    if (paramSet1 == null) {
      paramSet1 = new HashSet();
    }
    int i = 1;
    try
    {
      Iterator localIterator1 = paramSet2.iterator();
      while (localIterator1.hasNext())
      {
        String str1 = (String)localIterator1.next();
        if ((str1 != null) && (!str1.isEmpty()))
        {
          Iterator localIterator2 = paramSet1.iterator();
          while (localIterator2.hasNext())
          {
            String str2 = (String)localIterator2.next();
            if ((str2 != null) && (!str2.isEmpty()) && (str2.equals(str1))) {
              i = 0;
            }
          }
          if (i != 0) {
            paramSet1.add(str1);
          }
        }
      }
      return paramSet1;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public Set<String> mergeHomeSsid(Set<String> paramSet)
  {
    Set localSet = this.sharePreference.getHomeSSIDs();
    int i = 1;
    Iterator localIterator1 = paramSet.iterator();
    while (localIterator1.hasNext())
    {
      String str = (String)localIterator1.next();
      Iterator localIterator2 = localSet.iterator();
      while (localIterator2.hasNext()) {
        if (((String)localIterator2.next()).equals(str)) {
          i = 0;
        }
      }
      if (i != 0) {
        localSet.add(str);
      }
    }
    return localSet;
  }
  
  public void setCurrentLocationHomeId(String paramString)
  {
    this.sharePreference.setCurrentLocationHomeId(paramString);
  }
  
  @TargetApi(21)
  public void unRegisterNetwork()
  {
    ConnectivityManager localConnectivityManager = (ConnectivityManager)this.mContext.getSystemService("connectivity");
    if (Build.VERSION.SDK_INT >= 23) {
      localConnectivityManager.bindProcessToNetwork(null);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/SDKNetworkUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */