package com.belkin.rules.db;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.ArrayList;

public class RMRulesDBManager
{
  private static final String TAG = RMRulesDBManager.class.getSimpleName();
  private static RMRulesDBManager manager;
  public static DeviceListManager sDeviceListManager;
  private volatile SQLiteDatabase rulesDBInstance;
  
  private RMRulesDBManager(Context paramContext)
  {
    this.rulesDBInstance = RMRulesDBHelper.getInstance(paramContext).openDatabase();
  }
  
  public static final RMRulesDBManager getInstance(Context paramContext)
  {
    try
    {
      manager = new RMRulesDBManager(paramContext);
      RMRulesDBManager localRMRulesDBManager = manager;
      return localRMRulesDBManager;
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
      SQLiteDatabase localSQLiteDatabase = this.rulesDBInstance;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = localSQLiteDatabase.delete("RULEDEVICES", "RuleID=?", arrayOfString);
      return i;
    }
    catch (SQLiteException localSQLiteException)
    {
      throw new RuleDBException(localSQLiteException.getMessage());
    }
    finally {}
  }
  
  public int deleteRowRules(int paramInt)
    throws RuleDBException
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.rulesDBInstance;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = localSQLiteDatabase.delete("RULES", "RuleID=?", arrayOfString);
      return i;
    }
    catch (SQLiteException localSQLiteException)
    {
      throw new RuleDBException(localSQLiteException.getMessage());
    }
    finally {}
  }
  
  /* Error */
  public ArrayList<String> getRuleIdArrayForNestDevices()
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 78	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 79	java/util/ArrayList:<init>	()V
    //   9: astore_1
    //   10: aload_0
    //   11: getfield 38	com/belkin/rules/db/RMRulesDBManager:rulesDBInstance	Landroid/database/sqlite/SQLiteDatabase;
    //   14: ldc 74
    //   16: aconst_null
    //   17: ldc 81
    //   19: iconst_1
    //   20: anewarray 51	java/lang/String
    //   23: dup
    //   24: iconst_0
    //   25: ldc 83
    //   27: aastore
    //   28: aconst_null
    //   29: aconst_null
    //   30: aconst_null
    //   31: invokevirtual 87	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   34: astore 4
    //   36: iconst_0
    //   37: istore 5
    //   39: iload 5
    //   41: aload 4
    //   43: invokeinterface 93 1 0
    //   48: if_icmpge +40 -> 88
    //   51: aload 4
    //   53: iload 5
    //   55: invokeinterface 97 2 0
    //   60: pop
    //   61: aload_1
    //   62: aload 4
    //   64: aload 4
    //   66: ldc 99
    //   68: invokeinterface 103 2 0
    //   73: invokeinterface 106 2 0
    //   78: invokevirtual 110	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   81: pop
    //   82: iinc 5 1
    //   85: goto -46 -> 39
    //   88: aload 4
    //   90: invokeinterface 113 1 0
    //   95: getstatic 22	com/belkin/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   98: new 115	java/lang/StringBuilder
    //   101: dup
    //   102: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   105: ldc 118
    //   107: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   110: aload_1
    //   111: invokevirtual 125	java/util/ArrayList:toString	()Ljava/lang/String;
    //   114: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: invokevirtual 126	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   120: invokestatic 132	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   123: aload_0
    //   124: monitorexit
    //   125: aload_1
    //   126: areturn
    //   127: astore_3
    //   128: new 47	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   131: dup
    //   132: aload_3
    //   133: invokevirtual 68	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   136: invokespecial 71	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   139: athrow
    //   140: astore_2
    //   141: aload_0
    //   142: monitorexit
    //   143: aload_2
    //   144: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	145	0	this	RMRulesDBManager
    //   9	117	1	localArrayList	ArrayList
    //   140	4	2	localObject	Object
    //   127	6	3	localSQLiteException	SQLiteException
    //   34	55	4	localCursor	Cursor
    //   37	46	5	i	int
    // Exception table:
    //   from	to	target	type
    //   10	36	127	android/database/sqlite/SQLiteException
    //   39	82	127	android/database/sqlite/SQLiteException
    //   88	95	127	android/database/sqlite/SQLiteException
    //   2	10	140	finally
    //   10	36	140	finally
    //   39	82	140	finally
    //   88	95	140	finally
    //   95	123	140	finally
    //   128	140	140	finally
  }
  
  /* Error */
  public ArrayList<String> getRuleIdArrayForNestDevices(String paramString)
    throws RuleDBException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 78	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 79	java/util/ArrayList:<init>	()V
    //   9: astore_2
    //   10: aload_0
    //   11: getfield 38	com/belkin/rules/db/RMRulesDBManager:rulesDBInstance	Landroid/database/sqlite/SQLiteDatabase;
    //   14: ldc 57
    //   16: iconst_1
    //   17: anewarray 51	java/lang/String
    //   20: dup
    //   21: iconst_0
    //   22: ldc 99
    //   24: aastore
    //   25: ldc -121
    //   27: iconst_1
    //   28: anewarray 51	java/lang/String
    //   31: dup
    //   32: iconst_0
    //   33: aload_1
    //   34: aastore
    //   35: aconst_null
    //   36: aconst_null
    //   37: aconst_null
    //   38: invokevirtual 87	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   41: astore 5
    //   43: iconst_0
    //   44: istore 6
    //   46: iload 6
    //   48: aload 5
    //   50: invokeinterface 93 1 0
    //   55: if_icmpge +40 -> 95
    //   58: aload 5
    //   60: iload 6
    //   62: invokeinterface 97 2 0
    //   67: pop
    //   68: aload_2
    //   69: aload 5
    //   71: aload 5
    //   73: ldc 99
    //   75: invokeinterface 103 2 0
    //   80: invokeinterface 106 2 0
    //   85: invokevirtual 110	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   88: pop
    //   89: iinc 6 1
    //   92: goto -46 -> 46
    //   95: aload 5
    //   97: invokeinterface 113 1 0
    //   102: getstatic 22	com/belkin/rules/db/RMRulesDBManager:TAG	Ljava/lang/String;
    //   105: new 115	java/lang/StringBuilder
    //   108: dup
    //   109: invokespecial 116	java/lang/StringBuilder:<init>	()V
    //   112: ldc 118
    //   114: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: aload_2
    //   118: invokevirtual 125	java/util/ArrayList:toString	()Ljava/lang/String;
    //   121: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 126	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   127: invokestatic 132	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   130: aload_0
    //   131: monitorexit
    //   132: aload_2
    //   133: areturn
    //   134: astore 4
    //   136: new 47	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   139: dup
    //   140: aload 4
    //   142: invokevirtual 68	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   145: invokespecial 71	com/belkin/wemo/rules/operation/db/exception/RuleDBException:<init>	(Ljava/lang/String;)V
    //   148: athrow
    //   149: astore_3
    //   150: aload_0
    //   151: monitorexit
    //   152: aload_3
    //   153: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	154	0	this	RMRulesDBManager
    //   0	154	1	paramString	String
    //   9	124	2	localArrayList	ArrayList
    //   149	4	3	localObject	Object
    //   134	7	4	localSQLiteException	SQLiteException
    //   41	55	5	localCursor	Cursor
    //   44	46	6	i	int
    // Exception table:
    //   from	to	target	type
    //   10	43	134	android/database/sqlite/SQLiteException
    //   46	89	134	android/database/sqlite/SQLiteException
    //   95	102	134	android/database/sqlite/SQLiteException
    //   2	10	149	finally
    //   10	43	149	finally
    //   46	89	149	finally
    //   95	102	149	finally
    //   102	130	149	finally
    //   136	149	149	finally
  }
  
  public ArrayList<String> getTargetDeviceUDNForNestDevices(ArrayList<String> paramArrayList)
    throws RuleDBException
  {
    for (;;)
    {
      int i;
      try
      {
        ArrayList localArrayList = new ArrayList();
        i = 0;
        if (i < paramArrayList.size())
        {
          String str1 = (String)paramArrayList.get(i);
          Cursor localCursor = this.rulesDBInstance.query("RULEDEVICES", new String[] { "DeviceID" }, "RuleID= ?", new String[] { str1 }, null, null, null);
          int j = 0;
          if (j < localCursor.getCount())
          {
            localCursor.moveToPosition(j);
            String str2 = localCursor.getString(localCursor.getColumnIndex("DeviceID"));
            localArrayList.add(str2);
            LogUtils.infoLog(TAG, "Target device UDN for Nest Devices: " + str2);
            j++;
            continue;
          }
        }
        else
        {
          LogUtils.infoLog(TAG, "Target device UDN for Nest Devices Map: " + localArrayList.toString());
          return localArrayList;
        }
      }
      finally {}
      i++;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/db/RMRulesDBManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */