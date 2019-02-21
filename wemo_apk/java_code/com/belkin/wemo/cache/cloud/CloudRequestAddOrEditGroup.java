package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.WemoUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestAddOrEditGroup
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestAddOrEditGroup";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 4;
  private final String URL_1 = CloudConstants.CLOUD_URL + "/apis/http/device/groups/";
  private final String URL_2 = "/?remoteSync=true";
  private String bridgeUDN;
  private JSONObject deviceCapabilities;
  private JSONArray deviceIDs;
  private String groupIcon;
  private String groupId;
  private String groupName;
  private String homeId;
  private boolean isNewGroup = false;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  private DevicesArray mDevicesArray;
  private int requestType;
  
  public CloudRequestAddOrEditGroup(Context paramContext, String paramString, JSONObject paramJSONObject, boolean paramBoolean)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    try
    {
      this.groupId = paramJSONObject.getString("groupID");
      this.bridgeUDN = paramString;
      this.mCacheManager = CacheManager.getInstance(paramContext);
      this.mDevicesArray = DevicesArray.getInstance();
      this.homeId = new CloudAuth(paramContext).getHomeID();
      this.groupName = paramJSONObject.getString("groupName");
      this.groupIcon = paramJSONObject.getString("groupIcon");
      this.deviceCapabilities = paramJSONObject.getJSONObject("deviceCapabilities");
      this.deviceIDs = paramJSONObject.getJSONArray("deviceID");
      this.isNewGroup = paramBoolean;
      if (paramBoolean)
      {
        this.requestType = 1;
        return;
      }
      this.requestType = 4;
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestAddOrEditGroup", "JSONException while extracting group properties: ", localJSONException);
    }
  }
  
  private String getCapabilitiesXMLString(Map<String, String> paramMap)
  {
    StringBuilder localStringBuilder = new StringBuilder("<capabilities>");
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localStringBuilder.append(getSingleCapabilityXMLString((String)localEntry.getKey(), (String)localEntry.getValue()));
    }
    localStringBuilder.append("</capabilities>");
    return localStringBuilder.toString();
  }
  
  private String getDevicesXMLString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = this.deviceIDs.length();
    int j = 0;
    for (;;)
    {
      if (j < i) {
        try
        {
          DeviceInformation localDeviceInformation = this.mDevMgr.getDevice(this.deviceIDs.getString(j));
          localStringBuilder.append("<device><deviceId>" + localDeviceInformation.getPluginID() + "</deviceId>" + "</device>");
          j++;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            SDKLogUtils.errorLog("SDK_CloudRequestAddOrEditGroup", "JSONException while creating device IDs XML: ", localJSONException);
          }
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  private GroupCapabilityProfile getGroupCapabilityProfile()
  {
    GroupCapabilityProfile localGroupCapabilityProfile = new GroupCapabilityProfile();
    if (this.deviceCapabilities != null)
    {
      HashMap localHashMap = new HashMap();
      Iterator localIterator = this.deviceCapabilities.keys();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        try
        {
          String str2 = this.deviceCapabilities.getString(str1);
          if (!TextUtils.isEmpty(str2)) {
            localHashMap.put(WemoUtils.getCapabilityID(str1), str2);
          }
        }
        catch (JSONException localJSONException)
        {
          SDKLogUtils.errorLog("SDK_CloudRequestAddOrEditGroup", "JSONException while creating group capabilities IDs/Values Pair: ", localJSONException);
        }
      }
      localGroupCapabilityProfile.setCapabilityIDToValueMap(localHashMap);
    }
    SDKLogUtils.debugLog("SDK_CloudRequestAddOrEditGroup", "Group Capability IDs: " + localGroupCapabilityProfile.getCapabilityIDsAsString() + "; Group Capability Values: " + localGroupCapabilityProfile.getCapabilityValuesAsString());
    return localGroupCapabilityProfile;
  }
  
  private String getSingleCapabilityXMLString(String paramString1, String paramString2)
  {
    return "<capability><capabilityId>" + paramString1 + "</capabilityId>" + "<currentValue>" + paramString2 + "</currentValue>" + "</capability>";
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("groups").item(0);
      SDKLogUtils.infoLog("RemoveGroup: ", "success: " + localXMLParser.getValue(localElement, "statusCode"));
      boolean bool1 = localXMLParser.getValue(localElement, "statusCode").equalsIgnoreCase("S");
      boolean bool2 = false;
      if (bool1) {
        bool2 = true;
      }
      return bool2;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  /* Error */
  public String getBody()
  {
    // Byte code:
    //   0: new 329	java/lang/StringBuffer
    //   3: dup
    //   4: invokespecial 330	java/lang/StringBuffer:<init>	()V
    //   7: astore_1
    //   8: iconst_0
    //   9: istore_2
    //   10: iload_2
    //   11: aload_0
    //   12: getfield 137	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:deviceIDs	Lorg/json/JSONArray;
    //   15: invokevirtual 199	org/json/JSONArray:length	()I
    //   18: if_icmpge +56 -> 74
    //   21: aload_1
    //   22: aload_0
    //   23: getfield 137	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:deviceIDs	Lorg/json/JSONArray;
    //   26: iload_2
    //   27: invokevirtual 334	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   30: invokevirtual 335	java/lang/Object:toString	()Ljava/lang/String;
    //   33: invokevirtual 338	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   36: pop
    //   37: iload_2
    //   38: iconst_m1
    //   39: aload_0
    //   40: getfield 137	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:deviceIDs	Lorg/json/JSONArray;
    //   43: invokevirtual 199	org/json/JSONArray:length	()I
    //   46: iadd
    //   47: if_icmpge +11 -> 58
    //   50: aload_1
    //   51: ldc_w 340
    //   54: invokevirtual 338	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   57: pop
    //   58: iinc 2 1
    //   61: goto -51 -> 10
    //   64: astore_3
    //   65: ldc 64
    //   67: ldc_w 342
    //   70: aload_3
    //   71: invokestatic 147	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   74: aload_0
    //   75: invokespecial 344	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:getGroupCapabilityProfile	()Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
    //   78: astore 4
    //   80: new 40	java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 41	java/lang/StringBuilder:<init>	()V
    //   87: ldc_w 346
    //   90: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: aload_0
    //   94: getfield 90	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:groupId	Ljava/lang/String;
    //   97: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: ldc_w 348
    //   103: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: ldc_w 350
    //   109: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: aload_0
    //   113: getfield 119	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:groupName	Ljava/lang/String;
    //   116: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: ldc_w 352
    //   122: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: ldc_w 354
    //   128: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   131: ldc_w 356
    //   134: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   137: ldc_w 358
    //   140: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: ldc_w 360
    //   146: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: aload_0
    //   150: getfield 90	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:groupId	Ljava/lang/String;
    //   153: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: ldc_w 362
    //   159: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: ldc_w 364
    //   165: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: aload_0
    //   169: getfield 119	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:groupName	Ljava/lang/String;
    //   172: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: ldc_w 366
    //   178: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: ldc_w 368
    //   184: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   187: aload_1
    //   188: invokevirtual 369	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   191: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: ldc_w 371
    //   197: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   200: ldc_w 373
    //   203: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: aload 4
    //   208: invokevirtual 258	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile:getCapabilityIDsAsString	()Ljava/lang/String;
    //   211: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: ldc_w 375
    //   217: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   220: ldc_w 377
    //   223: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: aload 4
    //   228: invokevirtual 263	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile:getCapabilityValuesAsString	()Ljava/lang/String;
    //   231: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: ldc_w 379
    //   237: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   240: ldc_w 381
    //   243: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   246: ldc_w 383
    //   249: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   255: astore 5
    //   257: new 40	java/lang/StringBuilder
    //   260: dup
    //   261: invokespecial 41	java/lang/StringBuilder:<init>	()V
    //   264: aload 5
    //   266: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   269: ldc_w 385
    //   272: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   275: aload_0
    //   276: invokespecial 387	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:getDevicesXMLString	()Ljava/lang/String;
    //   279: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   282: ldc_w 389
    //   285: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   288: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   291: astore 6
    //   293: new 40	java/lang/StringBuilder
    //   296: dup
    //   297: invokespecial 41	java/lang/StringBuilder:<init>	()V
    //   300: aload 6
    //   302: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   305: aload_0
    //   306: aload 4
    //   308: invokevirtual 392	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile:getCapabilityIDToValueMap	()Ljava/util/Map;
    //   311: invokespecial 394	com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup:getCapabilitiesXMLString	(Ljava/util/Map;)Ljava/lang/String;
    //   314: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   317: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   320: astore 7
    //   322: new 40	java/lang/StringBuilder
    //   325: dup
    //   326: invokespecial 41	java/lang/StringBuilder:<init>	()V
    //   329: aload 7
    //   331: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   334: ldc_w 396
    //   337: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   343: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	344	0	this	CloudRequestAddOrEditGroup
    //   7	181	1	localStringBuffer	StringBuffer
    //   9	50	2	i	int
    //   64	7	3	localJSONException	JSONException
    //   78	229	4	localGroupCapabilityProfile	GroupCapabilityProfile
    //   255	10	5	str1	String
    //   291	10	6	str2	String
    //   320	10	7	str3	String
    // Exception table:
    //   from	to	target	type
    //   10	58	64	org/json/JSONException
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return this.requestType;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 4;
  }
  
  public String getURL()
  {
    String str = this.URL_1 + this.homeId + "/?remoteSync=true";
    SDKLogUtils.infoLog("SDK_CloudRequestAddOrEditGroup", "Cloud request url: " + str);
    return str;
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
    SDKLogUtils.infoLog("AddGroup: ", "success: " + paramBoolean);
    Object localObject = "null";
    if (paramArrayOfByte != null) {}
    try
    {
      String str3 = new String(paramArrayOfByte, "UTF-8");
      localObject = str3;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      String str1;
      boolean bool;
      for (;;)
      {
        int i;
        localUnsupportedEncodingException.printStackTrace();
        this.mDevMgr.sendNotification("set_state", Boolean.toString(false), this.bridgeUDN);
      }
      label289:
      if (this.isNewGroup) {
        break label518;
      }
      ArrayList localArrayList = this.mCacheManager.getDevicesForGroup(this.groupId);
      if (localArrayList == null) {
        break label457;
      }
      for (;;)
      {
        try
        {
          if ((localArrayList.size() > 0) && (localArrayList.size() > this.deviceIDs.length()))
          {
            SDKLogUtils.infoLog("SDK_CloudRequestAddOrEditGroup", "removing device from existing group");
            Iterator localIterator = localArrayList.iterator();
            if (localIterator.hasNext())
            {
              DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator.next();
              j = 0;
              int k = this.deviceIDs.length();
              int m = 0;
              if (j < k)
              {
                if (!this.deviceIDs.getString(j).equalsIgnoreCase(localDeviceInformation2.getUDN())) {
                  continue;
                }
                m = 1;
              }
              if (m != 0) {
                continue;
              }
              str1 = localDeviceInformation2.getUDN();
              SDKLogUtils.infoLog("SDK_CloudRequestAddOrEditGroup", "removedDeviceID:" + str1);
            }
          }
        }
        catch (JSONException localJSONException1)
        {
          int j;
          label457:
          DeviceInformation localDeviceInformation1;
          label518:
          SDKLogUtils.errorLog("SDK_CloudRequestAddOrEditGroup", "JSON Exception", localJSONException1);
          continue;
        }
        if ((str1 != null) && (!str1.isEmpty()))
        {
          localDeviceInformation1 = this.mDevMgr.getDeviceInformationFromDevicesArray(str1);
          localDeviceInformation1.setGroupID("");
          localDeviceInformation1.setGroupName("");
          this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation1);
          this.mCacheManager.updateDB(localDeviceInformation1, false, false, true);
        }
        this.mDevMgr.sendNotification("set_state", Boolean.toString(bool), this.bridgeUDN);
        return;
        j++;
      }
      this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.bridgeUDN);
    }
    SDKLogUtils.infoLog("SDK_CloudRequestAddOrEditGroup", "Cloud response: " + (String)localObject);
    if (paramBoolean)
    {
      str1 = "";
      bool = parseResponse((String)localObject);
      SDKLogUtils.infoLog("SDK_CloudRequestAddOrEditGroup", "Response parse: " + String.valueOf(bool));
      if (bool)
      {
        i = 0;
        for (;;)
        {
          if (i >= this.deviceIDs.length()) {
            break label289;
          }
          try
          {
            String str2 = this.deviceIDs.getString(i);
            DeviceInformation localDeviceInformation3 = this.mDevMgr.updateZigbeeCapabilities(str2, this.deviceCapabilities);
            localDeviceInformation3.setGroupID(this.groupId);
            localDeviceInformation3.setGroupName(this.groupName);
            if (this.groupIcon.isEmpty()) {
              this.groupIcon = WemoUtils.getZigbeeIcon(localDeviceInformation3.getManufacturerName(), localDeviceInformation3.getModelCode());
            }
            localDeviceInformation3.setGroupIcon(this.groupIcon);
            this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation3);
            this.mCacheManager.updateDB(localDeviceInformation3, false, false, true);
            i++;
          }
          catch (JSONException localJSONException2)
          {
            for (;;)
            {
              localJSONException2.printStackTrace();
            }
          }
        }
      }
    }
  }
  
  public class GroupCapabilityProfile
  {
    private Map<String, String> capabilityIDToValueMap = new HashMap();
    private String capabilityIDsAsString = "";
    private String capabilityValuesAsString = "";
    
    public GroupCapabilityProfile() {}
    
    public Map<String, String> getCapabilityIDToValueMap()
    {
      return this.capabilityIDToValueMap;
    }
    
    public String getCapabilityIDsAsString()
    {
      return this.capabilityIDsAsString;
    }
    
    public String getCapabilityValuesAsString()
    {
      return this.capabilityValuesAsString;
    }
    
    public void setCapabilityIDToValueMap(Map<String, String> paramMap)
    {
      this.capabilityIDToValueMap = paramMap;
      this.capabilityIDsAsString = TextUtils.join(",", paramMap.keySet());
      this.capabilityValuesAsString = TextUtils.join(",", paramMap.values());
    }
    
    public void setCapabilityIDsAsString(String paramString)
    {
      this.capabilityIDsAsString = paramString;
    }
    
    public void setCapabilityValuesAsString(String paramString)
    {
      this.capabilityValuesAsString = paramString;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */