package com.belkin.rules.dbmigration;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.Vector;

public class SQLHandlerWrapper
{
  Context context;
  SQLiteDatabase myDb = null;
  
  public SQLHandlerWrapper(String paramString, Context paramContext)
  {
    this.context = paramContext;
    this.myDb = paramContext.openOrCreateDatabase(paramString, 268435456, null);
  }
  
  public boolean CloseOpenedDatabase()
  {
    try
    {
      this.myDb.close();
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public Vector<Sensor_1_X> gettheSensorRuleList(String paramString)
  {
    String[] arrayOfString = { "id", "udn", "sensorudn", "name", "type", "enable", "sun", "mon", "tue", "wed", "thu", "fri", "sat", "starttime", "endtime", "sensitivity" };
    try
    {
      if (this.myDb == null) {
        return null;
      }
      Cursor localCursor = this.myDb.query(paramString, arrayOfString, null, null, null, null, null, null);
      if (localCursor != null)
      {
        int i = 0 + 1;
        int j = localCursor.getColumnIndex(arrayOfString[0]);
        int k = i + 1;
        int m = localCursor.getColumnIndex(arrayOfString[i]);
        int n = k + 1;
        int i1 = localCursor.getColumnIndex(arrayOfString[k]);
        int i2 = n + 1;
        int i3 = localCursor.getColumnIndex(arrayOfString[n]);
        int i4 = i2 + 1;
        int i5 = localCursor.getColumnIndex(arrayOfString[i2]);
        int i6 = i4 + 1;
        int i7 = localCursor.getColumnIndex(arrayOfString[i4]);
        int i8 = i6 + 1;
        int i9 = localCursor.getColumnIndex(arrayOfString[i6]);
        int i10 = i8 + 1;
        int i11 = localCursor.getColumnIndex(arrayOfString[i8]);
        int i12 = i10 + 1;
        int i13 = localCursor.getColumnIndex(arrayOfString[i10]);
        int i14 = i12 + 1;
        int i15 = localCursor.getColumnIndex(arrayOfString[i12]);
        int i16 = i14 + 1;
        int i17 = localCursor.getColumnIndex(arrayOfString[i14]);
        int i18 = i16 + 1;
        int i19 = localCursor.getColumnIndex(arrayOfString[i16]);
        int i20 = i18 + 1;
        int i21 = localCursor.getColumnIndex(arrayOfString[i18]);
        int i22 = i20 + 1;
        int i23 = localCursor.getColumnIndex(arrayOfString[i20]);
        int i24 = i22 + 1;
        int i25 = localCursor.getColumnIndex(arrayOfString[i22]);
        (i24 + 1);
        int i26 = localCursor.getColumnIndex(arrayOfString[i24]);
        localVector = new Vector();
        localCursor.moveToFirst();
        do
        {
          Sensor_1_X localSensor_1_X = new Sensor_1_X();
          localSensor_1_X.setId(localCursor.getInt(j));
          localSensor_1_X.setUdn(localCursor.getString(m));
          localSensor_1_X.setSensorudn(localCursor.getString(i1));
          localSensor_1_X.setName(localCursor.getString(i3));
          localSensor_1_X.setType(localCursor.getString(i5));
          localSensor_1_X.setEnable(localCursor.getString(i7));
          localSensor_1_X.setSun(localCursor.getString(i9));
          localSensor_1_X.setMon(localCursor.getString(i11));
          localSensor_1_X.setTue(localCursor.getString(i13));
          localSensor_1_X.setWed(localCursor.getString(i15));
          localSensor_1_X.setThu(localCursor.getString(i17));
          localSensor_1_X.setFri(localCursor.getString(i19));
          localSensor_1_X.setSat(localCursor.getString(i21));
          localSensor_1_X.setStartTime(localCursor.getString(i23));
          localSensor_1_X.setEndTime(localCursor.getString(i25));
          localSensor_1_X.setSensitivity(localCursor.getString(i26));
          localVector.addElement(localSensor_1_X);
        } while (localCursor.moveToNext());
        if ((localCursor == null) || (localCursor.isClosed())) {
          break label726;
        }
        localCursor.close();
        return localVector;
      }
    }
    catch (Exception localException)
    {
      return null;
    }
    Vector localVector = null;
    label726:
    return localVector;
  }
  
  public Vector<Switch_1_X> gettheSwitchRuleList(String paramString)
  {
    String[] arrayOfString = { "id", "udn", "name", "type", "enable", "sun", "mon", "tue", "wed", "thu", "fri", "sat", "deviceact" };
    try
    {
      if (this.myDb == null) {
        return null;
      }
      Cursor localCursor = this.myDb.query(paramString, arrayOfString, null, null, null, null, null, null);
      if (localCursor != null)
      {
        int i = 0 + 1;
        int j = localCursor.getColumnIndex(arrayOfString[0]);
        int k = i + 1;
        int m = localCursor.getColumnIndex(arrayOfString[i]);
        int n = k + 1;
        int i1 = localCursor.getColumnIndex(arrayOfString[k]);
        int i2 = n + 1;
        int i3 = localCursor.getColumnIndex(arrayOfString[n]);
        int i4 = i2 + 1;
        int i5 = localCursor.getColumnIndex(arrayOfString[i2]);
        int i6 = i4 + 1;
        int i7 = localCursor.getColumnIndex(arrayOfString[i4]);
        int i8 = i6 + 1;
        int i9 = localCursor.getColumnIndex(arrayOfString[i6]);
        int i10 = i8 + 1;
        int i11 = localCursor.getColumnIndex(arrayOfString[i8]);
        int i12 = i10 + 1;
        int i13 = localCursor.getColumnIndex(arrayOfString[i10]);
        int i14 = i12 + 1;
        int i15 = localCursor.getColumnIndex(arrayOfString[i12]);
        int i16 = i14 + 1;
        int i17 = localCursor.getColumnIndex(arrayOfString[i14]);
        int i18 = i16 + 1;
        int i19 = localCursor.getColumnIndex(arrayOfString[i16]);
        (i18 + 1);
        int i20 = localCursor.getColumnIndex(arrayOfString[i18]);
        localVector = new Vector();
        localCursor.moveToFirst();
        do
        {
          Switch_1_X localSwitch_1_X = new Switch_1_X();
          localSwitch_1_X.setId(localCursor.getInt(j));
          localSwitch_1_X.setUdn(localCursor.getString(m));
          localSwitch_1_X.setName(localCursor.getString(i1));
          localSwitch_1_X.setType(localCursor.getString(i3));
          localSwitch_1_X.setEnable(localCursor.getString(i5));
          localSwitch_1_X.setSun(localCursor.getString(i7));
          localSwitch_1_X.setMon(localCursor.getString(i9));
          localSwitch_1_X.setTue(localCursor.getString(i11));
          localSwitch_1_X.setWed(localCursor.getString(i13));
          localSwitch_1_X.setThu(localCursor.getString(i15));
          localSwitch_1_X.setFri(localCursor.getString(i17));
          localSwitch_1_X.setSat(localCursor.getString(i19));
          localSwitch_1_X.setDeviceact(localCursor.getString(i20));
          localVector.addElement(localSwitch_1_X);
        } while (localCursor.moveToNext());
        if ((localCursor == null) || (localCursor.isClosed())) {
          break label613;
        }
        localCursor.close();
        return localVector;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return null;
    }
    Vector localVector = null;
    label613:
    return localVector;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/SQLHandlerWrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */