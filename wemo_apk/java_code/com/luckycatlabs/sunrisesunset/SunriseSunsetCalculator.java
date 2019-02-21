package com.luckycatlabs.sunrisesunset;

import com.luckycatlabs.sunrisesunset.calculator.SolarEventCalculator;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.util.Calendar;
import java.util.TimeZone;

public class SunriseSunsetCalculator
{
  private SolarEventCalculator calculator;
  private Location location;
  
  public SunriseSunsetCalculator(Location paramLocation, String paramString)
  {
    this.location = paramLocation;
    this.calculator = new SolarEventCalculator(paramLocation, paramString);
  }
  
  public SunriseSunsetCalculator(Location paramLocation, TimeZone paramTimeZone)
  {
    this.location = paramLocation;
    this.calculator = new SolarEventCalculator(paramLocation, paramTimeZone);
  }
  
  public static Calendar getSunrise(double paramDouble1, double paramDouble2, TimeZone paramTimeZone, Calendar paramCalendar, double paramDouble3)
  {
    return new SolarEventCalculator(new Location(paramDouble1, paramDouble2), paramTimeZone).computeSunriseCalendar(new Zenith(90.0D - paramDouble3), paramCalendar);
  }
  
  public static Calendar getSunset(double paramDouble1, double paramDouble2, TimeZone paramTimeZone, Calendar paramCalendar, double paramDouble3)
  {
    return new SolarEventCalculator(new Location(paramDouble1, paramDouble2), paramTimeZone).computeSunsetCalendar(new Zenith(90.0D - paramDouble3), paramCalendar);
  }
  
  public Calendar getAstronomicalSunriseCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseCalendar(Zenith.ASTRONOMICAL, paramCalendar);
  }
  
  public String getAstronomicalSunriseForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseTime(Zenith.ASTRONOMICAL, paramCalendar);
  }
  
  public Calendar getAstronomicalSunsetCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetCalendar(Zenith.ASTRONOMICAL, paramCalendar);
  }
  
  public String getAstronomicalSunsetForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetTime(Zenith.ASTRONOMICAL, paramCalendar);
  }
  
  public Calendar getCivilSunriseCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseCalendar(Zenith.CIVIL, paramCalendar);
  }
  
  public String getCivilSunriseForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseTime(Zenith.CIVIL, paramCalendar);
  }
  
  public Calendar getCivilSunsetCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetCalendar(Zenith.CIVIL, paramCalendar);
  }
  
  public String getCivilSunsetForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetTime(Zenith.CIVIL, paramCalendar);
  }
  
  public Location getLocation()
  {
    return this.location;
  }
  
  public Calendar getNauticalSunriseCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseCalendar(Zenith.NAUTICAL, paramCalendar);
  }
  
  public String getNauticalSunriseForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseTime(Zenith.NAUTICAL, paramCalendar);
  }
  
  public Calendar getNauticalSunsetCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetCalendar(Zenith.NAUTICAL, paramCalendar);
  }
  
  public String getNauticalSunsetForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetTime(Zenith.NAUTICAL, paramCalendar);
  }
  
  public Calendar getOfficialSunriseCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseCalendar(Zenith.OFFICIAL, paramCalendar);
  }
  
  public String getOfficialSunriseForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunriseTime(Zenith.OFFICIAL, paramCalendar);
  }
  
  public Calendar getOfficialSunsetCalendarForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetCalendar(Zenith.OFFICIAL, paramCalendar);
  }
  
  public String getOfficialSunsetForDate(Calendar paramCalendar)
  {
    return this.calculator.computeSunsetTime(Zenith.OFFICIAL, paramCalendar);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/luckycatlabs/sunrisesunset/SunriseSunsetCalculator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */