package com.belkin.wemo.rules.data.weeklycalendar;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMLocationInfo;
import com.belkin.wemo.rules.data.RMUserLocation;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.device.RMLed;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class RMWeeklyCalendarGeneratorUtility
{
  private static final String TAG = RMWeeklyCalendarGeneratorUtility.class.getSimpleName();
  
  private static String getDayCalendarString(List<RMDBRule> paramList, String paramString, int paramInt)
  {
    String str1 = "";
    if (paramList.size() > 0)
    {
      ArrayList localArrayList1 = new ArrayList();
      ArrayList localArrayList2 = new ArrayList();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        RMDBRule localRMDBRule = (RMDBRule)localIterator.next();
        if (getRuleDevice(paramString, localRMDBRule) != null) {
          switch (localRMDBRule.getRuleType())
          {
          }
        }
      }
      String str2 = localArrayList1.size() + "\\|" + TextUtils.join("\\|", localArrayList1);
      if (0 != 0) {
        str2 = str2 + "#" + RMUserLocation.getInstance().getLocationInfo().getLatitude() + "," + RMUserLocation.getInstance().getLocationInfo().getLongitude();
      }
      str1 = str2 + "$" + TextUtils.join(",", localArrayList2);
    }
    return str1;
  }
  
  private static Map<String, String> getDayCalendarString(int paramInt, List<RMDBRule> paramList, String paramString)
  {
    HashMap localHashMap = new HashMap();
    String str = getDayCalendarString(paramList, paramString, paramInt);
    SDKLogUtils.debugLog(TAG, "Store Rules: NON LINK Day Calendar String: RulesDB Day Index: " + paramInt + "; String: " + str);
    switch (paramInt)
    {
    default: 
      return localHashMap;
    case 2: 
      localHashMap.put(RMDBRule.DAY_STR_MONDAY, str);
      return localHashMap;
    case 3: 
      localHashMap.put(RMDBRule.DAY_STR_TUESDAY, str);
      return localHashMap;
    case 4: 
      localHashMap.put(RMDBRule.DAY_STR_WEDNESDAY, str);
      return localHashMap;
    case 5: 
      localHashMap.put(RMDBRule.DAY_STR_THURSDAY, str);
      return localHashMap;
    case 6: 
      localHashMap.put(RMDBRule.DAY_STR_FRIDAY, str);
      return localHashMap;
    case 7: 
      localHashMap.put(RMDBRule.DAY_STR_SATURDAY, str);
      return localHashMap;
    }
    localHashMap.put(RMDBRule.DAY_STR_SUNDAY, str);
    return localHashMap;
  }
  
  private static String getLinkCalendarString(int paramInt, List<RMDBRule> paramList, String paramString)
  {
    String str = getLinkDayCalendarString(paramList, paramString, paramInt);
    SDKLogUtils.debugLog(TAG, "Store Rules: Day Calendar String: RulesDB Day Index: " + paramInt + "; String: " + str);
    switch (paramInt)
    {
    default: 
      return "";
    case 2: 
      return "<" + RMDBRule.DAY_STR_MONDAY + ">" + str + "</" + RMDBRule.DAY_STR_MONDAY + ">";
    case 3: 
      return "<" + RMDBRule.DAY_STR_TUESDAY + ">" + str + "</" + RMDBRule.DAY_STR_TUESDAY + ">";
    case 4: 
      return "<" + RMDBRule.DAY_STR_WEDNESDAY + ">" + str + "</" + RMDBRule.DAY_STR_WEDNESDAY + ">";
    case 5: 
      return "<" + RMDBRule.DAY_STR_THURSDAY + ">" + str + "</" + RMDBRule.DAY_STR_THURSDAY + ">";
    case 6: 
      return "<" + RMDBRule.DAY_STR_FRIDAY + ">" + str + "</" + RMDBRule.DAY_STR_FRIDAY + ">";
    case 7: 
      return "<" + RMDBRule.DAY_STR_SATURDAY + ">" + str + "</" + RMDBRule.DAY_STR_SATURDAY + ">";
    }
    return "<" + RMDBRule.DAY_STR_SUNDAY + ">" + str + "</" + RMDBRule.DAY_STR_SUNDAY + ">";
  }
  
  private static String getLinkDayCalendarString(List<RMDBRule> paramList, String paramString, int paramInt)
  {
    String str1 = "";
    if (paramList.size() > 0)
    {
      ArrayList localArrayList1 = new ArrayList();
      ArrayList localArrayList2 = new ArrayList();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        RMDBRule localRMDBRule = (RMDBRule)localIterator.next();
        if ((RMLed)getRuleDevice(paramString, localRMDBRule) != null) {
          switch (localRMDBRule.getRuleType())
          {
          }
        }
      }
      String str2 = localArrayList1.size() + "\\|" + TextUtils.join("\\|", localArrayList1);
      if (0 != 0) {
        str2 = str2 + "#" + RMUserLocation.getInstance().getLocationInfo().getLatitude() + "," + RMUserLocation.getInstance().getLocationInfo().getLongitude();
      }
      str1 = str2 + "$" + TextUtils.join(",", localArrayList2);
    }
    return str1;
  }
  
  public static Map<String, String> getLinkWeeklyCalendarStringMap(String paramString1, String paramString2)
  {
    HashMap localHashMap1 = new HashMap();
    HashMap localHashMap2 = RMUserRules.INSTANCE.getDBRuleDeviceDayToRulesMap(paramString1);
    String str1 = "";
    Iterator localIterator = localHashMap2.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      str1 = str1 + getLinkCalendarString(((Integer)localEntry.getKey()).intValue(), (List)localEntry.getValue(), paramString1);
    }
    String str2 = "<Calendar><DeviceID>" + paramString2 + "</DeviceID>" + str1 + "</Calendar>";
    localHashMap1.put(Constants.TAG_CALENDAR_LIST, str2);
    SDKLogUtils.debugLog(TAG, "(LINK) LED Calendar String for ID: " + paramString2 + ": " + str2);
    return localHashMap1;
  }
  
  private static RMDBRuleDevice getRuleDevice(String paramString, RMDBRule paramRMDBRule)
  {
    Iterator localIterator = paramRMDBRule.getRuleDeviceSet().iterator();
    RMDBRuleDevice localRMDBRuleDevice;
    do
    {
      boolean bool = localIterator.hasNext();
      localObject = null;
      if (!bool) {
        break;
      }
      localRMDBRuleDevice = (RMDBRuleDevice)localIterator.next();
    } while (!localRMDBRuleDevice.getUiUdn().equals(paramString));
    Object localObject = localRMDBRuleDevice;
    return (RMDBRuleDevice)localObject;
  }
  
  public static Map<String, String> getWeeklyCalendarStringMap(String paramString)
  {
    return new HashMap();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/weeklycalendar/RMWeeklyCalendarGeneratorUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */