package com.belkin.controller;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.text.TextUtils;
import com.belkin.controller.listener.CropImageByUserCallback;
import com.belkin.controller.listener.PhotoRequestedListener;
import com.belkin.controller.listener.SelectPhotoListener;
import com.belkin.controller.listener.TakePictureListener;
import com.belkin.cordova.plugin.SmartDevicePlugin;
import com.belkin.cordova.plugin.callback.HideGroupCallback;
import com.belkin.remoteservice.BridgeAPI;
import com.belkin.utils.LogUtils;
import com.belkin.utils.NsdUtil;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.CalibrateErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.CalibrateSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureDimmingRangeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureDimmingRangeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.SetBulbTypeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.SetBulbTypeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeSuccessCallback;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.RMIRules;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.impl.WeMoRulesFactory;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceListController
{
  public static final String ATTRIBUTES = "attributes";
  public static final String DEVICECAPABILITIES = "deviceCapabilities";
  public static final String INFORMATION = "information";
  public static final String PROPERTIES = "properties";
  public static final String TAG = "DeviceListController";
  private static DeviceListController devListController = null;
  public static DeviceListManager sDeviceListManager;
  private Context mContext = null;
  private SDKNetworkUtils mSDKNetworkUtil;
  private PhotoRequestedListener photoRequestedListener;
  
  private DeviceListController(Context paramContext)
  {
    this.mContext = paramContext;
    sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    this.mSDKNetworkUtil = new SDKNetworkUtils(this.mContext);
  }
  
  /* Error */
  private JSONObject createJSONObj(DeviceInformation paramDeviceInformation)
  {
    // Byte code:
    //   0: ldc 20
    //   2: ldc 78
    //   4: invokestatic 84	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7: new 86	org/json/JSONObject
    //   10: dup
    //   11: invokespecial 87	org/json/JSONObject:<init>	()V
    //   14: astore_2
    //   15: new 86	org/json/JSONObject
    //   18: dup
    //   19: invokespecial 87	org/json/JSONObject:<init>	()V
    //   22: astore_3
    //   23: getstatic 93	com/belkin/constant/DeviceListConstants$Information:infos	Ljava/util/Set;
    //   26: invokeinterface 99 1 0
    //   31: astore 5
    //   33: aload 5
    //   35: invokeinterface 105 1 0
    //   40: ifeq +235 -> 275
    //   43: aload 5
    //   45: invokeinterface 109 1 0
    //   50: checkcast 89	com/belkin/constant/DeviceListConstants$Information
    //   53: astore 43
    //   55: aload_1
    //   56: invokevirtual 113	java/lang/Object:getClass	()Ljava/lang/Class;
    //   59: new 115	java/lang/StringBuilder
    //   62: dup
    //   63: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   66: ldc 118
    //   68: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: aload 43
    //   73: invokevirtual 126	com/belkin/constant/DeviceListConstants$Information:getValue	()Ljava/lang/String;
    //   76: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   82: iconst_0
    //   83: anewarray 131	java/lang/Class
    //   86: invokevirtual 135	java/lang/Class:getMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   89: astore 48
    //   91: aload 48
    //   93: invokevirtual 140	java/lang/reflect/Method:getReturnType	()Ljava/lang/Class;
    //   96: astore 49
    //   98: ldc -114
    //   100: aload 49
    //   102: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   105: ifeq +57 -> 162
    //   108: aload 48
    //   110: aload_1
    //   111: iconst_0
    //   112: anewarray 4	java/lang/Object
    //   115: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   118: checkcast 142	java/lang/String
    //   121: astore 51
    //   123: aload_3
    //   124: aload 43
    //   126: invokevirtual 126	com/belkin/constant/DeviceListConstants$Information:getValue	()Ljava/lang/String;
    //   129: invokestatic 156	com/belkin/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   132: aload 51
    //   134: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   137: pop
    //   138: goto -105 -> 33
    //   141: astore 47
    //   143: aload 47
    //   145: invokevirtual 163	java/lang/NoSuchMethodException:printStackTrace	()V
    //   148: goto -115 -> 33
    //   151: astore 4
    //   153: aload 4
    //   155: invokevirtual 164	org/json/JSONException:printStackTrace	()V
    //   158: aconst_null
    //   159: astore_2
    //   160: aload_2
    //   161: areturn
    //   162: getstatic 170	java/lang/Integer:TYPE	Ljava/lang/Class;
    //   165: aload 49
    //   167: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   170: ifeq +39 -> 209
    //   173: new 115	java/lang/StringBuilder
    //   176: dup
    //   177: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   180: aload 48
    //   182: aload_1
    //   183: iconst_0
    //   184: anewarray 4	java/lang/Object
    //   187: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   190: checkcast 166	java/lang/Integer
    //   193: invokevirtual 173	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   196: ldc -81
    //   198: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   201: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   204: astore 51
    //   206: goto -83 -> 123
    //   209: getstatic 178	java/lang/Boolean:TYPE	Ljava/lang/Class;
    //   212: aload 49
    //   214: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   217: istore 50
    //   219: aconst_null
    //   220: astore 51
    //   222: iload 50
    //   224: ifeq -101 -> 123
    //   227: aload 48
    //   229: aload_1
    //   230: iconst_0
    //   231: anewarray 4	java/lang/Object
    //   234: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   237: checkcast 177	java/lang/Boolean
    //   240: astore 51
    //   242: goto -119 -> 123
    //   245: astore 46
    //   247: aload 46
    //   249: invokevirtual 179	java/lang/IllegalAccessException:printStackTrace	()V
    //   252: goto -219 -> 33
    //   255: astore 45
    //   257: aload 45
    //   259: invokevirtual 180	java/lang/IllegalArgumentException:printStackTrace	()V
    //   262: goto -229 -> 33
    //   265: astore 44
    //   267: aload 44
    //   269: invokevirtual 181	java/lang/reflect/InvocationTargetException:printStackTrace	()V
    //   272: goto -239 -> 33
    //   275: new 86	org/json/JSONObject
    //   278: dup
    //   279: invokespecial 87	org/json/JSONObject:<init>	()V
    //   282: astore 6
    //   284: getstatic 185	com/belkin/constant/DeviceListConstants$Properties:properties	Ljava/util/Set;
    //   287: invokeinterface 99 1 0
    //   292: astore 7
    //   294: aload 7
    //   296: invokeinterface 105 1 0
    //   301: ifeq +235 -> 536
    //   304: aload 7
    //   306: invokeinterface 109 1 0
    //   311: checkcast 183	com/belkin/constant/DeviceListConstants$Properties
    //   314: astore 32
    //   316: aload_1
    //   317: invokevirtual 113	java/lang/Object:getClass	()Ljava/lang/Class;
    //   320: new 115	java/lang/StringBuilder
    //   323: dup
    //   324: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   327: ldc 118
    //   329: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   332: aload 32
    //   334: invokevirtual 186	com/belkin/constant/DeviceListConstants$Properties:getValue	()Ljava/lang/String;
    //   337: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   343: iconst_0
    //   344: anewarray 131	java/lang/Class
    //   347: invokevirtual 135	java/lang/Class:getMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   350: astore 38
    //   352: aload 38
    //   354: invokevirtual 140	java/lang/reflect/Method:getReturnType	()Ljava/lang/Class;
    //   357: astore 39
    //   359: ldc -114
    //   361: aload 39
    //   363: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   366: ifeq +47 -> 413
    //   369: aload 38
    //   371: aload_1
    //   372: iconst_0
    //   373: anewarray 4	java/lang/Object
    //   376: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   379: checkcast 142	java/lang/String
    //   382: astore 41
    //   384: aload 6
    //   386: aload 32
    //   388: invokevirtual 186	com/belkin/constant/DeviceListConstants$Properties:getValue	()Ljava/lang/String;
    //   391: invokestatic 156	com/belkin/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   394: aload 41
    //   396: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   399: pop
    //   400: goto -106 -> 294
    //   403: astore 37
    //   405: aload 37
    //   407: invokevirtual 164	org/json/JSONException:printStackTrace	()V
    //   410: goto -116 -> 294
    //   413: getstatic 170	java/lang/Integer:TYPE	Ljava/lang/Class;
    //   416: aload 39
    //   418: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   421: ifeq +39 -> 460
    //   424: new 115	java/lang/StringBuilder
    //   427: dup
    //   428: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   431: aload 38
    //   433: aload_1
    //   434: iconst_0
    //   435: anewarray 4	java/lang/Object
    //   438: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   441: checkcast 166	java/lang/Integer
    //   444: invokevirtual 173	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   447: ldc -81
    //   449: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   452: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   455: astore 41
    //   457: goto -73 -> 384
    //   460: getstatic 178	java/lang/Boolean:TYPE	Ljava/lang/Class;
    //   463: aload 39
    //   465: invokevirtual 146	java/lang/Class:isAssignableFrom	(Ljava/lang/Class;)Z
    //   468: istore 40
    //   470: aconst_null
    //   471: astore 41
    //   473: iload 40
    //   475: ifeq -91 -> 384
    //   478: aload 38
    //   480: aload_1
    //   481: iconst_0
    //   482: anewarray 4	java/lang/Object
    //   485: invokevirtual 150	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   488: checkcast 177	java/lang/Boolean
    //   491: astore 41
    //   493: goto -109 -> 384
    //   496: astore 36
    //   498: aload 36
    //   500: invokevirtual 163	java/lang/NoSuchMethodException:printStackTrace	()V
    //   503: goto -209 -> 294
    //   506: astore 35
    //   508: aload 35
    //   510: invokevirtual 179	java/lang/IllegalAccessException:printStackTrace	()V
    //   513: goto -219 -> 294
    //   516: astore 34
    //   518: aload 34
    //   520: invokevirtual 180	java/lang/IllegalArgumentException:printStackTrace	()V
    //   523: goto -229 -> 294
    //   526: astore 33
    //   528: aload 33
    //   530: invokevirtual 181	java/lang/reflect/InvocationTargetException:printStackTrace	()V
    //   533: goto -239 -> 294
    //   536: new 86	org/json/JSONObject
    //   539: dup
    //   540: invokespecial 87	org/json/JSONObject:<init>	()V
    //   543: astore 8
    //   545: aload 8
    //   547: ldc -68
    //   549: aload_1
    //   550: invokevirtual 193	com/belkin/wemo/cache/data/DeviceInformation:getBinaryState	()Ljava/lang/String;
    //   553: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   556: pop
    //   557: aload_1
    //   558: invokevirtual 197	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   561: astore 10
    //   563: ldc 20
    //   565: new 115	java/lang/StringBuilder
    //   568: dup
    //   569: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   572: ldc -57
    //   574: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   577: aload 10
    //   579: invokevirtual 173	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   582: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   585: invokestatic 202	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   588: aload 10
    //   590: invokevirtual 205	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   593: astore 11
    //   595: aload 10
    //   597: invokevirtual 209	org/json/JSONObject:length	()I
    //   600: ifle +125 -> 725
    //   603: aload 11
    //   605: invokeinterface 105 1 0
    //   610: ifeq +122 -> 732
    //   613: aload 11
    //   615: invokeinterface 109 1 0
    //   620: checkcast 142	java/lang/String
    //   623: astore 27
    //   625: aload 10
    //   627: aload 27
    //   629: invokevirtual 212	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   632: checkcast 86	org/json/JSONObject
    //   635: astore 30
    //   637: aload 8
    //   639: aload 27
    //   641: invokestatic 156	com/belkin/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   644: aload 30
    //   646: ldc -42
    //   648: invokevirtual 217	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   651: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   654: pop
    //   655: goto -52 -> 603
    //   658: astore 29
    //   660: ldc 20
    //   662: new 115	java/lang/StringBuilder
    //   665: dup
    //   666: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   669: ldc -37
    //   671: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   674: aload 10
    //   676: aload 27
    //   678: invokevirtual 212	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   681: invokevirtual 173	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   684: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   687: invokestatic 222	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   690: goto -87 -> 603
    //   693: astore 28
    //   695: ldc 20
    //   697: new 115	java/lang/StringBuilder
    //   700: dup
    //   701: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   704: ldc -32
    //   706: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   709: aload 27
    //   711: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   714: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   717: aload 28
    //   719: invokestatic 227	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   722: goto -119 -> 603
    //   725: ldc 20
    //   727: ldc -27
    //   729: invokestatic 84	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   732: aload_2
    //   733: ldc 14
    //   735: aload_3
    //   736: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   739: pop
    //   740: aload_2
    //   741: ldc 17
    //   743: aload 6
    //   745: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   748: pop
    //   749: aload_2
    //   750: ldc 8
    //   752: aload 8
    //   754: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   757: pop
    //   758: aload_1
    //   759: invokevirtual 232	com/belkin/wemo/cache/data/DeviceInformation:getBridgeUDN	()Ljava/lang/String;
    //   762: invokestatic 238	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   765: ifne -605 -> 160
    //   768: aload_1
    //   769: invokevirtual 241	com/belkin/wemo/cache/data/DeviceInformation:getCapabilities	()Ljava/lang/String;
    //   772: astore 15
    //   774: ldc 20
    //   776: new 115	java/lang/StringBuilder
    //   779: dup
    //   780: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   783: ldc -13
    //   785: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   788: aload 15
    //   790: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   793: ldc -11
    //   795: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   798: aload 15
    //   800: invokevirtual 246	java/lang/String:length	()I
    //   803: invokevirtual 249	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   806: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   809: invokestatic 202	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   812: aload 15
    //   814: invokestatic 238	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   817: ifeq +216 -> 1033
    //   820: new 86	org/json/JSONObject
    //   823: dup
    //   824: invokespecial 87	org/json/JSONObject:<init>	()V
    //   827: astore 16
    //   829: aload_1
    //   830: invokevirtual 252	com/belkin/wemo/cache/data/DeviceInformation:getCapabilityID	()Ljava/lang/String;
    //   833: astore 17
    //   835: aload_1
    //   836: invokevirtual 255	com/belkin/wemo/cache/data/DeviceInformation:getCurrentState	()Ljava/lang/String;
    //   839: astore 18
    //   841: ldc 20
    //   843: new 115	java/lang/StringBuilder
    //   846: dup
    //   847: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   850: ldc_w 257
    //   853: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   856: aload 17
    //   858: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   861: ldc_w 259
    //   864: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   867: aload 18
    //   869: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   872: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   875: invokestatic 202	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   878: aload 17
    //   880: invokestatic 238	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   883: ifne +139 -> 1022
    //   886: aload 18
    //   888: invokestatic 238	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   891: ifne +131 -> 1022
    //   894: aload 17
    //   896: ldc_w 261
    //   899: iconst_m1
    //   900: invokevirtual 265	java/lang/String:split	(Ljava/lang/String;I)[Ljava/lang/String;
    //   903: astore 20
    //   905: aload 18
    //   907: ldc_w 261
    //   910: iconst_m1
    //   911: invokevirtual 265	java/lang/String:split	(Ljava/lang/String;I)[Ljava/lang/String;
    //   914: astore 21
    //   916: aload 20
    //   918: arraylength
    //   919: istore 22
    //   921: iload 22
    //   923: aload 21
    //   925: arraylength
    //   926: if_icmpne +89 -> 1015
    //   929: iconst_0
    //   930: istore 23
    //   932: iload 23
    //   934: iload 22
    //   936: if_icmpge +86 -> 1022
    //   939: aload 20
    //   941: iload 23
    //   943: aaload
    //   944: astore 24
    //   946: aload 21
    //   948: iload 23
    //   950: aaload
    //   951: astore 25
    //   953: ldc 20
    //   955: new 115	java/lang/StringBuilder
    //   958: dup
    //   959: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   962: ldc_w 267
    //   965: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   968: aload 24
    //   970: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   973: ldc_w 269
    //   976: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   979: aload 25
    //   981: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   984: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   987: invokestatic 222	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   990: aload 16
    //   992: getstatic 273	com/belkin/wemo/cache/devicelist/DeviceListManager:capabalityProfileList	Ljava/util/LinkedHashMap;
    //   995: aload 24
    //   997: invokevirtual 278	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   1000: checkcast 142	java/lang/String
    //   1003: aload 25
    //   1005: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1008: pop
    //   1009: iinc 23 1
    //   1012: goto -80 -> 932
    //   1015: ldc 20
    //   1017: ldc -27
    //   1019: invokestatic 84	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1022: aload_2
    //   1023: ldc 11
    //   1025: aload 16
    //   1027: invokevirtual 160	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1030: pop
    //   1031: aload_2
    //   1032: areturn
    //   1033: new 86	org/json/JSONObject
    //   1036: dup
    //   1037: aload 15
    //   1039: invokespecial 281	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   1042: astore 16
    //   1044: goto -22 -> 1022
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1047	0	this	DeviceListController
    //   0	1047	1	paramDeviceInformation	DeviceInformation
    //   14	1018	2	localJSONObject1	JSONObject
    //   22	714	3	localJSONObject2	JSONObject
    //   151	3	4	localJSONException1	JSONException
    //   31	13	5	localIterator1	Iterator
    //   282	462	6	localJSONObject3	JSONObject
    //   292	13	7	localIterator2	Iterator
    //   543	210	8	localJSONObject4	JSONObject
    //   561	114	10	localJSONObject5	JSONObject
    //   593	21	11	localIterator3	Iterator
    //   772	266	15	str1	String
    //   827	216	16	localJSONObject6	JSONObject
    //   833	62	17	str2	String
    //   839	67	18	str3	String
    //   903	37	20	arrayOfString1	String[]
    //   914	33	21	arrayOfString2	String[]
    //   919	18	22	i	int
    //   930	80	23	j	int
    //   944	52	24	str4	String
    //   951	53	25	str5	String
    //   623	87	27	str6	String
    //   693	25	28	localJSONException2	JSONException
    //   658	1	29	localClassCastException	ClassCastException
    //   635	10	30	localJSONObject7	JSONObject
    //   314	73	32	localProperties	com.belkin.constant.DeviceListConstants.Properties
    //   526	3	33	localInvocationTargetException1	java.lang.reflect.InvocationTargetException
    //   516	3	34	localIllegalArgumentException1	IllegalArgumentException
    //   506	3	35	localIllegalAccessException1	IllegalAccessException
    //   496	3	36	localNoSuchMethodException1	NoSuchMethodException
    //   403	3	37	localJSONException3	JSONException
    //   350	129	38	localMethod1	java.lang.reflect.Method
    //   357	107	39	localClass1	Class
    //   468	6	40	bool1	boolean
    //   382	110	41	localObject1	Object
    //   53	72	43	localInformation	com.belkin.constant.DeviceListConstants.Information
    //   265	3	44	localInvocationTargetException2	java.lang.reflect.InvocationTargetException
    //   255	3	45	localIllegalArgumentException2	IllegalArgumentException
    //   245	3	46	localIllegalAccessException2	IllegalAccessException
    //   141	3	47	localNoSuchMethodException2	NoSuchMethodException
    //   89	139	48	localMethod2	java.lang.reflect.Method
    //   96	117	49	localClass2	Class
    //   217	6	50	bool2	boolean
    //   121	120	51	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   55	123	141	java/lang/NoSuchMethodException
    //   123	138	141	java/lang/NoSuchMethodException
    //   162	206	141	java/lang/NoSuchMethodException
    //   209	219	141	java/lang/NoSuchMethodException
    //   227	242	141	java/lang/NoSuchMethodException
    //   15	33	151	org/json/JSONException
    //   33	55	151	org/json/JSONException
    //   55	123	151	org/json/JSONException
    //   123	138	151	org/json/JSONException
    //   143	148	151	org/json/JSONException
    //   162	206	151	org/json/JSONException
    //   209	219	151	org/json/JSONException
    //   227	242	151	org/json/JSONException
    //   247	252	151	org/json/JSONException
    //   257	262	151	org/json/JSONException
    //   267	272	151	org/json/JSONException
    //   275	294	151	org/json/JSONException
    //   294	316	151	org/json/JSONException
    //   405	410	151	org/json/JSONException
    //   498	503	151	org/json/JSONException
    //   508	513	151	org/json/JSONException
    //   518	523	151	org/json/JSONException
    //   528	533	151	org/json/JSONException
    //   536	603	151	org/json/JSONException
    //   603	625	151	org/json/JSONException
    //   660	690	151	org/json/JSONException
    //   695	722	151	org/json/JSONException
    //   725	732	151	org/json/JSONException
    //   732	929	151	org/json/JSONException
    //   939	1009	151	org/json/JSONException
    //   1015	1022	151	org/json/JSONException
    //   1022	1031	151	org/json/JSONException
    //   1033	1044	151	org/json/JSONException
    //   55	123	245	java/lang/IllegalAccessException
    //   123	138	245	java/lang/IllegalAccessException
    //   162	206	245	java/lang/IllegalAccessException
    //   209	219	245	java/lang/IllegalAccessException
    //   227	242	245	java/lang/IllegalAccessException
    //   55	123	255	java/lang/IllegalArgumentException
    //   123	138	255	java/lang/IllegalArgumentException
    //   162	206	255	java/lang/IllegalArgumentException
    //   209	219	255	java/lang/IllegalArgumentException
    //   227	242	255	java/lang/IllegalArgumentException
    //   55	123	265	java/lang/reflect/InvocationTargetException
    //   123	138	265	java/lang/reflect/InvocationTargetException
    //   162	206	265	java/lang/reflect/InvocationTargetException
    //   209	219	265	java/lang/reflect/InvocationTargetException
    //   227	242	265	java/lang/reflect/InvocationTargetException
    //   316	384	403	org/json/JSONException
    //   384	400	403	org/json/JSONException
    //   413	457	403	org/json/JSONException
    //   460	470	403	org/json/JSONException
    //   478	493	403	org/json/JSONException
    //   316	384	496	java/lang/NoSuchMethodException
    //   384	400	496	java/lang/NoSuchMethodException
    //   413	457	496	java/lang/NoSuchMethodException
    //   460	470	496	java/lang/NoSuchMethodException
    //   478	493	496	java/lang/NoSuchMethodException
    //   316	384	506	java/lang/IllegalAccessException
    //   384	400	506	java/lang/IllegalAccessException
    //   413	457	506	java/lang/IllegalAccessException
    //   460	470	506	java/lang/IllegalAccessException
    //   478	493	506	java/lang/IllegalAccessException
    //   316	384	516	java/lang/IllegalArgumentException
    //   384	400	516	java/lang/IllegalArgumentException
    //   413	457	516	java/lang/IllegalArgumentException
    //   460	470	516	java/lang/IllegalArgumentException
    //   478	493	516	java/lang/IllegalArgumentException
    //   316	384	526	java/lang/reflect/InvocationTargetException
    //   384	400	526	java/lang/reflect/InvocationTargetException
    //   413	457	526	java/lang/reflect/InvocationTargetException
    //   460	470	526	java/lang/reflect/InvocationTargetException
    //   478	493	526	java/lang/reflect/InvocationTargetException
    //   625	655	658	java/lang/ClassCastException
    //   625	655	693	org/json/JSONException
  }
  
  public static DeviceListController getInstance(Context paramContext)
  {
    if (devListController == null) {
      devListController = new DeviceListController(paramContext);
    }
    return devListController;
  }
  
  private void processRulesFetchReset(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    IWeMoRules localIWeMoRules = WeMoRulesFactory.getInstance(this.mContext);
    FetchDevicesRulesCallback localFetchDevicesRulesCallback = new FetchDevicesRulesCallback(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, paramString, paramJSONObject1, paramJSONObject2);
    localIWeMoRules.fetchRulesAndSyncDevices(this.mContext, localFetchDevicesRulesCallback, localFetchDevicesRulesCallback);
  }
  
  public JSONObject addDevice(DeviceInformation paramDeviceInformation)
  {
    LogUtils.infoLog("DeviceListController", " In addDevice ");
    if (paramDeviceInformation == null) {
      return null;
    }
    new JSONObject();
    JSONObject localJSONObject = createJSONObj(paramDeviceInformation);
    LogUtils.infoLog("DeviceListController", " In add device deviceObj: " + localJSONObject.toString());
    return localJSONObject;
  }
  
  public boolean addToGroup(JSONArray paramJSONArray)
  {
    boolean bool1 = true;
    LogUtils.infoLog("DeviceListController", " In addToGroup ");
    if (paramJSONArray == null) {
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      LogUtils.infoLog("DeviceListController", " Params:" + paramJSONArray);
      try
      {
        if (paramJSONArray.length() >= 3)
        {
          str = (String)paramJSONArray.get(0);
          if (TextUtils.isEmpty(str))
          {
            bool1 = false;
            LogUtils.errorLog("DeviceListController", "addToGroup(). Bridge UDN is Empty/Null");
            return false;
          }
        }
      }
      catch (JSONException localJSONException)
      {
        String str;
        localJSONException.printStackTrace();
        return bool1;
        JSONObject localJSONObject = paramJSONArray.getJSONObject(1);
        boolean bool2 = paramJSONArray.getBoolean(2);
        sDeviceListManager.addGroup("CreateGroup", str, localJSONObject, bool2);
        return bool1;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    return bool1;
  }
  
  public boolean areNestFirmwareSupported()
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    return sDeviceListManager.areNestFirmwareSupported();
  }
  
  public void calibrate(JSONObject paramJSONObject, final CallbackContext paramCallbackContext)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "calibrate: json containing calibration parameters: " + paramJSONObject.toString());
    }
    for (;;)
    {
      try
      {
        String str1 = paramJSONObject.getString("udn");
        if (!paramJSONObject.has("binaryState")) {
          break label199;
        }
        str2 = paramJSONObject.getString("binaryState");
        if (!paramJSONObject.has("fader")) {
          break label206;
        }
        str3 = paramJSONObject.getString("fader");
        if (paramJSONObject.has("level"))
        {
          str4 = paramJSONObject.getString("level");
          DeviceListManager.getInstance(this.mContext).calibrate(str1, str2, str3, str4, new CalibrateSuccessCallback()new CalibrateErrorCallback
          {
            public void onCalibrationPassed()
            {
              if (paramCallbackContext != null)
              {
                PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
                paramCallbackContext.sendPluginResult(localPluginResult);
              }
            }
          }, new CalibrateErrorCallback()
          {
            public void onCalibrationFailed(String paramAnonymousString)
            {
              if (paramCallbackContext != null)
              {
                PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
                paramCallbackContext.sendPluginResult(localPluginResult);
              }
            }
          });
          return;
        }
        String str4 = "";
        continue;
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
      }
      catch (JSONException localJSONException)
      {
        LogUtils.errorLog("DeviceListController", "calibrate: NumberFormatException while parsing ruleId: ", localJSONException);
        if (paramCallbackContext == null) {
          break label198;
        }
      }
      return;
      LogUtils.errorLog("DeviceListController", "calibrate: JSONObject containing params in NULL");
      if (paramCallbackContext != null) {
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "calibrate: JSONObject containing params in NULL"));
      }
      label198:
      return;
      label199:
      String str2 = "";
      continue;
      label206:
      String str3 = "";
    }
  }
  
  public void checkBhonjourInNetwork(Context paramContext, CallbackContext paramCallbackContext)
  {
    try
    {
      NsdUtil localNsdUtil = new NsdUtil(paramContext);
      localNsdUtil.initializeNsd(paramCallbackContext);
      localNsdUtil.discoverServices();
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("DeviceListController", localException.toString());
    }
  }
  
  public void clearCache()
  {
    if (!this.mSDKNetworkUtil.isHomeNetwork())
    {
      LogUtils.infoLog("DeviceListController", "Remote mode clearing cache");
      sDeviceListManager.resetHomeNetwork();
    }
    SharePreferences localSharePreferences = new SharePreferences(this.mContext);
    localSharePreferences.setRemoteEnabled(false);
    localSharePreferences.setRemoteAccessSSID(null);
    localSharePreferences.setHomeSSIDs(null);
    localSharePreferences.setARPMacs(null);
    localSharePreferences.setCacheArpMac(this.mSDKNetworkUtil.getArpMac());
    localSharePreferences.storePrivateKey(null);
    localSharePreferences.setRemoteAutoEnableNeeded(false);
    localSharePreferences.setDBVersion("0");
    RemoteAccessBroadcastService.getInstance().remoteDisabledNotify();
    List localList = sDeviceListManager.getDeviceUDNListFromDB();
    LogUtils.infoLog("DeviceListController", "Nest devicesInDBList: " + localList.toString());
    if ((localList != null) && (localList.size() > 0)) {
      for (int i = 0; i < localList.size(); i++) {
        if (((String)localList.get(i)).contains("WEMO00")) {
          sDeviceListManager.removeDeviceByUDN((String)localList.get(i), true, true);
        }
      }
    }
  }
  
  public void collectEmailIDToCloud()
  {
    LogUtils.infoLog("DeviceListController", " In collectEmailIDToCloud ");
    sDeviceListManager.collectEmailIDToCloud();
  }
  
  public void configureDimmingRange(CallbackContext paramCallbackContext, JSONObject paramJSONObject)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "configureDimmingRange: parameters: " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        String str1 = paramJSONObject.getString("udn");
        String str2 = paramJSONObject.getString("turnOnLevel");
        String str3 = paramJSONObject.getString("minLevel");
        String str4 = paramJSONObject.getString("maxLevel");
        ConfigureDimmingRangeCallback localConfigureDimmingRangeCallback = new ConfigureDimmingRangeCallback(paramCallbackContext);
        DeviceListManager.getInstance(this.mContext).configureDimmingRange(str1, str3, str4, str2, localConfigureDimmingRangeCallback, localConfigureDimmingRangeCallback);
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "configureDimmingRange: JSONException while parsing parameters: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "configureDimmingRange: NumberFormatException while parsing parameters: ", localNumberFormatException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "JSONObject containing configureDimmingRange params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "JSONObject containing configureDimmingRange params in NULL"));
  }
  
  public void configureHushMode(CallbackContext paramCallbackContext, JSONObject paramJSONObject)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "configureHushMode: parameters: " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        String str1 = paramJSONObject.getString("udn");
        String str2 = paramJSONObject.getString("hushMode");
        ConfigureHushModeCallback localConfigureHushModeCallback = new ConfigureHushModeCallback(paramCallbackContext);
        DeviceListManager.getInstance(this.mContext).configureHushMode(str1, str2, localConfigureHushModeCallback, localConfigureHushModeCallback);
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "configureHushMode: JSONException while parsing parameters for configureHushMode: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "JSONObject containing night mode configuration params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
  }
  
  public void deauthorizeNest()
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    sDeviceListManager.deActivateNest();
  }
  
  public JSONArray findLedBulb(String paramString)
  {
    JSONArray localJSONArray1 = new JSONArray();
    try
    {
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      JSONArray localJSONArray2 = sDeviceListManager.findLedBulb(paramString);
      return localJSONArray2;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("DeviceListController", "Exception in findLedBulb");
    }
    return localJSONArray1;
  }
  
  public JSONObject getAttributeListConfigParameters(String paramString)
  {
    JSONObject localJSONObject1;
    if ((paramString == null) || (paramString.isEmpty())) {
      localJSONObject1 = null;
    }
    for (;;)
    {
      return localJSONObject1;
      localJSONObject1 = new JSONObject();
      try
      {
        JSONObject localJSONObject2 = new JSONObject(paramString);
        Iterator localIterator = localJSONObject2.keys();
        if (localJSONObject2.length() > 0) {
          while (localIterator.hasNext())
          {
            String str = (String)localIterator.next();
            JSONObject localJSONObject3 = (JSONObject)localJSONObject2.get(str);
            localJSONObject3.remove("value");
            localJSONObject1.put(str, localJSONObject3);
          }
        }
        LogUtils.infoLog("DeviceListController", "NO KEY");
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return localJSONObject1;
      }
    }
    return localJSONObject1;
  }
  
  public boolean getBlobStorage(String paramString, JSONObject paramJSONObject)
  {
    try
    {
      boolean bool = sDeviceListManager.getBlobStorage(paramString, paramJSONObject);
      return bool;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("DeviceListController", "Exception in getBlobStorage", localException);
    }
    return false;
  }
  
  public JSONObject getDevice(String paramString)
  {
    LogUtils.infoLog("DeviceListController", " In getDevice ");
    JSONObject localJSONObject1;
    if ((paramString == null) || (paramString.isEmpty())) {
      localJSONObject1 = null;
    }
    DeviceInformation localDeviceInformation;
    do
    {
      return localJSONObject1;
      localJSONObject1 = new JSONObject();
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      localDeviceInformation = sDeviceListManager.getDeviceObjectByUDN(paramString);
    } while (localDeviceInformation == null);
    try
    {
      localJSONObject1 = createJSONObj(localDeviceInformation);
      LogUtils.infoLog("DeviceListController", " In getDevice deviceObj: " + localJSONObject1.toString());
      JSONObject localJSONObject2 = localJSONObject1.getJSONObject("attributes");
      return localJSONObject2;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return localJSONObject1;
  }
  
  public JSONArray getDevices()
  {
    LogUtils.infoLog("DeviceListController", "In getDevices");
    JSONArray localJSONArray = new JSONArray();
    List localList = sDeviceListManager.getDeviceInformationListFromDB();
    LogUtils.debugLog("DeviceListController", "Count of initial devices fetched from DeviceListManager: " + localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator.next();
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      DeviceInformation localDeviceInformation2 = sDeviceListManager.getDevice(localDeviceInformation1.getUDN());
      if (localDeviceInformation2 != null) {
        localDeviceInformation1.setSerialNumber(localDeviceInformation2.getSerialNumber());
      }
      JSONObject localJSONObject = createJSONObj(localDeviceInformation1);
      LogUtils.debugLog("DeviceListController", "getDevices(): Device in iterator: " + localJSONObject.toString());
      if (localJSONObject != null) {
        localJSONArray.put(localJSONObject);
      }
    }
    return localJSONArray;
  }
  
  public JSONArray getDevicesInfo()
  {
    String str1 = null;
    String str2 = null;
    LogUtils.infoLog("DeviceListController", "In getDevicesInfo");
    JSONArray localJSONArray = new JSONArray();
    List localList = sDeviceListManager.getDeviceInformationListFromDB();
    LogUtils.debugLog("DeviceListController", "Count of initial devices fetched from DeviceListManager: " + localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator.next();
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      String str3 = localDeviceInformation1.getUDN();
      if (IsDevice.Bridge(str3))
      {
        str1 = localDeviceInformation1.getIP();
        str2 = localDeviceInformation1.getMAC();
        LogUtils.debugLog("DeviceListController", "Device is bridge and its ip - " + str1 + " :macAddress: " + str2);
      }
      DeviceInformation localDeviceInformation2 = sDeviceListManager.getDevice(str3);
      if (localDeviceInformation2 != null) {
        localDeviceInformation1.setSerialNumber(localDeviceInformation2.getSerialNumber());
      }
      if (sDeviceListManager.isZigbee(str3))
      {
        localDeviceInformation1.setIP(str1);
        localDeviceInformation1.setMAC(str2);
        localDeviceInformation1.setSerialNumber(str3);
        LogUtils.debugLog("DeviceListController", "IsDevice.Bridge(UDN) ip - " + str1 + " :macAddress: " + str2 + " :serialNo: " + str3);
      }
      JSONObject localJSONObject = createJSONObj(localDeviceInformation1);
      LogUtils.debugLog("DeviceListController", "getDevices(): Device in iterator: " + localJSONObject.toString());
      if (localJSONObject != null) {
        localJSONArray.put(localJSONObject);
      }
    }
    return localJSONArray;
  }
  
  public JSONArray getFirmwareList()
  {
    JSONArray localJSONArray1 = getDevices();
    localJSONArray2 = new JSONArray();
    int i = 0;
    try
    {
      while (i < localJSONArray1.length())
      {
        JSONObject localJSONObject1 = localJSONArray1.getJSONObject(i);
        JSONObject localJSONObject2 = localJSONObject1.getJSONObject("information");
        JSONObject localJSONObject3 = localJSONObject1.getJSONObject("properties");
        JSONObject localJSONObject4 = new JSONObject();
        localJSONObject4.put("udn", localJSONObject2.getString("udn"));
        localJSONObject4.put("friendlyName", localJSONObject3.getString("friendlyName"));
        localJSONObject4.put("type", localJSONObject2.getString("productType"));
        localJSONObject4.put("devicefirmware", localJSONObject3.getString("firmwareVersion"));
        localJSONObject4.put("pluginId", "");
        localJSONObject4.put("macAddress", "");
        localJSONArray2.put(localJSONObject4);
        i++;
      }
      return localJSONArray2;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      LogUtils.infoLog("DeviceListController", "smartDevicePlugin:Native:firmware list result:: " + localJSONArray2);
    }
  }
  
  public void getNestDevices()
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    sDeviceListManager.getNestDevicesFromCloud();
  }
  
  public void getNightModeConfiguration() {}
  
  public String getSubDevicesCount(String paramString)
  {
    return "" + sDeviceListManager.getSubDevicesCount(paramString);
  }
  
  public void hideDevice(String paramString, int paramInt)
  {
    try
    {
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      sDeviceListManager.hideDevice(paramString, paramInt);
      new BridgeAPI(this.mContext).makeRequstToBridge(paramString);
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("DeviceListController", "Exception in findLedBulb");
    }
  }
  
  public void hideGroup(String paramString, CallbackContext paramCallbackContext, SmartDevicePlugin paramSmartDevicePlugin)
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    HideGroupCallback localHideGroupCallback = new HideGroupCallback(paramCallbackContext, paramSmartDevicePlugin);
    sDeviceListManager.hideGroup(paramString, localHideGroupCallback, localHideGroupCallback);
  }
  
  public boolean isFWUpgradeInProgress()
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    return sDeviceListManager.isFWUpdateInProgress();
  }
  
  public void nestTokenExists()
  {
    if (sDeviceListManager == null) {
      sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    }
    sDeviceListManager.nestTokenExistenceCheck();
  }
  
  public void refreshLongPressRuleDetails(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "refreshLongPressRuleDetails: json containing UDN for refresh: " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        String str1 = paramJSONObject.getString("ruleId");
        String str2 = paramJSONObject.getString("udn");
        DeviceListManager.getInstance(this.mContext).refreshLongPressRuleDetails(Integer.valueOf(str1).intValue(), str2);
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "refreshLongPressRuleDetails: JSONException while parsing params: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "refreshLongPressRuleDetails: NumberFormatException while parsing ruleId: ", localNumberFormatException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "refreshLongPressRuleDetails: JSONObject containing params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "refreshLongPressRuleDetails: JSONObject containing params in NULL"));
  }
  
  public void removeGroup(JSONArray paramJSONArray)
  {
    LogUtils.infoLog("DeviceListController", " In removeFromGroup ");
    if (paramJSONArray == null) {
      return;
    }
    LogUtils.infoLog("DeviceListController", " Params:" + paramJSONArray);
    try
    {
      String str = (String)paramJSONArray.get(0);
      int i = paramJSONArray.getInt(1);
      sDeviceListManager.removeGroup("RemoveGroup", str, i);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public JSONObject resetDevice(final PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, final String paramString, final JSONObject paramJSONObject1, final JSONObject paramJSONObject2, Boolean... paramVarArgs)
    throws JSONException
  {
    final JSONObject localJSONObject1 = new JSONObject();
    BridgeAPI localBridgeAPI = new BridgeAPI(this.mContext);
    String str1;
    try
    {
      str1 = paramJSONObject1.getString("udn");
      if ((TextUtils.isEmpty(paramString)) || (paramJSONObject1 == null))
      {
        LogUtils.errorLog("DeviceListController", "resetType or device missing: resetType: " + paramString + ",device: " + paramJSONObject1 + ",stateData: " + paramJSONObject2);
        localJSONObject1.put("error", "resetType, device or stateData missing: resetType: " + paramString + ",device: " + paramJSONObject1 + ",stateData: " + paramJSONObject2);
        return localJSONObject1;
      }
      LogUtils.infoLog("DeviceListController", "resetDevice start resetType: " + paramString + ", device: " + paramJSONObject1 + ", stateData: " + paramJSONObject2);
      final CountDownLatch localCountDownLatch;
      if ((paramString.equals("all")) || (paramString.equals("fnIconRules")))
      {
        localCountDownLatch = new CountDownLatch(1);
        String str2 = str1;
        if (DeviceListManager.getInstance(this.mContext).isZigbee(str1))
        {
          String str3 = DeviceListManager.getInstance(this.mContext).getDevice(str1).getBridgeUDN();
          str2 = str3 + ":" + str1;
        }
        RMIRules localRMIRules = RMRulesSDK.instance().getRules();
        RMResetDeviceRulesSuccessCallback local5 = new RMResetDeviceRulesSuccessCallback()
        {
          public void onAllDeviceRulesReset(String paramAnonymousString)
          {
            DeviceListManager.getInstance(DeviceListController.this.mContext).refreshLongPressRuleDetails(paramAnonymousString, (RMLongPressRule)null);
            localCountDownLatch.countDown();
          }
        };
        RMResetDeviceRulesErrorCallback local6 = new RMResetDeviceRulesErrorCallback()
        {
          public void onError(RMRulesError paramAnonymousRMRulesError)
          {
            if (paramPluginResultErrorCallback != null) {
              paramPluginResultErrorCallback.onError(paramAnonymousRMRulesError.getErrorMessage());
            }
            try
            {
              localJSONObject1.put("error", "Error while deleting rules - resetType: " + paramString + ",device: " + paramJSONObject1 + ",stateData: " + paramJSONObject2);
              localCountDownLatch.countDown();
              return;
            }
            catch (Exception localException)
            {
              for (;;)
              {
                LogUtils.errorLog("DeviceListController", "Exception in resetDevice", localException);
              }
            }
          }
        };
        localRMIRules.deleteRulesFromDevice(str2, local5, local6);
      }
      if (sDeviceListManager != null) {
        break label567;
      }
    }
    catch (JSONException localJSONException)
    {
      try
      {
        localCountDownLatch.await();
        if ((paramString.equals("wifi")) || (paramString.equals("resetUsageData")) || (paramString.equals("resetThreshold")) || (paramString.equals("resetAutoThreshold")) || (paramJSONObject2 != null)) {
          break label551;
        }
        localJSONObject1.put("error", " stateData missing: resetType: " + paramString + ",device: " + paramJSONObject1 + ",stateData: " + paramJSONObject2);
        return localJSONObject1;
      }
      catch (InterruptedException localInterruptedException)
      {
        LogUtils.errorLog("DeviceListController", "InterruptedException in resetDevice: ", localInterruptedException);
        localJSONObject1.put("error", "InterruptedException - resetType: " + paramString + ",device: " + paramJSONObject1 + ",stateData: " + paramJSONObject2);
        return localJSONObject1;
      }
      localJSONException = localJSONException;
      LogUtils.errorLog("DeviceListController", "Exception in resetDevice", localJSONException);
      try
      {
        localJSONObject1.put("error", "exception resetDevice- check log");
        return localJSONObject1;
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("DeviceListController", "Exception in resetDevice", localJSONException);
        return localJSONObject1;
      }
    }
    label551:
    sDeviceListManager = DeviceListManager.getInstance(this.mContext);
    label567:
    boolean bool1;
    if ("all".equals(paramString))
    {
      bool1 = sDeviceListManager.resetDeviceAll(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, paramJSONObject2);
      localBridgeAPI.makeRequstToBridge(str1);
    }
    while (!bool1)
    {
      localJSONObject1.put("error", "Reset Type: " + paramString + ", request result error");
      return localJSONObject1;
      if ("wifi".equals(paramString))
      {
        JSONObject localJSONObject2 = new JSONObject();
        bool1 = sDeviceListManager.resetWiFi(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, localJSONObject2);
        localBridgeAPI.makeRequstToBridge(str1);
      }
      else if ("fnIconRules".equals(paramString))
      {
        bool1 = sDeviceListManager.resetFNIconRules(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, paramJSONObject2);
      }
      else if ("resetUsageData".equals(paramString))
      {
        bool1 = sDeviceListManager.resetUsageData(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, paramJSONObject2);
      }
      else if ("resetThreshold".equals(paramString))
      {
        bool1 = sDeviceListManager.resetThreshold(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, paramJSONObject2);
      }
      else
      {
        boolean bool2 = "resetAutoThreshold".equals(paramString);
        bool1 = false;
        if (bool2)
        {
          boolean bool3 = sDeviceListManager.resetAutoThreshold(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str1, paramJSONObject1, paramJSONObject2);
          bool1 = bool3;
        }
      }
    }
    return localJSONObject1;
  }
  
  public void selectPhoto(CallbackContext paramCallbackContext)
  {
    if (this.photoRequestedListener != null)
    {
      this.photoRequestedListener.onSelectPhoto(new PhotoGalleryProcessor(paramCallbackContext));
      return;
    }
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
  }
  
  public boolean setBlobStorage(String paramString, JSONObject paramJSONObject)
  {
    try
    {
      boolean bool = sDeviceListManager.setBlobStorage(paramString, paramJSONObject);
      return bool;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("DeviceListController", "Exception in setBlobStorage", localException);
    }
    return false;
  }
  
  public void setBulbType(JSONObject paramJSONObject, final CallbackContext paramCallbackContext)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "setBulbType: json containing Bulb Type: " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        String str1 = paramJSONObject.getString("bulbType");
        String str2 = paramJSONObject.getString("udn");
        DeviceListManager.getInstance(this.mContext).setBulbType(str2, str1, new SetBulbTypeSuccessCallback()new SetBulbTypeErrorCallback
        {
          public void onBulbTypeSet(String paramAnonymousString1, String paramAnonymousString2, String paramAnonymousString3)
          {
            JSONObject localJSONObject = new JSONObject();
            try
            {
              localJSONObject.put("maxLevel", paramAnonymousString2);
              localJSONObject.put("minLevel", paramAnonymousString1);
              localJSONObject.put("turnOnLevel", paramAnonymousString3);
              if (paramCallbackContext != null)
              {
                PluginResult localPluginResult2 = new PluginResult(PluginResult.Status.OK, localJSONObject);
                paramCallbackContext.sendPluginResult(localPluginResult2);
              }
              return;
            }
            catch (JSONException localJSONException)
            {
              for (;;)
              {
                LogUtils.errorLog("DeviceListController", "setBulbType: JSONException while parsing reult: ", localJSONException);
                if (paramCallbackContext != null)
                {
                  PluginResult localPluginResult1 = new PluginResult(PluginResult.Status.ERROR);
                  paramCallbackContext.sendPluginResult(localPluginResult1);
                }
              }
            }
          }
        }, new SetBulbTypeErrorCallback()
        {
          public void onSetBulbTypeFailed(String paramAnonymousString)
          {
            if (paramCallbackContext != null)
            {
              PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramAnonymousString);
              paramCallbackContext.sendPluginResult(localPluginResult);
            }
          }
        });
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "setBulbType: JSONException while parsing params: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "setBulbType: JSONObject containing params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "setBulbType: JSONObject containing params in NULL"));
  }
  
  public JSONObject setDeviceProperties(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
    throws JSONException
  {
    LogUtils.infoLog("DeviceListController", " In setDeviceProperties,model: " + paramJSONObject1 + ",props: " + paramJSONObject2);
    JSONObject localJSONObject = new JSONObject();
    if ((paramJSONObject1 == null) || (paramJSONObject2 == null))
    {
      localJSONObject.put("error", "device or props missing");
      return localJSONObject;
    }
    try
    {
      String str = paramJSONObject1.getString("udn");
      if (sDeviceListManager == null) {
        sDeviceListManager = DeviceListManager.getInstance(this.mContext);
      }
      sDeviceListManager.setDeviceProperties(str, paramJSONObject1, paramJSONObject2);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog("DeviceListController", "Exception in setDeviceProperties", localJSONException);
      localJSONObject.put("error", "exception setDeviceProperties- check log");
    }
    return localJSONObject;
  }
  
  public void setDeviceState(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    LogUtils.infoLog("DeviceListController", " In setDeviceState ");
    if ((paramJSONObject1 == null) || (paramJSONObject2 == null)) {
      return;
    }
    try
    {
      String str1 = paramJSONObject1.getString("udn");
      String str2 = paramJSONObject1.getString("type");
      LogUtils.infoLog("DeviceListController", " udn: " + str1 + " :type: " + str2 + " :attributes: " + paramJSONObject2);
      sDeviceListManager.setDeviceState(str1, paramJSONObject2, str2);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void setGroupState(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    LogUtils.infoLog("DeviceListController", " In setGroupState ");
    if ((paramJSONObject1 == null) || (paramJSONObject2 == null)) {
      return;
    }
    try
    {
      String str1 = paramJSONObject1.getString("udn");
      String str2 = paramJSONObject1.getString("bridgeUDN");
      sDeviceListManager.setGroupState(str1, paramJSONObject2, str2);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void setInsightDrawerState(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "setInsightDrawerState: params = " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        int i = paramJSONObject.getInt("isOpen");
        String str = paramJSONObject.getString("udn");
        DeviceListManager.getInstance(this.mContext).setInsightDrawerState(i, str);
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "setInsightDrawerState: JSONException while parsing params: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "setInsightDrawerState: JSONObject containing params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "setInsightDrawerState: JSONObject containing params in NULL"));
  }
  
  public void setNightModeConfiguration(CallbackContext paramCallbackContext, JSONObject paramJSONObject)
  {
    if (paramJSONObject != null) {
      LogUtils.debugLog("DeviceListController", "setNightModeConfiguration: parameters: " + paramJSONObject.toString());
    }
    do
    {
      try
      {
        String str = paramJSONObject.getString("udn");
        int i = Integer.valueOf(paramJSONObject.getString("nightModeBrightness")).intValue();
        int j = Integer.valueOf(paramJSONObject.getString("nightMode")).intValue();
        int k = Integer.valueOf(paramJSONObject.getString("startTime")).intValue();
        int m = Integer.valueOf(paramJSONObject.getString("endTime")).intValue();
        SetNightModeConfigurationCallback localSetNightModeConfigurationCallback = new SetNightModeConfigurationCallback(paramCallbackContext);
        DeviceListManager.getInstance(this.mContext).setNightModeConfiguration(str, j, k, m, i, localSetNightModeConfigurationCallback, localSetNightModeConfigurationCallback);
        return;
      }
      catch (JSONException localJSONException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "setNightModeConfiguration: JSONException while parsing parameters for setNightModeConfiguration: ", localJSONException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        do
        {
          LogUtils.errorLog("DeviceListController", "setNightModeConfiguration: NumberFormatException while parsing parameters for setNightModeConfiguration: ", localNumberFormatException);
        } while (paramCallbackContext == null);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
      LogUtils.errorLog("DeviceListController", "JSONObject containing night mode configuration params in NULL");
    } while (paramCallbackContext == null);
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
  }
  
  public void setPhotoRequestListener(PhotoRequestedListener paramPhotoRequestedListener)
  {
    this.photoRequestedListener = paramPhotoRequestedListener;
  }
  
  public void takePicture(CallbackContext paramCallbackContext)
  {
    try
    {
      LogUtils.debugLog("DeviceListController", "EDIT ICON: takePicture");
      if (this.photoRequestedListener != null)
      {
        File localFile = sDeviceListManager.generateEditedIconFile();
        if (localFile != null)
        {
          Uri localUri = Uri.fromFile(localFile);
          this.photoRequestedListener.onTakePicture(new CameraPictureProcessor(paramCallbackContext), localUri);
          return;
        }
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        return;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
      return;
    }
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
  }
  
  public JSONObject updateDevice(DeviceInformation paramDeviceInformation)
  {
    LogUtils.infoLog("DeviceListController", " In updateDevice ");
    if (paramDeviceInformation == null) {
      return null;
    }
    new JSONObject();
    JSONObject localJSONObject = createJSONObj(paramDeviceInformation);
    LogUtils.infoLog("DeviceListController", " In updateDevice deviceObj: " + localJSONObject.toString());
    return localJSONObject;
  }
  
  public void updateFwStatus(String paramString1, String paramString2)
  {
    DeviceInformation localDeviceInformation = sDeviceListManager.getDeviceInformationFromDevicesArray(paramString1);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setFwStatus(paramString2);
      sDeviceListManager.updateDeviceCache(localDeviceInformation);
    }
  }
  
  private class CameraPictureProcessor
    implements TakePictureListener
  {
    private CallbackContext callbackContext;
    
    CameraPictureProcessor(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onPictureTaken(Uri paramUri)
    {
      for (;;)
      {
        try
        {
          LogUtils.debugLog("DeviceListController", "EDIT ICON: onPictureTaken: Original Bitmap stored in file: " + paramUri.getPath());
          Bitmap localBitmap1 = DeviceListController.sDeviceListManager.getIconFromUriForCrop(paramUri);
          StringBuilder localStringBuilder = new StringBuilder().append("EDIT ICON: onPictureTaken: Size of bitmap after Picture Taken: ");
          if (localBitmap1 == null) {
            break label220;
          }
          localObject = Integer.valueOf(localBitmap1.getByteCount());
          LogUtils.debugLog("DeviceListController", localObject);
          Bitmap localBitmap2 = DeviceListController.sDeviceListManager.rotateCameraIcon(paramUri, localBitmap1);
          String str = DeviceListController.sDeviceListManager.saveEditedIcon(localBitmap2);
          LogUtils.debugLog("DeviceListController", "EDIT ICON: onPictureTaken: bitmap save temporarily to loc: " + str);
          File localFile = new File(str);
          if (DeviceListController.this.photoRequestedListener != null)
          {
            DeviceListController.this.photoRequestedListener.onCropImageByUser(Uri.fromFile(localFile), new DeviceListController.IconCroppedCallback(DeviceListController.this, this.callbackContext));
            return;
          }
          if (this.callbackContext != null)
          {
            this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
            return;
          }
        }
        catch (Exception localException)
        {
          this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
        }
        return;
        label220:
        Object localObject = "Bitmap is NULL";
      }
    }
    
    public void onTakePictureError(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "onTakePictureError: " + paramString);
      this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
    }
  }
  
  private class ConfigureDimmingRangeCallback
    implements ConfigureDimmingRangeErrorCallback, ConfigureDimmingRangeSuccessCallback
  {
    private CallbackContext callbackContext;
    
    public ConfigureDimmingRangeCallback(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onDimmingConfigurationError(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "ConfigureDimmingRange - ERROR: " + paramString);
      if (this.callbackContext != null) {
        this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, paramString));
      }
    }
    
    public void onDimmingRangeConfigured()
    {
      LogUtils.debugLog("DeviceListController", "ConfigureDimmingRange - SUCCESS");
      if (this.callbackContext != null) {
        this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK));
      }
    }
  }
  
  private class ConfigureHushModeCallback
    implements ConfigureHushModeErrorCallback, ConfigureHushModeSuccessCallback
  {
    private CallbackContext callbackContext;
    
    public ConfigureHushModeCallback(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onConfigureHushModeFailed(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "ConfigureHushMode: ERROR: " + paramString);
      if (this.callbackContext != null)
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
        this.callbackContext.sendPluginResult(localPluginResult);
      }
    }
    
    public void onHushModeConfigured()
    {
      LogUtils.debugLog("DeviceListController", "ConfigureHushMode: SUCCESS");
      if (this.callbackContext != null)
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
        this.callbackContext.sendPluginResult(localPluginResult);
      }
    }
  }
  
  private class FetchDevicesRulesCallback
    implements FetchRulesAndSyncErrorCallback, FetchRulesAndSyncSuccessCallback
  {
    private static final String TAG = "FetchDevicesRulesCallback - DeviceListController";
    private JSONObject device;
    private PluginResultErrorCallback errorCallback;
    private String resetType;
    private JSONObject stateData;
    private PluginResultSuccessCallback successCallback;
    
    public FetchDevicesRulesCallback(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
    {
      this.resetType = paramString;
      this.device = paramJSONObject1;
      this.stateData = paramJSONObject2;
      this.errorCallback = paramPluginResultErrorCallback;
      this.successCallback = paramPluginResultSuccessCallback;
    }
    
    private void resetDevice()
    {
      try
      {
        DeviceListController localDeviceListController = DeviceListController.devListController;
        PluginResultErrorCallback localPluginResultErrorCallback = this.errorCallback;
        PluginResultSuccessCallback localPluginResultSuccessCallback = this.successCallback;
        String str = this.resetType;
        JSONObject localJSONObject1 = this.device;
        JSONObject localJSONObject2 = this.stateData;
        Boolean[] arrayOfBoolean = new Boolean[1];
        arrayOfBoolean[0] = Boolean.valueOf(true);
        localDeviceListController.resetDevice(localPluginResultErrorCallback, localPluginResultSuccessCallback, str, localJSONObject1, localJSONObject2, arrayOfBoolean);
        return;
      }
      catch (JSONException localJSONException)
      {
        LogUtils.errorLog("FetchDevicesRulesCallback - DeviceListController", "Exception in resetDevice() e:" + localJSONException);
        localJSONException.printStackTrace();
      }
    }
    
    public void onError()
    {
      LogUtils.errorLog("FetchDevicesRulesCallback - DeviceListController", "FetchDevicerulesCallback: error during fetchRules(), calling resetDevice again.");
      resetDevice();
    }
    
    public void onSuccess(String paramString, int paramInt)
    {
      LogUtils.infoLog("FetchDevicesRulesCallback - DeviceListController", "FetchDevicerulesCallback: fetchRules() succeeded, calling resetDevice again.");
      resetDevice();
    }
  }
  
  private class IconCroppedCallback
    implements CropImageByUserCallback
  {
    private CallbackContext callbackContext;
    
    public IconCroppedCallback(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onCropError(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "EDIT ICON: onCropError: " + paramString);
      if (this.callbackContext != null) {
        this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
      }
    }
    
    public void onImageCropped(Uri paramUri)
    {
      Bitmap localBitmap = DeviceListController.sDeviceListManager.getIconFromUri(paramUri);
      String str = DeviceListController.sDeviceListManager.saveEditedIcon(localBitmap);
      StringBuilder localStringBuilder = new StringBuilder().append("EDIT ICON: onImageCropped. ICON FILE PATH: ").append(str).append("; New File Size after Shrink: ");
      Object localObject;
      if (localBitmap != null)
      {
        localObject = Integer.valueOf(localBitmap.getByteCount());
        LogUtils.debugLog("DeviceListController", localObject);
        if (TextUtils.isEmpty(str)) {
          break label111;
        }
      }
      label111:
      for (PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, str);; localPluginResult = new PluginResult(PluginResult.Status.ERROR))
      {
        if (this.callbackContext != null) {
          this.callbackContext.sendPluginResult(localPluginResult);
        }
        return;
        localObject = "Bitmap is NULL";
        break;
      }
    }
  }
  
  private class PhotoGalleryProcessor
    implements SelectPhotoListener
  {
    private CallbackContext callbackContext;
    
    PhotoGalleryProcessor(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onPhotoSelected(Uri paramUri)
    {
      LogUtils.debugLog("DeviceListController", "PhotoGalleryProcessor: onPhotoSelected - URI of selected photo: " + paramUri.getPath());
      Bitmap localBitmap1 = DeviceListController.sDeviceListManager.getIconFromUriForCrop(paramUri);
      StringBuilder localStringBuilder = new StringBuilder().append("EDIT ICON: onPhotoSelected: Size of bitmap after photo selection: ");
      Object localObject;
      if (localBitmap1 != null)
      {
        localObject = Integer.valueOf(localBitmap1.getByteCount());
        LogUtils.debugLog("DeviceListController", localObject);
        Bitmap localBitmap2 = DeviceListController.sDeviceListManager.rotateGalleryIcon(paramUri, localBitmap1);
        File localFile = new File(DeviceListController.sDeviceListManager.saveEditedIcon(localBitmap2));
        if (DeviceListController.this.photoRequestedListener == null) {
          break label152;
        }
        DeviceListController.this.photoRequestedListener.onCropImageByUser(Uri.fromFile(localFile), new DeviceListController.IconCroppedCallback(DeviceListController.this, this.callbackContext));
      }
      label152:
      while (this.callbackContext == null)
      {
        return;
        localObject = "Bitmap is NULL";
        break;
      }
      this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
    }
    
    public void onPhotoSelectionError(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "onPhotoSelectedError: " + paramString);
      if (this.callbackContext != null) {
        this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
      }
    }
  }
  
  private class SetNightModeConfigurationCallback
    implements SetNightModeErrorCallback, SetNightModeSuccessCallback
  {
    private CallbackContext callbackContext;
    
    public SetNightModeConfigurationCallback(CallbackContext paramCallbackContext)
    {
      this.callbackContext = paramCallbackContext;
    }
    
    public void onNightModeConfigurationFailed(String paramString)
    {
      LogUtils.errorLog("DeviceListController", "setNightModeConfiguration: ERROR: " + paramString);
      if (this.callbackContext != null)
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
        this.callbackContext.sendPluginResult(localPluginResult);
      }
    }
    
    public void onNightModeConfigured()
    {
      LogUtils.debugLog("DeviceListController", "setNightModeConfiguration: SUCCESS");
      if (this.callbackContext != null)
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
        this.callbackContext.sendPluginResult(localPluginResult);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/DeviceListController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */