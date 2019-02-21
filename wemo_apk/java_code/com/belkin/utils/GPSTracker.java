package com.belkin.utils;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import com.belkin.wemo.Permissions;

public class GPSTracker
  implements LocationListener
{
  private static final long MIN_DISTANCE_CHANGE_FOR_UPDATES = 10L;
  private static final long MIN_TIME_BW_UPDATES = 60000L;
  boolean canGetLocation = false;
  boolean isGPSEnabled = false;
  boolean isNetworkEnabled = false;
  double latitude;
  Location location;
  protected LocationManager locationManager;
  double longitude;
  private final Context mContext;
  private Permissions mpermissions;
  
  public GPSTracker(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public boolean canGetLocation()
  {
    LocationManager localLocationManager = (LocationManager)this.mContext.getSystemService("location");
    for (;;)
    {
      try
      {
        boolean bool4 = localLocationManager.isProviderEnabled("gps");
        bool1 = bool4;
      }
      catch (Exception localException1)
      {
        boolean bool3;
        boolean bool2;
        boolean bool1 = false;
        continue;
      }
      try
      {
        bool3 = localLocationManager.isProviderEnabled("network");
        bool2 = bool3;
      }
      catch (Exception localException2)
      {
        bool2 = false;
      }
    }
    if ((!bool1) && (!bool2)) {
      return this.canGetLocation;
    }
    return true;
  }
  
  public double getLatitude()
  {
    if (this.location == null) {
      this.location = getLocation();
    }
    for (this.latitude = this.location.getLatitude();; this.latitude = this.location.getLatitude()) {
      return this.latitude;
    }
  }
  
  public Location getLocation()
  {
    for (;;)
    {
      try
      {
        this.locationManager = ((LocationManager)this.mContext.getSystemService("location"));
        this.isGPSEnabled = this.locationManager.isProviderEnabled("gps");
        this.isNetworkEnabled = this.locationManager.isProviderEnabled("network");
        this.mpermissions = Permissions.getInstance(this.mContext);
        if (this.isGPSEnabled) {
          continue;
        }
        boolean bool = this.isNetworkEnabled;
        if (bool) {
          continue;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        continue;
        if ((!this.isGPSEnabled) || (this.location != null) || (!this.mpermissions.checkLocationPermission())) {
          continue;
        }
        this.locationManager.requestLocationUpdates("gps", 60000L, 10.0F, this);
        Log.d("GPS Enabled", "GPS Enabled");
        if (this.locationManager == null) {
          continue;
        }
        this.location = this.locationManager.getLastKnownLocation("gps");
        if (this.location == null) {
          continue;
        }
        this.latitude = this.location.getLatitude();
        this.longitude = this.location.getLongitude();
        continue;
      }
      return this.location;
      if (!this.isNetworkEnabled) {
        continue;
      }
      if (this.mpermissions.checkLocationPermission())
      {
        this.locationManager.requestLocationUpdates("network", 60000L, 10.0F, this);
        Log.d("Network", "Network");
        if (this.locationManager != null)
        {
          this.location = this.locationManager.getLastKnownLocation("network");
          if (this.location != null)
          {
            this.latitude = this.location.getLatitude();
            this.longitude = this.location.getLongitude();
          }
        }
      }
    }
  }
  
  public double getLongitude()
  {
    if (this.location == null) {
      this.location = getLocation();
    }
    for (this.longitude = this.location.getLongitude();; this.longitude = this.location.getLongitude()) {
      return this.longitude;
    }
  }
  
  public void onLocationChanged(Location paramLocation) {}
  
  public void onProviderDisabled(String paramString) {}
  
  public void onProviderEnabled(String paramString) {}
  
  public void onStatusChanged(String paramString, int paramInt, Bundle paramBundle) {}
  
  public void showSettingsAlert()
  {
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.mContext);
    localBuilder.setTitle("Location service is disabled");
    localBuilder.setMessage("Location service is currently disabled. Use the 'Settings' button below to launch the settings dialog where Location service can be enabled.");
    localBuilder.setPositiveButton("Settings", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        Intent localIntent = new Intent("android.settings.LOCATION_SOURCE_SETTINGS");
        GPSTracker.this.mContext.startActivity(localIntent);
      }
    });
    localBuilder.setNegativeButton("Cancel", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.cancel();
      }
    });
    localBuilder.show();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/GPSTracker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */