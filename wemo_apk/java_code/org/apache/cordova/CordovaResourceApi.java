package org.apache.cordova;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Looper;
import android.util.Base64;
import android.webkit.MimeTypeMap;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.util.Locale;

public class CordovaResourceApi
{
  private static final String[] LOCAL_FILE_PROJECTION = { "_data" };
  private static final String LOG_TAG = "CordovaResourceApi";
  public static final String PLUGIN_URI_SCHEME = "cdvplugin";
  public static final int URI_TYPE_ASSET = 1;
  public static final int URI_TYPE_CONTENT = 2;
  public static final int URI_TYPE_DATA = 4;
  public static final int URI_TYPE_FILE = 0;
  public static final int URI_TYPE_HTTP = 5;
  public static final int URI_TYPE_HTTPS = 6;
  public static final int URI_TYPE_PLUGIN = 7;
  public static final int URI_TYPE_RESOURCE = 3;
  public static final int URI_TYPE_UNKNOWN = -1;
  public static Thread jsThread;
  private final AssetManager assetManager;
  private final ContentResolver contentResolver;
  private final PluginManager pluginManager;
  private boolean threadCheckingEnabled = true;
  
  public CordovaResourceApi(Context paramContext, PluginManager paramPluginManager)
  {
    this.contentResolver = paramContext.getContentResolver();
    this.assetManager = paramContext.getAssets();
    this.pluginManager = paramPluginManager;
  }
  
  private void assertBackgroundThread()
  {
    if (this.threadCheckingEnabled)
    {
      Thread localThread = Thread.currentThread();
      if (localThread == Looper.getMainLooper().getThread()) {
        throw new IllegalStateException("Do not perform IO operations on the UI thread. Use CordovaInterface.getThreadPool() instead.");
      }
      if (localThread == jsThread) {
        throw new IllegalStateException("Tried to perform an IO operation on the WebCore thread. Use CordovaInterface.getThreadPool() instead.");
      }
    }
  }
  
  private static void assertNonRelative(Uri paramUri)
  {
    if (!paramUri.isAbsolute()) {
      throw new IllegalArgumentException("Relative URIs are not supported.");
    }
  }
  
  private String getDataUriMimeType(Uri paramUri)
  {
    String str = paramUri.getSchemeSpecificPart();
    int i = str.indexOf(',');
    if (i == -1) {}
    String[] arrayOfString;
    do
    {
      return null;
      arrayOfString = str.substring(0, i).split(";");
    } while (arrayOfString.length <= 0);
    return arrayOfString[0];
  }
  
  private String getMimeTypeFromPath(String paramString)
  {
    String str1 = paramString;
    int i = str1.lastIndexOf('.');
    if (i != -1) {
      str1 = str1.substring(i + 1);
    }
    String str2 = str1.toLowerCase(Locale.getDefault());
    if (str2.equals("3ga")) {
      return "audio/3gpp";
    }
    if (str2.equals("js")) {
      return "text/javascript";
    }
    return MimeTypeMap.getSingleton().getMimeTypeFromExtension(str2);
  }
  
  public static int getUriType(Uri paramUri)
  {
    assertNonRelative(paramUri);
    String str = paramUri.getScheme();
    if ("content".equalsIgnoreCase(str)) {
      return 2;
    }
    if ("android.resource".equalsIgnoreCase(str)) {
      return 3;
    }
    if ("file".equalsIgnoreCase(str))
    {
      if (paramUri.getPath().startsWith("/android_asset/")) {
        return 1;
      }
      return 0;
    }
    if ("data".equalsIgnoreCase(str)) {
      return 4;
    }
    if ("http".equalsIgnoreCase(str)) {
      return 5;
    }
    if ("https".equalsIgnoreCase(str)) {
      return 6;
    }
    if ("cdvplugin".equalsIgnoreCase(str)) {
      return 7;
    }
    return -1;
  }
  
  private OpenForReadResult readDataUri(Uri paramUri)
  {
    String str1 = paramUri.getSchemeSpecificPart();
    int i = str1.indexOf(',');
    if (i == -1) {
      return null;
    }
    String[] arrayOfString = str1.substring(0, i).split(";");
    int j = 0;
    int k = arrayOfString.length;
    String str2 = null;
    if (k > 0) {
      str2 = arrayOfString[0];
    }
    for (int m = 1; m < arrayOfString.length; m++) {
      if ("base64".equalsIgnoreCase(arrayOfString[m])) {
        j = 1;
      }
    }
    String str3 = str1.substring(i + 1);
    Object localObject;
    if (j != 0) {
      localObject = Base64.decode(str3, 0);
    }
    for (;;)
    {
      return new OpenForReadResult(paramUri, new ByteArrayInputStream((byte[])localObject), str2, localObject.length, null);
      try
      {
        byte[] arrayOfByte = str3.getBytes("UTF-8");
        localObject = arrayOfByte;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        localObject = str3.getBytes();
      }
    }
  }
  
  public void copyResource(Uri paramUri1, Uri paramUri2)
    throws IOException
  {
    copyResource(openForRead(paramUri1), openOutputStream(paramUri2));
  }
  
  public void copyResource(Uri paramUri, OutputStream paramOutputStream)
    throws IOException
  {
    copyResource(openForRead(paramUri), paramOutputStream);
  }
  
  /* Error */
  public void copyResource(OpenForReadResult paramOpenForReadResult, OutputStream paramOutputStream)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 250	org/apache/cordova/CordovaResourceApi:assertBackgroundThread	()V
    //   4: aload_1
    //   5: getfield 254	org/apache/cordova/CordovaResourceApi$OpenForReadResult:inputStream	Ljava/io/InputStream;
    //   8: astore 4
    //   10: aload 4
    //   12: instanceof 256
    //   15: ifeq +91 -> 106
    //   18: aload_2
    //   19: instanceof 258
    //   22: ifeq +84 -> 106
    //   25: aload_1
    //   26: getfield 254	org/apache/cordova/CordovaResourceApi$OpenForReadResult:inputStream	Ljava/io/InputStream;
    //   29: checkcast 256	java/io/FileInputStream
    //   32: invokevirtual 262	java/io/FileInputStream:getChannel	()Ljava/nio/channels/FileChannel;
    //   35: astore 7
    //   37: aload_2
    //   38: checkcast 258	java/io/FileOutputStream
    //   41: invokevirtual 263	java/io/FileOutputStream:getChannel	()Ljava/nio/channels/FileChannel;
    //   44: astore 8
    //   46: lconst_0
    //   47: lstore 9
    //   49: aload_1
    //   50: getfield 267	org/apache/cordova/CordovaResourceApi$OpenForReadResult:length	J
    //   53: lstore 11
    //   55: aload_1
    //   56: getfield 271	org/apache/cordova/CordovaResourceApi$OpenForReadResult:assetFd	Landroid/content/res/AssetFileDescriptor;
    //   59: ifnull +12 -> 71
    //   62: aload_1
    //   63: getfield 271	org/apache/cordova/CordovaResourceApi$OpenForReadResult:assetFd	Landroid/content/res/AssetFileDescriptor;
    //   66: invokevirtual 277	android/content/res/AssetFileDescriptor:getStartOffset	()J
    //   69: lstore 9
    //   71: aload 7
    //   73: lload 9
    //   75: invokevirtual 283	java/nio/channels/FileChannel:position	(J)Ljava/nio/channels/FileChannel;
    //   78: pop
    //   79: aload 8
    //   81: aload 7
    //   83: lconst_0
    //   84: lload 11
    //   86: invokevirtual 287	java/nio/channels/FileChannel:transferFrom	(Ljava/nio/channels/ReadableByteChannel;JJ)J
    //   89: pop2
    //   90: aload_1
    //   91: getfield 254	org/apache/cordova/CordovaResourceApi$OpenForReadResult:inputStream	Ljava/io/InputStream;
    //   94: invokevirtual 292	java/io/InputStream:close	()V
    //   97: aload_2
    //   98: ifnull +7 -> 105
    //   101: aload_2
    //   102: invokevirtual 295	java/io/OutputStream:close	()V
    //   105: return
    //   106: sipush 8192
    //   109: newarray <illegal type>
    //   111: astore 5
    //   113: aload 4
    //   115: aload 5
    //   117: iconst_0
    //   118: sipush 8192
    //   121: invokevirtual 299	java/io/InputStream:read	([BII)I
    //   124: istore 6
    //   126: iload 6
    //   128: ifle -38 -> 90
    //   131: aload_2
    //   132: aload 5
    //   134: iconst_0
    //   135: iload 6
    //   137: invokevirtual 303	java/io/OutputStream:write	([BII)V
    //   140: goto -27 -> 113
    //   143: astore_3
    //   144: aload_1
    //   145: getfield 254	org/apache/cordova/CordovaResourceApi$OpenForReadResult:inputStream	Ljava/io/InputStream;
    //   148: invokevirtual 292	java/io/InputStream:close	()V
    //   151: aload_2
    //   152: ifnull +7 -> 159
    //   155: aload_2
    //   156: invokevirtual 295	java/io/OutputStream:close	()V
    //   159: aload_3
    //   160: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	161	0	this	CordovaResourceApi
    //   0	161	1	paramOpenForReadResult	OpenForReadResult
    //   0	161	2	paramOutputStream	OutputStream
    //   143	17	3	localObject	Object
    //   8	106	4	localInputStream	InputStream
    //   111	22	5	arrayOfByte	byte[]
    //   124	12	6	i	int
    //   35	47	7	localFileChannel1	FileChannel
    //   44	36	8	localFileChannel2	FileChannel
    //   47	27	9	l1	long
    //   53	32	11	l2	long
    // Exception table:
    //   from	to	target	type
    //   4	46	143	finally
    //   49	71	143	finally
    //   71	90	143	finally
    //   106	113	143	finally
    //   113	126	143	finally
    //   131	140	143	finally
  }
  
  public HttpURLConnection createHttpConnection(Uri paramUri)
    throws IOException
  {
    assertBackgroundThread();
    return (HttpURLConnection)new URL(paramUri.toString()).openConnection();
  }
  
  public String getMimeType(Uri paramUri)
  {
    switch (getUriType(paramUri))
    {
    }
    for (;;)
    {
      String str1 = null;
      for (;;)
      {
        return str1;
        return getMimeTypeFromPath(paramUri.getPath());
        return this.contentResolver.getType(paramUri);
        return getDataUriMimeType(paramUri);
        try
        {
          HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramUri.toString()).openConnection();
          localHttpURLConnection.setDoInput(false);
          localHttpURLConnection.setRequestMethod("HEAD");
          str1 = localHttpURLConnection.getHeaderField("Content-Type");
          if (str1 != null)
          {
            String str2 = str1.split(";")[0];
            return str2;
          }
        }
        catch (IOException localIOException) {}
      }
    }
  }
  
  public boolean isThreadCheckingEnabled()
  {
    return this.threadCheckingEnabled;
  }
  
  public File mapUriToFile(Uri paramUri)
  {
    assertBackgroundThread();
    switch (getUriType(paramUri))
    {
    }
    Cursor localCursor;
    do
    {
      return null;
      return new File(paramUri.getPath());
      localCursor = this.contentResolver.query(paramUri, LOCAL_FILE_PROJECTION, null, null, null);
    } while (localCursor == null);
    try
    {
      int i = localCursor.getColumnIndex(LOCAL_FILE_PROJECTION[0]);
      if ((i != -1) && (localCursor.getCount() > 0))
      {
        localCursor.moveToFirst();
        String str = localCursor.getString(i);
        if (str != null)
        {
          File localFile = new File(str);
          return localFile;
        }
      }
      return null;
    }
    finally
    {
      localCursor.close();
    }
  }
  
  public OpenForReadResult openForRead(Uri paramUri)
    throws IOException
  {
    return openForRead(paramUri, false);
  }
  
  public OpenForReadResult openForRead(Uri paramUri, boolean paramBoolean)
    throws IOException
  {
    if (!paramBoolean) {
      assertBackgroundThread();
    }
    switch (getUriType(paramUri))
    {
    default: 
    case 0: 
    case 1: 
    case 2: 
    case 3: 
    case 4: 
      OpenForReadResult localOpenForReadResult;
      do
      {
        throw new FileNotFoundException("URI not supported by CordovaResourceApi: " + paramUri);
        FileInputStream localFileInputStream = new FileInputStream(paramUri.getPath());
        return new OpenForReadResult(paramUri, localFileInputStream, getMimeTypeFromPath(paramUri.getPath()), localFileInputStream.getChannel().size(), null);
        String str4 = paramUri.getPath().substring(15);
        AssetFileDescriptor localAssetFileDescriptor2 = null;
        long l2 = -1L;
        try
        {
          localAssetFileDescriptor2 = this.assetManager.openFd(str4);
          localObject = localAssetFileDescriptor2.createInputStream();
          long l3 = localAssetFileDescriptor2.getLength();
          l2 = l3;
        }
        catch (FileNotFoundException localFileNotFoundException)
        {
          for (;;)
          {
            Object localObject = this.assetManager.open(str4);
          }
        }
        return new OpenForReadResult(paramUri, (InputStream)localObject, getMimeTypeFromPath(str4), l2, localAssetFileDescriptor2);
        String str3 = this.contentResolver.getType(paramUri);
        AssetFileDescriptor localAssetFileDescriptor1 = this.contentResolver.openAssetFileDescriptor(paramUri, "r");
        return new OpenForReadResult(paramUri, localAssetFileDescriptor1.createInputStream(), str3, localAssetFileDescriptor1.getLength(), localAssetFileDescriptor1);
        localOpenForReadResult = readDataUri(paramUri);
      } while (localOpenForReadResult == null);
      return localOpenForReadResult;
    case 5: 
    case 6: 
      HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramUri.toString()).openConnection();
      localHttpURLConnection.setDoInput(true);
      String str2 = localHttpURLConnection.getHeaderField("Content-Type");
      if (str2 != null) {
        str2 = str2.split(";")[0];
      }
      int i = localHttpURLConnection.getContentLength();
      InputStream localInputStream = localHttpURLConnection.getInputStream();
      long l1 = i;
      return new OpenForReadResult(paramUri, localInputStream, str2, l1, null);
    }
    String str1 = paramUri.getHost();
    CordovaPlugin localCordovaPlugin = this.pluginManager.getPlugin(str1);
    if (localCordovaPlugin == null) {
      throw new FileNotFoundException("Invalid plugin ID in URI: " + paramUri);
    }
    return localCordovaPlugin.handleOpenForRead(paramUri);
  }
  
  public OutputStream openOutputStream(Uri paramUri)
    throws IOException
  {
    return openOutputStream(paramUri, false);
  }
  
  public OutputStream openOutputStream(Uri paramUri, boolean paramBoolean)
    throws IOException
  {
    assertBackgroundThread();
    switch (getUriType(paramUri))
    {
    case 1: 
    default: 
      throw new FileNotFoundException("URI not supported by CordovaResourceApi: " + paramUri);
    case 0: 
      File localFile1 = new File(paramUri.getPath());
      File localFile2 = localFile1.getParentFile();
      if (localFile2 != null) {
        localFile2.mkdirs();
      }
      return new FileOutputStream(localFile1, paramBoolean);
    }
    ContentResolver localContentResolver = this.contentResolver;
    if (paramBoolean) {}
    for (String str = "wa";; str = "w") {
      return localContentResolver.openAssetFileDescriptor(paramUri, str).createOutputStream();
    }
  }
  
  public String remapPath(String paramString)
  {
    return remapUri(Uri.fromFile(new File(paramString))).getPath();
  }
  
  public Uri remapUri(Uri paramUri)
  {
    assertNonRelative(paramUri);
    Uri localUri = this.pluginManager.remapUri(paramUri);
    if (localUri != null) {
      return localUri;
    }
    return paramUri;
  }
  
  public void setThreadCheckingEnabled(boolean paramBoolean)
  {
    this.threadCheckingEnabled = paramBoolean;
  }
  
  public static final class OpenForReadResult
  {
    public final AssetFileDescriptor assetFd;
    public final InputStream inputStream;
    public final long length;
    public final String mimeType;
    public final Uri uri;
    
    public OpenForReadResult(Uri paramUri, InputStream paramInputStream, String paramString, long paramLong, AssetFileDescriptor paramAssetFileDescriptor)
    {
      this.uri = paramUri;
      this.inputStream = paramInputStream;
      this.mimeType = paramString;
      this.length = paramLong;
      this.assetFd = paramAssetFileDescriptor;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/CordovaResourceApi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */