package org.apache.cordova.geolocation;

import android.app.Activity;
import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.Permissions;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GeoBroker
  extends CordovaPlugin
{
  public static final String TAG = "GeoBroker";
  private GPSListener gpsListener;
  private LocationManager locationManager;
  private Context mContext;
  private NetworkListener networkListener;
  private Permissions permissions;
  
  private void addWatch(String paramString, CallbackContext paramCallbackContext, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.gpsListener.addWatch(paramString, paramCallbackContext);
      return;
    }
    this.networkListener.addWatch(paramString, paramCallbackContext);
  }
  
  private void clearWatch(String paramString)
  {
    this.gpsListener.clearWatch(paramString);
    this.networkListener.clearWatch(paramString);
  }
  
  private void getCurrentLocation(CallbackContext paramCallbackContext, boolean paramBoolean, int paramInt)
  {
    if (paramBoolean)
    {
      this.gpsListener.addCallback(paramCallbackContext, paramInt);
      return;
    }
    this.networkListener.addCallback(paramCallbackContext, paramInt);
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (this.locationManager == null) {
      this.locationManager = ((LocationManager)this.cordova.getActivity().getSystemService("location"));
    }
    boolean bool2;
    String str3;
    if ((this.locationManager.isProviderEnabled("gps")) || (this.locationManager.isProviderEnabled("network")))
    {
      if (this.networkListener == null) {
        this.networkListener = new NetworkListener(this.locationManager, this);
      }
      if (this.gpsListener == null) {
        this.gpsListener = new GPSListener(this.locationManager, this);
      }
      if (paramString.equals("getLocation"))
      {
        bool2 = paramJSONArray.getBoolean(0);
        int i = paramJSONArray.getInt(1);
        if (this.permissions.checkLocationPermission())
        {
          LocationManager localLocationManager = this.locationManager;
          if (bool2)
          {
            str3 = "gps";
            Location localLocation = localLocationManager.getLastKnownLocation(str3);
            if ((localLocation == null) || (System.currentTimeMillis() - localLocation.getTime() > i)) {
              break label205;
            }
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, returnLocationJSON(localLocation)));
          }
        }
      }
    }
    for (;;)
    {
      return true;
      str3 = "network";
      break;
      label205:
      getCurrentLocation(paramCallbackContext, bool2, paramJSONArray.optInt(2, 60000));
      continue;
      LogUtils.debugLog("GeoBroker", " Location Permission Denied");
      continue;
      if (paramString.equals("addWatch"))
      {
        String str2 = paramJSONArray.getString(0);
        boolean bool1 = paramJSONArray.getBoolean(1);
        if (this.permissions.checkLocationPermission()) {
          addWatch(str2, paramCallbackContext, bool1);
        } else {
          LogUtils.debugLog("GeoBroker", " Location Permission Denied");
        }
      }
      else if (paramString.equals("clearWatch"))
      {
        String str1 = paramJSONArray.getString(0);
        if (this.permissions.checkLocationPermission()) {
          clearWatch(str1);
        } else {
          LogUtils.debugLog("GeoBroker", " Location Permission Denied");
        }
      }
      else
      {
        return false;
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.NO_RESULT, "Location API is not available for this device."));
      }
    }
  }
  
  public void fail(int paramInt, String paramString, CallbackContext paramCallbackContext, boolean paramBoolean)
  {
    JSONObject localJSONObject = new JSONObject();
    String str = null;
    try
    {
      localJSONObject.put("code", paramInt);
      localJSONObject.put("message", paramString);
      if (localJSONObject != null)
      {
        localPluginResult = new PluginResult(PluginResult.Status.ERROR, localJSONObject);
        localPluginResult.setKeepCallback(paramBoolean);
        paramCallbackContext.sendPluginResult(localPluginResult);
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        str = "{'code':" + paramInt + ",'message':'" + paramString.replaceAll("'", "'") + "'}";
        localJSONObject = null;
        continue;
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, str);
      }
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.permissions = Permissions.getInstance(this.mContext);
  }
  
  public boolean isGlobalListener(CordovaLocationListener paramCordovaLocationListener)
  {
    GPSListener localGPSListener = this.gpsListener;
    boolean bool1 = false;
    if (localGPSListener != null)
    {
      NetworkListener localNetworkListener = this.networkListener;
      bool1 = false;
      if (localNetworkListener != null) {
        if (!this.gpsListener.equals(paramCordovaLocationListener))
        {
          boolean bool2 = this.networkListener.equals(paramCordovaLocationListener);
          bool1 = false;
          if (!bool2) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public void onDestroy()
  {
    if (this.networkListener != null)
    {
      this.networkListener.destroy();
      this.networkListener = null;
    }
    if (this.gpsListener != null)
    {
      this.gpsListener.destroy();
      this.gpsListener = null;
    }
  }
  
  public void onReset()
  {
    onDestroy();
  }
  
  public JSONObject returnLocationJSON(Location paramLocation)
  {
    localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("latitude", paramLocation.getLatitude());
      localJSONObject.put("longitude", paramLocation.getLongitude());
      if (paramLocation.hasAltitude()) {}
      for (Double localDouble = Double.valueOf(paramLocation.getAltitude());; localDouble = null)
      {
        localJSONObject.put("altitude", localDouble);
        localJSONObject.put("accuracy", paramLocation.getAccuracy());
        boolean bool1 = paramLocation.hasBearing();
        Float localFloat = null;
        if (bool1)
        {
          boolean bool2 = paramLocation.hasSpeed();
          localFloat = null;
          if (bool2) {
            localFloat = Float.valueOf(paramLocation.getBearing());
          }
        }
        localJSONObject.put("heading", localFloat);
        localJSONObject.put("velocity", paramLocation.getSpeed());
        localJSONObject.put("timestamp", paramLocation.getTime());
        return localJSONObject;
      }
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void win(Location paramLocation, CallbackContext paramCallbackContext, boolean paramBoolean)
  {
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, returnLocationJSON(paramLocation));
    localPluginResult.setKeepCallback(paramBoolean);
    paramCallbackContext.sendPluginResult(localPluginResult);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/geolocation/GeoBroker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */