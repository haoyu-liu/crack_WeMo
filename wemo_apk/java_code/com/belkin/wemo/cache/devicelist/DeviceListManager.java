package com.belkin.wemo.cache.devicelist;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.provider.MediaStore.Images.Media;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.cloud.CRScheduleDataExport;
import com.belkin.wemo.cache.cloud.CRSetEnergyPerUnitCost;
import com.belkin.wemo.cache.cloud.CRSetPowerThreshold;
import com.belkin.wemo.cache.cloud.CloudRequestAddLocation;
import com.belkin.wemo.cache.cloud.CloudRequestAddOrEditGroup;
import com.belkin.wemo.cache.cloud.CloudRequestAutoResetPowerThreshold;
import com.belkin.wemo.cache.cloud.CloudRequestChangeAttributes;
import com.belkin.wemo.cache.cloud.CloudRequestChangeFriendlyName;
import com.belkin.wemo.cache.cloud.CloudRequestConfigureHushMode;
import com.belkin.wemo.cache.cloud.CloudRequestForAppRecovery;
import com.belkin.wemo.cache.cloud.CloudRequestForDelDevicePreset;
import com.belkin.wemo.cache.cloud.CloudRequestForGetDevicePreset;
import com.belkin.wemo.cache.cloud.CloudRequestForNestDeactivation;
import com.belkin.wemo.cache.cloud.CloudRequestForSensorEvent;
import com.belkin.wemo.cache.cloud.CloudRequestForSetDevicePreset;
import com.belkin.wemo.cache.cloud.CloudRequestGetDataStoreOnLink;
import com.belkin.wemo.cache.cloud.CloudRequestGetLEDGroupIcon;
import com.belkin.wemo.cache.cloud.CloudRequestGetLEDIcon;
import com.belkin.wemo.cache.cloud.CloudRequestGetLEDIconInfo;
import com.belkin.wemo.cache.cloud.CloudRequestGetSetBlobStorage;
import com.belkin.wemo.cache.cloud.CloudRequestHideDevice;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestRemoveGroup;
import com.belkin.wemo.cache.cloud.CloudRequestResetFNIRules;
import com.belkin.wemo.cache.cloud.CloudRequestResetFNIRulesZigbee;
import com.belkin.wemo.cache.cloud.CloudRequestResetPowerThreshold;
import com.belkin.wemo.cache.cloud.CloudRequestResetUsageData;
import com.belkin.wemo.cache.cloud.CloudRequestSetDataStoreOnLink;
import com.belkin.wemo.cache.cloud.CloudRequestSetDeviceIcon;
import com.belkin.wemo.cache.cloud.CloudRequestSetDeviceStatusDimmer;
import com.belkin.wemo.cache.cloud.CloudRequestSetGroupIcon;
import com.belkin.wemo.cache.cloud.CloudRequestSetLEDIcon;
import com.belkin.wemo.cache.cloud.CloudRequestSetNestAttribute;
import com.belkin.wemo.cache.cloud.CloudRequestSetNightModeConfiguration;
import com.belkin.wemo.cache.cloud.CloudRequestStateChange;
import com.belkin.wemo.cache.cloud.CloudRequestStateChangeForMaker;
import com.belkin.wemo.cache.cloud.CloudRequestUpdateDeviceList;
import com.belkin.wemo.cache.cloud.CloudRequestZigbeeGroupStateChange;
import com.belkin.wemo.cache.cloud.CloudRequestZigbeeStateChange;
import com.belkin.wemo.cache.cloud.SmartDiscovery;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.callback.CalibrateErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.CalibrateSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureDimmingRangeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureDimmingRangeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.GetSetBlobStorageCallback;
import com.belkin.wemo.cache.devicelist.callback.HideGroupErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.HideGroupSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.SetBulbTypeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.SetBulbTypeSuccessCallback;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeSuccessCallback;
import com.belkin.wemo.cache.devicelist.listener.EmailSubscriptionOnRemoteAccessListener;
import com.belkin.wemo.cache.devicelist.listener.LEDIconsOnRemoteAccessListener;
import com.belkin.wemo.cache.devicelist.listener.ResetThresholdRemoteListener;
import com.belkin.wemo.cache.devicelist.runnable.BlobStorageRunnable;
import com.belkin.wemo.cache.devicelist.runnable.CollectEmailIDToITServerRequestRunnable;
import com.belkin.wemo.cache.devicelist.runnable.CollectEmailIDToWemoCloudRequestRunnable;
import com.belkin.wemo.cache.devicelist.runnable.GetNestDevicesRequestRunnable;
import com.belkin.wemo.cache.devicelist.runnable.HideGroupRunnable;
import com.belkin.wemo.cache.devicelist.runnable.MSearchDeviceAddedRunnable;
import com.belkin.wemo.cache.devicelist.runnable.MSearchDeviceAddedRunnable.onMSearchDeviceProcessedListener;
import com.belkin.wemo.cache.devicelist.runnable.MSearchRequestRunnable;
import com.belkin.wemo.cache.devicelist.runnable.NestTokenExistenceRequestRunnable;
import com.belkin.wemo.cache.devicelist.runnable.ResetAllRunnable;
import com.belkin.wemo.cache.devicelist.runnable.ResetFNIconRulesRunnable;
import com.belkin.wemo.cache.devicelist.runnable.ResetThresholdRunnable;
import com.belkin.wemo.cache.devicelist.runnable.ResetUsageDataRunnable;
import com.belkin.wemo.cache.devicelist.runnable.ResetWifiRunnable;
import com.belkin.wemo.cache.devicelist.runnable.SetDeviceAttributeRunnable;
import com.belkin.wemo.cache.devicelist.runnable.SetDeviceIconRunnable;
import com.belkin.wemo.cache.devicelist.runnable.SetDevicePropertiesRunnable;
import com.belkin.wemo.cache.devicelist.runnable.SetDeviceStateRunnable;
import com.belkin.wemo.cache.devicelist.runnable.SetZigbeeDeviceStateRunnable;
import com.belkin.wemo.cache.devicelist.runnable.UnicastDeviceDiscoveredRunnable;
import com.belkin.wemo.cache.devicelist.runnable.UnicastDiscoveryRunnable;
import com.belkin.wemo.cache.location.CacheLocationsManager;
import com.belkin.wemo.cache.location.Location;
import com.belkin.wemo.cache.network.LEDOperations;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.GetCreateGroupResponseParser;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.Locks;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.StringUtils;
import com.belkin.wemo.cache.utils.UploadFileUtil;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.cache.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.zigbee.IFetchZigBeeDevicesCallback;
import com.belkin.wemo.cache.zigbee.IZigBeeDevices;
import com.belkin.wemo.cache.zigbee.impl.GetZigBeeDevicesFactory;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.localsdk.parser.AttributeNotificationParser;
import com.belkin.wemo.rules.RMIRules;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.RMGetRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMGetRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMTargetDevice;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.upnp.parser.SetBulbTypeResponseParser;
import com.belkin.wemo.upnp.response.SetBulbTypeResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ScheduledExecutorService;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceListManager
  implements DeviceChangeListener, EventListener
{
  public static final String ADD_DEVICE = "add";
  private static final long AFTER_RESUME_UNICAST_DELAY = 5L;
  public static final String AVAILABLE_FW_UPDATES = "available_fw_updates";
  public static final String BULB_FW_UPDATE = "SubDeviceFWUpdate";
  public static final String CHANGE_ATTRIBUTE = "change_attribute";
  public static final String CHANGE_STATE = "change_state";
  public static final String CHANGE_STATE_IN_REMOTE_FAILED = "change_state_in_remote_failed";
  public static final String GET_BLOB_STORAGE = "get_blob_storage";
  public static final String HIDE_DEVICE = "hide";
  public static final String LOCATION_CREATION_FAILED = "location_creation_failed";
  public static final String LOCATION_CREATION_SUCCESS = "location_creation_success";
  public static final int MSEARCH_CONCURRENT_INTERVAL = 100;
  public static final int MSEARCH_EXISTING_DEVICE_INTERVAL = 15000;
  public static final int MSEARCH_INTERVAL = 3000;
  public static final int MSEARCH_ITERATION = 3;
  public static final String NEST_AUTH_TOKEN_EXISTENCE = "nest_auth_token_existence";
  public static final String NEST_DEAUTH0RIZATION_RESPONSE = "nest_deauthorization_response";
  public static final String NEST_DEAUTHORIZED = "nest_deauthorized";
  public static final String PLUGIN_CONNECTED = "pluginConnected";
  private static final long REFRESH_DELAY = 60000L;
  public static final String REFRESH_LIST = "refresh";
  public static final String REFRESH_LIST_COMPLETED = "refreshListCompleted";
  public static final String REMOVE_DEVICE = "remove";
  public static final String RESET_ALL = "reset_all";
  public static final String RESET_CACHE = "reset_cache";
  public static final String RESET_FN_ICON_RULES = "reset_fn_icon_rules";
  public static final String RESET_USAGE_DATA = "reset_usage_data";
  public static final String RESET_WIFI = "reset_wifi";
  public static final String SET_ATTRIBUTE = "set_attribute";
  public static final String SET_BLOB_STORAGE = "set_blob_storage";
  public static final String SET_NEST_ERROR_CODE = "set_nest_error_code";
  public static final String SET_PROPERTIES = "set_properties";
  public static final String SET_REMOTE = "set_remote";
  public static final String SET_STATE = "set_state";
  public static final String STATE_CHANGED_IN_REMOTE = "state_changed";
  private static final String TAG = "DeviceListManager";
  public static final String THERE_ARE_NOT_REMOTE_DEVICES = "there_are_not_remote_devices";
  public static final String THERE_ARE_REMOTE_DEVICES = "there_are_remote_devices";
  public static final String UPDATE_DEVICE = "update";
  public static final String UPDATE_FIRMWARE = "update_firmware";
  public static final String UPDATE_GROUP_STATE = "update_group_state";
  public static final String UPDATE_WIDGET = "set_widget_state";
  public static final String ZIGBEE_STATUS_DONE = "zigbee_status_done";
  private static CacheLocationsManager cacheLocationsManager;
  private static CacheManager cacheManager;
  public static LinkedHashMap<String, String> capabalityProfileList = null;
  private static Map<String, String> capabilityIDToTagMap;
  public static Context context;
  public static DeviceListManager devListManager = null;
  public static boolean firstRemoteCall;
  private static String iconsDir;
  public static WeMoSDKContext mWeMoSDKContext = null;
  private static String packageName;
  private final int MSEARCH_COUNT = 3;
  private final int MSEARCH_DELAY = 2000;
  private Map<String, DeviceRequestTracker> binaryStateRequestTrackerMap;
  private boolean checkIfServiceFilesReload = false;
  private String currentSSID;
  private boolean deviceNotReachable = false;
  private DevicesArray devicesArray;
  private HashMap<String, Long> devicesStartTimes = null;
  private EmailSubscriptionOnRemoteAccessListener emailSubscriptionOnRemoteAccessListener;
  private Map<String, FirmwareUpdateData> fwUpdateInProgressDataMap;
  private boolean isNotificationComes = false;
  private boolean lastModeLocal = true;
  private String lastSSID;
  private RemoteAccessBroadcastService.RemoteAccessListener ledIconOnRemoteAccessListener;
  private Set<NotificationListenerDLM> listenersSet = null;
  private DeviceListManagerCallbacksActivity mActivity;
  private ControlPoint mControlPoint = null;
  private MoreUtil mMoreUtil;
  private SDKNetworkUtils mNetworkUtils;
  public SharePreferences mSharePreference;
  private List<String> msearchInProgressDeviceList = new CopyOnWriteArrayList();
  private Object mutex = new Object();
  private NetworkStateListener networkStateListener;
  private int offlineLEDCount;
  private RemoteAccessManager remoteAccessManager;
  private boolean serviceFilesSynched = false;
  private SmartDiscovery smartDiscovery;
  private long startDiscoveryTimeForRemote;
  private long startTime = 0L;
  private Timer updateTimer;
  private ScheduledExecutorService worker;
  
  static
  {
    cacheManager = null;
    cacheLocationsManager = null;
    firstRemoteCall = true;
  }
  
  private DeviceListManager(Context paramContext)
  {
    context = paramContext;
    this.mNetworkUtils = new SDKNetworkUtils(context);
    String str = this.mNetworkUtils.getNetworkType();
    SDKLogUtils.infoLog("DeviceListManager", "DeviceListManager Constructor hash: " + hashCode() + " ;Network Type : " + str);
    this.devicesArray = DevicesArray.getInstance(paramContext);
    cacheManager = CacheManager.getInstance(context);
    mWeMoSDKContext = WeMoSDKContext.getInstance(context);
    this.mSharePreference = new SharePreferences(context);
    this.listenersSet = new ConcurrentSkipListSet(new Comparator()
    {
      public int compare(DeviceListManager.NotificationListenerDLM paramAnonymousNotificationListenerDLM1, DeviceListManager.NotificationListenerDLM paramAnonymousNotificationListenerDLM2)
      {
        return paramAnonymousNotificationListenerDLM1.hashCode() - paramAnonymousNotificationListenerDLM2.hashCode();
      }
    });
    FileStorage.getInstance(context);
    DevicesArray.loadProductNameMapping();
    DevicesArray.loadProductTypeMapping();
    this.devicesStartTimes = new HashMap();
    cacheLocationsManager = CacheLocationsManager.getInstance(context);
    this.remoteAccessManager = new RemoteAccessManager(this.mActivity, context);
    packageName = context.getPackageName();
    iconsDir = context.getFilesDir().toString();
    this.lastModeLocal = NetworkMode.isLocal();
    this.mMoreUtil = new MoreUtil();
    this.binaryStateRequestTrackerMap = new HashMap();
    this.lastSSID = "";
    this.currentSSID = "";
    this.networkStateListener = new NetworkStateListener(this.mNetworkUtils, (ConnectivityManager)context.getSystemService("connectivity"));
    this.networkStateListener.startListening(context);
    updateCapabilityProfileTable();
    this.fwUpdateInProgressDataMap = WemoUtils.readFirmwareUpgradeInProgressState(context);
    if (this.fwUpdateInProgressDataMap == null) {
      this.fwUpdateInProgressDataMap = new HashMap();
    }
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap reading from Internal Memory");
    printFwUpgradeInProgressMapIfDebug();
  }
  
  private void addDiscoveryTry(String paramString, long paramLong, boolean paramBoolean)
  {
    try
    {
      if (this.devicesArray.getDeviceDiscovered(paramString)) {
        cacheManager.addDiscoveryTry(paramBoolean, paramString, paramLong);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  /* Error */
  private void addOrUpdateZBDevice(String paramString1, DeviceInformation paramDeviceInformation, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_2
    //   3: invokevirtual 482	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   6: istore 5
    //   8: aload_2
    //   9: invokevirtual 485	com/belkin/wemo/cache/data/DeviceInformation:getGroupID	()Ljava/lang/String;
    //   12: astore 6
    //   14: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   17: aload_2
    //   18: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   21: invokevirtual 491	com/belkin/wemo/cache/CacheManager:isDeviceInDB	(Ljava/lang/String;)Z
    //   24: istore 7
    //   26: ldc 115
    //   28: new 270	java/lang/StringBuilder
    //   31: dup
    //   32: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   35: ldc_w 493
    //   38: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: aload_2
    //   42: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   45: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   48: ldc_w 495
    //   51: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: iload 7
    //   56: invokevirtual 498	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   59: ldc_w 500
    //   62: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: iload 5
    //   67: invokevirtual 284	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   70: ldc_w 502
    //   73: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   76: aload 6
    //   78: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: ldc_w 504
    //   84: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: aload_2
    //   88: invokevirtual 507	com/belkin/wemo/cache/data/DeviceInformation:getIcon	()Ljava/lang/String;
    //   91: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   94: ldc_w 509
    //   97: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: aload_2
    //   101: invokevirtual 512	com/belkin/wemo/cache/data/DeviceInformation:getGroupIcon	()Ljava/lang/String;
    //   104: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   110: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   113: iload 7
    //   115: ifne +17 -> 132
    //   118: iload 5
    //   120: iconst_1
    //   121: if_icmpne +11 -> 132
    //   124: aload 6
    //   126: invokestatic 518	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   129: ifne +109 -> 238
    //   132: iload 5
    //   134: iconst_1
    //   135: if_icmpeq +25 -> 160
    //   138: aload_0
    //   139: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   142: aload_2
    //   143: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   146: iconst_1
    //   147: invokevirtual 522	com/belkin/wemo/cache/data/DevicesArray:setDeviceDiscovered	(Ljava/lang/String;Z)V
    //   150: aload_2
    //   151: iconst_1
    //   152: invokevirtual 526	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   155: aload_2
    //   156: iconst_0
    //   157: invokevirtual 530	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   160: aload_0
    //   161: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   164: invokevirtual 534	com/belkin/wemo/cache/data/DevicesArray:getDeviceInformationList	()Ljava/util/Map;
    //   167: ifnull +71 -> 238
    //   170: aload_2
    //   171: invokevirtual 537	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   174: invokevirtual 541	java/lang/String:isEmpty	()Z
    //   177: ifeq +23 -> 200
    //   180: aload_2
    //   181: getstatic 544	com/belkin/wemo/cache/data/DevicesArray:productNameMapping	Ljava/util/HashMap;
    //   184: aload_2
    //   185: invokevirtual 547	com/belkin/wemo/cache/data/DeviceInformation:getModelCode	()Ljava/lang/String;
    //   188: invokevirtual 551	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   191: checkcast 539	java/lang/String
    //   194: invokestatic 557	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   197: invokevirtual 560	com/belkin/wemo/cache/data/DeviceInformation:setProductName	(Ljava/lang/String;)V
    //   200: aload_2
    //   201: invokevirtual 563	com/belkin/wemo/cache/data/DeviceInformation:getProductType	()Ljava/lang/String;
    //   204: invokevirtual 541	java/lang/String:isEmpty	()Z
    //   207: ifeq +23 -> 230
    //   210: aload_2
    //   211: getstatic 566	com/belkin/wemo/cache/data/DevicesArray:productTypeMapping	Ljava/util/HashMap;
    //   214: aload_2
    //   215: invokevirtual 547	com/belkin/wemo/cache/data/DeviceInformation:getModelCode	()Ljava/lang/String;
    //   218: invokevirtual 551	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   221: checkcast 539	java/lang/String
    //   224: invokestatic 557	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   227: invokevirtual 569	com/belkin/wemo/cache/data/DeviceInformation:setProductType	(Ljava/lang/String;)V
    //   230: aload_0
    //   231: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   234: aload_2
    //   235: invokevirtual 573	com/belkin/wemo/cache/data/DevicesArray:updateDeviceInformationList	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   238: iload 7
    //   240: ifeq +84 -> 324
    //   243: ldc_w 575
    //   246: new 270	java/lang/StringBuilder
    //   249: dup
    //   250: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   253: ldc_w 577
    //   256: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   259: aload_2
    //   260: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   263: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   266: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   269: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   272: aload_2
    //   273: iconst_1
    //   274: iconst_1
    //   275: iconst_1
    //   276: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   279: ldc_w 575
    //   282: new 270	java/lang/StringBuilder
    //   285: dup
    //   286: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   289: ldc_w 586
    //   292: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   295: aload_2
    //   296: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   299: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   302: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   305: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   308: aload_0
    //   309: ldc 124
    //   311: ldc_w 388
    //   314: aload_2
    //   315: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   318: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   321: aload_0
    //   322: monitorexit
    //   323: return
    //   324: iload 5
    //   326: iconst_1
    //   327: if_icmpne +11 -> 338
    //   330: aload 6
    //   332: invokestatic 518	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   335: ifne -14 -> 321
    //   338: ldc_w 575
    //   341: new 270	java/lang/StringBuilder
    //   344: dup
    //   345: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   348: ldc_w 592
    //   351: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   354: aload_2
    //   355: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   358: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   361: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   364: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   367: aload_2
    //   368: iconst_1
    //   369: iconst_1
    //   370: iconst_1
    //   371: invokevirtual 596	com/belkin/wemo/cache/CacheManager:addDeviceToDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z
    //   374: pop
    //   375: ldc_w 575
    //   378: new 270	java/lang/StringBuilder
    //   381: dup
    //   382: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   385: ldc_w 598
    //   388: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   391: aload_2
    //   392: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   395: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   401: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   404: aload_0
    //   405: ldc 12
    //   407: ldc_w 388
    //   410: aload_2
    //   411: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   414: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   417: goto -96 -> 321
    //   420: astore 4
    //   422: aload_0
    //   423: monitorexit
    //   424: aload 4
    //   426: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	427	0	this	DeviceListManager
    //   0	427	1	paramString1	String
    //   0	427	2	paramDeviceInformation	DeviceInformation
    //   0	427	3	paramString2	String
    //   420	5	4	localObject	Object
    //   6	322	5	i	int
    //   12	319	6	str	String
    //   24	215	7	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	113	420	finally
    //   124	132	420	finally
    //   138	160	420	finally
    //   160	200	420	finally
    //   200	230	420	finally
    //   230	238	420	finally
    //   243	321	420	finally
    //   330	338	420	finally
    //   338	417	420	finally
  }
  
  /* Error */
  private void checkIfServiceFilesReload(Device paramDevice, String[] paramArrayOfString, String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   4: istore 7
    //   6: iload 7
    //   8: ifeq +9 -> 17
    //   11: aload_0
    //   12: iconst_0
    //   13: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   16: return
    //   17: aload_0
    //   18: iconst_1
    //   19: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   22: aload_2
    //   23: ifnull +299 -> 322
    //   26: aload_2
    //   27: iconst_1
    //   28: aaload
    //   29: astore 8
    //   31: aload_1
    //   32: invokevirtual 604	org/cybergarage/upnp/Device:getFirmwareVersion	()Ljava/lang/String;
    //   35: astore 9
    //   37: ldc_w 606
    //   40: new 270	java/lang/StringBuilder
    //   43: dup
    //   44: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   47: ldc_w 608
    //   50: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: aload 9
    //   55: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: ldc_w 610
    //   61: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: aload 8
    //   66: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: ldc_w 612
    //   72: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: aload_3
    //   76: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: ldc_w 614
    //   82: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: aload_0
    //   86: getfield 243	com/belkin/wemo/cache/devicelist/DeviceListManager:mutex	Ljava/lang/Object;
    //   89: invokevirtual 281	java/lang/Object:hashCode	()I
    //   92: invokevirtual 284	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   95: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   98: invokestatic 620	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   101: pop
    //   102: aload 9
    //   104: ifnull +28 -> 132
    //   107: aload 8
    //   109: ifnull +23 -> 132
    //   112: aload 9
    //   114: invokevirtual 623	java/lang/String:trim	()Ljava/lang/String;
    //   117: aload 8
    //   119: invokevirtual 623	java/lang/String:trim	()Ljava/lang/String;
    //   122: invokevirtual 627	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   125: istore 11
    //   127: iload 11
    //   129: ifeq +9 -> 138
    //   132: aload_0
    //   133: iconst_0
    //   134: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   137: return
    //   138: aload_0
    //   139: getfield 243	com/belkin/wemo/cache/devicelist/DeviceListManager:mutex	Ljava/lang/Object;
    //   142: astore 12
    //   144: aload 12
    //   146: monitorenter
    //   147: aload_1
    //   148: invokevirtual 604	org/cybergarage/upnp/Device:getFirmwareVersion	()Ljava/lang/String;
    //   151: astore 14
    //   153: aload 14
    //   155: invokevirtual 623	java/lang/String:trim	()Ljava/lang/String;
    //   158: aload 8
    //   160: invokevirtual 623	java/lang/String:trim	()Ljava/lang/String;
    //   163: invokevirtual 627	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   166: ifne +96 -> 262
    //   169: aload_0
    //   170: aload_1
    //   171: aload_3
    //   172: invokespecial 631	com/belkin/wemo/cache/devicelist/DeviceListManager:synchFiles	(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    //   175: aload 12
    //   177: monitorexit
    //   178: ldc_w 606
    //   181: new 270	java/lang/StringBuilder
    //   184: dup
    //   185: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   188: ldc_w 633
    //   191: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: aload 14
    //   196: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   199: ldc_w 610
    //   202: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   205: aload 8
    //   207: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: ldc_w 635
    //   213: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: aload_3
    //   217: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   220: ldc_w 614
    //   223: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: aload_0
    //   227: getfield 243	com/belkin/wemo/cache/devicelist/DeviceListManager:mutex	Ljava/lang/Object;
    //   230: invokevirtual 281	java/lang/Object:hashCode	()I
    //   233: invokevirtual 284	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   236: ldc_w 635
    //   239: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: aload_0
    //   243: getfield 239	com/belkin/wemo/cache/devicelist/DeviceListManager:serviceFilesSynched	Z
    //   246: invokevirtual 498	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   249: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   252: invokestatic 620	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   255: pop
    //   256: aload_0
    //   257: iconst_0
    //   258: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   261: return
    //   262: aload 12
    //   264: monitorexit
    //   265: aload_0
    //   266: iconst_0
    //   267: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   270: return
    //   271: astore 13
    //   273: aload 12
    //   275: monitorexit
    //   276: aload 13
    //   278: athrow
    //   279: astore 5
    //   281: ldc_w 606
    //   284: new 270	java/lang/StringBuilder
    //   287: dup
    //   288: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   291: ldc_w 637
    //   294: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: aload_3
    //   298: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   301: ldc_w 639
    //   304: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   307: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   310: aload 5
    //   312: invokestatic 643	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   315: pop
    //   316: aload_0
    //   317: iconst_0
    //   318: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   321: return
    //   322: aload_0
    //   323: getfield 239	com/belkin/wemo/cache/devicelist/DeviceListManager:serviceFilesSynched	Z
    //   326: istore 16
    //   328: iload 16
    //   330: ifeq +9 -> 339
    //   333: aload_0
    //   334: iconst_0
    //   335: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   338: return
    //   339: aload_0
    //   340: getfield 243	com/belkin/wemo/cache/devicelist/DeviceListManager:mutex	Ljava/lang/Object;
    //   343: astore 17
    //   345: aload 17
    //   347: monitorenter
    //   348: aload_0
    //   349: aload_1
    //   350: aload_3
    //   351: invokespecial 631	com/belkin/wemo/cache/devicelist/DeviceListManager:synchFiles	(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    //   354: aload_0
    //   355: iconst_1
    //   356: putfield 239	com/belkin/wemo/cache/devicelist/DeviceListManager:serviceFilesSynched	Z
    //   359: aload 17
    //   361: monitorexit
    //   362: aconst_null
    //   363: astore 14
    //   365: aconst_null
    //   366: astore 8
    //   368: goto -190 -> 178
    //   371: astore 18
    //   373: aload 17
    //   375: monitorexit
    //   376: aload 18
    //   378: athrow
    //   379: astore 4
    //   381: aload_0
    //   382: iconst_0
    //   383: putfield 241	com/belkin/wemo/cache/devicelist/DeviceListManager:checkIfServiceFilesReload	Z
    //   386: aload 4
    //   388: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	389	0	this	DeviceListManager
    //   0	389	1	paramDevice	Device
    //   0	389	2	paramArrayOfString	String[]
    //   0	389	3	paramString	String
    //   379	8	4	localObject1	Object
    //   279	32	5	localException	Exception
    //   4	3	7	bool1	boolean
    //   29	338	8	str1	String
    //   35	78	9	str2	String
    //   125	3	11	bool2	boolean
    //   271	6	13	localObject3	Object
    //   151	213	14	str3	String
    //   326	3	16	bool3	boolean
    //   371	6	18	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   147	178	271	finally
    //   262	265	271	finally
    //   273	276	271	finally
    //   0	6	279	java/lang/Exception
    //   17	22	279	java/lang/Exception
    //   26	102	279	java/lang/Exception
    //   112	127	279	java/lang/Exception
    //   138	147	279	java/lang/Exception
    //   178	256	279	java/lang/Exception
    //   276	279	279	java/lang/Exception
    //   322	328	279	java/lang/Exception
    //   339	348	279	java/lang/Exception
    //   376	379	279	java/lang/Exception
    //   348	362	371	finally
    //   373	376	371	finally
    //   0	6	379	finally
    //   17	22	379	finally
    //   26	102	379	finally
    //   112	127	379	finally
    //   138	147	379	finally
    //   178	256	379	finally
    //   276	279	379	finally
    //   281	316	379	finally
    //   322	328	379	finally
    //   339	348	379	finally
    //   376	379	379	finally
  }
  
  private String createAttributeList(JSONObject paramJSONObject, DeviceInformation paramDeviceInformation)
  {
    String[] arrayOfString = { "Switch", "Sensor", "SwitchMode", "SensorPresent" };
    localStringBuffer = new StringBuffer();
    int i = 0;
    try
    {
      for (;;)
      {
        int j = arrayOfString.length;
        if (i >= j) {
          break label164;
        }
        try
        {
          String str2 = paramJSONObject.getString(arrayOfString[i]);
          str1 = str2;
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            localException2.printStackTrace();
            String str1 = null;
          }
        }
        localStringBuffer.append("<attribute>");
        localStringBuffer.append("<name>");
        localStringBuffer.append(arrayOfString[i]);
        localStringBuffer.append("</name>");
        localStringBuffer.append("<value>");
        localStringBuffer.append(str1);
        localStringBuffer.append("</value>");
        localStringBuffer.append("</attribute>");
        i++;
      }
      label164:
      return localStringBuffer.toString();
    }
    catch (Exception localException1)
    {
      localException1.printStackTrace();
      Log.v("DeviceListManager.createAttributeList", "str.toString():::::::;" + localStringBuffer.toString());
    }
  }
  
  public static String getCapabilityIDFromTag(String paramString)
  {
    if (capabilityIDToTagMap == null)
    {
      capabilityIDToTagMap = new LinkedHashMap();
      capabilityIDToTagMap.put("onOff", "10006");
      capabilityIDToTagMap.put("levelControl", "10008");
      capabilityIDToTagMap.put("sleepFader", "30008");
      capabilityIDToTagMap.put("levelControlMove", "30009");
      capabilityIDToTagMap.put("levelControlStop", "3000A");
      capabilityIDToTagMap.put("identify", "10003");
      capabilityIDToTagMap.put("colorControl", "10300");
      capabilityIDToTagMap.put("colorTemperature", "30301");
      capabilityIDToTagMap.put("iasZone", "10500");
      capabilityIDToTagMap.put("sensorConfig", "20500");
      capabilityIDToTagMap.put("sensorTestMode", "30501");
      capabilityIDToTagMap.put("sensorKeyPress", "20502");
    }
    return (String)capabilityIDToTagMap.get(paramString);
  }
  
  private Location getDefaultLocation()
  {
    JSONArray localJSONArray = getRemoteAccessDet();
    localObject = null;
    if (localJSONArray != null) {}
    try
    {
      localLocation = new Location(localJSONArray.get(2).toString(), localJSONArray.get(1).toString());
      localException1.printStackTrace();
    }
    catch (Exception localException1)
    {
      try
      {
        localLocation.setArpMacs(this.remoteAccessManager.getARPMacs());
        localLocation.setSsids(this.remoteAccessManager.getHomeSSIDs());
        localObject = localLocation;
        return (Location)localObject;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          Location localLocation;
          localObject = localLocation;
        }
      }
      localException1 = localException1;
    }
    return (Location)localObject;
  }
  
  private DeviceInformation getDeviceFromList(WeMoDevice paramWeMoDevice, ArrayList<DeviceInformation> paramArrayList, boolean paramBoolean1, boolean paramBoolean2)
  {
    DeviceInformation localDeviceInformation2;
    for (Object localObject = null;; localObject = localDeviceInformation2)
    {
      try
      {
        Iterator localIterator = paramArrayList.iterator();
        do
        {
          for (;;)
          {
            if (!localIterator.hasNext()) {
              break label103;
            }
            DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator.next();
            if (localDeviceInformation1.getUDN().equalsIgnoreCase(paramWeMoDevice.getUDN()))
            {
              if (!paramBoolean1) {
                break;
              }
              localObject = getDeviceInfoObjectForLocalCache(paramWeMoDevice);
              if (localObject != null) {
                ((DeviceInformation)localObject).setID(localDeviceInformation1.getID());
              }
            }
          }
        } while (!paramBoolean2);
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return null;
      }
      localDeviceInformation2 = getDeviceInfoObjectForDevicesCache(paramWeMoDevice);
    }
    label103:
    return (DeviceInformation)localObject;
  }
  
  private DeviceInformation getDeviceInfoBySID(String paramString)
  {
    return getDeviceInformationBySID(paramString);
  }
  
  private DeviceInformation getDeviceInfoObjectForDevicesCache(WeMoDevice paramWeMoDevice)
  {
    try
    {
      boolean bool = IsDevice.Bridge(paramWeMoDevice.getUDN());
      int i = 0;
      if (!bool) {
        i = Integer.valueOf(paramWeMoDevice.getState()).intValue();
      }
      String str = "";
      if (paramWeMoDevice.getDevice() != null) {
        str = String.valueOf(paramWeMoDevice.getDevice().getTimeStamp());
      }
      DeviceInformation localDeviceInformation = new DeviceInformation(paramWeMoDevice.getUDN(), paramWeMoDevice.getType(), paramWeMoDevice.getFriendlyName(), paramWeMoDevice.getLogoURL(), i, paramWeMoDevice.getAttributeList(), paramWeMoDevice.getInActive(), paramWeMoDevice.getModelName(), paramWeMoDevice.getCustomizedState(), paramWeMoDevice.getFirmwareVersion(), getDeviceInfoParameter(paramWeMoDevice.getDevice()), "0", str, 0);
      return localDeviceInformation;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  private DeviceInformation getDeviceInfoObjectForLocalCache(WeMoDevice paramWeMoDevice)
  {
    String str = "";
    Device localDevice = paramWeMoDevice.getDevice();
    int i = 0;
    if (localDevice != null)
    {
      str = String.valueOf(paramWeMoDevice.getDevice().getIPAddress());
      i = paramWeMoDevice.getDevice().getPort();
    }
    return new DeviceInformation(paramWeMoDevice.getUDN(), str, i);
  }
  
  private String getDeviceInfoParameter(Device paramDevice)
  {
    String str = "";
    String[] arrayOfString;
    JSONObject localJSONObject;
    if (paramDevice != null)
    {
      arrayOfString = paramDevice.getDeviceInformationFromDevice();
      if ((arrayOfString != null) && (arrayOfString.length > 0)) {
        localJSONObject = new JSONObject();
      }
    }
    try
    {
      localJSONObject.put("macAddress", arrayOfString[0]);
      localJSONObject.put("FWVersion", arrayOfString[1]);
      localJSONObject.put("iconVersion", arrayOfString[2]);
      localJSONObject.put("iconPort", arrayOfString[3]);
      localJSONObject.put("binaryState", arrayOfString[4]);
      localJSONObject.put("friendlyName", arrayOfString[5]);
      str = localJSONObject.toString();
      return str;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  public static String getFilteredUDN(String paramString)
  {
    return paramString.replace(":switch:sensor", ":sensor:switch");
  }
  
  public static String getIPForDevice(String paramString)
  {
    String str = "";
    if (devListManager != null)
    {
      DeviceInformation localDeviceInformation = devListManager.getDevice(paramString);
      if ((localDeviceInformation != null) && (localDeviceInformation.getDevice() != null)) {
        str = localDeviceInformation.getDevice().getIPAddress();
      }
    }
    return str;
  }
  
  public static String getIconsDir()
  {
    if (iconsDir == null) {
      iconsDir = "";
    }
    return iconsDir;
  }
  
  public static DeviceListManager getInstance(Context paramContext)
  {
    try
    {
      if (devListManager == null) {
        devListManager = new DeviceListManager(paramContext);
      }
      DeviceListManager localDeviceListManager = devListManager;
      return localDeviceListManager;
    }
    finally {}
  }
  
  public static DeviceListManager getInstance(DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity, Context paramContext)
  {
    try
    {
      devListManager = getInstance(paramContext);
      if (paramDeviceListManagerCallbacksActivity != null) {
        devListManager.setCallbackListener(paramDeviceListManagerCallbacksActivity);
      }
      DeviceListManager localDeviceListManager = devListManager;
      return localDeviceListManager;
    }
    finally {}
  }
  
  public static String getPackageName()
  {
    if (packageName == null) {
      packageName = "";
    }
    return packageName;
  }
  
  public static int getPortForDevice(String paramString)
  {
    DeviceListManager localDeviceListManager = devListManager;
    int i = 0;
    if (localDeviceListManager != null)
    {
      DeviceInformation localDeviceInformation = devListManager.getDevice(paramString);
      i = 0;
      if (localDeviceInformation != null)
      {
        Device localDevice = localDeviceInformation.getDevice();
        i = 0;
        if (localDevice != null) {
          i = localDeviceInformation.getDevice().getPort();
        }
      }
    }
    return i;
  }
  
  private SmartDiscovery getSmartDiscovery()
  {
    synchronized (this.mutex)
    {
      if (this.smartDiscovery == null) {
        this.smartDiscovery = new SmartDiscovery(this, this.remoteAccessManager, this.mNetworkUtils, new CloudRequestManager(context));
      }
      SmartDiscovery localSmartDiscovery = this.smartDiscovery;
      return localSmartDiscovery;
    }
  }
  
  private boolean isCandidateForMSearchProcessing(Device paramDevice)
  {
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap: isCandidateForMSearchProcessing.");
    printFwUpgradeInProgressMapIfDebug();
    if (NetworkMode.isLocal())
    {
      String str = paramDevice.getUDN();
      boolean bool1 = cacheManager.isCandidateForMSearch(str, paramDevice.getIPAddress(), paramDevice.getPort());
      boolean bool2 = this.fwUpdateInProgressDataMap.containsKey(str);
      SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device: isCandidateForMSearchProcessing: UDN: " + str + "; isCandidateForMSearchViaDB: " + bool1 + ";  isDeviceInUpdateMode: " + bool2);
      boolean bool3;
      if (!bool1)
      {
        bool3 = false;
        if (!bool2) {}
      }
      else
      {
        if (this.mNetworkUtils.isPluginConnected()) {
          break label150;
        }
        SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device is not directly connected to APP: " + str);
        bool3 = true;
      }
      return bool3;
      label150:
      SDKLogUtils.errorLog("DeviceListManager", "Discovery: MSearch Device is DIRECTLY connected to APP: " + str);
      return false;
    }
    SDKLogUtils.errorLog("DeviceListManager", "Network Mode is REMOTE thus MSearch Device is NOT a candidate for processing.");
    return false;
  }
  
  private boolean isLocalMode()
  {
    String str = this.mNetworkUtils.getNetworkType();
    return (!str.equalsIgnoreCase("Remote_Mobile")) && (!str.equalsIgnoreCase("Remote_WiFi"));
  }
  
  private boolean needUpdateDeviceToDB(DeviceInformation paramDeviceInformation)
  {
    if (paramDeviceInformation != null)
    {
      DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramDeviceInformation.getUDN(), false, false, true);
      if (localDeviceInformation == null) {}
      while (((paramDeviceInformation.getType() != null) && (!paramDeviceInformation.getType().equals("")) && (!paramDeviceInformation.getType().equals(localDeviceInformation.getType()))) || ((paramDeviceInformation.getFriendlyName() != null) && (!paramDeviceInformation.getFriendlyName().equals("")) && (!paramDeviceInformation.getFriendlyName().equals(localDeviceInformation.getFriendlyName()))) || ((paramDeviceInformation.getIcon() != null) && (!paramDeviceInformation.getIcon().equals("")) && (!paramDeviceInformation.getIcon().equals(localDeviceInformation.getIcon()))) || ((paramDeviceInformation.getAttributeList() != null) && (!paramDeviceInformation.getAttributeList().equals("")) && (!paramDeviceInformation.getAttributeList().equals(localDeviceInformation.getAttributeList()))) || ((paramDeviceInformation.getModelCode() != null) && (!paramDeviceInformation.getModelCode().equals("")) && (!paramDeviceInformation.getModelCode().equals(localDeviceInformation.getModelCode()))) || ((paramDeviceInformation.getCustomizedState() != null) && (!paramDeviceInformation.getCustomizedState().equals("")) && (!paramDeviceInformation.getCustomizedState().equals(localDeviceInformation.getCustomizedState()))) || ((paramDeviceInformation.getFirmwareVersion() != null) && (!paramDeviceInformation.getFirmwareVersion().equals("")) && (!paramDeviceInformation.getFirmwareVersion().equals(localDeviceInformation.getFirmwareVersion()))) || ((paramDeviceInformation.getInfo() != null) && (!paramDeviceInformation.getInfo().equals("")) && (!paramDeviceInformation.getInfo().equals(localDeviceInformation.getInfo()))) || ((paramDeviceInformation.getLastSeen() != null) && (!paramDeviceInformation.getLastSeen().equals("")) && (!paramDeviceInformation.getLastSeen().equals(localDeviceInformation.getLastSeen()))) || (paramDeviceInformation.getState() != localDeviceInformation.getState()) || (paramDeviceInformation.getInActive() != localDeviceInformation.getInActive()) || (paramDeviceInformation.getFwStatus() != localDeviceInformation.getFwStatus()) || (paramDeviceInformation.getHide() != localDeviceInformation.getHide())) {
        return true;
      }
    }
    return false;
  }
  
  private void onBridgeNotDiscovered(String paramString)
  {
    SDKLogUtils.debugLog("DeviceListManager", "Unicast Discovery: Bridge not discovered. Thus, updating all Zigbee devices. Bridge UDN: " + paramString);
    List localList = cacheManager.getInitialZigbeeDevicesList(paramString);
    Iterator localIterator1 = localList.iterator();
    while (localIterator1.hasNext())
    {
      DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator1.next();
      String str = localDeviceInformation2.getUDN();
      SDKLogUtils.debugLog("DeviceListManager", "Unicast Discovery: Bridge not discovered. Updating Zigbee Device: UDN" + str);
      localDeviceInformation2.setInActive(1);
      localDeviceInformation2.setIsDiscovered(false);
      this.devicesArray.setDeviceDiscovered(str, false);
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation2);
      sendNotification("update", "", str);
      sendNotificationAboutDiscoveryStateChange(str, "Discovery TimeOut");
    }
    Iterator localIterator2 = localList.iterator();
    while (localIterator2.hasNext())
    {
      DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator2.next();
      cacheManager.updateDB(localDeviceInformation1, true, true, true);
    }
    if (SDKLogUtils.isDebug()) {
      new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
    }
  }
  
  private void removeOfflineGroupLeds(Map<String, DeviceInformation> paramMap)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator1 = new ArrayList(paramMap.values()).iterator();
    while (localIterator1.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator1.next();
      int j = localDeviceInformation.getInActive();
      String str4 = localDeviceInformation.getGroupID();
      SDKLogUtils.debugLog("DeviceListManager", "Separating out ONLINE and OFFLINE Groups. Device UDN: " + localDeviceInformation.getUDN() + "; GroupID: " + str4 + "; InActive: " + j);
      if (!TextUtils.isEmpty(str4))
      {
        Integer localInteger = (Integer)localHashMap.get(str4);
        if (localInteger == null) {
          localInteger = Integer.valueOf(0);
        }
        if (j == 0) {
          localHashMap.put(str4, Integer.valueOf(1 + localInteger.intValue()));
        } else {
          localHashMap.put(str4, localInteger);
        }
      }
    }
    Iterator localIterator2 = localHashMap.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      String str1 = (String)localEntry1.getKey();
      int i = ((Integer)localEntry1.getValue()).intValue();
      SDKLogUtils.debugLog("DeviceListManager", "Deleting LEDs in Offline Groups. GroupID: " + str1 + "; LedCount: " + i);
      if (i == 0)
      {
        Iterator localIterator3 = paramMap.entrySet().iterator();
        while (localIterator3.hasNext())
        {
          Map.Entry localEntry2 = (Map.Entry)localIterator3.next();
          String str2 = (String)localEntry2.getKey();
          String str3 = ((DeviceInformation)localEntry2.getValue()).getGroupID();
          SDKLogUtils.debugLog("DeviceListManager", "Next LED. GroupID: " + str3 + "; UDN: " + str2);
          if (str3.equals(str1)) {
            if (cacheManager.isDeviceInDB(str2))
            {
              SDKLogUtils.debugLog("DeviceListManager", "LED NOT Removed, as in cache.db");
            }
            else
            {
              SDKLogUtils.debugLog("DeviceListManager", "LED Removed, as not in cache.db");
              localIterator3.remove();
            }
          }
        }
      }
    }
  }
  
  private void removeUndiscoveredDevicesFromRemoteTable(ArrayList<DeviceInformation> paramArrayList)
  {
    Iterator localIterator1 = cacheManager.getDeviceListFromDB(false, true, false).iterator();
    while (localIterator1.hasNext())
    {
      DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
      Iterator localIterator2 = paramArrayList.iterator();
      DeviceInformation localDeviceInformation2;
      do
      {
        boolean bool = localIterator2.hasNext();
        i = 0;
        if (!bool) {
          break;
        }
        localDeviceInformation2 = (DeviceInformation)localIterator2.next();
      } while (!localDeviceInformation1.getUDN().equalsIgnoreCase(localDeviceInformation2.getUDN()));
      int i = 1;
      if (i == 0)
      {
        cacheManager.hideDevice(localDeviceInformation1.getID(), true);
        this.devicesArray.deleteDeviceInformation(localDeviceInformation1.getUDN());
        sendNotification("hide", "", localDeviceInformation1.getUDN());
      }
    }
  }
  
  private void resetForcedRemoteFlag()
  {
    boolean bool = getSmartDiscovery().isForcedRemoteEnabled();
    SDKLogUtils.infoLog("DeviceListManager", "resetForcedRemoteFlag: isForcedRemoteEnabled: " + bool);
    if (bool)
    {
      getSmartDiscovery().setForcedRemoteEnabled(false);
      sendNotification("set_remote", String.valueOf(getSmartDiscovery().isForcedRemoteEnabled()), "");
    }
  }
  
  private void restartLocalMode(NotificationListenerDLM paramNotificationListenerDLM)
  {
    this.devicesArray.clearDeviceDiscoveries();
    addNotificationListener(paramNotificationListenerDLM);
    startUnicastDiscovery();
    startListen();
    stopCloudPeriodicUpdate();
    startCloudPeriodicUpdate();
    new Timer().schedule(new TimerTask()
    {
      public void run()
      {
        if (DeviceListManager.this.mNetworkUtils.isHomeNetwork()) {
          DeviceListManager.this.initControlPoint();
        }
      }
    }, 5000L);
  }
  
  private void saveDeviceCache()
  {
    ArrayList localArrayList = this.devicesArray.getDeviceInformationArrayList();
    if (NetworkMode.isLocal())
    {
      Iterator localIterator2 = localArrayList.iterator();
      while (localIterator2.hasNext())
      {
        DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator2.next();
        cacheManager.updateDB(localDeviceInformation2, true, false, true);
      }
    }
    Iterator localIterator1 = localArrayList.iterator();
    while (localIterator1.hasNext())
    {
      DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
      cacheManager.updateDB(localDeviceInformation1, false, true, true);
    }
  }
  
  public static String saveIconToStorage(String paramString1, String paramString2, String paramString3)
  {
    File localFile1;
    try
    {
      File localFile2 = FileStorage.getInstance(context).getIconFile(new URL(paramString1), paramString3, paramString2);
      localFile1 = localFile2;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("DeviceListManager", "MalformedURLException while getting icon file: ", localMalformedURLException);
        localFile1 = null;
      }
    }
    if (localFile1 == null) {
      return "";
    }
    return localFile1.getAbsolutePath();
  }
  
  public static String saveRemoteIconToStorage(Bitmap paramBitmap, String paramString1, String paramString2)
  {
    String str = null;
    try
    {
      str = FileStorage.getInstance(context).storeRemoteIcon(paramBitmap, paramString1, paramString2);
      SDKLogUtils.infoLog("DeviceListManager", "new icon for MAC: " + paramString1 + "-" + str);
      if (str == null) {
        str = "";
      }
      return str;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("DeviceListManager", "Exception while saving icon file: ", localException);
      }
    }
  }
  
  private void scanZigBeeBridge(String paramString)
  {
    SDKLogUtils.infoLog("DeviceListManager", "Discovery Zigbee: in scanZigBeeBridge. Bridge UDN: " + paramString);
    if ((paramString == null) || (paramString.isEmpty())) {}
    IZigBeeDevices localIZigBeeDevices;
    do
    {
      return;
      updateCapabilityProfileTable();
      localIZigBeeDevices = new GetZigBeeDevicesFactory().getGetZigBeeDevicesInstance(paramString, this);
    } while (localIZigBeeDevices == null);
    FetchZigBeeDevicesCallback localFetchZigBeeDevicesCallback = new FetchZigBeeDevicesCallback(paramString);
    LEDStatusTracker.resetOfflineLEDCount();
    localIZigBeeDevices.fetchZigBeeDevices(localFetchZigBeeDevicesCallback);
  }
  
  private void sendNotificationAboutDiscoveryStateChange(String paramString1, String paramString2)
  {
    if (paramString2.equals("Discovery Success")) {
      this.devicesArray.setDeviceDiscovered(paramString1, true);
    }
    while (!paramString2.equals("Discovery TimeOut")) {
      return;
    }
    this.devicesArray.setDeviceDiscovered(paramString1, false);
  }
  
  private void startListen()
  {
    SDKLogUtils.infoLog("Listeners", "in startListen");
    if (this.mControlPoint == null) {
      this.mControlPoint = new ControlPoint();
    }
    this.mControlPoint.addDeviceChangeListener(this);
    this.mControlPoint.addEventListener(this);
  }
  
  private void stopLocalMode()
  {
    if (this.mNetworkUtils.isHomeNetwork())
    {
      stopListen();
      stopUnicastDiscovery();
    }
  }
  
  private void synchFiles(Device paramDevice, String paramString)
    throws MalformedURLException, ParserException
  {
    URL localURL = new URL(paramDevice.getSSDPPacket().getLocation());
    FileStorage localFileStorage = FileStorage.getInstance(null);
    localFileStorage.setReload(true);
    localFileStorage.getDescriptionFile(localURL, paramString);
    localFileStorage.setReload(false);
    this.mControlPoint.updateDevice(paramDevice);
  }
  
  private String updateAttributeForMaker(String paramString, DeviceInformation paramDeviceInformation)
  {
    JSONObject localJSONObject1 = null;
    try
    {
      localJSONObject1 = paramDeviceInformation.getAttributeList();
      JSONObject localJSONObject2 = new JSONObject(paramString).getJSONObject("attribute");
      String str1 = localJSONObject2.getString("name");
      String str2 = localJSONObject2.getString("value");
      JSONObject localJSONObject3 = localJSONObject1.getJSONObject(MoreUtil.changeAttributes(str1));
      localJSONObject3.put("value", str2);
      paramDeviceInformation.setState(Integer.parseInt(str2));
      Log.v("DeviceListManager", "changeJson" + localJSONObject3.toString());
      return localJSONObject1.toString();
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
  
  private String updateAttributeList(String paramString, WeMoDevice paramWeMoDevice)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("<attributelist>");
    localStringBuffer.append(paramString);
    localStringBuffer.append("</attributelist>");
    JSONObject localJSONObject1 = new AttributeNotificationParser().parseAttributeRespone(localStringBuffer.toString());
    if (localJSONObject1 != null) {}
    for (;;)
    {
      try
      {
        str1 = paramWeMoDevice.getAttributeList();
        if ((str1 == null) || (str1.equalsIgnoreCase(""))) {
          continue;
        }
        localJSONObject2 = new JSONObject(str1);
        try
        {
          Log.v("DeviceListManager", "preAttributeListJson" + localJSONObject2.toString());
          Iterator localIterator = localJSONObject1.keys();
          if (!localIterator.hasNext()) {
            continue;
          }
          str3 = (String)localIterator.next();
          if ((!localJSONObject1.has(str3)) || (!localJSONObject2.has(str3))) {
            continue;
          }
          JSONObject localJSONObject3 = localJSONObject1.getJSONObject(str3);
          localJSONObject4 = localJSONObject2.getJSONObject(str3);
          str4 = localJSONObject3.optString("value");
          str5 = localJSONObject2.optString("value");
          if (isSmart(paramWeMoDevice.getDevice().getDeviceType())) {
            continue;
          }
          JSONObject localJSONObject5 = localJSONObject2.getJSONObject("SwitchMode");
          Log.v("DeviceListManager", "Notification for" + str3);
          if (!localJSONObject5.optString("value").equals("1")) {
            continue;
          }
          if (!str3.equals("Switch")) {
            continue;
          }
          this.isNotificationComes = false;
          paramWeMoDevice.setState("0");
          localJSONObject4.put("value", "0");
          Log.v("DeviceListManager", "isNotificationComes ignore " + this.isNotificationComes);
          continue;
          localJSONException1.printStackTrace();
        }
        catch (JSONException localJSONException1) {}
      }
      catch (JSONException localJSONException2)
      {
        String str1;
        JSONObject localJSONObject2;
        String str3;
        JSONObject localJSONObject4;
        String str4;
        String str5;
        String str2;
        continue;
      }
      return null;
      this.isNotificationComes = true;
      localJSONObject4.put("value", str4);
      continue;
      if (!str4.equals(str5))
      {
        Log.v("DeviceListManager", "isNotificationComes comes attributeKey ::" + str3);
        this.isNotificationComes = true;
        if (str3.equals("Switch")) {
          paramWeMoDevice.setState(localJSONObject4.optString("value"));
        }
        localJSONObject4.put("value", str4);
        continue;
        if (!str4.equals(str5))
        {
          paramWeMoDevice.setState(localJSONObject4.optString("value"));
          localJSONObject4.put("value", str4);
          Log.v("DeviceListManager", "SMART: isNotificationComes comes attributeKey ::" + str3);
          this.isNotificationComes = true;
          continue;
          Log.v("DeviceListManager.updateAttributeList", "updateAttributeJsons " + localJSONObject1.toString());
          str2 = localJSONObject2.toString();
          return str2;
          Log.v("DeviceListManager", "Device: " + paramWeMoDevice.getUDN() + "  attributeList: " + str1);
        }
      }
    }
  }
  
  public static void updateCapabilityProfileTable()
  {
    SDKLogUtils.infoLog("ZigbeeScan", "updateCapabilityProfileTable");
    if (capabalityProfileList == null)
    {
      capabalityProfileList = new LinkedHashMap();
      capabalityProfileList.put("10006", "onOff");
      capabalityProfileList.put("10008", "levelControl");
      capabalityProfileList.put("30008", "sleepFader");
      capabalityProfileList.put("30009", "levelControlMove");
      capabalityProfileList.put("3000A", "levelControlStop");
      capabalityProfileList.put("10003", "identify");
      capabalityProfileList.put("10300", "colorControl");
      capabalityProfileList.put("30301", "colorTemperature");
      capabalityProfileList.put("10500", "iasZone");
      capabalityProfileList.put("20500", "sensorConfig");
      capabalityProfileList.put("30501", "sensorTestMode");
      capabalityProfileList.put("20502", "sensorKeyPress");
    }
  }
  
  private void updateDeviceNameInListAndCache(WeMoDevice paramWeMoDevice)
  {
    this.devicesArray.updateFriendlyName(paramWeMoDevice.getUDN(), paramWeMoDevice.getFriendlyName());
    DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramWeMoDevice.getUDN(), false, false, true);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setFriendlyName(paramWeMoDevice.getFriendlyName());
      cacheManager.updateDeviceFromDB(localDeviceInformation, false, false, true);
    }
    sendNotification("update", "", paramWeMoDevice.getUDN());
  }
  
  private boolean updateDeviceToDBDevicesTable(DeviceInformation paramDeviceInformation)
  {
    boolean bool = false;
    if (paramDeviceInformation != null)
    {
      cacheManager.updateDB(paramDeviceInformation, false, false, true);
      bool = true;
    }
    return bool;
  }
  
  private boolean updateDeviceToDBDevicesTable(WeMoDevice paramWeMoDevice)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramWeMoDevice.getUDN());
    if (localDeviceInformation == null) {
      localDeviceInformation = getDeviceFromList(paramWeMoDevice, cacheManager.getDeviceListFromDB(false, false, true), false, true);
    }
    boolean bool = false;
    if (localDeviceInformation != null)
    {
      cacheManager.updateDeviceFromDB(localDeviceInformation, false, false, true);
      bool = true;
    }
    return bool;
  }
  
  private boolean updateDeviceToDBLocalTable(WeMoDevice paramWeMoDevice)
  {
    DeviceInformation localDeviceInformation = getDeviceFromList(paramWeMoDevice, cacheManager.getDeviceListFromDB(true, false, false), true, false);
    boolean bool = false;
    if (localDeviceInformation != null)
    {
      cacheManager.updateDeviceFromDB(localDeviceInformation, true, false, false);
      bool = true;
    }
    return bool;
  }
  
  private boolean updateWeMoDevice(WeMoDevice paramWeMoDevice)
  {
    Device localDevice = paramWeMoDevice.getDevice();
    String str1;
    if (localDevice != null)
    {
      str1 = "";
      String str2 = "";
      String str3 = "";
      String str4 = "";
      String str5 = "";
      Map localMap = localDevice.getCustomizedInformationFromDevice();
      String str6;
      String str7;
      if (localMap != null)
      {
        str6 = (String)localMap.get("FriendlyName");
        str7 = (String)localMap.get("binaryState");
        str1 = (String)localMap.get("iconVersion");
        str2 = (String)localMap.get("CustomizedState");
        if (localMap.get("brandName") != null) {
          str4 = (String)localMap.get("brandName");
        }
        if (localMap.get("productName") != null) {
          str5 = (String)localMap.get("productName");
        }
        SDKLogUtils.infoLog("WeMoSDK", "DeviceListManager : updateWeMoDevice customizedState: " + str2 + " friendlyName: " + str6 + " binaryState: " + str7 + " iconVersion: " + str1 + " udn: " + paramWeMoDevice.getUDN() + " brandName: " + str4 + " productName: " + str5);
      }
      while ((str7 == null) || (str7.equals("")))
      {
        Log.e("WeMoSDK", "DeviceListManager : remove " + paramWeMoDevice.getUDN());
        return false;
        String[] arrayOfString = localDevice.getDeviceInformationFromDevice();
        if (arrayOfString == null)
        {
          str6 = localDevice.getFriendlyNameFromDevice();
          SDKLogUtils.infoLog("WeMoSDK", "DeviceListManager : updateWeMoDevice friendlyName: " + str6 + " " + paramWeMoDevice.getUDN());
          if ((str6 == null) || (str6.trim().length() == 0)) {
            str6 = localDevice.getFriendlyName();
          }
          str7 = localDevice.getBinaryStateFromDevice();
          str3 = localDevice.getFirmwareVersionFromDevice();
        }
        else
        {
          str6 = arrayOfString[5];
          str7 = arrayOfString[4];
          str1 = arrayOfString[2];
          str3 = arrayOfString[1];
          if (arrayOfString.length > 6) {
            str4 = arrayOfString[6];
          }
        }
      }
      if (!subscribeToService(paramWeMoDevice.getDevice()))
      {
        Log.e("WeMoSDK", "DeviceListManager : subscription failed " + paramWeMoDevice.getUDN());
        return false;
      }
      SDKLogUtils.infoLog("WeMoSDK", "DeviceListManager : update " + paramWeMoDevice.getUDN() + " friendlyName: " + str6 + " binaryState: " + str7 + " firmwareVersion " + str3 + " brandName: " + str4);
      paramWeMoDevice.setAvailability(true);
      paramWeMoDevice.setState(str7);
      localDevice.setFriendlyName(str6);
      paramWeMoDevice.setFriendlyName(str6);
      paramWeMoDevice.setCustomizedState(str2);
      paramWeMoDevice.setBrandName(str4);
      paramWeMoDevice.setProductName(str5);
      paramWeMoDevice.setFirmwareVersion(str3);
      localDevice.setConfigureState("");
      String str11;
      if (IsDevice.Maker(localDevice.getDeviceType())) {
        str11 = paramWeMoDevice.getAttributeList();
      }
      for (;;)
      {
        try
        {
          if ((!str11.equals("")) && (!str11.equals("null")) && (!str11.equals(null))) {
            continue;
          }
          JSONObject localJSONObject3 = localDevice.getAttriuteListFromDevice();
          localObject2 = localJSONObject3;
        }
        catch (Exception localException)
        {
          JSONObject localJSONObject2;
          Log.e("DeviceListManager", "Exception in attribute list " + localException.toString());
          Object localObject2 = null;
          continue;
          localFileStorage1 = FileStorage.getInstance(null);
          localURL1 = new URL(paramWeMoDevice.getLogoURL());
          str9 = paramWeMoDevice.getSerialNumber();
          localFile1 = localFileStorage1.getIconFile(localURL1, str1, str9);
          localObject1 = localFile1;
          continue;
        }
        localJSONObject2 = localDevice.updateAttributesList((JSONObject)localObject2, localDevice.getAttributetParameterFromDevice());
        if (localJSONObject2 != null) {
          paramWeMoDevice.setAttributeList(localJSONObject2.toString());
        }
        try
        {
          if ((!str1.equals("0")) || (!paramWeMoDevice.getUDN().contains("uuid:Maker"))) {
            continue;
          }
          FileStorage localFileStorage2 = FileStorage.getInstance(context);
          URL localURL2 = new URL(paramWeMoDevice.getLogoURL());
          String str10 = paramWeMoDevice.getSerialNumber();
          File localFile2 = localFileStorage2.storeDefaultIcon(localURL2, str1, str10);
          localObject1 = localFile2;
        }
        catch (MalformedURLException localMalformedURLException)
        {
          JSONObject localJSONObject1;
          JSONObject localJSONObject4;
          FileStorage localFileStorage1;
          URL localURL1;
          String str9;
          File localFile1;
          Log.e(getClass().getName(), "Incorrect logo url ", localMalformedURLException);
          Object localObject1 = null;
          continue;
          String str8 = ((File)localObject1).getAbsolutePath();
          continue;
        }
        if (localObject1 != null) {
          break label998;
        }
        str8 = "";
        paramWeMoDevice.setLogo(str8);
        SDKLogUtils.infoLog("WeMoSDK", "DeviceListManager :device.getDeviceType() " + localDevice.getDeviceType());
        if ((localDevice.getDeviceType().contains("Heater")) || (localDevice.getDeviceType().contains("Humidifier")) || (localDevice.getDeviceType().contains("AirPurifier")) || (localDevice.getDeviceType().contains("CoffeeMaker")))
        {
          localJSONObject1 = localDevice.getAttriuteListFromDevice();
          if (localJSONObject1 != null) {
            paramWeMoDevice.setAttributeList(localJSONObject1.toString());
          }
        }
        return true;
        localJSONObject4 = new JSONObject(str11);
        localObject2 = localJSONObject4;
      }
    }
    label998:
    return false;
  }
  
  public void addDeviceWithOnlyUDNToLocalOrRemoteTable(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    DeviceInformation localDeviceInformation = new DeviceInformation(paramString, "", "", "");
    cacheManager.addDeviceToDB(localDeviceInformation, paramBoolean1, paramBoolean2, false);
  }
  
  public void addGroup(String paramString1, String paramString2, JSONObject paramJSONObject, boolean paramBoolean)
  {
    CloudRequestManager localCloudRequestManager = new CloudRequestManager(context);
    if (NetworkMode.isLocal())
    {
      LEDOperations localLEDOperations = new LEDOperations("CreateGroup", paramString2, paramJSONObject, Boolean.valueOf(paramBoolean));
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localLEDOperations);
    }
    while (this.remoteAccessManager.isRemoteEnabled()) {
      try
      {
        String str1 = paramJSONObject.getString("groupID");
        String str2 = null;
        label92:
        String str4;
        if (paramJSONObject.getString("groupIcon").trim().length() != 0)
        {
          str2 = paramJSONObject.getString("groupIcon");
          if (!str2.startsWith("file:///android_asset/")) {
            break label293;
          }
          str4 = str2.substring("file:///android_asset/".length());
        }
        label293:
        Bitmap localBitmap;
        for (Object localObject = BitmapFactory.decodeStream(context.getAssets().open(str4));; localObject = localBitmap)
        {
          String str3 = FileStorage.getInstance(context).storeRemoteIcon((Bitmap)localObject, str1, str1);
          paramJSONObject.put("icon", str3);
          localCloudRequestManager.makeMultiPartRequest(new CloudRequestSetGroupIcon(context, str1, str3));
          return;
          SDKLogUtils.infoLog("DeviceListManager", "calling CloudRequestAddEditGroup:  " + paramJSONObject);
          localCloudRequestManager.makeRequest(new CloudRequestAddOrEditGroup(context, paramString2, paramJSONObject, paramBoolean));
          break;
          JSONArray localJSONArray = paramJSONObject.getJSONArray("deviceID");
          JSONObject localJSONObject = paramJSONObject.getJSONObject("deviceCapabilities");
          for (int i = 0; i < localJSONArray.length(); i++)
          {
            DeviceInformation localDeviceInformation = updateZigbeeCapabilities(localJSONArray.getString(i), localJSONObject);
            str2 = WemoUtils.getZigbeeIcon(localDeviceInformation.getManufacturerName(), localDeviceInformation.getModelCode());
          }
          break label92;
          localBitmap = BitmapFactory.decodeFile(str2);
        }
        SDKLogUtils.errorLog("DeviceListManager", "addGroup(): ERROR - Remote access is not enabled.");
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "JSONException in addGroup: ", localJSONException);
        return;
      }
      catch (IOException localIOException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "IOException in addGroup: ", localIOException);
        return;
      }
    }
  }
  
  public void addLocationCloud(NotificationListenerDLM paramNotificationListenerDLM, String paramString1, String paramString2)
  {
    Log.d("DeviceListManager", "addLocation lastSSID: " + this.lastSSID + " isLocal: " + NetworkMode.isLocal() + " lastModeLocal: " + this.lastModeLocal + " locationName: " + paramString2 + " currentHomeId: " + paramString1);
    String str1 = new WiFiSecurityUtil().getDeviceID(context);
    String str2 = this.mNetworkUtils.getMacFromArpCache();
    String str3 = this.mNetworkUtils.getSSID();
    new CloudRequestManager(context).makeRequest(new CloudRequestAddLocation(this, context, str1, str2, str3, paramString1, paramString2));
  }
  
  public void addLocationDB(Location paramLocation)
  {
    cacheLocationsManager.addLocationToDB(paramLocation);
  }
  
  public void addNotificationListener(NotificationListenerDLM paramNotificationListenerDLM)
  {
    if (paramNotificationListenerDLM == null)
    {
      SDKLogUtils.infoLog("Listeners", "listener is null returning..");
      return;
    }
    SDKLogUtils.infoLog("Listeners", "adding Notification Listener");
    if (this.listenersSet == null) {
      this.listenersSet = new ConcurrentSkipListSet(new Comparator()
      {
        public int compare(DeviceListManager.NotificationListenerDLM paramAnonymousNotificationListenerDLM1, DeviceListManager.NotificationListenerDLM paramAnonymousNotificationListenerDLM2)
        {
          return paramAnonymousNotificationListenerDLM1.hashCode() - paramAnonymousNotificationListenerDLM2.hashCode();
        }
      });
    }
    if (!this.listenersSet.contains(paramNotificationListenerDLM))
    {
      SDKLogUtils.infoLog("Listeners", "added Notification Listener");
      this.listenersSet.add(paramNotificationListenerDLM);
      return;
    }
    SDKLogUtils.infoLog("Listeners", "Notification Listener already exists");
  }
  
  public void addOrUpdateDeviceInformation(DeviceInformation paramDeviceInformation)
  {
    if (this.devicesArray != null) {
      this.devicesArray.addOrUpdateDeviceInformation(paramDeviceInformation);
    }
  }
  
  public boolean areNestFirmwareSupported()
  {
    boolean bool = true;
    SDKLogUtils.infoLog("DeviceListManager", "Checking for Nest firmware Supported devices.");
    try
    {
      Map localMap = this.devicesArray.getDeviceInformationList();
      if ((localMap != null) && (localMap.size() > 0))
      {
        Iterator localIterator = localMap.values().iterator();
        while (localIterator.hasNext())
        {
          DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
          if (localDeviceInformation.getIsDiscovered())
          {
            String str = localDeviceInformation.getUDN();
            if (((IsDevice.Insight(str)) || (IsDevice.LightSocket(str)) || (IsDevice.Maker(str)) || (IsDevice.Switch(str))) && (!IsDevice.Smart(str)))
            {
              String[] arrayOfString = localDeviceInformation.getFirmwareVersion().split("\\.");
              if (arrayOfString.length > 1)
              {
                int i = Integer.parseInt(arrayOfString[2]);
                if (i < 10135) {
                  bool = false;
                }
              }
            }
          }
        }
      }
      return bool;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception: ", localException);
    }
    return bool;
  }
  
  public void calibrate(String paramString1, String paramString2, String paramString3, String paramString4, final CalibrateSuccessCallback paramCalibrateSuccessCallback, final CalibrateErrorCallback paramCalibrateErrorCallback)
  {
    if (NetworkMode.isLocal())
    {
      Device localDevice = getUpnpControl().getDevice(paramString1);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("Calibrate");
        if (localAction != null)
        {
          localAction.setArgumentValue("binaryState", paramString2);
          localAction.setArgumentValue("level", paramString4);
          localAction.setArgumentValue("fader", paramString3);
          ControlActionHandler.newInstance().postControlAction(localAction, new ControlActionErrorCallback()new ControlActionSuccessCallback
          {
            public void onActionError(Exception paramAnonymousException)
            {
              SDKLogUtils.errorLog("DeviceListManager", "calibrate: Exception during PostControlAction: ", paramAnonymousException);
              if (paramCalibrateErrorCallback != null) {
                paramCalibrateErrorCallback.onCalibrationFailed(paramAnonymousException.getMessage());
              }
            }
          }, new ControlActionSuccessCallback()
          {
            public void onActionSuccess(String paramAnonymousString)
            {
              SDKLogUtils.errorLog("DeviceListManager", "calibrate: Response from FW: " + paramAnonymousString);
              if ((!TextUtils.isEmpty(paramAnonymousString)) && (paramAnonymousString.contains("SUCCESS"))) {
                if (paramCalibrateSuccessCallback != null) {
                  paramCalibrateSuccessCallback.onCalibrationPassed();
                }
              }
              do
              {
                return;
                SDKLogUtils.errorLog("DeviceListManager", "calibrate: Action Failed.");
              } while (paramCalibrateErrorCallback == null);
              paramCalibrateErrorCallback.onCalibrationFailed("Action failed. Response is empty.");
            }
          });
        }
      }
    }
    do
    {
      do
      {
        return;
        SDKLogUtils.errorLog("DeviceListManager", "calibrate: Control Point object is NULL");
      } while (paramCalibrateErrorCallback == null);
      paramCalibrateErrorCallback.onCalibrationFailed("calibrate: Control Point object is NULL");
      return;
      SDKLogUtils.errorLog("DeviceListManager", "calibrate: SetBulbType API not suppoted in REMOTE mode.");
    } while (paramCalibrateErrorCallback == null);
    paramCalibrateErrorCallback.onCalibrationFailed("calibrate: SetBulbType API not suppoted in REMOTE mode.");
  }
  
  public void changeLocation(NotificationListenerDLM paramNotificationListenerDLM, String paramString)
  {
    Log.d("DeviceListManager", "changeLocation lastSSID: " + this.lastSSID + " isLocal: " + NetworkMode.isLocal() + " lastModeLocal: " + this.lastModeLocal + " locationHomeId: " + paramString);
    this.mNetworkUtils.setCurrentLocationHomeId(paramString);
    onNetworkChange(paramNotificationListenerDLM);
  }
  
  public void checkAppRecovery()
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: inside checkAppRecovery :: ");
    String str = new SharePreferences(context).getHomeId();
    new CloudRequestManager(context).makeRequest(new CloudRequestForAppRecovery(context, this.mActivity, str));
  }
  
  public void clear()
  {
    devListManager = null;
  }
  
  public void collectEmailIDToCloud()
  {
    SDKLogUtils.infoLog("DeviceListManager", "collectEmailIDToCloud called- ");
    String str1 = this.mSharePreference.getEmailIds();
    boolean bool = false;
    try
    {
      JSONObject localJSONObject = new JSONObject(str1);
      bool = localJSONObject.optBoolean("optIn");
      String str4 = localJSONObject.optString("email").toString();
      str2 = str4;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        try
        {
          WeMoThreadPoolHandler.getInstance().executeViaBackground(new CollectEmailIDToWemoCloudRequestRunnable(context, str2, str3, this.mSharePreference));
          WeMoThreadPoolHandler.getInstance().executeViaBackground(new CollectEmailIDToITServerRequestRunnable(context, str2, str3));
          return;
        }
        catch (Exception localException)
        {
          String str2;
          String str3;
          SDKLogUtils.errorLog("DeviceListManager", "Exception: ", localException);
          return;
        }
        localJSONException = localJSONException;
        SDKLogUtils.errorLog("DeviceListManager", "Exception: ", localJSONException);
        str2 = null;
      }
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new CollectEmailIDToWemoCloudRequestRunnable(context, str2, str3, this.mSharePreference));
      return;
    }
    str3 = this.mSharePreference.getEmailOptDeviceType();
    SDKLogUtils.infoLog("DeviceListManager", "emaildId- " + str1 + " ;deviceType- " + str3 + " ;optFlag- " + bool + " ;emailAddress- " + str2 + " ;remoteAccessManager.isRemoteEnabled()- " + this.remoteAccessManager.isRemoteEnabled());
    if (this.remoteAccessManager.isRemoteEnabled())
    {
      SDKLogUtils.infoLog("DeviceListManager", "Collect EmailID: SUCCESS- Remote access is enabled.");
      if (!bool) {}
    }
    do
    {
      SDKLogUtils.errorLog("DeviceListManager", "Collect EmailID: ERROR - Remote access is not enabled.");
    } while (this.emailSubscriptionOnRemoteAccessListener != null);
    this.emailSubscriptionOnRemoteAccessListener = new EmailSubscriptionOnRemoteAccessListener();
    RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this.emailSubscriptionOnRemoteAccessListener);
  }
  
  public void configureDimmingRange(String paramString1, String paramString2, String paramString3, String paramString4, ConfigureDimmingRangeSuccessCallback paramConfigureDimmingRangeSuccessCallback, final ConfigureDimmingRangeErrorCallback paramConfigureDimmingRangeErrorCallback)
  {
    SDKLogUtils.debugLog("DeviceListManager", "configureDimmingRange: UDN: " + paramString1 + "; minBrightness: " + paramString2 + "; maxBrightness: " + paramString3 + "; turnONBrightness: " + paramString4);
    if (NetworkMode.isLocal())
    {
      localDevice = getUpnpControl().getDevice(paramString1);
      if (localDevice != null)
      {
        localAction = localDevice.getAction("ConfigureDimmingRange");
        if (localAction == null) {
          break label149;
        }
        localAction.setArgumentValue("minLevel", paramString2);
        localAction.setArgumentValue("maxLevel", paramString3);
        localAction.setArgumentValue("turnOnLevel", paramString4);
        ControlActionHandler.newInstance().postControlAction(localAction, new ControlActionErrorCallback()new ControlActionSuccessCallback
        {
          public void onActionError(Exception paramAnonymousException)
          {
            SDKLogUtils.errorLog("DeviceListManager", "configureDimmingRange: Exception during PostControlAction: ", paramAnonymousException);
            if (paramConfigureDimmingRangeErrorCallback != null) {
              paramConfigureDimmingRangeErrorCallback.onDimmingConfigurationError(paramAnonymousException.getMessage());
            }
          }
        }, new ControlActionSuccessCallback()
        {
          public void onActionSuccess(String paramAnonymousString)
          {
            SDKLogUtils.errorLog("DeviceListManager", "configureDimmingRange: Response from FW: " + paramAnonymousString);
            if ((!TextUtils.isEmpty(paramAnonymousString)) && (paramAnonymousString.contains("SUCCESS"))) {}
            while (paramConfigureDimmingRangeErrorCallback == null) {
              return;
            }
            paramConfigureDimmingRangeErrorCallback.onDimmingConfigurationError("ERROR: ConfigureDimmingRange Action Failed on FW");
          }
        });
      }
    }
    label149:
    while (paramConfigureDimmingRangeErrorCallback == null)
    {
      Device localDevice;
      Action localAction;
      do
      {
        return;
      } while (paramConfigureDimmingRangeErrorCallback == null);
      paramConfigureDimmingRangeErrorCallback.onDimmingConfigurationError("ERROR: ConfigureDimmingRange Action NOT PRESENT for UDN: " + paramString1);
      return;
    }
    paramConfigureDimmingRangeErrorCallback.onDimmingConfigurationError("ERROR: ConfigureDimmingRange API works ONLY in LOCAL mode.");
  }
  
  public void configureHushMode(String paramString1, final String paramString2, final ConfigureHushModeSuccessCallback paramConfigureHushModeSuccessCallback, final ConfigureHushModeErrorCallback paramConfigureHushModeErrorCallback)
  {
    final DeviceInformation localDeviceInformation = getDevice(paramString1);
    if (localDeviceInformation != null) {
      if (NetworkMode.isLocal())
      {
        Device localDevice = localDeviceInformation.getDevice();
        if (localDevice != null)
        {
          Action localAction = localDevice.getAction("ConfigureHushMode");
          if (localAction != null)
          {
            localAction.setArgumentValue("hushMode", paramString2);
            ControlActionHandler.newInstance().postControlAction(localAction, new ControlActionErrorCallback()new ControlActionSuccessCallback
            {
              public void onActionError(Exception paramAnonymousException)
              {
                SDKLogUtils.errorLog("DeviceListManager", "configureHushMode: Exception during PostControlAction: ", paramAnonymousException);
                if (paramConfigureHushModeErrorCallback != null) {
                  paramConfigureHushModeErrorCallback.onConfigureHushModeFailed(paramAnonymousException.getMessage());
                }
              }
            }, new ControlActionSuccessCallback()
            {
              public void onActionSuccess(String paramAnonymousString)
              {
                SDKLogUtils.errorLog("DeviceListManager", "configureHushMode: Response from FW: " + paramAnonymousString);
                if ((!TextUtils.isEmpty(paramAnonymousString)) && (paramAnonymousString.contains("SUCCESS"))) {}
                do
                {
                  try
                  {
                    localDeviceInformation.setAttributeValue("hushMode", paramString2);
                    DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
                    DeviceListManager.cacheManager.updateDB(localDeviceInformation, true, true, true);
                    if (paramConfigureHushModeSuccessCallback != null) {
                      paramConfigureHushModeSuccessCallback.onHushModeConfigured();
                    }
                    return;
                  }
                  catch (JSONException localJSONException)
                  {
                    do
                    {
                      SDKLogUtils.errorLog("DeviceListManager", "configureHushMode: JSONException while updating device information object: ", localJSONException);
                    } while (paramConfigureHushModeErrorCallback == null);
                    paramConfigureHushModeErrorCallback.onConfigureHushModeFailed(localJSONException.getMessage());
                    return;
                  }
                  SDKLogUtils.errorLog("DeviceListManager", "configureHushMode: Action Failed.");
                } while (paramConfigureHushModeErrorCallback == null);
                paramConfigureHushModeErrorCallback.onConfigureHushModeFailed("Action Failed");
              }
            });
          }
        }
      }
    }
    do
    {
      return;
      CloudRequestConfigureHushMode localCloudRequestConfigureHushMode = new CloudRequestConfigureHushMode(context, localDeviceInformation, paramString2, paramConfigureHushModeSuccessCallback, paramConfigureHushModeErrorCallback);
      new CloudRequestManager(context).makeRequest(localCloudRequestConfigureHushMode);
      return;
      SDKLogUtils.errorLog("DeviceListManager", "configureHushMode: DeviceInformation object is NULL");
    } while (paramConfigureHushModeErrorCallback == null);
    paramConfigureHushModeErrorCallback.onConfigureHushModeFailed("configureHushMode: DeviceInformation object is NULL");
  }
  
  public String createAttributeList(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator1 = paramJSONObject2.keys();
    while (localIterator1.hasNext())
    {
      String str1 = "NULL";
      String str2 = (String)localIterator1.next();
      Iterator localIterator2 = paramJSONObject1.keys();
      while (localIterator2.hasNext())
      {
        String str3 = (String)localIterator2.next();
        if (str3.equalsIgnoreCase(str2)) {
          str1 = paramJSONObject1.optString(str3);
        }
      }
      localStringBuffer.append("<attribute>");
      localStringBuffer.append("<name>");
      localStringBuffer.append(StringUtils.toUpperCamelCase(str2));
      localStringBuffer.append("</name>");
      localStringBuffer.append("<value>");
      localStringBuffer.append(str1);
      localStringBuffer.append("</value>");
      localStringBuffer.append("</attribute>");
    }
    SDKLogUtils.infoLog("setAttriuteState", "str.toString():::::::;" + localStringBuffer.toString());
    return localStringBuffer.toString();
  }
  
  public void deActivateNest()
  {
    SDKLogUtils.infoLog("DeviceListManager", "Deactivating Nest: ");
    try
    {
      CloudRequestForNestDeactivation localCloudRequestForNestDeactivation = new CloudRequestForNestDeactivation(this, context);
      new CloudRequestManager(context).makeRequest(localCloudRequestForNestDeactivation);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception: ", localException);
    }
  }
  
  public void deleteAllLocationFromDB()
  {
    cacheLocationsManager.deleteAllLocationFromDB();
  }
  
  public void deleteDevicePresetCloud(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: deleteDevicePresetCloud :: is called");
    if ((paramJSONArray != null) && (paramSetAndGetActionCallBack != null))
    {
      new CloudRequestManager(context).makeRequest(new CloudRequestForDelDevicePreset(paramSetAndGetActionCallBack, paramJSONArray));
      return;
    }
    SDKLogUtils.infoLog("DeviceListManager", "JSONArray or SetAndGetActionCallBack is null ");
    paramSetAndGetActionCallBack.onError();
  }
  
  public void deleteLocation(String paramString)
  {
    cacheLocationsManager.deleteLocationFromDB(paramString);
  }
  
  public void deviceAdded(final Device paramDevice)
  {
    for (;;)
    {
      synchronized (this.mutex)
      {
        String str = paramDevice.getUDN();
        SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device Added Notification. UDN: " + str);
        if (isCandidateForMSearchProcessing(paramDevice))
        {
          if (this.msearchInProgressDeviceList.contains(str))
          {
            SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device being processed. DO NOT PROCESS AGAIN. UDN: " + paramDevice.getUDN());
            return;
          }
          SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch FRESH DEVICE. STARTING MSearch PROCESSING. UDN: " + paramDevice.getUDN());
          this.msearchInProgressDeviceList.add(str);
          MSearchDeviceAddedRunnable localMSearchDeviceAddedRunnable = new MSearchDeviceAddedRunnable(cacheManager, this.devicesArray, this, this.mSharePreference, this.mActivity, context, paramDevice, new MSearchDeviceAddedRunnable.onMSearchDeviceProcessedListener()
          {
            public void onMSearchProcessingDone(DeviceInformation paramAnonymousDeviceInformation)
            {
              String str1 = paramAnonymousDeviceInformation.getUDN();
              DeviceListManager.this.msearchInProgressDeviceList.remove(str1);
              SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device processing completed. Removed from list. UDN: " + paramDevice.getUDN() + ". MSearch processing in progress count: " + DeviceListManager.this.msearchInProgressDeviceList.size());
              String str2 = paramAnonymousDeviceInformation.getFwStatus();
              SDKLogUtils.debugLog("DeviceListManager", "FW Update: Discovery: MSearch Device FW Status: " + str2 + "; UDN: " + str1);
            }
            
            public void onMSearchProcessingFailed(String paramAnonymousString)
            {
              DeviceListManager.this.msearchInProgressDeviceList.remove(paramAnonymousString);
              SDKLogUtils.errorLog("DeviceListManager", "Discovery: MSearch Device processing FAILED. Removed from list. UDN: " + paramDevice.getUDN() + ". MSearch processing in progress count: " + DeviceListManager.this.msearchInProgressDeviceList.size());
            }
          });
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localMSearchDeviceAddedRunnable);
        }
      }
      SDKLogUtils.debugLog("DeviceListManager", "Discovery: MSearch Device is NOT a candidate for processing. UDN: " + paramDevice.getUDN());
    }
  }
  
  public void deviceDiscovered(DeviceInformation paramDeviceInformation, String paramString)
  {
    synchronized (this.mutex)
    {
      SDKLogUtils.debugLog("DeviceListManager", "Unicast Discovery: Device Discovered Via Unicast: " + paramDeviceInformation.getUDN());
      UnicastDeviceDiscoveredRunnable localUnicastDeviceDiscoveredRunnable = new UnicastDeviceDiscoveredRunnable(cacheManager, this.devicesArray, this, paramDeviceInformation, this.mControlPoint, paramString, this.mSharePreference, context, this.mActivity);
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localUnicastDeviceDiscoveredRunnable);
      return;
    }
  }
  
  public void deviceNotDiscovered(String paramString1, String paramString2, int paramInt)
  {
    SDKLogUtils.errorLog("DeviceListManager", "Unicast Discovery: Device NOT Discovered. UDN: " + paramString1 + "; IP: " + paramString2 + "; PORT: " + paramInt);
    getSmartDiscovery().onDeviceUnicastFailed(paramString1);
    DeviceInformation localDeviceInformation = cacheManager.getFullDeviceInfoFromDBByUDN(paramString1);
    String str;
    int i;
    if (localDeviceInformation != null)
    {
      str = localDeviceInformation.getIP();
      i = localDeviceInformation.getPort();
      if ((TextUtils.isEmpty(str)) || (!str.equalsIgnoreCase(paramString2)) || (i != paramInt)) {
        break label198;
      }
      localDeviceInformation.setInActive(1);
      localDeviceInformation.setIsDiscovered(false);
      this.devicesArray.setDeviceDiscovered(paramString1, false);
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      sendNotification("update", "", paramString1);
      sendNotificationAboutDiscoveryStateChange(paramString1, "Discovery TimeOut");
      if (IsDevice.Bridge(paramString1)) {
        onBridgeNotDiscovered(paramString1);
      }
      cacheManager.updateDB(localDeviceInformation, true, true, true);
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
      }
    }
    return;
    label198:
    SDKLogUtils.errorLog("DeviceListManager", "Unicast Discovery: Device NOT Discovered. IP/PORT have changed. OLD IP: " + str + "; OLD PORT: " + i);
  }
  
  public void deviceRemoved(Device paramDevice)
  {
    if (paramDevice != null)
    {
      String str = paramDevice.getUDN();
      SDKLogUtils.infoLog("DeviceListManager", " deviceRemoved notification for " + str);
      printFwUpgradeInProgressMapIfDebug();
      if (!this.mNetworkUtils.isPluginConnected())
      {
        if (!this.fwUpdateInProgressDataMap.containsKey(str)) {
          break label87;
        }
        SDKLogUtils.infoLog("DeviceListManager", "FW Update: Device NOT Removed as BYE BYE packet received after possible FW upgrade: " + str);
      }
    }
    return;
    label87:
    removeDeviceByUDN(paramDevice.getUDN());
  }
  
  public boolean didUnicastFailForAnyDevice()
  {
    return getSmartDiscovery().didUnicastFailForAnyDevice();
  }
  
  public void disableCacheStat(boolean paramBoolean)
  {
    cacheManager.setDisableStat(paramBoolean);
  }
  
  public void enableForcedRemote()
  {
    getSmartDiscovery().setForcedRemoteEnabled(true);
    NetworkMode.setLocal(false);
    sendNotification("set_remote", String.valueOf(getSmartDiscovery().isForcedRemoteEnabled()), "");
    SDKLogUtils.infoLog("DeviceListManager", "Enabling Forced Remote Feature. getSmartDiscovery().isForcedRemoteEnabled(): " + getSmartDiscovery().isForcedRemoteEnabled());
    initCache();
    new Thread(new Runnable()
    {
      public void run()
      {
        DeviceListManager.this.makeCloudRequestForUpdateDeviceList();
      }
    }).start();
    stopCloudPeriodicUpdate();
    startCloudPeriodicUpdate();
    if (this.mControlPoint != null)
    {
      SDKLogUtils.infoLog("DeviceListManager", "Stopping ControlPoint. ");
      this.mControlPoint.stop();
      this.mControlPoint = null;
    }
  }
  
  /* Error */
  public void eventNotifyReceived(String paramString1, String paramString2, long paramLong, String paramString3, String paramString4)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore 7
    //   3: ldc 115
    //   5: new 270	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   12: ldc_w 1997
    //   15: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   18: aload 5
    //   20: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: ldc_w 1999
    //   26: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_1
    //   30: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: ldc_w 2001
    //   36: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload 6
    //   41: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: ldc_w 2003
    //   47: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: aload_2
    //   51: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   57: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   60: aload 5
    //   62: invokestatic 518	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   65: ifne +85 -> 150
    //   68: aload 5
    //   70: ldc_w 2005
    //   73: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   76: ifeq +121 -> 197
    //   79: aload_0
    //   80: aload_1
    //   81: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   84: astore 70
    //   86: aload 70
    //   88: ifnull +78 -> 166
    //   91: aload 70
    //   93: ldc_w 2005
    //   96: aload 6
    //   98: invokevirtual 2010	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   101: aload_0
    //   102: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   105: aload 70
    //   107: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   110: aload_0
    //   111: ldc 124
    //   113: aload_2
    //   114: aload 70
    //   116: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   119: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   122: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   125: aload 70
    //   127: iconst_0
    //   128: iconst_0
    //   129: iconst_1
    //   130: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   133: iload 7
    //   135: ifne +15 -> 150
    //   138: ldc 115
    //   140: ldc_w 2012
    //   143: invokestatic 969	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   146: aload_0
    //   147: invokevirtual 1111	com/belkin/wemo/cache/devicelist/DeviceListManager:startUnicastDiscovery	()V
    //   150: return
    //   151: astore 71
    //   153: ldc 115
    //   155: ldc_w 2014
    //   158: aload 71
    //   160: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   163: goto -62 -> 101
    //   166: ldc 115
    //   168: new 270	java/lang/StringBuilder
    //   171: dup
    //   172: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   175: ldc_w 2016
    //   178: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: aload_1
    //   182: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   188: invokestatic 969	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   191: iconst_0
    //   192: istore 7
    //   194: goto -61 -> 133
    //   197: aload 5
    //   199: ldc_w 2018
    //   202: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   205: ifne +25 -> 230
    //   208: aload 5
    //   210: ldc_w 2020
    //   213: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   216: ifne +14 -> 230
    //   219: aload 5
    //   221: ldc_w 2022
    //   224: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   227: ifeq +436 -> 663
    //   230: aload_0
    //   231: aload_1
    //   232: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   235: astore 8
    //   237: aload 8
    //   239: ifnull +393 -> 632
    //   242: aload 5
    //   244: ldc_w 2018
    //   247: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   250: ifeq +197 -> 447
    //   253: aload 8
    //   255: aload 6
    //   257: invokevirtual 2025	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   260: aload 8
    //   262: ldc_w 902
    //   265: aload 6
    //   267: ldc_w 2027
    //   270: invokevirtual 1662	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   273: iconst_0
    //   274: aaload
    //   275: invokevirtual 2010	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   278: aload 8
    //   280: aload 6
    //   282: ldc_w 2027
    //   285: invokevirtual 1662	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   288: iconst_0
    //   289: aaload
    //   290: invokestatic 827	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   293: invokevirtual 830	java/lang/Integer:intValue	()I
    //   296: invokevirtual 1263	com/belkin/wemo/cache/data/DeviceInformation:setState	(I)V
    //   299: aload_0
    //   300: ldc -123
    //   302: aload_2
    //   303: aload 8
    //   305: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   308: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   311: aload 5
    //   313: ldc_w 2022
    //   316: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   319: ifne +249 -> 568
    //   322: aload 8
    //   324: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   327: astore 10
    //   329: aload_0
    //   330: getfield 386	com/belkin/wemo/cache/devicelist/DeviceListManager:binaryStateRequestTrackerMap	Ljava/util/Map;
    //   333: aload 10
    //   335: invokeinterface 742 2 0
    //   340: checkcast 2029	com/belkin/wemo/cache/devicelist/DeviceRequestTracker
    //   343: astore 11
    //   345: aload 11
    //   347: ifnull +186 -> 533
    //   350: aload 11
    //   352: invokevirtual 2032	com/belkin/wemo/cache/devicelist/DeviceRequestTracker:isRequestNotificationPending	()Z
    //   355: ifne +170 -> 525
    //   358: aload_0
    //   359: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   362: aload 8
    //   364: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   367: aload_0
    //   368: ldc 28
    //   370: aload_2
    //   371: aload 8
    //   373: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   376: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   379: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   382: aload 8
    //   384: iconst_0
    //   385: iconst_0
    //   386: iconst_1
    //   387: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   390: goto -257 -> 133
    //   393: astore 14
    //   395: ldc 115
    //   397: new 270	java/lang/StringBuilder
    //   400: dup
    //   401: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   404: ldc_w 2034
    //   407: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   410: aload 6
    //   412: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   415: ldc_w 2036
    //   418: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   421: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   424: aload 14
    //   426: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   429: goto -130 -> 299
    //   432: astore 13
    //   434: ldc 115
    //   436: ldc_w 2038
    //   439: aload 13
    //   441: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   444: goto -145 -> 299
    //   447: aload 5
    //   449: ldc_w 2020
    //   452: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   455: ifeq +31 -> 486
    //   458: aload 8
    //   460: ldc_w 2040
    //   463: aload 6
    //   465: invokevirtual 2010	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   468: goto -157 -> 311
    //   471: astore 12
    //   473: ldc 115
    //   475: ldc_w 2042
    //   478: aload 12
    //   480: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   483: goto -172 -> 311
    //   486: aload 5
    //   488: ldc_w 2022
    //   491: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   494: ifeq -183 -> 311
    //   497: aload 8
    //   499: ldc_w 1688
    //   502: aload 6
    //   504: invokevirtual 2010	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   507: goto -196 -> 311
    //   510: astore 9
    //   512: ldc 115
    //   514: ldc_w 2044
    //   517: aload 9
    //   519: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   522: goto -211 -> 311
    //   525: aload 11
    //   527: invokevirtual 2047	com/belkin/wemo/cache/devicelist/DeviceRequestTracker:onRequestNotificationReceived	()V
    //   530: goto -397 -> 133
    //   533: aload_0
    //   534: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   537: aload 8
    //   539: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   542: aload_0
    //   543: ldc 28
    //   545: aload_2
    //   546: aload 8
    //   548: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   551: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   554: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   557: aload 8
    //   559: iconst_0
    //   560: iconst_0
    //   561: iconst_1
    //   562: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   565: goto -432 -> 133
    //   568: ldc 115
    //   570: new 270	java/lang/StringBuilder
    //   573: dup
    //   574: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   577: ldc_w 2049
    //   580: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   583: aload 8
    //   585: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   588: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   591: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   594: invokestatic 969	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   597: aload_0
    //   598: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   601: aload 8
    //   603: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   606: aload_0
    //   607: ldc 28
    //   609: aload_2
    //   610: aload 8
    //   612: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   615: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   618: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   621: aload 8
    //   623: iconst_0
    //   624: iconst_0
    //   625: iconst_1
    //   626: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   629: goto -496 -> 133
    //   632: ldc 115
    //   634: new 270	java/lang/StringBuilder
    //   637: dup
    //   638: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   641: ldc_w 2016
    //   644: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   647: aload_1
    //   648: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   651: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   654: invokestatic 969	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   657: iconst_0
    //   658: istore 7
    //   660: goto -527 -> 133
    //   663: aload 5
    //   665: ldc_w 2051
    //   668: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   671: ifne +36 -> 707
    //   674: aload 5
    //   676: ldc_w 2053
    //   679: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   682: ifne +25 -> 707
    //   685: aload 5
    //   687: ldc_w 2055
    //   690: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   693: ifne +14 -> 707
    //   696: aload 5
    //   698: ldc_w 2056
    //   701: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   704: ifeq +105 -> 809
    //   707: aload_0
    //   708: aload_1
    //   709: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   712: astore 15
    //   714: aload 15
    //   716: ifnull +62 -> 778
    //   719: aload 15
    //   721: aload 5
    //   723: aload 6
    //   725: invokevirtual 2010	com/belkin/wemo/cache/data/DeviceInformation:setAttributeValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   728: aload_0
    //   729: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   732: aload 15
    //   734: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   737: aload_0
    //   738: ldc 124
    //   740: aload_2
    //   741: aload 15
    //   743: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   746: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   749: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   752: aload 15
    //   754: iconst_0
    //   755: iconst_0
    //   756: iconst_1
    //   757: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   760: goto -627 -> 133
    //   763: astore 16
    //   765: ldc 115
    //   767: ldc_w 2058
    //   770: aload 16
    //   772: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   775: goto -47 -> 728
    //   778: ldc 115
    //   780: new 270	java/lang/StringBuilder
    //   783: dup
    //   784: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   787: ldc_w 2060
    //   790: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   793: aload_1
    //   794: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   797: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   800: invokestatic 969	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   803: iconst_0
    //   804: istore 7
    //   806: goto -673 -> 133
    //   809: aload 5
    //   811: ldc_w 2062
    //   814: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   817: ifne +25 -> 842
    //   820: aload 5
    //   822: ldc_w 2064
    //   825: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   828: ifne +14 -> 842
    //   831: aload 5
    //   833: ldc_w 2066
    //   836: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   839: ifeq +138 -> 977
    //   842: aload_0
    //   843: aload_1
    //   844: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   847: astore 17
    //   849: aload 17
    //   851: ifnull +95 -> 946
    //   854: aload 17
    //   856: invokevirtual 987	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   859: astore 18
    //   861: aload 18
    //   863: aload 5
    //   865: invokevirtual 2068	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   868: checkcast 658	org/json/JSONObject
    //   871: astore 20
    //   873: aload 20
    //   875: ldc_w 1254
    //   878: aload 6
    //   880: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   883: pop
    //   884: aload 18
    //   886: aload 5
    //   888: aload 20
    //   890: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   893: pop
    //   894: aload 17
    //   896: aload 18
    //   898: invokevirtual 2071	com/belkin/wemo/cache/data/DeviceInformation:setAttributeList	(Lorg/json/JSONObject;)V
    //   901: aload_0
    //   902: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   905: aload 17
    //   907: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   910: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   913: aload 17
    //   915: iconst_0
    //   916: iconst_0
    //   917: iconst_1
    //   918: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   921: aload_0
    //   922: ldc 28
    //   924: aload_2
    //   925: aload 17
    //   927: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   930: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   933: goto -800 -> 133
    //   936: astore 19
    //   938: aload 19
    //   940: invokevirtual 906	org/json/JSONException:printStackTrace	()V
    //   943: goto -49 -> 894
    //   946: ldc 115
    //   948: new 270	java/lang/StringBuilder
    //   951: dup
    //   952: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   955: ldc_w 2060
    //   958: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   961: aload_1
    //   962: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   965: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   968: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   971: iconst_0
    //   972: istore 7
    //   974: goto -841 -> 133
    //   977: aload 5
    //   979: ldc_w 2073
    //   982: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   985: ifne +14 -> 999
    //   988: aload 5
    //   990: ldc_w 2075
    //   993: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   996: ifeq +651 -> 1647
    //   999: aload_0
    //   1000: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   1003: aload_2
    //   1004: invokevirtual 1332	com/belkin/wemo/cache/data/DevicesArray:getDeviceInformation	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   1007: astore 23
    //   1009: aload 23
    //   1011: ifnull +400 -> 1411
    //   1014: ldc 115
    //   1016: new 270	java/lang/StringBuilder
    //   1019: dup
    //   1020: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1023: ldc_w 2077
    //   1026: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1029: aload 23
    //   1031: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1034: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1037: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1040: aload_0
    //   1041: aload 23
    //   1043: invokevirtual 2081	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceCapabilities	(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    //   1046: astore 33
    //   1048: aload 33
    //   1050: invokevirtual 541	java/lang/String:isEmpty	()Z
    //   1053: ifne +347 -> 1400
    //   1056: aload 6
    //   1058: invokestatic 518	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1061: ifne +339 -> 1400
    //   1064: new 658	org/json/JSONObject
    //   1067: dup
    //   1068: aload 33
    //   1070: invokespecial 1244	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   1073: astore 34
    //   1075: ldc 115
    //   1077: new 270	java/lang/StringBuilder
    //   1080: dup
    //   1081: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1084: ldc_w 2083
    //   1087: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1090: aload 34
    //   1092: invokevirtual 905	org/json/JSONObject:toString	()Ljava/lang/String;
    //   1095: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1098: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1101: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1104: aload 6
    //   1106: ldc_w 2085
    //   1109: invokevirtual 1662	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1112: astore 36
    //   1114: aload 36
    //   1116: arraylength
    //   1117: ifeq -984 -> 133
    //   1120: aload 36
    //   1122: iconst_2
    //   1123: aaload
    //   1124: astore 37
    //   1126: aload 37
    //   1128: ldc_w 2087
    //   1131: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1134: ifeq +200 -> 1334
    //   1137: ldc 115
    //   1139: ldc_w 2089
    //   1142: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1145: getstatic 221	com/belkin/wemo/cache/devicelist/DeviceListManager:capabalityProfileList	Ljava/util/LinkedHashMap;
    //   1148: ifnull +12 -> 1160
    //   1151: getstatic 221	com/belkin/wemo/cache/devicelist/DeviceListManager:capabalityProfileList	Ljava/util/LinkedHashMap;
    //   1154: invokevirtual 2090	java/util/LinkedHashMap:isEmpty	()Z
    //   1157: ifeq +6 -> 1163
    //   1160: invokestatic 413	com/belkin/wemo/cache/devicelist/DeviceListManager:updateCapabilityProfileTable	()V
    //   1163: getstatic 221	com/belkin/wemo/cache/devicelist/DeviceListManager:capabalityProfileList	Ljava/util/LinkedHashMap;
    //   1166: aload 36
    //   1168: iconst_1
    //   1169: aaload
    //   1170: invokevirtual 2091	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   1173: checkcast 539	java/lang/String
    //   1176: astore 38
    //   1178: aload 34
    //   1180: aload 38
    //   1182: aload 36
    //   1184: iconst_0
    //   1185: aaload
    //   1186: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1189: pop
    //   1190: ldc 115
    //   1192: new 270	java/lang/StringBuilder
    //   1195: dup
    //   1196: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1199: ldc_w 2093
    //   1202: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1205: aload 38
    //   1207: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1210: ldc_w 2095
    //   1213: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1216: aload 36
    //   1218: iconst_0
    //   1219: aaload
    //   1220: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1223: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1226: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1229: aload 23
    //   1231: aload 34
    //   1233: invokevirtual 905	org/json/JSONObject:toString	()Ljava/lang/String;
    //   1236: invokevirtual 2098	com/belkin/wemo/cache/data/DeviceInformation:setCapabilities	(Ljava/lang/String;)V
    //   1239: aload 36
    //   1241: arraylength
    //   1242: istore 40
    //   1244: iload 40
    //   1246: iconst_3
    //   1247: if_icmple +15 -> 1262
    //   1250: aload 23
    //   1252: aload 36
    //   1254: iconst_3
    //   1255: aaload
    //   1256: invokestatic 1260	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   1259: invokevirtual 2101	com/belkin/wemo/cache/data/DeviceInformation:setStatusTS	(I)V
    //   1262: aload 23
    //   1264: iconst_1
    //   1265: invokevirtual 526	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   1268: aload 23
    //   1270: iconst_0
    //   1271: invokevirtual 530	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   1274: aload_0
    //   1275: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   1278: aload 23
    //   1280: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   1283: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   1286: aload 23
    //   1288: iconst_0
    //   1289: iconst_0
    //   1290: iconst_1
    //   1291: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   1294: aload_0
    //   1295: ldc 28
    //   1297: aload_2
    //   1298: aload 23
    //   1300: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1303: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1306: goto -1173 -> 133
    //   1309: astore 35
    //   1311: aload 35
    //   1313: invokevirtual 906	org/json/JSONException:printStackTrace	()V
    //   1316: goto -1183 -> 133
    //   1319: astore 41
    //   1321: ldc 115
    //   1323: ldc_w 2103
    //   1326: aload 41
    //   1328: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   1331: goto -69 -> 1262
    //   1334: aload 37
    //   1336: ldc_w 2105
    //   1339: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1342: ifeq -1209 -> 133
    //   1345: ldc 115
    //   1347: ldc_w 2107
    //   1350: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1353: aload 23
    //   1355: iconst_0
    //   1356: invokevirtual 526	com/belkin/wemo/cache/data/DeviceInformation:setIsDiscovered	(Z)V
    //   1359: aload 23
    //   1361: iconst_1
    //   1362: invokevirtual 530	com/belkin/wemo/cache/data/DeviceInformation:setInActive	(I)V
    //   1365: aload_0
    //   1366: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   1369: aload 23
    //   1371: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   1374: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   1377: aload 23
    //   1379: iconst_0
    //   1380: iconst_0
    //   1381: iconst_1
    //   1382: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   1385: aload_0
    //   1386: ldc 124
    //   1388: aload_2
    //   1389: aload 23
    //   1391: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1394: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1397: goto -1264 -> 133
    //   1400: ldc 115
    //   1402: ldc_w 2109
    //   1405: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1408: goto -1275 -> 133
    //   1411: ldc 115
    //   1413: new 270	java/lang/StringBuilder
    //   1416: dup
    //   1417: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1420: ldc_w 2111
    //   1423: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1426: aload_2
    //   1427: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1430: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1433: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1436: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   1439: aload_2
    //   1440: invokevirtual 2115	com/belkin/wemo/cache/CacheManager:getDevicesForGroup	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   1443: astore 24
    //   1445: ldc 115
    //   1447: new 270	java/lang/StringBuilder
    //   1450: dup
    //   1451: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1454: ldc_w 2117
    //   1457: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1460: aload 24
    //   1462: invokevirtual 2118	java/util/ArrayList:size	()I
    //   1465: invokevirtual 284	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1468: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1471: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1474: aload 24
    //   1476: invokevirtual 2118	java/util/ArrayList:size	()I
    //   1479: ifle -1346 -> 133
    //   1482: aload 6
    //   1484: ldc_w 2085
    //   1487: invokevirtual 1662	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1490: astore 25
    //   1492: aload 24
    //   1494: invokevirtual 780	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   1497: astore 26
    //   1499: aload 26
    //   1501: invokeinterface 785 1 0
    //   1506: ifeq +64 -> 1570
    //   1509: aload 26
    //   1511: invokeinterface 789 1 0
    //   1516: checkcast 479	com/belkin/wemo/cache/data/DeviceInformation
    //   1519: astore 32
    //   1521: aload_0
    //   1522: aload 32
    //   1524: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1527: aload 25
    //   1529: iconst_1
    //   1530: aaload
    //   1531: aload 25
    //   1533: iconst_0
    //   1534: aaload
    //   1535: invokevirtual 2121	com/belkin/wemo/cache/devicelist/DeviceListManager:updateZigbeeCapability	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1538: ldc 115
    //   1540: new 270	java/lang/StringBuilder
    //   1543: dup
    //   1544: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1547: ldc_w 2123
    //   1550: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1553: aload 32
    //   1555: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1558: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1561: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1564: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1567: goto -68 -> 1499
    //   1570: new 658	org/json/JSONObject
    //   1573: dup
    //   1574: invokespecial 889	org/json/JSONObject:<init>	()V
    //   1577: astore 27
    //   1579: aload 27
    //   1581: getstatic 221	com/belkin/wemo/cache/devicelist/DeviceListManager:capabalityProfileList	Ljava/util/LinkedHashMap;
    //   1584: aload 25
    //   1586: iconst_1
    //   1587: aaload
    //   1588: invokevirtual 2091	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   1591: checkcast 539	java/lang/String
    //   1594: aload 25
    //   1596: iconst_0
    //   1597: aaload
    //   1598: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1601: pop
    //   1602: new 658	org/json/JSONObject
    //   1605: dup
    //   1606: invokespecial 889	org/json/JSONObject:<init>	()V
    //   1609: astore 30
    //   1611: aload 30
    //   1613: ldc_w 1555
    //   1616: aload 27
    //   1618: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1621: pop
    //   1622: aload_0
    //   1623: ldc -126
    //   1625: aload 30
    //   1627: invokevirtual 905	org/json/JSONObject:toString	()Ljava/lang/String;
    //   1630: aload_2
    //   1631: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1634: goto -1501 -> 133
    //   1637: astore 28
    //   1639: aload 28
    //   1641: invokevirtual 906	org/json/JSONException:printStackTrace	()V
    //   1644: goto -1511 -> 133
    //   1647: aload 5
    //   1649: ldc_w 2125
    //   1652: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1655: ifeq +243 -> 1898
    //   1658: aload_0
    //   1659: aload_1
    //   1660: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   1663: astore 62
    //   1665: aload 62
    //   1667: ifnull +200 -> 1867
    //   1670: ldc 115
    //   1672: new 270	java/lang/StringBuilder
    //   1675: dup
    //   1676: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1679: ldc_w 2077
    //   1682: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1685: aload 62
    //   1687: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1690: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1693: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1696: aload 62
    //   1698: invokevirtual 987	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   1701: astore 63
    //   1703: new 2127	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser
    //   1706: dup
    //   1707: invokespecial 2128	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:<init>	()V
    //   1710: aload 6
    //   1712: invokevirtual 2131	com/belkin/wemo/localsdk/parser/GetAttributeResponseParser:parseGetAttributeResponse	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   1715: astore 66
    //   1717: ldc 115
    //   1719: new 270	java/lang/StringBuilder
    //   1722: dup
    //   1723: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1726: ldc_w 2133
    //   1729: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1732: aload 66
    //   1734: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1737: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1740: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1743: aload 66
    //   1745: ifnull -1612 -> 133
    //   1748: aload 66
    //   1750: invokevirtual 1282	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   1753: astore 67
    //   1755: aload 67
    //   1757: invokeinterface 785 1 0
    //   1762: ifeq +53 -> 1815
    //   1765: aload 67
    //   1767: invokeinterface 789 1 0
    //   1772: checkcast 539	java/lang/String
    //   1775: astore 68
    //   1777: aload 63
    //   1779: aload 68
    //   1781: invokevirtual 1285	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   1784: ifeq -29 -> 1755
    //   1787: aload 63
    //   1789: aload 68
    //   1791: aload 66
    //   1793: aload 68
    //   1795: invokevirtual 2068	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   1798: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1801: pop
    //   1802: goto -47 -> 1755
    //   1805: astore 65
    //   1807: aload 65
    //   1809: invokevirtual 906	org/json/JSONException:printStackTrace	()V
    //   1812: goto -1679 -> 133
    //   1815: aload 62
    //   1817: aload 63
    //   1819: invokevirtual 2071	com/belkin/wemo/cache/data/DeviceInformation:setAttributeList	(Lorg/json/JSONObject;)V
    //   1822: aload_0
    //   1823: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   1826: aload 62
    //   1828: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   1831: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   1834: aload 62
    //   1836: iconst_0
    //   1837: iconst_0
    //   1838: iconst_1
    //   1839: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   1842: aload_0
    //   1843: ldc 28
    //   1845: aload_2
    //   1846: aload 62
    //   1848: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1851: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1854: goto -1721 -> 133
    //   1857: astore 64
    //   1859: aload 64
    //   1861: invokevirtual 477	java/lang/Exception:printStackTrace	()V
    //   1864: goto -1731 -> 133
    //   1867: ldc 115
    //   1869: new 270	java/lang/StringBuilder
    //   1872: dup
    //   1873: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1876: ldc_w 2060
    //   1879: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1882: aload_1
    //   1883: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1886: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1889: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1892: iconst_0
    //   1893: istore 7
    //   1895: goto -1762 -> 133
    //   1898: aload 5
    //   1900: ldc_w 2135
    //   1903: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1906: ifeq +300 -> 2206
    //   1909: ldc 115
    //   1911: ldc_w 2137
    //   1914: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1917: aload_0
    //   1918: aload_1
    //   1919: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   1922: astore 55
    //   1924: aload 55
    //   1926: ifnull +252 -> 2178
    //   1929: aload 55
    //   1931: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1934: astore 56
    //   1936: ldc 115
    //   1938: new 270	java/lang/StringBuilder
    //   1941: dup
    //   1942: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   1945: ldc_w 2139
    //   1948: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1951: aload 56
    //   1953: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1956: ldc_w 2141
    //   1959: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1962: aload 6
    //   1964: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1967: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1970: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1973: aload_0
    //   1974: getfield 421	com/belkin/wemo/cache/devicelist/DeviceListManager:fwUpdateInProgressDataMap	Ljava/util/Map;
    //   1977: aload 56
    //   1979: invokeinterface 742 2 0
    //   1984: checkcast 2143	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData
    //   1987: astore 57
    //   1989: aload 6
    //   1991: ldc_w 2145
    //   1994: invokevirtual 627	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1997: ifeq +53 -> 2050
    //   2000: aload 57
    //   2002: ifnonnull +48 -> 2050
    //   2005: ldc 115
    //   2007: ldc_w 2147
    //   2010: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2013: ldc 115
    //   2015: ldc_w 2149
    //   2018: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2021: aload_0
    //   2022: invokevirtual 429	com/belkin/wemo/cache/devicelist/DeviceListManager:printFwUpgradeInProgressMapIfDebug	()V
    //   2025: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   2028: aload 55
    //   2030: iconst_1
    //   2031: iconst_0
    //   2032: iconst_1
    //   2033: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   2036: aload_0
    //   2037: ldc_w 2135
    //   2040: aload 6
    //   2042: aload 56
    //   2044: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2047: goto -1914 -> 133
    //   2050: aload 57
    //   2052: ifnonnull +84 -> 2136
    //   2055: new 2143	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData
    //   2058: dup
    //   2059: invokespecial 2150	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData:<init>	()V
    //   2062: astore 57
    //   2064: aload 57
    //   2066: aload 56
    //   2068: invokevirtual 2153	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData:setUdn	(Ljava/lang/String;)V
    //   2071: aload 55
    //   2073: invokevirtual 990	com/belkin/wemo/cache/data/DeviceInformation:getFirmwareVersion	()Ljava/lang/String;
    //   2076: astore 58
    //   2078: aload 57
    //   2080: aload 58
    //   2082: invokevirtual 2156	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData:setOldFwVersion	(Ljava/lang/String;)V
    //   2085: ldc 115
    //   2087: new 270	java/lang/StringBuilder
    //   2090: dup
    //   2091: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   2094: ldc_w 2158
    //   2097: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2100: aload 56
    //   2102: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2105: ldc_w 2160
    //   2108: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2111: aload 58
    //   2113: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2116: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2119: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2122: aload_0
    //   2123: getfield 421	com/belkin/wemo/cache/devicelist/DeviceListManager:fwUpdateInProgressDataMap	Ljava/util/Map;
    //   2126: aload 56
    //   2128: aload 57
    //   2130: invokeinterface 697 3 0
    //   2135: pop
    //   2136: invokestatic 2165	java/lang/System:currentTimeMillis	()J
    //   2139: lstore 60
    //   2141: aload 6
    //   2143: ldc_w 1298
    //   2146: invokevirtual 627	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   2149: ifeq +12 -> 2161
    //   2152: ldc 115
    //   2154: ldc_w 2167
    //   2157: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2160: return
    //   2161: aload 57
    //   2163: lload 60
    //   2165: invokevirtual 2170	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData:setStatusTS	(J)V
    //   2168: aload 57
    //   2170: aload 6
    //   2172: invokevirtual 2173	com/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData:setFwStatus	(Ljava/lang/String;)V
    //   2175: goto -162 -> 2013
    //   2178: ldc 115
    //   2180: new 270	java/lang/StringBuilder
    //   2183: dup
    //   2184: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   2187: ldc_w 2060
    //   2190: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2193: aload_1
    //   2194: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2197: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2200: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2203: goto -2070 -> 133
    //   2206: aload 5
    //   2208: ldc 22
    //   2210: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2213: ifeq +80 -> 2293
    //   2216: aload_2
    //   2217: ldc_w 2085
    //   2220: invokevirtual 1662	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2223: astore 52
    //   2225: aload 52
    //   2227: ifnull -2094 -> 133
    //   2230: aload 52
    //   2232: arraylength
    //   2233: iconst_1
    //   2234: if_icmplt -2101 -> 133
    //   2237: aload 52
    //   2239: iconst_1
    //   2240: aaload
    //   2241: ldc_w 2175
    //   2244: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2247: ifeq -2114 -> 133
    //   2250: aload 52
    //   2252: iconst_0
    //   2253: aaload
    //   2254: astore 53
    //   2256: aload_0
    //   2257: ldc 22
    //   2259: aload 6
    //   2261: aload 53
    //   2263: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2266: aload_0
    //   2267: aload 53
    //   2269: invokespecial 2007	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInfoBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   2272: astore 54
    //   2274: aload 54
    //   2276: ifnull -2143 -> 133
    //   2279: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   2282: aload 54
    //   2284: iconst_1
    //   2285: iconst_0
    //   2286: iconst_1
    //   2287: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   2290: goto -2157 -> 133
    //   2293: aload 5
    //   2295: ldc_w 2177
    //   2298: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2301: ifeq -2168 -> 133
    //   2304: aload_0
    //   2305: aload_1
    //   2306: invokevirtual 813	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformationBySID	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   2309: astore 42
    //   2311: aload 42
    //   2313: ifnull +161 -> 2474
    //   2316: new 658	org/json/JSONObject
    //   2319: dup
    //   2320: invokespecial 889	org/json/JSONObject:<init>	()V
    //   2323: astore 43
    //   2325: new 658	org/json/JSONObject
    //   2328: dup
    //   2329: invokespecial 889	org/json/JSONObject:<init>	()V
    //   2332: astore 44
    //   2334: aload 42
    //   2336: invokevirtual 987	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   2339: astore 45
    //   2341: aload 43
    //   2343: ldc_w 1254
    //   2346: aload 6
    //   2348: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   2351: pop
    //   2352: aload 43
    //   2354: ldc_w 1252
    //   2357: ldc_w 2179
    //   2360: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   2363: pop
    //   2364: aload 45
    //   2366: ldc_w 2179
    //   2369: aload 43
    //   2371: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   2374: pop
    //   2375: aload 42
    //   2377: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   2380: invokestatic 1648	com/belkin/wemo/cache/utils/IsDevice:Insight	(Ljava/lang/String;)Z
    //   2383: ifeq +34 -> 2417
    //   2386: aload 44
    //   2388: ldc_w 1254
    //   2391: ldc_w 1298
    //   2394: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   2397: pop
    //   2398: aload 45
    //   2400: ldc_w 902
    //   2403: aload 44
    //   2405: invokevirtual 894	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   2408: pop
    //   2409: aload 42
    //   2411: ldc_w 1298
    //   2414: invokevirtual 2025	com/belkin/wemo/cache/data/DeviceInformation:setBinaryState	(Ljava/lang/String;)V
    //   2417: aload 42
    //   2419: aload 45
    //   2421: invokevirtual 2071	com/belkin/wemo/cache/data/DeviceInformation:setAttributeList	(Lorg/json/JSONObject;)V
    //   2424: aload_0
    //   2425: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   2428: aload 42
    //   2430: invokevirtual 1019	com/belkin/wemo/cache/data/DevicesArray:addOrUpdateDeviceInformation	(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    //   2433: getstatic 215	com/belkin/wemo/cache/devicelist/DeviceListManager:cacheManager	Lcom/belkin/wemo/cache/CacheManager;
    //   2436: aload 42
    //   2438: iconst_0
    //   2439: iconst_0
    //   2440: iconst_1
    //   2441: invokevirtual 584	com/belkin/wemo/cache/CacheManager:updateDB	(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    //   2444: aload_0
    //   2445: ldc 124
    //   2447: aload_2
    //   2448: aload 42
    //   2450: invokevirtual 488	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   2453: invokevirtual 590	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2456: goto -2323 -> 133
    //   2459: astore 46
    //   2461: ldc 115
    //   2463: ldc_w 2181
    //   2466: aload 46
    //   2468: invokestatic 1154	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   2471: goto -54 -> 2417
    //   2474: ldc 115
    //   2476: new 270	java/lang/StringBuilder
    //   2479: dup
    //   2480: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   2483: ldc_w 2060
    //   2486: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2489: aload_1
    //   2490: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2493: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2496: invokestatic 295	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2499: iconst_0
    //   2500: istore 7
    //   2502: goto -2369 -> 133
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	2505	0	this	DeviceListManager
    //   0	2505	1	paramString1	String
    //   0	2505	2	paramString2	String
    //   0	2505	3	paramLong	long
    //   0	2505	5	paramString3	String
    //   0	2505	6	paramString4	String
    //   1	2500	7	i	int
    //   235	387	8	localDeviceInformation1	DeviceInformation
    //   510	8	9	localJSONException1	JSONException
    //   327	7	10	str1	String
    //   343	183	11	localDeviceRequestTracker	DeviceRequestTracker
    //   471	8	12	localJSONException2	JSONException
    //   432	8	13	localJSONException3	JSONException
    //   393	32	14	localNumberFormatException1	NumberFormatException
    //   712	41	15	localDeviceInformation2	DeviceInformation
    //   763	8	16	localJSONException4	JSONException
    //   847	79	17	localDeviceInformation3	DeviceInformation
    //   859	38	18	localJSONObject1	JSONObject
    //   936	3	19	localJSONException5	JSONException
    //   871	18	20	localJSONObject2	JSONObject
    //   1007	383	23	localDeviceInformation4	DeviceInformation
    //   1443	50	24	localArrayList	ArrayList
    //   1490	105	25	arrayOfString1	String[]
    //   1497	13	26	localIterator1	Iterator
    //   1577	40	27	localJSONObject3	JSONObject
    //   1637	3	28	localJSONException6	JSONException
    //   1609	17	30	localJSONObject4	JSONObject
    //   1519	35	32	localDeviceInformation5	DeviceInformation
    //   1046	23	33	str2	String
    //   1073	159	34	localJSONObject5	JSONObject
    //   1309	3	35	localJSONException7	JSONException
    //   1112	141	36	arrayOfString2	String[]
    //   1124	211	37	str3	String
    //   1176	30	38	str4	String
    //   1242	6	40	j	int
    //   1319	8	41	localNumberFormatException2	NumberFormatException
    //   2309	140	42	localDeviceInformation6	DeviceInformation
    //   2323	47	43	localJSONObject6	JSONObject
    //   2332	72	44	localJSONObject7	JSONObject
    //   2339	81	45	localJSONObject8	JSONObject
    //   2459	8	46	localJSONException8	JSONException
    //   2223	28	52	arrayOfString3	String[]
    //   2254	14	53	str5	String
    //   2272	11	54	localDeviceInformation7	DeviceInformation
    //   1922	150	55	localDeviceInformation8	DeviceInformation
    //   1934	193	56	str6	String
    //   1987	182	57	localFirmwareUpdateData	FirmwareUpdateData
    //   2076	36	58	str7	String
    //   2139	25	60	l	long
    //   1663	184	62	localDeviceInformation9	DeviceInformation
    //   1701	117	63	localJSONObject9	JSONObject
    //   1857	3	64	localException	Exception
    //   1805	3	65	localJSONException9	JSONException
    //   1715	77	66	localJSONObject10	JSONObject
    //   1753	13	67	localIterator2	Iterator
    //   1775	19	68	str8	String
    //   84	42	70	localDeviceInformation10	DeviceInformation
    //   151	8	71	localJSONException10	JSONException
    // Exception table:
    //   from	to	target	type
    //   91	101	151	org/json/JSONException
    //   260	299	393	java/lang/NumberFormatException
    //   260	299	432	org/json/JSONException
    //   458	468	471	org/json/JSONException
    //   497	507	510	org/json/JSONException
    //   719	728	763	org/json/JSONException
    //   861	894	936	org/json/JSONException
    //   1064	1160	1309	org/json/JSONException
    //   1160	1163	1309	org/json/JSONException
    //   1163	1244	1309	org/json/JSONException
    //   1250	1262	1309	org/json/JSONException
    //   1262	1306	1309	org/json/JSONException
    //   1321	1331	1309	org/json/JSONException
    //   1334	1397	1309	org/json/JSONException
    //   1250	1262	1319	java/lang/NumberFormatException
    //   1579	1634	1637	org/json/JSONException
    //   1703	1743	1805	org/json/JSONException
    //   1748	1755	1805	org/json/JSONException
    //   1755	1802	1805	org/json/JSONException
    //   1815	1854	1805	org/json/JSONException
    //   1703	1743	1857	java/lang/Exception
    //   1748	1755	1857	java/lang/Exception
    //   1755	1802	1857	java/lang/Exception
    //   1815	1854	1857	java/lang/Exception
    //   2341	2417	2459	org/json/JSONException
  }
  
  public void fetchSensorEventHistory(SetAndGetActionCallBack paramSetAndGetActionCallBack, JSONArray paramJSONArray)
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: fetchSensorEventHistory :: is called");
    new CloudRequestManager(context).makeRequest(new CloudRequestForSensorEvent(context, paramSetAndGetActionCallBack, paramJSONArray));
  }
  
  public JSONArray fetchSensorEventHistoryFromDB()
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: fetchSensorEventHistoryFromDB :: is called");
    return cacheManager.getSenosrEventsFromDB();
  }
  
  public JSONArray findLedBulb(String paramString)
  {
    Object localObject = new JSONArray();
    for (;;)
    {
      int i;
      try
      {
        ControlPoint localControlPoint = getUpnpControl();
        String str1 = "";
        if (localControlPoint != null)
        {
          i = 0;
          if (i < localControlPoint.getDeviceList().size())
          {
            if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
              str1 = localControlPoint.getDeviceList().getDevice(i).getUDN();
            }
          }
          else {
            SDKLogUtils.debugLog("DeviceListManager", "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + str1);
          }
        }
        else
        {
          if ((str1 != null) && (str1.length() != 0))
          {
            Action localAction = localControlPoint.getDevice(str1).getAction("IdentifyDevice");
            setArgument(localAction, UpnpConstants.ARGS_DEVICEID, new String[] { paramString });
            String str2 = localAction.postControlAction();
            SDKLogUtils.debugLog("DeviceListManager", "FIND BULB RESPOMSE: " + str2);
            if (str2 != null)
            {
              JSONArray localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str2);
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
  
  public File generateEditedIconFile()
  {
    try
    {
      File localFile = FileStorage.getInstance(context).getEditedIconFile();
      return localFile;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public ArrayList<DeviceInformation> getActiveDeviceInfoList()
  {
    return this.devicesArray.getActiveDeviceInfoList();
  }
  
  public String getAvgDiscoverySpeedByUDN(String paramString, boolean paramBoolean)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    String str;
    for (boolean bool = true;; bool = false)
    {
      int i = localCacheManager.getAvgDiscoveryTime(paramString, bool, paramBoolean);
      int j = i / 1000;
      str = String.valueOf(i % 1000);
      if (str.length() > 3) {
        str = str.substring(0, 2);
      }
      if (j <= 0) {
        break;
      }
      return j + ":" + str;
    }
    return "0:" + str;
  }
  
  public Map<String, DeviceRequestTracker> getBinaryStateRequestTrackerMap()
  {
    return this.binaryStateRequestTrackerMap;
  }
  
  public boolean getBlobStorage(String paramString, JSONObject paramJSONObject)
  {
    boolean bool = false;
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
      return false;
    }
    try
    {
      if (NetworkMode.isLocal())
      {
        WeMoThreadPoolHandler.executeInBackground(new BlobStorageRunnable("getBlobStorage", new GetSetBlobStorageCallback(context), this, paramString, paramJSONObject, getUpnpControl().getDevice(paramString)));
        bool = true;
      }
      else
      {
        DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
        CloudRequestManager localCloudRequestManager = new CloudRequestManager(context);
        localCloudRequestManager.makeRequest(new CloudRequestGetSetBlobStorage(this, context, paramString, localDeviceInformation.getPluginID(), localDeviceInformation.getMAC(), "getBlobStorage", paramJSONObject));
        bool = false;
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getBlobStorage udn: " + paramString);
    }
    return bool;
  }
  
  public JSONObject getBridgeDataFromBridgeUDN(String paramString)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      if ((!TextUtils.isEmpty(paramString)) && (!NetworkMode.isLocal()))
      {
        localJSONObject.put("bridgeudn", paramString);
        DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramString, false, true, false);
        localJSONObject.put("bridgeMacAddress", localDeviceInformation.getMAC());
        localJSONObject.put("bridgePluginId", localDeviceInformation.getPluginID());
      }
      return localJSONObject;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getBridgeMACFromBridgeUDN ex:", localException);
    }
    return localJSONObject;
  }
  
  public String getBridgeUdn(String paramString, ControlPoint paramControlPoint)
  {
    String str = "";
    for (int i = 0; i < paramControlPoint.getDeviceList().size(); i++) {
      if (paramControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        str = paramControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    return str;
  }
  
  public String getCacheHitByUDN(String paramString, boolean paramBoolean)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false)
    {
      double d = localCacheManager.getCacheHit(paramString, bool, paramBoolean);
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Double.valueOf(d);
      return String.format("%.2f", arrayOfObject);
    }
  }
  
  public String getCurrentSSID()
  {
    return this.currentSSID;
  }
  
  public JSONArray getDWSensorListFromDb()
  {
    try
    {
      JSONArray localJSONArray = cacheManager.getDWSensorList();
      return localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getting FobSensorListFromDb ", localJSONException);
    }
    return new JSONArray();
  }
  
  public void getDataStoreFromCloud(SetAndGetActionCallBack paramSetAndGetActionCallBack, String paramString)
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: getDataStoreFromCloud :: is called");
    DeviceInformation localDeviceInformation = getDeviceInformationByUDNFromMemory(paramString);
    if (localDeviceInformation != null)
    {
      String str1 = localDeviceInformation.getPluginID();
      String str2 = localDeviceInformation.getMAC();
      SDKLogUtils.infoLog("DeviceListManager", "pluginID:: " + str1 + " mac:: " + str2);
      if ((!TextUtils.isEmpty(str1)) && (!TextUtils.isEmpty(str2)))
      {
        new CloudRequestManager(context).makeRequest(new CloudRequestGetDataStoreOnLink(paramSetAndGetActionCallBack, paramString, str1, str2));
        return;
      }
      SDKLogUtils.infoLog("DeviceListManager", "Plugin and mac is empty");
      paramSetAndGetActionCallBack.onError();
      return;
    }
    SDKLogUtils.infoLog("DeviceListManager", "No device Information is found");
    paramSetAndGetActionCallBack.onError();
  }
  
  public DeviceInformation getDevice(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    return (DeviceInformation)this.devicesArray.getDeviceInformationList().get(paramString);
  }
  
  public DeviceInformation getDeviceByMACFromDB(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "getDeviceByMAC: MAC Address is empty.");
      return null;
    }
    return cacheManager.getDeviceInformationByMAC(paramString);
  }
  
  public String getDeviceCapabilities(DeviceInformation paramDeviceInformation)
  {
    String str1 = paramDeviceInformation.getCapabilities();
    if (str1.isEmpty())
    {
      JSONObject localJSONObject = new JSONObject();
      String str2 = paramDeviceInformation.getCapabilityID();
      String str3 = paramDeviceInformation.getCurrentState();
      SDKLogUtils.debugLog("DeviceListManager", "ZIGBEE Capabilities. ID List: " + str2 + "; current state List: " + str3);
      if ((!TextUtils.isEmpty(str2)) && (!TextUtils.isEmpty(str3)))
      {
        String[] arrayOfString1 = str2.split(",", -1);
        String[] arrayOfString2 = str3.split(",", -1);
        int i = arrayOfString1.length;
        if (i == arrayOfString2.length)
        {
          int j = 0;
          for (;;)
          {
            if (j >= i) {
              break label232;
            }
            String str4 = arrayOfString1[j];
            String str5 = arrayOfString2[j];
            SDKLogUtils.errorLog("DeviceListManager", "ZIGBEE Capabilities. ID: " + str4 + "; current state: " + str5);
            String str6 = (String)capabalityProfileList.get(str4);
            try
            {
              localJSONObject.put(str6, str5);
              j++;
            }
            catch (JSONException localJSONException)
            {
              for (;;)
              {
                SDKLogUtils.errorLog("DeviceListManager", "JSONException while setting capabilities JSON: ", localJSONException);
              }
            }
          }
        }
        SDKLogUtils.infoLog("DeviceListManager", "NO KEY");
      }
      label232:
      str1 = localJSONObject.toString();
    }
    return str1;
  }
  
  public DeviceInformation getDeviceForWidget(String paramString)
  {
    int i = 1;
    updateLocalMode();
    DeviceInformation localDeviceInformation = getDeviceInformationFromDBByUDN(paramString);
    if ((localDeviceInformation == null) || ((TextUtils.isEmpty(localDeviceInformation.getBridgeUDN())) || ((NetworkMode.isLocal()) && (i == 0)))) {}
    while (this.mSharePreference.isRemoteEnabled()) {
      try
      {
        if (this.mControlPoint == null)
        {
          this.mControlPoint = new ControlPoint();
          this.mControlPoint.setSSID(getSSID(context));
        }
        this.mControlPoint.start();
        this.mControlPoint.searchResponseReceived(WemoUtils.createSSDPPacket(localDeviceInformation.getIP(), localDeviceInformation.getPort(), paramString), false, true);
        Device localDevice = this.mControlPoint.getDevice(paramString);
        if (localDevice != null)
        {
          localDeviceInformation.setDevice(localDevice, false);
          if (i == 0) {
            break label234;
          }
          if (getDeviceForWidget(localDeviceInformation.getBridgeUDN()) != null) {
            break label215;
          }
          SDKLogUtils.errorLog("DeviceListManager", "getDeviceForWidget - Failed to retrieve bridge device with UDN: " + localDeviceInformation.getBridgeUDN());
          localDeviceInformation = null;
          return localDeviceInformation;
          i = 0;
          break;
        }
        SDKLogUtils.errorLog("DeviceListManager", "getDeviceForWidget - Failed to retrieve ControlPoint Device");
        return null;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "getDeviceForWidget - Exception while trying to start the ControlPoint: ", localException);
        return null;
      }
    }
    SDKLogUtils.errorLog("DeviceListManager", "getDeviceForWidget - Remote is not enabled on a remote connection");
    return null;
    label215:
    if (TextUtils.isEmpty(localDeviceInformation.getCapabilities())) {
      localDeviceInformation.setCapabilities(getDeviceCapabilities(localDeviceInformation));
    }
    label234:
    addOrUpdateDeviceInformation(localDeviceInformation);
    return localDeviceInformation;
  }
  
  public DeviceInformation getDeviceFromDBByUDN(String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    localObject = null;
    if (paramBoolean1) {}
    try
    {
      Iterator localIterator3 = cacheManager.getDeviceListFromDB(true, false, false).iterator();
      while (localIterator3.hasNext())
      {
        DeviceInformation localDeviceInformation3 = (DeviceInformation)localIterator3.next();
        if (localDeviceInformation3.getUDN().equalsIgnoreCase(paramString))
        {
          localObject = localDeviceInformation3;
          continue;
          localObject = null;
          if (paramBoolean2)
          {
            Iterator localIterator1 = cacheManager.getDeviceListFromDB(false, true, false).iterator();
            while (localIterator1.hasNext())
            {
              DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
              if (localDeviceInformation1.getUDN().equalsIgnoreCase(paramString)) {
                localObject = localDeviceInformation1;
              }
            }
          }
          localObject = null;
          if (paramBoolean3)
          {
            Iterator localIterator2 = cacheManager.getDeviceListFromDB(false, false, true).iterator();
            while (localIterator2.hasNext())
            {
              DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator2.next();
              boolean bool = localDeviceInformation2.getUDN().equalsIgnoreCase(paramString);
              if (bool) {
                localObject = localDeviceInformation2;
              }
            }
          }
        }
      }
      return (DeviceInformation)localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public ArrayList<DeviceInformation> getDeviceInformation()
  {
    return this.devicesArray.getDeviceInformationArrayList();
  }
  
  public ArrayList<DeviceInformation> getDeviceInformation(ArrayList<WeMoDevice> paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      WeMoDevice localWeMoDevice = (WeMoDevice)localIterator.next();
      if (!localWeMoDevice.getFriendlyName().isEmpty()) {
        localArrayList.add(getDeviceInformationByUDN(localWeMoDevice.getUDN()));
      }
    }
    return localArrayList;
  }
  
  public DeviceInformation getDeviceInformationBySID(String paramString)
  {
    for (;;)
    {
      try
      {
        Iterator localIterator = this.devicesArray.getDeviceInformationList().entrySet().iterator();
        if (!localIterator.hasNext()) {
          break label294;
        }
        localDeviceInformation = (DeviceInformation)((Map.Entry)localIterator.next()).getValue();
        SDKLogUtils.infoLog("DeviceListManager", "device in DevicesArray: " + localDeviceInformation.getUDN());
        if ((localDeviceInformation == null) || (localDeviceInformation.getType().isEmpty()) || (localDeviceInformation.getUDN().contains("WEMO00"))) {
          continue;
        }
        Device localDevice = localDeviceInformation.getDevice();
        if (localDevice == null)
        {
          localDevice = getUpnpControl().getDevice(localDeviceInformation.getUDN());
          if (localDevice == null)
          {
            localDevice = WemoUtils.recreateControlPointDevice(cacheManager.getDeviceInformationByUDN(localDeviceInformation.getUDN()), context);
            localDeviceInformation.setDevice(localDevice, false);
          }
          if (localDevice != null) {
            subscribeToService(localDevice);
          }
        }
        if (localDevice != null)
        {
          if (localDevice.getSubscriberService(paramString) != null)
          {
            SDKLogUtils.infoLog("DeviceListManager", "device subscribed: " + localDeviceInformation.getUDN());
            return localDeviceInformation;
          }
          SDKLogUtils.infoLog("DeviceListManager", "device not subscribed: " + localDeviceInformation.getUDN());
          continue;
        }
        SDKLogUtils.infoLog("DeviceListManager", "device not found in control point for UDN: " + localDeviceInformation.getUDN());
      }
      finally {}
      continue;
      label294:
      DeviceInformation localDeviceInformation = null;
    }
  }
  
  public DeviceInformation getDeviceInformationByUDN(String paramString)
  {
    return getDevice(paramString);
  }
  
  public DeviceInformation getDeviceInformationByUDNFromMemory(String paramString)
  {
    return this.devicesArray.getDeviceInformation(paramString);
  }
  
  public ArrayList<DeviceInformation> getDeviceInformationFromDB(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    return cacheManager.getDeviceListFromDB(paramBoolean1, paramBoolean2, paramBoolean3);
  }
  
  public DeviceInformation getDeviceInformationFromDBByUDN(String paramString)
  {
    return cacheManager.getFullDeviceInfoFromDBByUDN(paramString);
  }
  
  public DeviceInformation getDeviceInformationFromDevicesArray(String paramString)
  {
    new DeviceInformation();
    return this.devicesArray.getDeviceInformation(paramString);
  }
  
  public DeviceInformation getDeviceInformationFromMemoryByUDN(String paramString)
  {
    return this.devicesArray.getDeviceInformation(paramString);
  }
  
  public Map<String, DeviceInformation> getDeviceInformationList()
  {
    return this.devicesArray.getDeviceInformationList();
  }
  
  public List<DeviceInformation> getDeviceInformationListFromDB()
  {
    return cacheManager.getInitialDeviceListGeneric();
  }
  
  public ArrayList<DeviceInformation> getDeviceListFromDB(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    ArrayList localArrayList = cacheManager.getDeviceListFromDB(paramBoolean1, paramBoolean2, paramBoolean3);
    if (paramBoolean2)
    {
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator.next();
        if ((localDeviceInformation1.getFriendlyName().equals("")) || (localDeviceInformation1.getFriendlyName() == null))
        {
          DeviceInformation localDeviceInformation2 = getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, false, true);
          if (localDeviceInformation2 != null) {
            localDeviceInformation1.setFriendlyName(localDeviceInformation2.getFriendlyName());
          }
        }
      }
    }
    return localArrayList;
  }
  
  public String getDeviceNameFromDevicesCacheList(String paramString)
  {
    Iterator localIterator = this.devicesArray.getDeviceInformationArrayList().iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if ((localDeviceInformation != null) && (localDeviceInformation.getUDN().equalsIgnoreCase(paramString))) {
        return localDeviceInformation.getFriendlyName();
      }
    }
    return null;
  }
  
  public DeviceInformation getDeviceObjectByUDN(String paramString)
  {
    DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null)
    {
      if (IsDevice.Insight(paramString)) {
        localDeviceInformation.getInsightData();
      }
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      cacheManager.updateDB(localDeviceInformation, false, false, true);
    }
    return localDeviceInformation;
  }
  
  public void getDevicePresetCloud(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: getDevicePresetCloud :: is called");
    if ((paramJSONArray != null) && (paramSetAndGetActionCallBack != null))
    {
      new CloudRequestManager(context).makeRequest(new CloudRequestForGetDevicePreset(paramSetAndGetActionCallBack, paramJSONArray));
      return;
    }
    SDKLogUtils.infoLog("DeviceListManager", "JSONArray or SetAndGetActionCallBack is null ");
    paramSetAndGetActionCallBack.onError();
  }
  
  public String getDeviceState(String paramString)
  {
    DeviceInformation localDeviceInformation = getDevice(paramString);
    String str = "-1";
    if (localDeviceInformation != null) {
      str = String.valueOf(localDeviceInformation.getState());
    }
    return str;
  }
  
  public List<String> getDeviceUDNListFromDB()
  {
    return cacheManager.getDeviceUDNList();
  }
  
  public HashMap<String, Long> getDevicesStartTimes()
  {
    return this.devicesStartTimes;
  }
  
  public HashMap<String, Boolean> getDiscoveredDeviceList()
  {
    return this.devicesArray.getDiscoveredDeviceList();
  }
  
  public Map<String, FirmwareUpdateData> getFWUpdateInProgressDataMap()
  {
    return this.fwUpdateInProgressDataMap;
  }
  
  public JSONArray getFWVersionsFromDb()
  {
    try
    {
      JSONArray localJSONArray = cacheManager.getFWVersions();
      return localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getting FWVersionsFromDb ", localJSONException);
    }
    return new JSONArray();
  }
  
  public JSONArray getFobSensorListFromDb()
  {
    try
    {
      JSONArray localJSONArray = cacheManager.getFobSensorList();
      return localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getting FobSensorListFromDb ", localJSONException);
    }
    return new JSONArray();
  }
  
  public Map<String, FirmwareUpdateData> getFwUpdateInProgressDataMap()
  {
    return this.fwUpdateInProgressDataMap;
  }
  
  public Bitmap getIconFromUri(Uri paramUri)
  {
    Bitmap localBitmap = null;
    if (paramUri != null) {
      localBitmap = UploadFileUtil.uriToBitmap(context, paramUri, 100);
    }
    return localBitmap;
  }
  
  public Bitmap getIconFromUriForCrop(Uri paramUri)
  {
    Bitmap localBitmap = null;
    if (paramUri != null) {
      localBitmap = UploadFileUtil.uriToBitmap(context, paramUri, 240);
    }
    return localBitmap;
  }
  
  public void getLEDDeviceIcon(String paramString1, String paramString2)
  {
    SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: getLEDDeviceIcon: deviceID: " + paramString1 + "; uploadID: " + paramString2);
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString1);
    if (localDeviceInformation != null)
    {
      String str = localDeviceInformation.getIconUploadID();
      SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: Requesting for LED Icon uploadID: " + paramString2 + "; UploadID in device: " + str + " ;Icon location in device: " + localDeviceInformation.getIcon());
      if (!paramString2.equals(str))
      {
        SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: new uploadID found for deviceID: " + paramString1 + "; Downloading new LED icon.");
        CloudRequestGetLEDIcon localCloudRequestGetLEDIcon = new CloudRequestGetLEDIcon(this, paramString1, paramString2);
        new CloudRequestManager(context).makeRequest(localCloudRequestGetLEDIcon);
      }
      return;
    }
    List localList = this.devicesArray.getDevicesInGroup(paramString1);
    SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: Requesting for Group Icon");
    SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: udnList: " + localList.toString());
    if (localList.size() > 0)
    {
      SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: All LEDs in group have different UPLOAD ID than latest for group. Downloading new GROUP icon.");
      CloudRequestGetLEDGroupIcon localCloudRequestGetLEDGroupIcon = new CloudRequestGetLEDGroupIcon(this, localList, paramString2, paramString1);
      new CloudRequestManager(context).makeRequest(localCloudRequestGetLEDGroupIcon);
      return;
    }
    SDKLogUtils.errorLog("DeviceListManager", "LED ICONINFO: CloudRequestGetLEDGroupIcon NOT sent as NO devices found in Group.");
  }
  
  public void getLEDDeviceIconInfo()
  {
    if (this.remoteAccessManager.isRemoteEnabled())
    {
      CloudRequestGetLEDIconInfo localCloudRequestGetLEDIconInfo = new CloudRequestGetLEDIconInfo(this, this.remoteAccessManager.getHomeId());
      new CloudRequestManager(context).makeRequest(localCloudRequestGetLEDIconInfo);
    }
    do
    {
      return;
      SDKLogUtils.errorLog("DeviceListManager", "getLEDDeviceIconInfo(): ERROR - Remote access is not enabled.");
    } while (this.ledIconOnRemoteAccessListener != null);
    this.ledIconOnRemoteAccessListener = new LEDIconsOnRemoteAccessListener(this);
    RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this.ledIconOnRemoteAccessListener);
  }
  
  public JSONArray getLEDDeviceListFromDb()
  {
    try
    {
      JSONArray localJSONArray = cacheManager.getLEDDeviceList();
      return localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getting FobSensorListFromDb ", localJSONException);
    }
    return new JSONArray();
  }
  
  public String getLastDiscoveryTimeByUDN(String paramString)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false) {
      return localCacheManager.getLastDiscoveryTime(paramString, bool);
    }
  }
  
  public String getLastDiscoveryTimeByUniqueID(String paramString)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false) {
      return localCacheManager.getLastDiscoveryTimeZigBee(paramString, bool);
    }
  }
  
  public String getLastHitTimeByUDN(String paramString)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false) {
      return localCacheManager.getLastHitTime(paramString, bool);
    }
  }
  
  public String getLastHitTimeByUniqueID(String paramString)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false) {
      return localCacheManager.getLastHitTimeZigBee(paramString, bool);
    }
  }
  
  public Location getLocationByArpMac(String paramString)
  {
    Set localSet = getLocationList();
    Object localObject = null;
    Iterator localIterator1 = localSet.iterator();
    for (;;)
    {
      if (!localIterator1.hasNext()) {
        return localObject;
      }
      Location localLocation = (Location)localIterator1.next();
      Iterator localIterator2 = localLocation.getArpMacs().iterator();
      if (localIterator2.hasNext())
      {
        if (!((String)localIterator2.next()).equals(paramString)) {
          break;
        }
        localObject = localLocation;
      }
    }
    return (Location)localObject;
  }
  
  public Location getLocationByHomeId(String paramString)
  {
    return cacheLocationsManager.getLocationByHomeIdFromDB(paramString);
  }
  
  public Location getLocationBySSID(String paramString)
  {
    Set localSet = getLocationList();
    Object localObject = null;
    Iterator localIterator1 = localSet.iterator();
    for (;;)
    {
      if (!localIterator1.hasNext()) {
        return localObject;
      }
      Location localLocation = (Location)localIterator1.next();
      Iterator localIterator2 = localLocation.getSsids().iterator();
      if (localIterator2.hasNext())
      {
        if (!((String)localIterator2.next()).equals(paramString)) {
          break;
        }
        localObject = localLocation;
      }
    }
    return (Location)localObject;
  }
  
  public Set<Location> getLocationList()
  {
    return cacheLocationsManager.getLocationsFromMemory();
  }
  
  public void getNestDevicesFromCloud()
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new GetNestDevicesRequestRunnable(this, this.remoteAccessManager, context));
  }
  
  public String getNetworkType()
  {
    return this.mNetworkUtils.getNetworkType();
  }
  
  public JSONArray getPIRSensorListFromDb()
  {
    try
    {
      JSONArray localJSONArray = cacheManager.getPIRSensorList();
      return localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getting PIRSensorListFromDb ", localJSONException);
    }
    return new JSONArray();
  }
  
  public JSONArray getRemoteAccessDet()
  {
    Set localSet = this.remoteAccessManager.getHomeSSID();
    JSONArray localJSONArray = new JSONArray();
    localJSONArray.put(this.remoteAccessManager.isRemoteEnabled());
    Iterator localIterator = localSet.iterator();
    if (localIterator.hasNext()) {
      localJSONArray.put((String)localIterator.next());
    }
    localJSONArray.put(this.remoteAccessManager.getHomeId());
    localJSONArray.put(this.mNetworkUtils.isHomeNetwork());
    return localJSONArray;
  }
  
  public String getSSID(Context paramContext)
  {
    String str = ((WifiManager)paramContext.getSystemService("wifi")).getConnectionInfo().getSSID();
    if (str == null) {
      return "";
    }
    return str.replaceAll("\"", "").trim();
  }
  
  public long getScanStartTime(String paramString)
  {
    if (this.devicesStartTimes.size() > 0)
    {
      if (this.devicesStartTimes.get(paramString) != null)
      {
        long l = ((Long)this.devicesStartTimes.get(paramString)).longValue();
        if (l == 0L) {
          l = this.startTime;
        }
        return l;
      }
      return this.startTime;
    }
    this.devicesStartTimes.put(paramString, Long.valueOf(this.startTime));
    return this.startTime;
  }
  
  public int getSubDevicesCount(String paramString)
  {
    return cacheManager.getSubDevicesCount(paramString);
  }
  
  public int getTotalTriesByUDN(String paramString, boolean paramBoolean)
  {
    CacheManager localCacheManager = cacheManager;
    if (!NetworkMode.isLocal()) {}
    for (boolean bool = true;; bool = false) {
      return localCacheManager.getTotalTries(paramString, bool, paramBoolean);
    }
  }
  
  public ControlPoint getUpnpControl()
  {
    if (this.mControlPoint == null) {
      this.mControlPoint = new ControlPoint();
    }
    return this.mControlPoint;
  }
  
  public int getWeMoDeviceCount()
  {
    ControlPoint localControlPoint = this.mControlPoint;
    int i = 0;
    if (localControlPoint != null) {
      i = this.mControlPoint.getDeviceList().size();
    }
    return i;
  }
  
  public void hideDevice(String paramString, int paramInt)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
    new CloudRequestManager(context).makeRequest(new CloudRequestHideDevice(context, localDeviceInformation.getMAC()));
    SDKLogUtils.infoLog("DeviceListManager", "device info result: " + localDeviceInformation);
    if (localDeviceInformation != null)
    {
      this.devicesArray.deleteDeviceInformation(paramString);
      cacheManager.deleteDeviceFromDB(localDeviceInformation, true, true, true);
    }
  }
  
  public void hideGroup(String paramString, HideGroupSuccessCallback paramHideGroupSuccessCallback, HideGroupErrorCallback paramHideGroupErrorCallback)
  {
    SDKLogUtils.debugLog("DeviceListManager", "Processing hide group request for Group ID:" + paramString);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new HideGroupRunnable(paramHideGroupSuccessCallback, paramHideGroupErrorCallback, context, paramString));
  }
  
  public void incrementOfflineLEDCount()
  {
    try
    {
      this.offlineLEDCount = (1 + this.offlineLEDCount);
      SDKLogUtils.debugLog("DeviceListManager", "LED Status Tracking: Offline LED Count INCREMENTED. New Count: " + this.offlineLEDCount);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void initCache()
  {
    List localList = cacheManager.getInitialDeviceListGeneric();
    SDKLogUtils.infoLog("DeviceListManager", "initCache");
    Iterator localIterator;
    if ((localList != null) && (localList.size() > 0)) {
      localIterator = localList.iterator();
    }
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (localDeviceInformation != null)
      {
        SDKLogUtils.infoLog("DeviceListManager", "cached device found: " + localDeviceInformation.getUDN());
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        continue;
        SDKLogUtils.infoLog("DeviceListManager", "cache empty");
      }
    }
    getSmartDiscovery().onCachedDeviceLoaded();
  }
  
  public void initControlPoint()
  {
    SDKLogUtils.infoLog("DeviceListManager", "initControlPoint");
    if (this.mControlPoint != null)
    {
      this.mControlPoint.stop();
      this.mControlPoint = null;
    }
    if (mWeMoSDKContext == null) {
      mWeMoSDKContext = WeMoSDKContext.getInstance(context);
    }
    this.mControlPoint = new ControlPoint();
    String str = getSSID(context);
    this.mControlPoint.setSSID(str);
    this.currentSSID = str;
    SDKLogUtils.debugLog("DeviceListManager", "Control Point:  start() via DeviceListManager");
    this.mControlPoint.start();
    this.startTime = System.currentTimeMillis();
    SDKLogUtils.debugLog("DeviceListManager", "register listeners calling start listen");
    startListen();
    refreshListOfWeMoDevicesOnLAN();
    if (!this.mNetworkUtils.isPluginConnected())
    {
      SDKLogUtils.debugLog("DeviceListManager", "STARTING UNICAST DISCOVERY FOR CACHED DEVICES.");
      startUnicastDiscovery();
    }
  }
  
  public void initiateScanZigBeeDevice(final String paramString)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        DeviceListManager.this.scanZigBeeBridge(paramString);
      }
    }).start();
  }
  
  public boolean isAnyLEDOffline()
  {
    try
    {
      int i = this.offlineLEDCount;
      boolean bool = false;
      if (i > 0) {
        bool = true;
      }
      SDKLogUtils.debugLog("DeviceListManager", "LED Status Tracking: Is Any LED Offline = " + bool + "; Offline count: " + this.offlineLEDCount);
      return bool;
    }
    finally {}
  }
  
  public boolean isDeviceDiscovered(String paramString)
  {
    return this.devicesArray.getDeviceDiscovered(paramString);
  }
  
  public boolean isDeviceNotReachable()
  {
    return this.deviceNotReachable;
  }
  
  public boolean isDevicePairingInProgress()
  {
    NetworkStateListener localNetworkStateListener = this.networkStateListener;
    boolean bool = false;
    if (localNetworkStateListener != null) {
      bool = this.networkStateListener.isDevicePairingInProgress();
    }
    return bool;
  }
  
  public boolean isFWUpdateInProgress()
  {
    try
    {
      Map localMap = this.devicesArray.getDeviceInformationList();
      boolean bool1 = false;
      if (localMap != null)
      {
        int i = localMap.size();
        bool1 = false;
        if (i > 0)
        {
          Iterator localIterator = localMap.values().iterator();
          boolean bool3;
          do
          {
            DeviceInformation localDeviceInformation;
            do
            {
              boolean bool2 = localIterator.hasNext();
              bool1 = false;
              if (!bool2) {
                break;
              }
              localDeviceInformation = (DeviceInformation)localIterator.next();
            } while (!localDeviceInformation.getIsDiscovered());
            String str = localDeviceInformation.getFwStatus();
            if ((str.equals("0")) || (str.equals("1"))) {
              break;
            }
            bool3 = str.equals("3");
          } while (!bool3);
          bool1 = true;
        }
      }
      return bool1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception: ", localException);
    }
    return false;
  }
  
  public boolean isFirstRemoteCall()
  {
    return firstRemoteCall;
  }
  
  public boolean isGenericFirmware(String paramString)
  {
    String[] arrayOfString = { "coffee", "humidifier", "heater", "purifier", "crockpot" };
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "empty udn:" + paramString);
      return false;
    }
    int i = 0;
    try
    {
      while (i < arrayOfString.length)
      {
        boolean bool = paramString.toLowerCase().contains(arrayOfString[i]);
        if (bool) {
          return true;
        }
        i++;
      }
      return false;
    }
    catch (Exception localException)
    {
      localException = localException;
      SDKLogUtils.errorLog("DeviceListManager", "Exception for udn:" + paramString + ", ex:" + localException);
      return false;
    }
    finally {}
    return false;
  }
  
  public boolean isSmart(String paramString)
  {
    return (paramString.contains("Heater")) || (paramString.contains("Humidifier")) || (paramString.contains("AirPurifier")) || (paramString.contains("CoffeeMaker"));
  }
  
  public boolean isZigbee(String paramString)
  {
    boolean bool1 = false;
    if (paramString != null)
    {
      DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
      bool1 = false;
      if (localDeviceInformation != null)
      {
        boolean bool2 = localDeviceInformation.getBridgeUDN().isEmpty();
        bool1 = false;
        if (!bool2)
        {
          SDKLogUtils.infoLog("DeviceListManager", "isZigbee mDeviceInfo.getBridgeUDN() : " + localDeviceInformation.getBridgeUDN());
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public void makeCloudRequestForUpdateDeviceList()
  {
    SDKLogUtils.infoLog("RemoteMode:", "in makeCloudRequestForUpdateDeviceList");
    this.devicesArray.clearDeviceDiscoveries();
    try
    {
      this.startDiscoveryTimeForRemote = System.currentTimeMillis();
      CloudRequestUpdateDeviceList localCloudRequestUpdateDeviceList = new CloudRequestUpdateDeviceList(this, context);
      new CloudRequestManager(context).makeRequest(localCloudRequestUpdateDeviceList);
      return;
    }
    catch (Exception localException)
    {
      sendNotificationAboutDiscoveryStateChange("", "Discovery TimeOut");
    }
  }
  
  public void makeRequestForGettingDevicesFromCloud(Context paramContext)
  {
    if (!Locks.getInstance().isLocked(Locks.LOCK_GET_DEVICE_LIST))
    {
      Locks.getInstance().setLock(Locks.LOCK_GET_DEVICE_LIST);
      try
      {
        SDKLogUtils.infoLog("RemoteMode:", "in makeRequestForGettingDevicesFromCloud");
        CloudRequestUpdateDeviceList localCloudRequestUpdateDeviceList = new CloudRequestUpdateDeviceList(this, paramContext);
        new CloudRequestManager(paramContext).makeRequest(localCloudRequestUpdateDeviceList);
        return;
      }
      catch (Exception localException)
      {
        sendNotificationAboutDiscoveryStateChange("", "Discovery TimeOut");
        return;
      }
      finally
      {
        Locks.getInstance().unsetLock(Locks.LOCK_GET_DEVICE_LIST);
      }
    }
    sendNotificationAboutDiscoveryStateChange("", "Discovery TimeOut");
  }
  
  public void makeStateChangeRequest(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    SDKLogUtils.infoLog("setNewStateForDevice: ", "makeStateChangeRequest");
    if ((paramString2.equals("")) || (paramString3.equals("")))
    {
      DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramString1, false, true, false);
      if (localDeviceInformation != null)
      {
        localDeviceInformation.getPluginID();
        localDeviceInformation.getMAC();
      }
    }
    new CloudRequestManager(context);
  }
  
  public void nestTokenExistenceCheck()
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new NestTokenExistenceRequestRunnable(this, context));
  }
  
  public void onDeviceFWUpdateStarted(String paramString)
  {
    String str = "";
    DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null) {
      str = localDeviceInformation.getFirmwareVersion();
    }
    onDeviceFWUpdateStarted(paramString, str);
  }
  
  public void onDeviceFWUpdateStarted(String paramString1, String paramString2)
  {
    FirmwareUpdateData localFirmwareUpdateData = new FirmwareUpdateData();
    localFirmwareUpdateData.setUdn(paramString1);
    localFirmwareUpdateData.setOldFwVersion(paramString2);
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: onDeviceFWUpdateStarted: Adding to fwUpdateInProgressDataMap. UDN: " + paramString1 + "old FW Version: " + paramString2);
    this.fwUpdateInProgressDataMap.put(paramString1, localFirmwareUpdateData);
  }
  
  public void onDiscoveryRetry(String paramString)
  {
    sendNotificationAboutDiscoveryStateChange(paramString, "Discovery ReTry");
  }
  
  public void onNestSilentPushNotificationReceived(String paramString1, String paramString2, String paramString3)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString1);
    if (localDeviceInformation != null)
    {
      SDKLogUtils.infoLog("DeviceListManager", "dev attribute: " + localDeviceInformation.getAttributeList());
      if (!paramString2.equalsIgnoreCase("Name")) {
        break label117;
      }
      localDeviceInformation.setFriendlyName(paramString3);
    }
    for (;;)
    {
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      cacheManager.updateDB(localDeviceInformation, false, false, true);
      sendNotification("update", "", localDeviceInformation.getUDN());
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
      }
      return;
      label117:
      if (paramString2.equalsIgnoreCase("StructureName")) {
        localDeviceInformation.setParentName(paramString3);
      } else {
        try
        {
          localDeviceInformation.setAttributeValue(paramString2, paramString3);
          SDKLogUtils.infoLog("DeviceListManager", "dev attribute: " + localDeviceInformation.getAttributeList());
        }
        catch (JSONException localJSONException)
        {
          SDKLogUtils.errorLog("DeviceListManager", "Exception for udn:" + paramString1 + ", e: " + localJSONException);
        }
      }
    }
  }
  
  public void onNetworkChange(NotificationListenerDLM paramNotificationListenerDLM)
  {
    updateLocalMode();
    String str = this.mNetworkUtils.getSSID();
    if (str == null) {
      str = "";
    }
    Log.d("DeviceListManager", "onNetworkChange currentSSID: " + str + " lastSSID: " + this.lastSSID + " isLocal: " + NetworkMode.isLocal() + " lastModeLocal: " + this.lastModeLocal);
    if ((!str.equals(this.lastSSID)) || (NetworkMode.isLocal() != this.lastModeLocal))
    {
      this.lastSSID = this.currentSSID;
      if (!this.mNetworkUtils.isPluginConnected()) {
        break label148;
      }
      sendNotification("pluginConnected", "", "");
    }
    for (;;)
    {
      this.lastModeLocal = NetworkMode.isLocal();
      this.currentSSID = str;
      return;
      label148:
      if (this.mNetworkUtils.isHomeNetwork())
      {
        stopLocalMode();
        restartLocalMode(paramNotificationListenerDLM);
      }
      else
      {
        firstRemoteCall = true;
        this.lastSSID = "";
        makeCloudRequestForUpdateDeviceList();
        stopCloudPeriodicUpdate();
        startCloudPeriodicUpdate();
      }
    }
  }
  
  public DeviceInformation onOverTempNotificationReceived(String paramString1, String paramString2)
  {
    DeviceInformation localDeviceInformation = getDeviceByMACFromDB(paramString2);
    if (localDeviceInformation != null) {}
    try
    {
      localDeviceInformation.setAttributeValue("overTemp", paramString1);
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      sendNotification("update", "", localDeviceInformation.getUDN());
      cacheManager.updateDB(localDeviceInformation, false, false, true);
      return localDeviceInformation;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("DeviceListManager", "onOverTempNotificationReceived: JSONException while setting OverTemp as attribute in DeviceInfo: ", localJSONException);
      }
    }
  }
  
  public void onPause()
  {
    SDKLogUtils.infoLog("DeviceListManager", "ON PAUSE");
    resetForcedRemoteFlag();
    updateLocalMode();
    this.devicesArray.clearDeviceDiscoveries();
    if (this.mNetworkUtils.isHomeNetwork()) {
      stopLocalMode();
    }
    stopCloudPeriodicUpdate();
    getSmartDiscovery().setDeviceUnicastFailedCount(0);
    if (!this.fwUpdateInProgressDataMap.isEmpty()) {
      WemoUtils.writeFirmwareUpgradeInProgressState(this.fwUpdateInProgressDataMap, context);
    }
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap writing to Internal Memory");
    printFwUpgradeInProgressMapIfDebug();
  }
  
  public void onResume(NotificationListenerDLM paramNotificationListenerDLM)
  {
    SDKLogUtils.infoLog("DeviceListManager", "ON RESUME: DEVICELISTMANAGER");
    getSmartDiscovery().setDeviceUnicastFailedCount(0);
    getSmartDiscovery().setCloudCacheCalledSuccessfully(false);
    boolean bool = this.mNetworkUtils.isPluginConnected();
    if (!getSmartDiscovery().isForcedRemoteEnabled()) {
      updateLocalMode();
    }
    if ((bool) && (!getSmartDiscovery().isForcedRemoteEnabled()))
    {
      this.mNetworkUtils.bindToNetwork();
      SDKLogUtils.infoLog("DeviceListManager", "Plugin Connected");
      sendNotification("pluginConnected", "", "");
      initCache();
      initControlPoint();
    }
    for (;;)
    {
      int i = cacheManager.getNestDeviceUDNList().getCount();
      SDKLogUtils.infoLog("DeviceListManager", "No. of nest devices available in home: " + i);
      SDKLogUtils.infoLog("DeviceListManager", "NetworkMode is: " + NetworkMode.isLocal());
      if ((i > 0) && (NetworkMode.isLocal())) {
        getNestDevicesFromCloud();
      }
      String str = this.mSharePreference.getEmailOptDeviceType();
      SDKLogUtils.infoLog("DeviceListManager", "deviceType: " + str);
      if (!str.equals("")) {
        collectEmailIDToCloud();
      }
      return;
      if ((this.mNetworkUtils.isHomeNetwork()) && (!getSmartDiscovery().isForcedRemoteEnabled()))
      {
        SDKLogUtils.infoLog("DeviceListManager", "local mode");
        verifyHomeNetwork();
        startListen();
        addNotificationListener(paramNotificationListenerDLM);
        initCache();
        this.devicesArray.clearDeviceDiscoveries();
        initControlPoint();
      }
      else if (!bool)
      {
        SDKLogUtils.infoLog("DeviceListManager", "remote mode");
        initCache();
        addNotificationListener(paramNotificationListenerDLM);
        new Thread(new Runnable()
        {
          public void run()
          {
            DeviceListManager.this.makeCloudRequestForUpdateDeviceList();
          }
        }).start();
        stopCloudPeriodicUpdate();
        startCloudPeriodicUpdate();
      }
    }
  }
  
  public DeviceInformation onSilentStatusNotificationReceived(String paramString1, String paramString2)
  {
    DeviceInformation localDeviceInformation = getDeviceByMACFromDB(paramString2);
    if ((localDeviceInformation == null) || (TextUtils.isEmpty(paramString1)) || (!NetworkMode.isLocal())) {
      try
      {
        localDeviceInformation.setBinaryState(paramString1);
        localDeviceInformation.setState(Integer.valueOf(paramString1).intValue());
        localDeviceInformation.setAttributeValue("binaryState", paramString1);
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        sendNotification("change_state", "", localDeviceInformation.getUDN());
        cacheManager.updateDB(localDeviceInformation, false, false, true);
        return localDeviceInformation;
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("DeviceListManager", "onSilentStatusNotificationReceived: JSONException while setting BinaryState as attribute in DeviceInfo: ", localJSONException);
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("DeviceListManager", "onSilentStatusNotificationReceived: NumberFormatException while setting State in DeviceInfo: ", localNumberFormatException);
        }
      }
    }
    SDKLogUtils.debugLog("DeviceListManager", "onSilentStatusNotificationReceived: Not processing as local mode. Processed only in Remote mode. ");
    return localDeviceInformation;
  }
  
  public void onStart()
  {
    SDKLogUtils.infoLog("DeviceListManager", "ON START");
    resetForcedRemoteFlag();
  }
  
  public void populateDeviceList()
  {
    SDKLogUtils.infoLog("DeviceListManager", "CloudCache: populateDeviceList called");
    Map localMap = this.devicesArray.getDeviceInformationList();
    if ((localMap != null) && (localMap.size() > 0))
    {
      Iterator localIterator = localMap.values().iterator();
      if (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        Device localDevice = localDeviceInformation.getDevice();
        if (subscribeToService(localDevice))
        {
          localDeviceInformation.setInActive(0);
          localDeviceInformation.setIsDiscovered(true);
          String str = localDevice.getFriendlyNameFromDevice();
          if (str != null) {
            localDeviceInformation.setFriendlyName(str);
          }
        }
        for (;;)
        {
          this.devicesArray.updateDeviceCache(localDeviceInformation, true);
          cacheManager.updateDB(localDeviceInformation, false, false, true);
          sendNotification("update", "", localDeviceInformation.getUDN());
          break;
          localDeviceInformation.setInActive(1);
          localDeviceInformation.setIsDiscovered(false);
        }
      }
    }
    getSmartDiscovery().onCachedDeviceLoaded();
  }
  
  public void postControlAction(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      String str = getUpnpControl().getDevice(paramString1).getAction(paramString2).postControlAction();
      SDKLogUtils.infoLog("DeviceListManager", "response " + str);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Get insight parameters exception: ", localException);
    }
  }
  
  public JSONObject prepareDeviceResetResponse(String paramString1, String paramString2, String paramString3)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("resetType", paramString1);
    localJSONObject.put("udn", paramString2);
    localJSONObject.put("success", paramString3);
    return localJSONObject;
  }
  
  public void printFwUpgradeInProgressMapIfDebug()
  {
    if (SDKLogUtils.isDebug())
    {
      SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap current state. Size = " + this.fwUpdateInProgressDataMap.size());
      Iterator localIterator = this.fwUpdateInProgressDataMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        SDKLogUtils.debugLog("DeviceListManager", "FW Update: KEY: " + (String)localEntry.getKey() + "; VALUE: " + localEntry.getValue());
      }
    }
  }
  
  public void processFWUpgradeStatus(DeviceInformation paramDeviceInformation)
  {
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus");
    printFwUpgradeInProgressMapIfDebug();
    String str1 = paramDeviceInformation.getUDN();
    String str2 = paramDeviceInformation.getFwStatus();
    FirmwareUpdateData localFirmwareUpdateData = (FirmwareUpdateData)this.fwUpdateInProgressDataMap.get(str1);
    if (localFirmwareUpdateData != null)
    {
      String str3 = localFirmwareUpdateData.getOldFwVersion();
      String str4 = paramDeviceInformation.getFirmwareVersion();
      SDKLogUtils.debugLog("DeviceListManager", "FW Update: analyzeFWUpgradeStatus: Device found in fwUpdateInProgressDataMap. Old FW Version: " + str3 + "; Current FW Version: " + str4 + "; fwStatus from Device (if any): " + str2);
      if (str2.equals("4"))
      {
        if (str3.equals(str4)) {
          str2 = "5";
        }
        this.fwUpdateInProgressDataMap.remove(str1);
        SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus: removed UDN: " + str1);
        printFwUpgradeInProgressMapIfDebug();
      }
      for (;;)
      {
        SDKLogUtils.debugLog("DeviceListManager", "FW Update: analyzeFWUpgradeStatus: Device found in fwUpdateInProgressDataMap. Final fwStatus calculated: " + str2);
        paramDeviceInformation.setFwStatus(str2);
        if (!TextUtils.isEmpty(str2)) {
          sendNotification("FirmwareUpdateStatus", str2, str1);
        }
        return;
        if ((!str2.equals("0")) && (!str2.equals("1")) && (!str2.equals("3")))
        {
          if (!str3.equals(str4)) {
            str2 = "4";
          }
          this.fwUpdateInProgressDataMap.remove(str1);
          SDKLogUtils.debugLog("DeviceListManager", "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus: removed UDN: " + str1);
          printFwUpgradeInProgressMapIfDebug();
        }
      }
    }
    SDKLogUtils.debugLog("DeviceListManager", "FW Update: analyzeFWUpgradeStatus: Device NOT FOUND in fwUpdateInProgressDataMap.");
  }
  
  public boolean recreateControlPoint()
  {
    try
    {
      boolean bool = recreateControlPoint(false);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public boolean recreateControlPoint(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: ldc 115
    //   4: new 270	java/lang/StringBuilder
    //   7: dup
    //   8: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   11: ldc_w 2922
    //   14: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   17: iload_1
    //   18: invokevirtual 498	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   21: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   24: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   27: iload_1
    //   28: ifne +104 -> 132
    //   31: aload_0
    //   32: getstatic 258	com/belkin/wemo/cache/devicelist/DeviceListManager:context	Landroid/content/Context;
    //   35: invokevirtual 2384	com/belkin/wemo/cache/devicelist/DeviceListManager:getSSID	(Landroid/content/Context;)Ljava/lang/String;
    //   38: astore_3
    //   39: ldc_w 606
    //   42: new 270	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 271	java/lang/StringBuilder:<init>	()V
    //   49: ldc_w 2924
    //   52: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: aload_0
    //   56: getfield 390	com/belkin/wemo/cache/devicelist/DeviceListManager:lastSSID	Ljava/lang/String;
    //   59: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   62: ldc_w 2926
    //   65: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: aload_3
    //   69: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   72: ldc_w 2928
    //   75: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   78: aload_0
    //   79: getfield 235	com/belkin/wemo/cache/devicelist/DeviceListManager:mControlPoint	Lorg/cybergarage/upnp/ControlPoint;
    //   82: invokevirtual 580	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   85: ldc_w 2930
    //   88: invokevirtual 277	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: aload_0
    //   92: invokevirtual 281	java/lang/Object:hashCode	()I
    //   95: invokevirtual 284	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   98: invokevirtual 289	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   101: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   104: aload_0
    //   105: getfield 390	com/belkin/wemo/cache/devicelist/DeviceListManager:lastSSID	Ljava/lang/String;
    //   108: aload_3
    //   109: invokevirtual 795	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   112: ifeq +20 -> 132
    //   115: ldc_w 606
    //   118: ldc_w 2932
    //   121: invokestatic 426	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   124: iconst_0
    //   125: istore 4
    //   127: aload_0
    //   128: monitorexit
    //   129: iload 4
    //   131: ireturn
    //   132: aload_0
    //   133: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   136: ifnull +10 -> 146
    //   139: aload_0
    //   140: getfield 303	com/belkin/wemo/cache/devicelist/DeviceListManager:devicesArray	Lcom/belkin/wemo/cache/data/DevicesArray;
    //   143: invokevirtual 2935	com/belkin/wemo/cache/data/DevicesArray:clearAll	()V
    //   146: aload_0
    //   147: getfield 235	com/belkin/wemo/cache/devicelist/DeviceListManager:mControlPoint	Lorg/cybergarage/upnp/ControlPoint;
    //   150: ifnull +10 -> 160
    //   153: aload_0
    //   154: getfield 235	com/belkin/wemo/cache/devicelist/DeviceListManager:mControlPoint	Lorg/cybergarage/upnp/ControlPoint;
    //   157: invokevirtual 2938	org/cybergarage/upnp/ControlPoint:forceClose	()V
    //   160: aload_0
    //   161: invokevirtual 2829	com/belkin/wemo/cache/devicelist/DeviceListManager:initControlPoint	()V
    //   164: iconst_1
    //   165: istore 4
    //   167: goto -40 -> 127
    //   170: astore_2
    //   171: aload_0
    //   172: monitorexit
    //   173: aload_2
    //   174: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	175	0	this	DeviceListManager
    //   0	175	1	paramBoolean	boolean
    //   170	4	2	localObject	Object
    //   38	71	3	str	String
    //   125	41	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	27	170	finally
    //   31	124	170	finally
    //   132	146	170	finally
    //   146	160	170	finally
    //   160	164	170	finally
  }
  
  public void refreshListOfWeMoDevicesOnLAN()
  {
    setDeviceNonReachibility(false);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new MSearchRequestRunnable(this, getSmartDiscovery()));
  }
  
  public void refreshLongPressRuleDetails(int paramInt, final String paramString)
  {
    SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RULE ID and UDN - RuleID: " + paramInt + "; UDN: " + paramString);
    final DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null)
    {
      RMRulesSDK.instance().getRules().getRuleFromCache(paramInt, new RMGetRuleSuccessCallback()new RMGetRuleErrorCallback
      {
        public void onSuccess(RMRule paramAnonymousRMRule)
        {
          if ((paramAnonymousRMRule.getRulesType() == 2) && (((RMDBRule)paramAnonymousRMRule).getRuleType() == RMDBRuleType.LONG_PRESS))
          {
            RMLongPressRule localRMLongPressRule = (RMLongPressRule)paramAnonymousRMRule;
            Iterator localIterator1 = localRMLongPressRule.getRuleDeviceSet().iterator();
            while (localIterator1.hasNext())
            {
              RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator1.next();
              ArrayList localArrayList;
              try
              {
                localDeviceInformation.setAttributeValue("longPressRuleState", String.valueOf(localRMLongPressRule.getState()));
                localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", String.valueOf(localRMLongPressRule.getTargetDeviceSet().size()));
                localDeviceInformation.setAttributeValue("longPressRuleAction", String.valueOf(localRMDBRuleDevice.getStartAction()));
                localArrayList = new ArrayList();
                Iterator localIterator2 = localRMLongPressRule.getTargetDeviceSet().iterator();
                while (localIterator2.hasNext()) {
                  localArrayList.add(((RMTargetDevice)localIterator2.next()).getDeviceId());
                }
              }
              catch (JSONException localJSONException)
              {
                SDKLogUtils.errorLog("DeviceListManager", "JSONException while refreshing long press rule attributes: ", localJSONException);
              }
              localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", TextUtils.join(",", localArrayList));
              DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
              DeviceListManager.this.sendNotification("update", "", paramString);
              DeviceListManager.cacheManager.updateDB(localDeviceInformation, true, true, true);
            }
          }
        }
      }, new RMGetRuleErrorCallback()
      {
        public void onError(RMRulesError paramAnonymousRMRulesError)
        {
          SDKLogUtils.errorLog("DeviceListManager", "ERROR while refreshing Long press rule details. Error Message: " + paramAnonymousRMRulesError.getErrorMessage());
          if (paramAnonymousRMRulesError.getErrorCode() == 502)
          {
            int i = 0;
            Iterator localIterator1 = RMUserRules.INSTANCE.getRulesList().iterator();
            while (localIterator1.hasNext())
            {
              RMRule localRMRule = (RMRule)localIterator1.next();
              if ((localRMRule.getRulesType() == 2) && (((RMDBRule)localRMRule).getRuleType() == RMDBRuleType.LONG_PRESS))
              {
                RMLongPressRule localRMLongPressRule = (RMLongPressRule)localRMRule;
                Iterator localIterator2 = localRMLongPressRule.getRuleDeviceSet().iterator();
                while (localIterator2.hasNext())
                {
                  RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator2.next();
                  String str = localRMDBRuleDevice.getUiUdn();
                  SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails - Rule Device UDN: " + str + "; Long Press Device UDN: " + paramString);
                  if (localRMDBRuleDevice.getUiUdn().equalsIgnoreCase(paramString))
                  {
                    i = 1;
                    ArrayList localArrayList;
                    try
                    {
                      localDeviceInformation.setAttributeValue("longPressRuleState", String.valueOf(localRMLongPressRule.getState()));
                      localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", String.valueOf(localRMLongPressRule.getTargetDeviceSet().size()));
                      localDeviceInformation.setAttributeValue("longPressRuleAction", String.valueOf(localRMDBRuleDevice.getStartAction()));
                      localArrayList = new ArrayList();
                      Iterator localIterator3 = localRMLongPressRule.getTargetDeviceSet().iterator();
                      while (localIterator3.hasNext()) {
                        localArrayList.add(((RMTargetDevice)localIterator3.next()).getDeviceId());
                      }
                    }
                    catch (JSONException localJSONException2)
                    {
                      SDKLogUtils.errorLog("DeviceListManager", "JSONException while refreshing long press rule attributes: ", localJSONException2);
                    }
                    localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", TextUtils.join(",", localArrayList));
                    DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
                    DeviceListManager.this.sendNotification("update", "", paramString);
                    DeviceListManager.cacheManager.updateDB(localDeviceInformation, true, true, true);
                  }
                }
              }
            }
            if (i == 0) {
              SDKLogUtils.errorLog("DeviceListManager", "Resetting all Long press attributes for UDN: " + paramString);
            }
          }
          try
          {
            localDeviceInformation.setAttributeValue("longPressRuleState", "-1");
            localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", "0");
            localDeviceInformation.setAttributeValue("longPressRuleAction", "-1");
            localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", " ");
            DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
            DeviceListManager.this.sendNotification("update", "", paramString);
            DeviceListManager.cacheManager.updateDB(localDeviceInformation, true, true, true);
            return;
          }
          catch (JSONException localJSONException1)
          {
            SDKLogUtils.errorLog("DeviceListManager", "JSONException while resetting long press rule attributes: ", localJSONException1);
          }
        }
      });
      return;
    }
    SDKLogUtils.errorLog("DeviceListManager", "refreshLongPressRuleDetails: NO device information obj found for UDN: " + paramString);
  }
  
  public void refreshLongPressRuleDetails(String paramString, RMLongPressRule paramRMLongPressRule)
  {
    SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via Single Rule - TriggerDeviceUDN: " + paramString);
    DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null)
    {
      int i = 0;
      if (paramRMLongPressRule != null)
      {
        SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via Single Rule - Rule: " + paramRMLongPressRule.toString());
        Iterator localIterator1 = paramRMLongPressRule.getRuleDeviceSet().iterator();
        for (;;)
        {
          if (!localIterator1.hasNext()) {
            break label310;
          }
          localRMDBRuleDevice = (RMDBRuleDevice)localIterator1.next();
          str = localRMDBRuleDevice.getUiUdn();
          SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via Single Rule - Rule Device UDN: " + str);
          if (paramString.equals(str))
          {
            i = 1;
            try
            {
              localDeviceInformation.setAttributeValue("longPressRuleState", String.valueOf(paramRMLongPressRule.getState()));
              localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", String.valueOf(paramRMLongPressRule.getTargetDeviceSet().size()));
              localDeviceInformation.setAttributeValue("longPressRuleAction", String.valueOf(localRMDBRuleDevice.getStartAction()));
              localArrayList = new ArrayList();
              localIterator2 = paramRMLongPressRule.getTargetDeviceSet().iterator();
              while (localIterator2.hasNext()) {
                localArrayList.add(((RMTargetDevice)localIterator2.next()).getDeviceId());
              }
            }
            catch (JSONException localJSONException2)
            {
              SDKLogUtils.errorLog("DeviceListManager", "JSONException while refreshing long press rule attributes: ", localJSONException2);
            }
          }
        }
        localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", TextUtils.join(",", localArrayList));
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        sendNotification("update", "", str);
        cacheManager.updateDB(localDeviceInformation, true, true, true);
      }
      label310:
      while (i != 0)
      {
        RMDBRuleDevice localRMDBRuleDevice;
        String str;
        ArrayList localArrayList;
        Iterator localIterator2;
        return;
      }
      SDKLogUtils.errorLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via Single Rule - UDN MATCH NOT FOUND. Resetting all Long press attributes for UDN: " + paramString);
      try
      {
        localDeviceInformation.setAttributeValue("longPressRuleState", "-1");
        localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", "0");
        localDeviceInformation.setAttributeValue("longPressRuleAction", "-1");
        localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", " ");
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        sendNotification("update", "", paramString);
        cacheManager.updateDB(localDeviceInformation, true, true, true);
        return;
      }
      catch (JSONException localJSONException1)
      {
        SDKLogUtils.errorLog("DeviceListManager", "JSONException while resetting long press rule attributes: ", localJSONException1);
        return;
      }
    }
    SDKLogUtils.errorLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via Single Rule - NO device information obj found for UDN: " + paramString);
  }
  
  public void refreshLongPressRuleDetails(String paramString, List<RMRule> paramList)
  {
    SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RulesList - TriggerDeviceUDN: " + paramString + "; rules list count: " + paramList.size());
    DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null)
    {
      int i = 0;
      Iterator localIterator1 = paramList.iterator();
      break label154;
      label61:
      do
      {
        if (!localIterator1.hasNext()) {
          break;
        }
        localRMRule = (RMRule)localIterator1.next();
      } while ((localRMRule.getRulesType() != 2) || (((RMDBRule)localRMRule).getRuleType() != RMDBRuleType.LONG_PRESS));
      localRMLongPressRule = (RMLongPressRule)localRMRule;
      SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RulesList - Rule: " + localRMLongPressRule.toString());
      localIterator2 = localRMLongPressRule.getRuleDeviceSet().iterator();
      for (;;)
      {
        label154:
        if (!localIterator2.hasNext()) {
          break label61;
        }
        localRMDBRuleDevice = (RMDBRuleDevice)localIterator2.next();
        str = localRMDBRuleDevice.getUiUdn();
        SDKLogUtils.debugLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RulesList - Rule Device UDN: " + str);
        if (!paramString.equals(str)) {
          break;
        }
        i = 1;
        try
        {
          localDeviceInformation.setAttributeValue("longPressRuleState", String.valueOf(localRMLongPressRule.getState()));
          localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", String.valueOf(localRMLongPressRule.getTargetDeviceSet().size()));
          localDeviceInformation.setAttributeValue("longPressRuleAction", String.valueOf(localRMDBRuleDevice.getStartAction()));
          localArrayList = new ArrayList();
          localIterator3 = localRMLongPressRule.getTargetDeviceSet().iterator();
          while (localIterator3.hasNext()) {
            localArrayList.add(((RMTargetDevice)localIterator3.next()).getDeviceId());
          }
        }
        catch (JSONException localJSONException2)
        {
          SDKLogUtils.errorLog("DeviceListManager", "JSONException while refreshing long press rule attributes: ", localJSONException2);
        }
      }
      localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", TextUtils.join(",", localArrayList));
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      sendNotification("update", "", str);
      cacheManager.updateDB(localDeviceInformation, true, true, true);
      while (i != 0)
      {
        RMRule localRMRule;
        RMLongPressRule localRMLongPressRule;
        Iterator localIterator2;
        RMDBRuleDevice localRMDBRuleDevice;
        String str;
        ArrayList localArrayList;
        Iterator localIterator3;
        return;
      }
      SDKLogUtils.errorLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RulesList - UDN MATCH NOT FOUND. Resetting all Long press attributes for UDN: " + paramString);
      try
      {
        localDeviceInformation.setAttributeValue("longPressRuleState", "-1");
        localDeviceInformation.setAttributeValue("longPressRuleDeviceCnt", "0");
        localDeviceInformation.setAttributeValue("longPressRuleAction", "-1");
        localDeviceInformation.setAttributeValue("longPressRuleDeviceUdn", " ");
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        sendNotification("update", "", paramString);
        cacheManager.updateDB(localDeviceInformation, true, true, true);
        return;
      }
      catch (JSONException localJSONException1)
      {
        SDKLogUtils.errorLog("DeviceListManager", "JSONException while resetting long press rule attributes: ", localJSONException1);
        return;
      }
    }
    SDKLogUtils.errorLog("DeviceListManager", "refreshLongPressRuleDetails: Request for refresh via RulesList - NO device information obj found for UDN: " + paramString);
  }
  
  public void removeDeviceByUDN(String paramString)
  {
    removeDeviceByUDN(paramString, true, false);
  }
  
  public void removeDeviceByUDN(String paramString, boolean paramBoolean)
  {
    removeDeviceByUDN(paramString, paramBoolean, false);
  }
  
  public void removeDeviceByUDN(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    DeviceInformation localDeviceInformation = getDeviceInformationFromMemoryByUDN(paramString);
    SDKLogUtils.infoLog("DeviceListManager", "removeDeviceByUDN devInfo: " + localDeviceInformation + "; notify Listeners: " + paramBoolean1 + "; viaRemoteDisabled: " + paramBoolean2);
    if ((this.devicesArray != null) && (localDeviceInformation != null))
    {
      boolean bool1 = cacheManager.deleteDeviceFromDB(localDeviceInformation, true, true, true);
      boolean bool2 = this.devicesArray.deleteDeviceInformation(paramString);
      SDKLogUtils.infoLog("DeviceListManager", "removeDeviceByUDN dbResponse: " + bool1 + ", cacheResponse: " + bool2);
      if ((bool1) && (bool2))
      {
        SDKLogUtils.infoLog("DeviceListManager", "sending notification for " + paramString);
        this.devicesArray.removeDiscoveredDevice(paramString);
        if (paramBoolean1) {
          if (!paramBoolean2) {
            break label192;
          }
        }
      }
    }
    label192:
    for (String str = "remote_disabled";; str = "")
    {
      sendNotification("remove", str, paramString);
      return;
    }
  }
  
  public void removeGroup(String paramString1, String paramString2, int paramInt)
  {
    if (paramString2 != null)
    {
      String str = paramString2 + ":" + paramInt;
      SDKLogUtils.debugLog("DeviceListManager", "Deleting LEDGroup rule for " + str);
      RMRulesSDK.instance().getRules().deleteRulesFromDevice(str, new RMResetDeviceRulesSuccessCallback()new RMResetDeviceRulesErrorCallback
      {
        public void onAllDeviceRulesReset(String paramAnonymousString) {}
      }, new RMResetDeviceRulesErrorCallback()
      {
        public void onError(RMRulesError paramAnonymousRMRulesError)
        {
          SDKLogUtils.debugLog("DeviceListManager", " Error in Deleting Rule");
        }
      });
    }
    while (NetworkMode.isLocal())
    {
      LEDOperations localLEDOperations = new LEDOperations("RemoveGroup", paramString2, paramInt);
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localLEDOperations);
      return;
      SDKLogUtils.debugLog("DeviceListManager", " UDN is invalid");
    }
    SDKLogUtils.infoLog("DeviceListManager", "calling CloudRequestRemoveGroup: groupID " + paramInt);
    new CloudRequestManager(context).makeRequest(new CloudRequestRemoveGroup(context, paramString2, Integer.toString(paramInt)));
  }
  
  public void removeNotificationListener(NotificationListenerDLM paramNotificationListenerDLM)
  {
    if (paramNotificationListenerDLM != null) {
      this.listenersSet.remove(paramNotificationListenerDLM);
    }
  }
  
  public boolean resetAutoThreshold(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
      return false;
    }
    if (NetworkMode.isLocal()) {
      WeMoThreadPoolHandler.executeInBackground(new ResetThresholdRunnable(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, "resetAutoThreshold", this, paramString));
    }
    for (;;)
    {
      return true;
      DeviceInformation localDeviceInformation = getDeviceInformationFromDevicesArray(paramString);
      if (localDeviceInformation == null) {
        return false;
      }
      JSONObject localJSONObject = new JSONObject();
      try
      {
        int i = 2000 + Integer.valueOf(localDeviceInformation.getAttributeValue("powerNow")).intValue();
        String str = String.valueOf(i);
        SDKLogUtils.debugLog("DeviceListManager", "AUTO RESET THRESHOLD (REMOTE): New Threshold calculated value: " + i);
        localJSONObject.put(JSONConstants.INSIGHT_POWER_THRESHOLD, str);
        CloudRequestAutoResetPowerThreshold localCloudRequestAutoResetPowerThreshold = new CloudRequestAutoResetPowerThreshold(this, localDeviceInformation, "SetPowerThreshold", localJSONObject);
        localCloudRequestAutoResetPowerThreshold.setOnCloudRequestCompletedListener(new ResetThresholdRemoteListener(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, str));
        new CloudRequestManager(context).makeRequest(localCloudRequestAutoResetPowerThreshold);
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "JSONException while setting auto power threshold via REMOTE");
      }
    }
    return false;
  }
  
  public boolean resetDeviceAll(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if (paramString == null) {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
    }
    while (!NetworkMode.isLocal()) {
      return false;
    }
    ResetAllRunnable localResetAllRunnable = new ResetAllRunnable(this, paramPluginResultErrorCallback, paramPluginResultSuccessCallback, paramString, paramJSONObject1, paramJSONObject2, this.mSharePreference);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(localResetAllRunnable);
    return true;
  }
  
  public boolean resetFNIconRules(PluginResultErrorCallback paramPluginResultErrorCallback, final PluginResultSuccessCallback paramPluginResultSuccessCallback, final String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    boolean bool1 = false;
    if (paramString == null)
    {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
      bool1 = false;
    }
    try
    {
      boolean bool2 = NetworkMode.isLocal();
      bool1 = false;
      if (bool2)
      {
        CountDownLatch localCountDownLatch = new CountDownLatch(1);
        bool1 = true;
        SDKLogUtils.infoLog("DeviceListManager", "Ready to set device properties: " + paramJSONObject1 + ", stateData" + paramJSONObject2);
        ResetFNIconRulesRunnable localResetFNIconRulesRunnable = new ResetFNIconRulesRunnable(this, localCountDownLatch, paramString, paramJSONObject1, paramJSONObject2);
        WeMoThreadPoolHandler.getInstance().executeViaBackground(localResetFNIconRulesRunnable);
        localCountDownLatch.await();
        SDKLogUtils.debugLog("DeviceListManager", "resetFNIconRules: ResetFNIconRulesRunnable Async Task is complete.");
        if (paramPluginResultSuccessCallback != null) {}
        try
        {
          paramPluginResultSuccessCallback.onSuccess(prepareDeviceResetResponse("reset_fn_icon_rules", paramString, "true").toString());
          sendNotification("reset_fn_icon_rules", bool1 + "", paramString);
          if (!SDKLogUtils.isDebug()) {
            break label532;
          }
          new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
          return bool1;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            SDKLogUtils.errorLog("DeviceListManager", "exception in RESET_FN_ICON_RULES: ", localJSONException);
            if (paramPluginResultErrorCallback != null) {
              paramPluginResultErrorCallback.onError(localJSONException.getMessage());
            }
          }
        }
      }
      str1 = "";
    }
    catch (Exception localException1)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in resetFNIconRules ex:" + localException1);
      return bool1;
    }
    try
    {
      String str1;
      if (paramJSONObject2.has("friendlyName")) {
        str1 = paramJSONObject2.getString("friendlyName");
      }
      CloudRequestManager localCloudRequestManager = new CloudRequestManager(context);
      DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
      if (isZigbee(paramString))
      {
        JSONObject localJSONObject = getBridgeDataFromBridgeUDN(localDeviceInformation.getBridgeUDN());
        SDKLogUtils.infoLog("DeviceListManager", "bridgeData: " + localJSONObject);
        localCloudRequestManager.makeRequest(new CloudRequestResetFNIRulesZigbee(this, paramString, localDeviceInformation.getPluginID(), localDeviceInformation.getMAC(), localJSONObject, str1, new OnRequestCompleteListener()
        {
          public void onRequestComplete(boolean paramAnonymousBoolean, int paramAnonymousInt, byte[] paramAnonymousArrayOfByte)
          {
            if (paramPluginResultSuccessCallback != null) {}
            try
            {
              JSONObject localJSONObject = DeviceListManager.this.prepareDeviceResetResponse("reset_fn_icon_rules", paramString, "true");
              paramPluginResultSuccessCallback.onSuccess(localJSONObject.toString());
              return;
            }
            catch (JSONException localJSONException)
            {
              SDKLogUtils.errorLog("DeviceListManager", "JSONException while sending response for CloudRequestResetFNIRulesZigbee: ", localJSONException);
            }
          }
        }));
      }
      else
      {
        String str2 = "";
        if (paramJSONObject2.has("modelCode")) {
          str2 = paramJSONObject2.getString("modelCode");
        }
        Context localContext = context;
        String str3 = localDeviceInformation.getPluginID();
        String str4 = localDeviceInformation.getMAC();
        OnRequestCompleteListener local24 = new OnRequestCompleteListener()
        {
          public void onRequestComplete(boolean paramAnonymousBoolean, int paramAnonymousInt, byte[] paramAnonymousArrayOfByte)
          {
            if (paramPluginResultSuccessCallback != null) {}
            try
            {
              JSONObject localJSONObject = DeviceListManager.this.prepareDeviceResetResponse("reset_fn_icon_rules", paramString, "true");
              paramPluginResultSuccessCallback.onSuccess(localJSONObject.toString());
              return;
            }
            catch (JSONException localJSONException)
            {
              SDKLogUtils.errorLog("DeviceListManager", "JSONException while sending response for CloudRequestResetFNIRules: ", localJSONException);
            }
          }
        };
        int[] arrayOfInt = { 1 };
        localCloudRequestManager.makeRequest(new CloudRequestResetFNIRules(this, localContext, paramString, str3, str4, str1, str2, local24, arrayOfInt));
      }
    }
    catch (Exception localException2)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Error in remote for resetFNIconRules ex" + localException2);
    }
    label532:
    return bool1;
    return true;
  }
  
  public void resetHomeNetwork()
  {
    SDKLogUtils.infoLog("DeviceListManager", "Home Network has been changed. Removing all devices and initializing ControlPoint.");
    stopCloudPeriodicUpdate();
    cacheManager.deleteAllDeviceFromDB(true, true, true);
    this.devicesArray.clearAll();
    initControlPoint();
    if (SDKLogUtils.isDebug()) {
      new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
    }
  }
  
  public void resetInsightDrawerState()
  {
    SharePreferences.resetInsightDrawerStates(context);
  }
  
  public void resetOfflineLEDCount()
  {
    try
    {
      SDKLogUtils.debugLog("DeviceListManager", "LED Status Tracking: Offline LED Count RESET");
      this.offlineLEDCount = 0;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean resetPlugin(String paramString1, String paramString2)
  {
    try
    {
      Action localAction = getUpnpControl().getDevice(paramString1).getAction("ReSetup");
      localAction.setArgumentValue("Reset", paramString2);
      String str = localAction.postControlAction();
      SDKLogUtils.verboseLog("DeviceListManager", "Response : reset option : UDN : " + paramString1 + " : " + paramString2 + " : " + str);
      if (TextUtils.isEmpty(str)) {
        return false;
      }
      boolean bool = str.contains(UpnpConstants.ERROR);
      if (!bool) {
        return true;
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in resetPlugin ex:", localException);
    }
    return false;
  }
  
  public boolean resetThreshold(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
      return false;
    }
    if (NetworkMode.isLocal()) {
      WeMoThreadPoolHandler.executeInBackground(new ResetThresholdRunnable(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, "resetThreshold", this, paramString));
    }
    for (;;)
    {
      return true;
      DeviceInformation localDeviceInformation = getDeviceInformationFromDevicesArray(paramString);
      JSONObject localJSONObject = new JSONObject();
      try
      {
        localJSONObject.put(JSONConstants.INSIGHT_POWER_THRESHOLD, "8000");
        CloudRequestResetPowerThreshold localCloudRequestResetPowerThreshold = new CloudRequestResetPowerThreshold(this, localDeviceInformation, "SetPowerThreshold", localJSONObject);
        localCloudRequestResetPowerThreshold.setOnCloudRequestCompletedListener(new ResetThresholdRemoteListener(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, "8000"));
        new CloudRequestManager(context).makeRequest(localCloudRequestResetPowerThreshold);
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "JSONException while setting default power threshold to 8000");
      }
    }
    return false;
  }
  
  public boolean resetUsageData(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "udn empty or null resetUsageData udn:" + paramString);
      return false;
    }
    DeviceInformation localDeviceInformation = getDeviceInformationFromDBByUDN(paramString);
    try
    {
      if (NetworkMode.isLocal())
      {
        ResetUsageDataRunnable localResetUsageDataRunnable = new ResetUsageDataRunnable(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, this, paramString);
        WeMoThreadPoolHandler.getInstance().executeViaBackground(localResetUsageDataRunnable);
      }
      else
      {
        new CloudRequestManager(context).makeRequest(new CloudRequestResetUsageData(this, paramString, localDeviceInformation.getPluginID(), localDeviceInformation.getMAC(), new Object[] { "reset_usage_data" }));
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in ResetUsageData ex: ", localException);
      bool = false;
      break label136;
    }
    boolean bool = true;
    label136:
    return bool;
  }
  
  public boolean resetWiFi(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    boolean bool1 = NetworkMode.isLocal();
    boolean bool2 = false;
    if (bool1) {}
    try
    {
      if (TextUtils.isEmpty(paramString)) {
        SDKLogUtils.errorLog("DeviceListManager", "missing UDN resetWiFi udn: " + paramString);
      }
      ResetWifiRunnable localResetWifiRunnable = new ResetWifiRunnable(paramPluginResultErrorCallback, paramPluginResultSuccessCallback, this, paramString);
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localResetWifiRunnable);
      bool2 = true;
      return bool2;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in resetWiFi ex: " + localException);
      localException.printStackTrace();
    }
    return false;
  }
  
  public void restartCloudPeriodicUpdate()
  {
    SDKLogUtils.debugLog("DeviceListManager", "RESTARTING CLOUD PERIODIC UPDATE");
    if (this.updateTimer != null) {
      this.updateTimer.cancel();
    }
    if (!this.mNetworkUtils.isHomeNetwork())
    {
      this.updateTimer = new Timer();
      this.updateTimer.scheduleAtFixedRate(new TimerTask()
      {
        public void run()
        {
          DeviceListManager.this.makeCloudRequestForUpdateDeviceList();
        }
      }, 0L, 60000L);
    }
  }
  
  public Bitmap rotateCameraIcon(Uri paramUri, Bitmap paramBitmap)
  {
    if ((paramUri != null) && (paramBitmap != null)) {}
    for (;;)
    {
      try
      {
        switch (new ExifInterface(paramUri.getPath()).getAttributeInt("Orientation", 1))
        {
        case 6: 
          if (i != 0)
          {
            Matrix localMatrix = new Matrix();
            localMatrix.setRotate(i);
            int j = paramBitmap.getWidth();
            int k = paramBitmap.getHeight();
            Bitmap localBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, j, k, localMatrix, true);
            paramBitmap = localBitmap;
          }
          return paramBitmap;
        }
      }
      catch (IOException localIOException)
      {
        SDKLogUtils.errorLog("DeviceListManager", "rotateCameraIcon: IOException while creating ExifInterface: ", localIOException);
        return paramBitmap;
      }
      int i = 90;
      continue;
      i = 180;
      continue;
      i = 270;
      continue;
      i = 0;
    }
  }
  
  public Bitmap rotateGalleryIcon(Uri paramUri, Bitmap paramBitmap)
  {
    ContentResolver localContentResolver;
    if (paramUri != null)
    {
      localContentResolver = context.getContentResolver();
      if (paramBitmap != null) {}
    }
    try
    {
      Bitmap localBitmap = MediaStore.Images.Media.getBitmap(localContentResolver, paramUri);
      paramBitmap = localBitmap;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;)
      {
        Cursor localCursor;
        int i;
        boolean bool;
        Matrix localMatrix;
        int j;
        int k;
        SDKLogUtils.errorLog("DeviceListManager", "rotateGalleryIcon: FileNotFoundException while creating bitmap: ", localFileNotFoundException);
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("DeviceListManager", "rotateGalleryIcon: IOException while creating bitmap: ", localIOException);
      }
    }
    if (paramBitmap != null)
    {
      localCursor = localContentResolver.query(paramUri, new String[] { "orientation" }, null, null, null);
      i = 0;
      if (localCursor != null)
      {
        bool = localCursor.moveToFirst();
        i = 0;
        if (bool)
        {
          i = localCursor.getInt(localCursor.getColumnIndex("orientation"));
          SDKLogUtils.debugLog("DeviceListManager", "rotateGalleryIcon: Image Orientation " + i);
        }
      }
      if (i != 0)
      {
        localMatrix = new Matrix();
        localMatrix.setRotate(i);
        j = paramBitmap.getWidth();
        k = paramBitmap.getHeight();
        paramBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, j, k, localMatrix, true);
      }
    }
    return paramBitmap;
  }
  
  public String saveEditedIcon(Bitmap paramBitmap)
  {
    String str = "";
    if (paramBitmap != null) {
      str = FileStorage.getInstance(context).storeEditedIcon(paramBitmap);
    }
    return str;
  }
  
  public void sendNotification(String paramString1, String paramString2, String paramString3)
  {
    Iterator localIterator;
    if ((this.listenersSet != null) && (this.listenersSet.size() > 0)) {
      localIterator = this.listenersSet.iterator();
    }
    while (localIterator.hasNext())
    {
      NotificationListenerDLM localNotificationListenerDLM = (NotificationListenerDLM)localIterator.next();
      if (localNotificationListenerDLM != null)
      {
        SDKLogUtils.infoLog("Listeners", "in sendNotification :" + paramString2 + " " + paramString3);
        localNotificationListenerDLM.onNotify(paramString1, paramString2, paramString3);
        continue;
        SDKLogUtils.infoLog("Listeners", "listenersSet is empty cannot send notification for udn:" + paramString3 + " event:" + paramString1);
      }
    }
  }
  
  public void setAndAddNewLocationCallback(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    if (paramString1 != null) {}
    try
    {
      if (!paramString1.isEmpty())
      {
        SDKLogUtils.infoLog("DeviceListManager", "setAndAddNewLocation success homeId: " + paramString1 + " arpMac: " + paramString2 + " ssid: " + paramString3 + " locationName: " + paramString4);
        Location localLocation1 = new Location(paramString1, paramString4);
        HashSet localHashSet1 = new HashSet();
        localHashSet1.add(paramString3);
        localLocation1.setSsids(localHashSet1);
        HashSet localHashSet2 = new HashSet();
        localHashSet2.add(paramString2);
        localLocation1.setArpMacs(localHashSet2);
        if ((this.mNetworkUtils.getCurrentLocationHomeId() == null) || (this.mNetworkUtils.getCurrentLocationHomeId().length() == 0))
        {
          Location localLocation2 = getDefaultLocation();
          SDKLogUtils.infoLog("DeviceListManager", "setAndAddNewLocation adding default location: " + localLocation2);
          if (localLocation2 != null) {
            addLocationDB(localLocation2);
          }
        }
        addLocationDB(localLocation1);
        this.mNetworkUtils.setCurrentLocationHomeId(paramString1);
        NetworkMode.setLocal(true);
        sendNotification("location_creation_success", "", paramString1);
        return;
      }
      SDKLogUtils.infoLog("DeviceListManager", "setAndAddNewLocationCallback failed");
      sendNotification("location_creation_failed", "", paramString2);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    SDKLogUtils.infoLog("DeviceListManager", "in setArguments::" + paramArrayOfString1.length + "::values len:" + paramArrayOfString2.length);
    if ((paramAction != null) && (paramArrayOfString1 != null) && (paramArrayOfString2 != null)) {
      for (int i = 0; i < paramArrayOfString1.length; i++)
      {
        SDKLogUtils.infoLog("DeviceListManager", "setArguments key:" + paramArrayOfString1[i] + "::values:" + paramArrayOfString2[i]);
        paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      }
    }
  }
  
  public void setArpMacSSIDsFromCloud(JSONArray paramJSONArray1, JSONArray paramJSONArray2)
  {
    SDKLogUtils.infoLog("DeviceListManager", "ACTION_SET_SSID ssid: " + paramJSONArray1 + " arpMac: " + paramJSONArray2);
    HashSet localHashSet1 = new HashSet();
    int i = 0;
    for (;;)
    {
      if (i < paramJSONArray1.length()) {
        try
        {
          localHashSet1.add(paramJSONArray1.getString(i));
          i++;
        }
        catch (JSONException localJSONException2)
        {
          for (;;)
          {
            SDKLogUtils.errorLog("DeviceListManager", " :: Exception during homeSSID adding :: exception is ", localJSONException2);
          }
        }
      }
    }
    Set localSet1 = this.mNetworkUtils.mergeHomeSsid(localHashSet1);
    SDKLogUtils.infoLog("DeviceListManager", "setArpMacSSIDsFromCloud: groupSSid: " + localSet1);
    this.mSharePreference.setHomeSSIDs(localSet1);
    if (paramJSONArray2.length() > 0)
    {
      HashSet localHashSet2 = new HashSet();
      int j = 0;
      for (;;)
      {
        if (j < paramJSONArray2.length()) {
          try
          {
            localHashSet2.add(paramJSONArray2.getString(j));
            j++;
          }
          catch (JSONException localJSONException1)
          {
            for (;;)
            {
              SDKLogUtils.errorLog("DeviceListManager", " :: Exception during arpMac adding :: exception is ", localJSONException1);
            }
          }
        }
      }
      Set localSet2 = this.mSharePreference.getARPMacs();
      Set localSet3 = this.mNetworkUtils.mergeArpMacs(localSet2, localHashSet2);
      SDKLogUtils.infoLog("DeviceListManager", "setArpMacSSIDsFromCloud: groupArpMacs: " + localSet3.toString());
      this.mSharePreference.setARPMacs(localSet3);
    }
  }
  
  public void setAttributeState(String paramString, JSONObject paramJSONObject)
  {
    DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null) {}
    try
    {
      Device localDevice = localDeviceInformation.getDevice();
      if (localDevice == null) {
        localDevice = getUpnpControl().getDevice(localDeviceInformation.getUDN());
      }
      Log.v("DeviceListManager", "wemodevice.getDevice()::" + localDeviceInformation.getDevice() + " UDN: " + localDeviceInformation.getUDN() + " d: " + localDevice);
      if (!isSmart(localDevice.getDeviceType())) {
        new String[1][0] = createAttributeList(paramJSONObject, localDeviceInformation);
      }
      SetDeviceAttributeRunnable localSetDeviceAttributeRunnable = new SetDeviceAttributeRunnable(context, paramString, paramJSONObject);
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceAttributeRunnable);
      return;
    }
    catch (Exception localException)
    {
      Log.e("DeviceListManager", "Exception setAttributeState:: " + localException.toString());
      localException.printStackTrace();
    }
  }
  
  public void setBinaryState(String paramString1, String paramString2)
  {
    SDKLogUtils.infoLog("DeviceListManager", "setBinaryState: network mode:: " + NetworkMode.isLocal());
    if (NetworkMode.isLocal())
    {
      DeviceInformation localDeviceInformation2 = getDevice(paramString2);
      if (localDeviceInformation2 != null)
      {
        Context localContext = context;
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = paramString1;
        arrayOfObject[1] = localDeviceInformation2.getUDN();
        SetDeviceStateRunnable localSetDeviceStateRunnable = new SetDeviceStateRunnable(localContext, arrayOfObject);
        WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceStateRunnable);
      }
      return;
    }
    DeviceInformation localDeviceInformation1 = getDeviceFromDBByUDN(paramString2, false, true, false);
    makeStateChangeRequest(localDeviceInformation1.getUDN(), localDeviceInformation1.getPluginID(), localDeviceInformation1.getMAC(), paramString1);
  }
  
  public boolean setBlobStorage(String paramString, JSONObject paramJSONObject)
  {
    boolean bool = false;
    if (TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.errorLog("DeviceListManager", "missing UDN udn: " + paramString);
      return false;
    }
    try
    {
      if (NetworkMode.isLocal())
      {
        WeMoThreadPoolHandler.executeInBackground(new BlobStorageRunnable("setBlobStorage", new GetSetBlobStorageCallback(context), this, paramString, paramJSONObject, getUpnpControl().getDevice(paramString)));
        bool = true;
      }
      else
      {
        DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
        CloudRequestManager localCloudRequestManager = new CloudRequestManager(context);
        localCloudRequestManager.makeRequest(new CloudRequestGetSetBlobStorage(this, context, paramString, localDeviceInformation.getPluginID(), localDeviceInformation.getMAC(), "setBlobStorage", paramJSONObject));
        bool = false;
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in getBlobStorage udn: " + paramString);
    }
    return bool;
  }
  
  public void setBulbType(final String paramString1, final String paramString2, final SetBulbTypeSuccessCallback paramSetBulbTypeSuccessCallback, final SetBulbTypeErrorCallback paramSetBulbTypeErrorCallback)
  {
    if (NetworkMode.isLocal())
    {
      Device localDevice = getUpnpControl().getDevice(paramString1);
      if (localDevice == null) {
        localDevice = getDevice(paramString1).getDevice();
      }
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("SetBulbType");
        if (localAction != null)
        {
          localAction.setArgumentValue("bulbType", paramString2);
          ControlActionHandler.newInstance().postControlAction(localAction, new ControlActionErrorCallback()new ControlActionSuccessCallback
          {
            public void onActionError(Exception paramAnonymousException)
            {
              SDKLogUtils.errorLog("DeviceListManager", "setBulbType: Exception during PostControlAction: ", paramAnonymousException);
              if (paramSetBulbTypeErrorCallback != null) {
                paramSetBulbTypeErrorCallback.onSetBulbTypeFailed(paramAnonymousException.getMessage());
              }
            }
          }, new ControlActionSuccessCallback()
          {
            public void onActionSuccess(String paramAnonymousString)
            {
              SDKLogUtils.errorLog("DeviceListManager", "setBulbType: Response from FW: " + paramAnonymousString);
              DeviceInformation localDeviceInformation;
              if (!TextUtils.isEmpty(paramAnonymousString))
              {
                SetBulbTypeResponse localSetBulbTypeResponse = new SetBulbTypeResponseParser().parseResponse(paramAnonymousString);
                if (paramSetBulbTypeSuccessCallback != null) {
                  paramSetBulbTypeSuccessCallback.onBulbTypeSet(localSetBulbTypeResponse.getMinLevel(), localSetBulbTypeResponse.getMaxLevel(), localSetBulbTypeResponse.getTurnOnLevel());
                }
                localDeviceInformation = DeviceListManager.this.getDevice(paramString1);
                if (localDeviceInformation == null) {}
              }
              do
              {
                try
                {
                  localDeviceInformation.setAttributeValue("bulbType", paramString2);
                  DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
                  DeviceListManager.cacheManager.updateDB(localDeviceInformation, false, false, true);
                  return;
                }
                catch (JSONException localJSONException)
                {
                  SDKLogUtils.errorLog("DeviceListManager", "JSONException while setting bulb type in Devices Array");
                  return;
                }
                SDKLogUtils.errorLog("DeviceListManager", "setBulbType: Action Failed.");
              } while (paramSetBulbTypeErrorCallback == null);
              paramSetBulbTypeErrorCallback.onSetBulbTypeFailed("Action failed. Response is empty.");
            }
          });
        }
      }
    }
    do
    {
      do
      {
        do
        {
          return;
          SDKLogUtils.errorLog("DeviceListManager", "setBulbType: SetBulbType ACTION IS NULL");
        } while (paramSetBulbTypeErrorCallback == null);
        paramSetBulbTypeErrorCallback.onSetBulbTypeFailed("setBulbType: SetBulbType ACTION IS NULL");
        return;
        SDKLogUtils.errorLog("DeviceListManager", "setBulbType: Control Point object is NULL");
      } while (paramSetBulbTypeErrorCallback == null);
      paramSetBulbTypeErrorCallback.onSetBulbTypeFailed("setBulbType: Control Point object is NULL");
      return;
      SDKLogUtils.errorLog("DeviceListManager", "setBulbType: SetBulbType API not suppoted in REMOTE mode.");
    } while (paramSetBulbTypeErrorCallback == null);
    paramSetBulbTypeErrorCallback.onSetBulbTypeFailed("setBulbType: SetBulbType API not suppoted in REMOTE mode.");
  }
  
  public void setCallbackListener(DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity)
  {
    this.mActivity = paramDeviceListManagerCallbacksActivity;
    this.devicesArray.setCallbackListener(this.mActivity);
  }
  
  public void setCurrentSSID(String paramString)
  {
    this.currentSSID = paramString;
  }
  
  public void setDataStoreOnCloud(SetAndGetActionCallBack paramSetAndGetActionCallBack, String paramString1, String paramString2)
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: setDataStoreOnCloud :: is called");
    DeviceInformation localDeviceInformation = getDeviceInformationByUDNFromMemory(paramString1);
    if (localDeviceInformation != null)
    {
      String str1 = localDeviceInformation.getPluginID();
      String str2 = localDeviceInformation.getMAC();
      SDKLogUtils.infoLog("DeviceListManager", "pluginID:: " + str1 + " mac:: " + str2);
      if ((!TextUtils.isEmpty(str1)) && (!TextUtils.isEmpty(str2)))
      {
        new CloudRequestManager(context).makeRequest(new CloudRequestSetDataStoreOnLink(paramSetAndGetActionCallBack, paramString1, str1, str2, paramString2));
        return;
      }
      SDKLogUtils.infoLog("DeviceListManager", "Plugin and mac is empty");
      paramSetAndGetActionCallBack.onError();
      return;
    }
    SDKLogUtils.infoLog("DeviceListManager", "No device Information is found");
    paramSetAndGetActionCallBack.onError();
  }
  
  public void setDeviceInactive(String paramString)
  {
    this.devicesArray.setDeviceInactive(paramString);
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
    if (localDeviceInformation != null) {
      cacheManager.updateDeviceFromDB(localDeviceInformation, false, false, true);
    }
  }
  
  public void setDeviceInformationToDevicesArray(DeviceInformation paramDeviceInformation, boolean paramBoolean)
  {
    this.devicesArray.updateDeviceCache(paramDeviceInformation, paramBoolean);
    cacheManager.updateDB(paramDeviceInformation, false, true, true);
  }
  
  public void setDeviceInformationToDevicesArrayLocal(DeviceInformation paramDeviceInformation, boolean paramBoolean)
  {
    this.devicesArray.updateDeviceCache(paramDeviceInformation, paramBoolean);
    cacheManager.updateDB(paramDeviceInformation, true, false, true);
  }
  
  public void setDeviceListFromCloud(ArrayList<DeviceInformation> paramArrayList, String paramString1, String paramString2, boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      SDKLogUtils.infoLog("DeviceListManager", "DEVICELIST is NULL");
      Iterator localIterator2 = getDeviceInformation().iterator();
      while (localIterator2.hasNext())
      {
        DeviceInformation localDeviceInformation4 = (DeviceInformation)localIterator2.next();
        localDeviceInformation4.setIsDiscovered(false);
        localDeviceInformation4.setInActive(1);
        cacheManager.updateDB(localDeviceInformation4, false, false, true);
        sendNotification("update", "", localDeviceInformation4.getUDN());
      }
    }
    SDKLogUtils.infoLog("DeviceListManager", "XML IS ::" + paramString2);
    JSONArray localJSONArray1 = CloudRequestUpdateDeviceList.parseResponseFromCloudByTagName(paramString2, "groupSSIDs", "ssid");
    JSONArray localJSONArray2 = CloudRequestUpdateDeviceList.parseResponseFromCloudByTagName(paramString2, "groupArpMacs", "arpMac");
    SDKLogUtils.infoLog("DeviceListManager", "setDeviceListFromCloud: ssidArray: " + localJSONArray1 + " arpArray: " + localJSONArray2);
    if ((localJSONArray1 != null) && (localJSONArray2 != null)) {
      setArpMacSSIDsFromCloud(localJSONArray1, localJSONArray2);
    }
    Iterator localIterator1 = paramArrayList.iterator();
    for (;;)
    {
      if (localIterator1.hasNext())
      {
        DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
        SDKLogUtils.infoLog("RemoteMode:", " adding dev " + localDeviceInformation1.getUDN() + "  " + localDeviceInformation1.getIsDiscovered());
        JSONObject localJSONObject1;
        if (IsDevice.Crockpot(localDeviceInformation1.getUDN()))
        {
          localJSONObject1 = this.devicesArray.getDeviceInformation(localDeviceInformation1.getUDN()).getAttributeList();
          Log.i("DeviceListManager", "attributeList" + localJSONObject1);
        }
        try
        {
          JSONObject localJSONObject2 = localJSONObject1.getJSONObject("mode");
          localJSONObject2.put("value", localDeviceInformation1.getState());
          localJSONObject1.put("mode", localJSONObject2);
          localDeviceInformation1.setAttributeList(localJSONObject1);
          this.devicesArray.updateDeviceCache(localDeviceInformation1, localDeviceInformation1.getNeedIconUpdate());
          this.devicesArray.setDeviceDiscovered(localDeviceInformation1.getUDN(), true);
          DeviceInformation localDeviceInformation2 = getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, true, false);
          if (localDeviceInformation2 != null)
          {
            localDeviceInformation1.setID(localDeviceInformation2.getID());
            cacheManager.updateDB(localDeviceInformation1, false, true, true);
            DeviceInformation localDeviceInformation3 = getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), false, false, true);
            if (localDeviceInformation3 == null) {
              break label598;
            }
            localDeviceInformation1.setID(localDeviceInformation3.getID());
            cacheManager.updateDB(localDeviceInformation1, false, false, true);
            SDKLogUtils.infoLog("RemoteMode:", " sending update notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
            sendNotification("update", "", localDeviceInformation1.getUDN());
            firstRemoteCall = false;
            new Thread(new Runnable()
            {
              public void run()
              {
                if (DeviceListManager.this.mControlPoint != null) {
                  DeviceListManager.this.mControlPoint.finalizeCP();
                }
              }
            }).start();
          }
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
            continue;
            cacheManager.addDeviceToDB(localDeviceInformation1, false, true, false);
            if (getDeviceFromDBByUDN(localDeviceInformation1.getUDN(), true, false, false) == null)
            {
              addDeviceWithOnlyUDNToLocalOrRemoteTable(localDeviceInformation1.getUDN(), true, false);
              continue;
              label598:
              cacheManager.addDeviceToDB(localDeviceInformation1, false, false, true);
              SDKLogUtils.infoLog("RemoteMode:", " sending add notification " + localDeviceInformation1.getUDN() + " name:" + localDeviceInformation1.getFriendlyName());
              sendNotification("add", "", localDeviceInformation1.getUDN());
            }
          }
        }
      }
    }
    new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
  }
  
  public void setDeviceNonReachibility(boolean paramBoolean)
  {
    this.deviceNotReachable = paramBoolean;
  }
  
  public void setDevicePairingStatus(boolean paramBoolean)
  {
    if (this.networkStateListener != null) {
      this.networkStateListener.setDevicePairingInProgress(paramBoolean);
    }
  }
  
  public void setDevicePresetCloud(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack)
    throws JSONException
  {
    SDKLogUtils.infoLog("DeviceListManager", " :: setDevicePresetCloud :: is called");
    if ((paramJSONArray != null) && (paramSetAndGetActionCallBack != null))
    {
      new CloudRequestManager(context).makeRequest(new CloudRequestForSetDevicePreset(paramSetAndGetActionCallBack, paramJSONArray));
      return;
    }
    SDKLogUtils.infoLog("DeviceListManager", "JSONArray or SetAndGetActionCallBack is null ");
    paramSetAndGetActionCallBack.onError();
  }
  
  public void setDeviceProperties(String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    DeviceInformation localDeviceInformation1 = getDeviceInformationFromDevicesArray(paramString);
    if (localDeviceInformation1 != null)
    {
      for (;;)
      {
        try
        {
          if (paramJSONObject2.getString("icon").trim().length() != 0)
          {
            str1 = paramJSONObject2.getString("icon");
            SDKLogUtils.debugLog("DeviceListManager", "icon file path: " + str1);
            if (!TextUtils.isEmpty(str1))
            {
              if (!str1.startsWith("file:///android_asset/")) {
                continue;
              }
              int m = "file:///android_asset/".length();
              String str9 = str1.substring(m);
              Bitmap localBitmap2 = BitmapFactory.decodeStream(context.getAssets().open(str9));
              localBitmap1 = localBitmap2;
              label119:
              if (localBitmap1 == null) {}
            }
          }
        }
        catch (IOException localIOException)
        {
          String str1;
          Bitmap localBitmap1;
          int k;
          int i;
          FileStorage localFileStorage;
          String str4;
          String str5;
          DeviceInformation localDeviceInformation2;
          SetDevicePropertiesRunnable localSetDevicePropertiesRunnable;
          SDKLogUtils.errorLog("DeviceListManager", "IOException in setDeviceProperties: ", localIOException);
          return;
          SDKLogUtils.errorLog("DeviceListManager", "setDeviceProperties(): ERROR - Remote access is not enabled.");
          continue;
        }
        catch (JSONException localJSONException)
        {
          label319:
          SDKLogUtils.errorLog("DeviceListManager", "JSONException in setDeviceProperties: ", localJSONException);
          return;
        }
        try
        {
          k = Integer.valueOf(localDeviceInformation1.getIconVersion()).intValue();
          i = k + 1;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          SDKLogUtils.errorLog("DeviceListManager", "NumberFormatException while incrementing icon version for Device. Possible LED so ignored: ", localNumberFormatException);
          i = 0;
        }
      }
      localFileStorage = FileStorage.getInstance(context);
      str4 = localDeviceInformation1.getMAC();
      str5 = String.valueOf(i);
      String str6 = localFileStorage.storeRemoteIcon(localBitmap1, str4, str5);
      paramJSONObject2.put("icon", str6);
      SDKLogUtils.debugLog("DeviceListManager", "setDeviceProperties(): isZigbee device: " + String.valueOf(isZigbee(paramString)));
      if (isZigbee(paramString)) {
        if (this.remoteAccessManager.isRemoteEnabled())
        {
          new CloudRequestManager(context).makeMultiPartRequest(new CloudRequestSetLEDIcon(context, paramString, str6));
          if (NetworkMode.isLocal())
          {
            localDeviceInformation2 = DevicesArray.getInstance(context).getDeviceInformation(paramString);
            if (localDeviceInformation2 == null) {
              break label484;
            }
            localDeviceInformation2.setIcon(str6);
            DevicesArray.getInstance(context).addOrUpdateDeviceInformation(localDeviceInformation2);
            CacheManager.getInstance(context).updateDB(localDeviceInformation2, false, false, true);
          }
          if (!NetworkMode.isLocal()) {
            break label665;
          }
          SDKLogUtils.infoLog("DeviceListManager", "Ready to set device properties: " + paramJSONObject2.toString());
          localSetDevicePropertiesRunnable = new SetDevicePropertiesRunnable(context, paramString, paramJSONObject2, paramJSONObject1);
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDevicePropertiesRunnable);
        }
      }
      for (;;)
      {
        FileStorage.getInstance(context).emptyTempIconFolder();
        return;
        boolean bool = isZigbee(paramString);
        str1 = null;
        if (!bool) {
          break;
        }
        str1 = WemoUtils.getZigbeeIcon(localDeviceInformation1.getManufacturerName(), localDeviceInformation1.getModelCode());
        break;
        localBitmap1 = BitmapFactory.decodeFile(str1);
        break label119;
        label484:
        new CloudRequestManager(context).makeMultiPartRequest(new CloudRequestSetLEDIcon(context, paramString, str6));
        break label319;
        SDKLogUtils.debugLog("DeviceListManager", "setDeviceProperties(): isLocal: " + String.valueOf(NetworkMode.isLocal()));
        if (NetworkMode.isLocal())
        {
          String str7 = localDeviceInformation1.getIP();
          int j = localDeviceInformation1.getPort();
          String str8 = "http://" + str7 + ":" + j + "/icon.jpg";
          SetDeviceIconRunnable localSetDeviceIconRunnable = new SetDeviceIconRunnable(context, paramString, str8, str6);
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceIconRunnable);
          break label319;
        }
        new CloudRequestManager(context).makeMultiPartRequest(new CloudRequestSetDeviceIcon(context, paramString, localDeviceInformation1.getMAC(), str6));
        break label319;
        label665:
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("notificationName", "set_properties");
        String str2 = paramJSONObject1.getString("bridgeUDN");
        String str3 = (String)paramJSONObject2.get("friendlyName");
        if (!str2.isEmpty())
        {
          localJSONObject.put("bridgeudn", str2);
          localJSONObject.put("bridgeMacAddress", getDeviceInformationFromDevicesArray(str2).getMAC());
        }
        new CloudRequestManager(context).makeRequest(new CloudRequestChangeFriendlyName(this, context, paramString, localDeviceInformation1.getPluginID(), localDeviceInformation1.getMAC(), str3, new Object[] { localJSONObject }));
      }
    }
    SDKLogUtils.errorLog("DeviceListManager", "setDeviceProperties: DeviceInformation Object is NULL. UDN: " + paramString);
  }
  
  public void setDeviceState(String paramString1, JSONObject paramJSONObject, String paramString2)
  {
    try
    {
      SDKLogUtils.infoLog("DeviceListManager", " capability values: " + paramJSONObject.toString() + "; Type: " + paramString2);
      SDKLogUtils.infoLog("DeviceListManager", " in setDeviceState " + paramString1);
      SDKLogUtils.infoLog("DeviceListManager", " NetworkMode. Is Local: " + NetworkMode.isLocal());
      if ((isSmart(paramString2)) || (paramString2.contains("Maker")))
      {
        if (NetworkMode.isLocal())
        {
          SDKLogUtils.infoLog("DeviceListManager", "calling deviceAttriuteSetter: " + paramJSONObject);
          SetDeviceAttributeRunnable localSetDeviceAttributeRunnable = new SetDeviceAttributeRunnable(context, paramString1, paramJSONObject);
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceAttributeRunnable);
          return;
        }
        CloudRequestManager localCloudRequestManager1 = new CloudRequestManager(context);
        localCloudRequestManager1.makeRequest(new CloudRequestChangeAttributes(context, paramString1, paramJSONObject));
        return;
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Error in setting the device state: ", localException);
      return;
    }
    if (paramString2.contains("crockpot"))
    {
      if (NetworkMode.isLocal())
      {
        SDKLogUtils.infoLog("DeviceListManager", "calling SetDeviceStateRunnable in crockpot: " + paramJSONObject);
        Context localContext6 = context;
        Object[] arrayOfObject2 = new Object[3];
        arrayOfObject2[0] = paramJSONObject.getString("mode");
        arrayOfObject2[1] = paramString1;
        arrayOfObject2[2] = paramJSONObject.getString("time");
        SetDeviceStateRunnable localSetDeviceStateRunnable4 = new SetDeviceStateRunnable(localContext6, arrayOfObject2);
        WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceStateRunnable4);
        return;
      }
      CloudRequestManager localCloudRequestManager7 = new CloudRequestManager(context);
      localCloudRequestManager7.makeRequest(new CloudRequestStateChange(context, paramString1, paramJSONObject));
      return;
    }
    DeviceInformation localDeviceInformation2;
    String str4;
    String str5;
    String str6;
    JSONArray localJSONArray3;
    if (paramString2.isEmpty())
    {
      SDKLogUtils.infoLog("DeviceListManager", "DeviceType:zigbee ");
      localDeviceInformation2 = this.devicesArray.getDeviceInformation(paramString1);
      SDKLogUtils.infoLog("DeviceListManager", "device:" + localDeviceInformation2);
      if (localDeviceInformation2.getBridgeUDN().isEmpty()) {
        break label1807;
      }
      str4 = "";
      str5 = "";
      str6 = "";
      localJSONArray3 = paramJSONObject.names();
    }
    for (int i = 0;; i++)
    {
      int j = localJSONArray3.length();
      if (i < j)
      {
        Iterator localIterator = capabalityProfileList.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          if (localJSONArray3.get(i).equals(localEntry.getValue()))
          {
            str4 = str4 + (String)localEntry.getKey() + ",";
            str5 = str5 + (String)localEntry.getValue() + ",";
            str6 = str6 + paramJSONObject.getString((String)localEntry.getValue()) + ",";
          }
        }
      }
      if (str4.endsWith(",")) {
        str4 = str4.substring(0, -1 + str4.length());
      }
      if (str5.endsWith(",")) {
        str5 = str5.substring(0, -1 + str5.length());
      }
      if (str6.endsWith(",")) {
        str6 = str6.substring(0, -1 + str6.length());
      }
      if (NetworkMode.isLocal())
      {
        SDKLogUtils.infoLog("DeviceListManager", "calling SetZigbeeDeviceStateRunnable: " + paramJSONObject);
        SetZigbeeDeviceStateRunnable localSetZigbeeDeviceStateRunnable = new SetZigbeeDeviceStateRunnable(context, str4, str5, str6, localDeviceInformation2.getBridgeUDN(), paramString1, "NO");
        WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetZigbeeDeviceStateRunnable);
        return;
      }
      SDKLogUtils.infoLog("DeviceListManager", "calling CloudRequestZigbeeStateChange: " + paramJSONObject);
      CloudRequestManager localCloudRequestManager6 = new CloudRequestManager(context);
      Context localContext5 = context;
      int k = localDeviceInformation2.getState();
      String str7 = localDeviceInformation2.getPluginID();
      String str8 = localDeviceInformation2.getMAC();
      localCloudRequestManager6.makeRequest(new CloudRequestZigbeeStateChange(localContext5, paramString1, str4, str5, str6, k, str7, str8));
      return;
      if ((IsDevice.Insight(paramString1)) && (!paramJSONObject.has(JSONConstants.BINARY_STATE)))
      {
        if (NetworkMode.isLocal())
        {
          SDKLogUtils.infoLog("DeviceListManager", "calling SetDeviceStateRunnable: " + paramJSONObject);
          JSONArray localJSONArray1 = new JSONArray();
          JSONArray localJSONArray2 = new JSONArray();
          if ((paramJSONObject.has(JSONConstants.INSIGHT_CURRENCY)) && (paramJSONObject.has(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST)))
          {
            localJSONArray1.put("SetInsightHomeSettings");
            JSONObject localJSONObject3 = new JSONObject();
            String[] arrayOfString3 = new String[2];
            arrayOfString3[0] = paramJSONObject.getString(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST);
            arrayOfString3[1] = paramJSONObject.getString(JSONConstants.INSIGHT_CURRENCY);
            localJSONArray2.put(localJSONObject3.put("SetInsightHomeSettings", arrayOfString3));
          }
          if (paramJSONObject.has(JSONConstants.INSIGHT_POWER_THRESHOLD))
          {
            localJSONArray1.put("SetPowerThreshold");
            JSONObject localJSONObject2 = new JSONObject();
            String[] arrayOfString2 = new String[1];
            arrayOfString2[0] = paramJSONObject.getString(JSONConstants.INSIGHT_POWER_THRESHOLD);
            localJSONArray2.put(localJSONObject2.put("SetPowerThreshold", arrayOfString2));
          }
          if ((paramJSONObject.has(JSONConstants.INSIGHT_EXPORT_EMAIL)) && (paramJSONObject.has(JSONConstants.INSIGHT_EXPORT_INTERVAL)) && (!TextUtils.isEmpty(paramJSONObject.getString(JSONConstants.INSIGHT_EXPORT_EMAIL))))
          {
            localJSONArray1.put("ScheduleDataExport");
            JSONObject localJSONObject1 = new JSONObject();
            String[] arrayOfString1 = new String[2];
            arrayOfString1[0] = paramJSONObject.getString(JSONConstants.INSIGHT_EXPORT_EMAIL);
            arrayOfString1[1] = paramJSONObject.getString(JSONConstants.INSIGHT_EXPORT_INTERVAL);
            localJSONArray2.put(localJSONObject1.put("ScheduleDataExport", arrayOfString1));
          }
          SetDeviceStateRunnable localSetDeviceStateRunnable3 = new SetDeviceStateRunnable(context, new Object[] { localJSONArray1, paramString1, localJSONArray2 });
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceStateRunnable3);
          return;
        }
        CloudRequestManager localCloudRequestManager5 = new CloudRequestManager(context);
        if (paramJSONObject.has(JSONConstants.INSIGHT_POWER_THRESHOLD)) {
          localCloudRequestManager5.makeRequest(new CRSetPowerThreshold(this, this.devicesArray.getDeviceInformation(paramString1), "SetPowerThreshold", paramJSONObject));
        }
        if ((paramJSONObject.has(JSONConstants.INSIGHT_CURRENCY)) && (paramJSONObject.has(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST))) {
          localCloudRequestManager5.makeRequest(new CRSetEnergyPerUnitCost(this, this.devicesArray.getDeviceInformation(paramString1), "SetInsightHomeSettings", paramJSONObject));
        }
        if ((paramJSONObject.has(JSONConstants.INSIGHT_EXPORT_EMAIL)) && (paramJSONObject.has(JSONConstants.INSIGHT_EXPORT_INTERVAL)) && (!TextUtils.isEmpty(paramJSONObject.getString(JSONConstants.INSIGHT_EXPORT_EMAIL)))) {
          localCloudRequestManager5.makeRequest(new CRScheduleDataExport(this, this.devicesArray.getDeviceInformation(paramString1), "ScheduleDataExport", paramJSONObject));
        }
      }
      else
      {
        if (paramString2.equals("urn:Belkin:device:dimmer:1"))
        {
          String str1;
          String str2;
          if (paramJSONObject.isNull("brightness"))
          {
            str1 = "";
            if (!paramJSONObject.isNull("fader")) {
              break label1478;
            }
            str2 = "";
            label1376:
            if (!paramJSONObject.isNull("binaryState")) {
              break label1490;
            }
          }
          label1478:
          label1490:
          for (String str3 = "";; str3 = paramJSONObject.getString("binaryState"))
          {
            if (!NetworkMode.isLocal()) {
              break label1502;
            }
            SDKLogUtils.infoLog("DeviceListManager", "calling SetDeviceStateRunnable for DIMMER: " + paramJSONObject);
            SetDeviceStateRunnable localSetDeviceStateRunnable2 = new SetDeviceStateRunnable(context, new Object[] { str3, paramString1, str1, str2 });
            WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceStateRunnable2);
            return;
            str1 = paramJSONObject.getString("brightness");
            break;
            str2 = paramJSONObject.getString("fader");
            break label1376;
          }
          label1502:
          CloudRequestSetDeviceStatusDimmer localCloudRequestSetDeviceStatusDimmer;
          if (!TextUtils.isEmpty(str3))
          {
            Context localContext4 = context;
            localCloudRequestSetDeviceStatusDimmer = new CloudRequestSetDeviceStatusDimmer(localContext4, paramString1, "status", str3);
          }
          while (localCloudRequestSetDeviceStatusDimmer != null)
          {
            CloudRequestManager localCloudRequestManager4 = new CloudRequestManager(context);
            localCloudRequestManager4.makeRequest(localCloudRequestSetDeviceStatusDimmer);
            return;
            if (!TextUtils.isEmpty(str1))
            {
              Context localContext3 = context;
              localCloudRequestSetDeviceStatusDimmer = new CloudRequestSetDeviceStatusDimmer(localContext3, paramString1, "brightness", str1);
            }
            else
            {
              boolean bool = TextUtils.isEmpty(str2);
              localCloudRequestSetDeviceStatusDimmer = null;
              if (!bool)
              {
                Context localContext2 = context;
                localCloudRequestSetDeviceStatusDimmer = new CloudRequestSetDeviceStatusDimmer(localContext2, paramString1, "fader", str2);
              }
            }
          }
        }
        if (paramString2.contains("NestThermostat"))
        {
          CloudRequestManager localCloudRequestManager2 = new CloudRequestManager(context);
          DeviceInformation localDeviceInformation1 = this.devicesArray.getDeviceInformation(paramString1);
          localCloudRequestManager2.makeRequest(new CloudRequestSetNestAttribute(context, paramString1, localDeviceInformation1.getPluginID(), localDeviceInformation1.getMAC(), String.valueOf(localDeviceInformation1.getStatusTS()), paramJSONObject));
          return;
        }
        if (NetworkMode.isLocal())
        {
          SDKLogUtils.infoLog("DeviceListManager", "calling SetDeviceStateRunnable: " + paramJSONObject);
          Context localContext1 = context;
          Object[] arrayOfObject1 = new Object[2];
          arrayOfObject1[0] = paramJSONObject.getString("binaryState");
          arrayOfObject1[1] = paramString1;
          SetDeviceStateRunnable localSetDeviceStateRunnable1 = new SetDeviceStateRunnable(localContext1, arrayOfObject1);
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetDeviceStateRunnable1);
          return;
        }
        CloudRequestManager localCloudRequestManager3 = new CloudRequestManager(context);
        localCloudRequestManager3.makeRequest(new CloudRequestStateChange(context, paramString1, paramJSONObject));
      }
      label1807:
      return;
    }
  }
  
  public void setFirstRemoteCall(boolean paramBoolean)
  {
    firstRemoteCall = paramBoolean;
  }
  
  public void setGroupState(String paramString1, JSONObject paramJSONObject, String paramString2)
  {
    String str1 = "";
    String str2 = "";
    String str3 = "";
    JSONArray localJSONArray = paramJSONObject.names();
    for (int i = 0;; i++) {
      try
      {
        if (i < localJSONArray.length())
        {
          Iterator localIterator = capabalityProfileList.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            if (localJSONArray.get(i).equals(localEntry.getValue()))
            {
              str1 = str1 + (String)localEntry.getKey() + ",";
              str2 = str2 + (String)localEntry.getValue() + ",";
              str3 = str3 + paramJSONObject.getString((String)localEntry.getValue()) + ",";
            }
          }
        }
        if (str1.endsWith(",")) {
          str1 = str1.substring(0, -1 + str1.length());
        }
        if (str2.endsWith(",")) {
          str2 = str2.substring(0, -1 + str2.length());
        }
        if (str3.endsWith(",")) {
          str3 = str3.substring(0, -1 + str3.length());
        }
        if (NetworkMode.isLocal())
        {
          SDKLogUtils.infoLog("DeviceListManager", "calling SetZigbeeDeviceStateRunnable: " + paramJSONObject);
          SetZigbeeDeviceStateRunnable localSetZigbeeDeviceStateRunnable = new SetZigbeeDeviceStateRunnable(context, str1, str2, str3, paramString2, paramString1, "YES");
          WeMoThreadPoolHandler.getInstance().executeViaBackground(localSetZigbeeDeviceStateRunnable);
          return;
        }
        SDKLogUtils.infoLog("DeviceListManager", "calling CloudRequestZigbeeStateChange: " + paramJSONObject);
        new CloudRequestManager(context).makeRequest(new CloudRequestZigbeeGroupStateChange(context, paramString1, str1, str2, str3));
        return;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
    }
  }
  
  public void setHTMLForDevice(String paramString1, String paramString2)
  {
    this.devicesArray.setDeviceHTML(paramString1, paramString2);
    cacheManager.setDeviceHTML(paramString1, paramString2);
  }
  
  public void setInsightDrawerState(int paramInt, String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      SharePreferences.setInsightDrawerState(context, paramString, paramInt);
      return;
    }
    SDKLogUtils.errorLog("DeviceListManager", "setInsightDrawerState: UDN is NULL");
  }
  
  public JSONArray setLedFriendlyName(JSONArray paramJSONArray)
    throws JSONException
  {
    Object localObject = new JSONArray();
    String str1 = paramJSONArray.getString(0).toString();
    String str2 = paramJSONArray.getString(1).toString();
    String str3 = "";
    try
    {
      ControlPoint localControlPoint = getUpnpControl();
      if (localControlPoint != null)
      {
        str3 = getBridgeUdn(str1, localControlPoint);
        SDKLogUtils.debugLog("DeviceListManager", "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + str3);
      }
      if (str3 != null)
      {
        Action localAction = localControlPoint.getDevice(str3).getAction("SetDeviceName");
        setArgument(localAction, UpnpConstants.ARGS_LED_FRIENDLY_NAME, new String[] { str1, str2 });
        String str4 = localAction.postControlAction();
        SDKLogUtils.debugLog("DeviceListManager", "set friendly name: " + str4);
        if (str4 != null)
        {
          JSONArray localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str4);
          localObject = localJSONArray;
        }
      }
      return (JSONArray)localObject;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in setLedFriendlyName(): ", localException);
    }
    return (JSONArray)localObject;
  }
  
  public void setNewStateForDevice(String paramString1, String paramString2, String paramString3)
  {
    if ((!TextUtils.isEmpty(paramString2)) && (!TextUtils.isEmpty(paramString3)))
    {
      SDKLogUtils.debugLog("DeviceListManager", "Setting new state for device. UDN: " + paramString1 + "; FriendlyName: " + paramString2 + "; state: " + paramString3);
      DeviceInformation localDeviceInformation = getDeviceInformationFromMemoryByUDN(paramString1);
      if (localDeviceInformation != null)
      {
        localDeviceInformation.setState(Integer.parseInt(paramString3));
        localDeviceInformation.setFriendlyName(paramString2);
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      }
      sendNotification("state_changed", "", paramString1);
      return;
    }
    SDKLogUtils.errorLog("DeviceListManager", "Setting new state for device failed as STATE or Friendly Name or both are empty. UDN: " + paramString1);
    sendNotification("change_state_in_remote_failed", "", paramString1);
  }
  
  public void setNewStateForMakerDevice(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    if ((!TextUtils.isEmpty(paramString2)) && (!TextUtils.isEmpty(paramString3)))
    {
      SDKLogUtils.debugLog("DeviceListManager", "Setting new state for MAKER. UDN: " + paramString1 + "; FriendlyName: " + paramString2 + "; state: " + paramString3 + "; attribute list: " + paramString4);
      DeviceInformation localDeviceInformation = getDeviceInformationFromMemoryByUDN(paramString1);
      String str;
      if (localDeviceInformation != null)
      {
        str = updateAttributeForMaker(paramString4, localDeviceInformation);
        if (str == null) {}
      }
      try
      {
        if (!str.equals("")) {
          localDeviceInformation.setAttributeList(new JSONObject(str));
        }
        localDeviceInformation.setFriendlyName(paramString2);
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("DeviceListManager", "JSONException while setting attribute list for MAKER. UDN: " + paramString1, localJSONException);
        }
      }
      sendNotification("state_changed", "", paramString1);
      return;
    }
    SDKLogUtils.errorLog("DeviceListManager", "Setting new state for MAKER failed as STATE or Friendly Name or both are empty. UDN: " + paramString1);
    sendNotification("change_state_in_remote_failed", "", paramString1);
  }
  
  public void setNightModeConfiguration(String paramString, final int paramInt1, final int paramInt2, final int paramInt3, final int paramInt4, final SetNightModeSuccessCallback paramSetNightModeSuccessCallback, final SetNightModeErrorCallback paramSetNightModeErrorCallback)
  {
    final DeviceInformation localDeviceInformation = getDevice(paramString);
    if (localDeviceInformation != null) {
      if (NetworkMode.isLocal())
      {
        Device localDevice = localDeviceInformation.getDevice();
        if (localDevice != null)
        {
          Action localAction = localDevice.getAction("ConfigureNightMode");
          if (localAction != null)
          {
            localAction.setArgumentValue("NightModeConfiguration", "<nightMode>" + paramInt1 + "</" + "nightMode" + ">" + "<" + "endTime" + ">" + paramInt3 + "</" + "endTime" + ">" + "<" + "startTime" + ">" + paramInt2 + "</" + "startTime" + ">" + "<" + "nightModeBrightness" + ">" + paramInt4 + "</" + "nightModeBrightness" + ">");
            ControlActionHandler localControlActionHandler = ControlActionHandler.newInstance();
            ControlActionErrorCallback local14 = new ControlActionErrorCallback()
            {
              public void onActionError(Exception paramAnonymousException)
              {
                SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: Exception during PostControlAction: ", paramAnonymousException);
                if (paramSetNightModeErrorCallback != null) {
                  paramSetNightModeErrorCallback.onNightModeConfigurationFailed(paramAnonymousException.getMessage());
                }
              }
            };
            localControlActionHandler.postControlAction(localAction, local14, new ControlActionSuccessCallback()
            {
              public void onActionSuccess(String paramAnonymousString)
              {
                SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: Response from FW: " + paramAnonymousString);
                if ((!TextUtils.isEmpty(paramAnonymousString)) && (paramAnonymousString.contains("SUCCESS"))) {}
                do
                {
                  try
                  {
                    localDeviceInformation.setAttributeValue("nightMode", String.valueOf(paramInt1));
                    localDeviceInformation.setAttributeValue("startTime", String.valueOf(paramInt2));
                    localDeviceInformation.setAttributeValue("endTime", String.valueOf(paramInt3));
                    localDeviceInformation.setAttributeValue("nightModeBrightness", String.valueOf(paramInt4));
                    DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
                    DeviceListManager.cacheManager.updateDB(localDeviceInformation, true, true, true);
                    if (paramSetNightModeSuccessCallback != null) {
                      paramSetNightModeSuccessCallback.onNightModeConfigured();
                    }
                    return;
                  }
                  catch (JSONException localJSONException)
                  {
                    do
                    {
                      SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: JSONException while updating device information object: ", localJSONException);
                    } while (paramSetNightModeErrorCallback == null);
                    paramSetNightModeErrorCallback.onNightModeConfigurationFailed(localJSONException.getMessage());
                    return;
                  }
                  SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: Action Failed.");
                } while (paramSetNightModeErrorCallback == null);
                paramSetNightModeErrorCallback.onNightModeConfigurationFailed("Action failed");
              }
            });
          }
        }
      }
    }
    do
    {
      do
      {
        return;
        SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: Control Point object is NULL");
      } while (paramSetNightModeErrorCallback == null);
      paramSetNightModeErrorCallback.onNightModeConfigurationFailed("setNightModeConfiguration: Control Point object is NULL");
      return;
      CloudRequestSetNightModeConfiguration localCloudRequestSetNightModeConfiguration = new CloudRequestSetNightModeConfiguration(context, localDeviceInformation, paramInt1, paramInt4, paramInt2, paramInt3, paramSetNightModeSuccessCallback, paramSetNightModeErrorCallback);
      new CloudRequestManager(context).makeRequest(localCloudRequestSetNightModeConfiguration);
      return;
      SDKLogUtils.errorLog("DeviceListManager", "setNightModeConfiguration: DeviceInformation object is NULL");
    } while (paramSetNightModeErrorCallback == null);
    paramSetNightModeErrorCallback.onNightModeConfigurationFailed("setNightModeConfiguration: DeviceInformation object is NULL");
  }
  
  public JSONArray setRemoteAccess()
  {
    JSONArray localJSONArray = new JSONArray();
    localJSONArray.put(this.remoteAccessManager.enableRemoteAccess());
    localJSONArray.put(this.mNetworkUtils.getSSID());
    return localJSONArray;
  }
  
  public void setUnicastFailedForAnyDevice(boolean paramBoolean)
  {
    getSmartDiscovery().setUnicastFailedForAnyDevice(paramBoolean);
  }
  
  public void startCloudPeriodicUpdate()
  {
    SDKLogUtils.debugLog("DeviceListManager", "STARTING CLOUD PERIODIC UPDATE. isLocal: " + NetworkMode.isLocal());
    if (!NetworkMode.isLocal())
    {
      if (this.updateTimer == null) {
        this.updateTimer = new Timer();
      }
      this.updateTimer.scheduleAtFixedRate(new TimerTask()
      {
        public void run()
        {
          SDKLogUtils.debugLog("DeviceListManager", "STARTING CLOUD PERIODIC UPDATE mNetworkUtils.isHomeNetwork(): " + DeviceListManager.this.mNetworkUtils.isHomeNetwork());
          if ((!DeviceListManager.this.mNetworkUtils.isHomeNetwork()) || (DeviceListManager.this.getSmartDiscovery().isForcedRemoteEnabled())) {
            DeviceListManager.this.makeCloudRequestForUpdateDeviceList();
          }
        }
      }, 60000L, 60000L);
    }
  }
  
  public void startUnicastDiscovery()
  {
    if (!Locks.getInstance().isLocked(Locks.LOCK_UNICAST_DISOCVERY))
    {
      this.devicesArray.clearDeviceDiscoveries();
      UnicastDiscoveryRunnable localUnicastDiscoveryRunnable = new UnicastDiscoveryRunnable(context, getSmartDiscovery());
      WeMoThreadPoolHandler.getInstance().executeViaBackground(localUnicastDiscoveryRunnable);
    }
  }
  
  public void stateChangeRequestForMaker(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    SDKLogUtils.infoLog("setNewStateForMaker: ", "stateChangeRequestForMaker");
    if ((paramString2.equals("")) || (paramString3.equals("")))
    {
      DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramString1, false, true, false);
      if (localDeviceInformation != null)
      {
        paramString2 = localDeviceInformation.getPluginID();
        paramString3 = localDeviceInformation.getMAC();
      }
    }
    new CloudRequestManager(context).makeRequest(new CloudRequestStateChangeForMaker(this, context, paramString1, paramString2, paramString3, paramString4, paramString5));
  }
  
  public void stop()
  {
    saveDeviceCache();
    stopListen();
    new Thread(new Runnable()
    {
      public void run()
      {
        if (DeviceListManager.this.mControlPoint != null) {
          DeviceListManager.this.mControlPoint.finalizeCP();
        }
        DeviceListManager.devListManager = null;
      }
    }).start();
    if (this.networkStateListener != null)
    {
      this.networkStateListener.stopListening(context);
      this.networkStateListener = null;
    }
  }
  
  public void stopCloudPeriodicUpdate()
  {
    SDKLogUtils.debugLog("DeviceListManager", "STOPPING CLOUD PERIODIC UPDATE");
    if (this.updateTimer != null)
    {
      this.updateTimer.cancel();
      this.updateTimer = null;
    }
  }
  
  public void stopListen()
  {
    SDKLogUtils.infoLog("Listeners", "in StopListen");
    if (this.mControlPoint != null)
    {
      this.mControlPoint.removeDeviceChangeListener(this);
      this.mControlPoint.removeEventListener(this);
    }
  }
  
  public void stopUnicastDiscovery()
  {
    if (this.worker != null) {
      this.worker.shutdown();
    }
  }
  
  public boolean subscribeToService(Device paramDevice)
  {
    boolean bool1 = false;
    if (paramDevice != null) {}
    try
    {
      ServiceList localServiceList = paramDevice.getServiceList();
      bool1 = false;
      if (localServiceList != null)
      {
        for (int i = 0; i < localServiceList.size(); i++)
        {
          Service localService = localServiceList.getService(i);
          String str = localService.getServiceType();
          SDKLogUtils.debugLog("DeviceListManager", "subscribeToService: UDN: " + paramDevice.getUDN() + "; Service Type: " + str);
          if ((str.equals("urn:Belkin:service:basicevent:1")) || (str.equals("urn:Belkin:service:firmwareupdate:1")) || (str.equals("urn:Belkin:service:timesync:1")) || (str.equals("urn:Belkin:service:bridge:1")) || ((str.equals("urn:Belkin:service:deviceevent:1")) && (isSmart(paramDevice.getDeviceType()))))
          {
            SDKLogUtils.infoLog("sdk DeviceListManager: inside", "sdk DeviceListManager: inside" + str);
            if ((this.mControlPoint != null) && (!this.mControlPoint.subscribe(localService)))
            {
              boolean bool2 = this.mControlPoint.subscribe(localService);
              if (!bool2) {
                return false;
              }
            }
          }
        }
        bool1 = true;
      }
      return bool1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Exception in subscribeToService ex:", localException);
    }
    return false;
  }
  
  public void updateAtributeListForInsightInRemote(JSONObject paramJSONObject, DeviceInformation paramDeviceInformation)
  {
    paramDeviceInformation.setAttributeList(paramJSONObject);
    this.devicesArray.addOrUpdateDeviceInformation(paramDeviceInformation);
    cacheManager.updateDB(paramDeviceInformation, false, true, true);
  }
  
  public void updateDeviceCache(DeviceInformation paramDeviceInformation)
  {
    this.devicesArray.addOrUpdateDeviceInformation(paramDeviceInformation);
    if (!cacheManager.isDeviceInDB(paramDeviceInformation.getUDN()))
    {
      cacheManager.addDeviceToDB(paramDeviceInformation, true, true, true);
      return;
    }
    cacheManager.updateDB(paramDeviceInformation, true, true, true);
  }
  
  public void updateDeviceCacheInDeviceList(DeviceInformation paramDeviceInformation, Boolean paramBoolean)
  {
    this.devicesArray.updateDeviceCache(paramDeviceInformation, paramBoolean.booleanValue());
  }
  
  public void updateDeviceDiscovery(String paramString)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setIsDiscovered(false);
      localDeviceInformation.setInActive(1);
      this.devicesArray.updateDeviceCache(localDeviceInformation, false);
      cacheManager.updateDB(localDeviceInformation, false, false, true);
      sendNotification("update", "", paramString);
    }
  }
  
  public void updateDeviceNameInListAndCache(String paramString1, String paramString2)
  {
    this.devicesArray.updateFriendlyName(paramString1, paramString2);
    DeviceInformation localDeviceInformation = getDeviceFromDBByUDN(paramString1, false, false, true);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setFriendlyName(paramString2);
      cacheManager.updateDeviceFromDB(localDeviceInformation, false, false, true);
    }
    sendNotification("update", "", paramString1);
  }
  
  public void updateDeviceParameters(ArrayList<DeviceInformation> paramArrayList)
  {
    SDKLogUtils.infoLog("DeviceListManager", " in UpdateDeviceParameters");
    if (paramArrayList.size() > 0)
    {
      Iterator localIterator = paramArrayList.iterator();
      while (localIterator.hasNext())
      {
        final DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (localDeviceInformation.getBridgeUDN().isEmpty())
        {
          final Device localDevice = localDeviceInformation.getDevice();
          if (localDevice == null)
          {
            SDKLogUtils.infoLog("DeviceListManager", " device is null");
            if (mWeMoSDKContext == null) {
              mWeMoSDKContext = WeMoSDKContext.getInstance(context);
            }
            if (this.mControlPoint == null) {
              this.mControlPoint = new ControlPoint();
            }
            localDevice = this.mControlPoint.getDevice(localDeviceInformation.getUDN());
          }
          if (localDevice == null)
          {
            SDKLogUtils.infoLog("DeviceListManager", " device not reachable" + localDeviceInformation.getUDN());
            localDeviceInformation.setIsDiscovered(false);
            localDeviceInformation.setInActive(1);
            this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
            sendNotification("update", "", localDeviceInformation.getUDN());
          }
          else
          {
            SDKLogUtils.infoLog("DeviceListManager", " found device" + localDeviceInformation.getUDN());
            new Thread(new Runnable()
            {
              public void run()
              {
                localDeviceInformation.setDevice(localDevice);
                DeviceListManager.this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
                SDKLogUtils.infoLog("DeviceListManager", " updating device parameters completed" + localDeviceInformation.getUDN());
                DeviceListManager.this.sendNotification("update", "", localDeviceInformation.getUDN());
                if (IsDevice.Bridge(localDeviceInformation.getUDN())) {
                  DeviceListManager.this.initiateScanZigBeeDevice(localDeviceInformation.getUDN());
                }
              }
            }).start();
          }
        }
      }
    }
  }
  
  public void updateFriendlyName(String paramString1, String paramString2)
  {
    this.devicesArray.updateFriendlyName(paramString1, paramString2);
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString1);
    if (localDeviceInformation != null) {
      cacheManager.updateDB(localDeviceInformation, false, false, true);
    }
    if (SDKLogUtils.isDebug()) {
      new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
    }
  }
  
  public void updateGroupLedIconFile(String paramString1, String paramString2, List<String> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(str);
      if (localDeviceInformation != null)
      {
        localDeviceInformation.setIconUploadId(paramString2);
        localDeviceInformation.setGroupIcon(paramString1);
        localDeviceInformation.setIconVersion(paramString2);
        cacheManager.updateDB(localDeviceInformation, false, false, true);
        this.devicesArray.updateDeviceCache(localDeviceInformation, false);
        sendNotification("update", "", localDeviceInformation.getUDN());
        SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: updateGroupLedIconFile dev UDN: " + localDeviceInformation.getUDN() + "; iconversion: " + paramString2 + "; groupIcon: " + paramString1);
      }
    }
    if (SDKLogUtils.isDebug()) {
      new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
    }
  }
  
  public void updateIconFile(String paramString, Bitmap paramBitmap)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.saveIconToFile(paramBitmap, context);
      this.mActivity.onIconUpdate(paramString, localDeviceInformation.getIcon());
      cacheManager.setDeviceIcon(paramString, localDeviceInformation.getIcon());
    }
  }
  
  public void updateLedIconFile(String paramString1, Bitmap paramBitmap, String paramString2)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString1);
    if (localDeviceInformation != null)
    {
      localDeviceInformation.setIcon(saveRemoteIconToStorage(paramBitmap, paramString1, paramString2));
      localDeviceInformation.setIconUploadId(paramString2);
      localDeviceInformation.setIconVersion(paramString2);
      cacheManager.updateDB(localDeviceInformation, false, false, true);
      this.devicesArray.updateDeviceCache(localDeviceInformation, false);
      sendNotification("update", "", localDeviceInformation.getUDN());
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
      }
      SDKLogUtils.debugLog("DeviceListManager", "LED ICONINFO: updateLedIconFile dev: " + localDeviceInformation.toString() + "; iconversion: " + localDeviceInformation.getIconVersion());
    }
  }
  
  public void updateLocalMode()
  {
    if (this.mNetworkUtils == null) {
      this.mNetworkUtils = new SDKNetworkUtils(context);
    }
    if ((this.remoteAccessManager == null) || ((!this.remoteAccessManager.isRemoteEnabled()) && (isLocalMode())))
    {
      NetworkMode.setLocal(true);
      return;
    }
    if ("Home".equals(this.mNetworkUtils.getNetworkType()))
    {
      NetworkMode.setLocal(true);
      return;
    }
    NetworkMode.setLocal(false);
  }
  
  public void updateRemoteIconFile(DeviceInformation paramDeviceInformation, Bitmap paramBitmap, String paramString)
  {
    if (paramDeviceInformation != null)
    {
      paramDeviceInformation.setIcon(saveRemoteIconToStorage(paramBitmap, paramDeviceInformation.getMAC(), paramString));
      this.devicesArray.addOrUpdateDeviceInformation(paramDeviceInformation);
      cacheManager.setDeviceIcon(paramDeviceInformation.getUDN(), paramDeviceInformation.getIcon());
      cacheManager.updateDB(paramDeviceInformation, false, false, true);
      if (this.mActivity != null) {
        this.mActivity.onIconUpdate(paramDeviceInformation.getUDN(), paramDeviceInformation.getIcon());
      }
    }
  }
  
  public DeviceInformation updateZigbeeCapabilities(String paramString, JSONObject paramJSONObject)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString);
    SDKLogUtils.infoLog("DeviceListManager", "device info :" + localDeviceInformation);
    String str1 = localDeviceInformation.getCapabilities();
    if (!str1.isEmpty())
    {
      try
      {
        JSONObject localJSONObject = new JSONObject(str1);
        SDKLogUtils.infoLog("DeviceListManager", "capabilities JSONObject:" + localJSONObject.toString());
        if ((capabalityProfileList == null) || (capabalityProfileList.isEmpty())) {
          updateCapabilityProfileTable();
        }
        Iterator localIterator = paramJSONObject.keys();
        while (localIterator.hasNext())
        {
          String str2 = (String)localIterator.next();
          String str3 = (String)paramJSONObject.get(str2);
          if (str3 != null)
          {
            localJSONObject.put(str2, str3);
            SDKLogUtils.infoLog("DeviceListManager", "updating capability:" + str2 + " value:" + str3);
          }
        }
        localDeviceInformation.setCapabilities(localJSONObject.toString());
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return localDeviceInformation;
      }
      return localDeviceInformation;
    }
    SDKLogUtils.infoLog("DeviceListManager", "capabilities or state is empty:");
    return localDeviceInformation;
  }
  
  public void updateZigbeeCapability(String paramString1, String paramString2, String paramString3)
  {
    DeviceInformation localDeviceInformation = this.devicesArray.getDeviceInformation(paramString1);
    SDKLogUtils.infoLog("DeviceListManager", "device info :" + localDeviceInformation);
    String str = localDeviceInformation.getCapabilities();
    if (!str.isEmpty()) {
      try
      {
        JSONObject localJSONObject = new JSONObject(str);
        SDKLogUtils.infoLog("DeviceListManager", "capabilities JSONObject:" + localJSONObject.toString());
        if ((capabalityProfileList == null) || (capabalityProfileList.isEmpty())) {
          updateCapabilityProfileTable();
        }
        String[] arrayOfString1 = paramString2.split(",");
        String[] arrayOfString2 = paramString3.split(",");
        int i = arrayOfString1.length;
        for (int j = 0; j < i; j++)
        {
          localJSONObject.put((String)capabalityProfileList.get(arrayOfString1[j]), arrayOfString2[j]);
          if (arrayOfString1[j].equalsIgnoreCase("10008"))
          {
            SDKLogUtils.infoLog("DeviceListManager", "updating onOFF" + localJSONObject.toString());
            localJSONObject.put((String)capabalityProfileList.get("10006"), "1");
          }
          if (arrayOfString1[j].equalsIgnoreCase("10006")) {
            localDeviceInformation.setState(Integer.valueOf(arrayOfString2[j]).intValue());
          }
          SDKLogUtils.infoLog("DeviceListManager", "updating capability: " + arrayOfString1[j] + " value: " + arrayOfString2[j]);
        }
        localDeviceInformation.setCapabilities(localJSONObject.toString());
        SDKLogUtils.infoLog("DeviceListManager", "Updated capabilities:" + localJSONObject.toString());
        this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
        if (!cacheManager.isDeviceInDB(localDeviceInformation.getUDN())) {
          cacheManager.addDeviceToDB(localDeviceInformation, true, false, true);
        }
        while (SDKLogUtils.isDebug())
        {
          new MoreUtil().copyDbToDownloadDirectory("cache.db", context);
          return;
          cacheManager.updateDB(localDeviceInformation, true, false, true);
          continue;
          SDKLogUtils.infoLog("DeviceListManager", "capabilities empty:");
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
    }
  }
  
  public void updateZigbeeStateResponse()
  {
    SDKLogUtils.infoLog("DeviceListManager", "in updateZigbeeStateResponse");
  }
  
  public void verifyHomeNetwork()
  {
    SDKLogUtils.infoLog("DeviceListManager", "in verifyHomeNetwork");
    if (this.mSharePreference == null) {
      this.mSharePreference = new SharePreferences(context);
    }
    if (this.mNetworkUtils == null) {
      this.mNetworkUtils = new SDKNetworkUtils(context);
    }
    String str1 = this.mNetworkUtils.getArpMac();
    String str2 = this.mSharePreference.getCacheArpMac();
    SDKLogUtils.infoLog("DeviceListManager", "Current ARPMAC: " + str1 + "; cached ArpMac: " + str2);
    this.mSharePreference.setCacheArpMac(str1);
    if ((!TextUtils.isEmpty(str1)) && (!str1.equals(str2)) && (!this.mSharePreference.isRemoteEnabled()))
    {
      resetHomeNetwork();
      sendNotification("reset_cache", "", "");
    }
  }
  
  private class FetchZigBeeDevicesCallback
    implements IFetchZigBeeDevicesCallback
  {
    private String udn;
    
    public FetchZigBeeDevicesCallback(String paramString)
    {
      this.udn = paramString;
    }
    
    public void onZigBeeDevicesFetchError(WeMoError paramWeMoError)
    {
      SDKLogUtils.errorLog("DeviceListManager", "Discovery Zigbee: Exception while fetching ZigBee Devices: " + paramWeMoError.getErrorMessage());
    }
    
    public void onZigBeeDevicesFetched(Map<String, DeviceInformation> paramMap)
    {
      if (paramMap != null)
      {
        SDKLogUtils.debugLog("DeviceListManager", "Discovery Zigbee: ON Zigbee Devices Fetched. Count: " + paramMap.size());
        DeviceListManager.this.removeOfflineGroupLeds(paramMap);
        SDKLogUtils.debugLog("DeviceListManager", "Discovery Zigbee: ON Zigbee Devices Fetched. Count after removing offline groups: " + paramMap.size());
        Iterator localIterator = paramMap.keySet().iterator();
        while (localIterator.hasNext())
        {
          DeviceInformation localDeviceInformation = (DeviceInformation)paramMap.get((String)localIterator.next());
          localDeviceInformation.setIcon(DeviceListManager.cacheManager.getDeviceStringProperty(localDeviceInformation.getUDN(), "icon"));
          DeviceListManager.this.addOrUpdateZBDevice(this.udn, localDeviceInformation, "Discovery Success");
        }
        DeviceListManager.this.getLEDDeviceIconInfo();
        DeviceListManager.this.sendNotification("zigbee_status_done", "", this.udn);
      }
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", DeviceListManager.context);
      }
    }
  }
  
  public static class FirmwareUpdateData
    implements Serializable
  {
    private static final long serialVersionUID = 7972506196976482272L;
    private String fwStatus;
    private String oldFwVersion;
    private long statusTS;
    private String udn;
    
    public String getFwStatus()
    {
      return this.fwStatus;
    }
    
    public String getOldFwVersion()
    {
      return this.oldFwVersion;
    }
    
    public long getStatusTS()
    {
      return this.statusTS;
    }
    
    public String getUdn()
    {
      return this.udn;
    }
    
    public void setFwStatus(String paramString)
    {
      if (paramString == null) {
        paramString = "";
      }
      this.fwStatus = paramString;
    }
    
    public void setOldFwVersion(String paramString)
    {
      if (paramString == null) {
        paramString = "";
      }
      this.oldFwVersion = paramString;
    }
    
    public void setStatusTS(long paramLong)
    {
      this.statusTS = paramLong;
    }
    
    public void setUdn(String paramString)
    {
      if (paramString == null) {
        paramString = "";
      }
      this.udn = paramString;
    }
  }
  
  public static abstract interface NotificationListenerDLM
  {
    public abstract void onNotify(String paramString1, String paramString2, String paramString3);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/DeviceListManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */