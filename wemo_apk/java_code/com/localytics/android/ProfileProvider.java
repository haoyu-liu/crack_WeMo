package com.localytics.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.provider.BaseColumns;
import java.io.File;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

class ProfileProvider
  extends BaseProvider
{
  static final int DATABASE_VERSION = 1;
  
  ProfileProvider(LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
  }
  
  ProfileProvider(String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = DatapointHelper.getSha256_buggy(paramLocalyticsDao.getApiKey());
    arrayOfObject[1] = paramString;
    this.mDb = new ProfileDatabaseHelper(String.format("com.localytics.android.%s.%s.sqlite", arrayOfObject), 1, paramLocalyticsDao).getWritableDatabase();
  }
  
  boolean canAddToDB()
  {
    return new File(this.mDb.getPath()).length() < maxSiloDbSize();
  }
  
  long maxSiloDbSize()
  {
    return Constants.dbMaxSizeForProfiles;
  }
  
  static final class ProfileDatabaseHelper
    extends BaseProvider.LocalyticsDatabaseHelper
  {
    ProfileDatabaseHelper(String paramString, int paramInt, LocalyticsDao paramLocalyticsDao)
    {
      super(paramInt, paramLocalyticsDao);
    }
    
    protected void migrateV2ToV3(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)", new Object[] { "changes", "_id", "scope", "change", "customer_id" }));
      if (oldDB != null)
      {
        SQLiteDatabase localSQLiteDatabase = oldDB;
        Cursor localCursor = null;
        try
        {
          ContentValues localContentValues = new ContentValues();
          localCursor = oldDB.query("profile", null, null, null, null, null, "_id ASC");
          for (;;)
          {
            boolean bool = localCursor.moveToNext();
            if (!bool) {
              break;
            }
            try
            {
              JSONObject localJSONObject1 = new JSONObject(localCursor.getString(localCursor.getColumnIndexOrThrow("attribute")));
              JSONObject localJSONObject2 = new JSONObject();
              localJSONObject2.put("op", ProfileHandler.ProfileOperation.ASSIGN.getOperationString());
              String str = (String)localJSONObject1.keys().next();
              localJSONObject2.put("attr", str);
              localJSONObject2.put("value", localJSONObject1.get(str));
              localContentValues.put("scope", Localytics.ProfileScope.APPLICATION.getScope());
              localContentValues.put("change", localJSONObject2.toString());
              localContentValues.put("customer_id", localCursor.getString(localCursor.getColumnIndexOrThrow("customer_id")));
              paramSQLiteDatabase.insert("changes", null, localContentValues);
              localContentValues.clear();
            }
            catch (JSONException localJSONException)
            {
              Localytics.Log.w("Caught JSON exception", localJSONException);
            }
          }
          return;
        }
        finally
        {
          if (localCursor != null) {}
          try
          {
            localCursor.close();
            throw ((Throwable)localObject1);
          }
          finally
          {
            throw ((Throwable)localObject2);
            cleanUpOldDB();
            if (localCursor == null) {}
          }
        }
      }
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      if (paramSQLiteDatabase == null) {
        throw new IllegalArgumentException("db cannot be null");
      }
      paramSQLiteDatabase.execSQL("PRAGMA auto_vacuum = INCREMENTAL;");
      onUpgrade(paramSQLiteDatabase, 0, 1);
    }
    
    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      super.onOpen(paramSQLiteDatabase);
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = DatabaseUtils.stringForQuery(paramSQLiteDatabase, "select sqlite_version()", null);
      Localytics.Log.v(String.format("SQLite library version is: %s", arrayOfObject));
      if (!paramSQLiteDatabase.isReadOnly()) {
        paramSQLiteDatabase.execSQL("PRAGMA foreign_keys = ON;");
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      if (paramInt1 < 1) {
        migrateV2ToV3(paramSQLiteDatabase);
      }
    }
  }
  
  static final class ProfileV3Columns
    implements BaseColumns
  {
    static final String CHANGE = "change";
    static final String CUSTOMER_ID = "customer_id";
    static final String DATABASE = "scope";
    static final String TABLE_NAME = "changes";
    
    private ProfileV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ProfileProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */