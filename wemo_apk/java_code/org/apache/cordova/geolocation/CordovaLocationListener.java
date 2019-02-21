package org.apache.cordova.geolocation;

import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.cordova.CallbackContext;

public class CordovaLocationListener
  implements LocationListener
{
  public static int PERMISSION_DENIED = 1;
  public static int POSITION_UNAVAILABLE = 2;
  public static int TIMEOUT = 3;
  private String TAG = "[Cordova Location Listener]";
  private List<CallbackContext> callbacks = new ArrayList();
  protected LocationManager locationManager;
  private GeoBroker owner;
  protected boolean running = false;
  private Timer timer = null;
  public HashMap<String, CallbackContext> watches = new HashMap();
  
  public CordovaLocationListener(LocationManager paramLocationManager, GeoBroker paramGeoBroker, String paramString)
  {
    this.locationManager = paramLocationManager;
    this.owner = paramGeoBroker;
    this.TAG = paramString;
  }
  
  private void cancelTimer()
  {
    if (this.timer != null)
    {
      this.timer.cancel();
      this.timer.purge();
      this.timer = null;
    }
  }
  
  private void stop()
  {
    cancelTimer();
    if (this.running)
    {
      this.locationManager.removeUpdates(this);
      this.running = false;
    }
  }
  
  private void win(Location paramLocation)
  {
    cancelTimer();
    Iterator localIterator1 = this.callbacks.iterator();
    while (localIterator1.hasNext())
    {
      CallbackContext localCallbackContext = (CallbackContext)localIterator1.next();
      this.owner.win(paramLocation, localCallbackContext, false);
    }
    if ((this.owner.isGlobalListener(this)) && (this.watches.size() == 0))
    {
      Log.d(this.TAG, "Stopping global listener");
      stop();
    }
    this.callbacks.clear();
    Iterator localIterator2 = this.watches.values().iterator();
    while (localIterator2.hasNext()) {
      this.owner.win(paramLocation, (CallbackContext)localIterator2.next(), true);
    }
  }
  
  public void addCallback(CallbackContext paramCallbackContext, int paramInt)
  {
    if (this.timer == null) {
      this.timer = new Timer();
    }
    this.timer.schedule(new LocationTimeoutTask(paramCallbackContext, this), paramInt);
    this.callbacks.add(paramCallbackContext);
    if (size() == 1) {
      start();
    }
  }
  
  public void addWatch(String paramString, CallbackContext paramCallbackContext)
  {
    this.watches.put(paramString, paramCallbackContext);
    if (size() == 1) {
      start();
    }
  }
  
  public void clearWatch(String paramString)
  {
    if (this.watches.containsKey(paramString)) {
      this.watches.remove(paramString);
    }
    if (size() == 0) {
      stop();
    }
  }
  
  public void destroy()
  {
    stop();
  }
  
  protected void fail(int paramInt, String paramString)
  {
    cancelTimer();
    Iterator localIterator1 = this.callbacks.iterator();
    while (localIterator1.hasNext())
    {
      CallbackContext localCallbackContext = (CallbackContext)localIterator1.next();
      this.owner.fail(paramInt, paramString, localCallbackContext, false);
    }
    if ((this.owner.isGlobalListener(this)) && (this.watches.size() == 0))
    {
      Log.d(this.TAG, "Stopping global listener");
      stop();
    }
    this.callbacks.clear();
    Iterator localIterator2 = this.watches.values().iterator();
    while (localIterator2.hasNext()) {
      this.owner.fail(paramInt, paramString, (CallbackContext)localIterator2.next(), true);
    }
  }
  
  public void onLocationChanged(Location paramLocation)
  {
    Log.d(this.TAG, "The location has been updated!");
    win(paramLocation);
  }
  
  public void onProviderDisabled(String paramString)
  {
    Log.d(this.TAG, "Location provider '" + paramString + "' disabled.");
    fail(POSITION_UNAVAILABLE, "GPS provider disabled.");
  }
  
  public void onProviderEnabled(String paramString)
  {
    Log.d(this.TAG, "Location provider " + paramString + " has been enabled");
  }
  
  public void onStatusChanged(String paramString, int paramInt, Bundle paramBundle)
  {
    Log.d(this.TAG, "The status of the provider " + paramString + " has changed");
    if (paramInt == 0)
    {
      Log.d(this.TAG, paramString + " is OUT OF SERVICE");
      fail(POSITION_UNAVAILABLE, "Provider " + paramString + " is out of service.");
      return;
    }
    if (paramInt == 1)
    {
      Log.d(this.TAG, paramString + " is TEMPORARILY_UNAVAILABLE");
      return;
    }
    Log.d(this.TAG, paramString + " is AVAILABLE");
  }
  
  public int size()
  {
    return this.watches.size() + this.callbacks.size();
  }
  
  protected void start()
  {
    if (!this.running)
    {
      if (this.locationManager.getProvider("network") != null)
      {
        this.running = true;
        this.locationManager.requestLocationUpdates("network", 60000L, 10.0F, this);
      }
    }
    else {
      return;
    }
    fail(POSITION_UNAVAILABLE, "Network provider is not available.");
  }
  
  private class LocationTimeoutTask
    extends TimerTask
  {
    private CallbackContext callbackContext = null;
    private CordovaLocationListener listener = null;
    
    public LocationTimeoutTask(CallbackContext paramCallbackContext, CordovaLocationListener paramCordovaLocationListener)
    {
      this.callbackContext = paramCallbackContext;
      this.listener = paramCordovaLocationListener;
    }
    
    public void run()
    {
      Iterator localIterator = this.listener.callbacks.iterator();
      while (localIterator.hasNext())
      {
        CallbackContext localCallbackContext = (CallbackContext)localIterator.next();
        if (this.callbackContext == localCallbackContext) {
          this.listener.callbacks.remove(localCallbackContext);
        }
      }
      if (this.listener.size() == 0) {
        this.listener.stop();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/geolocation/CordovaLocationListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */