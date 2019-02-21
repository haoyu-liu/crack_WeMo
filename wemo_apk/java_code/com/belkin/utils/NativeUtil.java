package com.belkin.utils;

import android.content.Context;
import android.util.Base64;
import android.util.Log;
import com.belkin.database.BridgeLocalDatabase;
import com.belkin.database.DeviceDatabase;
import com.belkin.exception.DatabaseException;
import org.json.JSONArray;

public class NativeUtil
{
  private static final String TAG = "NativeUtil";
  private Context mContext;
  
  public NativeUtil(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public String getBase64Image(String paramString)
  {
    try
    {
      DeviceDatabase localDeviceDatabase = DeviceDatabase.getDeviceDatabase(this.mContext);
      String str = Base64.encodeToString(localDeviceDatabase.getIconByUdn(paramString), 0);
      localDeviceDatabase.closeDatabse();
      Log.i("NativeUtil", "Image found");
      return str;
    }
    catch (DatabaseException localDatabaseException)
    {
      localDatabaseException = localDatabaseException;
      Log.i("NativeUtil", "Image not found");
      localDatabaseException.printStackTrace();
      return "";
    }
    finally {}
  }
  
  public JSONArray getLedBase64Image(String paramString)
  {
    JSONArray localJSONArray = new JSONArray();
    try
    {
      BridgeLocalDatabase localBridgeLocalDatabase = BridgeLocalDatabase.getLedDeviceDatabase(this.mContext);
      localJSONArray = localBridgeLocalDatabase.getIconByLedDeviceId(paramString);
      localBridgeLocalDatabase.closeDatabse();
      Log.i("NativeUtil", "Led Image found");
      return localJSONArray;
    }
    catch (DatabaseException localDatabaseException)
    {
      localDatabaseException = localDatabaseException;
      Log.i("NativeUtil", "Led Image not found");
      localDatabaseException.printStackTrace();
      return localJSONArray;
    }
    finally {}
  }
  
  /* Error */
  public String resetLedDeviceImage(String paramString)
  {
    // Byte code:
    //   0: ldc 55
    //   2: astore_2
    //   3: aload_0
    //   4: getfield 17	com/belkin/utils/NativeUtil:mContext	Landroid/content/Context;
    //   7: invokestatic 66	com/belkin/database/BridgeLocalDatabase:getLedDeviceDatabase	(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;
    //   10: astore 6
    //   12: aload 6
    //   14: aload_1
    //   15: invokevirtual 79	com/belkin/database/BridgeLocalDatabase:checkData	(Ljava/lang/String;)Landroid/database/Cursor;
    //   18: invokeinterface 85 1 0
    //   23: ifne +29 -> 52
    //   26: ldc2_w 86
    //   29: lstore 7
    //   31: lload 7
    //   33: invokestatic 93	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   36: astore_2
    //   37: aload 6
    //   39: invokevirtual 70	com/belkin/database/BridgeLocalDatabase:closeDatabse	()V
    //   42: ldc 8
    //   44: ldc 95
    //   46: invokestatic 48	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   49: pop
    //   50: aload_2
    //   51: areturn
    //   52: aload 6
    //   54: aload_1
    //   55: invokevirtual 99	com/belkin/database/BridgeLocalDatabase:deleteRecordById	(Ljava/lang/String;)I
    //   58: istore 10
    //   60: iload 10
    //   62: i2l
    //   63: lstore 7
    //   65: goto -34 -> 31
    //   68: astore 4
    //   70: ldc 8
    //   72: ldc 74
    //   74: invokestatic 48	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   77: pop
    //   78: aload 4
    //   80: invokevirtual 53	com/belkin/exception/DatabaseException:printStackTrace	()V
    //   83: aload_2
    //   84: areturn
    //   85: astore_3
    //   86: aload_3
    //   87: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	88	0	this	NativeUtil
    //   0	88	1	paramString	String
    //   2	82	2	str	String
    //   85	2	3	localObject	Object
    //   68	11	4	localDatabaseException	DatabaseException
    //   10	43	6	localBridgeLocalDatabase	BridgeLocalDatabase
    //   29	35	7	l	long
    //   58	3	10	i	int
    // Exception table:
    //   from	to	target	type
    //   3	26	68	com/belkin/exception/DatabaseException
    //   31	50	68	com/belkin/exception/DatabaseException
    //   52	60	68	com/belkin/exception/DatabaseException
    //   3	26	85	finally
    //   31	50	85	finally
    //   52	60	85	finally
    //   70	83	85	finally
  }
  
  public void setImage(String paramString, byte[] paramArrayOfByte)
  {
    try
    {
      DeviceDatabase localDeviceDatabase = DeviceDatabase.getDeviceDatabase(this.mContext);
      localDeviceDatabase.setIconByUdn(paramArrayOfByte, paramString);
      localDeviceDatabase.closeDatabse();
      return;
    }
    catch (DatabaseException localDatabaseException)
    {
      Log.i("NativeUtil", "Error during image save to DB");
      localDatabaseException.printStackTrace();
    }
  }
  
  /* Error */
  public String setLedDeviceImage(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: ldc 55
    //   2: astore 4
    //   4: aload_0
    //   5: getfield 17	com/belkin/utils/NativeUtil:mContext	Landroid/content/Context;
    //   8: invokestatic 66	com/belkin/database/BridgeLocalDatabase:getLedDeviceDatabase	(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;
    //   11: astore 8
    //   13: aload 8
    //   15: aload_1
    //   16: invokevirtual 79	com/belkin/database/BridgeLocalDatabase:checkData	(Ljava/lang/String;)Landroid/database/Cursor;
    //   19: invokeinterface 85 1 0
    //   24: ifne +36 -> 60
    //   27: aload 8
    //   29: aload_1
    //   30: aload_2
    //   31: aload_3
    //   32: invokevirtual 113	com/belkin/database/BridgeLocalDatabase:insertLedDeviceIcon	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    //   35: lstore 10
    //   37: lload 10
    //   39: invokestatic 93	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   42: astore 4
    //   44: aload 8
    //   46: invokevirtual 70	com/belkin/database/BridgeLocalDatabase:closeDatabse	()V
    //   49: ldc 8
    //   51: ldc 72
    //   53: invokestatic 48	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   56: pop
    //   57: aload 4
    //   59: areturn
    //   60: aload 8
    //   62: aload_2
    //   63: aload_1
    //   64: aload_3
    //   65: invokevirtual 117	com/belkin/database/BridgeLocalDatabase:updateLedIconByDeviceId	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    //   68: istore 9
    //   70: iload 9
    //   72: i2l
    //   73: lstore 10
    //   75: goto -38 -> 37
    //   78: astore 6
    //   80: ldc 8
    //   82: ldc 74
    //   84: invokestatic 48	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   87: pop
    //   88: aload 6
    //   90: invokevirtual 53	com/belkin/exception/DatabaseException:printStackTrace	()V
    //   93: aload 4
    //   95: areturn
    //   96: astore 5
    //   98: aload 5
    //   100: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	101	0	this	NativeUtil
    //   0	101	1	paramString1	String
    //   0	101	2	paramString2	String
    //   0	101	3	paramString3	String
    //   2	92	4	str	String
    //   96	3	5	localObject	Object
    //   78	11	6	localDatabaseException	DatabaseException
    //   11	50	8	localBridgeLocalDatabase	BridgeLocalDatabase
    //   68	3	9	i	int
    //   35	39	10	l	long
    // Exception table:
    //   from	to	target	type
    //   4	37	78	com/belkin/exception/DatabaseException
    //   37	57	78	com/belkin/exception/DatabaseException
    //   60	70	78	com/belkin/exception/DatabaseException
    //   4	37	96	finally
    //   37	57	96	finally
    //   60	70	96	finally
    //   80	93	96	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/NativeUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */