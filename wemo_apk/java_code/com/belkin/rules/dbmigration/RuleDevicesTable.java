package com.belkin.rules.dbmigration;

import android.util.Log;
import com.belkin.rules.db.RulesDb;
import com.belkin.rules.utils.RulesConstants;

public final class RuleDevicesTable
{
  private int OffModeOffset;
  private int OnModeOffset;
  private String ZBCapabilityEnd;
  private String ZBCapabilityStart;
  private int dayId;
  private String deviceId = "";
  private double endAction;
  private int groupId = 0;
  private int level;
  private int ruleDuration;
  private int ruleId;
  private int sensorDuration = -1;
  private double startAction;
  private int starttime;
  private int type;
  private String value = "";
  
  public int getDayId()
  {
    return this.dayId;
  }
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public double getEndAction()
  {
    return this.endAction;
  }
  
  public int getGroupId()
  {
    return this.groupId;
  }
  
  public int getLevel()
  {
    return this.level;
  }
  
  public int getOffModeOffset()
  {
    return this.OffModeOffset;
  }
  
  public String getOffset(RulesDb paramRulesDb)
  {
    Integer localInteger1 = new Integer(getOnModeOffset());
    Integer localInteger2 = new Integer(getOffModeOffset());
    try
    {
      if (paramRulesDb.getRuleType(Integer.valueOf(getRuleId())).equals(RulesConstants.RULE_SIMPLE_TIMER)) {
        return "" + localInteger1.toString();
      }
      String str = "" + localInteger1.toString() + RulesConstants.COMMA + localInteger2.toString();
      return str;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "";
  }
  
  public int getOnModeOffset()
  {
    return this.OnModeOffset;
  }
  
  public int getRuleDuration()
  {
    return this.ruleDuration;
  }
  
  public int getRuleId()
  {
    return this.ruleId;
  }
  
  public int getSensorDuration()
  {
    return this.sensorDuration;
  }
  
  public double getStartAction()
  {
    return this.startAction;
  }
  
  public int getStarttime()
  {
    return this.starttime;
  }
  
  public int getType()
  {
    return this.type;
  }
  
  public String getValue()
  {
    return this.value;
  }
  
  public String getZBCapabilityEnd()
  {
    return this.ZBCapabilityEnd;
  }
  
  public String getZBCapabilityStart()
  {
    return this.ZBCapabilityStart;
  }
  
  public boolean haveSRSS()
  {
    String str1 = new Integer(getStarttime()).toString();
    String str2 = new Integer(getRuleDuration()).toString();
    return (str1.endsWith("1")) || (str1.endsWith("2")) || (str2.endsWith("1")) || (str2.endsWith("2")) || (str1.endsWith("4")) || (str1.endsWith("5")) || (str2.endsWith("4")) || (str2.endsWith("5"));
  }
  
  public void setDayId(int paramInt)
  {
    this.dayId = paramInt;
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setEndAction(double paramDouble)
  {
    this.endAction = paramDouble;
  }
  
  public void setGroupId(int paramInt)
  {
    this.groupId = paramInt;
  }
  
  public void setLevel(int paramInt)
  {
    this.level = paramInt;
  }
  
  public void setOffModeOffset(int paramInt)
  {
    this.OffModeOffset = paramInt;
  }
  
  public void setOnModeOffset(int paramInt)
  {
    this.OnModeOffset = paramInt;
  }
  
  public void setRuleDuration(int paramInt)
  {
    this.ruleDuration = paramInt;
  }
  
  public void setRuleId(int paramInt)
  {
    this.ruleId = paramInt;
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.sensorDuration = paramInt;
  }
  
  public void setStartAction(double paramDouble)
  {
    this.startAction = paramDouble;
  }
  
  public void setStarttime(int paramInt)
  {
    this.starttime = paramInt;
  }
  
  public void setType(int paramInt)
  {
    this.type = paramInt;
  }
  
  public void setValue(String paramString)
  {
    this.value = paramString;
  }
  
  public void setZBCapabilityEnd(String paramString)
  {
    this.ZBCapabilityEnd = paramString;
  }
  
  public void setZBCapabilityStart(String paramString)
  {
    this.ZBCapabilityStart = paramString;
  }
  
  public String toString()
  {
    Log.e("RULE DEVICE TABLE", this.ruleId + " : " + this.deviceId + " : " + this.groupId + " : " + this.dayId + " : " + this.starttime + " : " + this.ruleDuration + " : " + this.startAction + " : " + this.endAction + " : " + this.sensorDuration + " : " + this.type + " : " + this.value + " : " + this.level);
    return super.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/RuleDevicesTable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */