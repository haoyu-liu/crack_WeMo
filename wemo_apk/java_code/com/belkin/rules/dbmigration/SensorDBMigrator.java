package com.belkin.rules.dbmigration;

import android.content.Context;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.cache.utils.MoreUtil;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

public class SensorDBMigrator
{
  private DeviceCombinationTable combinationTable;
  private Context context;
  private RuleDevicesTable devicesTable;
  public ArrayList<DeviceCombinationTable> mDeviceCombinationTables;
  public ArrayList<RuleDevicesTable> mRuleDevicesTables;
  public ArrayList<RulesTable> mRulesTables;
  private RuleDatabaseManager ruleDatabaseManager;
  private Hashtable<Integer, Hashtable<String, Vector<Sensor_1_X>>> ruleHash = new Hashtable();
  private RulesTable rules;
  private Vector<Sensor_1_X> sensorhList = new Vector();
  
  public SensorDBMigrator(Vector<Sensor_1_X> paramVector, Context paramContext)
  {
    this.sensorhList = paramVector;
    this.context = paramContext;
  }
  
  private Vector<Integer> getActiveDays(Sensor_1_X paramSensor_1_X)
  {
    Vector localVector = new Vector();
    if ((paramSensor_1_X.getSun() != null) && (!paramSensor_1_X.getSun().equals(""))) {
      localVector.add(Integer.valueOf(1));
    }
    if ((paramSensor_1_X.getMon() != null) && (!paramSensor_1_X.getMon().equals(""))) {
      localVector.add(Integer.valueOf(2));
    }
    if ((paramSensor_1_X.getTue() != null) && (!paramSensor_1_X.getTue().equals(""))) {
      localVector.add(Integer.valueOf(3));
    }
    if ((paramSensor_1_X.getWed() != null) && (!paramSensor_1_X.getWed().equals(""))) {
      localVector.add(Integer.valueOf(4));
    }
    if ((paramSensor_1_X.getThu() != null) && (!paramSensor_1_X.getThu().equals(""))) {
      localVector.add(Integer.valueOf(5));
    }
    if ((paramSensor_1_X.getFri() != null) && (!paramSensor_1_X.getFri().equals(""))) {
      localVector.add(Integer.valueOf(6));
    }
    if ((paramSensor_1_X.getSat() != null) && (!paramSensor_1_X.getSat().equals(""))) {
      localVector.add(Integer.valueOf(7));
    }
    return localVector;
  }
  
  private int getConveratedEndTime(String paramString)
  {
    try
    {
      String str = paramString.split("\\|")[1].split(",")[0];
      int i = Integer.parseInt(str.substring(0, str.indexOf(":")));
      int j = Integer.parseInt(str.substring(1 + str.indexOf(":")));
      return 60 * (i * 60) + j * 60;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  private int getConveratedTime(String paramString)
  {
    String str = paramString.split("\\|")[0].split(",")[0];
    int i = Integer.parseInt(str.substring(0, str.indexOf(":")));
    int j = Integer.parseInt(str.substring(1 + str.indexOf(":")));
    return 60 * (i * 60) + j * 60;
  }
  
  private int getDayId(Sensor_1_X paramSensor_1_X)
  {
    if (isEveryDay(paramSensor_1_X)) {
      return 0;
    }
    if (isSunday(paramSensor_1_X)) {
      return 1;
    }
    if (isMonday(paramSensor_1_X)) {
      return 2;
    }
    if (isTuesday(paramSensor_1_X)) {
      return 3;
    }
    if (isWednesDay(paramSensor_1_X)) {
      return 4;
    }
    if (isThusDay(paramSensor_1_X)) {
      return 5;
    }
    if (isFriDay(paramSensor_1_X)) {
      return 6;
    }
    if (isSaturDay(paramSensor_1_X)) {
      return 7;
    }
    if (isWeekDay(paramSensor_1_X)) {
      return 8;
    }
    return -1;
  }
  
  private double getEndAction(String paramString)
  {
    try
    {
      String str = paramString.split("\\|")[1].split(",")[1];
      if (str.trim().equals("1")) {
        return 1.0D;
      }
      boolean bool = str.trim().equals("0");
      if (bool) {
        return 0.0D;
      }
    }
    catch (Exception localException) {}
    return 2.0D;
  }
  
  private int getEndTime(Sensor_1_X paramSensor_1_X)
  {
    return getConveratedEndTime(paramSensor_1_X.getEndTime());
  }
  
  private int getRuleDuration(Sensor_1_X paramSensor_1_X)
  {
    int i = getStartTime(paramSensor_1_X);
    int j = getEndTime(paramSensor_1_X);
    if (j > 0) {
      return j - i;
    }
    return 0;
  }
  
  private double getRuleEndAction(Sensor_1_X paramSensor_1_X)
  {
    return getEndAction(paramSensor_1_X.getEndTime());
  }
  
  private double getRuleStartAction(Sensor_1_X paramSensor_1_X)
  {
    return getStartAction(paramSensor_1_X.getStartTime());
  }
  
  private int getSensorDuration(Sensor_1_X paramSensor_1_X)
  {
    switch (getDayId(paramSensor_1_X))
    {
    default: 
      return 0;
    case 0: 
      return Integer.parseInt(paramSensor_1_X.getSun().split(",")[1]);
    case 1: 
      return Integer.parseInt(paramSensor_1_X.getSun().split(",")[1]);
    case 2: 
      return Integer.parseInt(paramSensor_1_X.getMon().split(",")[1]);
    case 3: 
      return Integer.parseInt(paramSensor_1_X.getTue().split(",")[1]);
    case 4: 
      return Integer.parseInt(paramSensor_1_X.getWed().split(",")[1]);
    case 5: 
      return Integer.parseInt(paramSensor_1_X.getThu().split(",")[1]);
    case 6: 
      return Integer.parseInt(paramSensor_1_X.getFri().split(",")[1]);
    case 7: 
      return Integer.parseInt(paramSensor_1_X.getSat().split(",")[1]);
    case 8: 
      return Integer.parseInt(paramSensor_1_X.getMon().split(",")[1]);
    }
    return Integer.parseInt(paramSensor_1_X.getSun().split(",")[1]);
  }
  
  private double getStartAction(String paramString)
  {
    try
    {
      String str = paramString.split("\\|")[0].split(",")[1];
      if (str.trim().equals("1")) {
        return 1.0D;
      }
      boolean bool = str.trim().equals("0");
      if (bool) {
        return 0.0D;
      }
    }
    catch (Exception localException) {}
    return 2.0D;
  }
  
  private int getStartTime(Sensor_1_X paramSensor_1_X)
  {
    return getConveratedTime(paramSensor_1_X.getStartTime());
  }
  
  private int getValue(String paramString)
  {
    if (paramString.toLowerCase().contains("low")) {
      return 25;
    }
    if (paramString.toLowerCase().contains("medium")) {
      return 50;
    }
    if (paramString.toLowerCase().contains("very")) {
      return 100;
    }
    if (paramString.toLowerCase().contains("high")) {
      return 75;
    }
    return 0;
  }
  
  private void insertInToDataBase()
  {
    this.ruleDatabaseManager.insert(this.mRulesTables, this.mRuleDevicesTables, this.mDeviceCombinationTables);
    RuleUtility localRuleUtility = new RuleUtility(this.context);
    MoreUtil localMoreUtil = new MoreUtil();
    localRuleUtility.copyDataBase("/data/data/" + localMoreUtil.getPackageName(this.context) + "/databases/" + "pluginrules2.db", RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName(), "false");
  }
  
  private boolean isEveryDay(Sensor_1_X paramSensor_1_X)
  {
    int i = paramSensor_1_X.getSun().length();
    boolean bool1 = false;
    if (i != 0)
    {
      boolean bool2 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getMon());
      bool1 = false;
      if (bool2)
      {
        boolean bool3 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getTue());
        bool1 = false;
        if (bool3)
        {
          boolean bool4 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getWed());
          bool1 = false;
          if (bool4)
          {
            boolean bool5 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getThu());
            bool1 = false;
            if (bool5)
            {
              boolean bool6 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getFri());
              bool1 = false;
              if (bool6)
              {
                boolean bool7 = paramSensor_1_X.getSun().equals(paramSensor_1_X.getSat());
                bool1 = false;
                if (bool7) {
                  bool1 = true;
                }
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  private boolean isFriDay(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getFri() != null) && (paramSensor_1_X.getFri().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isMonday(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getMon() != null) && (paramSensor_1_X.getMon().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getFri().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getFri() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isSaturDay(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getSat() != null) && (paramSensor_1_X.getSat().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getFri().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getFri() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isSunday(Sensor_1_X paramSensor_1_X)
  {
    if (paramSensor_1_X.getSun().length() != 0)
    {
      if ((paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getFri().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getFri() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isThusDay(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getThu() != null) && (paramSensor_1_X.getThu().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getFri().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getFri() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isTuesday(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getTue() != null) && (paramSensor_1_X.getTue().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getWed().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getFri().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getWed() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getFri() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isWednesDay(Sensor_1_X paramSensor_1_X)
  {
    if ((paramSensor_1_X.getWed() != null) && (paramSensor_1_X.getWed().length() != 0))
    {
      if ((paramSensor_1_X.getSun().equals("")) && (paramSensor_1_X.getMon().equals("")) && (paramSensor_1_X.getTue().equals("")) && (paramSensor_1_X.getThu().equals("")) && (paramSensor_1_X.getFri().equals("")) && (paramSensor_1_X.getSat().equals(""))) {}
      while ((paramSensor_1_X.getSun() == null) && (paramSensor_1_X.getMon() == null) && (paramSensor_1_X.getTue() == null) && (paramSensor_1_X.getThu() == null) && (paramSensor_1_X.getFri() == null) && (paramSensor_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isWeekDay(Sensor_1_X paramSensor_1_X)
  {
    boolean bool1;
    if (((paramSensor_1_X.getSat() != null) && (!paramSensor_1_X.getSat().equals(""))) || (paramSensor_1_X.getSun() != null))
    {
      boolean bool6 = paramSensor_1_X.getSun().equals("");
      bool1 = false;
      if (!bool6) {}
    }
    else
    {
      int i = paramSensor_1_X.getMon().length();
      bool1 = false;
      if (i != 0)
      {
        boolean bool2 = paramSensor_1_X.getMon().equals(paramSensor_1_X.getTue());
        bool1 = false;
        if (bool2)
        {
          boolean bool3 = paramSensor_1_X.getMon().equals(paramSensor_1_X.getWed());
          bool1 = false;
          if (bool3)
          {
            boolean bool4 = paramSensor_1_X.getMon().equals(paramSensor_1_X.getThu());
            bool1 = false;
            if (bool4)
            {
              boolean bool5 = paramSensor_1_X.getMon().equals(paramSensor_1_X.getFri());
              bool1 = false;
              if (bool5) {
                bool1 = true;
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public void migrate()
  {
    this.mRulesTables = new ArrayList();
    this.mRuleDevicesTables = new ArrayList();
    this.mDeviceCombinationTables = new ArrayList();
    Iterator localIterator1 = this.sensorhList.iterator();
    while (localIterator1.hasNext())
    {
      Sensor_1_X localSensor_1_X3 = (Sensor_1_X)localIterator1.next();
      Hashtable localHashtable2 = (Hashtable)this.ruleHash.get(Integer.valueOf(localSensor_1_X3.getId()));
      if (localHashtable2 == null) {
        localHashtable2 = new Hashtable();
      }
      String str2 = localSensor_1_X3.getSensorudn();
      Vector localVector2 = (Vector)localHashtable2.get(str2);
      if (localVector2 == null) {
        localVector2 = new Vector();
      }
      localVector2.add(localSensor_1_X3);
      String str3 = localSensor_1_X3.getSensorudn();
      localHashtable2.put(str3, localVector2);
      this.ruleHash.put(Integer.valueOf(localSensor_1_X3.getId()), localHashtable2);
    }
    Enumeration localEnumeration1 = this.ruleHash.keys();
    while (localEnumeration1.hasMoreElements())
    {
      int i = Integer.parseInt(((Integer)localEnumeration1.nextElement()).toString());
      Hashtable localHashtable1 = (Hashtable)this.ruleHash.get(Integer.valueOf(i));
      if (localHashtable1.size() > 0)
      {
        Enumeration localEnumeration2 = localHashtable1.keys();
        int j = 0;
        while (localEnumeration2.hasMoreElements())
        {
          Vector localVector1 = (Vector)localHashtable1.get(((String)localEnumeration2.nextElement()).toString());
          Iterator localIterator2 = localVector1.iterator();
          Sensor_1_X localSensor_1_X2;
          for (;;)
          {
            if (!localIterator2.hasNext()) {
              break label973;
            }
            localSensor_1_X2 = (Sensor_1_X)localIterator2.next();
            if (j == 0)
            {
              j = 1;
              this.rules = new RulesTable();
              this.rules.setRuleId(localSensor_1_X2.getId());
              this.rules.setName(localSensor_1_X2.getName());
              this.rules.setType(localSensor_1_X2.getType());
              this.rules.setState(localSensor_1_X2.getEnable() + "");
            }
            System.out.println(" %%%%%%%%%%%% Sensor Migration %%%%%%%%%%%%%%%%%%%%");
            this.mRulesTables.add(this.rules);
            this.combinationTable = new DeviceCombinationTable();
            this.combinationTable.setRuleId(localSensor_1_X2.getId());
            this.combinationTable.setSensorId(localSensor_1_X2.getSensorudn());
            this.combinationTable.setDeviceId(localSensor_1_X2.getUdn());
            System.out.println(" %%%%%%%%%%%% Device sombination Migration %%%%%%%%%%%%%%%%%%%%");
            this.mDeviceCombinationTables.add(this.combinationTable);
            this.devicesTable = new RuleDevicesTable();
            this.devicesTable.setRuleId(i);
            this.devicesTable.setDeviceId(localSensor_1_X2.getUdn());
            int k = getDayId(localSensor_1_X2);
            if (k != -1)
            {
              this.devicesTable.setDayId(k);
              this.devicesTable.setStarttime(getStartTime(localSensor_1_X2));
              this.devicesTable.setRuleDuration(getRuleDuration(localSensor_1_X2));
              this.devicesTable.setStartAction(getRuleStartAction(localSensor_1_X2));
              this.devicesTable.setEndAction(getRuleEndAction(localSensor_1_X2));
              try
              {
                this.devicesTable.setSensorDuration(getSensorDuration(localSensor_1_X2));
                this.devicesTable.setType(-1);
                this.devicesTable.setLevel(-1);
                this.devicesTable.setValue("-1");
                this.mRuleDevicesTables.add(this.devicesTable);
              }
              catch (Exception localException3)
              {
                for (;;)
                {
                  localException3.printStackTrace();
                }
              }
            }
          }
          Iterator localIterator3 = getActiveDays(localSensor_1_X2).iterator();
          while (localIterator3.hasNext())
          {
            Integer localInteger = (Integer)localIterator3.next();
            String str1 = "";
            label736:
            int i1;
            switch (localInteger.intValue())
            {
            default: 
              this.devicesTable.setStarttime(getConveratedTime(localSensor_1_X2.getStartTime()));
              int m = getConveratedTime(localSensor_1_X2.getStartTime());
              int n = getConveratedEndTime(localSensor_1_X2.getEndTime());
              if (n > 0)
              {
                i1 = n - m;
                this.devicesTable.setRuleDuration(i1);
                this.devicesTable.setStartAction(getStartAction(localSensor_1_X2.getStartTime()));
                this.devicesTable.setEndAction(getEndAction(localSensor_1_X2.getEndTime()));
              }
              break;
            }
            try
            {
              this.devicesTable.setSensorDuration(Integer.parseInt(str1.split(",")[1]));
              this.devicesTable.setType(-1);
              this.devicesTable.setLevel(-1);
              this.devicesTable.setValue("-1");
              this.mRuleDevicesTables.add(this.devicesTable);
              continue;
              str1 = localSensor_1_X2.getSun();
              break label736;
              str1 = localSensor_1_X2.getMon();
              break label736;
              str1 = localSensor_1_X2.getTue();
              break label736;
              str1 = localSensor_1_X2.getWed();
              break label736;
              str1 = localSensor_1_X2.getThu();
              break label736;
              str1 = localSensor_1_X2.getFri();
              break label736;
              str1 = localSensor_1_X2.getSat();
              break label736;
              i1 = 0;
            }
            catch (Exception localException2)
            {
              for (;;)
              {
                localException2.printStackTrace();
              }
            }
          }
          label973:
          if (localVector1.size() > 0)
          {
            Sensor_1_X localSensor_1_X1 = (Sensor_1_X)localVector1.elementAt(0);
            RuleDevicesTable localRuleDevicesTable = new RuleDevicesTable();
            localRuleDevicesTable.setRuleId(localSensor_1_X1.getId());
            localRuleDevicesTable.setDeviceId(localSensor_1_X1.getSensorudn());
            localRuleDevicesTable.setDayId(-1);
            localRuleDevicesTable.setRuleDuration(-1);
            localRuleDevicesTable.setStarttime(-1);
            localRuleDevicesTable.setStartAction(-1.0D);
            localRuleDevicesTable.setEndAction(-1.0D);
            localRuleDevicesTable.setSensorDuration(-1);
            localRuleDevicesTable.setType(0);
            localRuleDevicesTable.setLevel(2);
            localRuleDevicesTable.setValue("" + getValue(localSensor_1_X1.getSensitivity()));
            this.mRuleDevicesTables.add(localRuleDevicesTable);
          }
        }
      }
    }
    try
    {
      this.ruleDatabaseManager = RuleDatabaseManager.getInstance(this.context);
      Thread local1 = new Thread()
      {
        public void run()
        {
          SensorDBMigrator.this.insertInToDataBase();
        }
      };
      local1.start();
      return;
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        localException1.printStackTrace();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/SensorDBMigrator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */