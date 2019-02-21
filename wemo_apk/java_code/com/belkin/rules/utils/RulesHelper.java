package com.belkin.rules.utils;

import android.content.Context;
import com.belkin.utils.LogUtils;

public class RulesHelper
{
  Context mContext;
  
  public RulesHelper(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public String[] generatingWeeklySchStr(String paramString)
  {
    String[] arrayOfString = new String[8];
    arrayOfString[0] = "";
    arrayOfString[1] = "";
    arrayOfString[2] = "";
    arrayOfString[3] = "";
    arrayOfString[4] = "";
    arrayOfString[5] = "";
    arrayOfString[6] = "";
    arrayOfString[7] = ("" + paramString);
    return arrayOfString;
  }
  
  public String getPackageName()
  {
    LogUtils.infoLog("RulesHelper", this.mContext.getPackageName());
    return this.mContext.getPackageName();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/RulesHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */