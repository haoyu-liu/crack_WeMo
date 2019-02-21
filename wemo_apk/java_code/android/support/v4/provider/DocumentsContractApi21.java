package android.support.v4.provider;

import android.content.Context;
import android.net.Uri;
import android.provider.DocumentsContract;

class DocumentsContractApi21
{
  private static final String TAG = "DocumentFile";
  
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
  
  public static Uri createDirectory(Context paramContext, Uri paramUri, String paramString)
  {
    return createFile(paramContext, paramUri, "vnd.android.document/directory", paramString);
  }
  
  public static Uri createFile(Context paramContext, Uri paramUri, String paramString1, String paramString2)
  {
    return DocumentsContract.createDocument(paramContext.getContentResolver(), paramUri, paramString1, paramString2);
  }
  
  /* Error */
  public static Uri[] listFiles(Context paramContext, Uri paramUri)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 37	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   4: astore_2
    //   5: aload_1
    //   6: aload_1
    //   7: invokestatic 49	android/provider/DocumentsContract:getDocumentId	(Landroid/net/Uri;)Ljava/lang/String;
    //   10: invokestatic 53	android/provider/DocumentsContract:buildChildDocumentsUriUsingTree	(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    //   13: astore_3
    //   14: new 55	java/util/ArrayList
    //   17: dup
    //   18: invokespecial 56	java/util/ArrayList:<init>	()V
    //   21: astore 4
    //   23: aconst_null
    //   24: astore 5
    //   26: aload_2
    //   27: aload_3
    //   28: iconst_1
    //   29: anewarray 58	java/lang/String
    //   32: dup
    //   33: iconst_0
    //   34: ldc 60
    //   36: aastore
    //   37: aconst_null
    //   38: aconst_null
    //   39: aconst_null
    //   40: invokevirtual 66	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   43: astore 5
    //   45: aload 5
    //   47: invokeinterface 72 1 0
    //   52: ifeq +74 -> 126
    //   55: aload 4
    //   57: aload_1
    //   58: aload 5
    //   60: iconst_0
    //   61: invokeinterface 76 2 0
    //   66: invokestatic 79	android/provider/DocumentsContract:buildDocumentUriUsingTree	(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    //   69: invokevirtual 83	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   72: pop
    //   73: goto -28 -> 45
    //   76: astore 7
    //   78: ldc 8
    //   80: new 85	java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 86	java/lang/StringBuilder:<init>	()V
    //   87: ldc 88
    //   89: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: aload 7
    //   94: invokevirtual 95	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   97: invokevirtual 99	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   100: invokestatic 105	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   103: pop
    //   104: aload 5
    //   106: invokestatic 107	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   109: aload 4
    //   111: aload 4
    //   113: invokevirtual 111	java/util/ArrayList:size	()I
    //   116: anewarray 113	android/net/Uri
    //   119: invokevirtual 117	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   122: checkcast 119	[Landroid/net/Uri;
    //   125: areturn
    //   126: aload 5
    //   128: invokestatic 107	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   131: goto -22 -> 109
    //   134: astore 6
    //   136: aload 5
    //   138: invokestatic 107	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   141: aload 6
    //   143: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	144	0	paramContext	Context
    //   0	144	1	paramUri	Uri
    //   4	23	2	localContentResolver	android.content.ContentResolver
    //   13	15	3	localUri	Uri
    //   21	91	4	localArrayList	java.util.ArrayList
    //   24	113	5	localCursor	android.database.Cursor
    //   134	8	6	localObject	Object
    //   76	17	7	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   26	45	76	java/lang/Exception
    //   45	73	76	java/lang/Exception
    //   26	45	134	finally
    //   45	73	134	finally
    //   78	104	134	finally
  }
  
  public static Uri prepareTreeUri(Uri paramUri)
  {
    return DocumentsContract.buildDocumentUriUsingTree(paramUri, DocumentsContract.getTreeDocumentId(paramUri));
  }
  
  public static Uri renameTo(Context paramContext, Uri paramUri, String paramString)
  {
    return DocumentsContract.renameDocument(paramContext.getContentResolver(), paramUri, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/provider/DocumentsContractApi21.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */