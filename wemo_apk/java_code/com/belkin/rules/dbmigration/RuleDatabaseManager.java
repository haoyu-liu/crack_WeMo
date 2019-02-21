package com.belkin.rules.dbmigration;

import android.content.ContentValues;
import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import java.io.PrintStream;
import java.util.ArrayList;

public class RuleDatabaseManager
{
  public static final String BLOCKEDRULES_PK = "Primarykey";
  public static final String BLOCKEDRULES_RULEID = "ruleId";
  public static final String DEVICECOMBINATION_DEVICE_GROUP_ID = "DeviceGroupID";
  public static final String DEVICECOMBINATION_DEVICE_ID = "DeviceID";
  public static final String DEVICECOMBINATION_PK = "DeviceCombinationPK";
  public static final String DEVICECOMBINATION_RULE_ID = "RuleID";
  public static final String DEVICECOMBINATION_SENSOR_GROUP_ID = "SensorGroupID";
  public static final String DEVICECOMBINATION_SENSOR_ID = "SensorID";
  public static final String LOCATIONINFO_CITY = "cityName";
  public static final String LOCATIONINFO_COUNTRYCODE = "countryCode";
  public static final String LOCATIONINFO_COUNTRYNAME = "countryName";
  public static final String LOCATIONINFO_LAT = "latitude";
  public static final String LOCATIONINFO_LONG = "longitude";
  public static final String LOCATIONINFO_PK = "LocationPk";
  public static final String LOCATIONINFO_REGION = "region";
  public static final String RULEDEVICES_COUNTDOWN_TIMER = "CountdownTime";
  public static final String RULEDEVICES_DAY_ID = "DayID";
  public static final String RULEDEVICES_DEVICE_ID = "DeviceID";
  public static final String RULEDEVICES_END_ACTION = "EndAction";
  public static final String RULEDEVICES_END_TIME = "EndTime";
  public static final String RULEDEVICES_GROUP_ID = "GroupID";
  public static final String RULEDEVICES_LEVEL = "Level";
  public static final String RULEDEVICES_OFF_MODE_OFFSET = "OffModeOffset";
  public static final String RULEDEVICES_ON_MODE_OFFSET = "OnModeOffset";
  public static final String RULEDEVICES_PK = "RuleDevicePK";
  public static final String RULEDEVICES_PRODUCT_NAME = "ProductName";
  public static final String RULEDEVICES_RULE_DURATION = "RuleDuration";
  public static final String RULEDEVICES_RULE_ID = "RuleID";
  public static final String RULEDEVICES_SENSOR_DURATION = "SensorDuration";
  public static final String RULEDEVICES_START_ACTION = "StartAction";
  public static final String RULEDEVICES_START_TIME = "StartTime";
  public static final String RULEDEVICES_TYPE = "Type";
  public static final String RULEDEVICES_VALUE = "Value";
  public static final String RULEDEVICES_ZBCapabilityEnd = "ZBCapabilityEnd";
  public static final String RULEDEVICES_ZBCapabilityStart = "ZBCapabilityStart";
  public static final String RULENOTIFY_FREQUENCY = "Frequency";
  public static final String RULENOTIFY_ID = "RuleID";
  public static final String RULENOTIFY_MESSAGE = "Message";
  public static final String RULENOTIFY_RULEID = "NotifyRuleID";
  public static final String RULES_END_DATE = "EndDate";
  public static final String RULES_ID = "RuleID";
  public static final String RULES_NAME = "Name";
  public static final String RULES_ORDER = "RuleOrder";
  public static final String RULES_START_DATE = "StartDate";
  public static final String RULES_STATE = "State";
  public static final String RULES_SYNC = "Sync";
  public static final String RULES_TYPE = "Type";
  public static final String SENSORNOTIFY_ID = "RuleID";
  public static final String SENSORNOTIFY_MESSAGE = "NotificationMessage";
  public static final String SENSORNOTIFY_PK = "SensorNotificationPK";
  public static final String SENSORNOTIFY_RULEID = "NotifyRuleID";
  public static final String SENSOROTIFY_DURATION = "NotificationDuration";
  public static final String TABLE_NAME_BLOCKEDRULES = "BLOCKEDRULES";
  public static final String TABLE_NAME_DEVICE_COMBINATION = "DEVICECOMBINATION";
  public static final String TABLE_NAME_GROUP_DEVICES = "GROUPDEVICES";
  public static final String TABLE_NAME_LOCATIONINFO = "LOCATIONINFO";
  public static final String TABLE_NAME_RULEDEVICES = "RULEDEVICES";
  public static final String TABLE_NAME_RULES = "RULES";
  public static final String TABLE_NAME_RULE_NOTIFY_MESSAGE = "RULESNOTIFYMESSAGE";
  public static final String TABLE_NAME_SENSOR_RULE_NOTIFY_MESSAGE = "SENSORNOTIFICATION";
  private static final String TAG = "DatabaseManager";
  private static RuleDatabaseManager mDBMgrinstance = null;
  private final String DATABASE_NAME = "pluginrules2.db";
  private final int DATABASE_VERSION = 2;
  private final String GROUPDEVICES_DEVICE_ID = "DeviceID";
  private final String GROUPDEVICES_GROUP_ID = "GroupID";
  private final String GROUPDEVICES_PK = "GroupDevicePK";
  private Context mContext;
  private OpenHelper mDBOpenHelper;
  private SQLiteDatabase mSqlDatabase;
  
  public RuleDatabaseManager(Context paramContext)
    throws Exception
  {
    this.mContext = paramContext;
    this.mDBOpenHelper = new OpenHelper(paramContext, "pluginrules2.db", null, 2);
    try
    {
      this.mSqlDatabase = this.mDBOpenHelper.getWritableDatabase();
      return;
    }
    catch (Exception localException)
    {
      System.out.println("Can not create Database");
      localException.printStackTrace();
    }
  }
  
  /* Error */
  public static RuleDatabaseManager getInstance(Context paramContext)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +14 -> 22
    //   11: new 2	com/belkin/rules/dbmigration/RuleDatabaseManager
    //   14: dup
    //   15: aload_0
    //   16: invokespecial 250	com/belkin/rules/dbmigration/RuleDatabaseManager:<init>	(Landroid/content/Context;)V
    //   19: putstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   22: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   25: getfield 227	com/belkin/rules/dbmigration/RuleDatabaseManager:mSqlDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   28: invokevirtual 256	android/database/sqlite/SQLiteDatabase:isOpen	()Z
    //   31: istore 10
    //   33: iload 10
    //   35: istore 4
    //   37: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   40: getfield 227	com/belkin/rules/dbmigration/RuleDatabaseManager:mSqlDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   43: invokevirtual 259	android/database/sqlite/SQLiteDatabase:isDbLockedByCurrentThread	()Z
    //   46: istore 9
    //   48: iload 9
    //   50: istore 6
    //   52: iload 4
    //   54: ifeq +9 -> 63
    //   57: iload 6
    //   59: iconst_1
    //   60: if_icmpne +18 -> 78
    //   63: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   66: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   69: getfield 221	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBOpenHelper	Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;
    //   72: invokevirtual 225	com/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   75: putfield 227	com/belkin/rules/dbmigration/RuleDatabaseManager:mSqlDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   78: getstatic 192	com/belkin/rules/dbmigration/RuleDatabaseManager:mDBMgrinstance	Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    //   81: astore 8
    //   83: ldc 2
    //   85: monitorexit
    //   86: aload 8
    //   88: areturn
    //   89: astore 11
    //   91: aload 11
    //   93: invokevirtual 244	java/lang/Exception:printStackTrace	()V
    //   96: goto -74 -> 22
    //   99: astore_1
    //   100: ldc 2
    //   102: monitorexit
    //   103: aload_1
    //   104: athrow
    //   105: astore_3
    //   106: aload_3
    //   107: invokevirtual 244	java/lang/Exception:printStackTrace	()V
    //   110: iconst_0
    //   111: istore 4
    //   113: goto -76 -> 37
    //   116: astore 5
    //   118: aload 5
    //   120: invokevirtual 244	java/lang/Exception:printStackTrace	()V
    //   123: iconst_0
    //   124: istore 6
    //   126: goto -74 -> 52
    //   129: astore 7
    //   131: aload 7
    //   133: invokevirtual 244	java/lang/Exception:printStackTrace	()V
    //   136: goto -58 -> 78
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	139	0	paramContext	Context
    //   99	5	1	localObject	Object
    //   6	2	2	localRuleDatabaseManager1	RuleDatabaseManager
    //   105	2	3	localException1	Exception
    //   35	77	4	bool1	boolean
    //   116	3	5	localException2	Exception
    //   50	75	6	bool2	boolean
    //   129	3	7	localException3	Exception
    //   81	6	8	localRuleDatabaseManager2	RuleDatabaseManager
    //   46	3	9	bool3	boolean
    //   31	3	10	bool4	boolean
    //   89	3	11	localException4	Exception
    // Exception table:
    //   from	to	target	type
    //   11	22	89	java/lang/Exception
    //   3	7	99	finally
    //   11	22	99	finally
    //   22	33	99	finally
    //   37	48	99	finally
    //   63	78	99	finally
    //   78	83	99	finally
    //   91	96	99	finally
    //   106	110	99	finally
    //   118	123	99	finally
    //   131	136	99	finally
    //   22	33	105	java/lang/Exception
    //   37	48	116	java/lang/Exception
    //   63	78	129	java/lang/Exception
  }
  
  protected Object clone()
    throws CloneNotSupportedException
  {
    throw new CloneNotSupportedException("Cannot create clone");
  }
  
  public void close()
  {
    if (this.mDBOpenHelper != null) {
      this.mDBOpenHelper.close();
    }
  }
  
  public boolean insert(ArrayList<RulesTable> paramArrayList, ArrayList<RuleDevicesTable> paramArrayList1, ArrayList<DeviceCombinationTable> paramArrayList2)
  {
    for (;;)
    {
      try
      {
        this.mSqlDatabase.beginTransaction();
        new ContentValues();
        int i = 0;
        if (i < paramArrayList.size())
        {
          RulesTable localRulesTable = (RulesTable)paramArrayList.get(i);
          ContentValues localContentValues3 = new ContentValues();
          localContentValues3.put("RuleID", Integer.valueOf(localRulesTable.getRuleId()));
          localContentValues3.put("Name", localRulesTable.getName());
          localContentValues3.put("Type", localRulesTable.getType());
          localContentValues3.put("RuleOrder", Integer.valueOf(2));
          localContentValues3.put("StartDate", "12201983");
          localContentValues3.put("EndDate", "12201983");
          localContentValues3.put("State", localRulesTable.getState());
          localContentValues3.put("Sync", "NOSYNC");
          this.mSqlDatabase.insertOrThrow("RULES", null, localContentValues3);
          i++;
          continue;
          if (j < paramArrayList1.size())
          {
            RuleDevicesTable localRuleDevicesTable = (RuleDevicesTable)paramArrayList1.get(j);
            ContentValues localContentValues2 = new ContentValues();
            localContentValues2.put("RuleID", Integer.valueOf(localRuleDevicesTable.getRuleId()));
            localContentValues2.put("DeviceID", localRuleDevicesTable.getDeviceId());
            localContentValues2.put("GroupID", Integer.valueOf(localRuleDevicesTable.getGroupId()));
            localContentValues2.put("DayID", Integer.valueOf(localRuleDevicesTable.getDayId()));
            localContentValues2.put("StartTime", Integer.valueOf(localRuleDevicesTable.getStarttime()));
            localContentValues2.put("RuleDuration", Integer.valueOf(localRuleDevicesTable.getRuleDuration()));
            localContentValues2.put("StartAction", Double.valueOf(localRuleDevicesTable.getStartAction()));
            localContentValues2.put("EndAction", Double.valueOf(localRuleDevicesTable.getEndAction()));
            localContentValues2.put("SensorDuration", Integer.valueOf(localRuleDevicesTable.getSensorDuration()));
            localContentValues2.put("Type", Integer.valueOf(localRuleDevicesTable.getType()));
            localContentValues2.put("Value", localRuleDevicesTable.getValue());
            localContentValues2.put("Level", Integer.valueOf(localRuleDevicesTable.getLevel()));
            this.mSqlDatabase.insertOrThrow("RULEDEVICES", null, localContentValues2);
            j++;
            continue;
          }
          if (paramArrayList2.size() > 0)
          {
            int k = 0;
            if (k < paramArrayList2.size())
            {
              DeviceCombinationTable localDeviceCombinationTable = (DeviceCombinationTable)paramArrayList2.get(k);
              ContentValues localContentValues1 = new ContentValues();
              localContentValues1.put("RuleID", Integer.valueOf(localDeviceCombinationTable.getRuleId()));
              localContentValues1.put("SensorID", localDeviceCombinationTable.getSensorId());
              localContentValues1.put("SensorGroupID", Integer.valueOf(0));
              localContentValues1.put("DeviceID", localDeviceCombinationTable.getDeviceId());
              localContentValues1.put("DeviceGroupID", Integer.valueOf(0));
              this.mSqlDatabase.insertOrThrow("DEVICECOMBINATION", null, localContentValues1);
              k++;
              continue;
            }
          }
          this.mSqlDatabase.setTransactionSuccessful();
          return true;
        }
      }
      catch (SQLException localSQLException)
      {
        localSQLException.printStackTrace();
        return false;
      }
      finally
      {
        this.mSqlDatabase.endTransaction();
      }
      int j = 0;
    }
  }
  
  public void openDBForOperations()
  {
    if ((this.mSqlDatabase != null) && (this.mSqlDatabase.isOpen())) {}
    try
    {
      mDBMgrinstance.mSqlDatabase = mDBMgrinstance.mDBOpenHelper.getWritableDatabase();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private class OpenHelper
    extends SQLiteOpenHelper
  {
    OpenHelper(Context paramContext)
    {
      super("pluginrules2.db", null, 2);
    }
    
    public OpenHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
    {
      super("pluginrules2.db", null, 2);
    }
    
    public void close()
    {
      try
      {
        super.close();
        if (RuleDatabaseManager.this.mSqlDatabase != null) {
          RuleDatabaseManager.this.mSqlDatabase.close();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      try
      {
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER, ProductName TEXT)");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT )Frequency INTEGER )");
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT )NotificationDuration INTEGER )");
        return;
      }
      catch (SQLException localSQLException)
      {
        localSQLException.printStackTrace();
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      try
      {
        RuleDatabaseManager.this.mSqlDatabase.execSQL("DROP TABLE IF EXISTS RULES");
        RuleDatabaseManager.this.mSqlDatabase.execSQL("DROP TABLE IF EXISTS RULEDEVICES");
        RuleDatabaseManager.this.mSqlDatabase.execSQL("DROP TABLE IF EXISTS DEVICECOMBINATION");
        RuleDatabaseManager.this.mSqlDatabase.execSQL("DROP TABLE IF EXISTS GROUPDEVICES");
        onCreate(paramSQLiteDatabase);
        return;
      }
      catch (SQLException localSQLException)
      {
        localSQLException.printStackTrace();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/RuleDatabaseManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */