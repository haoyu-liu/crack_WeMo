package org.apache.cordova.mediacapture;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import android.util.Log;
import com.belkin.utils.RuleUtility;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaResourceApi;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Capture
  extends CordovaPlugin
{
  private static final String AUDIO_3GPP = "audio/3gpp";
  private static final int CAPTURE_AUDIO = 0;
  private static final int CAPTURE_IMAGE = 1;
  private static final int CAPTURE_INTERNAL_ERR = 0;
  private static final int CAPTURE_NO_MEDIA_FILES = 3;
  private static final int CAPTURE_VIDEO = 2;
  private static final String IMAGE_JPEG = "image/jpeg";
  private static final String LOG_TAG = "Capture";
  private static final String VIDEO_3GPP = "video/3gpp";
  private static final String VIDEO_MP4 = "video/mp4";
  private CallbackContext callbackContext;
  private int duration;
  private long limit;
  private int numPics;
  private JSONArray results;
  
  private void captureAudio()
  {
    Intent localIntent = new Intent("android.provider.MediaStore.RECORD_SOUND");
    this.cordova.startActivityForResult(this, localIntent, 0);
  }
  
  private void captureImage()
  {
    this.numPics = queryImgDB(whichContentStore()).getCount();
    Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
    localIntent.putExtra("output", Uri.fromFile(new File(getTempDirectoryPath(), "Capture.jpg")));
    this.cordova.startActivityForResult(this, localIntent, 1);
  }
  
  private void captureVideo(int paramInt)
  {
    Intent localIntent = new Intent("android.media.action.VIDEO_CAPTURE");
    if (Build.VERSION.SDK_INT > 7) {
      localIntent.putExtra("android.intent.extra.durationLimit", paramInt);
    }
    this.cordova.startActivityForResult(this, localIntent, 2);
  }
  
  private void checkForDuplicateImage()
  {
    Uri localUri1 = whichContentStore();
    Cursor localCursor = queryImgDB(localUri1);
    if (localCursor.getCount() - this.numPics == 2)
    {
      localCursor.moveToLast();
      int i = -1 + Integer.valueOf(localCursor.getString(localCursor.getColumnIndex("_id"))).intValue();
      Uri localUri2 = Uri.parse(localUri1 + "/" + i);
      this.cordova.getActivity().getContentResolver().delete(localUri2, null, null);
    }
  }
  
  private JSONObject createErrorObject(int paramInt, String paramString)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("code", paramInt);
      localJSONObject.put("message", paramString);
      return localJSONObject;
    }
    catch (JSONException localJSONException) {}
    return localJSONObject;
  }
  
  private JSONObject createMediaFile(Uri paramUri)
  {
    File localFile = this.webView.getResourceApi().mapUriToFile(paramUri);
    JSONObject localJSONObject = new JSONObject();
    for (;;)
    {
      try
      {
        localJSONObject.put("name", localFile.getName());
        localJSONObject.put("fullPath", localFile.toURI().toString());
        if ((localFile.getAbsoluteFile().toString().endsWith(".3gp")) || (localFile.getAbsoluteFile().toString().endsWith(".3gpp")))
        {
          if (paramUri.toString().contains("/audio/"))
          {
            localJSONObject.put("type", "audio/3gpp");
            localJSONObject.put("lastModifiedDate", localFile.lastModified());
            localJSONObject.put("size", localFile.length());
            return localJSONObject;
          }
          localJSONObject.put("type", "video/3gpp");
          continue;
        }
        localJSONObject.put("type", FileHelper.getMimeType(Uri.fromFile(localFile), this.cordova));
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return localJSONObject;
      }
    }
  }
  
  private JSONObject getAudioVideoData(String paramString, JSONObject paramJSONObject, boolean paramBoolean)
    throws JSONException
  {
    MediaPlayer localMediaPlayer = new MediaPlayer();
    try
    {
      localMediaPlayer.setDataSource(paramString);
      localMediaPlayer.prepare();
      paramJSONObject.put("duration", localMediaPlayer.getDuration() / 1000);
      if (paramBoolean)
      {
        paramJSONObject.put("height", localMediaPlayer.getVideoHeight());
        paramJSONObject.put("width", localMediaPlayer.getVideoWidth());
      }
      return paramJSONObject;
    }
    catch (IOException localIOException)
    {
      Log.d("Capture", "Error: loading video file");
    }
    return paramJSONObject;
  }
  
  private JSONObject getFormatData(String paramString1, String paramString2)
    throws JSONException
  {
    Uri localUri;
    JSONObject localJSONObject;
    if (paramString1.startsWith("file:"))
    {
      localUri = Uri.parse(paramString1);
      localJSONObject = new JSONObject();
      localJSONObject.put("height", 0);
      localJSONObject.put("width", 0);
      localJSONObject.put("bitrate", 0);
      localJSONObject.put("duration", 0);
      localJSONObject.put("codecs", "");
      if ((paramString2 == null) || (paramString2.equals("")) || ("null".equals(paramString2))) {
        paramString2 = FileHelper.getMimeType(localUri, this.cordova);
      }
      Log.d("Capture", "Mime type = " + paramString2);
      if ((!paramString2.equals("image/jpeg")) && (!paramString1.endsWith(".jpg"))) {
        break label181;
      }
      localJSONObject = getImageData(localUri, localJSONObject);
    }
    label181:
    do
    {
      return localJSONObject;
      localUri = Uri.fromFile(new File(paramString1));
      break;
      if (paramString2.endsWith("audio/3gpp")) {
        return getAudioVideoData(paramString1, localJSONObject, false);
      }
    } while ((!paramString2.equals("video/3gpp")) && (!paramString2.equals("video/mp4")));
    return getAudioVideoData(paramString1, localJSONObject, true);
  }
  
  private JSONObject getImageData(Uri paramUri, JSONObject paramJSONObject)
    throws JSONException
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inJustDecodeBounds = true;
    BitmapFactory.decodeFile(paramUri.getPath(), localOptions);
    paramJSONObject.put("height", localOptions.outHeight);
    paramJSONObject.put("width", localOptions.outWidth);
    return paramJSONObject;
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
  
  private Cursor queryImgDB(Uri paramUri)
  {
    return this.cordova.getActivity().getContentResolver().query(paramUri, new String[] { "_id" }, null, null, null);
  }
  
  private Uri whichContentStore()
  {
    if (Environment.getExternalStorageState().equals("mounted")) {
      return MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
    }
    return MediaStore.Images.Media.INTERNAL_CONTENT_URI;
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    this.callbackContext = paramCallbackContext;
    this.limit = 1L;
    this.duration = 0;
    this.results = new JSONArray();
    JSONObject localJSONObject = paramJSONArray.optJSONObject(0);
    if (localJSONObject != null)
    {
      this.limit = localJSONObject.optLong("limit", 1L);
      this.duration = localJSONObject.optInt("duration", 0);
    }
    if (paramString.equals("getFormatData"))
    {
      paramCallbackContext.success(getFormatData(paramJSONArray.getString(0), paramJSONArray.getString(1)));
      return true;
    }
    if (paramString.equals("captureAudio"))
    {
      captureAudio();
      return true;
    }
    if (paramString.equals("captureImage"))
    {
      captureImage();
      return true;
    }
    if (paramString.equals("captureVideo"))
    {
      captureVideo(this.duration);
      return true;
    }
    return false;
  }
  
  public void fail(JSONObject paramJSONObject)
  {
    this.callbackContext.error(paramJSONObject);
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, final Intent paramIntent)
  {
    if (paramInt2 == -1)
    {
      if (paramInt1 == 0)
      {
        Runnable local1 = new Runnable()
        {
          public void run()
          {
            Uri localUri = paramIntent.getData();
            Capture.this.results.put(Capture.this.createMediaFile(localUri));
            if (Capture.this.results.length() >= Capture.this.limit)
            {
              jdField_this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, Capture.this.results));
              return;
            }
            Capture.this.captureAudio();
          }
        };
        this.cordova.getThreadPool().execute(local1);
      }
      do
      {
        return;
        if (paramInt1 == 1)
        {
          Runnable local2 = new Runnable()
          {
            public void run()
            {
              ContentValues localContentValues;
              Object localObject;
              try
              {
                localContentValues = new ContentValues();
                localContentValues.put("mime_type", "image/jpeg");
              }
              catch (IOException localIOException)
              {
                Uri localUri2;
                byte[] arrayOfByte;
                localIOException.printStackTrace();
                jdField_this.fail(Capture.this.createErrorObject(0, "Error capturing image."));
                return;
              }
              try
              {
                localUri2 = jdField_this.cordova.getActivity().getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, localContentValues);
                localObject = localUri2;
              }
              catch (UnsupportedOperationException localUnsupportedOperationException1)
              {
                LOG.d("Capture", "Can't write to external media storage.");
                try
                {
                  Uri localUri1 = jdField_this.cordova.getActivity().getContentResolver().insert(MediaStore.Images.Media.INTERNAL_CONTENT_URI, localContentValues);
                  localObject = localUri1;
                }
                catch (UnsupportedOperationException localUnsupportedOperationException2)
                {
                  LOG.d("Capture", "Can't write to internal media storage.");
                  jdField_this.fail(Capture.this.createErrorObject(0, "Error capturing image - no media storage found."));
                  return;
                }
                localOutputStream.flush();
                localOutputStream.close();
                localFileInputStream.close();
                Capture.this.results.put(Capture.this.createMediaFile((Uri)localObject));
                Capture.this.checkForDuplicateImage();
                if (Capture.this.results.length() < Capture.this.limit) {
                  break label316;
                }
                jdField_this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, Capture.this.results));
                return;
                Capture.this.captureImage();
              }
              FileInputStream localFileInputStream = new FileInputStream(Capture.this.getTempDirectoryPath() + "/Capture.jpg");
              OutputStream localOutputStream = jdField_this.cordova.getActivity().getContentResolver().openOutputStream((Uri)localObject);
              arrayOfByte = new byte['က'];
              for (;;)
              {
                int i = localFileInputStream.read(arrayOfByte);
                if (i == -1) {
                  break;
                }
                localOutputStream.write(arrayOfByte, 0, i);
              }
              label316:
            }
          };
          this.cordova.getThreadPool().execute(local2);
          return;
        }
      } while (paramInt1 != 2);
      Runnable local3 = new Runnable()
      {
        public void run()
        {
          Uri localUri = paramIntent.getData();
          if (localUri == null)
          {
            jdField_this.fail(Capture.this.createErrorObject(3, "Error: data is null"));
            return;
          }
          Capture.this.results.put(Capture.this.createMediaFile(localUri));
          if (Capture.this.results.length() >= Capture.this.limit)
          {
            jdField_this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, Capture.this.results));
            return;
          }
          Capture.this.captureVideo(Capture.this.duration);
        }
      };
      this.cordova.getThreadPool().execute(local3);
      return;
    }
    if (paramInt2 == 0)
    {
      if (this.results.length() > 0)
      {
        this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, this.results));
        return;
      }
      fail(createErrorObject(3, "Canceled."));
      return;
    }
    if (this.results.length() > 0)
    {
      this.callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, this.results));
      return;
    }
    fail(createErrorObject(3, "Did not complete!"));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/mediacapture/Capture.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */