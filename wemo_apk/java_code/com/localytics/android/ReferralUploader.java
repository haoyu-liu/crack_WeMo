package com.localytics.android;

final class ReferralUploader
  extends BaseUploadThread
{
  private static final String ANALYTICS_URL_HTTP = "http://%s/api/v2/applications/%s/uploads";
  private static final String ANALYTICS_URL_HTTPS = "https://%s/api/v2/uploads";
  private String mFirstSessionEvent;
  
  ReferralUploader(AnalyticsHandler paramAnalyticsHandler, String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramAnalyticsHandler, null, paramLocalyticsDao.getCustomerIdInMemory(), paramLocalyticsDao);
    this.mFirstSessionEvent = paramString;
  }
  
  public void run()
  {
    uploadData();
  }
  
  int uploadData()
  {
    String str1;
    Object[] arrayOfObject2;
    if (!this.mFirstSessionEvent.isEmpty())
    {
      Localytics.Log.i("[REFERRAL] reupload first session: " + this.mFirstSessionEvent);
      str1 = getApiKey();
      if (!Constants.USE_HTTPS) {
        break label87;
      }
      arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Constants.ANALYTICS_HOST;
    }
    label87:
    Object[] arrayOfObject1;
    for (String str2 = String.format("https://%s/api/v2/uploads", arrayOfObject2);; str2 = String.format("http://%s/api/v2/applications/%s/uploads", arrayOfObject1))
    {
      upload(BaseUploadThread.UploadType.ANALYTICS, str2, this.mFirstSessionEvent, 0, true);
      return 0;
      arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = Constants.ANALYTICS_HOST;
      arrayOfObject1[1] = str1;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ReferralUploader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */