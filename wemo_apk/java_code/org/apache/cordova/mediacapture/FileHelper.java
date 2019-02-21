package org.apache.cordova.mediacapture;

import android.app.Activity;
import android.content.ContentResolver;
import android.net.Uri;
import android.webkit.MimeTypeMap;
import java.util.Locale;
import org.apache.cordova.CordovaInterface;

public class FileHelper
{
  public static String getMimeType(Uri paramUri, CordovaInterface paramCordovaInterface)
  {
    if ("content".equals(paramUri.getScheme())) {
      return paramCordovaInterface.getActivity().getContentResolver().getType(paramUri);
    }
    return getMimeTypeForExtension(paramUri.getPath());
  }
  
  public static String getMimeTypeForExtension(String paramString)
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
    return MimeTypeMap.getSingleton().getMimeTypeFromExtension(str2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/mediacapture/FileHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */