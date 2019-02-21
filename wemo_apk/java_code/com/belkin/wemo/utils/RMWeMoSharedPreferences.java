package com.belkin.wemo.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public abstract class RMWeMoSharedPreferences
{
  public static final String WEMO_SHARED_PREF_LOC_STUB = "com.belkin.wemo.";
  private SharedPreferences.Editor editor;
  private SharedPreferences sharedPreferences;
  
  public void clearAll()
  {
    this.editor.clear();
    this.editor.commit();
  }
  
  public void clearKey(String paramString)
  {
    this.editor.remove(paramString);
    this.editor.commit();
  }
  
  protected abstract String getFilename();
  
  public boolean getPlainBoolean(String paramString, boolean paramBoolean)
  {
    return this.sharedPreferences.getBoolean(paramString, paramBoolean);
  }
  
  public int getPlainInt(String paramString, int paramInt)
  {
    return this.sharedPreferences.getInt(paramString, paramInt);
  }
  
  public long getPlainLong(String paramString, long paramLong)
  {
    return this.sharedPreferences.getLong(paramString, paramLong);
  }
  
  public String getPlainString(String paramString1, String paramString2)
  {
    return this.sharedPreferences.getString(paramString1, paramString2);
  }
  
  protected void init(Context paramContext)
  {
    if ((this.sharedPreferences == null) || (this.editor == null))
    {
      this.sharedPreferences = paramContext.getSharedPreferences("com.belkin.wemo." + getFilename(), 0);
      this.editor = this.sharedPreferences.edit();
    }
  }
  
  public void setPlainBoolean(String paramString, boolean paramBoolean)
  {
    this.editor.putBoolean(paramString, paramBoolean);
    this.editor.commit();
  }
  
  public void setPlainInt(String paramString, int paramInt)
  {
    this.editor.putInt(paramString, paramInt);
    this.editor.commit();
  }
  
  public void setPlainLong(String paramString, long paramLong)
  {
    this.editor.putLong(paramString, paramLong);
    this.editor.commit();
  }
  
  public void setPlainString(String paramString1, String paramString2)
  {
    this.editor.putString(paramString1, paramString2);
    this.editor.commit();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/RMWeMoSharedPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */