package com.belkin.controller;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class SensorEventChangeController
{
  private static final String TAG = "SensorEventChangeController";
  private static SensorEventChangeController sInstance = null;
  private ArrayList<SensorEventChangeListener> listenersList = null;
  private Context mContext = null;
  
  private SensorEventChangeController() {}
  
  private SensorEventChangeController(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public static SensorEventChangeController getInstance(Context paramContext)
  {
    try
    {
      if (sInstance == null) {
        sInstance = new SensorEventChangeController(paramContext);
      }
      SensorEventChangeController localSensorEventChangeController = sInstance;
      return localSensorEventChangeController;
    }
    finally {}
  }
  
  public void addNotificationListener(SensorEventChangeListener paramSensorEventChangeListener)
  {
    if (paramSensorEventChangeListener == null)
    {
      LogUtils.infoLog("SensorEventChangeController", "listener is null returning..");
      return;
    }
    if (this.listenersList == null) {
      this.listenersList = new ArrayList();
    }
    if (!this.listenersList.contains(paramSensorEventChangeListener))
    {
      LogUtils.infoLog("SensorEventChangeController", "added Notification Listener");
      this.listenersList.add(paramSensorEventChangeListener);
      return;
    }
    LogUtils.infoLog("SensorEventChangeController", "Notification Listener already exists");
  }
  
  public boolean changeStateNotification(JSONObject paramJSONObject)
  {
    if (paramJSONObject != null) {
      for (;;)
      {
        int j;
        try
        {
          String str1 = paramJSONObject.getString("productName");
          if ((TextUtils.isEmpty(str1)) || ((!str1.equals("AlarmSensor")) && (!str1.equals("PIR")) && (!str1.equals("Fob")) && (!str1.equals("DWSensor")))) {
            break;
          }
          String str2 = paramJSONObject.getString("capabilityId");
          if (!TextUtils.isEmpty(str2))
          {
            String[] arrayOfString = str2.split(",");
            int i = arrayOfString.length;
            j = 0;
            if (j < i)
            {
              String str3 = arrayOfString[j];
              if ((!str3.equals("10500")) && (!str3.equals("20502"))) {
                break label156;
              }
              SharePreferences.updateSensorEventCounter(this.mContext);
              break label156;
            }
          }
          if (!WemoUtils.isAppInForeground()) {
            return true;
          }
          sendNotification();
          return false;
        }
        catch (JSONException localJSONException)
        {
          LogUtils.errorLog("SensorEventChangeController", "JSONException in setting json object", localJSONException);
          return false;
        }
        label156:
        j++;
      }
    }
    return false;
  }
  
  public void sendNotification()
  {
    if ((this.listenersList != null) && (this.listenersList.size() > 0))
    {
      Iterator localIterator = this.listenersList.iterator();
      while (localIterator.hasNext())
      {
        SensorEventChangeListener localSensorEventChangeListener = (SensorEventChangeListener)localIterator.next();
        if (localSensorEventChangeListener != null) {
          localSensorEventChangeListener.sensorEventsCounter();
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/SensorEventChangeController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */