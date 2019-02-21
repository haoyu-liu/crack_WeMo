package com.belkin.wemo.cache.location;

import com.belkin.wemo.cache.data.DeviceInformation;
import java.util.Set;

public class Location
{
  private int ID;
  private Set<String> arpMacs;
  private String currentHomeId;
  private Set<DeviceInformation> deviceList;
  private String homeId;
  private String name;
  private String rulesDB;
  private Set<String> ssids;
  
  public Location(String paramString1, String paramString2)
  {
    this.homeId = paramString1;
    this.name = paramString2;
  }
  
  public Set<String> getArpMacs()
  {
    return this.arpMacs;
  }
  
  public String getCurrentHomeId()
  {
    return this.currentHomeId;
  }
  
  public Set<DeviceInformation> getDeviceList()
  {
    return this.deviceList;
  }
  
  public String getHomeId()
  {
    return this.homeId;
  }
  
  public int getID()
  {
    return this.ID;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public String getRulesDB()
  {
    return this.rulesDB;
  }
  
  public Set<String> getSsids()
  {
    return this.ssids;
  }
  
  public void setArpMacs(Set<String> paramSet)
  {
    this.arpMacs = paramSet;
  }
  
  public void setCurrentHomeId(String paramString)
  {
    this.currentHomeId = paramString;
  }
  
  public void setDeviceList(Set<DeviceInformation> paramSet)
  {
    this.deviceList = paramSet;
  }
  
  public void setHomeId(String paramString)
  {
    this.homeId = paramString;
  }
  
  public void setID(int paramInt)
  {
    this.ID = paramInt;
  }
  
  public void setName(String paramString)
  {
    this.name = paramString;
  }
  
  public void setRulesDB(String paramString)
  {
    this.rulesDB = paramString;
  }
  
  public void setSsids(Set<String> paramSet)
  {
    this.ssids = paramSet;
  }
  
  public String toString()
  {
    return "#ID: " + this.ID + " " + this.homeId + " " + this.name + " ArpMacs: " + getArpMacs() + " Ssids: " + getSsids();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/location/Location.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */