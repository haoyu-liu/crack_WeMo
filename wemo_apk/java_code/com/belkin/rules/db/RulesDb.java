package com.belkin.rules.db;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.belkin.cloud.objects.CloudObjectLocation;
import com.belkin.exception.DatabaseException;
import com.belkin.rules.dbmigration.RuleDevicesTable;
import com.belkin.rules.utils.RulesConstants;
import com.belkin.utils.RuleUtility;
import java.util.ArrayList;

public class RulesDb
{
  private static String TAG = "RulesDb";
  private static RulesDb mRulesDatabaseInstance;
  private SQLiteDatabase db;
  private RuleUtility ruleUtility;
  
  public RulesDb(Context paramContext)
  {
    this.ruleUtility = new RuleUtility(paramContext);
  }
  
  private RuleDevicesTable cursorToRuleDevicesTable(Cursor paramCursor)
  {
    RuleDevicesTable localRuleDevicesTable = new RuleDevicesTable();
    localRuleDevicesTable.setRuleId(paramCursor.getInt(paramCursor.getColumnIndex("RuleID")));
    localRuleDevicesTable.setDeviceId(paramCursor.getString(paramCursor.getColumnIndex("DeviceID")));
    localRuleDevicesTable.setGroupId(paramCursor.getInt(paramCursor.getColumnIndex("GroupID")));
    localRuleDevicesTable.setDayId(paramCursor.getInt(paramCursor.getColumnIndex("DayID")));
    localRuleDevicesTable.setStarttime(paramCursor.getInt(paramCursor.getColumnIndex("StartTime")));
    localRuleDevicesTable.setRuleDuration(paramCursor.getInt(paramCursor.getColumnIndex("RuleDuration")));
    localRuleDevicesTable.setStartAction(paramCursor.getDouble(paramCursor.getColumnIndex("StartAction")));
    localRuleDevicesTable.setEndAction(paramCursor.getDouble(paramCursor.getColumnIndex("EndAction")));
    localRuleDevicesTable.setSensorDuration(paramCursor.getInt(paramCursor.getColumnIndex("SensorDuration")));
    localRuleDevicesTable.setType(paramCursor.getInt(paramCursor.getColumnIndex("Type")));
    localRuleDevicesTable.setValue(paramCursor.getString(paramCursor.getColumnIndex("Value")));
    localRuleDevicesTable.setLevel(paramCursor.getInt(paramCursor.getColumnIndex("Level")));
    localRuleDevicesTable.setOnModeOffset(paramCursor.getInt(paramCursor.getColumnIndex("OnModeOffset")));
    localRuleDevicesTable.setOffModeOffset(paramCursor.getInt(paramCursor.getColumnIndex("OffModeOffset")));
    localRuleDevicesTable.setZBCapabilityStart(paramCursor.getString(paramCursor.getColumnIndex("ZBCapabilityStart")));
    localRuleDevicesTable.setZBCapabilityEnd(paramCursor.getString(paramCursor.getColumnIndex("ZBCapabilityEnd")));
    return localRuleDevicesTable;
  }
  
  public static RulesDb getRulesDatabase(Context paramContext)
    throws DatabaseException
  {
    try
    {
      if (mRulesDatabaseInstance == null) {
        mRulesDatabaseInstance = new RulesDb(paramContext);
      }
      if (mRulesDatabaseInstance.db == null)
      {
        new RuleUtility(paramContext);
        RulesDb localRulesDb1 = mRulesDatabaseInstance;
        StringBuilder localStringBuilder = new StringBuilder();
        localRulesDb1.db = SQLiteDatabase.openDatabase(RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName(), null, 0);
      }
      RulesDb localRulesDb2 = mRulesDatabaseInstance;
      return localRulesDb2;
    }
    catch (Exception localException)
    {
      throw new DatabaseException("Can not create Database", localException);
    }
    finally {}
  }
  
  public ArrayList<RuleDevicesTable> getDeviceTableItems(String paramString, Integer paramInteger)
  {
    ArrayList localArrayList = new ArrayList();
    Cursor localCursor;
    do
    {
      try
      {
        String[] arrayOfString = new String[2];
        arrayOfString[0] = paramString;
        arrayOfString[1] = paramInteger.toString();
        localCursor = this.db.query("RULEDEVICES", null, "DeviceID=? AND DayID = ?", arrayOfString, null, null, null, null);
        localCursor.moveToFirst();
        while (!localCursor.isAfterLast())
        {
          localArrayList.add(cursorToRuleDevicesTable(localCursor));
          localCursor.moveToNext();
        }
        while (localCursor == null) {}
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return localArrayList;
      }
    } while (localCursor.isClosed());
    localCursor.close();
    return localArrayList;
  }
  
  public ArrayList<RuleDevicesTable> getDeviceTableItemsBySensor(String paramString, Integer paramInteger)
  {
    ArrayList localArrayList = new ArrayList();
    Cursor localCursor1;
    do
    {
      for (;;)
      {
        try
        {
          String[] arrayOfString1 = { paramString, "-1" };
          localCursor1 = this.db.query(true, "RULEDEVICES", new String[] { "RuleID" }, "DeviceID=? AND DayID = ?", arrayOfString1, null, null, null, null);
          localCursor1.moveToFirst();
          if (localCursor1.isAfterLast()) {
            break;
          }
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = paramInteger.toString();
          arrayOfString2[1] = localCursor1.getString(localCursor1.getColumnIndex("RuleID"));
          Cursor localCursor2 = this.db.query("RULEDEVICES", null, "DayID =? AND RuleID=?", arrayOfString2, "DayID", null, "StartTime", null);
          localCursor2.moveToFirst();
          if (!localCursor2.isAfterLast())
          {
            localArrayList.add(cursorToRuleDevicesTable(localCursor2));
            localCursor2.moveToNext();
          }
          else
          {
            localCursor1.moveToNext();
          }
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
          return localArrayList;
        }
      }
    } while ((localCursor1 == null) || (localCursor1.isClosed()));
    localCursor1.close();
    return localArrayList;
  }
  
  public String getExtendedFeatureStr(Integer paramInteger)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = paramInteger.toString();
    Cursor localCursor = this.db.query("RULEDEVICES", null, "RuleID=? AND DayID=-1", arrayOfString, null, null, null, null);
    localCursor.moveToFirst();
    String str = localCursor.getString(localCursor.getColumnIndex("Type")) + ":" + localCursor.getString(localCursor.getColumnIndex("Value")) + ":" + localCursor.getString(localCursor.getColumnIndex("Level"));
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    return str;
  }
  
  public CloudObjectLocation getLocation()
  {
    try
    {
      Cursor localCursor = this.db.query(true, "LOCATIONINFO", new String[] { "cityName", "latitude", "longitude" }, null, null, null, null, null, null);
      localCursor.moveToFirst();
      CloudObjectLocation localCloudObjectLocation = new CloudObjectLocation();
      localCloudObjectLocation.setCityName(localCursor.getString(localCursor.getColumnIndex("cityName")));
      localCloudObjectLocation.setLatitude(Double.valueOf(localCursor.getDouble(localCursor.getColumnIndex("latitude"))));
      localCloudObjectLocation.setLongitude(Double.valueOf(localCursor.getDouble(localCursor.getColumnIndex("longitude"))));
      if ((localCursor != null) && (!localCursor.isClosed())) {
        localCursor.close();
      }
      return localCloudObjectLocation;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public String getMergedSensorDevices(RuleDevicesTable paramRuleDevicesTable, ArrayList<String> paramArrayList)
  {
    Log.i(TAG, "THE rule getValue is:::" + paramRuleDevicesTable.getValue());
    String str1 = "";
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    String[] arrayOfString = new String[4];
    arrayOfString[0] = ("" + paramRuleDevicesTable.getStarttime());
    arrayOfString[1] = ("" + paramRuleDevicesTable.getRuleDuration());
    arrayOfString[2] = ("" + paramRuleDevicesTable.getValue());
    arrayOfString[3] = ("" + paramRuleDevicesTable.getDayId());
    Cursor localCursor = this.db.query(true, "RULEDEVICES", new String[] { "RuleID", "DeviceID", "StartAction", "EndAction", "SensorDuration" }, "StartTime=? AND RuleDuration=? AND Value=? AND DayID = ?", arrayOfString, null, null, null, null);
    localCursor.moveToFirst();
    Integer localInteger1 = Integer.valueOf(0);
    while (!localCursor.isAfterLast())
    {
      Integer localInteger2 = new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("RuleID")));
      String str2 = localCursor.getString(localCursor.getColumnIndex("DeviceID"));
      if ((getRuleType(localInteger2).equals(RulesConstants.RULE_MAKER_MOTION)) || (getRuleType(localInteger2).equals(RulesConstants.RULE_MAKER_MOTION_NOTIFICATION)))
      {
        localCursor.moveToNext();
      }
      else
      {
        String str3;
        String str4;
        if (!localArrayList2.contains(str2))
        {
          localArrayList2.add(str2);
          if (localInteger1.intValue() > 0) {
            str1 = str1 + RulesConstants.SEMICOLUMN;
          }
          str3 = str1 + str2 + RulesConstants.COMMA;
          if ((!getRuleType(localInteger2).equals(RulesConstants.RULE_SENSOR_NOTIFICATION)) && (!getRuleType(localInteger2).equals(RulesConstants.RULE_INSIGHT))) {
            break label534;
          }
          str4 = getNotifyRuleID(localInteger2);
        }
        label534:
        String str6;
        for (str1 = str3 + "9" + RulesConstants.COMMA + str4 + RulesConstants.COMMA + "0";; str1 = str6 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("EndAction"))).toString())
        {
          if (!localArrayList1.contains(localInteger2.toString())) {
            localArrayList1.add(localInteger2.toString());
          }
          localInteger1 = Integer.valueOf(1 + localInteger1.intValue());
          localCursor.moveToNext();
          break;
          String str5 = str3 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("StartAction"))).toString() + RulesConstants.COMMA;
          str6 = str5 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("SensorDuration"))).toString() + RulesConstants.COMMA;
        }
      }
    }
    if (localInteger1.intValue() <= 1)
    {
      Log.i(TAG, "Returing NULL");
      return null;
    }
    paramArrayList.addAll(localArrayList1);
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    String str7 = localInteger1.toString() + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + str1;
    Log.i(TAG, "Value of FINAL RESULT IS:: " + str7);
    return str7;
  }
  
  public String getNotifyRuleID(Integer paramInteger)
  {
    String str1 = "RuleID=" + paramInteger;
    Cursor localCursor = this.db.query("SENSORNOTIFICATION", null, str1, null, null, null, null, null);
    localCursor.moveToFirst();
    String str2 = localCursor.getString(localCursor.getColumnIndex("NotifyRuleID"));
    Log.i(TAG, "getNotifyRuleID is ::" + str2);
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    return str2;
  }
  
  public String getRuleType(Integer paramInteger)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = paramInteger.toString();
    Cursor localCursor = this.db.query("RULES", null, "RuleID=?", arrayOfString, null, null, null, null);
    localCursor.moveToFirst();
    String str = localCursor.getString(localCursor.getColumnIndex("Type"));
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    return str;
  }
  
  public String getSensorDevicesStr(Integer paramInteger)
  {
    String str1 = "";
    String[] arrayOfString = new String[2];
    arrayOfString[0] = paramInteger.toString();
    arrayOfString[1] = "-1";
    Cursor localCursor = this.db.query(true, "RULEDEVICES", new String[] { "DeviceID", "StartAction", "EndAction", "SensorDuration" }, "RuleID=? AND DayID != ?", arrayOfString, null, null, null, null);
    localCursor.moveToFirst();
    Integer localInteger = Integer.valueOf(0);
    while (!localCursor.isAfterLast())
    {
      if (localInteger.intValue() > 0) {
        str1 = str1 + RulesConstants.SEMICOLUMN;
      }
      String str2 = str1 + localCursor.getString(localCursor.getColumnIndex("DeviceID")) + RulesConstants.COMMA;
      String str3 = str2 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("StartAction"))).toString() + RulesConstants.COMMA;
      String str4 = str3 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("SensorDuration"))).toString() + RulesConstants.COMMA;
      str1 = str4 + new Integer((int)localCursor.getFloat(localCursor.getColumnIndex("EndAction"))).toString();
      localInteger = Integer.valueOf(1 + localInteger.intValue());
      localCursor.moveToNext();
    }
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    return localInteger.toString() + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + str1;
  }
  
  public boolean isDisabled(Integer paramInteger)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = paramInteger.toString();
    Cursor localCursor = this.db.query("RULES", new String[] { "State" }, "RuleID =?", arrayOfString, null, null, null, null);
    localCursor.moveToFirst();
    int i = localCursor.getInt(localCursor.getColumnIndex("State"));
    boolean bool = false;
    if (i == 0) {
      bool = true;
    }
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    return bool;
  }
  
  public void removeRulesByUDN(String paramString)
  {
    String[] arrayOfString1 = { paramString };
    this.db.delete("RULEDEVICES", "DeviceID =?", arrayOfString1);
    String[] arrayOfString2 = { paramString, paramString };
    this.db.delete("DEVICECOMBINATION", "DeviceID =? OR SensorID =?", arrayOfString2);
    Cursor localCursor = this.db.query("RULEDEVICES", new String[] { "RuleID" }, null, null, "RuleID", null, null, null);
    String str = "";
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      if (!str.isEmpty()) {
        str = str + RulesConstants.COMMA;
      }
      str = str + localCursor.getString(localCursor.getColumnIndex("RuleID"));
      localCursor.moveToNext();
    }
    if ((localCursor != null) && (!localCursor.isClosed())) {
      localCursor.close();
    }
    String[] arrayOfString3 = { str };
    this.db.delete("RULES", "RuleID NOT IN (?)", arrayOfString3);
    String[] arrayOfString4 = { str };
    this.db.delete("RULESNOTIFYMESSAGE", "NotifyRuleID NOT IN (?)", arrayOfString4);
    String[] arrayOfString5 = { str };
    this.db.delete("SENSORNOTIFICATION", "NotifyRuleID NOT IN (?)", arrayOfString5);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/db/RulesDb.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */