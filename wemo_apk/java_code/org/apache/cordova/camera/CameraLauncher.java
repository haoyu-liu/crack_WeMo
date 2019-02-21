package org.apache.cordova.camera;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.media.MediaScannerConnection;
import android.media.MediaScannerConnection.MediaScannerConnectionClient;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import android.util.Base64;
import android.util.Log;
import com.belkin.utils.RuleUtility;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class CameraLauncher
  extends CordovaPlugin
  implements MediaScannerConnection.MediaScannerConnectionClient
{
  private static final int ALLMEDIA = 2;
  private static final int CAMERA = 1;
  private static final int DATA_URL = 0;
  private static final int FILE_URI = 1;
  private static final String GET_All = "Get All";
  private static final String GET_PICTURE = "Get Picture";
  private static final String GET_VIDEO = "Get Video";
  private static final int JPEG = 0;
  private static final String LOG_TAG = "CameraLauncher";
  private static final int NATIVE_URI = 2;
  private static final int PHOTOLIBRARY = 0;
  private static final int PICTURE = 0;
  private static final int PNG = 1;
  private static final int SAVEDPHOTOALBUM = 2;
  private static final int VIDEO = 1;
  public CallbackContext callbackContext;
  private MediaScannerConnection conn;
  private boolean correctOrientation;
  private int encodingType;
  private Uri imageUri;
  private int mQuality;
  private int mediaType;
  private int numPics;
  private boolean orientationCorrected;
  private boolean saveToPhotoAlbum;
  private Uri scanMe;
  private int targetHeight;
  private int targetWidth;
  
  public static int calculateSampleSize(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (paramInt1 / paramInt2 > paramInt3 / paramInt4) {
      return paramInt1 / paramInt3;
    }
    return paramInt2 / paramInt4;
  }
  
  private void checkForDuplicateImage(int paramInt)
  {
    int i = 1;
    Uri localUri1 = whichContentStore();
    Cursor localCursor = queryImgDB(localUri1);
    int j = localCursor.getCount();
    if ((paramInt == 1) && (this.saveToPhotoAlbum)) {
      i = 2;
    }
    if (j - this.numPics == i)
    {
      localCursor.moveToLast();
      int k = Integer.valueOf(localCursor.getString(localCursor.getColumnIndex("_id"))).intValue();
      if (i == 2) {
        k--;
      }
      Uri localUri2 = Uri.parse(localUri1 + "/" + k);
      this.cordova.getActivity().getContentResolver().delete(localUri2, null, null);
      localCursor.close();
    }
  }
  
  private void cleanup(int paramInt, Uri paramUri1, Uri paramUri2, Bitmap paramBitmap)
  {
    if (paramBitmap != null) {
      paramBitmap.recycle();
    }
    new File(FileHelper.stripFileProtocol(paramUri1.toString())).delete();
    checkForDuplicateImage(paramInt);
    if ((this.saveToPhotoAlbum) && (paramUri2 != null)) {
      scanForGallery(paramUri2);
    }
    System.gc();
  }
  
  private File createCaptureFile(int paramInt)
  {
    if (paramInt == 0) {
      return new File(getTempDirectoryPath(), ".Pic.jpg");
    }
    if (paramInt == 1) {
      return new File(getTempDirectoryPath(), ".Pic.png");
    }
    throw new IllegalArgumentException("Invalid Encoding Type: " + paramInt);
  }
  
  private int getImageOrientation(Uri paramUri)
  {
    int i = 0;
    String[] arrayOfString = { "orientation" };
    try
    {
      Cursor localCursor = this.cordova.getActivity().getContentResolver().query(paramUri, arrayOfString, null, null, null);
      i = 0;
      if (localCursor != null)
      {
        localCursor.moveToPosition(0);
        i = localCursor.getInt(0);
        localCursor.close();
      }
      return i;
    }
    catch (Exception localException) {}
    return i;
  }
  
  private Bitmap getRotatedBitmap(int paramInt, Bitmap paramBitmap, ExifHelper paramExifHelper)
  {
    Matrix localMatrix = new Matrix();
    if (paramInt == 180) {
      localMatrix.setRotate(paramInt);
    }
    for (;;)
    {
      try
      {
        int i = paramBitmap.getWidth();
        int j = paramBitmap.getHeight();
        paramBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, i, j, localMatrix, true);
        paramExifHelper.resetOrientation();
        return paramBitmap;
      }
      catch (OutOfMemoryError localOutOfMemoryError) {}
      localMatrix.setRotate(paramInt, paramBitmap.getWidth() / 2.0F, paramBitmap.getHeight() / 2.0F);
    }
    return paramBitmap;
  }
  
  private Bitmap getScaledBitmap(String paramString)
    throws IOException
  {
    Bitmap localBitmap1;
    if ((this.targetWidth <= 0) && (this.targetHeight <= 0)) {
      localBitmap1 = BitmapFactory.decodeStream(FileHelper.getInputStreamFromUriString(paramString, this.cordova));
    }
    int[] arrayOfInt;
    Bitmap localBitmap2;
    do
    {
      BitmapFactory.Options localOptions;
      int j;
      do
      {
        int i;
        do
        {
          return localBitmap1;
          localOptions = new BitmapFactory.Options();
          localOptions.inJustDecodeBounds = true;
          BitmapFactory.decodeStream(FileHelper.getInputStreamFromUriString(paramString, this.cordova), null, localOptions);
          i = localOptions.outWidth;
          localBitmap1 = null;
        } while (i == 0);
        j = localOptions.outHeight;
        localBitmap1 = null;
      } while (j == 0);
      arrayOfInt = calculateAspectRatio(localOptions.outWidth, localOptions.outHeight);
      localOptions.inJustDecodeBounds = false;
      localOptions.inSampleSize = calculateSampleSize(localOptions.outWidth, localOptions.outHeight, this.targetWidth, this.targetHeight);
      localBitmap2 = BitmapFactory.decodeStream(FileHelper.getInputStreamFromUriString(paramString, this.cordova), null, localOptions);
      localBitmap1 = null;
    } while (localBitmap2 == null);
    return Bitmap.createScaledBitmap(localBitmap2, arrayOfInt[0], arrayOfInt[1], true);
  }
  
  private String getTempDirectoryPath()
  {
    if (Environment.getExternalStorageState().equals("mounted")) {}
    for (File localFile = new File(RuleUtility.getStoragePath().getAbsolutePath() + "/Android/data/" + this.cordova.getActivity().getPackageName() + "/cache/");; localFile = this.cordova.getActivity().getCacheDir())
    {
      localFile.mkdirs();
      return localFile.getAbsolutePath();
    }
  }
  
  private Uri getUriFromMediaStore()
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("mime_type", "image/jpeg");
    try
    {
      Uri localUri2 = this.cordova.getActivity().getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, localContentValues);
      return localUri2;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException1)
    {
      LOG.d("CameraLauncher", "Can't write to external media storage.");
      try
      {
        Uri localUri1 = this.cordova.getActivity().getContentResolver().insert(MediaStore.Images.Media.INTERNAL_CONTENT_URI, localContentValues);
        return localUri1;
      }
      catch (UnsupportedOperationException localUnsupportedOperationException2)
      {
        LOG.d("CameraLauncher", "Can't write to internal media storage.");
      }
    }
    return null;
  }
  
  private String ouputModifiedBitmap(Bitmap paramBitmap, Uri paramUri)
    throws IOException
  {
    String str1 = getTempDirectoryPath() + "/modified.jpg";
    FileOutputStream localFileOutputStream = new FileOutputStream(str1);
    paramBitmap.compress(Bitmap.CompressFormat.JPEG, this.mQuality, localFileOutputStream);
    localFileOutputStream.close();
    String str2 = FileHelper.getRealPath(paramUri, this.cordova);
    ExifHelper localExifHelper = new ExifHelper();
    if ((str2 != null) && (this.encodingType == 0)) {}
    try
    {
      localExifHelper.createInFile(str2);
      localExifHelper.readExifData();
      if ((this.correctOrientation) && (this.orientationCorrected)) {
        localExifHelper.resetOrientation();
      }
      localExifHelper.createOutFile(str1);
      localExifHelper.writeExifData();
      return str1;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
    return str1;
  }
  
  private void processResultFromCamera(int paramInt, Intent paramIntent)
    throws IOException
  {
    ExifHelper localExifHelper = new ExifHelper();
    int i;
    try
    {
      int j = this.encodingType;
      i = 0;
      if (j == 0)
      {
        localExifHelper.createInFile(getTempDirectoryPath() + "/.Pic.jpg");
        localExifHelper.readExifData();
        int k = localExifHelper.getOrientation();
        i = k;
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
        i = 0;
      }
      if ((i == 0) || (!this.correctOrientation)) {
        break label167;
      }
      localBitmap = getRotatedBitmap(i, localBitmap, localExifHelper);
      processPicture(localBitmap);
      checkForDuplicateImage(0);
    }
    Bitmap localBitmap = null;
    Uri localUri = null;
    if (paramInt == 0)
    {
      localBitmap = getScaledBitmap(FileHelper.stripFileProtocol(this.imageUri.toString()));
      if (localBitmap == null) {
        localBitmap = (Bitmap)paramIntent.getExtras().get("data");
      }
      if (localBitmap == null)
      {
        Log.d("CameraLauncher", "I either have a null image path or bitmap");
        failPicture("Unable to create bitmap!");
        return;
      }
    }
    label167:
    do
    {
      cleanup(1, this.imageUri, localUri, localBitmap);
      return;
      if (paramInt == 1) {
        break;
      }
      localBitmap = null;
      localUri = null;
    } while (paramInt != 2);
    if (this.saveToPhotoAlbum)
    {
      localUri = Uri.fromFile(new File(FileHelper.getRealPath(getUriFromMediaStore(), this.cordova)));
      label238:
      if (localUri == null) {
        failPicture("Error capturing image - no media storage found.");
      }
      if ((this.targetHeight != -1) || (this.targetWidth != -1) || (this.mQuality != 100) || (this.correctOrientation)) {
        break label356;
      }
      writeUncompressedImage(localUri);
      this.callbackContext.success(localUri.toString());
    }
    label356:
    do
    {
      this.callbackContext.success(localUri.toString());
      break;
      localUri = Uri.fromFile(new File(getTempDirectoryPath(), System.currentTimeMillis() + ".jpg"));
      break label238;
      localBitmap = getScaledBitmap(FileHelper.stripFileProtocol(this.imageUri.toString()));
      if ((i != 0) && (this.correctOrientation)) {
        localBitmap = getRotatedBitmap(i, localBitmap, localExifHelper);
      }
      OutputStream localOutputStream = this.cordova.getActivity().getContentResolver().openOutputStream(localUri);
      localBitmap.compress(Bitmap.CompressFormat.JPEG, this.mQuality, localOutputStream);
      localOutputStream.close();
    } while (this.encodingType != 0);
    if (this.saveToPhotoAlbum) {}
    for (String str = FileHelper.getRealPath(localUri, this.cordova);; str = localUri.getPath())
    {
      localExifHelper.createOutFile(str);
      localExifHelper.writeExifData();
      break;
    }
  }
  
  private void processResultFromGallery(int paramInt, Intent paramIntent)
  {
    Uri localUri = paramIntent.getData();
    if (this.mediaType != 0)
    {
      this.callbackContext.success(localUri.toString());
      return;
    }
    if ((this.targetHeight == -1) && (this.targetWidth == -1) && ((paramInt == 1) || (paramInt == 2)) && (!this.correctOrientation))
    {
      this.callbackContext.success(localUri.toString());
      return;
    }
    String str1 = localUri.toString();
    String str2 = FileHelper.getMimeType(str1, this.cordova);
    if ((!"image/jpeg".equalsIgnoreCase(str2)) && (!"image/png".equalsIgnoreCase(str2)))
    {
      Log.d("CameraLauncher", "I either have a null image path or bitmap");
      failPicture("Unable to retrieve path to picture!");
      return;
    }
    Bitmap localBitmap1;
    try
    {
      Bitmap localBitmap2 = getScaledBitmap(str1);
      localBitmap1 = localBitmap2;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
        localBitmap1 = null;
      }
      if (!this.correctOrientation) {
        break label235;
      }
      i = getImageOrientation(localUri);
      if (i == 0) {
        break label235;
      }
      localMatrix = new Matrix();
      localMatrix.setRotate(i);
    }
    if (localBitmap1 == null)
    {
      Log.d("CameraLauncher", "I either have a null image path or bitmap");
      failPicture("Unable to create bitmap!");
      return;
    }
    try
    {
      int i;
      Matrix localMatrix;
      localBitmap1 = Bitmap.createBitmap(localBitmap1, 0, 0, localBitmap1.getWidth(), localBitmap1.getHeight(), localMatrix, true);
      this.orientationCorrected = true;
      label235:
      if (paramInt == 0)
      {
        processPicture(localBitmap1);
        if (localBitmap1 != null) {
          localBitmap1.recycle();
        }
        System.gc();
        return;
      }
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        this.orientationCorrected = false;
        continue;
        if ((paramInt == 1) || (paramInt == 2)) {
          if (((this.targetHeight > 0) && (this.targetWidth > 0)) || ((this.correctOrientation) && (this.orientationCorrected))) {
            try
            {
              String str3 = ouputModifiedBitmap(localBitmap1, localUri);
              this.callbackContext.success("file://" + str3 + "?" + System.currentTimeMillis());
            }
            catch (Exception localException)
            {
              localException.printStackTrace();
              failPicture("Error retrieving image.");
            }
          } else {
            this.callbackContext.success(localUri.toString());
          }
        }
      }
    }
  }
  
  private Cursor queryImgDB(Uri paramUri)
  {
    return this.cordova.getActivity().getContentResolver().query(paramUri, new String[] { "_id" }, null, null, null);
  }
  
  private void scanForGallery(Uri paramUri)
  {
    this.scanMe = paramUri;
    if (this.conn != null) {
      this.conn.disconnect();
    }
    this.conn = new MediaScannerConnection(this.cordova.getActivity().getApplicationContext(), this);
    this.conn.connect();
  }
  
  private Uri whichContentStore()
  {
    if (Environment.getExternalStorageState().equals("mounted")) {
      return MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
    }
    return MediaStore.Images.Media.INTERNAL_CONTENT_URI;
  }
  
  private void writeUncompressedImage(Uri paramUri)
    throws FileNotFoundException, IOException
  {
    FileInputStream localFileInputStream = new FileInputStream(FileHelper.stripFileProtocol(this.imageUri.toString()));
    OutputStream localOutputStream = this.cordova.getActivity().getContentResolver().openOutputStream(paramUri);
    byte[] arrayOfByte = new byte['က'];
    for (;;)
    {
      int i = localFileInputStream.read(arrayOfByte);
      if (i == -1) {
        break;
      }
      localOutputStream.write(arrayOfByte, 0, i);
    }
    localOutputStream.flush();
    localOutputStream.close();
    localFileInputStream.close();
  }
  
  public int[] calculateAspectRatio(int paramInt1, int paramInt2)
  {
    int i = this.targetWidth;
    int j = this.targetHeight;
    if ((i <= 0) && (j <= 0))
    {
      i = paramInt1;
      j = paramInt2;
    }
    for (;;)
    {
      return new int[] { i, j };
      if ((i > 0) && (j <= 0))
      {
        j = i * paramInt2 / paramInt1;
      }
      else if ((i <= 0) && (j > 0))
      {
        i = j * paramInt1 / paramInt2;
      }
      else
      {
        double d1 = i / j;
        double d2 = paramInt1 / paramInt2;
        if (d2 > d1) {
          j = i * paramInt2 / paramInt1;
        } else if (d2 < d1) {
          i = j * paramInt1 / paramInt2;
        }
      }
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    this.callbackContext = paramCallbackContext;
    if (paramString.equals("takePicture"))
    {
      this.saveToPhotoAlbum = false;
      this.targetHeight = 0;
      this.targetWidth = 0;
      this.encodingType = 0;
      this.mediaType = 0;
      this.mQuality = 80;
      this.mQuality = paramJSONArray.getInt(0);
      int i = paramJSONArray.getInt(1);
      int j = paramJSONArray.getInt(2);
      this.targetWidth = paramJSONArray.getInt(3);
      this.targetHeight = paramJSONArray.getInt(4);
      this.encodingType = paramJSONArray.getInt(5);
      this.mediaType = paramJSONArray.getInt(6);
      this.correctOrientation = paramJSONArray.getBoolean(8);
      this.saveToPhotoAlbum = paramJSONArray.getBoolean(9);
      if (this.targetWidth < 1) {
        this.targetWidth = -1;
      }
      if (this.targetHeight < 1) {
        this.targetHeight = -1;
      }
      if (j == 1) {}
      for (;;)
      {
        try
        {
          takePicture(i, this.encodingType);
          PluginResult localPluginResult = new PluginResult(PluginResult.Status.NO_RESULT);
          localPluginResult.setKeepCallback(true);
          paramCallbackContext.sendPluginResult(localPluginResult);
          return true;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          paramCallbackContext.error("Illegal Argument Exception");
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR));
          return true;
        }
        if ((j == 0) || (j == 2)) {
          getImage(j, i);
        }
      }
    }
    return false;
  }
  
  public void failPicture(String paramString)
  {
    this.callbackContext.error(paramString);
  }
  
  public void getImage(int paramInt1, int paramInt2)
  {
    Intent localIntent = new Intent();
    String str = "Get Picture";
    if (this.mediaType == 0) {
      localIntent.setType("image/*");
    }
    for (;;)
    {
      localIntent.setAction("android.intent.action.GET_CONTENT");
      localIntent.addCategory("android.intent.category.OPENABLE");
      if (this.cordova != null) {
        this.cordova.startActivityForResult(this, Intent.createChooser(localIntent, new String(str)), 1 + (paramInt2 + 16 * (paramInt1 + 1)));
      }
      return;
      if (this.mediaType == 1)
      {
        localIntent.setType("video/*");
        str = "Get Video";
      }
      else if (this.mediaType == 2)
      {
        localIntent.setType("*/*");
        str = "Get All";
      }
    }
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i = -1 + paramInt1 / 16;
    int j = -1 + paramInt1 % 16;
    if (i == 1) {
      if (paramInt2 != -1) {}
    }
    while ((i != 0) && (i != 2))
    {
      try
      {
        processResultFromCamera(j, paramIntent);
        return;
      }
      catch (IOException localIOException)
      {
        localIOException.printStackTrace();
        failPicture("Error capturing image.");
        return;
      }
      if (paramInt2 == 0)
      {
        failPicture("Camera cancelled.");
        return;
      }
      failPicture("Did not complete!");
      return;
    }
    if (paramInt2 == -1)
    {
      processResultFromGallery(j, paramIntent);
      return;
    }
    if (paramInt2 == 0)
    {
      failPicture("Selection cancelled.");
      return;
    }
    failPicture("Selection did not complete!");
  }
  
  public void onMediaScannerConnected()
  {
    try
    {
      this.conn.scanFile(this.scanMe.toString(), "image/*");
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      LOG.e("CameraLauncher", "Can't scan file in MediaScanner after taking picture");
    }
  }
  
  public void onScanCompleted(String paramString, Uri paramUri)
  {
    this.conn.disconnect();
  }
  
  public void processPicture(Bitmap paramBitmap)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    try
    {
      if (paramBitmap.compress(Bitmap.CompressFormat.JPEG, this.mQuality, localByteArrayOutputStream))
      {
        String str = new String(Base64.encode(localByteArrayOutputStream.toByteArray(), 2));
        this.callbackContext.success(str);
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        failPicture("Error compressing image.");
      }
    }
  }
  
  public void takePicture(int paramInt1, int paramInt2)
  {
    this.numPics = queryImgDB(whichContentStore()).getCount();
    Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
    File localFile = createCaptureFile(paramInt2);
    localIntent.putExtra("output", Uri.fromFile(localFile));
    this.imageUri = Uri.fromFile(localFile);
    if (this.cordova != null) {
      this.cordova.startActivityForResult(this, localIntent, 1 + (paramInt1 + 32));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/camera/CameraLauncher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */