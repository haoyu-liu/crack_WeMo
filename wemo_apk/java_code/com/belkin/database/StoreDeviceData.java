package com.belkin.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import java.io.ByteArrayOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.json.JSONObject;

public class StoreDeviceData
  extends AsyncTask<JSONObject, Integer, Boolean>
{
  private static final String TAG = "StoreDeviceData";
  private Context mContext;
  
  public StoreDeviceData(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  /* Error */
  public static Bitmap DownloadImage(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: ldc 28
    //   4: aload_0
    //   5: invokestatic 34	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8: new 36	java/net/URL
    //   11: dup
    //   12: aload_0
    //   13: invokespecial 39	java/net/URL:<init>	(Ljava/lang/String;)V
    //   16: invokevirtual 43	java/net/URL:openStream	()Ljava/io/InputStream;
    //   19: astore 11
    //   21: aload 11
    //   23: astore_1
    //   24: new 45	com/belkin/database/StoreDeviceData$PatchInputStream
    //   27: dup
    //   28: aload_1
    //   29: invokespecial 48	com/belkin/database/StoreDeviceData$PatchInputStream:<init>	(Ljava/io/InputStream;)V
    //   32: invokestatic 54	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    //   35: astore 8
    //   37: aload 8
    //   39: astore 5
    //   41: aload_1
    //   42: ifnull +7 -> 49
    //   45: aload_1
    //   46: invokevirtual 59	java/io/InputStream:close	()V
    //   49: invokestatic 64	java/lang/System:gc	()V
    //   52: aload 5
    //   54: areturn
    //   55: astore 10
    //   57: aload 10
    //   59: invokevirtual 67	java/net/MalformedURLException:printStackTrace	()V
    //   62: aconst_null
    //   63: astore_1
    //   64: goto -40 -> 24
    //   67: astore 4
    //   69: ldc 9
    //   71: ldc 69
    //   73: aload 4
    //   75: invokestatic 73	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   78: aconst_null
    //   79: astore 5
    //   81: aload_1
    //   82: ifnull -33 -> 49
    //   85: aload_1
    //   86: invokevirtual 59	java/io/InputStream:close	()V
    //   89: aconst_null
    //   90: astore 5
    //   92: goto -43 -> 49
    //   95: astore 6
    //   97: aload 6
    //   99: invokevirtual 74	java/lang/Exception:printStackTrace	()V
    //   102: aconst_null
    //   103: astore 5
    //   105: goto -56 -> 49
    //   108: astore 7
    //   110: aload 7
    //   112: invokevirtual 75	java/io/IOException:printStackTrace	()V
    //   115: aconst_null
    //   116: astore_1
    //   117: goto -93 -> 24
    //   120: astore_2
    //   121: aload_1
    //   122: ifnull +7 -> 129
    //   125: aload_1
    //   126: invokevirtual 59	java/io/InputStream:close	()V
    //   129: aload_2
    //   130: athrow
    //   131: astore 9
    //   133: aload 9
    //   135: invokevirtual 74	java/lang/Exception:printStackTrace	()V
    //   138: goto -89 -> 49
    //   141: astore_3
    //   142: aload_3
    //   143: invokevirtual 74	java/lang/Exception:printStackTrace	()V
    //   146: goto -17 -> 129
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	149	0	paramString	String
    //   1	125	1	localObject1	Object
    //   120	10	2	localObject2	Object
    //   141	2	3	localException1	Exception
    //   67	7	4	localException2	Exception
    //   39	65	5	localBitmap1	Bitmap
    //   95	3	6	localException3	Exception
    //   108	3	7	localIOException	IOException
    //   35	3	8	localBitmap2	Bitmap
    //   131	3	9	localException4	Exception
    //   55	3	10	localMalformedURLException	java.net.MalformedURLException
    //   19	3	11	localInputStream	InputStream
    // Exception table:
    //   from	to	target	type
    //   8	21	55	java/net/MalformedURLException
    //   2	8	67	java/lang/Exception
    //   8	21	67	java/lang/Exception
    //   24	37	67	java/lang/Exception
    //   57	62	67	java/lang/Exception
    //   110	115	67	java/lang/Exception
    //   85	89	95	java/lang/Exception
    //   8	21	108	java/io/IOException
    //   2	8	120	finally
    //   8	21	120	finally
    //   24	37	120	finally
    //   57	62	120	finally
    //   69	78	120	finally
    //   110	115	120	finally
    //   45	49	131	java/lang/Exception
    //   125	129	141	java/lang/Exception
  }
  
  protected Boolean doInBackground(JSONObject... paramVarArgs)
  {
    for (;;)
    {
      try
      {
        JSONObject localJSONObject = paramVarArgs[0];
        Bitmap localBitmap = DownloadImage(localJSONObject.getString("iconUrl"));
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        localBitmap.compress(Bitmap.CompressFormat.PNG, 100, localByteArrayOutputStream);
        byte[] arrayOfByte = localByteArrayOutputStream.toByteArray();
        localDeviceDatabase = DeviceDatabase.getDeviceDatabase(this.mContext);
        localContentValues = new ContentValues();
        localContentValues.put("friendlyname", localJSONObject.getString("friendlyName"));
        localContentValues.put("deviceudn", localJSONObject.getString("udn"));
        localContentValues.put("image_raw", arrayOfByte);
        localContentValues.put("status", "1");
        localContentValues.put("device_type", localJSONObject.getString("type"));
        if ((localDeviceDatabase.checkData(localJSONObject.getString("udn")).getCount() != 0) && (localDeviceDatabase.checkData(localJSONObject.getString("udn")) != null)) {
          continue;
        }
        localDeviceDatabase.insertSwitches(localContentValues);
        localDeviceDatabase.closeDatabse();
      }
      catch (Exception localException)
      {
        DeviceDatabase localDeviceDatabase;
        ContentValues localContentValues;
        localException.printStackTrace();
        continue;
      }
      return Boolean.valueOf(true);
      localDeviceDatabase.updateSwitches(localContentValues);
    }
  }
  
  protected void onPostExecute(Boolean paramBoolean)
  {
    super.onPostExecute(paramBoolean);
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
  }
  
  static class PatchInputStream
    extends FilterInputStream
  {
    public PatchInputStream(InputStream paramInputStream)
    {
      super();
    }
    
    public long skip(long paramLong)
      throws IOException
    {
      long l2;
      for (long l1 = 0L;; l1 += l2)
      {
        if (l1 < paramLong)
        {
          l2 = this.in.skip(paramLong - l1);
          if (l2 != 0L) {
            continue;
          }
          if (read() >= 0) {}
        }
        else
        {
          return l1;
        }
        l2 = 1L;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/database/StoreDeviceData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */