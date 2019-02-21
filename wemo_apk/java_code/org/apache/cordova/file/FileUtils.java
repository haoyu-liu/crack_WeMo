package org.apache.cordova.file;

import android.app.Activity;
import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import android.util.Base64;
import android.util.Log;
import com.belkin.utils.RuleUtility;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.channels.FileChannel;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class FileUtils
  extends CordovaPlugin
{
  public static int ABORT_ERR = 0;
  public static int APPLICATION = 3;
  public static int ENCODING_ERR = 0;
  public static int INVALID_MODIFICATION_ERR = 0;
  public static int INVALID_STATE_ERR = 0;
  private static final String LOG_TAG = "FileUtils";
  public static int NOT_FOUND_ERR = 1;
  public static int NOT_READABLE_ERR;
  public static int NO_MODIFICATION_ALLOWED_ERR;
  public static int PATH_EXISTS_ERR;
  public static int PERSISTENT;
  public static int QUOTA_EXCEEDED_ERR;
  public static int RESOURCE;
  public static int SECURITY_ERR = 2;
  public static int SYNTAX_ERR;
  public static int TEMPORARY;
  public static int TYPE_MISMATCH_ERR;
  
  static
  {
    ABORT_ERR = 3;
    NOT_READABLE_ERR = 4;
    ENCODING_ERR = 5;
    NO_MODIFICATION_ALLOWED_ERR = 6;
    INVALID_STATE_ERR = 7;
    SYNTAX_ERR = 8;
    INVALID_MODIFICATION_ERR = 9;
    QUOTA_EXCEEDED_ERR = 10;
    TYPE_MISMATCH_ERR = 11;
    PATH_EXISTS_ERR = 12;
    TEMPORARY = 0;
    PERSISTENT = 1;
    RESOURCE = 2;
  }
  
  private boolean atRootDirectory(String paramString)
  {
    String str = FileHelper.getRealPath(paramString, this.cordova);
    return (str.equals(RuleUtility.getStoragePath().getAbsolutePath() + "/Android/data/" + this.cordova.getActivity().getPackageName() + "/cache")) || (str.equals(RuleUtility.getStoragePath().getAbsolutePath())) || (str.equals("/data/data/" + this.cordova.getActivity().getPackageName()));
  }
  
  private void copyAction(File paramFile1, File paramFile2)
    throws FileNotFoundException, IOException
  {
    FileInputStream localFileInputStream = new FileInputStream(paramFile1);
    FileOutputStream localFileOutputStream = new FileOutputStream(paramFile2);
    FileChannel localFileChannel1 = localFileInputStream.getChannel();
    FileChannel localFileChannel2 = localFileOutputStream.getChannel();
    try
    {
      localFileChannel1.transferTo(0L, localFileChannel1.size(), localFileChannel2);
      return;
    }
    finally
    {
      localFileInputStream.close();
      localFileOutputStream.close();
      localFileChannel1.close();
      localFileChannel2.close();
    }
  }
  
  private JSONObject copyDirectory(File paramFile1, File paramFile2)
    throws JSONException, IOException, NoModificationAllowedException, InvalidModificationException
  {
    if ((paramFile2.exists()) && (paramFile2.isFile())) {
      throw new InvalidModificationException("Can't rename a file to a directory");
    }
    if (isCopyOnItself(paramFile1.getAbsolutePath(), paramFile2.getAbsolutePath())) {
      throw new InvalidModificationException("Can't copy itself into itself");
    }
    if ((!paramFile2.exists()) && (!paramFile2.mkdir())) {
      throw new NoModificationAllowedException("Couldn't create the destination directory");
    }
    File[] arrayOfFile = paramFile1.listFiles();
    int i = arrayOfFile.length;
    int j = 0;
    if (j < i)
    {
      File localFile1 = arrayOfFile[j];
      File localFile2 = new File(paramFile2.getAbsoluteFile() + File.separator + localFile1.getName());
      if (localFile1.isDirectory()) {
        copyDirectory(localFile1, localFile2);
      }
      for (;;)
      {
        j++;
        break;
        copyFile(localFile1, localFile2);
      }
    }
    return getEntry(paramFile2);
  }
  
  private JSONObject copyFile(File paramFile1, File paramFile2)
    throws IOException, InvalidModificationException, JSONException
  {
    if ((paramFile2.exists()) && (paramFile2.isDirectory())) {
      throw new InvalidModificationException("Can't rename a file to a directory");
    }
    copyAction(paramFile1, paramFile2);
    return getEntry(paramFile2);
  }
  
  private File createDestination(String paramString, File paramFile1, File paramFile2)
  {
    if (("null".equals(paramString)) || ("".equals(paramString))) {
      paramString = null;
    }
    if (paramString != null) {
      return new File(paramFile2.getAbsolutePath() + File.separator + paramString);
    }
    return new File(paramFile2.getAbsolutePath() + File.separator + paramFile1.getName());
  }
  
  private File createFileObject(String paramString)
  {
    return new File(FileHelper.getRealPath(paramString, this.cordova));
  }
  
  private File createFileObject(String paramString1, String paramString2)
  {
    if (paramString2.startsWith("/")) {
      return new File(paramString2);
    }
    String str = FileHelper.getRealPath(paramString1, this.cordova);
    return new File(str + File.separator + paramString2);
  }
  
  public static JSONObject getEntry(File paramFile)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("isFile", paramFile.isFile());
    localJSONObject.put("isDirectory", paramFile.isDirectory());
    localJSONObject.put("name", paramFile.getName());
    localJSONObject.put("fullPath", "file://" + paramFile.getAbsolutePath());
    return localJSONObject;
  }
  
  private JSONObject getEntry(String paramString)
    throws JSONException
  {
    return getEntry(new File(paramString));
  }
  
  private JSONObject getFile(String paramString1, String paramString2, JSONObject paramJSONObject, boolean paramBoolean)
    throws FileExistsException, IOException, TypeMismatchException, EncodingException, JSONException
  {
    boolean bool1 = false;
    boolean bool2 = false;
    if (paramJSONObject != null)
    {
      bool1 = paramJSONObject.optBoolean("create");
      bool2 = false;
      if (bool1) {
        bool2 = paramJSONObject.optBoolean("exclusive");
      }
    }
    if (paramString2.contains(":")) {
      throw new EncodingException("This file has a : in it's name");
    }
    File localFile = createFileObject(paramString1, paramString2);
    if (bool1)
    {
      if ((bool2) && (localFile.exists())) {
        throw new FileExistsException("create/exclusive fails");
      }
      if (paramBoolean) {
        localFile.mkdir();
      }
      while (!localFile.exists())
      {
        throw new FileExistsException("create fails");
        localFile.createNewFile();
      }
    }
    if (!localFile.exists()) {
      throw new FileNotFoundException("path does not exist");
    }
    if (paramBoolean)
    {
      if (localFile.isFile()) {
        throw new TypeMismatchException("path doesn't exist or is file");
      }
    }
    else if (localFile.isDirectory()) {
      throw new TypeMismatchException("path doesn't exist or is directory");
    }
    return getEntry(localFile);
  }
  
  private JSONObject getFileMetadata(String paramString)
    throws FileNotFoundException, JSONException
  {
    File localFile = createFileObject(paramString);
    if (!localFile.exists()) {
      throw new FileNotFoundException("File: " + paramString + " does not exist.");
    }
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("size", localFile.length());
    localJSONObject.put("type", FileHelper.getMimeType(paramString, this.cordova));
    localJSONObject.put("name", localFile.getName());
    localJSONObject.put("fullPath", paramString);
    localJSONObject.put("lastModifiedDate", localFile.lastModified());
    return localJSONObject;
  }
  
  private long getMetadata(String paramString)
    throws FileNotFoundException
  {
    File localFile = createFileObject(paramString);
    if (!localFile.exists()) {
      throw new FileNotFoundException("Failed to find file in getMetadata");
    }
    return localFile.lastModified();
  }
  
  private JSONObject getParent(String paramString)
    throws JSONException
  {
    String str = FileHelper.getRealPath(paramString, this.cordova);
    if (atRootDirectory(str)) {
      return getEntry(str);
    }
    return getEntry(new File(str).getParent());
  }
  
  private boolean isCopyOnItself(String paramString1, String paramString2)
  {
    return (paramString2.startsWith(paramString1)) && (paramString2.indexOf(File.separator, -1 + paramString1.length()) != -1);
  }
  
  private JSONObject moveDirectory(File paramFile1, File paramFile2)
    throws IOException, JSONException, InvalidModificationException, NoModificationAllowedException, FileExistsException
  {
    if ((paramFile2.exists()) && (paramFile2.isFile())) {
      throw new InvalidModificationException("Can't rename a file to a directory");
    }
    if (isCopyOnItself(paramFile1.getAbsolutePath(), paramFile2.getAbsolutePath())) {
      throw new InvalidModificationException("Can't move itself into itself");
    }
    if ((paramFile2.exists()) && (paramFile2.list().length > 0)) {
      throw new InvalidModificationException("directory is not empty");
    }
    if (!paramFile1.renameTo(paramFile2))
    {
      copyDirectory(paramFile1, paramFile2);
      if (paramFile2.exists()) {
        removeDirRecursively(paramFile1);
      }
    }
    else
    {
      return getEntry(paramFile2);
    }
    throw new IOException("moved failed");
  }
  
  private JSONObject moveFile(File paramFile1, File paramFile2)
    throws IOException, JSONException, InvalidModificationException
  {
    if ((paramFile2.exists()) && (paramFile2.isDirectory())) {
      throw new InvalidModificationException("Can't rename a file to a directory");
    }
    if (!paramFile1.renameTo(paramFile2))
    {
      copyAction(paramFile1, paramFile2);
      if (paramFile2.exists()) {
        paramFile1.delete();
      }
    }
    else
    {
      return getEntry(paramFile2);
    }
    throw new IOException("moved failed");
  }
  
  private void notifyDelete(String paramString)
  {
    String str = FileHelper.getRealPath(paramString, this.cordova);
    try
    {
      this.cordova.getActivity().getContentResolver().delete(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, "_data = ?", new String[] { str });
      return;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException) {}
  }
  
  private byte[] readAsBinaryHelper(String paramString, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = paramInt2 - paramInt1;
    byte[] arrayOfByte = new byte[i];
    InputStream localInputStream = FileHelper.getInputStreamFromUriString(paramString, this.cordova);
    int j = 0;
    if (paramInt1 > 0) {
      localInputStream.skip(paramInt1);
    }
    while (i > 0)
    {
      j = localInputStream.read(arrayOfByte, j, i);
      if (j < 0) {
        break;
      }
      i -= j;
    }
    return arrayOfByte;
  }
  
  private JSONArray readEntries(String paramString)
    throws FileNotFoundException, JSONException
  {
    File localFile = createFileObject(paramString);
    if (!localFile.exists()) {
      throw new FileNotFoundException();
    }
    JSONArray localJSONArray = new JSONArray();
    if (localFile.isDirectory())
    {
      File[] arrayOfFile = localFile.listFiles();
      for (int i = 0; i < arrayOfFile.length; i++) {
        if (arrayOfFile[i].canRead()) {
          localJSONArray.put(getEntry(arrayOfFile[i]));
        }
      }
    }
    return localJSONArray;
  }
  
  private boolean remove(String paramString)
    throws NoModificationAllowedException, InvalidModificationException
  {
    File localFile = createFileObject(paramString);
    if (atRootDirectory(paramString)) {
      throw new NoModificationAllowedException("You can't delete the root directory");
    }
    if ((localFile.isDirectory()) && (localFile.list().length > 0)) {
      throw new InvalidModificationException("You can't delete a directory that is not empty.");
    }
    return localFile.delete();
  }
  
  private boolean removeDirRecursively(File paramFile)
    throws FileExistsException
  {
    if (paramFile.isDirectory())
    {
      File[] arrayOfFile = paramFile.listFiles();
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++) {
        removeDirRecursively(arrayOfFile[j]);
      }
    }
    if (!paramFile.delete()) {
      throw new FileExistsException("could not delete: " + paramFile.getName());
    }
    return true;
  }
  
  private boolean removeRecursively(String paramString)
    throws FileExistsException
  {
    File localFile = createFileObject(paramString);
    if (atRootDirectory(paramString)) {
      return false;
    }
    return removeDirRecursively(localFile);
  }
  
  private JSONObject requestFileSystem(int paramInt)
    throws IOException, JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    if (paramInt == TEMPORARY)
    {
      localJSONObject.put("name", "temporary");
      if (Environment.getExternalStorageState().equals("mounted"))
      {
        new File(RuleUtility.getStoragePath().getAbsolutePath() + "/Android/data/" + this.cordova.getActivity().getPackageName() + "/cache/").mkdirs();
        localJSONObject.put("root", getEntry(RuleUtility.getStoragePath().getAbsolutePath() + "/Android/data/" + this.cordova.getActivity().getPackageName() + "/cache/"));
        return localJSONObject;
      }
      new File("/data/data/" + this.cordova.getActivity().getPackageName() + "/cache/").mkdirs();
      localJSONObject.put("root", getEntry("/data/data/" + this.cordova.getActivity().getPackageName() + "/cache/"));
      return localJSONObject;
    }
    if (paramInt == PERSISTENT)
    {
      localJSONObject.put("name", "persistent");
      if (Environment.getExternalStorageState().equals("mounted"))
      {
        localJSONObject.put("root", getEntry(RuleUtility.getStoragePath()));
        return localJSONObject;
      }
      localJSONObject.put("root", getEntry("/data/data/" + this.cordova.getActivity().getPackageName()));
      return localJSONObject;
    }
    throw new IOException("No filesystem of type requested");
  }
  
  private JSONObject resolveLocalFileSystemURI(String paramString)
    throws IOException, JSONException
  {
    String str = URLDecoder.decode(paramString, "UTF-8");
    File localFile;
    if (str.startsWith("content:"))
    {
      Cursor localCursor = this.cordova.getActivity().managedQuery(Uri.parse(str), new String[] { "_data" }, null, null, null);
      int j = localCursor.getColumnIndexOrThrow("_data");
      localCursor.moveToFirst();
      localFile = new File(localCursor.getString(j));
    }
    while (!localFile.exists())
    {
      throw new FileNotFoundException();
      new URL(str);
      if (str.startsWith("file://"))
      {
        int i = str.indexOf("?");
        if (i < 0) {
          localFile = new File(str.substring(7, str.length()));
        } else {
          localFile = new File(str.substring(7, i));
        }
      }
      else
      {
        localFile = new File(str);
      }
    }
    if (!localFile.canRead()) {
      throw new IOException();
    }
    return getEntry(localFile);
  }
  
  private void threadhelper(final FileOp paramFileOp, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        try
        {
          paramFileOp.run();
          return;
        }
        catch (Exception localException)
        {
          do
          {
            localException.printStackTrace();
            if ((localException instanceof EncodingException))
            {
              paramCallbackContext.error(FileUtils.ENCODING_ERR);
              return;
            }
            if ((localException instanceof FileNotFoundException))
            {
              paramCallbackContext.error(FileUtils.NOT_FOUND_ERR);
              return;
            }
            if ((localException instanceof FileExistsException))
            {
              paramCallbackContext.error(FileUtils.PATH_EXISTS_ERR);
              return;
            }
            if ((localException instanceof NoModificationAllowedException))
            {
              paramCallbackContext.error(FileUtils.NO_MODIFICATION_ALLOWED_ERR);
              return;
            }
            if ((localException instanceof InvalidModificationException))
            {
              paramCallbackContext.error(FileUtils.INVALID_MODIFICATION_ERR);
              return;
            }
            if ((localException instanceof MalformedURLException))
            {
              paramCallbackContext.error(FileUtils.ENCODING_ERR);
              return;
            }
            if ((localException instanceof IOException))
            {
              paramCallbackContext.error(FileUtils.INVALID_MODIFICATION_ERR);
              return;
            }
            if ((localException instanceof EncodingException))
            {
              paramCallbackContext.error(FileUtils.ENCODING_ERR);
              return;
            }
          } while (!(localException instanceof TypeMismatchException));
          paramCallbackContext.error(FileUtils.TYPE_MISMATCH_ERR);
        }
      }
    });
  }
  
  private JSONObject transferTo(String paramString1, String paramString2, String paramString3, boolean paramBoolean)
    throws JSONException, NoModificationAllowedException, IOException, InvalidModificationException, EncodingException, FileExistsException
  {
    String str1 = FileHelper.getRealPath(paramString1, this.cordova);
    String str2 = FileHelper.getRealPath(paramString2, this.cordova);
    if ((paramString3 != null) && (paramString3.contains(":"))) {
      throw new EncodingException("Bad file name");
    }
    File localFile1 = new File(str1);
    if (!localFile1.exists()) {
      throw new FileNotFoundException("The source does not exist");
    }
    File localFile2 = new File(str2);
    if (!localFile2.exists()) {
      throw new FileNotFoundException("The source does not exist");
    }
    File localFile3 = createDestination(paramString3, localFile1, localFile2);
    if (localFile1.getAbsolutePath().equals(localFile3.getAbsolutePath())) {
      throw new InvalidModificationException("Can't copy a file onto itself");
    }
    JSONObject localJSONObject;
    if (localFile1.isDirectory()) {
      if (paramBoolean) {
        localJSONObject = moveDirectory(localFile1, localFile3);
      }
    }
    do
    {
      return localJSONObject;
      return copyDirectory(localFile1, localFile3);
      if (!paramBoolean) {
        break;
      }
      localJSONObject = moveFile(localFile1, localFile3);
    } while (!paramString1.startsWith("content://"));
    notifyDelete(paramString1);
    return localJSONObject;
    return copyFile(localFile1, localFile3);
  }
  
  private long truncateFile(String paramString, long paramLong)
    throws FileNotFoundException, IOException, NoModificationAllowedException
  {
    if (paramString.startsWith("content://")) {
      throw new NoModificationAllowedException("Couldn't truncate file given its content URI");
    }
    RandomAccessFile localRandomAccessFile = new RandomAccessFile(FileHelper.getRealPath(paramString, this.cordova), "rw");
    try
    {
      if (localRandomAccessFile.length() >= paramLong)
      {
        localRandomAccessFile.getChannel().truncate(paramLong);
        return paramLong;
      }
      long l = localRandomAccessFile.length();
      return l;
    }
    finally
    {
      localRandomAccessFile.close();
    }
  }
  
  public boolean execute(String paramString, final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (paramString.equals("testSaveLocationExists")) {
      threadhelper(new FileOp()
      {
        public void run()
        {
          boolean bool = DirectoryManager.testSaveLocationExists();
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, bool));
        }
      }, paramCallbackContext);
    }
    for (;;)
    {
      return true;
      if (paramString.equals("getFreeDiskSpace"))
      {
        threadhelper(new FileOp()
        {
          public void run()
          {
            long l = DirectoryManager.getFreeDiskSpace(false);
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)l));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("testFileExists"))
      {
        threadhelper(new FileOp()
        {
          public void run()
          {
            boolean bool = DirectoryManager.testFileExists(this.val$fname);
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, bool));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("testDirectoryExists"))
      {
        threadhelper(new FileOp()
        {
          public void run()
          {
            boolean bool = DirectoryManager.testFileExists(this.val$fname);
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, bool));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("readAsText"))
      {
        final String str = paramJSONArray.getString(1);
        final int i3 = paramJSONArray.getInt(2);
        final int i4 = paramJSONArray.getInt(3);
        threadhelper(new FileOp()
        {
          public void run()
          {
            FileUtils.this.readFileAs(this.val$fname, i3, i4, paramCallbackContext, str, 1);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("readAsDataURL"))
      {
        final int i1 = paramJSONArray.getInt(1);
        final int i2 = paramJSONArray.getInt(2);
        threadhelper(new FileOp()
        {
          public void run()
          {
            FileUtils.this.readFileAs(this.val$fname, i1, i2, paramCallbackContext, null, -1);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("readAsArrayBuffer"))
      {
        final int m = paramJSONArray.getInt(1);
        final int n = paramJSONArray.getInt(2);
        threadhelper(new FileOp()
        {
          public void run()
          {
            FileUtils.this.readFileAs(this.val$fname, m, n, paramCallbackContext, null, 6);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("readAsBinaryString"))
      {
        final int j = paramJSONArray.getInt(1);
        final int k = paramJSONArray.getInt(2);
        threadhelper(new FileOp()
        {
          public void run()
          {
            FileUtils.this.readFileAs(this.val$fname, j, k, paramCallbackContext, null, 7);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("write"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileNotFoundException, IOException, NoModificationAllowedException
          {
            long l = FileUtils.this.write(this.val$fname, this.val$data, this.val$offset, this.val$isBinary.booleanValue());
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)l));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("truncate"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileNotFoundException, IOException, NoModificationAllowedException
          {
            long l = FileUtils.this.truncateFile(this.val$fname, this.val$offset);
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)l));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("requestFileSystem"))
      {
        final int i = paramJSONArray.getInt(0);
        threadhelper(new FileOp()
        {
          public void run()
            throws IOException, JSONException
          {
            if ((this.val$size != 0L) && (this.val$size > 1024L * DirectoryManager.getFreeDiskSpace(true)))
            {
              i.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, FileUtils.QUOTA_EXCEEDED_ERR));
              return;
            }
            JSONObject localJSONObject = FileUtils.this.requestFileSystem(this.val$fstype);
            i.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("resolveLocalFileSystemURI"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws IOException, JSONException
          {
            JSONObject localJSONObject = FileUtils.this.resolveLocalFileSystemURI(this.val$fname);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("getMetadata"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileNotFoundException, JSONException
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)FileUtils.this.getMetadata(this.val$fname)));
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("getFileMetadata"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileNotFoundException, JSONException
          {
            JSONObject localJSONObject = FileUtils.this.getFileMetadata(this.val$fname);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("getParent"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws JSONException
          {
            JSONObject localJSONObject = FileUtils.this.getParent(this.val$fname);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("getDirectory"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileExistsException, IOException, TypeMismatchException, EncodingException, JSONException
          {
            JSONObject localJSONObject = FileUtils.this.getFile(this.val$dirname, this.val$fname, paramJSONArray.optJSONObject(2), true);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("getFile"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileExistsException, IOException, TypeMismatchException, EncodingException, JSONException
          {
            JSONObject localJSONObject = FileUtils.this.getFile(this.val$dirname, this.val$fname, paramJSONArray.optJSONObject(2), false);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("remove"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws NoModificationAllowedException, InvalidModificationException
          {
            if (FileUtils.this.remove(this.val$fname))
            {
              FileUtils.this.notifyDelete(this.val$fname);
              paramCallbackContext.success();
              return;
            }
            paramCallbackContext.error(FileUtils.NO_MODIFICATION_ALLOWED_ERR);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("removeRecursively"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws FileExistsException
          {
            if (FileUtils.this.removeRecursively(this.val$fname))
            {
              paramCallbackContext.success();
              return;
            }
            paramCallbackContext.error(FileUtils.NO_MODIFICATION_ALLOWED_ERR);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("moveTo"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws JSONException, NoModificationAllowedException, IOException, InvalidModificationException, EncodingException, FileExistsException
          {
            JSONObject localJSONObject = FileUtils.this.transferTo(this.val$fname, this.val$newParent, this.val$newName, true);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else if (paramString.equals("copyTo"))
      {
        threadhelper(new FileOp()
        {
          public void run()
            throws JSONException, NoModificationAllowedException, IOException, InvalidModificationException, EncodingException, FileExistsException
          {
            JSONObject localJSONObject = FileUtils.this.transferTo(this.val$fname, this.val$newParent, this.val$newName, false);
            paramCallbackContext.success(localJSONObject);
          }
        }, paramCallbackContext);
      }
      else
      {
        if (!paramString.equals("readEntries")) {
          break;
        }
        threadhelper(new FileOp()
        {
          public void run()
            throws FileNotFoundException, JSONException
          {
            JSONArray localJSONArray = FileUtils.this.readEntries(this.val$fname);
            paramCallbackContext.success(localJSONArray);
          }
        }, paramCallbackContext);
      }
    }
    return false;
  }
  
  public void readFileAs(final String paramString1, final int paramInt1, final int paramInt2, final CallbackContext paramCallbackContext, final String paramString2, final int paramInt3)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        try
        {
          byte[] arrayOfByte1 = FileUtils.this.readAsBinaryHelper(paramString1, paramInt1, paramInt2);
          PluginResult localPluginResult;
          switch (paramInt3)
          {
          default: 
            String str1 = FileHelper.getMimeType(paramString1, FileUtils.this.cordova);
            byte[] arrayOfByte2 = Base64.encode(arrayOfByte1, 2);
            String str2 = "data:" + str1 + ";base64," + new String(arrayOfByte2, "US-ASCII");
            localPluginResult = new PluginResult(PluginResult.Status.OK, str2);
          }
          for (;;)
          {
            paramCallbackContext.sendPluginResult(localPluginResult);
            return;
            localPluginResult = new PluginResult(PluginResult.Status.OK, new String(arrayOfByte1, paramString2));
            continue;
            localPluginResult = new PluginResult(PluginResult.Status.OK, arrayOfByte1);
            continue;
            localPluginResult = new PluginResult(PluginResult.Status.OK, arrayOfByte1, true);
          }
          return;
        }
        catch (FileNotFoundException localFileNotFoundException)
        {
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.IO_EXCEPTION, FileUtils.NOT_FOUND_ERR));
          return;
        }
        catch (IOException localIOException)
        {
          Log.d("FileUtils", localIOException.getLocalizedMessage());
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.IO_EXCEPTION, FileUtils.NOT_READABLE_ERR));
        }
      }
    });
  }
  
  public long write(String paramString1, String paramString2, int paramInt, boolean paramBoolean)
    throws FileNotFoundException, IOException, NoModificationAllowedException
  {
    if (paramString1.startsWith("content://")) {
      throw new NoModificationAllowedException("Couldn't write to file given its content URI");
    }
    str = FileHelper.getRealPath(paramString1, this.cordova);
    boolean bool = false;
    if (paramInt > 0)
    {
      truncateFile(str, paramInt);
      bool = true;
    }
    if (paramBoolean) {}
    for (byte[] arrayOfByte1 = Base64.decode(paramString2, 0);; arrayOfByte1 = paramString2.getBytes())
    {
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(arrayOfByte1);
      try
      {
        FileOutputStream localFileOutputStream = new FileOutputStream(str, bool);
        byte[] arrayOfByte2 = new byte[arrayOfByte1.length];
        localByteArrayInputStream.read(arrayOfByte2, 0, arrayOfByte2.length);
        localFileOutputStream.write(arrayOfByte2, 0, arrayOfByte1.length);
        localFileOutputStream.flush();
        localFileOutputStream.close();
        return arrayOfByte1.length;
      }
      catch (NullPointerException localNullPointerException)
      {
        throw new NoModificationAllowedException(str);
      }
    }
  }
  
  private static abstract interface FileOp
  {
    public abstract void run()
      throws Exception;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/file/FileUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */