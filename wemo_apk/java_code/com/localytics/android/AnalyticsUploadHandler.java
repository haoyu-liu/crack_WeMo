package com.localytics.android;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

final class AnalyticsUploadHandler
  extends BaseUploadThread
{
  private static final String ANALYTICS_URL_HTTP = "http://%s/api/v2/applications/%s/uploads";
  private static final String ANALYTICS_URL_HTTPS = "https://%s/api/v2/uploads";
  
  AnalyticsUploadHandler(BaseHandler paramBaseHandler, TreeMap<Integer, Object> paramTreeMap, String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramBaseHandler, paramTreeMap, paramString, paramLocalyticsDao);
  }
  
  int uploadData()
  {
    try
    {
      boolean bool1 = this.mData.isEmpty();
      i = 0;
      if (!bool1)
      {
        Iterator localIterator = this.mData.entrySet().iterator();
        StringBuilder localStringBuilder = new StringBuilder();
        String str1 = getApiKey();
        while (localIterator.hasNext())
        {
          localStringBuilder.append(((Map.Entry)localIterator.next()).getValue());
          localStringBuilder.append('\n');
        }
        BaseUploadThread.UploadType localUploadType = BaseUploadThread.UploadType.ANALYTICS;
        Object[] arrayOfObject2;
        if (Constants.USE_HTTPS)
        {
          arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = Constants.ANALYTICS_HOST;
        }
        String str2;
        for (Object localObject2 = String.format("https://%s/api/v2/uploads", arrayOfObject2);; localObject2 = str2)
        {
          boolean bool2 = upload(localUploadType, (String)localObject2, localStringBuilder.toString(), 0);
          i = 0;
          if (!bool2) {
            break;
          }
          i = ((Integer)this.mData.lastKey()).intValue();
          break;
          Object[] arrayOfObject1 = new Object[2];
          arrayOfObject1[0] = Constants.ANALYTICS_HOST;
          arrayOfObject1[1] = str1;
          str2 = String.format("http://%s/api/v2/applications/%s/uploads", arrayOfObject1);
        }
      }
    }
    finally
    {
      return 0;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/AnalyticsUploadHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */