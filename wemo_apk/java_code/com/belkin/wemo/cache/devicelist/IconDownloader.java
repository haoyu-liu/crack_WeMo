package com.belkin.wemo.cache.devicelist;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import java.net.HttpURLConnection;
import java.net.URL;

public class IconDownloader
  extends AsyncTask<Object, Void, Void>
{
  private String devUDN = null;
  private Context mContext = null;
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    try
    {
      this.mContext = ((Context)paramVarArgs[2]);
      String str = (String)paramVarArgs[0];
      if (!str.startsWith("http://")) {
        str = "http://" + str;
      }
      URL localURL = new URL(str);
      this.devUDN = ((String)paramVarArgs[1]);
      HttpURLConnection localHttpURLConnection = (HttpURLConnection)localURL.openConnection();
      localHttpURLConnection.setRequestMethod("GET");
      if (localURL.getHost() != null) {
        localHttpURLConnection.setRequestProperty("HOST", localURL.getHost());
      }
      Bitmap localBitmap = BitmapFactory.decodeStream(localHttpURLConnection.getInputStream());
      DeviceListManager localDeviceListManager = DeviceListManager.getInstance(this.mContext);
      if (localDeviceListManager != null) {
        localDeviceListManager.updateIconFile(this.devUDN, localBitmap);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Log.e(getClass().getName(), "Downloading the logo is unsuccessful");
      }
    }
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/IconDownloader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */