package com.localytics.android;

import android.annotation.TargetApi;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.NotificationCompat.BigTextStyle;
import android.support.v4.app.NotificationCompat.Builder;
import android.text.TextUtils;
import android.util.SparseArray;
import android.widget.Toast;
import java.io.File;
import java.io.FileNotFoundException;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;
import java.util.Vector;
import java.util.concurrent.Callable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class MarketingHandler
  extends BaseHandler
  implements AnalyticsListener
{
  private static final String AB_ATTRIBUTE = "ab";
  private static final String ACTION_ATTRIBUTE = "Action";
  private static final String APP_CONTEXT_ATTRIBUTE = "App Context";
  private static final List<Map<String, String>> AUGMENTED_BLACKOUT_TIMES_RULE;
  private static final List<Integer> AUGMENTED_BLACKOUT_WEEKDAYS_RULE;
  private static final String CAMPAIGN_ID_ATTRIBUTE = "Campaign ID";
  private static final String CREATIVE_DISPLAYED_ATTRIBUTE = "Creative Displayed";
  private static final String CREATIVE_ID_ATTRIBUTE = "Creative ID";
  private static final String CREATIVE_TYPE_ATTRIBUTE = "Creative Type";
  private static final SimpleDateFormat DATE_SDF;
  private static final Map<String, Integer> DEFAULT_FREQUENCY_CAPPING_RULE;
  private static final int GLOBAL_FREQUENCY_CAPPING_RULE_CAMPAIGN_ID = -1;
  private static final String[] GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS;
  private static final String[] INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS;
  private static final List JS_STRINGS_THAT_MEAN_NULL;
  private static final int MESSAGE_HANDLE_PUSH_RECEIVED = 204;
  private static final int MESSAGE_MARKETING_MESSAGE_TRIGGER = 201;
  private static final int MESSAGE_SET_MARKETING_MESSAGE_AS_NOT_DISPLAYED = 205;
  private static final int MESSAGE_SHOW_MARKETING_TEST = 203;
  private static final String[] PROJECTION_MARKETING_RULE_RECORD = { "_id", "version" };
  private static final String PUSH_API_URL_TEMPLATE = "http://pushapi.localytics.com/push_test?platform=android&type=prod&campaign=%s&creative=%s&token=%s&install_id=%s&client_ts=%s";
  private static final String PUSH_NOTIFICATIONS_ENABLED_ATTRIBUTE = "Push Notifications Enabled";
  private static final String PUSH_OPENED_EVENT = "Localytics Push Opened";
  private static final String PUSH_RECEIVED_EVENT = "Localytics Push Received";
  private static final SimpleDateFormat TIME_SDF;
  private int lastMarketingMessagesHash = -1;
  private boolean mCampaignDisplaying = false;
  Map<String, Object> mConfigurations;
  private FragmentManager mFragmentManager;
  private boolean sessionStartMarketingMessageShown = true;
  private MarketingRulesAdapter testCampaignsListAdapter = null;
  
  static
  {
    JS_STRINGS_THAT_MEAN_NULL = Arrays.asList(new String[] { "undefined", "null", "nil", "\"\"", "''" });
    String[] arrayOfString1 = new String[1];
    arrayOfString1[0] = Constants.DISPLAY_FREQUENCIES_KEY;
    GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS = arrayOfString1;
    String[] arrayOfString2 = new String[2];
    arrayOfString2[0] = Constants.MAX_DISPLAY_COUNT_KEY;
    arrayOfString2[1] = Constants.IGNORE_GLOBAL_KEY;
    INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS = arrayOfString2;
    TIME_SDF = new SimpleDateFormat("HH:mm");
    DATE_SDF = new SimpleDateFormat("yyyy-MM-dd");
    AUGMENTED_BLACKOUT_TIMES_RULE = new ArrayList();
    HashMap localHashMap = new HashMap();
    localHashMap.put("start", "00:00");
    localHashMap.put("end", "23:59");
    AUGMENTED_BLACKOUT_TIMES_RULE.add(localHashMap);
    Integer[] arrayOfInteger = new Integer[7];
    arrayOfInteger[0] = Integer.valueOf(0);
    arrayOfInteger[1] = Integer.valueOf(1);
    arrayOfInteger[2] = Integer.valueOf(2);
    arrayOfInteger[3] = Integer.valueOf(3);
    arrayOfInteger[4] = Integer.valueOf(4);
    arrayOfInteger[5] = Integer.valueOf(5);
    arrayOfInteger[6] = Integer.valueOf(6);
    AUGMENTED_BLACKOUT_WEEKDAYS_RULE = Arrays.asList(arrayOfInteger);
    DEFAULT_FREQUENCY_CAPPING_RULE = new HashMap();
    DEFAULT_FREQUENCY_CAPPING_RULE.put("max_display_count", Integer.valueOf(1));
    DEFAULT_FREQUENCY_CAPPING_RULE.put("ignore_global", Integer.valueOf(1));
    TIME_SDF.setLenient(false);
    DATE_SDF.setLenient(false);
  }
  
  MarketingHandler(LocalyticsDao paramLocalyticsDao, Looper paramLooper, Context paramContext)
  {
    super(paramLocalyticsDao, paramLooper);
    this.siloName = "In-app";
    this.listeners = new MessagingListenersSet(null);
    this.doesRetry = false;
    _createLocalyticsDirectory(paramContext);
    queueMessage(obtainMessage(1));
  }
  
  private void __showMarketingTest()
  {
    if (this.mFragmentManager == null) {}
    while ((this.mFragmentManager.findFragmentByTag("marketing_test_mode_button") != null) || (this.mFragmentManager.findFragmentByTag("marketing_test_mode_list") != null)) {
      return;
    }
    final TestModeButton localTestModeButton = TestModeButton.newInstance();
    final TestModeListView localTestModeListView = TestModeListView.newInstance();
    final Context localContext = this.mLocalyticsDao.getAppContext();
    final MarketingRulesAdapter localMarketingRulesAdapter = new MarketingRulesAdapter(localContext, this);
    localTestModeListView.setAdapter(localMarketingRulesAdapter);
    TreeMap localTreeMap1 = new TreeMap();
    localTreeMap1.put(Integer.valueOf(9), new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        localMarketingRulesAdapter.updateDataSet();
        localTestModeListView.show(MarketingHandler.this.mFragmentManager, "marketing_test_mode_list");
        MarketingHandler.this.mFragmentManager.executePendingTransactions();
        return null;
      }
    });
    localTestModeButton.setCallbacks(localTreeMap1);
    localTestModeButton.show(this.mFragmentManager, "marketing_test_mode_button");
    this.mFragmentManager.executePendingTransactions();
    TreeMap localTreeMap2 = new TreeMap();
    localTreeMap2.put(Integer.valueOf(10), new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        localTestModeButton.show(MarketingHandler.this.mFragmentManager, "marketing_test_mode_button");
        MarketingHandler.this.mFragmentManager.executePendingTransactions();
        return null;
      }
    });
    localTreeMap2.put(Integer.valueOf(12), new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        MarketingHandler.this.mLocalyticsDao.tagEvent("Test Mode Update Data");
        MarketingHandler.access$602(MarketingHandler.this, localMarketingRulesAdapter);
        MarketingHandler.this.upload(MarketingHandler.this.mLocalyticsDao.getCustomerIdInMemory());
        return null;
      }
    });
    localTreeMap2.put(Integer.valueOf(13), new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        new AsyncTask()
        {
          protected String doInBackground(Void... paramAnonymous2VarArgs)
          {
            return MarketingHandler.this.mLocalyticsDao.getPushRegistrationId();
          }
          
          @TargetApi(11)
          protected void onPostExecute(String paramAnonymous2String)
          {
            if (!TextUtils.isEmpty(paramAnonymous2String))
            {
              if (DatapointHelper.getApiLevel() < 11) {
                ((android.text.ClipboardManager)MarketingHandler.13.this.val$appContext.getSystemService("clipboard")).setText(paramAnonymous2String);
              }
              for (;;)
              {
                Toast.makeText(MarketingHandler.13.this.val$appContext, paramAnonymous2String + " has been copied to the clipboard.", 1).show();
                return;
                ((android.content.ClipboardManager)MarketingHandler.13.this.val$appContext.getSystemService("clipboard")).setText(paramAnonymous2String);
              }
            }
            Toast.makeText(MarketingHandler.13.this.val$appContext, "No push token found. Please check your integration.", 1).show();
          }
        }.execute(new Void[0]);
        return null;
      }
    });
    localTreeMap2.put(Integer.valueOf(14), new MarketingCallable()
    {
      @TargetApi(11)
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        String str = MarketingHandler.this.mLocalyticsDao.getInstallationId();
        if (!TextUtils.isEmpty(str)) {
          if (DatapointHelper.getApiLevel() < 11)
          {
            ((android.text.ClipboardManager)localContext.getSystemService("clipboard")).setText(str);
            Toast.makeText(localContext, str + " has been copied to the clipboard.", 1).show();
          }
        }
        for (;;)
        {
          return null;
          ((android.content.ClipboardManager)localContext.getSystemService("clipboard")).setText(str);
          break;
          Toast.makeText(localContext, "No install id found. Please check your integration.", 1).show();
        }
      }
    });
    localTreeMap2.put(Integer.valueOf(11), new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        final MarketingMessage localMarketingMessage = (MarketingMessage)paramAnonymousArrayOfObject[0];
        new AsyncTask()
        {
          protected Object[] doInBackground(MarketingMessage... paramAnonymous2VarArgs)
          {
            Object[] arrayOfObject = new Object[2];
            if (MarketingHandler.this._updateDisplayingCandidate(paramAnonymous2VarArgs[0])) {}
            for (MarketingMessage localMarketingMessage = paramAnonymous2VarArgs[0];; localMarketingMessage = null)
            {
              arrayOfObject[0] = localMarketingMessage;
              arrayOfObject[1] = MarketingHandler.this._getJavaScriptClientCallbacks(null);
              return arrayOfObject;
            }
          }
          
          protected void onPostExecute(Object[] paramAnonymous2ArrayOfObject)
          {
            MarketingMessage localMarketingMessage = (MarketingMessage)paramAnonymous2ArrayOfObject[0];
            SparseArray localSparseArray = (SparseArray)paramAnonymous2ArrayOfObject[1];
            if (localMarketingMessage == null) {}
            try
            {
              Toast.makeText(MarketingHandler.15.this.val$appContext, "The downloaded campaign file is broken.", 0).show();
              return;
            }
            catch (Exception localException)
            {
              MarketingDialogFragment localMarketingDialogFragment;
              LocalyticsManager.throwOrLogError(RuntimeException.class, "Localytics library threw an uncaught exception", localException);
            }
            if ((MarketingHandler.this.mFragmentManager != null) && (MarketingHandler.this.mFragmentManager.findFragmentByTag("marketing_dialog" + localMarketingMessage.get("campaign_id")) == null))
            {
              localMarketingDialogFragment = MarketingDialogFragment.newInstance();
              localMarketingDialogFragment.setRetainInstance(false);
              localMarketingDialogFragment.setData(localMarketingMessage).setCallbacks(MarketingHandler.this.getDialogCallbacks()).setJavaScriptClient(new JavaScriptClient(localSparseArray)).show(MarketingHandler.this.mFragmentManager, "marketing_dialog" + localMarketingMessage.get("campaign_id"));
              MarketingHandler.this.mFragmentManager.executePendingTransactions();
              return;
            }
          }
          
          protected void onPreExecute()
          {
            int i = ((Integer)localMarketingMessage.get("_id")).intValue();
            boolean bool = MarketingHandler.this._getRemoteFileURL(localMarketingMessage).endsWith(".zip");
            if (!MarketingHandler.this._doesCreativeExist(i, bool)) {
              Toast.makeText(MarketingHandler.15.this.val$appContext, "Downloading the campaign...\nIt'll be shown in few seconds.", 0).show();
            }
          }
        }.execute(new MarketingMessage[] { localMarketingMessage });
        return null;
      }
    });
    localTestModeListView.setCallbacks(localTreeMap2);
  }
  
  private void _bindRuleToEvents(long paramLong, List<String> paramList)
  {
    BaseProvider localBaseProvider = this.mProvider;
    String str1 = String.format("%s = ?", new Object[] { "rule_id_ref" });
    String[] arrayOfString = new String[1];
    arrayOfString[0] = Long.toString(paramLong);
    localBaseProvider.remove("marketing_ruleevent", str1, arrayOfString);
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      String str2 = (String)localIterator.next();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("event_name", str2);
      localContentValues.put("rule_id_ref", Long.valueOf(paramLong));
      this.mProvider.insert("marketing_ruleevent", localContentValues);
    }
  }
  
  private boolean _createLocalyticsDirectory(Context paramContext)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContext.getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    File localFile = new File(localStringBuilder.toString());
    return (localFile.mkdirs()) || (localFile.isDirectory());
  }
  
  /* Error */
  private boolean _decompressZipFile(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: new 410	java/util/zip/ZipInputStream
    //   6: dup
    //   7: new 412	java/io/FileInputStream
    //   10: dup
    //   11: new 373	java/lang/StringBuilder
    //   14: dup
    //   15: invokespecial 374	java/lang/StringBuilder:<init>	()V
    //   18: aload_1
    //   19: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: getstatic 393	java/io/File:separator	Ljava/lang/String;
    //   25: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   28: aload_3
    //   29: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   32: invokevirtual 397	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   35: invokespecial 413	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   38: invokespecial 416	java/util/zip/ZipInputStream:<init>	(Ljava/io/InputStream;)V
    //   41: astore 5
    //   43: sipush 8192
    //   46: newarray <illegal type>
    //   48: astore 13
    //   50: aload 5
    //   52: invokevirtual 420	java/util/zip/ZipInputStream:getNextEntry	()Ljava/util/zip/ZipEntry;
    //   55: astore 14
    //   57: aload 14
    //   59: ifnull +179 -> 238
    //   62: new 373	java/lang/StringBuilder
    //   65: dup
    //   66: invokespecial 374	java/lang/StringBuilder:<init>	()V
    //   69: aload_2
    //   70: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: getstatic 393	java/io/File:separator	Ljava/lang/String;
    //   76: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: aload 14
    //   81: invokevirtual 425	java/util/zip/ZipEntry:getName	()Ljava/lang/String;
    //   84: invokevirtual 390	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: invokevirtual 397	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   90: astore 15
    //   92: aload 14
    //   94: invokevirtual 426	java/util/zip/ZipEntry:isDirectory	()Z
    //   97: ifeq +67 -> 164
    //   100: new 382	java/io/File
    //   103: dup
    //   104: aload 15
    //   106: invokespecial 398	java/io/File:<init>	(Ljava/lang/String;)V
    //   109: invokevirtual 429	java/io/File:mkdir	()Z
    //   112: ifne -62 -> 50
    //   115: ldc_w 431
    //   118: iconst_1
    //   119: anewarray 320	java/lang/Object
    //   122: dup
    //   123: iconst_0
    //   124: aload 15
    //   126: aastore
    //   127: invokestatic 326	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   130: invokestatic 437	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;)I
    //   133: pop
    //   134: goto -84 -> 50
    //   137: astore 9
    //   139: aload 5
    //   141: astore 4
    //   143: ldc_w 439
    //   146: aload 9
    //   148: invokestatic 442	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   151: pop
    //   152: aload 4
    //   154: ifnull +8 -> 162
    //   157: aload 4
    //   159: invokevirtual 445	java/util/zip/ZipInputStream:close	()V
    //   162: iconst_0
    //   163: ireturn
    //   164: new 447	java/io/FileOutputStream
    //   167: dup
    //   168: aload 15
    //   170: invokespecial 448	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   173: astore 16
    //   175: aload 5
    //   177: aload 13
    //   179: iconst_0
    //   180: aload 13
    //   182: arraylength
    //   183: invokevirtual 452	java/util/zip/ZipInputStream:read	([BII)I
    //   186: istore 17
    //   188: iload 17
    //   190: ifle +35 -> 225
    //   193: aload 16
    //   195: aload 13
    //   197: iconst_0
    //   198: iload 17
    //   200: invokevirtual 456	java/io/FileOutputStream:write	([BII)V
    //   203: goto -28 -> 175
    //   206: astore 6
    //   208: aload 5
    //   210: astore 4
    //   212: aload 4
    //   214: ifnull +8 -> 222
    //   217: aload 4
    //   219: invokevirtual 445	java/util/zip/ZipInputStream:close	()V
    //   222: aload 6
    //   224: athrow
    //   225: aload 16
    //   227: invokevirtual 457	java/io/FileOutputStream:close	()V
    //   230: aload 5
    //   232: invokevirtual 460	java/util/zip/ZipInputStream:closeEntry	()V
    //   235: goto -185 -> 50
    //   238: aload 5
    //   240: ifnull +62 -> 302
    //   243: aload 5
    //   245: invokevirtual 445	java/util/zip/ZipInputStream:close	()V
    //   248: iconst_1
    //   249: ireturn
    //   250: astore 19
    //   252: ldc_w 439
    //   255: aload 19
    //   257: invokestatic 442	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   260: pop
    //   261: iconst_0
    //   262: ireturn
    //   263: astore 11
    //   265: ldc_w 439
    //   268: aload 11
    //   270: invokestatic 442	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   273: pop
    //   274: iconst_0
    //   275: ireturn
    //   276: astore 7
    //   278: ldc_w 439
    //   281: aload 7
    //   283: invokestatic 442	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   286: pop
    //   287: iconst_0
    //   288: ireturn
    //   289: astore 6
    //   291: goto -79 -> 212
    //   294: astore 9
    //   296: aconst_null
    //   297: astore 4
    //   299: goto -156 -> 143
    //   302: goto -54 -> 248
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	305	0	this	MarketingHandler
    //   0	305	1	paramString1	String
    //   0	305	2	paramString2	String
    //   0	305	3	paramString3	String
    //   1	297	4	localObject1	Object
    //   41	203	5	localZipInputStream	java.util.zip.ZipInputStream
    //   206	17	6	localObject2	Object
    //   289	1	6	localObject3	Object
    //   276	6	7	localIOException1	java.io.IOException
    //   137	10	9	localIOException2	java.io.IOException
    //   294	1	9	localIOException3	java.io.IOException
    //   263	6	11	localIOException4	java.io.IOException
    //   48	148	13	arrayOfByte	byte[]
    //   55	38	14	localZipEntry	java.util.zip.ZipEntry
    //   90	79	15	str	String
    //   173	53	16	localFileOutputStream	java.io.FileOutputStream
    //   186	13	17	i	int
    //   250	6	19	localIOException5	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   43	50	137	java/io/IOException
    //   50	57	137	java/io/IOException
    //   62	134	137	java/io/IOException
    //   164	175	137	java/io/IOException
    //   175	188	137	java/io/IOException
    //   193	203	137	java/io/IOException
    //   225	235	137	java/io/IOException
    //   43	50	206	finally
    //   50	57	206	finally
    //   62	134	206	finally
    //   164	175	206	finally
    //   175	188	206	finally
    //   193	203	206	finally
    //   225	235	206	finally
    //   243	248	250	java/io/IOException
    //   157	162	263	java/io/IOException
    //   217	222	276	java/io/IOException
    //   3	43	289	finally
    //   143	152	289	finally
    //   3	43	294	java/io/IOException
  }
  
  private void _destroyLocalMarketingMessage(MarketingMessage paramMarketingMessage)
  {
    try
    {
      int i = _getRuleIdFromCampaignId(((Integer)paramMarketingMessage.get("campaign_id")).intValue());
      for (long l : _getConditionIdFromRuleId(i))
      {
        BaseProvider localBaseProvider1 = this.mProvider;
        String str1 = String.format("%s = ?", new Object[] { "condition_id_ref" });
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = Long.toString(l);
        localBaseProvider1.remove("marketing_condition_values", str1, arrayOfString1);
      }
      BaseProvider localBaseProvider2 = this.mProvider;
      String str2 = String.format("%s = ?", new Object[] { "rule_id_ref" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Integer.toString(i);
      localBaseProvider2.remove("marketing_conditions", str2, arrayOfString2);
      BaseProvider localBaseProvider3 = this.mProvider;
      String str3 = String.format("%s = ?", new Object[] { "rule_id_ref" });
      String[] arrayOfString3 = new String[1];
      arrayOfString3[0] = Integer.toString(i);
      localBaseProvider3.remove("marketing_ruleevent", str3, arrayOfString3);
      BaseProvider localBaseProvider4 = this.mProvider;
      String str4 = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString4 = new String[1];
      arrayOfString4[0] = Integer.toString(i);
      localBaseProvider4.remove("marketing_rules", str4, arrayOfString4);
      String str5 = (String)paramMarketingMessage.get("base_path");
      if (str5 != null)
      {
        File localFile1 = new File(str5);
        if (localFile1.isDirectory()) {
          for (String str6 : localFile1.list())
          {
            File localFile2 = new File(localFile1, str6);
            localFile2.delete();
          }
        }
        if (!localFile1.delete()) {
          Localytics.Log.w(String.format("Delete %s failed.", new Object[] { str5 }));
        }
        if (!new File(str5 + ".zip").delete())
        {
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = (str5 + ".zip");
          Localytics.Log.w(String.format("Delete %s failed.", arrayOfObject));
        }
      }
      return;
    }
    catch (Exception localException)
    {
      LocalyticsManager.throwOrLogError(RuntimeException.class, "Localytics library threw an uncaught exception", localException);
    }
  }
  
  private boolean _doesCreativeExist(int paramInt, boolean paramBoolean)
  {
    StringBuilder localStringBuilder;
    Object[] arrayOfObject;
    if (paramBoolean)
    {
      localStringBuilder = new StringBuilder().append(_getZipFileDirPath()).append(File.separator);
      arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
    }
    for (File localFile = new File(String.format("amp_rule_%d.zip", arrayOfObject));; localFile = new File(_getUnzipFileDirPath(paramInt) + File.separator + "index.html")) {
      return localFile.exists();
    }
  }
  
  @NonNull
  private Set<Integer> _getCampaignIdsFromFrequencyCappingQuery(@NonNull String paramString)
  {
    return _getCampaignIdsFromFrequencyCappingQuery(paramString, null);
  }
  
  @NonNull
  private Set<Integer> _getCampaignIdsFromFrequencyCappingQuery(@NonNull String paramString, @Nullable String[] paramArrayOfString)
  {
    HashSet localHashSet = new HashSet();
    if (!TextUtils.isEmpty(paramString))
    {
      Cursor localCursor = null;
      try
      {
        localCursor = this.mProvider.mDb.rawQuery(paramString, paramArrayOfString);
        while (localCursor.moveToNext()) {
          localHashSet.add(Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
        }
        if (localCursor == null) {
          return localHashSet;
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
      localCursor.close();
    }
    return localHashSet;
  }
  
  private long[] _getConditionIdFromRuleId(long paramLong)
  {
    Cursor localCursor = null;
    try
    {
      BaseProvider localBaseProvider = this.mProvider;
      String[] arrayOfString1 = { "_id" };
      String str = String.format("%s = ?", new Object[] { "rule_id_ref" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(paramLong);
      localCursor = localBaseProvider.query("marketing_conditions", arrayOfString1, str, arrayOfString2, null);
      long[] arrayOfLong = new long[localCursor.getCount()];
      int j;
      for (int i = 0; localCursor.moveToNext(); i = j)
      {
        j = i + 1;
        arrayOfLong[i] = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
      }
      return arrayOfLong;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private SparseArray<MarketingCallable> _getJavaScriptClientCallbacks(final Map<String, String> paramMap)
  {
    SparseArray localSparseArray = new SparseArray();
    localSparseArray.put(3, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        String str1 = (String)paramAnonymousArrayOfObject[0];
        String str2 = (String)paramAnonymousArrayOfObject[1];
        String str3 = (String)paramAnonymousArrayOfObject[2];
        long l1 = 0L;
        HashMap localHashMap = new HashMap();
        if (TextUtils.isEmpty(str1)) {
          LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "event cannot be null or empty");
        }
        try
        {
          if ((!TextUtils.isEmpty(str2)) && (!MarketingHandler.JS_STRINGS_THAT_MEAN_NULL.contains(str2)))
          {
            Iterator localIterator3 = JsonHelper.toMap(new JSONObject(str2)).entrySet().iterator();
            while (localIterator3.hasNext())
            {
              Map.Entry localEntry3 = (Map.Entry)localIterator3.next();
              localHashMap.put(localEntry3.getKey(), String.valueOf(localEntry3.getValue()));
            }
          }
          try
          {
            long l2 = Long.valueOf(str3).longValue();
            l1 = l2;
          }
          catch (Exception localException)
          {
            try
            {
              Object[] arrayOfObject;
              Iterator localIterator1;
              while ((TextUtils.isEmpty(str3)) || (MarketingHandler.JS_STRINGS_THAT_MEAN_NULL.contains(str3))) {}
              Iterator localIterator2 = JsonHelper.toMap(new JSONObject(str3)).entrySet().iterator();
              while (localIterator2.hasNext())
              {
                Map.Entry localEntry2 = (Map.Entry)localIterator2.next();
                localHashMap.put(localEntry2.getKey(), String.valueOf(localEntry2.getValue()));
              }
            }
            catch (JSONException localJSONException2) {}
            MarketingHandler.this.mLocalyticsDao.tagEvent(str1, localHashMap, l1);
          }
        }
        catch (JSONException localJSONException1)
        {
          Localytics.Log.w("[JavaScriptClient]: Failed to parse the json object in tagEventNative");
          return null;
        }
        if (str2 != null)
        {
          if (localHashMap.isEmpty()) {
            Localytics.Log.w("attributes is empty.  Did the caller make an error?");
          }
          if (localHashMap.size() > 50)
          {
            arrayOfObject = new Object[2];
            arrayOfObject[0] = Integer.valueOf(localHashMap.size());
            arrayOfObject[1] = Integer.valueOf(50);
            Localytics.Log.w(String.format("attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?", arrayOfObject));
          }
          localIterator1 = localHashMap.entrySet().iterator();
          while (localIterator1.hasNext())
          {
            Map.Entry localEntry1 = (Map.Entry)localIterator1.next();
            String str4 = (String)localEntry1.getKey();
            String str5 = String.valueOf(localEntry1.getValue());
            if (TextUtils.isEmpty(str4)) {
              LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attributes cannot contain null or empty keys");
            }
            if (TextUtils.isEmpty(str5)) {
              LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attributes cannot contain null or empty values");
            }
          }
        }
        return null;
      }
    });
    localSparseArray.put(5, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        if (this.val$customerIDs.isEmpty()) {
          return null;
        }
        try
        {
          JSONObject localJSONObject = new JSONObject();
          Iterator localIterator = this.val$customerIDs.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            localJSONObject.put((String)localEntry.getKey(), localEntry.getValue());
          }
          str = localJSONObject.toString();
        }
        catch (JSONException localJSONException)
        {
          Localytics.Log.w("[JavaScriptClient]: Failed to get identifiers");
          return null;
        }
        String str;
        return str;
      }
    });
    final JSONObject localJSONObject = new JSONObject();
    int i = 0;
    for (;;)
    {
      if (i < 10) {
        try
        {
          localJSONObject.put("c" + i, this.mLocalyticsDao.getCustomDimension(i));
          i++;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            Localytics.Log.w("[JavaScriptClient]: Failed to get custom dimension");
          }
        }
      }
    }
    localSparseArray.put(6, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        return localJSONObject.toString();
      }
    });
    localSparseArray.put(7, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramMap == null) {}
        while (paramMap.size() == 0) {
          return null;
        }
        try
        {
          JSONObject localJSONObject = new JSONObject();
          Iterator localIterator = paramMap.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            localJSONObject.put((String)localEntry.getKey(), (String)localEntry.getValue());
          }
          str = localJSONObject.toString();
        }
        catch (JSONException localJSONException)
        {
          Localytics.Log.w("[JavaScriptClient]: Failed to get attributes");
          return null;
        }
        String str;
        return str;
      }
    });
    localSparseArray.put(8, new MarketingCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        int i = ((Integer)paramAnonymousArrayOfObject[0]).intValue();
        String str = (String)paramAnonymousArrayOfObject[1];
        MarketingHandler.this.mLocalyticsDao.setCustomDimension(i, str);
        return null;
      }
    });
    return localSparseArray;
  }
  
  private Vector<String> _getMarketingConditionValues(int paramInt)
  {
    localObject1 = null;
    for (;;)
    {
      try
      {
        BaseProvider localBaseProvider = this.mProvider;
        String[] arrayOfString1 = { "value" };
        String str1 = String.format("%s = ?", new Object[] { "condition_id_ref" });
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = Integer.toString(paramInt);
        Cursor localCursor = localBaseProvider.query("marketing_condition_values", arrayOfString1, str1, arrayOfString2, null);
        localObject1 = localCursor;
        localObject4 = null;
      }
      finally
      {
        String str2;
        if (localObject1 != null) {
          ((Cursor)localObject1).close();
        }
      }
      try
      {
        if (!((Cursor)localObject1).moveToNext()) {
          continue;
        }
        str2 = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("value"));
        if (localObject4 != null) {
          break label163;
        }
        localObject5 = new Vector();
      }
      finally
      {
        continue;
        localObject5 = localObject4;
        continue;
      }
      ((Vector)localObject5).add(str2);
      localObject4 = localObject5;
    }
    if (localObject1 != null) {
      ((Cursor)localObject1).close();
    }
    return (Vector<String>)localObject4;
  }
  
  private Vector<MarketingCondition> _getMarketingConditions(int paramInt)
  {
    localObject1 = null;
    for (;;)
    {
      try
      {
        BaseProvider localBaseProvider = this.mProvider;
        String str1 = String.format("%s = ?", new Object[] { "rule_id_ref" });
        String[] arrayOfString = new String[1];
        arrayOfString[0] = Integer.toString(paramInt);
        Cursor localCursor = localBaseProvider.query("marketing_conditions", null, str1, arrayOfString, null);
        localObject1 = localCursor;
        localObject4 = null;
      }
      finally
      {
        int i;
        String str2;
        String str3;
        Vector localVector;
        MarketingCondition localMarketingCondition;
        if (localObject1 != null) {
          ((Cursor)localObject1).close();
        }
      }
      try
      {
        if (!((Cursor)localObject1).moveToNext()) {
          continue;
        }
        i = ((Cursor)localObject1).getInt(((Cursor)localObject1).getColumnIndexOrThrow("_id"));
        str2 = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("attribute_name"));
        str3 = ((Cursor)localObject1).getString(((Cursor)localObject1).getColumnIndexOrThrow("operator"));
        localVector = _getMarketingConditionValues(i);
        if (localObject4 != null) {
          break label223;
        }
        localObject5 = new Vector();
      }
      finally
      {
        continue;
        localObject5 = localObject4;
        continue;
      }
      localMarketingCondition = new MarketingCondition(str2, str3, localVector);
      localMarketingCondition.setPackageName(this.mLocalyticsDao.getAppContext().getPackageName());
      ((Vector)localObject5).add(localMarketingCondition);
      localObject4 = localObject5;
    }
    if (localObject1 != null) {
      ((Cursor)localObject1).close();
    }
    return (Vector<MarketingCondition>)localObject4;
  }
  
  private List<MarketingMessage> _getMarketingMessageMaps(String paramString)
  {
    LinkedList localLinkedList = new LinkedList();
    Cursor localCursor = null;
    try
    {
      String str1 = Long.toString(this.mLocalyticsDao.getCurrentTimeMillis() / 1000L);
      String str2 = String.format("SELECT * FROM %s AS r LEFT OUTER JOIN %s AS re ON r.%s=re.%s WHERE %s > ? AND %s = ? GROUP BY r.%s;", new Object[] { "marketing_rules", "marketing_ruleevent", "_id", "rule_id_ref", "expiration", "event_name", "_id" });
      localCursor = this.mProvider.mDb.rawQuery(str2, new String[] { str1, paramString });
      for (int i = 0; i < localCursor.getCount(); i++)
      {
        localCursor.moveToPosition(i);
        MarketingMessage localMarketingMessage = new MarketingMessage();
        localMarketingMessage.put("_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"))));
        localMarketingMessage.put("campaign_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
        localMarketingMessage.put("expiration", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("expiration"))));
        localMarketingMessage.put("display_seconds", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_seconds"))));
        localMarketingMessage.put("display_session", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_session"))));
        localMarketingMessage.put("version", localCursor.getString(localCursor.getColumnIndexOrThrow("version")));
        localMarketingMessage.put("phone_location", localCursor.getString(localCursor.getColumnIndexOrThrow("phone_location")));
        localMarketingMessage.put("phone_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_width"))));
        localMarketingMessage.put("phone_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_height"))));
        localMarketingMessage.put("tablet_location", localCursor.getString(localCursor.getColumnIndexOrThrow("tablet_location")));
        localMarketingMessage.put("tablet_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_width"))));
        localMarketingMessage.put("tablet_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_height"))));
        localMarketingMessage.put("time_to_display", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("time_to_display"))));
        localMarketingMessage.put("internet_required", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("internet_required"))));
        localMarketingMessage.put("ab_test", localCursor.getString(localCursor.getColumnIndexOrThrow("ab_test")));
        localMarketingMessage.put("rule_name_non_unique", localCursor.getString(localCursor.getColumnIndexOrThrow("rule_name_non_unique")));
        localMarketingMessage.put("location", localCursor.getString(localCursor.getColumnIndexOrThrow("location")));
        localMarketingMessage.put("devices", localCursor.getString(localCursor.getColumnIndexOrThrow("devices")));
        localMarketingMessage.put("control_group", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("control_group"))));
        localMarketingMessage.put("schema_version", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("schema_version"))));
        localLinkedList.add(localMarketingMessage);
      }
      return localLinkedList;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private String _getRemoteFileURL(MarketingMessage paramMarketingMessage)
  {
    String str = (String)paramMarketingMessage.get("devices");
    if (str.compareTo("tablet") == 0) {
      return (String)paramMarketingMessage.get("tablet_location");
    }
    if (str.compareTo("both") == 0) {
      return (String)paramMarketingMessage.get("phone_location");
    }
    return (String)paramMarketingMessage.get("phone_location");
  }
  
  private int _getRuleIdFromCampaignId(int paramInt)
  {
    Cursor localCursor = null;
    try
    {
      BaseProvider localBaseProvider = this.mProvider;
      String[] arrayOfString1 = { "_id" };
      String str = String.format("%s = ?", new Object[] { "campaign_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Integer.toString(paramInt);
      localCursor = localBaseProvider.query("marketing_rules", arrayOfString1, str, arrayOfString2, null);
      boolean bool = localCursor.moveToFirst();
      int i = 0;
      if (bool)
      {
        int j = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
        i = j;
      }
      return i;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private String _getUnzipFileDirPath(int paramInt)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this.mLocalyticsDao.getAppContext().getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(this.mLocalyticsDao.getApiKey());
    localStringBuilder.append(File.separator);
    Object[] arrayOfObject1 = new Object[1];
    arrayOfObject1[0] = Integer.valueOf(paramInt);
    localStringBuilder.append(String.format("marketing_rule_%d", arrayOfObject1));
    String str = localStringBuilder.toString();
    File localFile = new File(str);
    if (((!localFile.exists()) || (!localFile.isDirectory())) && (!localFile.mkdirs()))
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = localFile.getAbsolutePath();
      Localytics.Log.w(String.format("Could not create the directory %s for saving the decompressed file.", arrayOfObject2));
      str = null;
    }
    return str;
  }
  
  private String _getZipFileDirPath()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this.mLocalyticsDao.getAppContext().getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(this.mLocalyticsDao.getApiKey());
    return localStringBuilder.toString();
  }
  
  private void _handlePushReceived(Intent paramIntent)
  {
    String str1 = paramIntent.getExtras().getString("ll");
    if (str1 == null)
    {
      Localytics.Log.w("Ignoring message that aren't from Localytics.");
      return;
    }
    for (;;)
    {
      int i;
      String str2;
      boolean bool;
      int j;
      label75:
      int k;
      label88:
      String str5;
      label137:
      String str6;
      Object localObject2;
      String str7;
      try
      {
        localJSONObject = new JSONObject(str1);
        i = localJSONObject.getInt("ca");
        str2 = paramIntent.getExtras().getString("message");
        bool = this.mLocalyticsDao.isPushDisabled();
        if (!TextUtils.isEmpty(str2))
        {
          j = 1;
          if ((bool) || (j == 0)) {
            break label359;
          }
          k = 1;
        }
      }
      catch (JSONException localJSONException1)
      {
        JSONObject localJSONObject;
        String str3;
        String str4;
        HashMap localHashMap;
        Localytics.Log.w("Failed to get campaign id from payload, ignoring message");
        return;
      }
      try
      {
        str3 = localJSONObject.getString("cr");
        str4 = localJSONObject.optString("v", "1");
        str5 = localJSONObject.optString("t", null);
        if (TextUtils.isEmpty(str5))
        {
          if (j == 0) {
            break label365;
          }
          str5 = "Alert";
        }
        str6 = "Not Available";
        if (!this.mLocalyticsDao.isAutoIntegrate()) {
          break label574;
        }
        if (!this.mLocalyticsDao.isAppInForeground()) {
          break label592;
        }
        str6 = "Foreground";
      }
      catch (JSONException localJSONException2)
      {
        Localytics.Log.w("Failed to get campaign id or creative id from payload");
        continue;
        Context localContext = this.mLocalyticsDao.getAppContext();
        Object localObject1 = "";
        int m = DatapointHelper.getLocalyticsNotificationIcon(localContext);
        try
        {
          ApplicationInfo localApplicationInfo = localContext.getPackageManager().getApplicationInfo(localContext.getPackageName(), 0);
          CharSequence localCharSequence = localContext.getPackageManager().getApplicationLabel(localApplicationInfo);
          localObject1 = localCharSequence;
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          for (;;)
          {
            Intent localIntent;
            PendingIntent localPendingIntent;
            NotificationCompat.Builder localBuilder1;
            NotificationCompat.Builder localBuilder2;
            Localytics.Log.w("Failed to get application name, icon, or launch intent");
          }
        }
        localIntent = new Intent(localContext, PushTrackingActivity.class);
        localIntent.putExtras(paramIntent);
        localPendingIntent = PendingIntent.getActivity(localContext, 0, localIntent, 134217728);
        localBuilder1 = new NotificationCompat.Builder(localContext);
        localBuilder2 = localBuilder1.setSmallIcon(m).setContentTitle((CharSequence)localObject1).setContentText(str2).setContentIntent(localPendingIntent).setDefaults(-1).setStyle(new NotificationCompat.BigTextStyle().bigText(str2)).setAutoCancel(true);
        ((NotificationManager)localContext.getSystemService("notification")).notify(i, localBuilder2.build());
        return;
        for (;;)
        {
          if (j != 0)
          {
            if (bool)
            {
              localObject2 = "No";
              break;
              str6 = "Background";
              continue;
            }
            localObject2 = "Yes";
            break;
          }
        }
        localObject2 = "Not Applicable";
      }
    }
    localHashMap = new HashMap();
    localHashMap.put("Campaign ID", String.valueOf(i));
    localHashMap.put("Creative ID", str3);
    localHashMap.put("Creative Type", str5);
    localHashMap.put("Creative Displayed", localObject2);
    if (bool) {}
    for (str7 = "No";; str7 = "Yes")
    {
      localHashMap.put("Push Notifications Enabled", str7);
      localHashMap.put("App Context", str6);
      localHashMap.put("Schema Version - Client", String.valueOf(3));
      localHashMap.put("Schema Version - Server", str4);
      if (localJSONObject.optInt("x", 0) == 0)
      {
        this.mLocalyticsDao.tagEvent("Localytics Push Received", localHashMap);
        this.mLocalyticsDao.upload();
      }
      if (k != 0) {
        break label393;
      }
      if (bool) {
        Localytics.Log.w("Got push notification while push is disabled.");
      }
      if (j != 0) {
        break;
      }
      Localytics.Log.w("Got push notification without a message.");
      return;
      j = 0;
      break label75;
      label359:
      k = 0;
      break label88;
      label365:
      str5 = "Silent";
      break label137;
    }
  }
  
  private boolean _isConnectingToInternet()
  {
    ConnectivityManager localConnectivityManager = (ConnectivityManager)this.mLocalyticsDao.getAppContext().getSystemService("connectivity");
    if (localConnectivityManager != null)
    {
      NetworkInfo[] arrayOfNetworkInfo = localConnectivityManager.getAllNetworkInfo();
      if (arrayOfNetworkInfo != null)
      {
        int i = arrayOfNetworkInfo.length;
        for (int j = 0; j < i; j++) {
          if (arrayOfNetworkInfo[j].getState() == NetworkInfo.State.CONNECTED) {
            return true;
          }
        }
      }
    }
    return false;
  }
  
  private boolean _isMarketingMessageSatisfiedConditions(MarketingMessage paramMarketingMessage, Map<String, String> paramMap)
  {
    boolean bool = true;
    Vector localVector = _getMarketingConditions(_getRuleIdFromCampaignId(((Integer)paramMarketingMessage.get("campaign_id")).intValue()));
    if (localVector != null)
    {
      Iterator localIterator = localVector.iterator();
      while (localIterator.hasNext()) {
        if (!((MarketingCondition)localIterator.next()).isSatisfiedByAttributes(paramMap)) {
          bool = false;
        }
      }
    }
    return bool;
  }
  
  private ContentValues _parseMarketingMessage(MarketingMessage paramMarketingMessage)
  {
    int i = 1;
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("campaign_id", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "campaign_id")));
    localContentValues.put("expiration", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "expiration")));
    localContentValues.put("display_seconds", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "display_seconds")));
    localContentValues.put("display_session", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "display_session")));
    localContentValues.put("version", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "version")));
    localContentValues.put("phone_location", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "phone_location"));
    Map localMap1 = JsonHelper.getSafeMapFromMap(paramMarketingMessage, "phone_size");
    localContentValues.put("phone_size_width", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap1, "width")));
    localContentValues.put("phone_size_height", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap1, "height")));
    Map localMap2 = JsonHelper.getSafeMapFromMap(paramMarketingMessage, "tablet_size");
    localContentValues.put("tablet_location", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "tablet_location"));
    localContentValues.put("tablet_size_width", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap2, "width")));
    localContentValues.put("tablet_size_height", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap2, "height")));
    localContentValues.put("time_to_display", Integer.valueOf(i));
    if (JsonHelper.getSafeBooleanFromMap(paramMarketingMessage, "internet_required")) {}
    for (;;)
    {
      localContentValues.put("internet_required", Integer.valueOf(i));
      localContentValues.put("ab_test", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "ab"));
      localContentValues.put("rule_name_non_unique", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "rule_name"));
      localContentValues.put("rule_name", UUID.randomUUID().toString());
      localContentValues.put("location", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "location"));
      localContentValues.put("devices", JsonHelper.getSafeStringFromMap(paramMarketingMessage, "devices"));
      localContentValues.put("control_group", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "control_group")));
      if (this.mConfigurations != null)
      {
        int j = JsonHelper.getSafeIntegerFromMap(this.mConfigurations, "schema_version");
        if (j > 0) {
          localContentValues.put("schema_version", Integer.valueOf(j));
        }
      }
      return localContentValues;
      i = 0;
    }
  }
  
  private MarketingMessage _retrieveDisplayingCandidate(List<MarketingMessage> paramList, Map<String, String> paramMap)
  {
    Object localObject = null;
    Iterator localIterator = paramList.iterator();
    label85:
    while (localIterator.hasNext())
    {
      MarketingMessage localMarketingMessage = (MarketingMessage)localIterator.next();
      if (((Integer)localMarketingMessage.get("internet_required")).intValue() == 1) {}
      for (int i = 1;; i = 0)
      {
        if (((i != 0) && (!_isConnectingToInternet())) || (!_isMarketingMessageSatisfiedConditions(localMarketingMessage, paramMap))) {
          break label85;
        }
        localObject = localMarketingMessage;
        break;
      }
    }
    if ((localObject == null) || (!_updateDisplayingCandidate((MarketingMessage)localObject))) {
      localObject = null;
    }
    return (MarketingMessage)localObject;
  }
  
  private void _saveMarketingConditions(long paramLong, List<Object> paramList)
  {
    if (paramList == null) {
      return;
    }
    for (long l2 : _getConditionIdFromRuleId(paramLong))
    {
      BaseProvider localBaseProvider2 = this.mProvider;
      String str2 = String.format("%s = ?", new Object[] { "condition_id_ref" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(l2);
      localBaseProvider2.remove("marketing_condition_values", str2, arrayOfString2);
    }
    BaseProvider localBaseProvider1 = this.mProvider;
    String str1 = String.format("%s = ?", new Object[] { "rule_id_ref" });
    String[] arrayOfString1 = new String[1];
    arrayOfString1[0] = Long.toString(paramLong);
    localBaseProvider1.remove("marketing_conditions", str1, arrayOfString1);
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      List localList = (List)localIterator.next();
      ContentValues localContentValues1 = new ContentValues();
      localContentValues1.put("attribute_name", (String)localList.get(0));
      localContentValues1.put("operator", (String)localList.get(1));
      localContentValues1.put("rule_id_ref", Long.valueOf(paramLong));
      long l1 = this.mProvider.insert("marketing_conditions", localContentValues1);
      for (int k = 2; k < localList.size(); k++)
      {
        ContentValues localContentValues2 = new ContentValues();
        localContentValues2.put("value", JsonHelper.getSafeStringFromValue(localList.get(k)));
        localContentValues2.put("condition_id_ref", Long.valueOf(l1));
        this.mProvider.insert("marketing_condition_values", localContentValues2);
      }
    }
  }
  
  private void _tagAmpActionEventForControlGroup(MarketingMessage paramMarketingMessage)
  {
    TreeMap localTreeMap = new TreeMap();
    String str1 = paramMarketingMessage.get("campaign_id").toString();
    String str2 = paramMarketingMessage.get("rule_name_non_unique").toString();
    String str3 = paramMarketingMessage.get("schema_version").toString();
    String str4 = (String)paramMarketingMessage.get("ab_test");
    if (!TextUtils.isEmpty(str4)) {
      localTreeMap.put("ampAB", str4);
    }
    localTreeMap.put("ampAction", "control");
    localTreeMap.put("type", "Control");
    localTreeMap.put("ampCampaignId", str1);
    localTreeMap.put("ampCampaign", str2);
    localTreeMap.put("Schema Version - Client", String.valueOf(3));
    localTreeMap.put("Schema Version - Server", str3);
    this.mLocalyticsDao.tagEvent("ampView", localTreeMap);
  }
  
  private int _timeStringToSeconds(@NonNull String paramString)
  {
    try
    {
      String[] arrayOfString = paramString.split(":");
      int i = 3600 * Integer.valueOf(arrayOfString[0]).intValue();
      int j = Integer.valueOf(arrayOfString[1]).intValue();
      return i + j * 60;
    }
    catch (Exception localException) {}
    return -1;
  }
  
  private boolean _updateDisplayingCandidate(MarketingMessage paramMarketingMessage)
  {
    int i = ((Integer)paramMarketingMessage.get("_id")).intValue();
    String str1 = _getZipFileDirPath();
    String str2 = _getUnzipFileDirPath(i);
    boolean bool1 = _getRemoteFileURL(paramMarketingMessage).endsWith(".zip");
    if (!_doesCreativeExist(i, bool1))
    {
      String str5 = MarketingDownloader.getRemoteFileURL(paramMarketingMessage);
      String str6 = MarketingDownloader.getLocalFileURL(i, bool1, this.mLocalyticsDao.getAppContext(), this.mLocalyticsDao.getApiKey());
      if ((!TextUtils.isEmpty(str5)) && (!TextUtils.isEmpty(str6))) {
        MarketingDownloader.downloadFile(str5, str6, true, this.mLocalyticsDao.getProxy());
      }
    }
    if (bool1)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(i);
      boolean bool2 = _decompressZipFile(str1, str2, String.format("amp_rule_%d.zip", arrayOfObject));
      str3 = null;
      if (!bool2) {}
    }
    for (String str3 = "file://" + str2 + File.separator + "index.html"; TextUtils.isEmpty(str3); str3 = "file://" + str2 + File.separator + "index.html") {
      return false;
    }
    String str4 = (String)paramMarketingMessage.get("devices");
    int j;
    int k;
    if (str4.equals("tablet"))
    {
      j = ((Integer)paramMarketingMessage.get("tablet_size_width")).intValue();
      k = ((Integer)paramMarketingMessage.get("tablet_size_height")).intValue();
    }
    for (;;)
    {
      paramMarketingMessage.put("html_url", str3);
      paramMarketingMessage.put("base_path", str2);
      paramMarketingMessage.put("display_width", Float.valueOf(j));
      paramMarketingMessage.put("display_height", Float.valueOf(k));
      return true;
      if (str4.equals("both"))
      {
        j = ((Integer)paramMarketingMessage.get("phone_size_width")).intValue();
        k = ((Integer)paramMarketingMessage.get("phone_size_height")).intValue();
      }
      else
      {
        j = ((Integer)paramMarketingMessage.get("phone_size_width")).intValue();
        k = ((Integer)paramMarketingMessage.get("phone_size_height")).intValue();
      }
    }
  }
  
  private void setMarketingMessageAsNotDisplayed(int paramInt)
  {
    queueMessage(obtainMessage(205, Integer.valueOf(paramInt)));
  }
  
  boolean _additionalFCDatesAndTimesRulesValidation(@Nullable List<Map<String, String>> paramList, @NonNull SimpleDateFormat paramSimpleDateFormat)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        try
        {
          if (paramSimpleDateFormat.parse((String)localMap.get(Constants.START_KEY)).after(paramSimpleDateFormat.parse((String)localMap.get(Constants.END_KEY)))) {
            throw new Exception();
          }
        }
        catch (Exception localException)
        {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean _additionalFCDisplayFrequencyRulesValidation(@Nullable List<Map<String, Integer>> paramList)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        if ((((Integer)localMap.get(Constants.DAYS_KEY)).intValue() < 1) || (((Integer)localMap.get(Constants.COUNT_KEY)).intValue() < 1)) {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean _additionalFCWeekdaysRulesValidation(@Nullable List<Integer> paramList)
  {
    if (paramList != null)
    {
      if (paramList.size() > 7) {
        return false;
      }
      Iterator localIterator = paramList.iterator();
      for (;;)
      {
        if (localIterator.hasNext())
        {
          Integer localInteger = (Integer)localIterator.next();
          if (localInteger.intValue() < 0) {
            break;
          }
          if (localInteger.intValue() > 6) {
            return false;
          }
        }
      }
    }
    return true;
  }
  
  @NonNull
  Map<String, Object> _augmentBlackoutRule(@NonNull Map<String, Object> paramMap)
  {
    HashMap localHashMap = new HashMap(paramMap);
    boolean bool1 = paramMap.containsKey(Constants.DATES_KEY);
    boolean bool2 = paramMap.containsKey(Constants.WEEKDAYS_KEY);
    boolean bool3 = paramMap.containsKey(Constants.TIMES_KEY);
    if (((bool1) || (bool2)) && (!bool3)) {
      localHashMap.put(Constants.TIMES_KEY, new ArrayList(AUGMENTED_BLACKOUT_TIMES_RULE));
    }
    while ((!bool3) || (bool1) || (bool2)) {
      return localHashMap;
    }
    localHashMap.put(Constants.WEEKDAYS_KEY, new ArrayList(AUGMENTED_BLACKOUT_WEEKDAYS_RULE));
    return localHashMap;
  }
  
  boolean _checkFrequencyCappingRuleArray(@Nullable List<?> paramList, @NonNull String[] paramArrayOfString)
  {
    if (paramList != null)
    {
      if (paramList.size() < 1) {
        return false;
      }
      if (paramArrayOfString.length > 0)
      {
        int i = paramArrayOfString.length;
        for (int j = 0; j < i; j++)
        {
          String str = paramArrayOfString[j];
          Iterator localIterator = paramList.iterator();
          while (localIterator.hasNext()) {
            if (!((Map)localIterator.next()).containsKey(str)) {
              return false;
            }
          }
        }
      }
    }
    return true;
  }
  
  boolean _deleteFrequencyCappingRule(@NonNull Integer paramInteger)
  {
    try
    {
      BaseProvider localBaseProvider = this.mProvider;
      String str = String.format("%s = ?", new Object[] { "campaign_id" });
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInteger);
      localBaseProvider.remove("frequency_capping_rules", str, arrayOfString);
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  protected void _deleteUploadedData(int paramInt) {}
  
  @NonNull
  List<MarketingMessage> _filterMarketingMessagesDisqualifiedByFrequencyCappingRules(@NonNull List<MarketingMessage> paramList)
  {
    HashSet localHashSet = new HashSet();
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext()) {
      localHashSet.add((Integer)((MarketingMessage)localIterator1.next()).get("campaign_id"));
    }
    if (localHashSet.size() > 0) {
      localHashSet.removeAll(_getDisqualifiedCampaigns(FrequencyCappingFilter.MAX_COUNT, localHashSet));
    }
    if (localHashSet.size() > 0) {
      localHashSet.removeAll(_getDisqualifiedCampaigns(FrequencyCappingFilter.FREQUENCY, localHashSet));
    }
    if (localHashSet.size() > 0) {
      localHashSet.removeAll(_getDisqualifiedCampaigns(FrequencyCappingFilter.BLACKOUT, localHashSet));
    }
    if (localHashSet.size() > 0) {
      localHashSet.removeAll(_getGloballyDisqualifiedCampaigns(FrequencyCappingFilter.FREQUENCY, localHashSet));
    }
    if (localHashSet.size() > 0) {
      localHashSet.removeAll(_getGloballyDisqualifiedCampaigns(FrequencyCappingFilter.BLACKOUT, localHashSet));
    }
    LinkedList localLinkedList = new LinkedList();
    if (localHashSet.size() > 0)
    {
      Iterator localIterator2 = paramList.iterator();
      while (localIterator2.hasNext())
      {
        MarketingMessage localMarketingMessage = (MarketingMessage)localIterator2.next();
        if (localHashSet.contains(Integer.valueOf(((Integer)localMarketingMessage.get("campaign_id")).intValue()))) {
          localLinkedList.add(localMarketingMessage);
        }
      }
    }
    return localLinkedList;
  }
  
  protected TreeMap<Integer, Object> _getDataToUpload()
  {
    TreeMap localTreeMap = new TreeMap();
    localTreeMap.put(Integer.valueOf(0), "");
    return localTreeMap;
  }
  
  @NonNull
  Set<Integer> _getDisqualifiedCampaigns(@NonNull FrequencyCappingFilter paramFrequencyCappingFilter, @NonNull Set<Integer> paramSet)
  {
    switch (paramFrequencyCappingFilter)
    {
    default: 
      return new HashSet();
    case ???: 
      Object[] arrayOfObject4 = new Object[9];
      arrayOfObject4[0] = "campaign_id";
      arrayOfObject4[1] = "frequency_capping_rules";
      arrayOfObject4[2] = "campaigns_displayed";
      arrayOfObject4[3] = "campaign_id";
      arrayOfObject4[4] = "campaign_id";
      arrayOfObject4[5] = "campaign_id";
      arrayOfObject4[6] = TextUtils.join(",", paramSet);
      arrayOfObject4[7] = "campaign_id";
      arrayOfObject4[8] = "max_display_count";
      return _getCampaignIdsFromFrequencyCappingQuery(String.format("SELECT fc.%s FROM %s AS fc JOIN %s AS cd ON fc.%s=cd.%s WHERE cd.%s in (%s) GROUP BY fc.%s HAVING count(*) >= fc.%s;", arrayOfObject4));
    case ???: 
      Object[] arrayOfObject3 = new Object[17];
      arrayOfObject3[0] = "campaign_id";
      arrayOfObject3[1] = "frequency_capping_rules";
      arrayOfObject3[2] = "frequency_capping_display_frequencies";
      arrayOfObject3[3] = "_id";
      arrayOfObject3[4] = "frequency_id";
      arrayOfObject3[5] = "campaigns_displayed";
      arrayOfObject3[6] = "campaign_id";
      arrayOfObject3[7] = "campaign_id";
      arrayOfObject3[8] = "date";
      arrayOfObject3[9] = this.mLocalyticsDao.getTimeStringForSQLite();
      arrayOfObject3[10] = "days";
      arrayOfObject3[11] = this.mLocalyticsDao.getTimeStringForSQLite();
      arrayOfObject3[12] = "campaign_id";
      arrayOfObject3[13] = TextUtils.join(",", paramSet);
      arrayOfObject3[14] = "_id";
      arrayOfObject3[15] = "date";
      arrayOfObject3[16] = "count";
      return _getCampaignIdsFromFrequencyCappingQuery(String.format("SELECT DISTINCT fc.%s FROM %s AS fc JOIN %s AS df ON fc.%s=df.%s JOIN %s AS cd ON fc.%s=cd.%s WHERE (cd.%s BETWEEN datetime('%s','-'||df.%s||' days') AND datetime('%s')) AND fc.%s in (%s) GROUP BY df.%s HAVING count(cd.%s) >= df.%s;", arrayOfObject3));
    }
    Calendar localCalendar = this.mLocalyticsDao.getCalendar();
    int i = -1 + localCalendar.get(7);
    int j = 60 * (60 * localCalendar.get(11) + localCalendar.get(12)) + localCalendar.get(13);
    Object[] arrayOfObject1 = new Object[17];
    arrayOfObject1[0] = "campaign_id";
    arrayOfObject1[1] = "frequency_capping_rules";
    arrayOfObject1[2] = "frequency_capping_blackout_dates";
    arrayOfObject1[3] = "frequency_capping_blackout_times";
    arrayOfObject1[4] = "_id";
    arrayOfObject1[5] = "frequency_id";
    arrayOfObject1[6] = "_id";
    arrayOfObject1[7] = "frequency_id";
    arrayOfObject1[8] = "rule_group_id";
    arrayOfObject1[9] = "rule_group_id";
    arrayOfObject1[10] = this.mLocalyticsDao.getTimeStringForSQLite();
    arrayOfObject1[11] = "start";
    arrayOfObject1[12] = "end";
    arrayOfObject1[13] = "start";
    arrayOfObject1[14] = "end";
    arrayOfObject1[15] = "campaign_id";
    arrayOfObject1[16] = TextUtils.join(",", paramSet);
    String str1 = String.format("SELECT fc.%s FROM %s AS fc, %s AS d, %s AS t WHERE ((fc.%s=t.%s) AND (fc.%s=d.%s)) AND (d.%s=t.%s) AND (datetime('%s','localtime') BETWEEN d.%s and d.%s) AND (? BETWEEN t.%s AND t.%s) AND fc.%s IN (%s);", arrayOfObject1);
    String[] arrayOfString1 = new String[1];
    arrayOfString1[0] = String.valueOf(j);
    Set localSet = _getCampaignIdsFromFrequencyCappingQuery(str1, arrayOfString1);
    Object[] arrayOfObject2 = new Object[15];
    arrayOfObject2[0] = "campaign_id";
    arrayOfObject2[1] = "frequency_capping_rules";
    arrayOfObject2[2] = "frequency_capping_blackout_weekdays";
    arrayOfObject2[3] = "frequency_capping_blackout_times";
    arrayOfObject2[4] = "_id";
    arrayOfObject2[5] = "frequency_id";
    arrayOfObject2[6] = "_id";
    arrayOfObject2[7] = "frequency_id";
    arrayOfObject2[8] = "rule_group_id";
    arrayOfObject2[9] = "rule_group_id";
    arrayOfObject2[10] = "day";
    arrayOfObject2[11] = "start";
    arrayOfObject2[12] = "end";
    arrayOfObject2[13] = "campaign_id";
    arrayOfObject2[14] = TextUtils.join(",", paramSet);
    String str2 = String.format("SELECT fc.%s FROM %s AS fc, %s AS w, %s AS t WHERE ((fc.%s=t.%s) AND (fc.%s=w.%s)) AND (w.%s=t.%s) AND (w.%s=?)  AND (? BETWEEN t.%s AND t.%s) AND fc.%s IN (%s);", arrayOfObject2);
    String[] arrayOfString2 = new String[2];
    arrayOfString2[0] = String.valueOf(i);
    arrayOfString2[1] = String.valueOf(j);
    localSet.addAll(_getCampaignIdsFromFrequencyCappingQuery(str2, arrayOfString2));
    return localSet;
  }
  
  /* Error */
  @NonNull
  Set<Integer> _getGloballyDisqualifiedCampaigns(@NonNull FrequencyCappingFilter paramFrequencyCappingFilter, @NonNull Set<Integer> paramSet)
  {
    // Byte code:
    //   0: iconst_m1
    //   1: istore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: aload_0
    //   6: getfield 316	com/localytics/android/MarketingHandler:mProvider	Lcom/localytics/android/BaseProvider;
    //   9: astore 6
    //   11: iconst_1
    //   12: anewarray 81	java/lang/String
    //   15: astore 7
    //   17: aload 7
    //   19: iconst_0
    //   20: iconst_m1
    //   21: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   24: aastore
    //   25: aload 6
    //   27: ldc_w 1180
    //   30: aconst_null
    //   31: ldc_w 1275
    //   34: aload 7
    //   36: aconst_null
    //   37: invokevirtual 581	com/localytics/android/BaseProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   40: astore 4
    //   42: aload 4
    //   44: invokeinterface 730 1 0
    //   49: ifeq +24 -> 73
    //   52: aload 4
    //   54: aload 4
    //   56: ldc 83
    //   58: invokeinterface 570 2 0
    //   63: invokeinterface 573 2 0
    //   68: istore 28
    //   70: iload 28
    //   72: istore_3
    //   73: aload 4
    //   75: ifnull +10 -> 85
    //   78: aload 4
    //   80: invokeinterface 577 1 0
    //   85: iload_3
    //   86: iconst_m1
    //   87: if_icmpeq +49 -> 136
    //   90: getstatic 1218	com/localytics/android/MarketingHandler$25:$SwitchMap$com$localytics$android$MarketingHandler$FrequencyCappingFilter	[I
    //   93: aload_1
    //   94: invokevirtual 1221	com/localytics/android/MarketingHandler$FrequencyCappingFilter:ordinal	()I
    //   97: iaload
    //   98: istore 10
    //   100: iload 10
    //   102: tableswitch	default:+22->124, 2:+63->165, 3:+273->375
    //   124: aload 4
    //   126: ifnull +10 -> 136
    //   129: aload 4
    //   131: invokeinterface 577 1 0
    //   136: new 545	java/util/HashSet
    //   139: dup
    //   140: invokespecial 546	java/util/HashSet:<init>	()V
    //   143: astore 8
    //   145: aload 8
    //   147: areturn
    //   148: astore 5
    //   150: aload 4
    //   152: ifnull +10 -> 162
    //   155: aload 4
    //   157: invokeinterface 577 1 0
    //   162: aload 5
    //   164: athrow
    //   165: aload_0
    //   166: getfield 316	com/localytics/android/MarketingHandler:mProvider	Lcom/localytics/android/BaseProvider;
    //   169: getfield 556	com/localytics/android/BaseProvider:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   172: astore 23
    //   174: bipush 15
    //   176: anewarray 320	java/lang/Object
    //   179: astore 24
    //   181: aload 24
    //   183: iconst_0
    //   184: ldc 83
    //   186: aastore
    //   187: aload 24
    //   189: iconst_1
    //   190: ldc_w 1180
    //   193: aastore
    //   194: aload 24
    //   196: iconst_2
    //   197: ldc_w 1235
    //   200: aastore
    //   201: aload 24
    //   203: iconst_3
    //   204: ldc 83
    //   206: aastore
    //   207: aload 24
    //   209: iconst_4
    //   210: ldc_w 1237
    //   213: aastore
    //   214: aload 24
    //   216: iconst_5
    //   217: ldc_w 1223
    //   220: aastore
    //   221: aload 24
    //   223: bipush 6
    //   225: ldc -78
    //   227: aastore
    //   228: aload 24
    //   230: bipush 7
    //   232: ldc_w 466
    //   235: aastore
    //   236: aload 24
    //   238: bipush 8
    //   240: ldc_w 1239
    //   243: aastore
    //   244: aload 24
    //   246: bipush 9
    //   248: aload_0
    //   249: getfield 251	com/localytics/android/MarketingHandler:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   252: invokeinterface 1242 1 0
    //   257: aastore
    //   258: aload 24
    //   260: bipush 10
    //   262: ldc_w 1244
    //   265: aastore
    //   266: aload 24
    //   268: bipush 11
    //   270: aload_0
    //   271: getfield 251	com/localytics/android/MarketingHandler:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   274: invokeinterface 1242 1 0
    //   279: aastore
    //   280: aload 24
    //   282: bipush 12
    //   284: ldc 83
    //   286: aastore
    //   287: aload 24
    //   289: bipush 13
    //   291: ldc_w 1239
    //   294: aastore
    //   295: aload 24
    //   297: bipush 14
    //   299: ldc_w 1246
    //   302: aastore
    //   303: ldc_w 1277
    //   306: aload 24
    //   308: invokestatic 326	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   311: astore 25
    //   313: iconst_1
    //   314: anewarray 81	java/lang/String
    //   317: astore 26
    //   319: aload 26
    //   321: iconst_0
    //   322: iconst_m1
    //   323: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   326: aastore
    //   327: aload 23
    //   329: aload 25
    //   331: aload 26
    //   333: invokevirtual 562	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   336: astore 4
    //   338: aload 4
    //   340: invokeinterface 584 1 0
    //   345: ifle -221 -> 124
    //   348: aload_0
    //   349: iconst_0
    //   350: aload_2
    //   351: invokevirtual 1281	com/localytics/android/MarketingHandler:_getIgnoresGlobalCampaigns	(ZLjava/util/Set;)Ljava/util/Set;
    //   354: astore 27
    //   356: aload 27
    //   358: astore 8
    //   360: aload 4
    //   362: ifnull -217 -> 145
    //   365: aload 4
    //   367: invokeinterface 577 1 0
    //   372: aload 8
    //   374: areturn
    //   375: aload_0
    //   376: getfield 251	com/localytics/android/MarketingHandler:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   379: invokeinterface 1252 1 0
    //   384: astore 11
    //   386: iconst_m1
    //   387: aload 11
    //   389: bipush 7
    //   391: invokevirtual 1256	java/util/Calendar:get	(I)I
    //   394: iadd
    //   395: istore 12
    //   397: bipush 60
    //   399: bipush 60
    //   401: aload 11
    //   403: bipush 11
    //   405: invokevirtual 1256	java/util/Calendar:get	(I)I
    //   408: imul
    //   409: aload 11
    //   411: bipush 12
    //   413: invokevirtual 1256	java/util/Calendar:get	(I)I
    //   416: iadd
    //   417: imul
    //   418: aload 11
    //   420: bipush 13
    //   422: invokevirtual 1256	java/util/Calendar:get	(I)I
    //   425: iadd
    //   426: istore 13
    //   428: aload_0
    //   429: getfield 316	com/localytics/android/MarketingHandler:mProvider	Lcom/localytics/android/BaseProvider;
    //   432: getfield 556	com/localytics/android/BaseProvider:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   435: astore 14
    //   437: bipush 11
    //   439: anewarray 320	java/lang/Object
    //   442: astore 15
    //   444: aload 15
    //   446: iconst_0
    //   447: ldc_w 1258
    //   450: aastore
    //   451: aload 15
    //   453: iconst_1
    //   454: ldc_w 1260
    //   457: aastore
    //   458: aload 15
    //   460: iconst_2
    //   461: ldc_w 1237
    //   464: aastore
    //   465: aload 15
    //   467: iconst_3
    //   468: ldc_w 1237
    //   471: aastore
    //   472: aload 15
    //   474: iconst_4
    //   475: ldc_w 1262
    //   478: aastore
    //   479: aload 15
    //   481: iconst_5
    //   482: ldc_w 1262
    //   485: aastore
    //   486: aload 15
    //   488: bipush 6
    //   490: aload_0
    //   491: getfield 251	com/localytics/android/MarketingHandler:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   494: invokeinterface 1242 1 0
    //   499: aastore
    //   500: aload 15
    //   502: bipush 7
    //   504: ldc -111
    //   506: aastore
    //   507: aload 15
    //   509: bipush 8
    //   511: ldc -103
    //   513: aastore
    //   514: aload 15
    //   516: bipush 9
    //   518: ldc -111
    //   520: aastore
    //   521: aload 15
    //   523: bipush 10
    //   525: ldc -103
    //   527: aastore
    //   528: ldc_w 1283
    //   531: aload 15
    //   533: invokestatic 326	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   536: astore 16
    //   538: iconst_3
    //   539: anewarray 81	java/lang/String
    //   542: astore 17
    //   544: aload 17
    //   546: iconst_0
    //   547: iload_3
    //   548: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   551: aastore
    //   552: aload 17
    //   554: iconst_1
    //   555: iload_3
    //   556: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   559: aastore
    //   560: aload 17
    //   562: iconst_2
    //   563: iload 13
    //   565: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   568: aastore
    //   569: aload 14
    //   571: aload 16
    //   573: aload 17
    //   575: invokevirtual 562	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   578: astore 4
    //   580: aload 4
    //   582: invokeinterface 584 1 0
    //   587: istore 18
    //   589: aload 4
    //   591: invokeinterface 577 1 0
    //   596: aload_0
    //   597: getfield 316	com/localytics/android/MarketingHandler:mProvider	Lcom/localytics/android/BaseProvider;
    //   600: getfield 556	com/localytics/android/BaseProvider:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   603: astore 19
    //   605: ldc_w 1285
    //   608: bipush 9
    //   610: anewarray 320	java/lang/Object
    //   613: dup
    //   614: iconst_0
    //   615: ldc_w 1266
    //   618: aastore
    //   619: dup
    //   620: iconst_1
    //   621: ldc_w 1260
    //   624: aastore
    //   625: dup
    //   626: iconst_2
    //   627: ldc_w 1237
    //   630: aastore
    //   631: dup
    //   632: iconst_3
    //   633: ldc_w 1237
    //   636: aastore
    //   637: dup
    //   638: iconst_4
    //   639: ldc_w 1262
    //   642: aastore
    //   643: dup
    //   644: iconst_5
    //   645: ldc_w 1262
    //   648: aastore
    //   649: dup
    //   650: bipush 6
    //   652: ldc_w 1268
    //   655: aastore
    //   656: dup
    //   657: bipush 7
    //   659: ldc -111
    //   661: aastore
    //   662: dup
    //   663: bipush 8
    //   665: ldc -103
    //   667: aastore
    //   668: invokestatic 326	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   671: astore 20
    //   673: iconst_4
    //   674: anewarray 81	java/lang/String
    //   677: astore 21
    //   679: aload 21
    //   681: iconst_0
    //   682: iload_3
    //   683: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   686: aastore
    //   687: aload 21
    //   689: iconst_1
    //   690: iload_3
    //   691: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   694: aastore
    //   695: aload 21
    //   697: iconst_2
    //   698: iload 12
    //   700: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   703: aastore
    //   704: aload 21
    //   706: iconst_3
    //   707: iload 13
    //   709: invokestatic 793	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   712: aastore
    //   713: aload 19
    //   715: aload 20
    //   717: aload 21
    //   719: invokevirtual 562	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   722: astore 4
    //   724: iload 18
    //   726: aload 4
    //   728: invokeinterface 584 1 0
    //   733: iadd
    //   734: ifle -610 -> 124
    //   737: aload_0
    //   738: iconst_0
    //   739: aload_2
    //   740: invokevirtual 1281	com/localytics/android/MarketingHandler:_getIgnoresGlobalCampaigns	(ZLjava/util/Set;)Ljava/util/Set;
    //   743: astore 22
    //   745: aload 22
    //   747: astore 8
    //   749: aload 4
    //   751: ifnull -606 -> 145
    //   754: aload 4
    //   756: invokeinterface 577 1 0
    //   761: aload 8
    //   763: areturn
    //   764: astore 9
    //   766: aload 4
    //   768: ifnull +10 -> 778
    //   771: aload 4
    //   773: invokeinterface 577 1 0
    //   778: aload 9
    //   780: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	781	0	this	MarketingHandler
    //   0	781	1	paramFrequencyCappingFilter	FrequencyCappingFilter
    //   0	781	2	paramSet	Set<Integer>
    //   1	690	3	i	int
    //   3	769	4	localCursor	Cursor
    //   148	15	5	localObject1	Object
    //   9	17	6	localBaseProvider	BaseProvider
    //   15	20	7	arrayOfString1	String[]
    //   143	619	8	localObject2	Object
    //   764	15	9	localObject3	Object
    //   98	3	10	j	int
    //   384	35	11	localCalendar	Calendar
    //   395	304	12	k	int
    //   426	282	13	m	int
    //   435	135	14	localSQLiteDatabase1	SQLiteDatabase
    //   442	90	15	arrayOfObject1	Object[]
    //   536	36	16	str1	String
    //   542	32	17	arrayOfString2	String[]
    //   587	147	18	n	int
    //   603	111	19	localSQLiteDatabase2	SQLiteDatabase
    //   671	45	20	str2	String
    //   677	41	21	arrayOfString3	String[]
    //   743	3	22	localSet1	Set
    //   172	156	23	localSQLiteDatabase3	SQLiteDatabase
    //   179	128	24	arrayOfObject2	Object[]
    //   311	19	25	str3	String
    //   317	15	26	arrayOfString4	String[]
    //   354	3	27	localSet2	Set
    //   68	3	28	i1	int
    // Exception table:
    //   from	to	target	type
    //   5	70	148	finally
    //   90	100	764	finally
    //   165	356	764	finally
    //   375	745	764	finally
  }
  
  @NonNull
  Set<Integer> _getIgnoresGlobalCampaigns(boolean paramBoolean, @NonNull Set<Integer> paramSet)
  {
    int i = 1;
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = "campaign_id";
    arrayOfObject[i] = "frequency_capping_rules";
    arrayOfObject[2] = "ignore_global";
    if (paramBoolean) {}
    for (;;)
    {
      arrayOfObject[3] = Integer.valueOf(i);
      arrayOfObject[4] = "campaign_id";
      arrayOfObject[5] = TextUtils.join(",", paramSet);
      return _getCampaignIdsFromFrequencyCappingQuery(String.format("SELECT %s FROM %s WHERE %s = %s AND %s in (%s);", arrayOfObject));
      i = 0;
    }
  }
  
  protected int _getMaxRowToUpload()
  {
    return 1;
  }
  
  @Nullable
  MarketingMessage _getQualifiedMarketingMessageForTrigger(@NonNull String paramString, @Nullable Map<String, String> paramMap)
  {
    if (Constants.isTestModeEnabled()) {}
    do
    {
      return null;
      if (!paramString.equals("open")) {
        break;
      }
    } while ((this.sessionStartMarketingMessageShown) || (Constants.isTestModeEnabled()));
    String str = "AMP Loaded";
    this.sessionStartMarketingMessageShown = true;
    for (;;)
    {
      List localList = _getMarketingMessageMaps(str);
      if (localList.size() == 0)
      {
        Context localContext = this.mLocalyticsDao.getAppContext();
        if (str.startsWith(localContext.getPackageName())) {
          localList = _getMarketingMessageMaps(str.substring(1 + localContext.getPackageName().length(), str.length()));
        }
      }
      return _retrieveDisplayingCandidate(_filterMarketingMessagesDisqualifiedByFrequencyCappingRules(localList), paramMap);
      str = paramString;
    }
  }
  
  protected void _init()
  {
    this.mProvider = new MarketingProvider(this.siloName.toLowerCase(), this.mLocalyticsDao);
  }
  
  void _marketingTrigger(@NonNull String paramString, @Nullable Map<String, String> paramMap)
  {
    MarketingMessage localMarketingMessage = _getQualifiedMarketingMessageForTrigger(paramString, paramMap);
    if (localMarketingMessage != null)
    {
      Integer localInteger1 = (Integer)localMarketingMessage.get("campaign_id");
      Integer localInteger2 = (Integer)localMarketingMessage.get("control_group");
      if ((localInteger2 == null) || (localInteger2.intValue() != 1)) {
        break label67;
      }
      if (_setMarketingMessageAsDisplayed(localInteger1.intValue())) {
        _tagAmpActionEventForControlGroup(localMarketingMessage);
      }
    }
    return;
    label67:
    _tryDisplayingInAppCampaign(localMarketingMessage, paramMap);
  }
  
  protected void _onUploadCompleted(String paramString)
  {
    int i;
    if (paramString != null) {
      i = paramString.hashCode();
    }
    for (;;)
    {
      if (i != this.lastMarketingMessagesHash) {}
      try
      {
        Map localMap = JsonHelper.toMap(new JSONObject(paramString));
        _processConfigObject(localMap);
        _processMarketingObject(localMap);
        this.lastMarketingMessagesHash = i;
        if (this.testCampaignsListAdapter != null)
        {
          new Thread()
          {
            public void run()
            {
              new Handler(Looper.getMainLooper()).post(new Runnable()
              {
                public void run()
                {
                  MarketingHandler.6.this.val$adapter.updateDataSet();
                  MarketingHandler.6.this.val$adapter.notifyDataSetChanged();
                }
              });
            }
          }.start();
          this.testCampaignsListAdapter = null;
          return;
          i = this.lastMarketingMessagesHash;
        }
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          Localytics.Log.w("JSONException", localJSONException);
        }
        this.mLocalyticsDao.triggerInAppMessage("open");
      }
    }
  }
  
  void _processConfigObject(Map<String, Object> paramMap)
    throws JSONException
  {
    this.mConfigurations = ((Map)paramMap.get("config"));
  }
  
  void _processMarketingObject(Map<String, Object> paramMap)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = paramMap.get("amp");
    if (localObject != null)
    {
      Iterator localIterator2 = JsonHelper.toList((JSONArray)JsonHelper.toJSON(localObject)).iterator();
      while (localIterator2.hasNext()) {
        localArrayList.add(new MarketingMessage((Map)localIterator2.next()));
      }
    }
    _removeDeactivatedMarketingMessages(localArrayList);
    _validateAndStoreFrequencyCappingRule(paramMap, Integer.valueOf(-1));
    Iterator localIterator1 = localArrayList.iterator();
    while (localIterator1.hasNext())
    {
      MarketingMessage localMarketingMessage = (MarketingMessage)localIterator1.next();
      _saveMarketingMessage(localMarketingMessage);
      _validateAndStoreFrequencyCappingRule(localMarketingMessage, (Integer)localMarketingMessage.get(Constants.CAMPAIGN_ID_KEY));
    }
  }
  
  void _removeDeactivatedMarketingMessages(List<MarketingMessage> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext()) {
      localArrayList.add(Integer.valueOf(JsonHelper.getSafeIntegerFromMap((MarketingMessage)localIterator1.next(), "campaign_id")));
    }
    _deleteFrequencyCappingRule(Integer.valueOf(-1));
    Vector localVector = new Vector();
    Cursor localCursor = null;
    for (;;)
    {
      int i;
      try
      {
        localCursor = this.mProvider.query("marketing_rules", null, null, null, null);
        i = 0;
        if (i < localCursor.getCount())
        {
          localCursor.moveToPosition(i);
          if (localArrayList.contains(Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))))) {
            break label747;
          }
          MarketingMessage localMarketingMessage2 = new MarketingMessage();
          localMarketingMessage2.put("_id", Integer.valueOf(localCursor.getColumnIndexOrThrow("_id")));
          localMarketingMessage2.put("campaign_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
          localMarketingMessage2.put("expiration", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("expiration"))));
          localMarketingMessage2.put("display_seconds", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_seconds"))));
          localMarketingMessage2.put("display_session", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_session"))));
          localMarketingMessage2.put("version", localCursor.getString(localCursor.getColumnIndexOrThrow("version")));
          localMarketingMessage2.put("phone_location", localCursor.getString(localCursor.getColumnIndexOrThrow("phone_location")));
          localMarketingMessage2.put("phone_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_width"))));
          localMarketingMessage2.put("phone_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_height"))));
          localMarketingMessage2.put("tablet_location", localCursor.getString(localCursor.getColumnIndexOrThrow("tablet_location")));
          localMarketingMessage2.put("tablet_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_width"))));
          localMarketingMessage2.put("tablet_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_height"))));
          localMarketingMessage2.put("time_to_display", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("time_to_display"))));
          localMarketingMessage2.put("internet_required", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("internet_required"))));
          localMarketingMessage2.put("ab_test", localCursor.getString(localCursor.getColumnIndexOrThrow("ab_test")));
          localMarketingMessage2.put("rule_name_non_unique", localCursor.getString(localCursor.getColumnIndexOrThrow("rule_name_non_unique")));
          localMarketingMessage2.put("location", localCursor.getString(localCursor.getColumnIndexOrThrow("location")));
          localMarketingMessage2.put("devices", localCursor.getString(localCursor.getColumnIndexOrThrow("devices")));
          localVector.add(localMarketingMessage2);
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
      if (localCursor != null) {
        localCursor.close();
      }
      Iterator localIterator2 = localVector.iterator();
      while (localIterator2.hasNext())
      {
        MarketingMessage localMarketingMessage1 = (MarketingMessage)localIterator2.next();
        _destroyLocalMarketingMessage(localMarketingMessage1);
        _deleteFrequencyCappingRule((Integer)localMarketingMessage1.get("campaign_id"));
      }
      this.mProvider.vacuumIfNecessary();
      return;
      label747:
      i++;
    }
  }
  
  boolean _saveFrequencyCappingRule(@NonNull Map<String, Object> paramMap, @NonNull Integer paramInteger)
  {
    this.mProvider.mDb.beginTransaction();
    int i = (int)_saveFrequencyCappingRuleBase(paramMap, paramInteger);
    List localList1 = (List)paramMap.get(Constants.DISPLAY_FREQUENCIES_KEY);
    int j;
    if ((i > 0) && (_saveFrequencyCappingRuleDisplayFrequency(localList1, Integer.valueOf(i))))
    {
      j = 1;
      List localList2 = (List)paramMap.get(Constants.BLACKOUT_RULES_KEY);
      if ((j == 0) || (!_saveFrequencyCappingRuleBlackout(localList2, Integer.valueOf(i)))) {
        break label121;
      }
    }
    label121:
    for (boolean bool = true;; bool = false)
    {
      if (bool) {
        this.mProvider.mDb.setTransactionSuccessful();
      }
      this.mProvider.mDb.endTransaction();
      return bool;
      j = 0;
      break;
    }
  }
  
  long _saveFrequencyCappingRuleBase(@NonNull Map<String, ?> paramMap, @NonNull Integer paramInteger)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("campaign_id", paramInteger);
    if (paramInteger.intValue() != -1)
    {
      localContentValues.put("max_display_count", (Integer)paramMap.get(Constants.MAX_DISPLAY_COUNT_KEY));
      localContentValues.put("ignore_global", (Integer)paramMap.get(Constants.IGNORE_GLOBAL_KEY));
    }
    for (;;)
    {
      return this.mProvider.mDb.replace("frequency_capping_rules", null, localContentValues);
      localContentValues.putNull("max_display_count");
      localContentValues.putNull("ignore_global");
    }
  }
  
  boolean _saveFrequencyCappingRuleBlackout(@Nullable List<Map<String, Object>> paramList, @NonNull Integer paramInteger)
  {
    if (paramList != null)
    {
      int i = 0;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = _augmentBlackoutRule((Map)localIterator.next());
        if (!_saveFrequencyCappingRuleBlackoutDates((List)localMap.get(Constants.DATES_KEY), paramInteger, Integer.valueOf(i))) {}
        while ((!_saveFrequencyCappingRuleBlackoutWeekdays((List)localMap.get(Constants.WEEKDAYS_KEY), paramInteger, Integer.valueOf(i))) || (!_saveFrequencyCappingRuleBlackoutTimes((List)localMap.get(Constants.TIMES_KEY), paramInteger, Integer.valueOf(i)))) {
          return false;
        }
        i++;
      }
    }
    return true;
  }
  
  boolean _saveFrequencyCappingRuleBlackoutDates(@Nullable List<Map<String, String>> paramList, @NonNull Integer paramInteger1, @NonNull Integer paramInteger2)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        try
        {
          SQLiteDatabase localSQLiteDatabase = this.mProvider.mDb;
          String str = String.format("INSERT INTO %s VALUES (?, ?, datetime(?,'start of day'), datetime(?,'start of day','1 day','-1 second'));", new Object[] { "frequency_capping_blackout_dates" });
          Object[] arrayOfObject = new Object[4];
          arrayOfObject[0] = paramInteger1;
          arrayOfObject[1] = paramInteger2;
          arrayOfObject[2] = localMap.get(Constants.START_KEY);
          arrayOfObject[3] = localMap.get(Constants.END_KEY);
          localSQLiteDatabase.execSQL(str, arrayOfObject);
        }
        catch (Exception localException)
        {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean _saveFrequencyCappingRuleBlackoutTimes(@Nullable List<Map<String, String>> paramList, @NonNull Integer paramInteger1, @NonNull Integer paramInteger2)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        Integer localInteger1 = Integer.valueOf(_timeStringToSeconds((String)localMap.get(Constants.START_KEY)));
        Integer localInteger2 = Integer.valueOf(_timeStringToSeconds((String)localMap.get(Constants.END_KEY)));
        if ((localInteger1.intValue() == -1) || (localInteger2.intValue() == -1)) {
          return false;
        }
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("frequency_id", paramInteger1);
        localContentValues.put("rule_group_id", paramInteger2);
        localContentValues.put("start", localInteger1);
        localContentValues.put("end", Integer.valueOf(59 + localInteger2.intValue()));
        if (this.mProvider.insert("frequency_capping_blackout_times", localContentValues) <= 0L) {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean _saveFrequencyCappingRuleBlackoutWeekdays(@Nullable List<Integer> paramList, @NonNull Integer paramInteger1, @NonNull Integer paramInteger2)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Integer localInteger = (Integer)localIterator.next();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("frequency_id", paramInteger1);
        localContentValues.put("rule_group_id", paramInteger2);
        localContentValues.put("day", localInteger);
        if (this.mProvider.insert("frequency_capping_blackout_weekdays", localContentValues) <= 0L) {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean _saveFrequencyCappingRuleDisplayFrequency(@Nullable List<Map<String, Integer>> paramList, @NonNull Integer paramInteger)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("frequency_id", paramInteger);
        localContentValues.put("count", (Integer)localMap.get(Constants.COUNT_KEY));
        localContentValues.put("days", (Integer)localMap.get(Constants.DAYS_KEY));
        if (this.mProvider.insert("frequency_capping_display_frequencies", localContentValues) <= 0L) {
          return false;
        }
      }
    }
    return true;
  }
  
  int _saveMarketingMessage(MarketingMessage paramMarketingMessage)
  {
    int n;
    if (!_validateMarketingMessage(paramMarketingMessage)) {
      n = 0;
    }
    label445:
    label461:
    for (;;)
    {
      return n;
      int i = JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "campaign_id");
      Cursor localCursor = null;
      try
      {
        BaseProvider localBaseProvider = this.mProvider;
        String[] arrayOfString1 = PROJECTION_MARKETING_RULE_RECORD;
        String str1 = String.format("%s = ?", new Object[] { "campaign_id" });
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = Integer.toString(i);
        localCursor = localBaseProvider.query("marketing_rules", arrayOfString1, str1, arrayOfString2, null);
        boolean bool = localCursor.moveToFirst();
        int j = 0;
        int k = 0;
        if (bool)
        {
          k = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
          int m = localCursor.getInt(localCursor.getColumnIndexOrThrow("version"));
          j = m;
        }
        if (localCursor != null) {
          localCursor.close();
        }
        if (k <= 0) {
          break label445;
        }
        Object[] arrayOfObject1 = new Object[2];
        arrayOfObject1[0] = Integer.valueOf(i);
        arrayOfObject1[1] = Integer.valueOf(k);
        Localytics.Log.w(String.format("Existing in-app rule already exists for this campaign\n\t campaignID = %d\n\t ruleID = %d", arrayOfObject1));
        if (j >= JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "version"))
        {
          Object[] arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = Integer.valueOf(j);
          Localytics.Log.w(String.format("No update needed. Campaign version has not been updated\n\t version: %d", arrayOfObject2));
          return 0;
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
      _destroyLocalMarketingMessage(paramMarketingMessage);
      ContentValues localContentValues = _parseMarketingMessage(paramMarketingMessage);
      n = (int)this.mProvider.insert("marketing_rules", localContentValues);
      if (n > 0) {
        _saveMarketingConditions(n, JsonHelper.getSafeListFromMap(paramMarketingMessage, "conditions"));
      }
      try
      {
        List localList2 = JsonHelper.toList((JSONArray)JsonHelper.toJSON(paramMarketingMessage.get("display_events")));
        localList1 = localList2;
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          String str2;
          String str3;
          List localList1 = null;
        }
      }
      if (localList1 != null) {
        _bindRuleToEvents(n, localList1);
      }
      if ((n > 0) && (!Constants.isTestModeEnabled()))
      {
        str2 = MarketingDownloader.getRemoteFileURL(paramMarketingMessage);
        if (!TextUtils.isEmpty(str2)) {}
        for (str3 = MarketingDownloader.getLocalFileURL(n, str2.endsWith(".zip"), this.mLocalyticsDao.getAppContext(), this.mLocalyticsDao.getApiKey());; str3 = "")
        {
          if ((TextUtils.isEmpty(str2)) || (TextUtils.isEmpty(str3))) {
            break label461;
          }
          Localytics.Log.v(String.format("Saving in-app message with remoteURL = %s and localUrl = %s", new Object[] { str2, str3 }));
          MarketingDownloader.downloadFile(str2, str3, true, this.mLocalyticsDao.getProxy());
          return n;
          Localytics.Log.w("In-app campaign not found. Creating a new one.");
          break;
        }
      }
    }
  }
  
  boolean _setMarketingMessageAsDisplayed(int paramInt)
  {
    Cursor localCursor = null;
    try
    {
      BaseProvider localBaseProvider = this.mProvider;
      String[] arrayOfString1 = { "ignore_global" };
      String str1 = String.format("%s = ?", new Object[] { "campaign_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = String.valueOf(paramInt);
      localCursor = localBaseProvider.query("frequency_capping_rules", arrayOfString1, str1, arrayOfString2, null);
      if (localCursor.moveToFirst())
      {
        int i = localCursor.getInt(localCursor.getColumnIndex("ignore_global"));
        SQLiteDatabase localSQLiteDatabase = this.mProvider.mDb;
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = "campaigns_displayed";
        arrayOfObject[1] = this.mLocalyticsDao.getTimeStringForSQLite();
        String str2 = String.format("INSERT INTO %s VALUES (?, datetime('%s'), ?);", arrayOfObject);
        Integer[] arrayOfInteger = new Integer[2];
        arrayOfInteger[0] = Integer.valueOf(paramInt);
        arrayOfInteger[1] = Integer.valueOf(i);
        localSQLiteDatabase.execSQL(str2, arrayOfInteger);
        return true;
      }
      return false;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  boolean _setMarketingMessageAsNotDisplayed(int paramInt)
  {
    String str1 = String.valueOf(paramInt);
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("campaigns_displayed", new String[] { "date" }, String.format("%s = ?", new Object[] { "campaign_id" }), new String[] { str1 }, String.format("%s DESC", new Object[] { "date" }));
      if (localCursor.moveToFirst())
      {
        String str2 = localCursor.getString(localCursor.getColumnIndex("date"));
        int i = this.mProvider.remove("campaigns_displayed", String.format("%s = ? AND %s = ?", new Object[] { "campaign_id", "date" }), new String[] { str1, str2 });
        if (i > 0) {}
        for (boolean bool = true;; bool = false) {
          return bool;
        }
      }
      return false;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  void _tryDisplayingInAppCampaign(@NonNull final MarketingMessage paramMarketingMessage, @Nullable Map<String, String> paramMap)
  {
    final SparseArray localSparseArray = _getJavaScriptClientCallbacks(paramMap);
    new Handler(Looper.getMainLooper()).post(new Runnable()
    {
      public void run()
      {
        if (MarketingHandler.this.mFragmentManager == null) {}
        for (;;)
        {
          return;
          try
          {
            if ((MarketingHandler.this.mFragmentManager.findFragmentByTag("marketing_dialog") == null) && (!MarketingHandler.this.mCampaignDisplaying))
            {
              MarketingHandler.access$402(MarketingHandler.this, true);
              new AsyncTask()
              {
                protected Boolean doInBackground(Void... paramAnonymous2VarArgs)
                {
                  return Boolean.valueOf(MarketingHandler.this.setMarketingMessageAsDisplayed(this.val$campaignId));
                }
                
                protected void onPostExecute(Boolean paramAnonymous2Boolean)
                {
                  if (paramAnonymous2Boolean.booleanValue())
                  {
                    if (MarketingHandler.this.mFragmentManager == null) {
                      break label129;
                    }
                    MarketingDialogFragment.newInstance().setData(MarketingHandler.8.this.val$marketingMessage).setCallbacks(MarketingHandler.this.getDialogCallbacks()).setJavaScriptClient(new JavaScriptClient(MarketingHandler.8.this.val$jsCallbacks)).show(MarketingHandler.this.mFragmentManager, "marketing_dialog");
                    if (!Constants.isTestModeEnabled()) {
                      ((MessagingListener)MarketingHandler.this.listeners).localyticsWillDisplayInAppMessage();
                    }
                    MarketingHandler.this.mFragmentManager.executePendingTransactions();
                  }
                  for (;;)
                  {
                    MarketingHandler.access$402(MarketingHandler.this, false);
                    return;
                    label129:
                    MarketingHandler.this.setMarketingMessageAsNotDisplayed(this.val$campaignId);
                  }
                }
              }.execute(new Void[0]);
              return;
            }
          }
          catch (Exception localException)
          {
            LocalyticsManager.throwOrLogError(RuntimeException.class, "Localytics library threw an uncaught exception", localException);
          }
        }
      }
    });
  }
  
  boolean _validateAndStoreFrequencyCappingRule(@NonNull Map<String, Object> paramMap, @NonNull Integer paramInteger)
  {
    Map localMap = (Map)paramMap.get(Constants.FREQUENCY_CAPPING_KEY);
    boolean bool2;
    boolean bool1;
    if (localMap != null) {
      if (paramInteger.intValue() == -1)
      {
        bool2 = true;
        if (!_validateFrequencyCappingRule(localMap, bool2)) {
          break label55;
        }
        bool1 = _saveFrequencyCappingRule(localMap, paramInteger);
      }
    }
    label55:
    int i;
    do
    {
      return bool1;
      bool2 = false;
      break;
      i = paramInteger.intValue();
      bool1 = false;
    } while (i == -1);
    return _saveFrequencyCappingRule(new HashMap(DEFAULT_FREQUENCY_CAPPING_RULE), paramInteger);
  }
  
  boolean _validateFrequencyCappingRule(@NonNull Map<String, Object> paramMap, boolean paramBoolean)
  {
    String[] arrayOfString1;
    int i;
    if (paramBoolean)
    {
      arrayOfString1 = GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS;
      i = arrayOfString1.length;
    }
    for (int j = 0;; j++)
    {
      if (j >= i) {
        break label50;
      }
      if (!paramMap.containsKey(arrayOfString1[j]))
      {
        return false;
        arrayOfString1 = INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS;
        break;
      }
    }
    label50:
    List localList1 = (List)paramMap.get(Constants.DISPLAY_FREQUENCIES_KEY);
    String[] arrayOfString2 = new String[2];
    arrayOfString2[0] = Constants.DAYS_KEY;
    arrayOfString2[1] = Constants.COUNT_KEY;
    if (!_checkFrequencyCappingRuleArray(localList1, arrayOfString2)) {
      return false;
    }
    if (!_additionalFCDisplayFrequencyRulesValidation(localList1)) {
      return false;
    }
    List localList2 = (List)paramMap.get(Constants.BLACKOUT_RULES_KEY);
    if (localList2 != null)
    {
      if (localList2.size() < 1) {
        return false;
      }
      Iterator localIterator = localList2.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        if ((!localMap.containsKey(Constants.TIMES_KEY)) && (!localMap.containsKey(Constants.DATES_KEY)) && (!localMap.containsKey(Constants.WEEKDAYS_KEY))) {
          return false;
        }
        List localList3 = (List)localMap.get(Constants.TIMES_KEY);
        String[] arrayOfString3 = new String[2];
        arrayOfString3[0] = Constants.START_KEY;
        arrayOfString3[1] = Constants.END_KEY;
        if (!_checkFrequencyCappingRuleArray(localList3, arrayOfString3)) {
          return false;
        }
        if (!_additionalFCDatesAndTimesRulesValidation(localList3, TIME_SDF)) {
          return false;
        }
        List localList4 = (List)localMap.get(Constants.DATES_KEY);
        String[] arrayOfString4 = new String[2];
        arrayOfString4[0] = Constants.START_KEY;
        arrayOfString4[1] = Constants.END_KEY;
        if (!_checkFrequencyCappingRuleArray(localList4, arrayOfString4)) {
          return false;
        }
        if (!_additionalFCDatesAndTimesRulesValidation(localList4, DATE_SDF)) {
          return false;
        }
        List localList5 = (List)localMap.get(Constants.WEEKDAYS_KEY);
        if ((localList5 != null) && ((localList5.size() < 1) || (localList5.size() > 7))) {
          return false;
        }
        if (!_additionalFCWeekdaysRulesValidation(localList5)) {
          return false;
        }
      }
    }
    return true;
  }
  
  protected boolean _validateMarketingMessage(MarketingMessage paramMarketingMessage)
  {
    int i = JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "campaign_id");
    String str1 = JsonHelper.getSafeStringFromMap(paramMarketingMessage, "rule_name");
    List localList = JsonHelper.getSafeListFromMap(paramMarketingMessage, "display_events");
    int j = JsonHelper.getSafeIntegerFromMap(paramMarketingMessage, "expiration");
    String str2 = JsonHelper.getSafeStringFromMap(paramMarketingMessage, "location");
    long l = this.mLocalyticsDao.getCurrentTimeMillis() / 1000L;
    return (i != 0) && (!TextUtils.isEmpty(str1)) && (localList != null) && (!TextUtils.isEmpty(str2)) && ((j > l) || (Constants.isTestModeEnabled()));
  }
  
  void dismissCurrentInAppMessage()
  {
    if (this.mFragmentManager == null) {}
    for (;;)
    {
      return;
      try
      {
        Fragment localFragment = this.mFragmentManager.findFragmentByTag("marketing_dialog");
        if ((localFragment instanceof MarketingDialogFragment))
        {
          ((MarketingDialogFragment)localFragment).dismissCampaign();
          return;
        }
      }
      catch (Exception localException)
      {
        LocalyticsManager.throwOrLogError(RuntimeException.class, "Localytics library threw an uncaught exception", localException);
      }
    }
  }
  
  void displayMarketingMessage(String paramString, Map<String, String> paramMap, boolean paramBoolean)
  {
    int i = 1;
    if ("open".equals(paramString))
    {
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = paramString;
      arrayOfObject2[i] = null;
      Message localMessage = obtainMessage(201, arrayOfObject2);
      if (paramBoolean) {}
      for (;;)
      {
        queueMessageDelayed(localMessage, 10000L * i);
        return;
        i = 0;
      }
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramString;
    arrayOfObject1[i] = paramMap;
    queueMessage(obtainMessage(201, arrayOfObject1));
  }
  
  SparseArray<MarketingCallable> getDialogCallbacks()
  {
    SparseArray localSparseArray = new SparseArray();
    localSparseArray.put(1, new MarketingCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        ((MessagingListener)MarketingHandler.this.listeners).localyticsDidDismissInAppMessage();
        return null;
      }
    });
    localSparseArray.put(2, new MarketingCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        String str = (String)paramAnonymousArrayOfObject[0];
        Map localMap = (Map)paramAnonymousArrayOfObject[1];
        MarketingHandler.this.mLocalyticsDao.tagEvent(str, localMap);
        return null;
      }
    });
    localSparseArray.put(16, new MarketingCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        ((MessagingListener)MarketingHandler.this.listeners).localyticsDidDisplayInAppMessage();
        return null;
      }
    });
    localSparseArray.put(17, new MarketingCallable()
    {
      public Object call(Object[] paramAnonymousArrayOfObject)
      {
        ((MessagingListener)MarketingHandler.this.listeners).localyticsWillDismissInAppMessage();
        return null;
      }
    });
    return localSparseArray;
  }
  
  Localytics.InAppMessageDismissButtonLocation getInAppDismissButtonLocation()
  {
    return MarketingDialogFragment.getInAppDismissButtonLocation();
  }
  
  List<MarketingMessage> getMarketingMessages()
  {
    getList(new Callable()
    {
      /* Error */
      public List call()
      {
        // Byte code:
        //   0: new 29	java/util/ArrayList
        //   3: dup
        //   4: invokespecial 30	java/util/ArrayList:<init>	()V
        //   7: astore_1
        //   8: aconst_null
        //   9: astore_2
        //   10: aload_0
        //   11: getfield 18	com/localytics/android/MarketingHandler$9:this$0	Lcom/localytics/android/MarketingHandler;
        //   14: getfield 34	com/localytics/android/MarketingHandler:mProvider	Lcom/localytics/android/BaseProvider;
        //   17: ldc 36
        //   19: aconst_null
        //   20: aconst_null
        //   21: aconst_null
        //   22: ldc 38
        //   24: invokevirtual 44	com/localytics/android/BaseProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //   27: astore_2
        //   28: aload_2
        //   29: invokeinterface 50 1 0
        //   34: ifeq +511 -> 545
        //   37: new 52	com/localytics/android/MarketingMessage
        //   40: dup
        //   41: invokespecial 53	com/localytics/android/MarketingMessage:<init>	()V
        //   44: astore 5
        //   46: aload 5
        //   48: ldc 55
        //   50: aload_2
        //   51: aload_2
        //   52: ldc 55
        //   54: invokeinterface 59 2 0
        //   59: invokeinterface 63 2 0
        //   64: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   67: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   70: pop
        //   71: aload 5
        //   73: ldc 38
        //   75: aload_2
        //   76: aload_2
        //   77: ldc 38
        //   79: invokeinterface 59 2 0
        //   84: invokeinterface 63 2 0
        //   89: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   92: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   95: pop
        //   96: aload 5
        //   98: ldc 75
        //   100: aload_2
        //   101: aload_2
        //   102: ldc 75
        //   104: invokeinterface 59 2 0
        //   109: invokeinterface 63 2 0
        //   114: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   117: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   120: pop
        //   121: aload 5
        //   123: ldc 77
        //   125: aload_2
        //   126: aload_2
        //   127: ldc 77
        //   129: invokeinterface 59 2 0
        //   134: invokeinterface 63 2 0
        //   139: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   142: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   145: pop
        //   146: aload 5
        //   148: ldc 79
        //   150: aload_2
        //   151: aload_2
        //   152: ldc 79
        //   154: invokeinterface 59 2 0
        //   159: invokeinterface 63 2 0
        //   164: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   167: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   170: pop
        //   171: aload 5
        //   173: ldc 81
        //   175: aload_2
        //   176: aload_2
        //   177: ldc 81
        //   179: invokeinterface 59 2 0
        //   184: invokeinterface 85 2 0
        //   189: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   192: pop
        //   193: aload 5
        //   195: ldc 87
        //   197: aload_2
        //   198: aload_2
        //   199: ldc 87
        //   201: invokeinterface 59 2 0
        //   206: invokeinterface 85 2 0
        //   211: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   214: pop
        //   215: aload 5
        //   217: ldc 89
        //   219: aload_2
        //   220: aload_2
        //   221: ldc 89
        //   223: invokeinterface 59 2 0
        //   228: invokeinterface 63 2 0
        //   233: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   236: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   239: pop
        //   240: aload 5
        //   242: ldc 91
        //   244: aload_2
        //   245: aload_2
        //   246: ldc 91
        //   248: invokeinterface 59 2 0
        //   253: invokeinterface 63 2 0
        //   258: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   261: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   264: pop
        //   265: aload 5
        //   267: ldc 93
        //   269: aload_2
        //   270: aload_2
        //   271: ldc 93
        //   273: invokeinterface 59 2 0
        //   278: invokeinterface 85 2 0
        //   283: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   286: pop
        //   287: aload 5
        //   289: ldc 95
        //   291: aload_2
        //   292: aload_2
        //   293: ldc 95
        //   295: invokeinterface 59 2 0
        //   300: invokeinterface 63 2 0
        //   305: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   308: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   311: pop
        //   312: aload 5
        //   314: ldc 97
        //   316: aload_2
        //   317: aload_2
        //   318: ldc 97
        //   320: invokeinterface 59 2 0
        //   325: invokeinterface 63 2 0
        //   330: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   333: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   336: pop
        //   337: aload 5
        //   339: ldc 99
        //   341: aload_2
        //   342: aload_2
        //   343: ldc 99
        //   345: invokeinterface 59 2 0
        //   350: invokeinterface 63 2 0
        //   355: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   358: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   361: pop
        //   362: aload 5
        //   364: ldc 101
        //   366: aload_2
        //   367: aload_2
        //   368: ldc 101
        //   370: invokeinterface 59 2 0
        //   375: invokeinterface 63 2 0
        //   380: invokestatic 69	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   383: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   386: pop
        //   387: aload 5
        //   389: ldc 103
        //   391: aload_2
        //   392: aload_2
        //   393: ldc 103
        //   395: invokeinterface 59 2 0
        //   400: invokeinterface 85 2 0
        //   405: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   408: pop
        //   409: aload 5
        //   411: ldc 105
        //   413: aload_2
        //   414: aload_2
        //   415: ldc 105
        //   417: invokeinterface 59 2 0
        //   422: invokeinterface 85 2 0
        //   427: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   430: pop
        //   431: aload 5
        //   433: ldc 107
        //   435: aload_2
        //   436: aload_2
        //   437: ldc 107
        //   439: invokeinterface 59 2 0
        //   444: invokeinterface 85 2 0
        //   449: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   452: pop
        //   453: aload 5
        //   455: ldc 109
        //   457: aload_2
        //   458: aload_2
        //   459: ldc 109
        //   461: invokeinterface 59 2 0
        //   466: invokeinterface 85 2 0
        //   471: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   474: pop
        //   475: aload 5
        //   477: ldc 111
        //   479: aload_2
        //   480: aload_2
        //   481: ldc 111
        //   483: invokeinterface 59 2 0
        //   488: invokeinterface 85 2 0
        //   493: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   496: pop
        //   497: aload 5
        //   499: ldc 113
        //   501: aload_2
        //   502: aload_2
        //   503: ldc 113
        //   505: invokeinterface 59 2 0
        //   510: invokeinterface 85 2 0
        //   515: invokevirtual 73	com/localytics/android/MarketingMessage:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   518: pop
        //   519: aload_1
        //   520: aload 5
        //   522: invokevirtual 117	java/util/ArrayList:add	(Ljava/lang/Object;)Z
        //   525: pop
        //   526: goto -498 -> 28
        //   529: astore 4
        //   531: aconst_null
        //   532: astore_1
        //   533: aload_2
        //   534: ifnull +9 -> 543
        //   537: aload_2
        //   538: invokeinterface 120 1 0
        //   543: aload_1
        //   544: areturn
        //   545: aload_2
        //   546: ifnull -3 -> 543
        //   549: aload_2
        //   550: invokeinterface 120 1 0
        //   555: aload_1
        //   556: areturn
        //   557: astore_3
        //   558: aload_2
        //   559: ifnull +9 -> 568
        //   562: aload_2
        //   563: invokeinterface 120 1 0
        //   568: aload_3
        //   569: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	570	0	this	9
        //   7	549	1	localArrayList	ArrayList
        //   9	554	2	localCursor	Cursor
        //   557	12	3	localObject	Object
        //   529	1	4	localException	Exception
        //   44	477	5	localMarketingMessage	MarketingMessage
        // Exception table:
        //   from	to	target	type
        //   10	28	529	java/lang/Exception
        //   28	526	529	java/lang/Exception
        //   10	28	557	finally
        //   28	526	557	finally
      }
    });
  }
  
  protected BaseUploadThread getUploadThread(TreeMap<Integer, Object> paramTreeMap, String paramString)
  {
    return new MarketingDownloader(this, paramTreeMap, paramString, this.mLocalyticsDao);
  }
  
  protected void handleMessageExtended(Message paramMessage)
    throws Exception
  {
    switch (paramMessage.what)
    {
    case 202: 
    default: 
      super.handleMessageExtended(paramMessage);
      return;
    case 201: 
      Localytics.Log.d("In-app handler received MESSAGE_INAPP_TRIGGER");
      Object[] arrayOfObject = (Object[])paramMessage.obj;
      final String str = (String)arrayOfObject[0];
      final Map localMap = (Map)arrayOfObject[1];
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          MarketingHandler.this._marketingTrigger(str, localMap);
        }
      });
      return;
    case 203: 
      Localytics.Log.d("In-app handler received MESSAGE_SHOW_INAPP_TEST");
      _upload(true, (String)paramMessage.obj);
      new Handler(Looper.getMainLooper()).postDelayed(new Runnable()
      {
        public void run()
        {
          MarketingHandler.this.__showMarketingTest();
        }
      }, 1000L);
      return;
    case 204: 
      Localytics.Log.d("In-app handler received MESSAGE_HANDLE_PUSH_RECEIVED");
      final Intent localIntent = (Intent)paramMessage.obj;
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          MarketingHandler.this._handlePushReceived(localIntent);
        }
      });
      return;
    }
    Localytics.Log.d("Marketing handler received MESSAGE_SET_MARKETING_MESSAGE_AS_NOT_DISPLAYED");
    final int i = ((Integer)paramMessage.obj).intValue();
    this.mProvider.runBatchTransaction(new Runnable()
    {
      public void run()
      {
        MarketingHandler.this._setMarketingMessageAsNotDisplayed(i);
      }
    });
  }
  
  void handleNotificationReceived(Intent paramIntent)
  {
    queueMessage(obtainMessage(204, paramIntent));
  }
  
  void handlePushNotificationOpened(Intent paramIntent)
  {
    if ((paramIntent == null) || (paramIntent.getExtras() == null)) {}
    String str1;
    do
    {
      return;
      str1 = paramIntent.getExtras().getString("ll");
    } while (str1 == null);
    try
    {
      JSONObject localJSONObject = new JSONObject(str1);
      String str2 = localJSONObject.getString("ca");
      String str3 = localJSONObject.getString("cr");
      String str4 = localJSONObject.optString("v", "1");
      String str5 = localJSONObject.optString("t", null);
      if (TextUtils.isEmpty(str5)) {
        str5 = "Alert";
      }
      if ((str2 != null) && (str3 != null))
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("Campaign ID", str2);
        localHashMap.put("Creative ID", str3);
        localHashMap.put("Creative Type", str5);
        localHashMap.put("Action", "Click");
        localHashMap.put("Schema Version - Client", String.valueOf(3));
        localHashMap.put("Schema Version - Server", str4);
        this.mLocalyticsDao.tagEvent("Localytics Push Opened", localHashMap);
      }
      paramIntent.removeExtra("ll");
      return;
    }
    catch (JSONException localJSONException)
    {
      Localytics.Log.w("Failed to get campaign id or creative id from payload");
    }
  }
  
  void handleTestModeIntent(Intent paramIntent)
  {
    if (paramIntent == null) {
      throw new IllegalArgumentException("intent cannot be null");
    }
    Uri localUri = paramIntent.getData();
    if ((localUri == null) || (localUri.getScheme() == null) || (!localUri.getScheme().equals("amp" + this.mLocalyticsDao.getApiKey()))) {}
    final String str3;
    final String str4;
    final String str5;
    final Context localContext;
    do
    {
      String[] arrayOfString;
      do
      {
        String str2;
        do
        {
          return;
          String str1 = localUri.getPath().substring(1);
          str2 = localUri.getHost();
          arrayOfString = str1.split("[/]");
        } while ((arrayOfString == null) || (arrayOfString.length == 0) || (TextUtils.isEmpty(str2)) || (!str2.equalsIgnoreCase("testMode")));
        if (arrayOfString[0].equalsIgnoreCase("enabled"))
        {
          this.mLocalyticsDao.setTestModeEnabled(true);
          return;
        }
      } while ((!arrayOfString[0].equalsIgnoreCase("launch")) || (!arrayOfString[1].equalsIgnoreCase("push")));
      str3 = arrayOfString[2];
      str4 = arrayOfString[3];
      str5 = this.mLocalyticsDao.getCustomerIdInMemory();
      localContext = this.mLocalyticsDao.getAppContext();
    } while ((TextUtils.isEmpty(str3)) || (TextUtils.isEmpty(str4)));
    new AsyncTask()
    {
      protected String doInBackground(Void... paramAnonymousVarArgs)
      {
        return MarketingHandler.this.mLocalyticsDao.getPushRegistrationId();
      }
      
      protected void onPostExecute(final String paramAnonymousString)
      {
        new AsyncTask()
        {
          protected String doInBackground(Void... paramAnonymous2VarArgs)
          {
            String str1;
            String str2;
            if (!TextUtils.isEmpty(paramAnonymousString))
            {
              str1 = MarketingHandler.this.mLocalyticsDao.getInstallationId();
              Object[] arrayOfObject = new Object[5];
              arrayOfObject[0] = MarketingHandler.7.this.val$campaign;
              arrayOfObject[1] = MarketingHandler.7.this.val$creative;
              arrayOfObject[2] = paramAnonymousString;
              arrayOfObject[3] = str1;
              arrayOfObject[4] = Long.toString(Math.round(MarketingHandler.this.mLocalyticsDao.getCurrentTimeMillis() / 1000.0D));
              str2 = String.format("http://pushapi.localytics.com/push_test?platform=android&type=prod&campaign=%s&creative=%s&token=%s&install_id=%s&client_ts=%s", arrayOfObject);
              localHttpURLConnection = null;
            }
            try
            {
              Proxy localProxy = MarketingHandler.this.mLocalyticsDao.getProxy();
              localHttpURLConnection = (HttpURLConnection)BaseUploadThread.createURLConnection(new URL(str2), localProxy);
              localHttpURLConnection.setConnectTimeout(5000);
              localHttpURLConnection.setReadTimeout(5000);
              localHttpURLConnection.setDoOutput(false);
              localHttpURLConnection.setRequestProperty("x-install-id", str1);
              localHttpURLConnection.setRequestProperty("x-app-id", DatapointHelper.getAppVersion(MarketingHandler.this.mLocalyticsDao.getAppContext()));
              localHttpURLConnection.setRequestProperty("x-client-version", "androida_3.4.0");
              localHttpURLConnection.setRequestProperty("x-app-version", DatapointHelper.getAppVersion(MarketingHandler.this.mLocalyticsDao.getAppContext()));
              localHttpURLConnection.setRequestProperty("x-customer-id", MarketingHandler.7.this.val$customerID);
              localHttpURLConnection.getInputStream();
              if (localHttpURLConnection != null) {
                localHttpURLConnection.disconnect();
              }
              localObject1 = null;
            }
            catch (Exception localException)
            {
              StringBuilder localStringBuilder = new StringBuilder("Unfortunately, something went wrong. Push test activation was unsuccessful.");
              if ((!Localytics.isLoggingEnabled()) || (!(localException instanceof FileNotFoundException))) {
                break label311;
              }
              localStringBuilder.append("\n\nCause:\nPush registration token has not yet been processed. Please wait a few minutes and try again.");
              Localytics.Log.e("Activating push test has failed", localException);
              String str3 = localStringBuilder.toString();
              Object localObject1 = str3;
              return (String)localObject1;
            }
            finally
            {
              if (localHttpURLConnection == null) {
                break label345;
              }
              localHttpURLConnection.disconnect();
            }
            return (String)localObject1;
          }
          
          protected void onPostExecute(String paramAnonymous2String)
          {
            if (paramAnonymous2String != null) {
              Toast.makeText(MarketingHandler.7.this.val$appContext, paramAnonymous2String, 1).show();
            }
          }
          
          protected void onPreExecute()
          {
            if (!TextUtils.isEmpty(paramAnonymousString))
            {
              Toast.makeText(MarketingHandler.7.this.val$appContext, "Push Test Activated\nYou should receive a notification soon.", 1).show();
              return;
            }
            Toast.makeText(MarketingHandler.7.this.val$appContext, "App isn't registered with GCM to receive push notifications. Please make sure that Localytics.registerPush(<PROJECT_ID>) has been called.", 1).show();
          }
        }.execute(new Void[0]);
      }
    }.execute(new Void[0]);
  }
  
  public void localyticsDidTagEvent(String paramString, Map<String, String> paramMap, long paramLong)
  {
    this.mLocalyticsDao.triggerInAppMessage(paramString, paramMap);
  }
  
  public void localyticsSessionDidOpen(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (!paramBoolean3) {
      upload(this.mLocalyticsDao.getCustomerIdInMemory());
    }
    if (!Constants.isTestModeEnabled())
    {
      if (paramBoolean1) {
        this.mLocalyticsDao.triggerInAppMessage("AMP First Run");
      }
      if (paramBoolean2) {
        this.mLocalyticsDao.triggerInAppMessage("AMP upgrade");
      }
      if (!paramBoolean3)
      {
        this.sessionStartMarketingMessageShown = false;
        this.mLocalyticsDao.triggerInAppMessage("open", null, true);
      }
    }
  }
  
  public void localyticsSessionWillClose() {}
  
  public void localyticsSessionWillOpen(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {}
  
  void setDismissButtonImage(Bitmap paramBitmap)
  {
    MarketingDialogFragment.setDismissButtonImage(paramBitmap);
  }
  
  void setFragmentManager(FragmentManager paramFragmentManager)
  {
    this.mFragmentManager = paramFragmentManager;
  }
  
  void setInAppDismissButtonLocation(Localytics.InAppMessageDismissButtonLocation paramInAppMessageDismissButtonLocation)
  {
    MarketingDialogFragment.setInAppDismissButtonLocation(paramInAppMessageDismissButtonLocation);
  }
  
  boolean setMarketingMessageAsDisplayed(final int paramInt)
  {
    getBool(new Callable()
    {
      public Boolean call()
        throws Exception
      {
        return Boolean.valueOf(MarketingHandler.this._setMarketingMessageAsDisplayed(paramInt));
      }
    });
  }
  
  void showMarketingTest()
  {
    queueMessage(obtainMessage(203, this.mLocalyticsDao.getCustomerIdInMemory()));
  }
  
  public static enum FrequencyCappingFilter
  {
    static
    {
      BLACKOUT = new FrequencyCappingFilter("BLACKOUT", 2);
      FrequencyCappingFilter[] arrayOfFrequencyCappingFilter = new FrequencyCappingFilter[3];
      arrayOfFrequencyCappingFilter[0] = FREQUENCY;
      arrayOfFrequencyCappingFilter[1] = MAX_COUNT;
      arrayOfFrequencyCappingFilter[2] = BLACKOUT;
      $VALUES = arrayOfFrequencyCappingFilter;
    }
    
    private FrequencyCappingFilter() {}
  }
  
  private final class MessagingListenersSet
    extends BaseHandler.ListenersSet
    implements MessagingListener
  {
    private MessagingListenersSet()
    {
      super();
    }
    
    public void localyticsDidDismissInAppMessage()
    {
      try
      {
        callListeners("localyticsDidDismissInAppMessage", null, null);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsDidDisplayInAppMessage()
    {
      try
      {
        callListeners("localyticsDidDisplayInAppMessage", null, null);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsWillDismissInAppMessage()
    {
      try
      {
        callListeners("localyticsWillDismissInAppMessage", null, null);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsWillDisplayInAppMessage()
    {
      try
      {
        callListeners("localyticsWillDisplayInAppMessage", null, null);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */