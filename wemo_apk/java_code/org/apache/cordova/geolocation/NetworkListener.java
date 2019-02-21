package org.apache.cordova.geolocation;

import android.location.LocationManager;

public class NetworkListener
  extends CordovaLocationListener
{
  public NetworkListener(LocationManager paramLocationManager, GeoBroker paramGeoBroker)
  {
    super(paramLocationManager, paramGeoBroker, "[Cordova NetworkListener]");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/geolocation/NetworkListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */