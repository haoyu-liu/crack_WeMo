package com.belkin.wemo.rules.db;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.sqlite.WeMoSqliteOpenHelper;

public final class RMRulesDBHelper
  extends WeMoSqliteOpenHelper
{
  private static final String TAG = RMRulesDBHelper.class.getSimpleName();
  private static RMRulesDBHelper rulesDBHelperIns;
  private int connectionCounter;
  
  private RMRulesDBHelper(String paramString)
  {
    super(WeMo.INSTANCE.getContext(), paramString, null, 9);
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
    String str = "temppluginRules.db";
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    if (localRMRulesSDK != null) {
      str = localRMRulesSDK.getDependencyProvider().provideIRulesUtils().getDBFilePathWithNameInApp();
    }
    SDKLogUtils.debugLog(TAG, "RulesDBHelper Init: DB Filename fetched = " + str);
    return str;
  }
  
  public static RMRulesDBHelper getInstance()
  {
    try
    {
      if (rulesDBHelperIns == null) {
        rulesDBHelperIns = new RMRulesDBHelper(getDBFilename());
      }
      RMRulesDBHelper localRMRulesDBHelper = rulesDBHelperIns;
      return localRMRulesDBHelper;
    }
    finally {}
  }
  
  protected Object clone()
    throws CloneNotSupportedException
  {
    return new CloneNotSupportedException();
  }
  
  public void close()
  {
    try
    {
      this.connectionCounter = (-1 + this.connectionCounter);
      SDKLogUtils.debugLog(TAG, "Close database request. connection counter: " + this.connectionCounter);
      if (this.connectionCounter <= 0)
      {
        this.connectionCounter = 0;
        super.close();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void closeRightAway()
  {
    this.connectionCounter = 0;
    super.close();
  }
  
  public void deleteDatabase()
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "Deleting database");
      this.connectionCounter = 0;
      close();
      WeMo.INSTANCE.getContext().deleteDatabase(getDBFilename());
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public SQLiteDatabase getWritableDatabase()
  {
    try
    {
      this.connectionCounter = (1 + this.connectionCounter);
      SDKLogUtils.debugLog(TAG, "Get Writable database. connection counter: " + this.connectionCounter);
      SQLiteDatabase localSQLiteDatabase = super.getWritableDatabase();
      return localSQLiteDatabase;
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
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS TARGETDEVICES(TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER )");
  }
  
  public void onDowngrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    super.onDowngrade(paramSQLiteDatabase, paramInt1, paramInt2);
  }
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase)
  {
    super.onOpen(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    SDKLogUtils.debugLog(TAG, "ON UPGRADE (RULES.DB) old version: " + paramInt1 + "; new version: " + paramInt2);
    try
    {
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS TARGETDEVICES(TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER )");
      switch (paramInt1)
      {
      case 8: 
        paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES DROP COLUMN ProductName");
        return;
      }
    }
    catch (SQLException localSQLException)
    {
      SDKLogUtils.errorLog(TAG, "SQLITE Exception in ON UPGRADE (RULES.DB). Dropping all tables and creating new RULES.DB: ", localSQLException);
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS RULES");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS RULEDEVICES");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS DEVICECOMBINATION");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS GROUPDEVICES");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS LOCATIONINFO");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS BLOCKEDRULES");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS RULESNOTIFYMESSAGE");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS SENSORNOTIFICATION");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS TARGETDEVICES");
      onCreate(paramSQLiteDatabase);
      return;
    }
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES DROP COLUMN ProductName");
    return;
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER");
    return;
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN OffModeOffset INTEGER");
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN OnModeOffset INTEGER");
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityStart TEXT");
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityEnd TEXT");
    paramSQLiteDatabase.execSQL("ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/RMRulesDBHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */