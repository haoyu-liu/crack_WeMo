package com.localytics.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.provider.BaseColumns;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class MarketingProvider
  extends BaseProvider
{
  static final int DATABASE_VERSION = 3;
  
  MarketingProvider(LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
  }
  
  MarketingProvider(String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = DatapointHelper.getSha256_buggy(paramLocalyticsDao.getApiKey());
    arrayOfObject[1] = paramString;
    this.mDb = new MarketingDatabaseHelper(String.format("com.localytics.android.%s.%s.sqlite", arrayOfObject), 3, paramLocalyticsDao).getWritableDatabase();
  }
  
  boolean canAddToDB()
  {
    return true;
  }
  
  long maxSiloDbSize()
  {
    return Long.MAX_VALUE;
  }
  
  static final class CamapignsDisplayedV3Columns
    implements BaseColumns
  {
    static final String CAMPAIGN_ID = "campaign_id";
    static final String DATE = "date";
    static final String IGNORE_GLOBAL = "ignore_global";
    static final String TABLE_NAME = "campaigns_displayed";
    
    private CamapignsDisplayedV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class FrequencyCappingBlackoutDateV3Columns
    implements BaseColumns
  {
    static final String END_DATE = "end";
    static final String FREQUENCY_ID = "frequency_id";
    static final String RULE_GROUP_ID = "rule_group_id";
    static final String START_DATE = "start";
    static final String TABLE_NAME = "frequency_capping_blackout_dates";
    
    private FrequencyCappingBlackoutDateV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class FrequencyCappingBlackoutTimeV3Columns
    implements BaseColumns
  {
    static final String END_TIME = "end";
    static final String FREQUENCY_ID = "frequency_id";
    static final String RULE_GROUP_ID = "rule_group_id";
    static final String START_TIME = "start";
    static final String TABLE_NAME = "frequency_capping_blackout_times";
    
    private FrequencyCappingBlackoutTimeV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class FrequencyCappingBlackoutWeekdayV3Columns
    implements BaseColumns
  {
    static final String DAY = "day";
    static final String FREQUENCY_ID = "frequency_id";
    static final String RULE_GROUP_ID = "rule_group_id";
    static final String TABLE_NAME = "frequency_capping_blackout_weekdays";
    
    private FrequencyCappingBlackoutWeekdayV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class FrequencyCappingDisplayFrequencyV3Columns
    implements BaseColumns
  {
    static final String DISPLAY_FREQUENCY_COUNT = "count";
    static final String DISPLAY_FREQUENCY_DAYS = "days";
    static final String FREQUENCY_ID = "frequency_id";
    static final String TABLE_NAME = "frequency_capping_display_frequencies";
    
    private FrequencyCappingDisplayFrequencyV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class FrequencyCappingV3Columns
    implements BaseColumns
  {
    static final String CAMPAIGN_ID = "campaign_id";
    static final String IGNORE_GLOBAL = "ignore_global";
    static final String MAX_DISPLAY_COUNT = "max_display_count";
    static final String TABLE_NAME = "frequency_capping_rules";
    
    private FrequencyCappingV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class MarketingConditionValuesV3Columns
    implements BaseColumns
  {
    static final String CONDITION_ID_REF = "condition_id_ref";
    static final String TABLE_NAME = "marketing_condition_values";
    static final String VALUE = "value";
    
    private MarketingConditionValuesV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class MarketingConditionsV3Columns
    implements BaseColumns
  {
    static final String ATTRIBUTE_NAME = "attribute_name";
    static final String OPERATOR = "operator";
    static final String RULE_ID_REF = "rule_id_ref";
    static final String TABLE_NAME = "marketing_conditions";
    
    private MarketingConditionsV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static class MarketingDatabaseHelper
    extends BaseProvider.LocalyticsDatabaseHelper
  {
    MarketingDatabaseHelper(String paramString, int paramInt, LocalyticsDao paramLocalyticsDao)
    {
      super(paramInt, paramLocalyticsDao);
    }
    
    protected void addControlGroup(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER DEFAULT 0;", new Object[] { "marketing_rules", "control_group" }));
    }
    
    protected void addNonUniqueRuleName(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "marketing_rules", "rule_name_non_unique" }));
      paramSQLiteDatabase.execSQL(String.format("UPDATE %s SET %s = %s;", new Object[] { "marketing_rules", "rule_name_non_unique", "rule_name" }));
    }
    
    protected void addSchemaVersion(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER DEFAULT 1;", new Object[] { "marketing_rules", "schema_version" }));
    }
    
    protected void migrateV2ToV3(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)", new Object[] { "marketing_rules", "_id", "campaign_id", "expiration", "display_seconds", "display_session", "version", "phone_location", "phone_size_width", "phone_size_height", "tablet_location", "tablet_size_width", "tablet_size_height", "time_to_display", "internet_required", "ab_test", "rule_name", "location", "devices" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "marketing_ruleevent", "_id", "event_name", "rule_id_ref", "marketing_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY);", new Object[] { "marketing_displayed", "campaign_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "marketing_conditions", "_id", "attribute_name", "operator", "rule_id_ref", "marketing_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "marketing_condition_values", "_id", "value", "condition_id_ref", "marketing_conditions", "_id" }));
      SQLiteDatabase localSQLiteDatabase;
      if (oldDB != null)
      {
        localSQLiteDatabase = oldDB;
        Cursor localCursor = null;
        ContentValues localContentValues;
        try
        {
          localContentValues = new ContentValues();
          try
          {
            localCursor = oldDB.query("amp_rules", null, null, null, null, null, "_id ASC");
            while (localCursor.moveToNext())
            {
              localContentValues.put("_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"))));
              localContentValues.put("campaign_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
              localContentValues.put("expiration", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("expiration"))));
              localContentValues.put("display_seconds", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_seconds"))));
              localContentValues.put("display_session", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_session"))));
              localContentValues.put("version", localCursor.getString(localCursor.getColumnIndexOrThrow("version")));
              localContentValues.put("phone_location", localCursor.getString(localCursor.getColumnIndexOrThrow("phone_location")));
              localContentValues.put("phone_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_width"))));
              localContentValues.put("phone_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_height"))));
              localContentValues.put("tablet_location", localCursor.getString(localCursor.getColumnIndexOrThrow("tablet_location")));
              localContentValues.put("tablet_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_width"))));
              localContentValues.put("tablet_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_height"))));
              localContentValues.put("time_to_display", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("time_to_display"))));
              localContentValues.put("internet_required", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("internet_required"))));
              localContentValues.put("ab_test", localCursor.getString(localCursor.getColumnIndexOrThrow("ab_test")));
              localContentValues.put("rule_name", localCursor.getString(localCursor.getColumnIndexOrThrow("rule_name")));
              localContentValues.put("location", localCursor.getString(localCursor.getColumnIndexOrThrow("location")));
              localContentValues.put("devices", localCursor.getString(localCursor.getColumnIndexOrThrow("devices")));
              paramSQLiteDatabase.insert("marketing_rules", null, localContentValues);
              localContentValues.clear();
              continue;
              localObject2 = finally;
            }
          }
          finally
          {
            if (localCursor != null) {
              localCursor.close();
            }
          }
          if (localCursor == null) {
            break label794;
          }
        }
        finally {}
        localCursor.close();
        localCursor = null;
        try
        {
          label794:
          localCursor = oldDB.query("amp_ruleevent", null, null, null, null, null, "_id ASC");
          while (localCursor.moveToNext())
          {
            localContentValues.put("_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"))));
            localContentValues.put("event_name", localCursor.getString(localCursor.getColumnIndexOrThrow("event_name")));
            localContentValues.put("rule_id_ref", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("rule_id_ref"))));
            paramSQLiteDatabase.insert("marketing_ruleevent", null, localContentValues);
            localContentValues.clear();
          }
          if (localCursor == null) {
            break label933;
          }
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        localCursor.close();
        localCursor = null;
        try
        {
          label933:
          localCursor = oldDB.query("amp_displayed", null, null, null, null, null, "_id ASC");
          while (localCursor.moveToNext()) {
            if (localCursor.getInt(localCursor.getColumnIndexOrThrow("displayed")) == 1)
            {
              localContentValues.put("campaign_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
              paramSQLiteDatabase.insert("marketing_displayed", null, localContentValues);
              localContentValues.clear();
            }
          }
          if (localCursor == null) {
            break label1045;
          }
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        localCursor.close();
        localCursor = null;
        try
        {
          label1045:
          localCursor = oldDB.query("amp_conditions", null, null, null, null, null, "_id ASC");
          while (localCursor.moveToNext())
          {
            localContentValues.put("_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"))));
            localContentValues.put("attribute_name", localCursor.getString(localCursor.getColumnIndexOrThrow("attribute_name")));
            localContentValues.put("operator", localCursor.getString(localCursor.getColumnIndexOrThrow("operator")));
            localContentValues.put("rule_id_ref", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("rule_id_ref"))));
            paramSQLiteDatabase.insert("marketing_conditions", null, localContentValues);
            localContentValues.clear();
          }
          if (localCursor == null) {
            break label1205;
          }
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        localCursor.close();
        localCursor = null;
        try
        {
          label1205:
          localCursor = oldDB.query("amp_condition_values", null, null, null, null, null, "_id ASC");
          while (localCursor.moveToNext())
          {
            localContentValues.put("_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"))));
            localContentValues.put("value", localCursor.getString(localCursor.getColumnIndexOrThrow("value")));
            localContentValues.put("condition_id_ref", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("condition_id_ref"))));
            paramSQLiteDatabase.insert("marketing_condition_values", null, localContentValues);
            localContentValues.clear();
          }
          if (localCursor == null) {
            break label1342;
          }
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        localCursor.close();
        label1342:
        cleanUpOldDB();
      }
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      if (paramSQLiteDatabase == null) {
        throw new IllegalArgumentException("db cannot be null");
      }
      onUpgrade(paramSQLiteDatabase, 0, 3);
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
      if (paramInt1 < 2) {
        addNonUniqueRuleName(paramSQLiteDatabase);
      }
      if (paramInt1 < 3)
      {
        setUpFrequencyCappingTables(paramSQLiteDatabase);
        addControlGroup(paramSQLiteDatabase);
        addSchemaVersion(paramSQLiteDatabase);
      }
    }
    
    protected void setUpFrequencyCappingTables(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER UNIQUE, %s INTEGER, %s INTEGER);", new Object[] { "frequency_capping_rules", "_id", "campaign_id", "max_display_count", "ignore_global" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE);", new Object[] { "frequency_capping_display_frequencies", "_id", "frequency_id", "count", "days", "frequency_id", "frequency_capping_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE);", new Object[] { "frequency_capping_blackout_dates", "frequency_id", "rule_group_id", "start", "end", "frequency_id", "frequency_capping_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE);", new Object[] { "frequency_capping_blackout_weekdays", "frequency_id", "rule_group_id", "day", "frequency_id", "frequency_capping_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE);", new Object[] { "frequency_capping_blackout_times", "frequency_id", "rule_group_id", "start", "end", "frequency_id", "frequency_capping_rules", "_id" }));
      ArrayList localArrayList = new ArrayList();
      Cursor localCursor = null;
      try
      {
        localCursor = paramSQLiteDatabase.query("marketing_displayed", new String[] { "campaign_id" }, null, null, null, null, null);
        while (localCursor.moveToNext()) {
          localArrayList.add(Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
        }
        if (localCursor == null) {
          break label350;
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
      localCursor.close();
      label350:
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL);", new Object[] { "campaigns_displayed", "campaign_id", "date", "ignore_global" }));
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        Integer localInteger = (Integer)localIterator.next();
        String str = String.format("INSERT INTO %s VALUES (?, datetime(0,'unixepoch'), ?);", new Object[] { "campaigns_displayed" });
        Integer[] arrayOfInteger = new Integer[2];
        arrayOfInteger[0] = localInteger;
        arrayOfInteger[1] = Integer.valueOf(1);
        paramSQLiteDatabase.execSQL(str, arrayOfInteger);
      }
      paramSQLiteDatabase.execSQL(String.format("DROP TABLE %s", new Object[] { "marketing_displayed" }));
      paramSQLiteDatabase.execSQL(String.format("DELETE FROM %s", new Object[] { "marketing_rules" }));
      BaseProvider.deleteDirectory(new File(MarketingDownloader.getMarketingDataDirectory(this.mLocalyticsDao.getAppContext(), this.mLocalyticsDao.getApiKey())));
    }
  }
  
  static final class MarketingDisplayedV3Columns
    implements BaseColumns
  {
    static final String CAMPAIGN_ID = "campaign_id";
    static final String TABLE_NAME = "marketing_displayed";
    
    private MarketingDisplayedV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class MarketingRuleEventV3Columns
    implements BaseColumns
  {
    static final String EVENT_NAME = "event_name";
    static final String RULE_ID_REF = "rule_id_ref";
    static final String TABLE_NAME = "marketing_ruleevent";
    
    private MarketingRuleEventV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class MarketingRulesV3Columns
    implements BaseColumns
  {
    static final String AB_TEST = "ab_test";
    static final String CAMPAIGN_ID = "campaign_id";
    static final String CONTROL_GROUP = "control_group";
    static final String DEVICES = "devices";
    static final String DISPLAY_SECONDS = "display_seconds";
    static final String DISPLAY_SESSION = "display_session";
    static final String EXPIRATION = "expiration";
    static final String INTERNET_REQUIRED = "internet_required";
    static final String LOCATION = "location";
    static final String PHONE_LOCATION = "phone_location";
    static final String PHONE_SIZE_HEIGHT = "phone_size_height";
    static final String PHONE_SIZE_WIDTH = "phone_size_width";
    static final String RULE_NAME = "rule_name_non_unique";
    static final String RULE_NAME_UNIQUE = "rule_name";
    static final String SCHEMA_VERSION = "schema_version";
    static final String TABLET_LOCATION = "tablet_location";
    static final String TABLET_SIZE_HEIGHT = "tablet_size_height";
    static final String TABLET_SIZE_WIDTH = "tablet_size_width";
    static final String TABLE_NAME = "marketing_rules";
    static final String TIME_TO_DISPLAY = "time_to_display";
    static final String VERSION = "version";
    
    private MarketingRulesV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */