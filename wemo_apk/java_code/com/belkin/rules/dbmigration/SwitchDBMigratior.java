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

public class SwitchDBMigratior
{
  private Context context;
  RuleDevicesTable devicesTable;
  public ArrayList<DeviceCombinationTable> mDeviceCombinationTables;
  public ArrayList<RuleDevicesTable> mRuleDevicesTables;
  public ArrayList<RulesTable> mRulesTables;
  private RuleDatabaseManager ruleDatabaseManager;
  private Hashtable<Integer, Vector> ruleHash = new Hashtable();
  private RulesTable rules;
  private Vector<Switch_1_X> switchList = new Vector();
  
  public SwitchDBMigratior(Vector<Switch_1_X> paramVector, Context paramContext)
  {
    this.switchList = paramVector;
    this.context = paramContext;
  }
  
  private Vector<Integer> getActiveDays(Switch_1_X paramSwitch_1_X)
  {
    Vector localVector = new Vector();
    if ((paramSwitch_1_X.getSun() != null) && (!paramSwitch_1_X.getSun().equals(""))) {
      localVector.add(Integer.valueOf(1));
    }
    if ((paramSwitch_1_X.getMon() != null) && (!paramSwitch_1_X.getMon().equals(""))) {
      localVector.add(Integer.valueOf(2));
    }
    if ((paramSwitch_1_X.getTue() != null) && (!paramSwitch_1_X.getTue().equals(""))) {
      localVector.add(Integer.valueOf(3));
    }
    if ((paramSwitch_1_X.getWed() != null) && (!paramSwitch_1_X.getWed().equals(""))) {
      localVector.add(Integer.valueOf(4));
    }
    if ((paramSwitch_1_X.getThu() != null) && (!paramSwitch_1_X.getThu().equals(""))) {
      localVector.add(Integer.valueOf(5));
    }
    if ((paramSwitch_1_X.getFri() != null) && (!paramSwitch_1_X.getFri().equals(""))) {
      localVector.add(Integer.valueOf(6));
    }
    if ((paramSwitch_1_X.getSat() != null) && (!paramSwitch_1_X.getSat().equals(""))) {
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
  
  private int getDayId(Switch_1_X paramSwitch_1_X)
  {
    if (isEveryDay(paramSwitch_1_X)) {
      return 0;
    }
    if (isSunday(paramSwitch_1_X)) {
      return 1;
    }
    if (isMonday(paramSwitch_1_X)) {
      return 2;
    }
    if (isTuesday(paramSwitch_1_X)) {
      return 3;
    }
    if (isWednesDay(paramSwitch_1_X)) {
      return 4;
    }
    if (isThusDay(paramSwitch_1_X)) {
      return 5;
    }
    if (isFriDay(paramSwitch_1_X)) {
      return 6;
    }
    if (isSaturDay(paramSwitch_1_X)) {
      return 7;
    }
    if (isWeekDay(paramSwitch_1_X)) {
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
  
  private int getEndTime(Switch_1_X paramSwitch_1_X)
  {
    switch (getDayId(paramSwitch_1_X))
    {
    default: 
      return 0;
    case 0: 
      return getConveratedEndTime(paramSwitch_1_X.getSun());
    case 1: 
      return getConveratedEndTime(paramSwitch_1_X.getSun());
    case 2: 
      return getConveratedEndTime(paramSwitch_1_X.getMon());
    case 3: 
      return getConveratedEndTime(paramSwitch_1_X.getTue());
    case 4: 
      return getConveratedEndTime(paramSwitch_1_X.getWed());
    case 5: 
      return getConveratedEndTime(paramSwitch_1_X.getThu());
    case 6: 
      return getConveratedEndTime(paramSwitch_1_X.getFri());
    case 7: 
      return getConveratedEndTime(paramSwitch_1_X.getSat());
    case 8: 
      return getConveratedEndTime(paramSwitch_1_X.getMon());
    }
    return getConveratedEndTime(paramSwitch_1_X.getSun());
  }
  
  private int getRuleDuration(Switch_1_X paramSwitch_1_X)
  {
    int i = getStartTime(paramSwitch_1_X);
    int j = getEndTime(paramSwitch_1_X);
    if (j > 0) {
      return j - i;
    }
    return 0;
  }
  
  private double getRuleEndAction(Switch_1_X paramSwitch_1_X)
  {
    switch (getDayId(paramSwitch_1_X))
    {
    default: 
      return 0.0D;
    case 0: 
      return getEndAction(paramSwitch_1_X.getSun());
    case 1: 
      return getEndAction(paramSwitch_1_X.getSun());
    case 2: 
      return getStartAction(paramSwitch_1_X.getMon());
    case 3: 
      return getEndAction(paramSwitch_1_X.getTue());
    case 4: 
      return getEndAction(paramSwitch_1_X.getWed());
    case 5: 
      return getEndAction(paramSwitch_1_X.getThu());
    case 6: 
      return getEndAction(paramSwitch_1_X.getFri());
    case 7: 
      return getEndAction(paramSwitch_1_X.getSat());
    case 8: 
      return getEndAction(paramSwitch_1_X.getMon());
    }
    return getEndAction(paramSwitch_1_X.getSun());
  }
  
  private double getRuleStartAction(Switch_1_X paramSwitch_1_X)
  {
    switch (getDayId(paramSwitch_1_X))
    {
    default: 
      return 0.0D;
    case 0: 
      return getStartAction(paramSwitch_1_X.getSun());
    case 1: 
      return getStartAction(paramSwitch_1_X.getSun());
    case 2: 
      return getStartAction(paramSwitch_1_X.getMon());
    case 3: 
      return getStartAction(paramSwitch_1_X.getTue());
    case 4: 
      return getStartAction(paramSwitch_1_X.getWed());
    case 5: 
      return getStartAction(paramSwitch_1_X.getThu());
    case 6: 
      return getStartAction(paramSwitch_1_X.getFri());
    case 7: 
      return getStartAction(paramSwitch_1_X.getSat());
    case 8: 
      return getStartAction(paramSwitch_1_X.getMon());
    }
    return getStartAction(paramSwitch_1_X.getSun());
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
  
  private int getStartTime(Switch_1_X paramSwitch_1_X)
  {
    switch (getDayId(paramSwitch_1_X))
    {
    default: 
      return 0;
    case 0: 
      return getConveratedTime(paramSwitch_1_X.getSun());
    case 1: 
      return getConveratedTime(paramSwitch_1_X.getSun());
    case 2: 
      return getConveratedTime(paramSwitch_1_X.getMon());
    case 3: 
      return getConveratedTime(paramSwitch_1_X.getTue());
    case 4: 
      return getConveratedTime(paramSwitch_1_X.getWed());
    case 5: 
      return getConveratedTime(paramSwitch_1_X.getThu());
    case 6: 
      return getConveratedTime(paramSwitch_1_X.getFri());
    case 7: 
      return getConveratedTime(paramSwitch_1_X.getSat());
    case 8: 
      return getConveratedTime(paramSwitch_1_X.getMon());
    }
    return getConveratedTime(paramSwitch_1_X.getSun());
  }
  
  private void insertInToDataBase()
  {
    this.ruleDatabaseManager.insert(this.mRulesTables, this.mRuleDevicesTables, this.mDeviceCombinationTables);
    RuleUtility localRuleUtility = new RuleUtility(this.context);
    MoreUtil localMoreUtil = new MoreUtil();
    localRuleUtility.copyDataBase("/data/data/" + localMoreUtil.getPackageName(this.context) + "/databases/" + "pluginrules2.db", RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName(), "false");
  }
  
  private boolean isEveryDay(Switch_1_X paramSwitch_1_X)
  {
    int i = paramSwitch_1_X.getSun().length();
    boolean bool1 = false;
    if (i != 0)
    {
      boolean bool2 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getMon());
      bool1 = false;
      if (bool2)
      {
        boolean bool3 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getTue());
        bool1 = false;
        if (bool3)
        {
          boolean bool4 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getWed());
          bool1 = false;
          if (bool4)
          {
            boolean bool5 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getThu());
            bool1 = false;
            if (bool5)
            {
              boolean bool6 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getFri());
              bool1 = false;
              if (bool6)
              {
                boolean bool7 = paramSwitch_1_X.getSun().equals(paramSwitch_1_X.getSat());
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
  
  private boolean isFriDay(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getFri() != null) && (paramSwitch_1_X.getFri().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isMonday(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getMon() != null) && (paramSwitch_1_X.getMon().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getFri().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getFri() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isSaturDay(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getSat() != null) && (paramSwitch_1_X.getSat().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getFri().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getFri() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isSunday(Switch_1_X paramSwitch_1_X)
  {
    if (paramSwitch_1_X.getSun().length() != 0)
    {
      if ((paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getFri().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getFri() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isThusDay(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getThu() != null) && (paramSwitch_1_X.getThu().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getFri().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getFri() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isTuesday(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getTue() != null) && (paramSwitch_1_X.getTue().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getWed().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getFri().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getWed() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getFri() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isWednesDay(Switch_1_X paramSwitch_1_X)
  {
    if ((paramSwitch_1_X.getWed() != null) && (paramSwitch_1_X.getWed().length() != 0))
    {
      if ((paramSwitch_1_X.getSun().equals("")) && (paramSwitch_1_X.getMon().equals("")) && (paramSwitch_1_X.getTue().equals("")) && (paramSwitch_1_X.getThu().equals("")) && (paramSwitch_1_X.getFri().equals("")) && (paramSwitch_1_X.getSat().equals(""))) {}
      while ((paramSwitch_1_X.getSun() == null) && (paramSwitch_1_X.getMon() == null) && (paramSwitch_1_X.getTue() == null) && (paramSwitch_1_X.getThu() == null) && (paramSwitch_1_X.getFri() == null) && (paramSwitch_1_X.getSat() == null)) {
        return true;
      }
      return false;
    }
    return false;
  }
  
  private boolean isWeekDay(Switch_1_X paramSwitch_1_X)
  {
    boolean bool1;
    if (((paramSwitch_1_X.getSat() != null) && (!paramSwitch_1_X.getSat().equals(""))) || (paramSwitch_1_X.getSun() != null))
    {
      boolean bool6 = paramSwitch_1_X.getSun().equals("");
      bool1 = false;
      if (!bool6) {}
    }
    else
    {
      int i = paramSwitch_1_X.getMon().length();
      bool1 = false;
      if (i != 0)
      {
        boolean bool2 = paramSwitch_1_X.getMon().equals(paramSwitch_1_X.getTue());
        bool1 = false;
        if (bool2)
        {
          boolean bool3 = paramSwitch_1_X.getMon().equals(paramSwitch_1_X.getWed());
          bool1 = false;
          if (bool3)
          {
            boolean bool4 = paramSwitch_1_X.getMon().equals(paramSwitch_1_X.getThu());
            bool1 = false;
            if (bool4)
            {
              boolean bool5 = paramSwitch_1_X.getMon().equals(paramSwitch_1_X.getFri());
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
    Iterator localIterator1 = this.switchList.iterator();
    while (localIterator1.hasNext())
    {
      Switch_1_X localSwitch_1_X2 = (Switch_1_X)localIterator1.next();
      this.rules = new RulesTable();
      this.rules.setRuleId(localSwitch_1_X2.getId());
      this.rules.setName(localSwitch_1_X2.getName());
      this.rules.setType(localSwitch_1_X2.getType());
      this.rules.setState(localSwitch_1_X2.getEnable());
      Vector localVector = (Vector)this.ruleHash.get(Integer.valueOf(this.rules.getRuleId()));
      if (localVector == null) {
        localVector = new Vector();
      }
      localVector.add(localSwitch_1_X2);
      this.ruleHash.put(Integer.valueOf(this.rules.getRuleId()), localVector);
      System.out.println(" %%%%%%%%%%%% Switch Migration %%%%%%%%%%%%%%%%%%%%");
      this.mRulesTables.add(this.rules);
    }
    label262:
    Switch_1_X localSwitch_1_X1;
    label449:
    label465:
    Iterator localIterator3;
    do
    {
      Enumeration localEnumeration = this.ruleHash.keys();
      break label262;
      if (!localEnumeration.hasMoreElements()) {
        break;
      }
      int i = Integer.parseInt(((Integer)localEnumeration.nextElement()).toString());
      Iterator localIterator2 = ((Vector)this.ruleHash.get(Integer.valueOf(i))).iterator();
      if (localIterator2.hasNext())
      {
        localSwitch_1_X1 = (Switch_1_X)localIterator2.next();
        this.devicesTable = new RuleDevicesTable();
        this.devicesTable.setRuleId(i);
        this.devicesTable.setDeviceId(localSwitch_1_X1.getUdn());
        int j = getDayId(localSwitch_1_X1);
        if (j == -1) {
          break label465;
        }
        this.devicesTable.setDayId(j);
        this.devicesTable.setStarttime(getStartTime(localSwitch_1_X1));
        this.devicesTable.setRuleDuration(getRuleDuration(localSwitch_1_X1));
        this.devicesTable.setStartAction(getRuleStartAction(localSwitch_1_X1));
        if (!localSwitch_1_X1.getType().contains("Simple Switch")) {
          break label449;
        }
        this.devicesTable.setEndAction(0.0D);
      }
      for (;;)
      {
        this.devicesTable.setSensorDuration(-1);
        this.devicesTable.setType(-1);
        this.devicesTable.setValue("-1");
        this.devicesTable.setLevel(-1);
        this.mRuleDevicesTables.add(this.devicesTable);
        break label262;
        break;
        this.devicesTable.setEndAction(getRuleEndAction(localSwitch_1_X1));
      }
      localIterator3 = getActiveDays(localSwitch_1_X1).iterator();
    } while (!localIterator3.hasNext());
    Integer localInteger = (Integer)localIterator3.next();
    String str = "";
    label548:
    int n;
    switch (localInteger.intValue())
    {
    default: 
      this.devicesTable.setStarttime(getConveratedTime(str));
      int k = getConveratedTime(str);
      int m = getConveratedEndTime(str);
      if (m > 0)
      {
        n = m - k;
        label589:
        this.devicesTable.setRuleDuration(n);
        this.devicesTable.setStartAction(getStartAction(str));
        if (!localSwitch_1_X1.getType().contains("Simple Switch")) {
          break label746;
        }
        this.devicesTable.setEndAction(0.0D);
      }
      break;
    }
    for (;;)
    {
      this.devicesTable.setSensorDuration(-1);
      this.devicesTable.setType(-1);
      this.devicesTable.setValue("-1");
      this.devicesTable.setLevel(-1);
      break;
      str = localSwitch_1_X1.getSun();
      break label548;
      str = localSwitch_1_X1.getMon();
      break label548;
      str = localSwitch_1_X1.getTue();
      break label548;
      str = localSwitch_1_X1.getWed();
      break label548;
      str = localSwitch_1_X1.getThu();
      break label548;
      str = localSwitch_1_X1.getFri();
      break label548;
      str = localSwitch_1_X1.getSat();
      break label548;
      n = 0;
      break label589;
      label746:
      this.devicesTable.setEndAction(getRuleEndAction(localSwitch_1_X1));
    }
    try
    {
      this.ruleDatabaseManager = RuleDatabaseManager.getInstance(this.context);
      Thread local1 = new Thread()
      {
        public void run()
        {
          SwitchDBMigratior.this.insertInToDataBase();
        }
      };
      local1.start();
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/SwitchDBMigratior.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */