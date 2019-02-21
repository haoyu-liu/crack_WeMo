package com.luckycatlabs.sunrisesunset.calculator;

import com.luckycatlabs.sunrisesunset.Zenith;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.TimeZone;

public class SolarEventCalculator
{
  private final Location location;
  private final TimeZone timeZone;
  
  public SolarEventCalculator(Location paramLocation, String paramString)
  {
    this.location = paramLocation;
    this.timeZone = TimeZone.getTimeZone(paramString);
  }
  
  public SolarEventCalculator(Location paramLocation, TimeZone paramTimeZone)
  {
    this.location = paramLocation;
    this.timeZone = paramTimeZone;
  }
  
  private BigDecimal adjustForDST(BigDecimal paramBigDecimal, Calendar paramCalendar)
  {
    BigDecimal localBigDecimal = paramBigDecimal;
    if (this.timeZone.inDaylightTime(paramCalendar.getTime())) {
      localBigDecimal = localBigDecimal.add(BigDecimal.ONE);
    }
    if (localBigDecimal.doubleValue() > 24.0D) {
      localBigDecimal = localBigDecimal.subtract(BigDecimal.valueOf(24L));
    }
    return localBigDecimal;
  }
  
  private BigDecimal computeSolarEventTime(Zenith paramZenith, Calendar paramCalendar, boolean paramBoolean)
  {
    paramCalendar.setTimeZone(this.timeZone);
    BigDecimal localBigDecimal1 = getLongitudeHour(paramCalendar, Boolean.valueOf(paramBoolean));
    BigDecimal localBigDecimal2 = getSunTrueLongitude(getMeanAnomaly(localBigDecimal1));
    BigDecimal localBigDecimal3 = getCosineSunLocalHour(localBigDecimal2, paramZenith);
    if ((localBigDecimal3.doubleValue() < -1.0D) || (localBigDecimal3.doubleValue() > 1.0D)) {
      return null;
    }
    return getLocalTime(getLocalMeanTime(localBigDecimal2, localBigDecimal1, getSunLocalHour(localBigDecimal3, Boolean.valueOf(paramBoolean))), paramCalendar);
  }
  
  private BigDecimal convertDegreesToRadians(BigDecimal paramBigDecimal)
  {
    return multiplyBy(paramBigDecimal, BigDecimal.valueOf(0.017453292519943295D));
  }
  
  private BigDecimal convertRadiansToDegrees(BigDecimal paramBigDecimal)
  {
    return multiplyBy(paramBigDecimal, new BigDecimal(57.29577951308232D));
  }
  
  private BigDecimal divideBy(BigDecimal paramBigDecimal1, BigDecimal paramBigDecimal2)
  {
    return paramBigDecimal1.divide(paramBigDecimal2, 4, RoundingMode.HALF_EVEN);
  }
  
  private BigDecimal getArcCosineFor(BigDecimal paramBigDecimal)
  {
    return setScale(BigDecimal.valueOf(Math.acos(paramBigDecimal.doubleValue())));
  }
  
  private BigDecimal getBaseLongitudeHour()
  {
    return divideBy(this.location.getLongitude(), BigDecimal.valueOf(15L));
  }
  
  private BigDecimal getCosineOfSunDeclination(BigDecimal paramBigDecimal)
  {
    return setScale(BigDecimal.valueOf(Math.cos(BigDecimal.valueOf(Math.asin(paramBigDecimal.doubleValue())).doubleValue())));
  }
  
  private BigDecimal getCosineSunLocalHour(BigDecimal paramBigDecimal, Zenith paramZenith)
  {
    BigDecimal localBigDecimal1 = getSinOfSunDeclination(paramBigDecimal);
    BigDecimal localBigDecimal2 = getCosineOfSunDeclination(localBigDecimal1);
    BigDecimal localBigDecimal3 = BigDecimal.valueOf(Math.cos(convertDegreesToRadians(paramZenith.degrees()).doubleValue()));
    BigDecimal localBigDecimal4 = BigDecimal.valueOf(Math.sin(convertDegreesToRadians(this.location.getLatitude()).doubleValue()));
    BigDecimal localBigDecimal5 = BigDecimal.valueOf(Math.cos(convertDegreesToRadians(this.location.getLatitude()).doubleValue()));
    return setScale(divideBy(localBigDecimal3.subtract(localBigDecimal1.multiply(localBigDecimal4)), localBigDecimal2.multiply(localBigDecimal5)));
  }
  
  private BigDecimal getDayOfYear(Calendar paramCalendar)
  {
    return new BigDecimal(paramCalendar.get(6));
  }
  
  private BigDecimal getLocalMeanTime(BigDecimal paramBigDecimal1, BigDecimal paramBigDecimal2, BigDecimal paramBigDecimal3)
  {
    BigDecimal localBigDecimal1 = getRightAscension(paramBigDecimal1);
    BigDecimal localBigDecimal2 = paramBigDecimal2.multiply(new BigDecimal("0.06571"));
    BigDecimal localBigDecimal3 = paramBigDecimal3.add(localBigDecimal1).subtract(localBigDecimal2).subtract(new BigDecimal("6.622"));
    if (localBigDecimal3.doubleValue() < 0.0D) {
      localBigDecimal3 = localBigDecimal3.add(BigDecimal.valueOf(24L));
    }
    for (;;)
    {
      return setScale(localBigDecimal3);
      if (localBigDecimal3.doubleValue() > 24.0D) {
        localBigDecimal3 = localBigDecimal3.subtract(BigDecimal.valueOf(24L));
      }
    }
  }
  
  private BigDecimal getLocalTime(BigDecimal paramBigDecimal, Calendar paramCalendar)
  {
    return adjustForDST(paramBigDecimal.subtract(getBaseLongitudeHour()).add(getUTCOffSet(paramCalendar)), paramCalendar);
  }
  
  private String getLocalTimeAsString(BigDecimal paramBigDecimal)
  {
    if (paramBigDecimal == null) {
      return "99:99";
    }
    BigDecimal localBigDecimal1 = paramBigDecimal;
    if (localBigDecimal1.compareTo(BigDecimal.ZERO) == -1) {
      localBigDecimal1 = localBigDecimal1.add(BigDecimal.valueOf(24.0D));
    }
    String[] arrayOfString = localBigDecimal1.toPlainString().split("\\.");
    int i = Integer.parseInt(arrayOfString[0]);
    BigDecimal localBigDecimal2 = new BigDecimal("0." + arrayOfString[1]).multiply(BigDecimal.valueOf(60L)).setScale(0, RoundingMode.HALF_EVEN);
    if (localBigDecimal2.intValue() == 60)
    {
      localBigDecimal2 = BigDecimal.ZERO;
      i++;
    }
    if (i == 24) {
      i = 0;
    }
    String str1;
    if (localBigDecimal2.intValue() < 10)
    {
      str1 = "0" + localBigDecimal2.toPlainString();
      if (i >= 10) {
        break label227;
      }
    }
    label227:
    for (String str2 = "0" + String.valueOf(i);; str2 = String.valueOf(i))
    {
      return str2 + ":" + str1;
      str1 = localBigDecimal2.toPlainString();
      break;
    }
  }
  
  private BigDecimal getLongitudeHour(Calendar paramCalendar, Boolean paramBoolean)
  {
    int i = 18;
    if (paramBoolean.booleanValue()) {
      i = 6;
    }
    BigDecimal localBigDecimal = divideBy(BigDecimal.valueOf(i).subtract(getBaseLongitudeHour()), BigDecimal.valueOf(24L));
    return setScale(getDayOfYear(paramCalendar).add(localBigDecimal));
  }
  
  private BigDecimal getMeanAnomaly(BigDecimal paramBigDecimal)
  {
    return setScale(multiplyBy(new BigDecimal("0.9856"), paramBigDecimal).subtract(new BigDecimal("3.289")));
  }
  
  private BigDecimal getRightAscension(BigDecimal paramBigDecimal)
  {
    BigDecimal localBigDecimal1 = setScale(convertRadiansToDegrees(new BigDecimal(Math.atan(convertDegreesToRadians(multiplyBy(convertRadiansToDegrees(new BigDecimal(Math.tan(convertDegreesToRadians(paramBigDecimal).doubleValue()))), new BigDecimal("0.91764"))).doubleValue()))));
    if (localBigDecimal1.doubleValue() < 0.0D) {
      localBigDecimal1 = localBigDecimal1.add(BigDecimal.valueOf(360L));
    }
    for (;;)
    {
      BigDecimal localBigDecimal2 = BigDecimal.valueOf(90L);
      return divideBy(localBigDecimal1.add(paramBigDecimal.divide(localBigDecimal2, 0, RoundingMode.FLOOR).multiply(localBigDecimal2).subtract(localBigDecimal1.divide(localBigDecimal2, 0, RoundingMode.FLOOR).multiply(localBigDecimal2))), BigDecimal.valueOf(15L));
      if (localBigDecimal1.doubleValue() > 360.0D) {
        localBigDecimal1 = localBigDecimal1.subtract(BigDecimal.valueOf(360L));
      }
    }
  }
  
  private BigDecimal getSinOfSunDeclination(BigDecimal paramBigDecimal)
  {
    return setScale(BigDecimal.valueOf(Math.sin(convertDegreesToRadians(paramBigDecimal).doubleValue())).multiply(new BigDecimal("0.39782")));
  }
  
  private BigDecimal getSunLocalHour(BigDecimal paramBigDecimal, Boolean paramBoolean)
  {
    BigDecimal localBigDecimal = convertRadiansToDegrees(getArcCosineFor(paramBigDecimal));
    if (paramBoolean.booleanValue()) {
      localBigDecimal = BigDecimal.valueOf(360L).subtract(localBigDecimal);
    }
    return divideBy(localBigDecimal, BigDecimal.valueOf(15L));
  }
  
  private BigDecimal getSunTrueLongitude(BigDecimal paramBigDecimal)
  {
    BigDecimal localBigDecimal1 = new BigDecimal(Math.sin(convertDegreesToRadians(paramBigDecimal).doubleValue()));
    BigDecimal localBigDecimal2 = new BigDecimal(Math.sin(multiplyBy(convertDegreesToRadians(paramBigDecimal), BigDecimal.valueOf(2L)).doubleValue()));
    BigDecimal localBigDecimal3 = paramBigDecimal.add(multiplyBy(localBigDecimal1, new BigDecimal("1.916"))).add(multiplyBy(localBigDecimal2, new BigDecimal("0.020")).add(new BigDecimal("282.634")));
    if (localBigDecimal3.doubleValue() > 360.0D) {
      localBigDecimal3 = localBigDecimal3.subtract(BigDecimal.valueOf(360L));
    }
    return setScale(localBigDecimal3);
  }
  
  private BigDecimal getUTCOffSet(Calendar paramCalendar)
  {
    return new BigDecimal(paramCalendar.get(15) / 3600000).setScale(0, RoundingMode.HALF_EVEN);
  }
  
  private BigDecimal multiplyBy(BigDecimal paramBigDecimal1, BigDecimal paramBigDecimal2)
  {
    return setScale(paramBigDecimal1.multiply(paramBigDecimal2));
  }
  
  private BigDecimal setScale(BigDecimal paramBigDecimal)
  {
    return paramBigDecimal.setScale(4, RoundingMode.HALF_EVEN);
  }
  
  public Calendar computeSunriseCalendar(Zenith paramZenith, Calendar paramCalendar)
  {
    return getLocalTimeAsCalendar(computeSolarEventTime(paramZenith, paramCalendar, true), paramCalendar);
  }
  
  public String computeSunriseTime(Zenith paramZenith, Calendar paramCalendar)
  {
    return getLocalTimeAsString(computeSolarEventTime(paramZenith, paramCalendar, true));
  }
  
  public Calendar computeSunsetCalendar(Zenith paramZenith, Calendar paramCalendar)
  {
    return getLocalTimeAsCalendar(computeSolarEventTime(paramZenith, paramCalendar, false), paramCalendar);
  }
  
  public String computeSunsetTime(Zenith paramZenith, Calendar paramCalendar)
  {
    return getLocalTimeAsString(computeSolarEventTime(paramZenith, paramCalendar, false));
  }
  
  protected Calendar getLocalTimeAsCalendar(BigDecimal paramBigDecimal, Calendar paramCalendar)
  {
    if (paramBigDecimal == null) {
      return null;
    }
    Calendar localCalendar = (Calendar)paramCalendar.clone();
    BigDecimal localBigDecimal1 = paramBigDecimal;
    if (localBigDecimal1.compareTo(BigDecimal.ZERO) == -1)
    {
      localBigDecimal1 = localBigDecimal1.add(BigDecimal.valueOf(24.0D));
      localCalendar.add(11, -24);
    }
    String[] arrayOfString = localBigDecimal1.toPlainString().split("\\.");
    int i = Integer.parseInt(arrayOfString[0]);
    BigDecimal localBigDecimal2 = new BigDecimal("0." + arrayOfString[1]).multiply(BigDecimal.valueOf(60L)).setScale(0, RoundingMode.HALF_EVEN);
    if (localBigDecimal2.intValue() == 60)
    {
      localBigDecimal2 = BigDecimal.ZERO;
      i++;
    }
    if (i == 24) {
      i = 0;
    }
    localCalendar.set(11, i);
    localCalendar.set(12, localBigDecimal2.intValue());
    localCalendar.set(13, 0);
    localCalendar.set(14, 0);
    localCalendar.setTimeZone(paramCalendar.getTimeZone());
    return localCalendar;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */