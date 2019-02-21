package com.belkin.wemo.rules.data;

public class RMUserLocation
{
  private static final String TAG = RMUserLocation.class.getSimpleName();
  private static RMUserLocation userLocation;
  private RMLocationInfo locationInfo = new RMLocationInfo();
  
  public static RMUserLocation getInstance()
  {
    if (userLocation == null) {
      userLocation = new RMUserLocation();
    }
    return userLocation;
  }
  
  public RMLocationInfo getLocationInfo()
  {
    return this.locationInfo;
  }
  
  public void setLocationInfo(RMLocationInfo paramRMLocationInfo)
  {
    if (paramRMLocationInfo == null)
    {
      this.locationInfo = new RMLocationInfo();
      return;
    }
    this.locationInfo = paramRMLocationInfo;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMUserLocation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */