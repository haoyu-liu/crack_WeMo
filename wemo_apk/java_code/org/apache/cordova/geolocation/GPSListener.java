package org.apache.cordova.geolocation;

import android.location.LocationManager;

public class GPSListener
  extends CordovaLocationListener
{
  public GPSListener(LocationManager paramLocationManager, GeoBroker paramGeoBroker)
  {
    super(paramLocationManager, paramGeoBroker, "[Cordova GPSListener]");
  }
  
  protected void start()
  {
    if (!this.running)
    {
      if (this.locationManager.getProvider("gps") != null)
      {
        this.running = true;
        this.locationManager.requestLocationUpdates("gps", 60000L, 0.0F, this);
      }
    }
    else {
      return;
    }
    fail(CordovaLocationListener.POSITION_UNAVAILABLE, "GPS provider is not available.");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/geolocation/GPSListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */