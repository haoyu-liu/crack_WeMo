package com.belkin.rules.utils;

import android.content.Context;
import com.belkin.cloud.objects.CloudObjectLocation;
import com.belkin.rules.db.RulesDb;
import com.belkin.rules.dbmigration.RuleDevicesTable;
import com.belkin.utils.LogUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class WeeklyCalenderStringsCreator
{
  private static String TAG = "ScheduleStringConstructor";
  private boolean endTmpOK = false;
  private ArrayList<Integer> lstSRSSOffset;
  private RulesDb rDB = null;
  private Integer rulesCount = Integer.valueOf(0);
  private ArrayList<ScheduleStringAction> scheduleStringActions;
  private boolean startTmpOK = false;
  
  public WeeklyCalenderStringsCreator(Context paramContext)
  {
    try
    {
      this.rDB = RulesDb.getRulesDatabase(paramContext);
      this.lstSRSSOffset = new ArrayList();
      this.scheduleStringActions = new ArrayList();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private RuleDevicesTable getParentNotifyRule(RuleDevicesTable paramRuleDevicesTable, int paramInt)
  {
    ArrayList localArrayList = this.rDB.getDeviceTableItems(paramRuleDevicesTable.getDeviceId(), Integer.valueOf(paramInt));
    localArrayList.addAll(this.rDB.getDeviceTableItemsBySensor(paramRuleDevicesTable.getDeviceId(), getPreviousDay(Integer.valueOf(paramInt))));
    if (localArrayList.size() > 0)
    {
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        RuleDevicesTable localRuleDevicesTable = (RuleDevicesTable)localIterator.next();
        if ((!this.rDB.isDisabled(Integer.valueOf(localRuleDevicesTable.getRuleId()))) && (this.rDB.getRuleType(Integer.valueOf(localRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_INSIGHT)) && (paramRuleDevicesTable.getRuleId() != localRuleDevicesTable.getRuleId()))
        {
          int i = paramRuleDevicesTable.getStarttime() + paramRuleDevicesTable.getRuleDuration();
          int j = localRuleDevicesTable.getStarttime() + localRuleDevicesTable.getRuleDuration();
          if ((localRuleDevicesTable.getStarttime() < paramRuleDevicesTable.getStarttime()) && (j > i))
          {
            this.startTmpOK = true;
            this.endTmpOK = true;
            return localRuleDevicesTable;
          }
          if ((localRuleDevicesTable.getStarttime() > paramRuleDevicesTable.getStarttime()) && (localRuleDevicesTable.getStarttime() < i) && (j > i))
          {
            this.endTmpOK = true;
            return localRuleDevicesTable;
          }
          if ((localRuleDevicesTable.getStarttime() < paramRuleDevicesTable.getStarttime()) && (j > paramRuleDevicesTable.getStarttime()) && (j < i))
          {
            this.startTmpOK = true;
            return localRuleDevicesTable;
          }
        }
      }
    }
    return null;
  }
  
  private Integer getPreviousDay(Integer paramInteger)
  {
    Integer.valueOf(0);
    if (paramInteger.intValue() == 1) {
      return Integer.valueOf(7);
    }
    return Integer.valueOf(-1 + paramInteger.intValue());
  }
  
  private String getSRSSTail()
  {
    Double localDouble1 = Double.valueOf(0.0D);
    Double localDouble2 = Double.valueOf(0.0D);
    CloudObjectLocation localCloudObjectLocation = this.rDB.getLocation();
    if (localCloudObjectLocation != null)
    {
      localDouble1 = localCloudObjectLocation.getLatitude();
      localDouble2 = localCloudObjectLocation.getLongitude();
    }
    return "" + RulesConstants.SHARP + localDouble1.toString() + RulesConstants.COMMA + localDouble2.toString();
  }
  
  private String getStringByRuleType(RuleDevicesTable paramRuleDevicesTable, int paramInt)
  {
    String str1 = "";
    this.startTmpOK = false;
    this.endTmpOK = false;
    label3329:
    for (;;)
    {
      try
      {
        Integer localInteger1 = Integer.valueOf(paramRuleDevicesTable.getStarttime());
        Integer localInteger2 = Integer.valueOf(paramRuleDevicesTable.getRuleDuration());
        Integer localInteger3 = Integer.valueOf(localInteger1.intValue() + localInteger2.intValue());
        String str2 = Integer.valueOf((int)paramRuleDevicesTable.getStartAction()).toString();
        String str3 = Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
        int i = 0;
        if (str2 == str3)
        {
          boolean bool = this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_TIME_INTERVAL);
          i = 0;
          if (bool) {
            i = 1;
          }
        }
        RuleDevicesTable localRuleDevicesTable = getParentNotifyRule(paramRuleDevicesTable, paramInt);
        if ((!this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MOTION)) && (localRuleDevicesTable != null) && (paramInt == paramRuleDevicesTable.getDayId()))
        {
          if (this.startTmpOK)
          {
            Integer localInteger7 = Integer.valueOf(-10 + paramRuleDevicesTable.getStarttime());
            String str24 = RulesConstants.SCHD_SEP + localInteger7.toString() + RulesConstants.COMMA + RulesConstants.ACTION_OFF;
            ArrayList localArrayList17 = this.scheduleStringActions;
            ScheduleStringAction localScheduleStringAction17 = new ScheduleStringAction(localInteger7.intValue(), str24);
            localArrayList17.add(localScheduleStringAction17);
            this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
            str1 = str1 + str24;
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
          if ((paramRuleDevicesTable.getRuleDuration() > 0) && (this.endTmpOK))
          {
            Integer localInteger6 = Integer.valueOf(-10 + (paramRuleDevicesTable.getStarttime() + paramRuleDevicesTable.getRuleDuration()));
            String str23 = RulesConstants.SCHD_SEP + localInteger6.toString() + RulesConstants.COMMA + RulesConstants.ACTION_OFF;
            ArrayList localArrayList16 = this.scheduleStringActions;
            ScheduleStringAction localScheduleStringAction16 = new ScheduleStringAction(localInteger6.intValue(), str23);
            localArrayList16.add(localScheduleStringAction16);
            this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
            str1 = str1 + str23;
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
        }
        int j = paramRuleDevicesTable.getDayId();
        int k = 0;
        int m = 0;
        if (paramInt == j)
        {
          if (localInteger3.intValue() <= RulesConstants.MAX_HOUR)
          {
            k = 1;
            break label3329;
          }
        }
        else
        {
          if ((paramInt != paramRuleDevicesTable.getDayId()) && (localInteger3.intValue() > RulesConstants.MAX_HOUR))
          {
            localInteger3 = Integer.valueOf(localInteger3.intValue() - RulesConstants.MAX_HOUR);
            k = 1;
            localInteger1 = Integer.valueOf(RulesConstants.MIN_TIME);
            m = 1;
          }
          if (((this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_SIMPLE_TIMER)) || (i != 0)) && (m != 0))
          {
            String str22 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getStartAction()).toString();
            ArrayList localArrayList15 = this.scheduleStringActions;
            ScheduleStringAction localScheduleStringAction15 = new ScheduleStringAction(localInteger1.intValue(), str22);
            localArrayList15.add(localScheduleStringAction15);
            this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
            str1 = str1 + str22;
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
          if ((this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_TIME_INTERVAL)) && (i == 0))
          {
            if (m != 0)
            {
              String str20 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getStartAction()).toString();
              ArrayList localArrayList13 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction13 = new ScheduleStringAction(localInteger1.intValue(), str20);
              localArrayList13.add(localScheduleStringAction13);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str20;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              String str21 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
              ArrayList localArrayList14 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction14 = new ScheduleStringAction(localInteger3.intValue(), str21);
              localArrayList14.add(localScheduleStringAction14);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str21;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.AWAY_MODE))
          {
            if (m != 0)
            {
              localInteger1 = Integer.valueOf(3 + localInteger1.intValue());
              String str4 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getStartAction()).toString();
              ArrayList localArrayList1 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction1 = new ScheduleStringAction(localInteger1.intValue(), str4);
              localArrayList1.add(localScheduleStringAction1);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str4;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              if (localInteger3.intValue() != RulesConstants.MIDNIGHT_END_TIME) {
                continue;
              }
              i1 = RulesConstants.MAX_HOUR;
              localInteger3 = Integer.valueOf(i1 + 3);
              String str5 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
              ArrayList localArrayList2 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction2 = new ScheduleStringAction(localInteger3.intValue(), str5);
              localArrayList2.add(localScheduleStringAction2);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str5;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_INSIGHT))
          {
            String str17 = this.rDB.getExtendedFeatureStr(Integer.valueOf(paramRuleDevicesTable.getRuleId()));
            if (m != 0)
            {
              String str18 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + "1" + ",[1" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + paramRuleDevicesTable.getDeviceId() + ",9," + paramRuleDevicesTable.getSensorDuration() + ",0@" + str17 + "@]";
              ArrayList localArrayList11 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction11 = new ScheduleStringAction(localInteger1.intValue(), str18);
              localArrayList11.add(localScheduleStringAction11);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str18;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              String str19 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
              ArrayList localArrayList12 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction12 = new ScheduleStringAction(localInteger3.intValue(), str19);
              localArrayList12.add(localScheduleStringAction12);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str19;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_SENSOR_NOTIFICATION))
          {
            String str14 = this.rDB.getNotifyRuleID(Integer.valueOf(paramRuleDevicesTable.getRuleId()));
            if (m != 0)
            {
              String str15 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + "1" + ",[1" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + paramRuleDevicesTable.getDeviceId() + ",9," + str14 + ",0]";
              ArrayList localArrayList9 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction9 = new ScheduleStringAction(localInteger1.intValue(), str15);
              localArrayList9.add(localScheduleStringAction9);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str15;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              String str16 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
              ArrayList localArrayList10 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction10 = new ScheduleStringAction(localInteger3.intValue(), str16);
              localArrayList10.add(localScheduleStringAction10);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str16;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MAKER_MOTION_NOTIFICATION))
          {
            LogUtils.infoLog(TAG, "rule.getRuleId() :: " + paramRuleDevicesTable.getRuleId());
            if (m != 0)
            {
              String str12 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + "1" + ",[1" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + paramRuleDevicesTable.getDeviceId() + ",9," + paramRuleDevicesTable.getSensorDuration() + ",0@" + Integer.valueOf(paramRuleDevicesTable.getType()).toString() + "@]";
              ArrayList localArrayList7 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction7 = new ScheduleStringAction(localInteger1.intValue(), str12);
              localArrayList7.add(localScheduleStringAction7);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str12;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              String str13 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + Integer.valueOf((int)paramRuleDevicesTable.getEndAction()).toString();
              ArrayList localArrayList8 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction8 = new ScheduleStringAction(localInteger3.intValue(), str13);
              localArrayList8.add(localScheduleStringAction8);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str13;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if ((this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MOTION)) || (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MAKER_MOTION)))
          {
            String str6 = this.rDB.getSensorDevicesStr(Integer.valueOf(paramRuleDevicesTable.getRuleId()));
            if (m != 0)
            {
              String str7 = RulesConstants.SCHD_SEP + localInteger1.toString() + RulesConstants.COMMA + RulesConstants.RULE_ACTIVATE + ",[" + str6 + "]";
              ArrayList localArrayList3 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction3 = new ScheduleStringAction(localInteger1.intValue(), str7);
              localArrayList3.add(localScheduleStringAction3);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
              str1 = str1 + str7;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
            if (k != 0)
            {
              String str8 = RulesConstants.SCHD_SEP + localInteger3.toString() + RulesConstants.COMMA + RulesConstants.RULE_DEACTIVATE;
              ArrayList localArrayList4 = this.scheduleStringActions;
              ScheduleStringAction localScheduleStringAction4 = new ScheduleStringAction(localInteger3.intValue(), str8);
              localArrayList4.add(localScheduleStringAction4);
              this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
              str1 = str1 + str8;
              this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
            }
          }
          if ((this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MOTION)) || (localRuleDevicesTable == null) || (paramInt != paramRuleDevicesTable.getDayId())) {
            break;
          }
          String str9 = this.rDB.getExtendedFeatureStr(Integer.valueOf(localRuleDevicesTable.getRuleId()));
          if (this.startTmpOK)
          {
            Integer localInteger5 = Integer.valueOf(20 + paramRuleDevicesTable.getStarttime());
            String str11 = RulesConstants.SCHD_SEP + localInteger5.toString() + RulesConstants.COMMA + "1" + ",[1" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + localRuleDevicesTable.getDeviceId() + ",9," + localRuleDevicesTable.getSensorDuration() + ",0@" + str9 + "@]";
            ArrayList localArrayList6 = this.scheduleStringActions;
            ScheduleStringAction localScheduleStringAction6 = new ScheduleStringAction(localInteger5.intValue(), str11);
            localArrayList6.add(localScheduleStringAction6);
            this.lstSRSSOffset.add(Integer.valueOf(localRuleDevicesTable.getOnModeOffset()));
            str1 = str1 + str11;
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
          if ((paramRuleDevicesTable.getRuleDuration() <= 0) || (!this.endTmpOK)) {
            break;
          }
          Integer localInteger4 = Integer.valueOf(20 + (paramRuleDevicesTable.getStarttime() + paramRuleDevicesTable.getRuleDuration()));
          String str10 = RulesConstants.SCHD_SEP + localInteger4.toString() + RulesConstants.COMMA + "1" + ",[1" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + "0" + RulesConstants.SEMICOLUMN + localRuleDevicesTable.getDeviceId() + ",9," + localRuleDevicesTable.getSensorDuration() + ",0@" + str9 + "@]";
          ArrayList localArrayList5 = this.scheduleStringActions;
          ScheduleStringAction localScheduleStringAction5 = new ScheduleStringAction(localInteger4.intValue(), str10);
          localArrayList5.add(localScheduleStringAction5);
          this.lstSRSSOffset.add(Integer.valueOf(localRuleDevicesTable.getOnModeOffset()));
          str1 = str1 + str10;
          this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          return str1;
        }
        localInteger3 = Integer.valueOf(RulesConstants.MAX_HOUR);
        k = 1;
        break label3329;
        int n = localInteger3.intValue();
        int i1 = n;
        continue;
        m = 1;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return str1;
      }
    }
    return str1;
  }
  
  private String mergeSensorString(RuleDevicesTable paramRuleDevicesTable, String paramString, int paramInt)
  {
    String str = "";
    for (;;)
    {
      try
      {
        if (this.rDB.getRuleType(Integer.valueOf(paramRuleDevicesTable.getRuleId())).equals(RulesConstants.RULE_MOTION))
        {
          Integer localInteger1 = Integer.valueOf(paramRuleDevicesTable.getStarttime());
          Integer localInteger2 = Integer.valueOf(paramRuleDevicesTable.getRuleDuration());
          Integer localInteger3 = Integer.valueOf(paramRuleDevicesTable.getOnModeOffset());
          Integer localInteger4 = Integer.valueOf(paramRuleDevicesTable.getOffModeOffset());
          localObject = Integer.valueOf(localInteger1.intValue() + localInteger2.intValue() + localInteger4.intValue());
          Integer localInteger5 = Integer.valueOf(localInteger1.intValue() + localInteger3.intValue());
          LogUtils.infoLog(TAG, "dayID is :: " + paramInt + "rule.getDayId() :: " + paramRuleDevicesTable.getDayId());
          int i = paramRuleDevicesTable.getDayId();
          bool1 = false;
          bool2 = false;
          if (paramInt == i)
          {
            LogUtils.infoLog(TAG, "dayID == rule.getDayId() endTime :: " + localObject + "startTime ::  " + localInteger5);
            if (((Integer)localObject).intValue() > RulesConstants.MAX_HOUR) {
              continue;
            }
            bool1 = true;
            break label624;
          }
          if (paramInt != paramRuleDevicesTable.getDayId())
          {
            LogUtils.infoLog(TAG, "dayID != rule.getDayId()endTime :: " + localObject + "startTime ::  " + localInteger5);
            if (((Integer)localObject).intValue() > RulesConstants.MAX_HOUR)
            {
              localObject = Integer.valueOf(((Integer)localObject).intValue() - RulesConstants.MAX_HOUR);
              bool1 = true;
              localInteger5 = Integer.valueOf(RulesConstants.MIN_TIME);
              bool2 = true;
            }
          }
          if (((Integer)localObject).intValue() > RulesConstants.MAX_HOUR) {
            localObject = Integer.valueOf(RulesConstants.MAX_HOUR);
          }
          LogUtils.infoLog(TAG, "the sensorDevStr is :: " + paramString + "startOK :: " + bool2 + "endOK :: " + bool1);
          if (bool2)
          {
            str = str + RulesConstants.SCHD_SEP + localInteger5.toString() + RulesConstants.COMMA + RulesConstants.RULE_ACTIVATE;
            str = str + ",[" + paramString + "]";
            this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOnModeOffset()));
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
          if (bool1)
          {
            str = str + RulesConstants.SCHD_SEP + ((Integer)localObject).toString() + RulesConstants.COMMA + RulesConstants.RULE_DEACTIVATE;
            this.lstSRSSOffset.add(Integer.valueOf(paramRuleDevicesTable.getOffModeOffset()));
            this.rulesCount = Integer.valueOf(1 + this.rulesCount.intValue());
          }
        }
      }
      catch (Exception localException)
      {
        Object localObject;
        boolean bool1;
        Integer localInteger6;
        localException.printStackTrace();
        continue;
      }
      LogUtils.infoLog(TAG, "the result of mergeSensorString  is :: " + str);
      return str;
      localInteger6 = Integer.valueOf(RulesConstants.MAX_HOUR);
      localObject = localInteger6;
      bool1 = true;
      label624:
      boolean bool2 = true;
    }
  }
  
  public String getScheduleString(Integer paramInteger, String paramString)
  {
    String str = "0";
    try
    {
      ArrayList localArrayList1 = this.rDB.getDeviceTableItems(paramString, paramInteger);
      int i = localArrayList1.size();
      boolean bool = false;
      if (i > 0)
      {
        Iterator localIterator1 = localArrayList1.iterator();
        while (localIterator1.hasNext())
        {
          RuleDevicesTable localRuleDevicesTable2 = (RuleDevicesTable)localIterator1.next();
          if ((!this.rDB.isDisabled(Integer.valueOf(localRuleDevicesTable2.getRuleId()))) && (!this.rDB.getRuleType(Integer.valueOf(localRuleDevicesTable2.getRuleId())).equals(RulesConstants.RULE_MOTION)) && (!this.rDB.getRuleType(Integer.valueOf(localRuleDevicesTable2.getRuleId())).equals(RulesConstants.RULE_MAKER_MOTION)))
          {
            getStringByRuleType(localRuleDevicesTable2, paramInteger.intValue());
            bool = localRuleDevicesTable2.haveSRSS();
          }
        }
      }
      ArrayList localArrayList2 = this.rDB.getDeviceTableItems(paramString, getPreviousDay(paramInteger));
      if (localArrayList2.size() > 0)
      {
        Iterator localIterator4 = localArrayList2.iterator();
        while (localIterator4.hasNext())
        {
          RuleDevicesTable localRuleDevicesTable1 = (RuleDevicesTable)localIterator4.next();
          if ((!this.rDB.isDisabled(Integer.valueOf(localRuleDevicesTable1.getRuleId()))) && (!this.rDB.getRuleType(Integer.valueOf(localRuleDevicesTable1.getRuleId())).equals(RulesConstants.RULE_MOTION)) && (!this.rDB.getRuleType(Integer.valueOf(localRuleDevicesTable1.getRuleId())).equals(RulesConstants.RULE_MAKER_MOTION)))
          {
            getStringByRuleType(localRuleDevicesTable1, paramInteger.intValue());
            bool = localRuleDevicesTable1.haveSRSS();
          }
        }
      }
      if (this.scheduleStringActions.size() > 0)
      {
        str = "";
        Collections.sort(this.scheduleStringActions, new ScheduleStringActionComparator());
        Iterator localIterator2 = this.scheduleStringActions.iterator();
        while (localIterator2.hasNext())
        {
          ScheduleStringAction localScheduleStringAction = (ScheduleStringAction)localIterator2.next();
          str = str + localScheduleStringAction.getSchedule();
        }
        if (bool) {
          str = str + getSRSSTail();
        }
        str = str + RulesConstants.OFFSET_SEP;
        int j = 0;
        Iterator localIterator3 = this.lstSRSSOffset.iterator();
        while (localIterator3.hasNext())
        {
          Integer localInteger = (Integer)localIterator3.next();
          if (j > 0) {
            str = str + RulesConstants.COMMA;
          }
          str = str + localInteger;
          j++;
        }
        str = this.scheduleStringActions.size() + str;
        LogUtils.infoLog(TAG, "Generate Normal Schedule String. DAY: " + paramInteger + "; SCH STR: " + str);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        LogUtils.errorLog(TAG, "Exception while creating schedule string for device: " + paramString + ", on day: " + paramInteger, localException);
      }
    }
    finally {}
    return str;
  }
  
  public String getSensorScheduleString(Integer paramInteger, String paramString)
  {
    Object localObject = "0";
    label557:
    for (;;)
    {
      try
      {
        ArrayList localArrayList1 = this.rDB.getDeviceTableItemsBySensor(paramString, paramInteger);
        localArrayList1.addAll(this.rDB.getDeviceTableItemsBySensor(paramString, getPreviousDay(paramInteger)));
        ArrayList localArrayList2 = new ArrayList();
        int i = localArrayList1.size();
        boolean bool = false;
        int k;
        if (i > 0)
        {
          localObject = "";
          k = -1 + localArrayList1.size();
          if (k >= 0)
          {
            RuleDevicesTable localRuleDevicesTable1 = (RuleDevicesTable)localArrayList1.get(k);
            String str2 = this.rDB.getMergedSensorDevices(localRuleDevicesTable1, localArrayList2);
            if ((str2 == null) || (this.rDB.isDisabled(Integer.valueOf(localRuleDevicesTable1.getRuleId())))) {
              break label557;
            }
            localObject = (String)localObject + mergeSensorString(localRuleDevicesTable1, str2, paramInteger.intValue());
            bool = localRuleDevicesTable1.haveSRSS();
            break label557;
          }
          Iterator localIterator2 = localArrayList1.iterator();
          if (localIterator2.hasNext())
          {
            RuleDevicesTable localRuleDevicesTable2 = (RuleDevicesTable)localIterator2.next();
            LogUtils.infoLog(TAG, "the value of rule is::  RuleID " + localRuleDevicesTable2.getRuleId() + "getDeviceId is: " + localRuleDevicesTable2.getDeviceId());
            if ((localArrayList2.contains("" + localRuleDevicesTable2.getRuleId())) || (this.rDB.isDisabled(Integer.valueOf(localRuleDevicesTable2.getRuleId())))) {
              continue;
            }
            localObject = (String)localObject + getStringByRuleType(localRuleDevicesTable2, paramInteger.intValue());
            bool = localRuleDevicesTable2.haveSRSS();
            continue;
          }
        }
        if ((bool) && (!((String)localObject).equals("0"))) {
          localObject = (String)localObject + getSRSSTail();
        }
        if (!((String)localObject).equals("0"))
        {
          localObject = (String)localObject + RulesConstants.OFFSET_SEP;
          int j = 0;
          Iterator localIterator1 = this.lstSRSSOffset.iterator();
          if (localIterator1.hasNext())
          {
            Integer localInteger = (Integer)localIterator1.next();
            if (j > 0) {
              localObject = (String)localObject + RulesConstants.COMMA;
            }
            String str1 = (String)localObject + localInteger;
            localObject = str1;
            j++;
            continue;
          }
        }
        k--;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        if (!((String)localObject).equals("0")) {
          localObject = this.rulesCount.toString() + (String)localObject;
        }
        LogUtils.infoLog(TAG, "Generate Sensor Schedule String. DAY: " + paramInteger + "; SCH STR: " + (String)localObject);
        return (String)localObject;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/WeeklyCalenderStringsCreator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */