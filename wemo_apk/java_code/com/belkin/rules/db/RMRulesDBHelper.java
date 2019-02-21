package com.belkin.rules.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;

public final class RMRulesDBHelper
  extends SQLiteOpenHelper
{
  private static final String TAG = RMRulesDBHelper.class.getSimpleName();
  private static RMRulesDBHelper rulesDBHelperIns;
  
  private RMRulesDBHelper(String paramString, Context paramContext)
  {
    super(paramContext, paramString, null, 9);
  }
  
  public static void destroy()
  {
    try
    {
      if (rulesDBHelperIns != null) {
        rulesDBHelperIns.close();
      }
      rulesDBHelperIns = null;
      return;
    }
    finally {}
  }
  
  private static String getDBFilename()
  {
    String str = RuleUtility.getLocalDBPath() + "/" + RuleUtility.getLocalDBName();
    LogUtils.infoLog(TAG, "dbName: " + str);
    return str;
  }
  
  public static RMRulesDBHelper getInstance(Context paramContext)
  {
    try
    {
      rulesDBHelperIns = new RMRulesDBHelper(getDBFilename(), paramContext);
      RMRulesDBHelper localRMRulesDBHelper = rulesDBHelperIns;
      return localRMRulesDBHelper;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT , Frequency INTEGER )");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )");
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2) {}
  
  public SQLiteDatabase openDatabase()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = SQLiteDatabase.openDatabase(getDBFilename(), null, 16);
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      LogUtils.errorLog(TAG, "SQLiteException while opening DB: ", localSQLiteException);
    }
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/db/RMRulesDBHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */