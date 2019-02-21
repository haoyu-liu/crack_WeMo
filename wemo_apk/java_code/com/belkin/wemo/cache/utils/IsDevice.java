package com.belkin.wemo.cache.utils;

public class IsDevice
{
  private static final String AIR_PURIFIER = "AirPurifier";
  private static final String BRIDGE = "Bridge";
  private static final String COFFEE_MAKER = "CoffeeMaker";
  private static final String CONTROLLEE = "Controllee";
  private static final String CROCKPOT = "Crockpot";
  private static final String DIMMER = "Dimmer";
  private static final String HEATER = "Heater";
  private static final String HUMIDIFIER = "Humidifier";
  private static final String INSIGHT = "Insight";
  private static final String LIGHTSWITCH = "Lightswitch";
  private static final String LIGHT_SWITCH = "LightSocket";
  private static final String MAKER = "Maker";
  private static final String MOTION_SENSOR = "Sensor";
  private static final String NESTTHERMOSTAT = "WEMO";
  private static final String NETCAM = "NetCam";
  private static final String SWITCH = "Socket";
  
  public static boolean AirPurifier(String paramString)
  {
    return (paramString != null) && (paramString.contains("AirPurifier"));
  }
  
  public static boolean Bridge(String paramString)
  {
    return (paramString != null) && (paramString.contains("Bridge"));
  }
  
  public static boolean CoffeeMaker(String paramString)
  {
    return (paramString != null) && (paramString.contains("CoffeeMaker"));
  }
  
  public static boolean Crockpot(String paramString)
  {
    return (paramString != null) && (paramString.contains("Crockpot"));
  }
  
  public static boolean Dimmer(String paramString)
  {
    return (paramString != null) && (paramString.contains("Dimmer"));
  }
  
  public static boolean Heater(String paramString)
  {
    return (paramString != null) && (paramString.contains("Heater"));
  }
  
  public static boolean Humidifier(String paramString)
  {
    return (paramString != null) && (paramString.contains("Humidifier"));
  }
  
  public static boolean Insight(String paramString)
  {
    return (paramString != null) && (paramString.contains("Insight"));
  }
  
  public static boolean InvisibleInList(String paramString)
  {
    return (paramString != null) && (Bridge(paramString));
  }
  
  public static boolean LightSocket(String paramString)
  {
    return (paramString != null) && (paramString.contains("Lightswitch"));
  }
  
  public static boolean LightSwitch(String paramString)
  {
    return (paramString != null) && (paramString.contains("LightSocket"));
  }
  
  public static boolean Maker(String paramString)
  {
    return (paramString != null) && (paramString.contains("Maker"));
  }
  
  public static boolean MotionSensor(String paramString)
  {
    return (paramString != null) && (paramString.contains("Sensor"));
  }
  
  public static boolean NestThermostat(String paramString)
  {
    return (paramString != null) && (paramString.contains("WEMO"));
  }
  
  public static boolean NetCam(String paramString)
  {
    return (paramString != null) && (paramString.contains("NetCam"));
  }
  
  public static boolean NonSmartMaker(String paramString)
  {
    return (Maker(paramString)) && (!CoffeeMaker(paramString));
  }
  
  public static boolean Smart(String paramString)
  {
    return (paramString.contains("Heater")) || (paramString.contains("Humidifier")) || (paramString.contains("AirPurifier")) || (paramString.contains("CoffeeMaker"));
  }
  
  public static boolean Switch(String paramString)
  {
    return (paramString != null) && (paramString.contains("Socket"));
  }
  
  public static boolean WeMoSwitch(String paramString)
  {
    return (paramString != null) && ((paramString.contains("Socket")) || (paramString.contains("Controllee")));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/IsDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */