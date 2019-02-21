package io.liteglue;

import android.app.Activity;
import android.util.Log;
import com.almworks.sqlite4java.SQLiteConnection;
import com.almworks.sqlite4java.SQLiteException;
import com.almworks.sqlite4java.SQLiteStatement;
import com.belkin.utils.RuleUtility;
import java.io.File;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SQLitePlugin
  extends CordovaPlugin
{
  static ConcurrentHashMap<String, DBRunner> dbrmap = new ConcurrentHashMap();
  
  private void closeDatabase(String paramString, CallbackContext paramCallbackContext)
  {
    DBRunner localDBRunner = (DBRunner)dbrmap.get(paramString);
    if (localDBRunner != null) {}
    while (paramCallbackContext == null) {
      try
      {
        localDBRunner.q.put(new DBQuery(false, paramCallbackContext));
        return;
      }
      catch (Exception localException)
      {
        if (paramCallbackContext != null) {
          paramCallbackContext.error("couldn't close database" + localException);
        }
        Log.e(SQLitePlugin.class.getSimpleName(), "couldn't close database", localException);
        return;
      }
    }
    paramCallbackContext.success();
  }
  
  private void closeDatabaseNow(String paramString)
  {
    DBRunner localDBRunner = (DBRunner)dbrmap.get(paramString);
    if (localDBRunner != null)
    {
      SQLiteAndroidDatabase localSQLiteAndroidDatabase = localDBRunner.mydb;
      if (localSQLiteAndroidDatabase != null) {
        localSQLiteAndroidDatabase.closeDatabaseNow();
      }
    }
  }
  
  /* Error */
  private void createFromAssets(String paramString, File paramFile)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: aload_0
    //   6: getfield 111	io/liteglue/SQLitePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   9: invokeinterface 117 1 0
    //   14: invokevirtual 123	android/app/Activity:getAssets	()Landroid/content/res/AssetManager;
    //   17: new 62	java/lang/StringBuilder
    //   20: dup
    //   21: invokespecial 63	java/lang/StringBuilder:<init>	()V
    //   24: ldc 125
    //   26: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_1
    //   30: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: invokevirtual 76	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   36: invokevirtual 131	android/content/res/AssetManager:open	(Ljava/lang/String;)Ljava/io/InputStream;
    //   39: astore_3
    //   40: aload_2
    //   41: invokevirtual 136	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   44: astore 12
    //   46: aload 12
    //   48: iconst_0
    //   49: iconst_1
    //   50: aload 12
    //   52: ldc -118
    //   54: invokevirtual 144	java/lang/String:lastIndexOf	(Ljava/lang/String;)I
    //   57: iadd
    //   58: invokevirtual 148	java/lang/String:substring	(II)Ljava/lang/String;
    //   61: astore 13
    //   63: new 133	java/io/File
    //   66: dup
    //   67: aload 13
    //   69: invokespecial 150	java/io/File:<init>	(Ljava/lang/String;)V
    //   72: astore 14
    //   74: aload 14
    //   76: invokevirtual 154	java/io/File:exists	()Z
    //   79: istore 15
    //   81: aconst_null
    //   82: astore 4
    //   84: iload 15
    //   86: ifne +9 -> 95
    //   89: aload 14
    //   91: invokevirtual 157	java/io/File:mkdirs	()Z
    //   94: pop
    //   95: new 133	java/io/File
    //   98: dup
    //   99: new 62	java/lang/StringBuilder
    //   102: dup
    //   103: invokespecial 63	java/lang/StringBuilder:<init>	()V
    //   106: aload 13
    //   108: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   111: aload_1
    //   112: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: invokevirtual 76	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   118: invokespecial 150	java/io/File:<init>	(Ljava/lang/String;)V
    //   121: astore 17
    //   123: new 159	java/io/FileOutputStream
    //   126: dup
    //   127: aload 17
    //   129: invokespecial 162	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   132: astore 18
    //   134: sipush 1024
    //   137: newarray <illegal type>
    //   139: astore 19
    //   141: aload_3
    //   142: aload 19
    //   144: invokevirtual 168	java/io/InputStream:read	([B)I
    //   147: istore 20
    //   149: iload 20
    //   151: ifle +70 -> 221
    //   154: aload 18
    //   156: aload 19
    //   158: iconst_0
    //   159: iload 20
    //   161: invokevirtual 174	java/io/OutputStream:write	([BII)V
    //   164: goto -23 -> 141
    //   167: astore 5
    //   169: aload 18
    //   171: astore 4
    //   173: ldc -81
    //   175: new 62	java/lang/StringBuilder
    //   178: dup
    //   179: invokespecial 63	java/lang/StringBuilder:<init>	()V
    //   182: ldc -79
    //   184: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   187: aload 5
    //   189: invokevirtual 180	java/io/IOException:getMessage	()Ljava/lang/String;
    //   192: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   195: invokevirtual 76	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   198: invokestatic 184	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   201: pop
    //   202: aload_3
    //   203: ifnull +7 -> 210
    //   206: aload_3
    //   207: invokevirtual 187	java/io/InputStream:close	()V
    //   210: aload 4
    //   212: ifnull +8 -> 220
    //   215: aload 4
    //   217: invokevirtual 188	java/io/OutputStream:close	()V
    //   220: return
    //   221: ldc -66
    //   223: new 62	java/lang/StringBuilder
    //   226: dup
    //   227: invokespecial 63	java/lang/StringBuilder:<init>	()V
    //   230: ldc -64
    //   232: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: aload 17
    //   237: invokevirtual 136	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   240: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   243: invokevirtual 76	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   246: invokestatic 184	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   249: pop
    //   250: aload_3
    //   251: ifnull +7 -> 258
    //   254: aload_3
    //   255: invokevirtual 187	java/io/InputStream:close	()V
    //   258: aload 18
    //   260: ifnull +75 -> 335
    //   263: aload 18
    //   265: invokevirtual 188	java/io/OutputStream:close	()V
    //   268: return
    //   269: astore 22
    //   271: return
    //   272: astore 6
    //   274: aload_3
    //   275: ifnull +7 -> 282
    //   278: aload_3
    //   279: invokevirtual 187	java/io/InputStream:close	()V
    //   282: aload 4
    //   284: ifnull +8 -> 292
    //   287: aload 4
    //   289: invokevirtual 188	java/io/OutputStream:close	()V
    //   292: aload 6
    //   294: athrow
    //   295: astore 23
    //   297: goto -39 -> 258
    //   300: astore 11
    //   302: goto -92 -> 210
    //   305: astore 10
    //   307: return
    //   308: astore 8
    //   310: goto -28 -> 282
    //   313: astore 7
    //   315: goto -23 -> 292
    //   318: astore 6
    //   320: aload 18
    //   322: astore 4
    //   324: goto -50 -> 274
    //   327: astore 5
    //   329: aconst_null
    //   330: astore 4
    //   332: goto -159 -> 173
    //   335: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	336	0	this	SQLitePlugin
    //   0	336	1	paramString	String
    //   0	336	2	paramFile	File
    //   1	278	3	localInputStream	java.io.InputStream
    //   3	328	4	localObject1	Object
    //   167	21	5	localIOException1	java.io.IOException
    //   327	1	5	localIOException2	java.io.IOException
    //   272	21	6	localObject2	Object
    //   318	1	6	localObject3	Object
    //   313	1	7	localIOException3	java.io.IOException
    //   308	1	8	localIOException4	java.io.IOException
    //   305	1	10	localIOException5	java.io.IOException
    //   300	1	11	localIOException6	java.io.IOException
    //   44	7	12	str1	String
    //   61	46	13	str2	String
    //   72	18	14	localFile1	File
    //   79	6	15	bool	boolean
    //   121	115	17	localFile2	File
    //   132	189	18	localFileOutputStream	java.io.FileOutputStream
    //   139	18	19	arrayOfByte	byte[]
    //   147	13	20	i	int
    //   269	1	22	localIOException7	java.io.IOException
    //   295	1	23	localIOException8	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   134	141	167	java/io/IOException
    //   141	149	167	java/io/IOException
    //   154	164	167	java/io/IOException
    //   221	250	167	java/io/IOException
    //   263	268	269	java/io/IOException
    //   5	81	272	finally
    //   89	95	272	finally
    //   95	134	272	finally
    //   173	202	272	finally
    //   254	258	295	java/io/IOException
    //   206	210	300	java/io/IOException
    //   215	220	305	java/io/IOException
    //   278	282	308	java/io/IOException
    //   287	292	313	java/io/IOException
    //   134	141	318	finally
    //   141	149	318	finally
    //   154	164	318	finally
    //   221	250	318	finally
    //   5	81	327	java/io/IOException
    //   89	95	327	java/io/IOException
    //   95	134	327	java/io/IOException
  }
  
  private void deleteDatabase(String paramString, CallbackContext paramCallbackContext)
  {
    DBRunner localDBRunner = (DBRunner)dbrmap.get(paramString);
    if (localDBRunner != null) {
      try
      {
        localDBRunner.q.put(new DBQuery(true, paramCallbackContext));
        return;
      }
      catch (Exception localException)
      {
        if (paramCallbackContext != null) {
          paramCallbackContext.error("couldn't close database" + localException);
        }
        Log.e(SQLitePlugin.class.getSimpleName(), "couldn't close database", localException);
        return;
      }
    }
    if (deleteDatabaseNow(paramString))
    {
      paramCallbackContext.success();
      return;
    }
    paramCallbackContext.error("couldn't delete database");
  }
  
  private boolean deleteDatabaseNow(String paramString)
  {
    File localFile = this.cordova.getActivity().getDatabasePath(paramString + ".db");
    try
    {
      boolean bool = this.cordova.getActivity().deleteDatabase(localFile.getAbsolutePath());
      return bool;
    }
    catch (Exception localException)
    {
      Log.e(SQLitePlugin.class.getSimpleName(), "couldn't delete database", localException);
    }
    return false;
  }
  
  private boolean executeAndPossiblyThrow(Action paramAction, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    switch (paramAction)
    {
    default: 
      return true;
    case ???: 
      JSONObject localJSONObject3 = paramJSONArray.getJSONObject(0);
      startDatabase(localJSONObject3.getString("name"), localJSONObject3, paramCallbackContext);
      return true;
    case ???: 
      closeDatabase(paramJSONArray.getJSONObject(0).getString("path"), paramCallbackContext);
      return true;
    case ???: 
      deleteDatabase(paramJSONArray.getJSONObject(0).getString("path"), paramCallbackContext);
      return true;
    }
    String[] arrayOfString1 = null;
    JSONArray[] arrayOfJSONArray = null;
    JSONObject localJSONObject1 = paramJSONArray.getJSONObject(0);
    String str = localJSONObject1.getJSONObject("dbargs").getString("dbname");
    JSONArray localJSONArray1 = localJSONObject1.getJSONArray("executes");
    String[] arrayOfString2;
    if (localJSONArray1.isNull(0)) {
      arrayOfString2 = new String[0];
    }
    for (;;)
    {
      DBQuery localDBQuery = new DBQuery(arrayOfString2, arrayOfString1, arrayOfJSONArray, paramCallbackContext);
      DBRunner localDBRunner = (DBRunner)dbrmap.get(str);
      if (localDBRunner == null) {
        break;
      }
      try
      {
        localDBRunner.q.put(localDBQuery);
        return true;
      }
      catch (Exception localException)
      {
        Log.e(SQLitePlugin.class.getSimpleName(), "couldn't add to queue", localException);
        paramCallbackContext.error("couldn't add to queue");
        return true;
      }
      int i = localJSONArray1.length();
      arrayOfString2 = new String[i];
      arrayOfString1 = new String[i];
      arrayOfJSONArray = new JSONArray[i];
      for (int j = 0; j < i; j++)
      {
        JSONObject localJSONObject2 = localJSONArray1.getJSONObject(j);
        arrayOfString2[j] = localJSONObject2.getString("sql");
        arrayOfString1[j] = localJSONObject2.getString("qid");
        JSONArray localJSONArray2 = localJSONObject2.getJSONArray("params");
        localJSONArray2.length();
        arrayOfJSONArray[j] = localJSONArray2;
      }
    }
    paramCallbackContext.error("database not open");
    return true;
  }
  
  private SQLiteAndroidDatabase openDatabase(String paramString, boolean paramBoolean1, CallbackContext paramCallbackContext, boolean paramBoolean2)
    throws Exception
  {
    try
    {
      File localFile = new File(RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName());
      if (!localFile.exists()) {
        localFile.getParentFile().mkdirs();
      }
      Log.v("info", "Open sqlite db: " + localFile.getAbsolutePath());
      if (paramBoolean2) {}
      for (Object localObject = new SQLiteAndroidDatabase();; localObject = new SQLiteDatabaseNDK())
      {
        ((SQLiteAndroidDatabase)localObject).open(localFile);
        if (paramCallbackContext == null) {
          break;
        }
        paramCallbackContext.success();
        return (SQLiteAndroidDatabase)localObject;
      }
      return (SQLiteAndroidDatabase)localObject;
    }
    catch (SQLiteException localSQLiteException)
    {
      if (paramCallbackContext != null) {
        paramCallbackContext.error("can't open database " + localSQLiteException);
      }
      throw localSQLiteException;
    }
  }
  
  private void startDatabase(String paramString, JSONObject paramJSONObject, CallbackContext paramCallbackContext)
  {
    if ((DBRunner)dbrmap.get(paramString) != null)
    {
      paramCallbackContext.success();
      return;
    }
    DBRunner localDBRunner = new DBRunner(paramString, paramJSONObject, paramCallbackContext);
    dbrmap.put(paramString, localDBRunner);
    this.cordova.getThreadPool().execute(localDBRunner);
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    try
    {
      Action localAction = Action.valueOf(paramString);
      boolean bool;
      return false;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      try
      {
        bool = executeAndPossiblyThrow(localAction, paramJSONArray, paramCallbackContext);
        return bool;
      }
      catch (JSONException localJSONException)
      {
        Log.e(SQLitePlugin.class.getSimpleName(), "unexpected error", localJSONException);
      }
      localIllegalArgumentException = localIllegalArgumentException;
      Log.e(SQLitePlugin.class.getSimpleName(), "unexpected error", localIllegalArgumentException);
      return false;
    }
  }
  
  public void onDestroy()
  {
    for (;;)
    {
      if (!dbrmap.isEmpty())
      {
        String str = (String)dbrmap.keySet().iterator().next();
        closeDatabaseNow(str);
        DBRunner localDBRunner = (DBRunner)dbrmap.get(str);
        try
        {
          localDBRunner.q.put(new DBQuery());
          dbrmap.remove(str);
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Log.e(SQLitePlugin.class.getSimpleName(), "couldn't stop db thread", localException);
          }
        }
      }
    }
  }
  
  private static enum Action
  {
    static
    {
      close = new Action("close", 1);
      delete = new Action("delete", 2);
      executeSqlBatch = new Action("executeSqlBatch", 3);
      backgroundExecuteSqlBatch = new Action("backgroundExecuteSqlBatch", 4);
      Action[] arrayOfAction = new Action[5];
      arrayOfAction[0] = open;
      arrayOfAction[1] = close;
      arrayOfAction[2] = delete;
      arrayOfAction[3] = executeSqlBatch;
      arrayOfAction[4] = backgroundExecuteSqlBatch;
      $VALUES = arrayOfAction;
    }
    
    private Action() {}
  }
  
  private final class DBQuery
  {
    final CallbackContext cbc;
    final boolean close;
    final boolean delete;
    final JSONArray[] jsonparams;
    final String[] queries;
    final String[] queryIDs;
    final boolean stop;
    
    DBQuery()
    {
      this.stop = true;
      this.close = false;
      this.delete = false;
      this.queries = null;
      this.queryIDs = null;
      this.jsonparams = null;
      this.cbc = null;
    }
    
    DBQuery(boolean paramBoolean, CallbackContext paramCallbackContext)
    {
      this.stop = true;
      this.close = true;
      this.delete = paramBoolean;
      this.queries = null;
      this.queryIDs = null;
      this.jsonparams = null;
      this.cbc = paramCallbackContext;
    }
    
    DBQuery(String[] paramArrayOfString1, String[] paramArrayOfString2, JSONArray[] paramArrayOfJSONArray, CallbackContext paramCallbackContext)
    {
      this.stop = false;
      this.close = false;
      this.delete = false;
      this.queries = paramArrayOfString1;
      this.queryIDs = paramArrayOfString2;
      this.jsonparams = paramArrayOfJSONArray;
      this.cbc = paramCallbackContext;
    }
  }
  
  private class DBRunner
    implements Runnable
  {
    private boolean bugWorkaround;
    private boolean createFromAssets;
    final String dbname;
    SQLiteAndroidDatabase mydb;
    private boolean oldImpl;
    final CallbackContext openCbc;
    final BlockingQueue<SQLitePlugin.DBQuery> q;
    
    DBRunner(String paramString, JSONObject paramJSONObject, CallbackContext paramCallbackContext)
    {
      this.dbname = paramString;
      this.createFromAssets = paramJSONObject.has("createFromResource");
      this.oldImpl = paramJSONObject.has("androidOldDatabaseImplementation");
      String str1 = SQLitePlugin.class.getSimpleName();
      StringBuilder localStringBuilder = new StringBuilder().append("Android db implementation: ");
      String str2;
      if (this.oldImpl)
      {
        str2 = "OLD";
        Log.v(str1, str2);
        if ((!this.oldImpl) || (!paramJSONObject.has("androidBugWorkaround"))) {
          break label150;
        }
      }
      label150:
      for (boolean bool = true;; bool = false)
      {
        this.bugWorkaround = bool;
        if (this.bugWorkaround) {
          Log.v(SQLitePlugin.class.getSimpleName(), "Android db closing/locking workaround applied");
        }
        this.q = new LinkedBlockingQueue();
        this.openCbc = paramCallbackContext;
        return;
        str2 = "sqlite4java (NDK)";
        break;
      }
    }
    
    /* Error */
    public void run()
    {
      // Byte code:
      //   0: aload_0
      //   1: aload_0
      //   2: getfield 25	io/liteglue/SQLitePlugin$DBRunner:this$0	Lio/liteglue/SQLitePlugin;
      //   5: aload_0
      //   6: getfield 30	io/liteglue/SQLitePlugin$DBRunner:dbname	Ljava/lang/String;
      //   9: aload_0
      //   10: getfield 40	io/liteglue/SQLitePlugin$DBRunner:createFromAssets	Z
      //   13: aload_0
      //   14: getfield 85	io/liteglue/SQLitePlugin$DBRunner:openCbc	Lorg/apache/cordova/CallbackContext;
      //   17: aload_0
      //   18: getfield 44	io/liteglue/SQLitePlugin$DBRunner:oldImpl	Z
      //   21: invokestatic 94	io/liteglue/SQLitePlugin:access$000	(Lio/liteglue/SQLitePlugin;Ljava/lang/String;ZLorg/apache/cordova/CallbackContext;Z)Lio/liteglue/SQLiteAndroidDatabase;
      //   24: putfield 96	io/liteglue/SQLitePlugin$DBRunner:mydb	Lio/liteglue/SQLiteAndroidDatabase;
      //   27: aconst_null
      //   28: astore 4
      //   30: aload_0
      //   31: getfield 83	io/liteglue/SQLitePlugin$DBRunner:q	Ljava/util/concurrent/BlockingQueue;
      //   34: invokeinterface 102 1 0
      //   39: checkcast 104	io/liteglue/SQLitePlugin$DBQuery
      //   42: astore 4
      //   44: aload 4
      //   46: getfield 107	io/liteglue/SQLitePlugin$DBQuery:stop	Z
      //   49: ifne +123 -> 172
      //   52: aload_0
      //   53: getfield 96	io/liteglue/SQLitePlugin$DBRunner:mydb	Lio/liteglue/SQLiteAndroidDatabase;
      //   56: aload 4
      //   58: getfield 111	io/liteglue/SQLitePlugin$DBQuery:queries	[Ljava/lang/String;
      //   61: aload 4
      //   63: getfield 115	io/liteglue/SQLitePlugin$DBQuery:jsonparams	[Lorg/json/JSONArray;
      //   66: aload 4
      //   68: getfield 118	io/liteglue/SQLitePlugin$DBQuery:queryIDs	[Ljava/lang/String;
      //   71: aload 4
      //   73: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   76: invokevirtual 127	io/liteglue/SQLiteAndroidDatabase:executeSqlBatch	([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
      //   79: aload_0
      //   80: getfield 76	io/liteglue/SQLitePlugin$DBRunner:bugWorkaround	Z
      //   83: ifeq +32 -> 115
      //   86: aload 4
      //   88: getfield 111	io/liteglue/SQLitePlugin$DBQuery:queries	[Ljava/lang/String;
      //   91: arraylength
      //   92: iconst_1
      //   93: if_icmpne +22 -> 115
      //   96: aload 4
      //   98: getfield 111	io/liteglue/SQLitePlugin$DBQuery:queries	[Ljava/lang/String;
      //   101: iconst_0
      //   102: aaload
      //   103: ldc -127
      //   105: if_acmpne +10 -> 115
      //   108: aload_0
      //   109: getfield 96	io/liteglue/SQLitePlugin$DBRunner:mydb	Lio/liteglue/SQLiteAndroidDatabase;
      //   112: invokevirtual 131	io/liteglue/SQLiteAndroidDatabase:bugWorkaround	()V
      //   115: aload_0
      //   116: getfield 83	io/liteglue/SQLitePlugin$DBRunner:q	Ljava/util/concurrent/BlockingQueue;
      //   119: invokeinterface 102 1 0
      //   124: checkcast 104	io/liteglue/SQLitePlugin$DBQuery
      //   127: astore 4
      //   129: goto -85 -> 44
      //   132: astore_1
      //   133: ldc 46
      //   135: invokevirtual 52	java/lang/Class:getSimpleName	()Ljava/lang/String;
      //   138: ldc -123
      //   140: aload_1
      //   141: invokestatic 137	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   144: pop
      //   145: getstatic 141	io/liteglue/SQLitePlugin:dbrmap	Ljava/util/concurrent/ConcurrentHashMap;
      //   148: aload_0
      //   149: getfield 30	io/liteglue/SQLitePlugin$DBRunner:dbname	Ljava/lang/String;
      //   152: invokevirtual 147	java/util/concurrent/ConcurrentHashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
      //   155: pop
      //   156: return
      //   157: astore 5
      //   159: ldc 46
      //   161: invokevirtual 52	java/lang/Class:getSimpleName	()Ljava/lang/String;
      //   164: ldc -107
      //   166: aload 5
      //   168: invokestatic 137	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   171: pop
      //   172: aload 4
      //   174: ifnull -18 -> 156
      //   177: aload 4
      //   179: getfield 152	io/liteglue/SQLitePlugin$DBQuery:close	Z
      //   182: ifeq -26 -> 156
      //   185: aload_0
      //   186: getfield 25	io/liteglue/SQLitePlugin$DBRunner:this$0	Lio/liteglue/SQLitePlugin;
      //   189: aload_0
      //   190: getfield 30	io/liteglue/SQLitePlugin$DBRunner:dbname	Ljava/lang/String;
      //   193: invokestatic 156	io/liteglue/SQLitePlugin:access$100	(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)V
      //   196: getstatic 141	io/liteglue/SQLitePlugin:dbrmap	Ljava/util/concurrent/ConcurrentHashMap;
      //   199: aload_0
      //   200: getfield 30	io/liteglue/SQLitePlugin$DBRunner:dbname	Ljava/lang/String;
      //   203: invokevirtual 147	java/util/concurrent/ConcurrentHashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
      //   206: pop
      //   207: aload 4
      //   209: getfield 159	io/liteglue/SQLitePlugin$DBQuery:delete	Z
      //   212: ifne +64 -> 276
      //   215: aload 4
      //   217: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   220: invokevirtual 164	org/apache/cordova/CallbackContext:success	()V
      //   223: return
      //   224: astore 7
      //   226: ldc 46
      //   228: invokevirtual 52	java/lang/Class:getSimpleName	()Ljava/lang/String;
      //   231: ldc -90
      //   233: aload 7
      //   235: invokestatic 137	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   238: pop
      //   239: aload 4
      //   241: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   244: ifnull -88 -> 156
      //   247: aload 4
      //   249: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   252: new 54	java/lang/StringBuilder
      //   255: dup
      //   256: invokespecial 55	java/lang/StringBuilder:<init>	()V
      //   259: ldc -88
      //   261: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   264: aload 7
      //   266: invokevirtual 171	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   269: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   272: invokevirtual 175	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
      //   275: return
      //   276: aload_0
      //   277: getfield 25	io/liteglue/SQLitePlugin$DBRunner:this$0	Lio/liteglue/SQLitePlugin;
      //   280: aload_0
      //   281: getfield 30	io/liteglue/SQLitePlugin$DBRunner:dbname	Ljava/lang/String;
      //   284: invokestatic 179	io/liteglue/SQLitePlugin:access$200	(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)Z
      //   287: ifeq +56 -> 343
      //   290: aload 4
      //   292: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   295: invokevirtual 164	org/apache/cordova/CallbackContext:success	()V
      //   298: return
      //   299: astore 10
      //   301: ldc 46
      //   303: invokevirtual 52	java/lang/Class:getSimpleName	()Ljava/lang/String;
      //   306: ldc -75
      //   308: aload 10
      //   310: invokestatic 137	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   313: pop
      //   314: aload 4
      //   316: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   319: new 54	java/lang/StringBuilder
      //   322: dup
      //   323: invokespecial 55	java/lang/StringBuilder:<init>	()V
      //   326: ldc -73
      //   328: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   331: aload 10
      //   333: invokevirtual 171	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   336: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   339: invokevirtual 175	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
      //   342: return
      //   343: aload 4
      //   345: getfield 121	io/liteglue/SQLitePlugin$DBQuery:cbc	Lorg/apache/cordova/CallbackContext;
      //   348: ldc -75
      //   350: invokevirtual 175	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
      //   353: return
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	354	0	this	DBRunner
      //   132	9	1	localException1	Exception
      //   28	316	4	localDBQuery	SQLitePlugin.DBQuery
      //   157	10	5	localException2	Exception
      //   224	41	7	localException3	Exception
      //   299	33	10	localException4	Exception
      // Exception table:
      //   from	to	target	type
      //   0	27	132	java/lang/Exception
      //   30	44	157	java/lang/Exception
      //   44	115	157	java/lang/Exception
      //   115	129	157	java/lang/Exception
      //   185	223	224	java/lang/Exception
      //   301	342	224	java/lang/Exception
      //   276	298	299	java/lang/Exception
      //   343	353	299	java/lang/Exception
    }
  }
  
  class SQLiteDatabaseNDK
    extends SQLiteAndroidDatabase
  {
    SQLiteConnection mydb;
    
    SQLiteDatabaseNDK() {}
    
    private JSONObject executeSqlStatementNDK(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
      throws Exception
    {
      JSONObject localJSONObject1 = new JSONObject();
      SQLiteStatement localSQLiteStatement = this.mydb.prepare(paramString);
      int i;
      Object localObject;
      try
      {
        new String[paramJSONArray.length()];
        i = 0;
        if (i >= paramJSONArray.length()) {
          break label198;
        }
        if (paramJSONArray.isNull(i))
        {
          localSQLiteStatement.bindNull(i + 1);
        }
        else
        {
          localObject = paramJSONArray.get(i);
          if (((localObject instanceof Float)) || ((localObject instanceof Double))) {
            localSQLiteStatement.bind(i + 1, paramJSONArray.getDouble(i));
          }
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        String str1 = localException.getMessage();
        Log.v("executeSqlBatch", "SQLitePlugin.executeSql[Batch](): Error=" + str1);
        localSQLiteStatement.dispose();
        throw localException;
      }
      label198:
      JSONArray localJSONArray;
      int j;
      JSONObject localJSONObject2;
      if ((localObject instanceof Number))
      {
        localSQLiteStatement.bind(i + 1, paramJSONArray.getLong(i));
      }
      else
      {
        localSQLiteStatement.bind(i + 1, paramJSONArray.getString(i));
        break label418;
        boolean bool = localSQLiteStatement.step();
        if (bool)
        {
          localJSONArray = new JSONArray();
          j = localSQLiteStatement.columnCount();
          localJSONObject2 = new JSONObject();
        }
      }
      label418:
      label424:
      for (int k = 0;; k++)
      {
        String str2;
        if (k < j)
        {
          try
          {
            str2 = localSQLiteStatement.getColumnName(k);
            switch (localSQLiteStatement.columnType(k))
            {
            case 3: 
            case 4: 
            default: 
              localJSONObject2.put(str2, localSQLiteStatement.columnString(k));
            }
          }
          catch (JSONException localJSONException2)
          {
            localJSONException2.printStackTrace();
          }
          localJSONObject2.put(str2, JSONObject.NULL);
        }
        else
        {
          while (!localSQLiteStatement.step()) {
            try
            {
              localJSONObject1.put("rows", localJSONArray);
              localSQLiteStatement.dispose();
              return localJSONObject1;
              localJSONObject2.put(str2, localSQLiteStatement.columnDouble(k));
              break label424;
              localJSONObject2.put(str2, localSQLiteStatement.columnLong(k));
              break label424;
              localJSONArray.put(localJSONObject2);
            }
            catch (JSONException localJSONException1)
            {
              for (;;)
              {
                localJSONException1.printStackTrace();
              }
            }
          }
          i++;
          break;
        }
      }
    }
    
    void bugWorkaround() {}
    
    void closeDatabaseNow()
    {
      if (this.mydb != null) {
        this.mydb.dispose();
      }
    }
    
    void executeSqlBatch(String[] paramArrayOfString1, JSONArray[] paramArrayOfJSONArray, String[] paramArrayOfString2, CallbackContext paramCallbackContext)
    {
      if (this.mydb == null)
      {
        paramCallbackContext.error("database has been closed");
        return;
      }
      int i = paramArrayOfString1.length;
      JSONArray localJSONArray = new JSONArray();
      int j = 0;
      for (;;)
      {
        if (j < i)
        {
          String str1 = paramArrayOfString2[j];
          JSONObject localJSONObject1 = null;
          String str2 = "unknown";
          try
          {
            String str3 = paramArrayOfString1[j];
            long l1 = this.mydb.getTotalChanges();
            localJSONObject1 = executeSqlStatementNDK(str3, paramArrayOfJSONArray[j], paramCallbackContext);
            long l2 = this.mydb.getTotalChanges() - l1;
            localJSONObject1.put("rowsAffected", l2);
            if (l2 > 0L)
            {
              long l3 = this.mydb.getLastInsertId();
              if (l3 > 0L) {
                localJSONObject1.put("insertId", l3);
              }
            }
            label137:
            if (localJSONObject1 == null) {}
          }
          catch (Exception localException)
          {
            try
            {
              JSONObject localJSONObject4 = new JSONObject();
              localJSONObject4.put("qid", str1);
              localJSONObject4.put("type", "success");
              localJSONObject4.put("result", localJSONObject1);
              localJSONArray.put(localJSONObject4);
              for (;;)
              {
                j++;
                break;
                localException = localException;
                localException.printStackTrace();
                str2 = localException.getMessage();
                Log.v("executeSqlBatch", "SQLitePlugin.executeSql[Batch](): Error=" + str2);
                break label137;
                JSONObject localJSONObject2 = new JSONObject();
                localJSONObject2.put("qid", str1);
                localJSONObject2.put("type", "error");
                JSONObject localJSONObject3 = new JSONObject();
                localJSONObject3.put("message", str2);
                localJSONObject2.put("result", localJSONObject3);
                localJSONArray.put(localJSONObject2);
              }
            }
            catch (JSONException localJSONException)
            {
              for (;;)
              {
                localJSONException.printStackTrace();
                Log.v("executeSqlBatch", "SQLitePlugin.executeSql[Batch](): Error=" + localJSONException.getMessage());
              }
            }
          }
        }
      }
      paramCallbackContext.success(localJSONArray);
    }
    
    void open(File paramFile)
      throws Exception
    {
      this.mydb = new SQLiteConnection(paramFile);
      this.mydb.open(true);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/io/liteglue/SQLitePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */