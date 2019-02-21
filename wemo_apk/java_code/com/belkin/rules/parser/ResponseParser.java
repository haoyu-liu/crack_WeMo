package com.belkin.rules.parser;

import android.content.Context;
import com.belkin.rules.data.RuleDeviceData;
import com.belkin.rules.data.RulesData;
import com.belkin.rules.utils.RulesConstants;
import com.belkin.utils.LogUtils;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ResponseParser
{
  int RuleId;
  Context context;
  int[] days;
  int daysCount;
  RuleDeviceData deviceData = new RuleDeviceData();
  RulesData rulesData = new RulesData();
  ArrayList<RuleDeviceData> rulesDeviceTable;
  ArrayList<RulesData> rulesTable;
  
  public ResponseParser(Context paramContext)
  {
    this.context = paramContext;
  }
  
  private void Reset()
  {
    this.rulesTable = new ArrayList();
    this.rulesDeviceTable = new ArrayList();
  }
  
  private void addDeviceTable()
  {
    this.rulesDeviceTable = new ArrayList();
    for (int i = 0; i < this.days.length; i++)
    {
      this.deviceData = new RuleDeviceData();
      this.deviceData.setDayId(this.days[i]);
      this.deviceData.setStartAction(this.rulesData.getStartAction());
      this.deviceData.setEndAction(this.rulesData.getEndAction());
      this.deviceData.setUuid(this.rulesData.getUuid());
      this.deviceData.setRuleId(this.rulesData.getRuleId());
      this.deviceData.setStartTime(this.rulesData.getStartTime());
      this.deviceData.setEndTime(this.rulesData.getEndTime());
      this.deviceData.setRuleDuration(this.rulesData.getRuleDuration());
      this.deviceData.setType("-1");
      this.deviceData.setValue(-1);
      this.deviceData.setLevel(-1);
      this.deviceData.setGroupId("0");
      this.rulesDeviceTable.add(this.deviceData);
    }
  }
  
  private void setSelectedDays(String paramString)
  {
    String[] arrayOfString = paramString.split("-");
    this.daysCount = arrayOfString.length;
    this.days = new int[this.daysCount];
    int i = 0;
    if (i < arrayOfString.length)
    {
      LogUtils.infoLog("days::", arrayOfString[i]);
      if (arrayOfString[i].equals(RulesConstants.MON))
      {
        this.rulesData.setMon(arrayOfString[i]);
        this.days[i] = 2;
      }
      for (;;)
      {
        i++;
        break;
        if (arrayOfString[i].equals(RulesConstants.TUE))
        {
          this.rulesData.setTue(arrayOfString[i]);
          this.days[i] = 3;
        }
        else if (arrayOfString[i].equals(RulesConstants.WED))
        {
          this.rulesData.setWed(arrayOfString[i]);
          this.days[i] = 4;
        }
        else if (arrayOfString[i].equals(RulesConstants.THRU))
        {
          this.rulesData.setThru(arrayOfString[i]);
          this.days[i] = 5;
        }
        else if (arrayOfString[i].equals(RulesConstants.FRI))
        {
          this.rulesData.setFri(arrayOfString[i]);
          this.days[i] = 6;
        }
        else if (arrayOfString[i].equals(RulesConstants.SAT))
        {
          this.rulesData.setSat(arrayOfString[i]);
          this.days[i] = 7;
        }
        else if (arrayOfString[i].equals(RulesConstants.SUN))
        {
          this.rulesData.setSun(arrayOfString[i]);
          this.days[i] = 1;
        }
      }
    }
  }
  
  public boolean ParseJson(JSONArray paramJSONArray)
  {
    for (;;)
    {
      int i;
      try
      {
        Reset();
        if (paramJSONArray == null) {
          break label454;
        }
        LogUtils.infoLog("Json array", "inArray" + paramJSONArray);
        i = 0;
        if (i < paramJSONArray.length())
        {
          JSONObject localJSONObject1 = paramJSONArray.getJSONObject(1);
          this.rulesData.setState(Integer.parseInt(localJSONObject1.getString(RulesConstants.STATE)));
          this.rulesData.setRuleType(localJSONObject1.getString(RulesConstants.RULE_TYPE));
          this.rulesData.setRuleName(localJSONObject1.getString(RulesConstants.RULE_NAME));
          setSelectedDays(localJSONObject1.getString(RulesConstants.SELECTED_RANGE));
          JSONObject localJSONObject2 = localJSONObject1.getJSONObject(RulesConstants.DEVICES);
          this.rulesData.setUuid("" + localJSONObject2.names().get(0));
          JSONObject localJSONObject3 = localJSONObject2.getJSONObject("" + localJSONObject2.names().get(0));
          this.rulesData.setFName(localJSONObject3.getString(RulesConstants.FNAME));
          LogUtils.infoLog("Json Parser", "fname" + this.rulesData.getFName());
          LogUtils.infoLog(RulesConstants.SENSOR_DURATION, localJSONObject3.getString(RulesConstants.SENSOR_DURATION));
          int j = Integer.parseInt(localJSONObject3.getString(RulesConstants.START_ACTION));
          this.rulesData.setStartAction(j);
          LogUtils.infoLog(RulesConstants.SELECTED_LED_VALUE, localJSONObject3.getString(RulesConstants.SELECTED_LED_VALUE));
          int k = Integer.parseInt(localJSONObject3.getString(RulesConstants.END_ACTION));
          this.rulesData.setEndAction(k);
          if (!localJSONObject1.has(RulesConstants.WHEN)) {
            break label456;
          }
          JSONObject localJSONObject4 = localJSONObject1.getJSONObject(RulesConstants.WHEN);
          LogUtils.infoLog(RulesConstants.RULE_DURATION, localJSONObject4.getString(RulesConstants.RULE_DURATION));
          this.rulesData.setRuleDuration(Double.parseDouble(localJSONObject4.getString(RulesConstants.RULE_DURATION)));
          if (j != k)
          {
            this.rulesData.setEndTime(Double.parseDouble(localJSONObject4.getString(RulesConstants.ENDTIME)));
            this.rulesData.setStartTime(Double.parseDouble(localJSONObject4.getString(RulesConstants.START_TIME)));
            break label456;
          }
          this.rulesData.setEndTime(0.0D);
          continue;
        }
        this.rulesData.setRuleId(this.RuleId);
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return false;
      }
      this.rulesTable.add(this.rulesData);
      addDeviceTable();
      return true;
      label454:
      return false;
      label456:
      i++;
    }
  }
  
  public ArrayList<RulesData> getRulesData()
  {
    if ((this.rulesTable != null) && (this.rulesTable.size() > 0)) {
      return this.rulesTable;
    }
    return null;
  }
  
  public ArrayList<RuleDeviceData> getRulesDeviceData()
  {
    if ((this.rulesDeviceTable != null) && (this.rulesDeviceTable.size() > 0)) {
      return this.rulesDeviceTable;
    }
    return null;
  }
  
  public String getUDN()
  {
    return this.rulesData.getUuid();
  }
  
  public void setNewRuleId(int paramInt)
  {
    this.RuleId = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/parser/ResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */