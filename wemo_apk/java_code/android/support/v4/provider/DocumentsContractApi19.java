package android.support.v4.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.text.TextUtils;
import android.util.Log;

class DocumentsContractApi19
{
  private static final String TAG = "DocumentFile";
  
  public static boolean canRead(Context paramContext, Uri paramUri)
  {
    if (paramContext.checkCallingOrSelfUriPermission(paramUri, 1) != 0) {}
    while (TextUtils.isEmpty(getRawType(paramContext, paramUri))) {
      return false;
    }
    return true;
  }
  
  public static boolean canWrite(Context paramContext, Uri paramUri)
  {
    if (paramContext.checkCallingOrSelfUriPermission(paramUri, 2) != 0) {}
    String str;
    int i;
    do
    {
      do
      {
        return false;
        str = getRawType(paramContext, paramUri);
        i = queryForInt(paramContext, paramUri, "flags", 0);
      } while (TextUtils.isEmpty(str));
      if ((i & 0x4) != 0) {
        return true;
      }
      if (("vnd.android.document/directory".equals(str)) && ((i & 0x8) != 0)) {
        return true;
      }
    } while ((TextUtils.isEmpty(str)) || ((i & 0x2) == 0));
    return true;
  }
  
  private static void closeQuietly(AutoCloseable paramAutoCloseable)
  {
    if (paramAutoCloseable != null) {}
    try
    {
      paramAutoCloseable.close();
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      throw localRuntimeException;
    }
    catch (Exception localException) {}
  }
  
  public static boolean delete(Context paramContext, Uri paramUri)
  {
    return DocumentsContract.deleteDocument(paramContext.getContentResolver(), paramUri);
  }
  
  /* Error */
  public static boolean exists(Context paramContext, Uri paramUri)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 61	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   4: astore_2
    //   5: aconst_null
    //   6: astore_3
    //   7: aload_2
    //   8: aload_1
    //   9: iconst_1
    //   10: anewarray 41	java/lang/String
    //   13: dup
    //   14: iconst_0
    //   15: ldc 70
    //   17: aastore
    //   18: aconst_null
    //   19: aconst_null
    //   20: aconst_null
    //   21: invokevirtual 76	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   24: astore_3
    //   25: aload_3
    //   26: invokeinterface 82 1 0
    //   31: istore 7
    //   33: iload 7
    //   35: ifle +13 -> 48
    //   38: iconst_1
    //   39: istore 8
    //   41: aload_3
    //   42: invokestatic 84	android/support/v4/provider/DocumentsContractApi19:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   45: iload 8
    //   47: ireturn
    //   48: iconst_0
    //   49: istore 8
    //   51: goto -10 -> 41
    //   54: astore 5
    //   56: ldc 8
    //   58: new 86	java/lang/StringBuilder
    //   61: dup
    //   62: invokespecial 87	java/lang/StringBuilder:<init>	()V
    //   65: ldc 89
    //   67: invokevirtual 93	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: aload 5
    //   72: invokevirtual 96	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   75: invokevirtual 100	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   78: invokestatic 106	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   81: pop
    //   82: aload_3
    //   83: invokestatic 84	android/support/v4/provider/DocumentsContractApi19:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   86: iconst_0
    //   87: ireturn
    //   88: astore 4
    //   90: aload_3
    //   91: invokestatic 84	android/support/v4/provider/DocumentsContractApi19:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   94: aload 4
    //   96: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	97	0	paramContext	Context
    //   0	97	1	paramUri	Uri
    //   4	4	2	localContentResolver	ContentResolver
    //   6	85	3	localCursor	Cursor
    //   88	7	4	localObject	Object
    //   54	17	5	localException	Exception
    //   31	3	7	i	int
    //   39	11	8	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   7	33	54	java/lang/Exception
    //   7	33	88	finally
    //   56	82	88	finally
  }
  
  public static String getName(Context paramContext, Uri paramUri)
  {
    return queryForString(paramContext, paramUri, "_display_name", null);
  }
  
  private static String getRawType(Context paramContext, Uri paramUri)
  {
    return queryForString(paramContext, paramUri, "mime_type", null);
  }
  
  public static String getType(Context paramContext, Uri paramUri)
  {
    String str = getRawType(paramContext, paramUri);
    if ("vnd.android.document/directory".equals(str)) {
      str = null;
    }
    return str;
  }
  
  public static boolean isDirectory(Context paramContext, Uri paramUri)
  {
    return "vnd.android.document/directory".equals(getRawType(paramContext, paramUri));
  }
  
  public static boolean isDocumentUri(Context paramContext, Uri paramUri)
  {
    return DocumentsContract.isDocumentUri(paramContext, paramUri);
  }
  
  public static boolean isFile(Context paramContext, Uri paramUri)
  {
    String str = getRawType(paramContext, paramUri);
    return (!"vnd.android.document/directory".equals(str)) && (!TextUtils.isEmpty(str));
  }
  
  public static long lastModified(Context paramContext, Uri paramUri)
  {
    return queryForLong(paramContext, paramUri, "last_modified", 0L);
  }
  
  public static long length(Context paramContext, Uri paramUri)
  {
    return queryForLong(paramContext, paramUri, "_size", 0L);
  }
  
  private static int queryForInt(Context paramContext, Uri paramUri, String paramString, int paramInt)
  {
    return (int)queryForLong(paramContext, paramUri, paramString, paramInt);
  }
  
  private static long queryForLong(Context paramContext, Uri paramUri, String paramString, long paramLong)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    Cursor localCursor = null;
    try
    {
      localCursor = localContentResolver.query(paramUri, new String[] { paramString }, null, null, null);
      if ((localCursor.moveToFirst()) && (!localCursor.isNull(0)))
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return paramLong;
    }
    catch (Exception localException)
    {
      Log.w("DocumentFile", "Failed query: " + localException);
      return paramLong;
    }
    finally
    {
      closeQuietly(localCursor);
    }
  }
  
  private static String queryForString(Context paramContext, Uri paramUri, String paramString1, String paramString2)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    Cursor localCursor = null;
    try
    {
      localCursor = localContentResolver.query(paramUri, new String[] { paramString1 }, null, null, null);
      if ((localCursor.moveToFirst()) && (!localCursor.isNull(0)))
      {
        String str = localCursor.getString(0);
        return str;
      }
      return paramString2;
    }
    catch (Exception localException)
    {
      Log.w("DocumentFile", "Failed query: " + localException);
      return paramString2;
    }
    finally
    {
      closeQuietly(localCursor);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/provider/DocumentsContractApi19.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */