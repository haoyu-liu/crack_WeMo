package com.localytics.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Looper;
import android.os.Message;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class ProfileHandler
  extends BaseHandler
{
  static final String ATTRIBUTE_JSON_KEY_KEY = "attr";
  static final String ATTRIBUTE_JSON_OP_KEY = "op";
  static final String ATTRIBUTE_JSON_VALUE_KEY = "value";
  private static final int MESSAGE_SET_PROFILE_ATTRIBUTE = 301;
  
  ProfileHandler(LocalyticsDao paramLocalyticsDao, Looper paramLooper)
  {
    super(paramLocalyticsDao, paramLooper);
    this.siloName = "Profile";
    this.listeners = new ProfileListenersSet(null);
    queueMessage(obtainMessage(1));
  }
  
  private void _setAttribute(String paramString1, String paramString2, String paramString3)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("scope", paramString2);
    localContentValues.put("change", paramString1);
    localContentValues.put("customer_id", paramString3);
    this.mProvider.insert("changes", localContentValues);
  }
  
  private static boolean checkAttributeName(String paramString)
  {
    if (paramString == null)
    {
      LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attribute name cannot be null");
      return false;
    }
    if (paramString.trim().length() == 0)
    {
      LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attribute name cannot be empty");
      return false;
    }
    return true;
  }
  
  private static Object convertDateToString(Object paramObject)
  {
    SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String str;
    if ((paramObject instanceof Date)) {
      str = localSimpleDateFormat.format(paramObject);
    }
    boolean bool;
    do
    {
      return str;
      bool = paramObject instanceof Date[];
      str = null;
    } while (!bool);
    ArrayList localArrayList = new ArrayList();
    Date[] arrayOfDate = (Date[])paramObject;
    int i = arrayOfDate.length;
    int j = 0;
    if (j < i)
    {
      Date localDate = arrayOfDate[j];
      if (localDate != null) {
        localArrayList.add(localSimpleDateFormat.format(localDate));
      }
      for (;;)
      {
        j++;
        break;
        localArrayList.add(null);
      }
    }
    return localArrayList.toArray();
  }
  
  private static Long[] convertToObjectArray(long[] paramArrayOfLong)
  {
    Long[] arrayOfLong = new Long[paramArrayOfLong.length];
    int i = 0;
    int j = paramArrayOfLong.length;
    for (int k = 0; k < j; k++)
    {
      arrayOfLong[i] = Long.valueOf(paramArrayOfLong[k]);
      i++;
    }
    return arrayOfLong;
  }
  
  private void saveAttributeChange(ProfileOperation paramProfileOperation, String paramString1, Object paramObject, String paramString2)
  {
    if (checkAttributeName(paramString1)) {
      try
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("op", paramProfileOperation.getOperationString());
        localJSONObject.put("attr", paramString1);
        if ((paramObject instanceof Object[]))
        {
          JSONArray localJSONArray = new JSONArray();
          Object[] arrayOfObject1 = (Object[])paramObject;
          int i = arrayOfObject1.length;
          for (int j = 0; j < i; j++) {
            localJSONArray.put(arrayOfObject1[j]);
          }
          localJSONObject.put("value", localJSONArray);
        }
        for (;;)
        {
          Object[] arrayOfObject2 = new Object[3];
          arrayOfObject2[0] = localJSONObject.toString();
          arrayOfObject2[1] = paramString2;
          arrayOfObject2[2] = this.mLocalyticsDao.getCustomerIdInMemory();
          queueMessage(obtainMessage(301, arrayOfObject2));
          return;
          if (paramObject != null) {
            localJSONObject.put("value", paramObject);
          }
        }
        return;
      }
      catch (JSONException localJSONException)
      {
        Localytics.Log.w("Caught JSON exception", localJSONException);
      }
    }
  }
  
  protected void _deleteUploadedData(int paramInt)
  {
    this.mProvider.remove("changes", "_id <= " + paramInt, null);
  }
  
  protected TreeMap<Integer, Object> _getDataToUpload()
  {
    TreeMap localTreeMap = new TreeMap();
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("changes", null, null, null, "_id ASC");
      Object localObject2 = null;
      Object localObject3 = null;
      while ((localCursor.moveToNext()) && (localTreeMap.size() < 50.0D))
      {
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
        String str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("change"));
        String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("customer_id"));
        String str3 = localCursor.getString(localCursor.getColumnIndex("scope"));
        if (localObject2 == null)
        {
          localObject2 = str2;
          localObject3 = str3;
        }
        if ((!((String)localObject2).equals(str2)) || (!((String)localObject3).equals(str3))) {
          break;
        }
        localTreeMap.put(Integer.valueOf(i), new Object[] { str2, str3, str1 });
      }
      while (localCursor == null) {}
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
      return localTreeMap;
    }
    localCursor.close();
    return localTreeMap;
  }
  
  protected int _getMaxRowToUpload()
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("changes", new String[] { "_id" }, null, null, "_id ASC");
      boolean bool = localCursor.moveToLast();
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
    return 0;
  }
  
  protected void _init()
  {
    this.mProvider = new ProfileProvider(this.siloName.toLowerCase(), this.mLocalyticsDao);
    this.mProvider.vacuumIfNecessary();
  }
  
  protected void _onUploadCompleted(String paramString)
  {
    this.mProvider.vacuumIfNecessary();
  }
  
  void addProfileAttributesToSet(String paramString1, long[] paramArrayOfLong, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETADD, paramString1, convertToObjectArray(paramArrayOfLong), paramString2);
  }
  
  void addProfileAttributesToSet(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETADD, paramString1, paramArrayOfString, paramString2);
  }
  
  void addProfileAttributesToSet(String paramString1, Date[] paramArrayOfDate, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETADD, paramString1, convertDateToString(paramArrayOfDate), paramString2);
  }
  
  void deleteProfileAttribute(String paramString1, String paramString2)
  {
    saveAttributeChange(ProfileOperation.DELETE, paramString1, null, paramString2);
  }
  
  protected BaseUploadThread getUploadThread(TreeMap<Integer, Object> paramTreeMap, String paramString)
  {
    return new ProfileUploadHandler(this, paramTreeMap, paramString, this.mLocalyticsDao);
  }
  
  protected void handleMessageExtended(Message paramMessage)
    throws Exception
  {
    switch (paramMessage.what)
    {
    default: 
      super.handleMessageExtended(paramMessage);
      return;
    }
    Localytics.Log.d("Profile handler received MESSAGE_SET_PROFILE_ATTRIBUTE");
    Object[] arrayOfObject = (Object[])paramMessage.obj;
    final String str1 = (String)arrayOfObject[0];
    final String str2 = (String)arrayOfObject[1];
    final String str3 = (String)arrayOfObject[2];
    this.mProvider.runBatchTransaction(new Runnable()
    {
      public void run()
      {
        ProfileHandler.this._setAttribute(str1, str2, str3);
      }
    });
  }
  
  void incrementProfileAttribute(String paramString1, long paramLong, String paramString2)
  {
    saveAttributeChange(ProfileOperation.INCREMENT, paramString1, Long.valueOf(paramLong), paramString2);
  }
  
  void removeProfileAttributesFromSet(String paramString1, long[] paramArrayOfLong, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETREMOVE, paramString1, convertToObjectArray(paramArrayOfLong), paramString2);
  }
  
  void removeProfileAttributesFromSet(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETREMOVE, paramString1, paramArrayOfString, paramString2);
  }
  
  void removeProfileAttributesFromSet(String paramString1, Date[] paramArrayOfDate, String paramString2)
  {
    saveAttributeChange(ProfileOperation.SETREMOVE, paramString1, convertDateToString(paramArrayOfDate), paramString2);
  }
  
  void setProfileAttribute(String paramString1, long paramLong, String paramString2)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, Long.valueOf(paramLong), paramString2);
  }
  
  void setProfileAttribute(String paramString1, String paramString2, String paramString3)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, paramString2, paramString3);
  }
  
  void setProfileAttribute(String paramString1, Date paramDate, String paramString2)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, convertDateToString(paramDate), paramString2);
  }
  
  void setProfileAttribute(String paramString1, long[] paramArrayOfLong, String paramString2)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, convertToObjectArray(paramArrayOfLong), paramString2);
  }
  
  void setProfileAttribute(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, paramArrayOfString, paramString2);
  }
  
  void setProfileAttribute(String paramString1, Date[] paramArrayOfDate, String paramString2)
  {
    saveAttributeChange(ProfileOperation.ASSIGN, paramString1, convertDateToString(paramArrayOfDate), paramString2);
  }
  
  private final class ProfileListenersSet
    extends BaseHandler.ListenersSet
  {
    private ProfileListenersSet()
    {
      super();
    }
  }
  
  static enum ProfileOperation
  {
    private final String operation;
    
    static
    {
      INCREMENT = new ProfileOperation("INCREMENT", 4, "increment");
      ProfileOperation[] arrayOfProfileOperation = new ProfileOperation[5];
      arrayOfProfileOperation[0] = ASSIGN;
      arrayOfProfileOperation[1] = DELETE;
      arrayOfProfileOperation[2] = SETADD;
      arrayOfProfileOperation[3] = SETREMOVE;
      arrayOfProfileOperation[4] = INCREMENT;
      $VALUES = arrayOfProfileOperation;
    }
    
    private ProfileOperation(String paramString)
    {
      this.operation = paramString;
    }
    
    public String getOperationString()
    {
      return this.operation;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ProfileHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */