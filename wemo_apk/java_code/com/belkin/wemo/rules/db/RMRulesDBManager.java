package com.belkin.wemo.rules.db;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.db.contract.RMRulesContract.LocationInfo;
import com.belkin.wemo.rules.db.contract.RMRulesContract.RuleDevices;
import com.belkin.wemo.rules.db.contract.RMRulesContract.Rules;
import com.belkin.wemo.rules.db.contract.RMRulesContract.SensorNotification;
import com.belkin.wemo.rules.db.contract.RMRulesContract.TargetDevices;
import com.belkin.wemo.rules.db.listener.RMOnRulesUpdatedListener;
import com.belkin.wemo.rules.db.model.RMTLocationInfo;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.db.model.RMTSensorNotification;
import com.belkin.wemo.rules.db.model.RMTTargetDevices;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Arrays;
import java.util.List;

public class RMRulesDBManager
  implements RMOnRulesUpdatedListener
{
  private static final String TAG = RMRulesDBManager.class.getSimpleName();
  private static RMRulesDBManager manager;
  
  private RMRulesDBManager()
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    if (localRMRulesSDK != null) {
      localRMRulesSDK.getDependencyProvider().provideRulesUpdateBroadcast().registerOnRulesUpdatedListener(this);
    }
    onRulesDBUpdated();
  }
  
  public static void cleanUp()
  {
    try
    {
      if (manager != null)
      {
        manager.closeRulesDBInstance();
        manager = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void closeRulesDBInstance()
  {
    RMRulesDBHelper.getInstance().close();
  }
  
  private int delete(String paramString1, String paramString2, String... paramVarArgs)
    throws RuleDBException
  {
    try
    {
      int i = getRuleDBInstance().delete(paramString1, paramString2, paramVarArgs);
      closeRulesDBInstance();
      SDKLogUtils.debugLog(TAG, "delete(): Table Name: " + paramString1 + "; whereClause: " + paramString2 + "; WhereArgs: " + Arrays.toString(paramVarArgs) + "; Number of rows deleted: " + i);
      return i;
    }
    catch (SQLiteException localSQLiteException)
    {
      throw new RuleDBException(localSQLiteException.getMessage());
    }
    finally
    {
      closeRulesDBInstance();
    }
  }
  
  public static final RMRulesDBManager getInstance()
  {
    try
    {
      if (manager == null) {
        manager = new RMRulesDBManager();
      }
      RMRulesDBManager localRMRulesDBManager = manager;
      return localRMRulesDBManager;
    }
    finally {}
  }
  
  private SQLiteDatabase getRuleDBInstance()
    throws SQLException
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = RMRulesDBHelper.getInstance().getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLException localSQLException)
    {
      SDKLogUtils.errorLog(TAG, "SQLException while getting writable DB: ", localSQLException);
      RMRulesDBHelper.getInstance().deleteDatabase();
      throw localSQLException;
    }
  }
  
  private RMTRules readRule(Cursor paramCursor)
  {
    RMTRules localRMTRules = new RMTRules();
    localRMTRules.setRuleId(paramCursor.getString(RMRulesContract.Rules.COLUMNS_LIST.indexOf("RuleID")));
    localRMTRules.setName(paramCursor.getString(RMRulesContract.Rules.COLUMNS_LIST.indexOf("Name")));
    localRMTRules.setState(paramCursor.getInt(RMRulesContract.Rules.COLUMNS_LIST.indexOf("State")));
    localRMTRules.setType(paramCursor.getString(RMRulesContract.Rules.COLUMNS_LIST.indexOf("Type")));
    return localRMTRules;
  }
  
  private RMTRuleDevices readRuleDevices(Cursor paramCursor)
  {
    RMTRuleDevices localRMTRuleDevices = new RMTRuleDevices();
    localRMTRuleDevices.setRuleID(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("RuleID")));
    localRMTRuleDevices.setDeviceID(paramCursor.getString(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("DeviceID")));
    localRMTRuleDevices.setGroupID(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("GroupID")));
    localRMTRuleDevices.setDayID(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("DayID")));
    localRMTRuleDevices.setStartTime(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("StartTime")));
    localRMTRuleDevices.setRuleDuration(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("RuleDuration")));
    localRMTRuleDevices.setStartAction(paramCursor.getFloat(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("StartAction")));
    localRMTRuleDevices.setEndAction(paramCursor.getFloat(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("EndAction")));
    localRMTRuleDevices.setSensorDuration(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("SensorDuration")));
    localRMTRuleDevices.setType(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("Type")));
    localRMTRuleDevices.setValue(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("Value")));
    localRMTRuleDevices.setLevel(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("Level")));
    localRMTRuleDevices.setStartTime(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("StartTime")));
    localRMTRuleDevices.setZBCapabilityStart(paramCursor.getString(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("ZBCapabilityStart")));
    localRMTRuleDevices.setZBCapabilityEnd(paramCursor.getString(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("ZBCapabilityEnd")));
    localRMTRuleDevices.setOnModeOffset(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("OnModeOffset")));
    localRMTRuleDevices.setCountdownTime(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("CountdownTime")));
    localRMTRuleDevices.setEndTime(paramCursor.getInt(RMRulesContract.RuleDevices.COLUMNS_LIST.indexOf("EndTime")));
    SDKLogUtils.debugLog(TAG, "Store Rules: READING entry from RULEDEVICES TABLE: CountDown Time = " + localRMTRuleDevices.getCountdownTime() + "; DayID = " + localRMTRuleDevices.getDayID() + "; DeviceId = " + localRMTRuleDevices.getDeviceID() + "; EndAction = " + localRMTRuleDevices.getEndAction() + "; EndTime = " + localRMTRuleDevices.getEndTime() + "; GroupID = " + localRMTRuleDevices.getGroupID() + "; Level = " + localRMTRuleDevices.getLevel() + "; OffModeOffset = " + localRMTRuleDevices.getOffModeOffset() + "; OnModeOffset = " + localRMTRuleDevices.getOnModeOffset() + "; RuleDuration = " + localRMTRuleDevices.getRuleDuration() + "; RuleID = " + localRMTRuleDevices.getRuleID() + "; SensorDuration = " + localRMTRuleDevices.getSensorDuration() + "; StartAction = " + localRMTRuleDevices.getStartAction() + "; StartTime = " + localRMTRuleDevices.getStartTime() + "; Type = " + localRMTRuleDevices.getType() + "; Level = " + localRMTRuleDevices.getValue() + "; ZbCapabilityEnd = " + localRMTRuleDevices.getZBCapabilityEnd() + "; ZbCapabilityStart = " + localRMTRuleDevices.getZBCapabilityStart());
    return localRMTRuleDevices;
  }
  
  private RMTSensorNotification readSensorNotification(Cursor paramCursor)
  {
    RMTSensorNotification localRMTSensorNotification = new RMTSensorNotification();
    localRMTSensorNotification.setRuleId(paramCursor.getInt(RMRulesContract.SensorNotification.COLUMNS_LIST.indexOf("RuleID")));
    localRMTSensorNotification.setNotificationMessage(paramCursor.getString(RMRulesContract.SensorNotification.COLUMNS_LIST.indexOf("NotificationMessage")));
    localRMTSensorNotification.setNotificationDuration(paramCursor.getInt(RMRulesContract.SensorNotification.COLUMNS_LIST.indexOf("NotificationDuration")));
    localRMTSensorNotification.setNotifyRuleID(paramCursor.getInt(RMRulesContract.SensorNotification.COLUMNS_LIST.indexOf("NotifyRuleID")));
    return localRMTSensorNotification;
  }
  
  private RMTTargetDevices readTargetDevices(Cursor paramCursor)
  {
    RMTTargetDevices localRMTTargetDevices = new RMTTargetDevices();
    localRMTTargetDevices.setRuleId(paramCursor.getInt(RMRulesContract.TargetDevices.COLUMNS_LIST.indexOf("RuleID")));
    localRMTTargetDevices.setDeviceID(paramCursor.getString(RMRulesContract.TargetDevices.COLUMNS_LIST.indexOf("DeviceID")));
    localRMTTargetDevices.setDeviceIndex(paramCursor.getInt(RMRulesContract.TargetDevices.COLUMNS_LIST.indexOf("DeviceIndex")));
    return localRMTTargetDevices;
  }
  
  protected Object clone()
    throws CloneNotSupportedException
  {
    throw new CloneNotSupportedException();
  }
  
  public int deleteDeviceCombinationEnrtiesByUDN(String paramString)
    throws RuleDBException
  {
    try
    {
      int i = delete("DEVICECOMBINATION", "DeviceID=?", new String[] { paramString });
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRowRuleDevices(int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = delete("RULEDEVICES", "RuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRowRules(int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = delete("RULES", "RuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRowTargetDevices(int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = delete("TARGETDEVICES", "RuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRuleDevicesEnrtiesByUDN(String paramString, int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[2];
      arrayOfString[0] = paramString;
      arrayOfString[1] = String.valueOf(paramInt);
      int i = delete("RULEDEVICES", "DeviceID=? AND RuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRulesEnrtiesByUDN(String paramString)
    throws RuleDBException
  {
    try
    {
      int i = delete("RULES", "DeviceID=?", new String[] { paramString });
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteRulesNotifyMessageEnrties(int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = delete("RULESNOTIFYMESSAGE", "NotifyRuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteSensorNotificationEnrties(int paramInt)
    throws RuleDBException
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = delete("SENSORNOTIFICATION", "NotifyRuleID=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int deleteTargetDevicesEnrtiesByUDN(String paramString)
    throws RuleDBException
  {
    try
    {
      int i = delete("TARGETDEVICES", "DeviceID=?", new String[] { paramString });
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void executeVacuum()
    throws RuleDBException
  {
    SDKLogUtils.debugLog(TAG, "Executing VACUUM on RULES DB.");
    try
    {
      RMRulesDBHelper.getInstance().closeRightAway();
      RMRulesDBHelper.getInstance().getWritableDatabase().execSQL("VACUUM");
      return;
    }
    catch (SQLException localSQLException)
    {
      SDKLogUtils.errorLog(TAG, "SQL Exception while executing VACUUM on rules DB: ", localSQLException);
      throw new RuleDBException(localSQLException.getMessage());
    }
  }
  
  public String getDBRuleType(int paramInt)
    throws RuleDBException
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getRuleDBInstance();
      String[] arrayOfString1 = { "Type" };
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = String.valueOf(paramInt);
      Cursor localCursor = localSQLiteDatabase.query("RULES", arrayOfString1, "RuleID=?", arrayOfString2, null, null, null, null);
      boolean bool = localCursor.moveToFirst();
      String str = null;
      if (bool) {
        do
        {
          str = localCursor.getString(RMRulesContract.Rules.COLUMNS_LIST.indexOf("RuleID"));
        } while (localCursor.moveToNext());
      }
      localCursor.close();
      closeRulesDBInstance();
      return str;
    }
    catch (SQLException localSQLException)
    {
      throw new RuleDBException(localSQLException.getMessage());
    }
    finally {}
  }
  
  /* Error */
  public List<RMTRuleDevices> getRuleDevices(int paramInt)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 478	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 479	java/util/ArrayList:<init>	()V
    //   9: astore_2
    //   10: aload_0
    //   11: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   14: astore 5
    //   16: getstatic 483	com/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices:COLUMNS	[Ljava/lang/String;
    //   19: astore 6
    //   21: iconst_1
    //   22: anewarray 418	java/lang/String
    //   25: astore 7
    //   27: aload 7
    //   29: iconst_0
    //   30: iload_1
    //   31: invokestatic 423	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   34: aastore
    //   35: aload 5
    //   37: ldc_w 425
    //   40: aload 6
    //   42: ldc_w 427
    //   45: aload 7
    //   47: aconst_null
    //   48: aconst_null
    //   49: ldc_w 485
    //   52: invokevirtual 488	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   55: astore 8
    //   57: aload 8
    //   59: invokeinterface 470 1 0
    //   64: ifeq +26 -> 90
    //   67: aload_2
    //   68: aload_0
    //   69: aload 8
    //   71: invokespecial 490	com/belkin/wemo/rules/db/RMRulesDBManager:readRuleDevices	(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    //   74: invokeinterface 494 2 0
    //   79: pop
    //   80: aload 8
    //   82: invokeinterface 473 1 0
    //   87: ifne -20 -> 67
    //   90: aload 8
    //   92: invokeinterface 474 1 0
    //   97: aload_0
    //   98: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   101: aload_0
    //   102: monitorexit
    //   103: aload_2
    //   104: areturn
    //   105: astore 4
    //   107: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   110: dup
    //   111: aload 4
    //   113: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   116: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   119: athrow
    //   120: astore_3
    //   121: aload_0
    //   122: monitorexit
    //   123: aload_3
    //   124: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	125	0	this	RMRulesDBManager
    //   0	125	1	paramInt	int
    //   9	95	2	localArrayList	java.util.ArrayList
    //   120	4	3	localObject	Object
    //   105	7	4	localSQLException	SQLException
    //   14	22	5	localSQLiteDatabase	SQLiteDatabase
    //   19	22	6	arrayOfString1	String[]
    //   25	21	7	arrayOfString2	String[]
    //   55	36	8	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   10	67	105	android/database/SQLException
    //   67	90	105	android/database/SQLException
    //   90	101	105	android/database/SQLException
    //   2	10	120	finally
    //   10	67	120	finally
    //   67	90	120	finally
    //   90	101	120	finally
    //   107	120	120	finally
  }
  
  public int getRuleDevicesCount(int paramInt)
    throws RuleDBException
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getRuleDBInstance();
      String[] arrayOfString1 = { "DeviceID" };
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = String.valueOf(paramInt);
      Cursor localCursor = localSQLiteDatabase.query(true, "RULEDEVICES", arrayOfString1, "RuleID=?", arrayOfString2, null, null, null, null, null);
      int i = localCursor.getCount();
      localCursor.close();
      closeRulesDBInstance();
      return i;
    }
    catch (SQLException localSQLException)
    {
      throw new RuleDBException(localSQLException.getMessage());
    }
    finally {}
  }
  
  /* Error */
  public java.util.Set<Integer> getRuleIDsForDevice(String paramString)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 505	java/util/HashSet
    //   5: dup
    //   6: invokespecial 506	java/util/HashSet:<init>	()V
    //   9: astore_2
    //   10: aload_0
    //   11: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   14: iconst_1
    //   15: ldc_w 425
    //   18: iconst_1
    //   19: anewarray 418	java/lang/String
    //   22: dup
    //   23: iconst_0
    //   24: ldc -112
    //   26: aastore
    //   27: ldc_w 416
    //   30: iconst_1
    //   31: anewarray 418	java/lang/String
    //   34: dup
    //   35: iconst_0
    //   36: aload_1
    //   37: aastore
    //   38: aconst_null
    //   39: aconst_null
    //   40: aconst_null
    //   41: aconst_null
    //   42: aconst_null
    //   43: invokevirtual 498	android/database/sqlite/SQLiteDatabase:query	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    //   46: astore 5
    //   48: aload 5
    //   50: invokeinterface 470 1 0
    //   55: ifeq +40 -> 95
    //   58: aload_2
    //   59: aload 5
    //   61: getstatic 187	com/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices:COLUMNS_LIST	Ljava/util/List;
    //   64: ldc -112
    //   66: invokeinterface 150 2 0
    //   71: invokeinterface 170 2 0
    //   76: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   79: invokeinterface 514 2 0
    //   84: pop
    //   85: aload 5
    //   87: invokeinterface 473 1 0
    //   92: ifne -34 -> 58
    //   95: aload 5
    //   97: invokeinterface 474 1 0
    //   102: aload_0
    //   103: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   106: iconst_1
    //   107: ldc_w 433
    //   110: iconst_1
    //   111: anewarray 418	java/lang/String
    //   114: dup
    //   115: iconst_0
    //   116: ldc -112
    //   118: aastore
    //   119: ldc_w 416
    //   122: iconst_1
    //   123: anewarray 418	java/lang/String
    //   126: dup
    //   127: iconst_0
    //   128: aload_1
    //   129: aastore
    //   130: aconst_null
    //   131: aconst_null
    //   132: aconst_null
    //   133: aconst_null
    //   134: aconst_null
    //   135: invokevirtual 498	android/database/sqlite/SQLiteDatabase:query	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    //   138: astore 7
    //   140: aload 7
    //   142: invokeinterface 470 1 0
    //   147: ifeq +40 -> 187
    //   150: aload_2
    //   151: aload 7
    //   153: getstatic 398	com/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices:COLUMNS_LIST	Ljava/util/List;
    //   156: ldc -112
    //   158: invokeinterface 150 2 0
    //   163: invokeinterface 170 2 0
    //   168: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   171: invokeinterface 514 2 0
    //   176: pop
    //   177: aload 7
    //   179: invokeinterface 473 1 0
    //   184: ifne -34 -> 150
    //   187: aload 7
    //   189: invokeinterface 474 1 0
    //   194: aload_0
    //   195: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   198: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   201: new 79	java/lang/StringBuilder
    //   204: dup
    //   205: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   208: ldc_w 516
    //   211: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: aload_2
    //   215: invokeinterface 519 1 0
    //   220: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   223: ldc_w 521
    //   226: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: aload_1
    //   230: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   233: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   236: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   239: aload_0
    //   240: monitorexit
    //   241: aload_2
    //   242: areturn
    //   243: astore 4
    //   245: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   248: dup
    //   249: aload 4
    //   251: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   254: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   257: athrow
    //   258: astore_3
    //   259: aload_0
    //   260: monitorexit
    //   261: aload_3
    //   262: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	263	0	this	RMRulesDBManager
    //   0	263	1	paramString	String
    //   9	233	2	localHashSet	java.util.HashSet
    //   258	4	3	localObject	Object
    //   243	7	4	localSQLException	SQLException
    //   46	50	5	localCursor1	Cursor
    //   138	50	7	localCursor2	Cursor
    // Exception table:
    //   from	to	target	type
    //   10	58	243	android/database/SQLException
    //   58	95	243	android/database/SQLException
    //   95	150	243	android/database/SQLException
    //   150	187	243	android/database/SQLException
    //   187	198	243	android/database/SQLException
    //   2	10	258	finally
    //   10	58	258	finally
    //   58	95	258	finally
    //   95	150	258	finally
    //   150	187	258	finally
    //   187	198	258	finally
    //   198	239	258	finally
    //   245	258	258	finally
  }
  
  /* Error */
  public List<RMTRules> getRules()
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 478	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 479	java/util/ArrayList:<init>	()V
    //   9: astore_1
    //   10: aload_0
    //   11: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   14: ldc_w 430
    //   17: getstatic 524	com/belkin/wemo/rules/db/contract/RMRulesContract$Rules:COLUMNS	[Ljava/lang/String;
    //   20: aconst_null
    //   21: aconst_null
    //   22: aconst_null
    //   23: aconst_null
    //   24: ldc -112
    //   26: invokevirtual 488	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   29: astore 4
    //   31: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   34: new 79	java/lang/StringBuilder
    //   37: dup
    //   38: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   41: ldc_w 526
    //   44: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: aload 4
    //   49: invokeinterface 501 1 0
    //   54: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   57: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   60: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   63: aload 4
    //   65: invokeinterface 470 1 0
    //   70: ifeq +26 -> 96
    //   73: aload_1
    //   74: aload_0
    //   75: aload 4
    //   77: invokespecial 528	com/belkin/wemo/rules/db/RMRulesDBManager:readRule	(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRules;
    //   80: invokeinterface 494 2 0
    //   85: pop
    //   86: aload 4
    //   88: invokeinterface 473 1 0
    //   93: ifne -20 -> 73
    //   96: aload 4
    //   98: invokeinterface 474 1 0
    //   103: aload_0
    //   104: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   107: aload_0
    //   108: monitorexit
    //   109: aload_1
    //   110: areturn
    //   111: astore_3
    //   112: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   115: dup
    //   116: aload_3
    //   117: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   120: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   123: athrow
    //   124: astore_2
    //   125: aload_0
    //   126: monitorexit
    //   127: aload_2
    //   128: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	129	0	this	RMRulesDBManager
    //   9	101	1	localArrayList	java.util.ArrayList
    //   124	4	2	localObject	Object
    //   111	6	3	localSQLException	SQLException
    //   29	68	4	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   10	73	111	android/database/SQLException
    //   73	96	111	android/database/SQLException
    //   96	107	111	android/database/SQLException
    //   2	10	124	finally
    //   10	73	124	finally
    //   73	96	124	finally
    //   96	107	124	finally
    //   112	124	124	finally
  }
  
  public RMTRules getRulesEntry(int paramInt)
    throws RuleDBException
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getRuleDBInstance();
      String[] arrayOfString1 = RMRulesContract.Rules.COLUMNS;
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = String.valueOf(paramInt);
      Cursor localCursor = localSQLiteDatabase.query("RULES", arrayOfString1, "RuleID=?", arrayOfString2, null, null, "RuleID");
      boolean bool = localCursor.moveToFirst();
      RMTRules localRMTRules = null;
      if (bool) {
        localRMTRules = readRule(localCursor);
      }
      localCursor.close();
      closeRulesDBInstance();
      return localRMTRules;
    }
    catch (SQLException localSQLException)
    {
      throw new RuleDBException(localSQLException.getMessage());
    }
    finally {}
  }
  
  /* Error */
  public List<RMTSensorNotification> getSensorNotification(int paramInt)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 478	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 479	java/util/ArrayList:<init>	()V
    //   9: astore_2
    //   10: aload_0
    //   11: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   14: astore 5
    //   16: getstatic 532	com/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification:COLUMNS	[Ljava/lang/String;
    //   19: astore 6
    //   21: iconst_1
    //   22: anewarray 418	java/lang/String
    //   25: astore 7
    //   27: aload 7
    //   29: iconst_0
    //   30: iload_1
    //   31: invokestatic 423	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   34: aastore
    //   35: aload 5
    //   37: ldc_w 446
    //   40: aload 6
    //   42: ldc_w 427
    //   45: aload 7
    //   47: aconst_null
    //   48: aconst_null
    //   49: aconst_null
    //   50: invokevirtual 488	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   53: astore 8
    //   55: aload 8
    //   57: invokeinterface 470 1 0
    //   62: ifeq +26 -> 88
    //   65: aload_2
    //   66: aload_0
    //   67: aload 8
    //   69: invokespecial 534	com/belkin/wemo/rules/db/RMRulesDBManager:readSensorNotification	(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
    //   72: invokeinterface 494 2 0
    //   77: pop
    //   78: aload 8
    //   80: invokeinterface 473 1 0
    //   85: ifne -20 -> 65
    //   88: aload 8
    //   90: invokeinterface 474 1 0
    //   95: aload_0
    //   96: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   99: aload_0
    //   100: monitorexit
    //   101: aload_2
    //   102: areturn
    //   103: astore 4
    //   105: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   108: dup
    //   109: aload 4
    //   111: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   114: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   117: athrow
    //   118: astore_3
    //   119: aload_0
    //   120: monitorexit
    //   121: aload_3
    //   122: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	123	0	this	RMRulesDBManager
    //   0	123	1	paramInt	int
    //   9	93	2	localArrayList	java.util.ArrayList
    //   118	4	3	localObject	Object
    //   103	7	4	localSQLException	SQLException
    //   14	22	5	localSQLiteDatabase	SQLiteDatabase
    //   19	22	6	arrayOfString1	String[]
    //   25	21	7	arrayOfString2	String[]
    //   53	36	8	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   10	65	103	android/database/SQLException
    //   65	88	103	android/database/SQLException
    //   88	99	103	android/database/SQLException
    //   2	10	118	finally
    //   10	65	118	finally
    //   65	88	118	finally
    //   88	99	118	finally
    //   105	118	118	finally
  }
  
  /* Error */
  public List<RMTTargetDevices> getTargetDevices(int paramInt)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 478	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 479	java/util/ArrayList:<init>	()V
    //   9: astore_2
    //   10: aload_0
    //   11: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   14: astore 5
    //   16: getstatic 536	com/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices:COLUMNS	[Ljava/lang/String;
    //   19: astore 6
    //   21: iconst_1
    //   22: anewarray 418	java/lang/String
    //   25: astore 7
    //   27: aload 7
    //   29: iconst_0
    //   30: iload_1
    //   31: invokestatic 423	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   34: aastore
    //   35: aload 5
    //   37: ldc_w 433
    //   40: aload 6
    //   42: ldc_w 427
    //   45: aload 7
    //   47: aconst_null
    //   48: aconst_null
    //   49: aconst_null
    //   50: invokevirtual 488	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   53: astore 8
    //   55: aload 8
    //   57: invokeinterface 470 1 0
    //   62: ifeq +26 -> 88
    //   65: aload_2
    //   66: aload_0
    //   67: aload 8
    //   69: invokespecial 538	com/belkin/wemo/rules/db/RMRulesDBManager:readTargetDevices	(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    //   72: invokeinterface 494 2 0
    //   77: pop
    //   78: aload 8
    //   80: invokeinterface 473 1 0
    //   85: ifne -20 -> 65
    //   88: aload 8
    //   90: invokeinterface 474 1 0
    //   95: aload_0
    //   96: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   99: aload_0
    //   100: monitorexit
    //   101: aload_2
    //   102: areturn
    //   103: astore 4
    //   105: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   108: dup
    //   109: aload 4
    //   111: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   114: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   117: athrow
    //   118: astore_3
    //   119: aload_0
    //   120: monitorexit
    //   121: aload_3
    //   122: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	123	0	this	RMRulesDBManager
    //   0	123	1	paramInt	int
    //   9	93	2	localArrayList	java.util.ArrayList
    //   118	4	3	localObject	Object
    //   103	7	4	localSQLException	SQLException
    //   14	22	5	localSQLiteDatabase	SQLiteDatabase
    //   19	22	6	arrayOfString1	String[]
    //   25	21	7	arrayOfString2	String[]
    //   53	36	8	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   10	65	103	android/database/SQLException
    //   65	88	103	android/database/SQLException
    //   88	99	103	android/database/SQLException
    //   2	10	118	finally
    //   10	65	118	finally
    //   65	88	118	finally
    //   88	99	118	finally
    //   105	118	118	finally
  }
  
  /* Error */
  public long insertRowRuleDevices(RMTRuleDevices paramRMTRuleDevices)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 542	android/content/ContentValues
    //   5: dup
    //   6: invokespecial 543	android/content/ContentValues:<init>	()V
    //   9: astore_2
    //   10: aload_2
    //   11: ldc_w 264
    //   14: aload_1
    //   15: invokevirtual 278	com/belkin/wemo/rules/db/model/RMTRuleDevices:getCountdownTime	()I
    //   18: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   21: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   24: aload_2
    //   25: ldc -54
    //   27: aload_1
    //   28: invokevirtual 283	com/belkin/wemo/rules/db/model/RMTRuleDevices:getDayID	()I
    //   31: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   34: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   37: aload_2
    //   38: ldc -64
    //   40: aload_1
    //   41: invokevirtual 288	com/belkin/wemo/rules/db/model/RMTRuleDevices:getDeviceID	()Ljava/lang/String;
    //   44: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   47: aload_2
    //   48: ldc -29
    //   50: aload_1
    //   51: invokevirtual 294	com/belkin/wemo/rules/db/model/RMTRuleDevices:getEndAction	()F
    //   54: invokestatic 554	java/lang/Float:valueOf	(F)Ljava/lang/Float;
    //   57: invokevirtual 557	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Float;)V
    //   60: aload_2
    //   61: ldc_w 269
    //   64: aload_1
    //   65: invokevirtual 302	com/belkin/wemo/rules/db/model/RMTRuleDevices:getEndTime	()I
    //   68: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   71: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   74: aload_2
    //   75: ldc -59
    //   77: aload_1
    //   78: invokevirtual 307	com/belkin/wemo/rules/db/model/RMTRuleDevices:getGroupID	()I
    //   81: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   84: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   87: aload_2
    //   88: ldc -12
    //   90: aload_1
    //   91: invokevirtual 312	com/belkin/wemo/rules/db/model/RMTRuleDevices:getLevel	()I
    //   94: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   97: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   100: aload_2
    //   101: ldc_w 559
    //   104: aload_1
    //   105: invokevirtual 317	com/belkin/wemo/rules/db/model/RMTRuleDevices:getOffModeOffset	()I
    //   108: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   111: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   114: aload_2
    //   115: ldc_w 259
    //   118: aload_1
    //   119: invokevirtual 322	com/belkin/wemo/rules/db/model/RMTRuleDevices:getOnModeOffset	()I
    //   122: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   125: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   128: aload_2
    //   129: ldc -44
    //   131: aload_1
    //   132: invokevirtual 327	com/belkin/wemo/rules/db/model/RMTRuleDevices:getRuleDuration	()I
    //   135: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   138: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   141: aload_2
    //   142: ldc -112
    //   144: aload_1
    //   145: invokevirtual 332	com/belkin/wemo/rules/db/model/RMTRuleDevices:getRuleID	()I
    //   148: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   151: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   154: aload_2
    //   155: ldc -24
    //   157: aload_1
    //   158: invokevirtual 337	com/belkin/wemo/rules/db/model/RMTRuleDevices:getSensorDuration	()I
    //   161: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   164: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   167: aload_2
    //   168: ldc -39
    //   170: aload_1
    //   171: invokevirtual 342	com/belkin/wemo/rules/db/model/RMTRuleDevices:getStartAction	()F
    //   174: invokestatic 554	java/lang/Float:valueOf	(F)Ljava/lang/Float;
    //   177: invokevirtual 557	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Float;)V
    //   180: aload_2
    //   181: ldc -49
    //   183: aload_1
    //   184: invokevirtual 347	com/belkin/wemo/rules/db/model/RMTRuleDevices:getStartTime	()I
    //   187: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   190: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   193: aload_2
    //   194: ldc -80
    //   196: aload_1
    //   197: invokevirtual 352	com/belkin/wemo/rules/db/model/RMTRuleDevices:getType	()I
    //   200: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   203: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   206: aload_2
    //   207: ldc -17
    //   209: aload_1
    //   210: invokevirtual 355	com/belkin/wemo/rules/db/model/RMTRuleDevices:getValue	()I
    //   213: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   216: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   219: aload_2
    //   220: ldc -2
    //   222: aload_1
    //   223: invokevirtual 360	com/belkin/wemo/rules/db/model/RMTRuleDevices:getZBCapabilityEnd	()Ljava/lang/String;
    //   226: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   229: aload_2
    //   230: ldc -7
    //   232: aload_1
    //   233: invokevirtual 365	com/belkin/wemo/rules/db/model/RMTRuleDevices:getZBCapabilityStart	()Ljava/lang/String;
    //   236: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   239: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   242: new 79	java/lang/StringBuilder
    //   245: dup
    //   246: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   249: ldc_w 561
    //   252: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   255: aload_1
    //   256: invokevirtual 278	com/belkin/wemo/rules/db/model/RMTRuleDevices:getCountdownTime	()I
    //   259: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   262: ldc_w 280
    //   265: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   268: aload_1
    //   269: invokevirtual 283	com/belkin/wemo/rules/db/model/RMTRuleDevices:getDayID	()I
    //   272: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   275: ldc_w 285
    //   278: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   281: aload_1
    //   282: invokevirtual 288	com/belkin/wemo/rules/db/model/RMTRuleDevices:getDeviceID	()Ljava/lang/String;
    //   285: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   288: ldc_w 290
    //   291: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   294: aload_1
    //   295: invokevirtual 294	com/belkin/wemo/rules/db/model/RMTRuleDevices:getEndAction	()F
    //   298: invokevirtual 297	java/lang/StringBuilder:append	(F)Ljava/lang/StringBuilder;
    //   301: ldc_w 299
    //   304: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   307: aload_1
    //   308: invokevirtual 302	com/belkin/wemo/rules/db/model/RMTRuleDevices:getEndTime	()I
    //   311: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   314: ldc_w 304
    //   317: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   320: aload_1
    //   321: invokevirtual 307	com/belkin/wemo/rules/db/model/RMTRuleDevices:getGroupID	()I
    //   324: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   327: ldc_w 309
    //   330: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   333: aload_1
    //   334: invokevirtual 312	com/belkin/wemo/rules/db/model/RMTRuleDevices:getLevel	()I
    //   337: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   340: ldc_w 314
    //   343: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   346: aload_1
    //   347: invokevirtual 317	com/belkin/wemo/rules/db/model/RMTRuleDevices:getOffModeOffset	()I
    //   350: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   353: ldc_w 319
    //   356: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   359: aload_1
    //   360: invokevirtual 322	com/belkin/wemo/rules/db/model/RMTRuleDevices:getOnModeOffset	()I
    //   363: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   366: ldc_w 324
    //   369: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   372: aload_1
    //   373: invokevirtual 327	com/belkin/wemo/rules/db/model/RMTRuleDevices:getRuleDuration	()I
    //   376: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   379: ldc_w 329
    //   382: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   385: aload_1
    //   386: invokevirtual 332	com/belkin/wemo/rules/db/model/RMTRuleDevices:getRuleID	()I
    //   389: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   392: ldc_w 334
    //   395: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: aload_1
    //   399: invokevirtual 337	com/belkin/wemo/rules/db/model/RMTRuleDevices:getSensorDuration	()I
    //   402: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   405: ldc_w 339
    //   408: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   411: aload_1
    //   412: invokevirtual 342	com/belkin/wemo/rules/db/model/RMTRuleDevices:getStartAction	()F
    //   415: invokevirtual 297	java/lang/StringBuilder:append	(F)Ljava/lang/StringBuilder;
    //   418: ldc_w 344
    //   421: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   424: aload_1
    //   425: invokevirtual 347	com/belkin/wemo/rules/db/model/RMTRuleDevices:getStartTime	()I
    //   428: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   431: ldc_w 349
    //   434: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   437: aload_1
    //   438: invokevirtual 352	com/belkin/wemo/rules/db/model/RMTRuleDevices:getType	()I
    //   441: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   444: ldc_w 309
    //   447: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   450: aload_1
    //   451: invokevirtual 355	com/belkin/wemo/rules/db/model/RMTRuleDevices:getValue	()I
    //   454: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   457: ldc_w 357
    //   460: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   463: aload_1
    //   464: invokevirtual 360	com/belkin/wemo/rules/db/model/RMTRuleDevices:getZBCapabilityEnd	()Ljava/lang/String;
    //   467: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: ldc_w 362
    //   473: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   476: aload_1
    //   477: invokevirtual 365	com/belkin/wemo/rules/db/model/RMTRuleDevices:getZBCapabilityStart	()Ljava/lang/String;
    //   480: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   483: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   486: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   489: aload_0
    //   490: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   493: ldc_w 425
    //   496: aconst_null
    //   497: aload_2
    //   498: invokevirtual 565	android/database/sqlite/SQLiteDatabase:insertOrThrow	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   501: lstore 6
    //   503: aload_0
    //   504: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   507: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   510: new 79	java/lang/StringBuilder
    //   513: dup
    //   514: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   517: ldc_w 567
    //   520: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   523: lload 6
    //   525: invokevirtual 570	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   528: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   531: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   534: aload_0
    //   535: monitorexit
    //   536: lload 6
    //   538: lreturn
    //   539: astore 5
    //   541: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   544: dup
    //   545: aload 5
    //   547: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   550: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   553: athrow
    //   554: astore 4
    //   556: aload_0
    //   557: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   560: aload 4
    //   562: athrow
    //   563: astore_3
    //   564: aload_0
    //   565: monitorexit
    //   566: aload_3
    //   567: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	568	0	this	RMRulesDBManager
    //   0	568	1	paramRMTRuleDevices	RMTRuleDevices
    //   9	489	2	localContentValues	ContentValues
    //   563	4	3	localObject1	Object
    //   554	7	4	localObject2	Object
    //   539	7	5	localSQLException	SQLException
    //   501	36	6	l	long
    // Exception table:
    //   from	to	target	type
    //   489	503	539	android/database/SQLException
    //   489	503	554	finally
    //   541	554	554	finally
    //   2	489	563	finally
    //   503	534	563	finally
    //   556	563	563	finally
  }
  
  /* Error */
  public long insertRowTargetDevices(RMTTargetDevices paramRMTTargetDevices)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 542	android/content/ContentValues
    //   5: dup
    //   6: invokespecial 543	android/content/ContentValues:<init>	()V
    //   9: astore_2
    //   10: aload_2
    //   11: ldc -64
    //   13: aload_1
    //   14: invokevirtual 573	com/belkin/wemo/rules/db/model/RMTTargetDevices:getDeviceID	()Ljava/lang/String;
    //   17: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   20: aload_2
    //   21: ldc_w 402
    //   24: aload_1
    //   25: invokevirtual 576	com/belkin/wemo/rules/db/model/RMTTargetDevices:getDeviceIndex	()I
    //   28: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   31: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   34: aload_2
    //   35: ldc -112
    //   37: aload_1
    //   38: invokevirtual 579	com/belkin/wemo/rules/db/model/RMTTargetDevices:getRuleId	()I
    //   41: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   44: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   47: aload_0
    //   48: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   51: ldc_w 433
    //   54: aconst_null
    //   55: aload_2
    //   56: invokevirtual 565	android/database/sqlite/SQLiteDatabase:insertOrThrow	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   59: lstore 6
    //   61: aload_0
    //   62: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   65: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   68: new 79	java/lang/StringBuilder
    //   71: dup
    //   72: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   75: ldc_w 581
    //   78: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: lload 6
    //   83: invokevirtual 570	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   86: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   89: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   92: aload_0
    //   93: monitorexit
    //   94: lload 6
    //   96: lreturn
    //   97: astore 5
    //   99: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   102: dup
    //   103: aload 5
    //   105: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   108: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   111: athrow
    //   112: astore 4
    //   114: aload_0
    //   115: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   118: aload 4
    //   120: athrow
    //   121: astore_3
    //   122: aload_0
    //   123: monitorexit
    //   124: aload_3
    //   125: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	126	0	this	RMRulesDBManager
    //   0	126	1	paramRMTTargetDevices	RMTTargetDevices
    //   9	47	2	localContentValues	ContentValues
    //   121	4	3	localObject1	Object
    //   112	7	4	localObject2	Object
    //   97	7	5	localSQLException	SQLException
    //   59	36	6	l	long
    // Exception table:
    //   from	to	target	type
    //   47	61	97	android/database/SQLException
    //   47	61	112	finally
    //   99	112	112	finally
    //   2	47	121	finally
    //   61	92	121	finally
    //   114	121	121	finally
  }
  
  public void onRulesDBUpdated()
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "Refreshing Rules DB");
      RMRulesDBHelper.getInstance().closeRightAway();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public RMTLocationInfo readLocationInfo()
    throws RuleDBException
  {
    try
    {
      localCursor = getRuleDBInstance().query("LOCATIONINFO", RMRulesContract.LocationInfo.COLUMNS, null, null, null, null, "countryCode");
      boolean bool = localCursor.moveToFirst();
      localObject3 = null;
      if (bool) {
        localRMTLocationInfo = new RMTLocationInfo();
      }
    }
    catch (SQLException localSQLException2)
    {
      try
      {
        Cursor localCursor;
        RMTLocationInfo localRMTLocationInfo;
        localRMTLocationInfo.setCityName(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("cityName")));
        localRMTLocationInfo.setCountryCode(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("countryCode")));
        localRMTLocationInfo.setCountryName(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("countryName")));
        localRMTLocationInfo.setLatitude(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("latitude")));
        localRMTLocationInfo.setLongitude(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("longitude")));
        localRMTLocationInfo.setRegion(localCursor.getString(RMRulesContract.LocationInfo.COLUMNS_LIST.indexOf("region")));
        Object localObject3 = localRMTLocationInfo;
        localCursor.close();
        closeRulesDBInstance();
        return (RMTLocationInfo)localObject3;
      }
      catch (SQLException localSQLException2)
      {
        for (;;)
        {
          localSQLException2 = localSQLException2;
        }
      }
      finally
      {
        for (;;)
        {
          localObject2 = finally;
        }
      }
      localSQLException1 = localSQLException1;
      throw new RuleDBException(localSQLException1.getMessage());
    }
    finally {}
    throw ((Throwable)localObject1);
  }
  
  public long replaceLocationInfo(RMTLocationInfo paramRMTLocationInfo)
    throws RuleDBException
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("cityName", paramRMTLocationInfo.getCityName());
    localContentValues.put("countryCode", paramRMTLocationInfo.getCountryCode());
    localContentValues.put("countryName", paramRMTLocationInfo.getCountryName());
    localContentValues.put("latitude", paramRMTLocationInfo.getLatitude());
    localContentValues.put("longitude", paramRMTLocationInfo.getLongitude());
    localContentValues.put("region", paramRMTLocationInfo.getRegion());
    localContentValues.put("LocationPk", Integer.valueOf(paramRMTLocationInfo.getLocationPk()));
    try
    {
      long l = getRuleDBInstance().replaceOrThrow("LOCATIONINFO", null, localContentValues);
      return l;
    }
    catch (SQLException localSQLException)
    {
      throw new RuleDBException(localSQLException.getMessage());
    }
    finally
    {
      closeRulesDBInstance();
    }
  }
  
  /* Error */
  public void replaceRowRules(RMTRules paramRMTRules)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 542	android/content/ContentValues
    //   5: dup
    //   6: invokespecial 543	android/content/ContentValues:<init>	()V
    //   9: astore_2
    //   10: aload_2
    //   11: ldc_w 656
    //   14: aload_1
    //   15: invokevirtual 659	com/belkin/wemo/rules/db/model/RMTRules:getEndDate	()Ljava/lang/String;
    //   18: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   21: aload_2
    //   22: ldc -95
    //   24: aload_1
    //   25: invokevirtual 662	com/belkin/wemo/rules/db/model/RMTRules:getName	()Ljava/lang/String;
    //   28: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   31: aload_2
    //   32: ldc -112
    //   34: aload_1
    //   35: invokevirtual 664	com/belkin/wemo/rules/db/model/RMTRules:getRuleId	()Ljava/lang/String;
    //   38: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   41: aload_2
    //   42: ldc_w 666
    //   45: aload_1
    //   46: invokevirtual 669	com/belkin/wemo/rules/db/model/RMTRules:getRuleOrder	()I
    //   49: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   52: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   55: aload_2
    //   56: ldc_w 671
    //   59: aload_1
    //   60: invokevirtual 674	com/belkin/wemo/rules/db/model/RMTRules:getStartDate	()Ljava/lang/String;
    //   63: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   66: aload_2
    //   67: ldc -90
    //   69: aload_1
    //   70: invokevirtual 677	com/belkin/wemo/rules/db/model/RMTRules:getState	()I
    //   73: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   76: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   79: aload_2
    //   80: ldc_w 679
    //   83: aload_1
    //   84: invokevirtual 682	com/belkin/wemo/rules/db/model/RMTRules:getSync	()Ljava/lang/String;
    //   87: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   90: aload_2
    //   91: ldc -80
    //   93: aload_1
    //   94: invokevirtual 684	com/belkin/wemo/rules/db/model/RMTRules:getType	()Ljava/lang/String;
    //   97: invokevirtual 549	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   100: aload_0
    //   101: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   104: ldc_w 430
    //   107: aconst_null
    //   108: aload_2
    //   109: invokevirtual 652	android/database/sqlite/SQLiteDatabase:replaceOrThrow	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   112: pop2
    //   113: aload_0
    //   114: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   117: aload_0
    //   118: monitorexit
    //   119: return
    //   120: astore 5
    //   122: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   125: dup
    //   126: aload 5
    //   128: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   131: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   134: athrow
    //   135: astore 4
    //   137: aload_0
    //   138: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   141: aload 4
    //   143: athrow
    //   144: astore_3
    //   145: aload_0
    //   146: monitorexit
    //   147: aload_3
    //   148: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	149	0	this	RMRulesDBManager
    //   0	149	1	paramRMTRules	RMTRules
    //   9	100	2	localContentValues	ContentValues
    //   144	4	3	localObject1	Object
    //   135	7	4	localObject2	Object
    //   120	7	5	localSQLException	SQLException
    // Exception table:
    //   from	to	target	type
    //   100	113	120	android/database/SQLException
    //   100	113	135	finally
    //   122	135	135	finally
    //   2	100	144	finally
    //   113	117	144	finally
    //   137	144	144	finally
  }
  
  /* Error */
  public int toggleRuleState(int paramInt1, int paramInt2)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 542	android/content/ContentValues
    //   5: dup
    //   6: invokespecial 543	android/content/ContentValues:<init>	()V
    //   9: astore_3
    //   10: aload_3
    //   11: ldc -90
    //   13: iload_1
    //   14: invokestatic 511	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   17: invokevirtual 547	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   20: aload_0
    //   21: invokespecial 73	com/belkin/wemo/rules/db/RMRulesDBManager:getRuleDBInstance	()Landroid/database/sqlite/SQLiteDatabase;
    //   24: astore 7
    //   26: iconst_1
    //   27: anewarray 418	java/lang/String
    //   30: astore 8
    //   32: aload 8
    //   34: iconst_0
    //   35: iload_2
    //   36: invokestatic 423	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   39: aastore
    //   40: aload 7
    //   42: ldc_w 430
    //   45: aload_3
    //   46: ldc_w 427
    //   49: aload 8
    //   51: invokevirtual 690	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   54: istore 9
    //   56: aload_0
    //   57: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   60: getstatic 20	com/belkin/wemo/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   63: new 79	java/lang/StringBuilder
    //   66: dup
    //   67: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   70: ldc_w 692
    //   73: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   76: iload 9
    //   78: invokevirtual 101	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   81: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   84: invokestatic 109	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   87: aload_0
    //   88: monitorexit
    //   89: iload 9
    //   91: ireturn
    //   92: astore 6
    //   94: new 67	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   97: dup
    //   98: aload 6
    //   100: invokevirtual 461	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   103: invokespecial 115	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   106: athrow
    //   107: astore 5
    //   109: aload_0
    //   110: invokespecial 54	com/belkin/wemo/rules/db/RMRulesDBManager:closeRulesDBInstance	()V
    //   113: aload 5
    //   115: athrow
    //   116: astore 4
    //   118: aload_0
    //   119: monitorexit
    //   120: aload 4
    //   122: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	123	0	this	RMRulesDBManager
    //   0	123	1	paramInt1	int
    //   0	123	2	paramInt2	int
    //   9	37	3	localContentValues	ContentValues
    //   116	5	4	localObject1	Object
    //   107	7	5	localObject2	Object
    //   92	7	6	localSQLException	SQLException
    //   24	17	7	localSQLiteDatabase	SQLiteDatabase
    //   30	20	8	arrayOfString	String[]
    //   54	36	9	i	int
    // Exception table:
    //   from	to	target	type
    //   20	56	92	android/database/SQLException
    //   20	56	107	finally
    //   94	107	107	finally
    //   2	20	116	finally
    //   56	87	116	finally
    //   109	116	116	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/RMRulesDBManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */