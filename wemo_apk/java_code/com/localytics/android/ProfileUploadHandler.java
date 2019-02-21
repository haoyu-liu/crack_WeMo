package com.localytics.android;

import android.net.Uri.Builder;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

final class ProfileUploadHandler
  extends BaseUploadThread
{
  private static final String PROFILE_URL = "v1/apps/%s/profiles";
  
  ProfileUploadHandler(BaseHandler paramBaseHandler, TreeMap<Integer, Object> paramTreeMap, String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramBaseHandler, paramTreeMap, paramString, paramLocalyticsDao);
  }
  
  int uploadData()
  {
    try
    {
      boolean bool1 = this.mData.isEmpty();
      int i = 0;
      if (!bool1)
      {
        Iterator localIterator = this.mData.entrySet().iterator();
        StringBuilder localStringBuilder = new StringBuilder();
        String str1 = getApiKey();
        String str2 = null;
        while (localIterator.hasNext())
        {
          Object[] arrayOfObject = (Object[])((Map.Entry)localIterator.next()).getValue();
          if (localStringBuilder.length() == 0)
          {
            str2 = (String)arrayOfObject[0];
            localStringBuilder.append('{').append('"').append("customer_id").append('"').append(':').append('"').append(str2).append('"').append(',').append('"').append("database").append('"').append(':').append('"').append((String)arrayOfObject[1]).append('"').append(',').append('"').append("changes").append('"').append(':').append('[');
          }
          localStringBuilder.append((String)arrayOfObject[2]);
          if (localIterator.hasNext()) {
            localStringBuilder.append(',');
          }
        }
        localStringBuilder.append("]}");
        String str3 = new Uri.Builder().scheme("https").authority(Constants.PROFILES_HOST).encodedPath(String.format("v1/apps/%s/profiles", new Object[] { str1 })).appendPath(str2).toString();
        boolean bool2 = upload(BaseUploadThread.UploadType.PROFILES, str3, localStringBuilder.toString(), 0);
        i = 0;
        if (bool2)
        {
          int j = ((Integer)this.mData.lastKey()).intValue();
          i = j;
        }
      }
      return i;
    }
    finally {}
    return 0;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ProfileUploadHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */