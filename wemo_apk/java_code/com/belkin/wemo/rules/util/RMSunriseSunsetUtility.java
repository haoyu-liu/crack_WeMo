package com.belkin.wemo.rules.util;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.luckycatlabs.sunrisesunset.SunriseSunsetCalculator;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.util.Calendar;
import java.util.TimeZone;

public class RMSunriseSunsetUtility
{
  public static final String DATE_FORMAT_MM_DD_YYYY = "MM/dd/yyyy";
  private static final String TAG = RMSunriseSunsetUtility.class.getSimpleName();
  public static final String TIMEZONE_GMT = "GMT+00:00";
  
  public static double getSunriseTime(double paramDouble1, double paramDouble2, int paramInt)
  {
    SDKLogUtils.debugLog(TAG, "Sunrise Time Requested. Latitude: " + paramDouble1 + "; Longtitude: " + paramDouble2 + "; day: " + paramInt);
    double d = 0.0D;
    SunriseSunsetCalculator localSunriseSunsetCalculator = new SunriseSunsetCalculator(new Location(paramDouble1, paramDouble2), TimeZone.getTimeZone("GMT+00:00"));
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(11, 0);
    localCalendar.set(12, 0);
    String str = localSunriseSunsetCalculator.getOfficialSunriseForDate(localCalendar);
    int i = TimeZone.getDefault().getRawOffset() / 1000;
    SDKLogUtils.debugLog(TAG, "GMT Sunrise Time String: " + str + "; Timezone offset in sec: " + i);
    String[] arrayOfString = str.split(":");
    if (arrayOfString.length == 2) {
      d = 1 + (i + getTimeInSecSinceMidnight(Integer.parseInt(arrayOfString[0]), Integer.parseInt(arrayOfString[1])));
    }
    SDKLogUtils.debugLog(TAG, "Final location based sunrise time calculated: " + d);
    return d;
  }
  
  public static double getSunsetTime(double paramDouble1, double paramDouble2, int paramInt)
  {
    SDKLogUtils.debugLog(TAG, "Sunset Time Requested. Latitude: " + paramDouble1 + "; Longtitude: " + paramDouble2 + "; day: " + paramInt);
    double d = 0.0D;
    SunriseSunsetCalculator localSunriseSunsetCalculator = new SunriseSunsetCalculator(new Location(paramDouble1, paramDouble2), TimeZone.getTimeZone("GMT+00:00"));
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(11, 0);
    localCalendar.set(12, 0);
    String str = localSunriseSunsetCalculator.getOfficialSunsetForDate(localCalendar);
    int i = TimeZone.getDefault().getRawOffset() / 1000;
    SDKLogUtils.debugLog(TAG, "GMT Sunset Time String: " + str + "; Timezone offset in sec: " + i);
    String[] arrayOfString = str.split(":");
    if (arrayOfString.length == 2) {
      d = 2 + (i + getTimeInSecSinceMidnight(Integer.parseInt(arrayOfString[0]), Integer.parseInt(arrayOfString[1])));
    }
    SDKLogUtils.debugLog(TAG, "Final location based sunset time calculated: " + d);
    return d;
  }
  
  public static int getTimeInSecSinceMidnight(int paramInt1, int paramInt2)
  {
    return 60 * (paramInt2 + paramInt1 * 60);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/util/RMSunriseSunsetUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */