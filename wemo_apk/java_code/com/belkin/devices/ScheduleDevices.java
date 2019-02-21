package com.belkin.devices;

import android.content.Context;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.rules.db.RulesDb;
import com.belkin.rules.utils.WeeklyCalenderStringsCreator;

public class ScheduleDevices
{
  private Context mContext;
  private UpnpDeviceList mUpnpDeviceList;
  private RulesDb rDB;
  
  public ScheduleDevices(Context paramContext)
  {
    try
    {
      this.mContext = paramContext;
      this.rDB = RulesDb.getRulesDatabase(this.mContext);
      this.mUpnpDeviceList = UpnpDeviceList.getInstance(this.mContext);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void updateDeviceSchedule(String paramString)
  {
    updateDeviceSchedule(new String[] { paramString });
  }
  
  public void updateDeviceSchedule(String[] paramArrayOfString)
  {
    WeeklyCalenderStringsCreator localWeeklyCalenderStringsCreator = new WeeklyCalenderStringsCreator(this.mContext);
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String str1 = paramArrayOfString[j];
      String[] arrayOfString = new String[8];
      arrayOfString[7] = str1;
      int k = 1;
      if (k <= 7)
      {
        String str2 = localWeeklyCalenderStringsCreator.getScheduleString(Integer.valueOf(k), str1);
        if (str2.equals("0")) {
          str2 = "";
        }
        if (k == 1) {
          arrayOfString[6] = str2;
        }
        for (;;)
        {
          k++;
          break;
          arrayOfString[(k - 2)] = str2;
        }
      }
      this.mUpnpDeviceList.updateWeeklyCalenderString(arrayOfString);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/ScheduleDevices.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */