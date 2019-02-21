package com.belkin.wemo.rules.data;

import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.data.callback.RMRuleConflictErrorCallback;
import com.belkin.wemo.rules.data.callback.RMRuleConflictSuccessCallback;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.error.RMRuleConflictError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

public enum RMUserRules
{
  public static final String TAG = RMUserRules.class.getSimpleName();
  private final int DEFAULT_START_RULE_ID_NATIVE = 500;
  private int highestDBRuleId = 500;
  private int highestTNGRuleId = 500;
  private List<RMRule> rulesList = new CopyOnWriteArrayList();
  private RMRule tempRuleToDeleteOrEdit;
  
  static
  {
    RMUserRules[] arrayOfRMUserRules = new RMUserRules[1];
    arrayOfRMUserRules[0] = INSTANCE;
    $VALUES = arrayOfRMUserRules;
  }
  
  private RMUserRules() {}
  
  private void calculateNextRuleId()
  {
    Iterator localIterator = this.rulesList.iterator();
    while (localIterator.hasNext())
    {
      RMRule localRMRule = (RMRule)localIterator.next();
      switch (localRMRule.getRulesType())
      {
      case 1: 
      default: 
        break;
      case 2: 
        int i = localRMRule.getRuleId();
        if (i > this.highestDBRuleId) {
          this.highestDBRuleId = i;
        }
        break;
      }
    }
    SDKLogUtils.debugLog(TAG, "Highest rule ID: DB RULE = " + this.highestDBRuleId + "; TNG RULE = " + this.highestTNGRuleId);
  }
  
  private void setNextRuleIdOnRuleDeleted(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 2) {
      if (paramInt1 == -1 + this.highestDBRuleId) {
        this.highestDBRuleId = paramInt1;
      }
    }
    while (paramInt2 != 1) {
      return;
    }
  }
  
  public void addRule(RMRule paramRMRule)
  {
    if (paramRMRule != null) {}
    try
    {
      paramRMRule.setRuleId(assignNewRuleId(paramRMRule));
      this.rulesList.add(paramRMRule);
      int i = paramRMRule.getRuleId();
      if (this.highestDBRuleId < i) {
        this.highestDBRuleId = i;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void addRuleNoRuleIdChange(RMRule paramRMRule)
  {
    if (paramRMRule != null) {}
    try
    {
      this.rulesList.add(paramRMRule);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public int assignNewRuleId(RMRule paramRMRule)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_2
    //   4: aload_1
    //   5: ifnull +75 -> 80
    //   8: aload_1
    //   9: invokevirtual 75	com/belkin/wemo/rules/data/RMRule:getRulesType	()I
    //   12: istore 4
    //   14: iconst_0
    //   15: istore_2
    //   16: iload 4
    //   18: tableswitch	default:+22->40, 1:+86->104, 2:+66->84
    //   40: getstatic 39	com/belkin/wemo/rules/data/RMUserRules:TAG	Ljava/lang/String;
    //   43: new 80	java/lang/StringBuilder
    //   46: dup
    //   47: invokespecial 81	java/lang/StringBuilder:<init>	()V
    //   50: ldc -125
    //   52: invokevirtual 87	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: iload_2
    //   56: invokevirtual 90	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   59: ldc -123
    //   61: invokevirtual 87	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: iload 4
    //   66: invokevirtual 90	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   69: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   72: invokestatic 136	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   75: aload_1
    //   76: iload_2
    //   77: invokevirtual 124	com/belkin/wemo/rules/data/RMRule:setRuleId	(I)V
    //   80: aload_0
    //   81: monitorexit
    //   82: iload_2
    //   83: ireturn
    //   84: iconst_1
    //   85: aload_0
    //   86: getfield 44	com/belkin/wemo/rules/data/RMUserRules:highestDBRuleId	I
    //   89: iadd
    //   90: istore 6
    //   92: aload_0
    //   93: iload 6
    //   95: putfield 44	com/belkin/wemo/rules/data/RMUserRules:highestDBRuleId	I
    //   98: iload 6
    //   100: istore_2
    //   101: goto -61 -> 40
    //   104: iconst_1
    //   105: aload_0
    //   106: getfield 46	com/belkin/wemo/rules/data/RMUserRules:highestTNGRuleId	I
    //   109: iadd
    //   110: istore 5
    //   112: aload_0
    //   113: iload 5
    //   115: putfield 46	com/belkin/wemo/rules/data/RMUserRules:highestTNGRuleId	I
    //   118: iload 5
    //   120: istore_2
    //   121: goto -81 -> 40
    //   124: astore_3
    //   125: aload_0
    //   126: monitorexit
    //   127: aload_3
    //   128: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	129	0	this	RMUserRules
    //   0	129	1	paramRMRule	RMRule
    //   3	118	2	i	int
    //   124	4	3	localObject	Object
    //   12	53	4	j	int
    //   110	9	5	k	int
    //   90	9	6	m	int
    // Exception table:
    //   from	to	target	type
    //   8	14	124	finally
    //   40	80	124	finally
    //   84	98	124	finally
    //   104	118	124	finally
  }
  
  public void clear()
  {
    if (this.rulesList != null) {
      this.rulesList.clear();
    }
    this.highestDBRuleId = 500;
    this.highestTNGRuleId = 500;
    this.tempRuleToDeleteOrEdit = null;
  }
  
  /* Error */
  public RMRule deleteRule(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 52	com/belkin/wemo/rules/data/RMUserRules:rulesList	Ljava/util/List;
    //   6: invokeinterface 59 1 0
    //   11: astore_3
    //   12: aload_3
    //   13: invokeinterface 65 1 0
    //   18: istore 4
    //   20: aconst_null
    //   21: astore 5
    //   23: iload 4
    //   25: ifeq +39 -> 64
    //   28: aload_3
    //   29: invokeinterface 69 1 0
    //   34: checkcast 71	com/belkin/wemo/rules/data/RMRule
    //   37: astore 5
    //   39: aload 5
    //   41: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   44: iload_1
    //   45: if_icmpne +24 -> 69
    //   48: aload_3
    //   49: invokeinterface 146 1 0
    //   54: aload_0
    //   55: iload_1
    //   56: aload 5
    //   58: invokevirtual 75	com/belkin/wemo/rules/data/RMRule:getRulesType	()I
    //   61: invokespecial 148	com/belkin/wemo/rules/data/RMUserRules:setNextRuleIdOnRuleDeleted	(II)V
    //   64: aload_0
    //   65: monitorexit
    //   66: aload 5
    //   68: areturn
    //   69: goto -57 -> 12
    //   72: astore_2
    //   73: aload_0
    //   74: monitorexit
    //   75: aload_2
    //   76: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	77	0	this	RMUserRules
    //   0	77	1	paramInt	int
    //   72	4	2	localObject	Object
    //   11	38	3	localIterator	Iterator
    //   18	6	4	bool	boolean
    //   21	46	5	localRMRule	RMRule
    // Exception table:
    //   from	to	target	type
    //   2	12	72	finally
    //   12	20	72	finally
    //   28	64	72	finally
  }
  
  /* Error */
  public RMRule deleteRule(RMRule paramRMRule)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 52	com/belkin/wemo/rules/data/RMUserRules:rulesList	Ljava/util/List;
    //   6: invokeinterface 59 1 0
    //   11: astore_3
    //   12: aload_3
    //   13: invokeinterface 65 1 0
    //   18: istore 4
    //   20: aconst_null
    //   21: astore 5
    //   23: iload 4
    //   25: ifeq +46 -> 71
    //   28: aload_3
    //   29: invokeinterface 69 1 0
    //   34: checkcast 71	com/belkin/wemo/rules/data/RMRule
    //   37: astore 5
    //   39: aload 5
    //   41: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   44: aload_1
    //   45: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   48: if_icmpne +28 -> 76
    //   51: aload_3
    //   52: invokeinterface 146 1 0
    //   57: aload_0
    //   58: aload 5
    //   60: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   63: aload 5
    //   65: invokevirtual 75	com/belkin/wemo/rules/data/RMRule:getRulesType	()I
    //   68: invokespecial 148	com/belkin/wemo/rules/data/RMUserRules:setNextRuleIdOnRuleDeleted	(II)V
    //   71: aload_0
    //   72: monitorexit
    //   73: aload 5
    //   75: areturn
    //   76: goto -64 -> 12
    //   79: astore_2
    //   80: aload_0
    //   81: monitorexit
    //   82: aload_2
    //   83: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	84	0	this	RMUserRules
    //   0	84	1	paramRMRule	RMRule
    //   79	4	2	localObject	Object
    //   11	41	3	localIterator	Iterator
    //   18	6	4	bool	boolean
    //   21	53	5	localRMRule	RMRule
    // Exception table:
    //   from	to	target	type
    //   2	12	79	finally
    //   12	20	79	finally
    //   28	71	79	finally
  }
  
  /* Error */
  public RMRule deleteRuleNoRuleIdChange(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 52	com/belkin/wemo/rules/data/RMUserRules:rulesList	Ljava/util/List;
    //   6: invokeinterface 59 1 0
    //   11: astore_3
    //   12: aload_3
    //   13: invokeinterface 65 1 0
    //   18: istore 4
    //   20: aconst_null
    //   21: astore 5
    //   23: iload 4
    //   25: ifeq +29 -> 54
    //   28: aload_3
    //   29: invokeinterface 69 1 0
    //   34: checkcast 71	com/belkin/wemo/rules/data/RMRule
    //   37: astore 5
    //   39: aload 5
    //   41: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   44: iload_1
    //   45: if_icmpne +14 -> 59
    //   48: aload_3
    //   49: invokeinterface 146 1 0
    //   54: aload_0
    //   55: monitorexit
    //   56: aload 5
    //   58: areturn
    //   59: goto -47 -> 12
    //   62: astore_2
    //   63: aload_0
    //   64: monitorexit
    //   65: aload_2
    //   66: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	67	0	this	RMUserRules
    //   0	67	1	paramInt	int
    //   62	4	2	localObject	Object
    //   11	38	3	localIterator	Iterator
    //   18	6	4	bool	boolean
    //   21	36	5	localRMRule	RMRule
    // Exception table:
    //   from	to	target	type
    //   2	12	62	finally
    //   12	20	62	finally
    //   28	54	62	finally
  }
  
  public HashMap<Integer, List<RMDBRule>> getDBRuleDeviceDayToRulesMap(String paramString)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    localLinkedHashMap.put(Integer.valueOf(2), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(3), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(4), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(5), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(6), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(7), new ArrayList());
    localLinkedHashMap.put(Integer.valueOf(1), new ArrayList());
    Iterator localIterator1 = this.rulesList.iterator();
    for (;;)
    {
      if (!localIterator1.hasNext()) {
        return localLinkedHashMap;
      }
      RMRule localRMRule = (RMRule)localIterator1.next();
      if (localRMRule.getRulesType() == 2)
      {
        RMDBRule localRMDBRule = (RMDBRule)localRMRule;
        Iterator localIterator2 = localRMDBRule.getRuleDeviceSet().iterator();
        if (localIterator2.hasNext())
        {
          if (!((RMDBRuleDevice)localIterator2.next()).getUiUdn().equals(paramString)) {
            break;
          }
          Iterator localIterator3 = localRMDBRule.getDaySet().iterator();
          while (localIterator3.hasNext())
          {
            List localList = (List)localLinkedHashMap.get(Integer.valueOf(((Integer)localIterator3.next()).intValue()));
            if (localList != null) {
              localList.add(localRMDBRule);
            }
          }
        }
      }
    }
    return localLinkedHashMap;
  }
  
  public List<RMDBRule> getDBRulesList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.rulesList.iterator();
    while (localIterator.hasNext())
    {
      RMRule localRMRule = (RMRule)localIterator.next();
      if (localRMRule.getRulesType() == 2) {
        localArrayList.add((RMDBRule)localRMRule);
      }
    }
    return localArrayList;
  }
  
  public List<RMRule> getDeviceRules(String paramString)
  {
    return null;
  }
  
  public List<RMRule> getLEDRules(String paramString1, String paramString2)
  {
    return null;
  }
  
  public RMRule getRule(int paramInt)
  {
    Object localObject = null;
    Iterator localIterator = this.rulesList.iterator();
    while (localIterator.hasNext())
    {
      RMRule localRMRule = (RMRule)localIterator.next();
      switch (localRMRule.getRulesType())
      {
      case 1: 
      default: 
        break;
      case 2: 
        if (localRMRule.getRuleId() == paramInt) {
          localObject = localRMRule;
        }
        break;
      }
    }
    return (RMRule)localObject;
  }
  
  public <T> List<T> getRulesForSpecificType(Class<T> paramClass)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.rulesList.iterator();
    while (localIterator.hasNext())
    {
      RMRule localRMRule = (RMRule)localIterator.next();
      if (paramClass.isInstance(localRMRule)) {
        localArrayList.add(localRMRule);
      }
    }
    return localArrayList;
  }
  
  public List<RMRule> getRulesList()
  {
    return this.rulesList;
  }
  
  public int getRulesType(int paramInt)
  {
    int i = -1;
    Iterator localIterator = this.rulesList.iterator();
    while (localIterator.hasNext())
    {
      RMRule localRMRule = (RMRule)localIterator.next();
      if (localRMRule.getRuleId() == paramInt) {
        i = localRMRule.getRulesType();
      }
    }
    return i;
  }
  
  public RMRule getTempDBRuleToEditOrDelete()
  {
    return this.tempRuleToDeleteOrEdit;
  }
  
  public boolean isProcessDBRequired(RMDBRule paramRMDBRule, String paramString)
  {
    HashSet localHashSet = new HashSet(paramRMDBRule.getRuleDeviceSet());
    if ((this.tempRuleToDeleteOrEdit != null) && (this.tempRuleToDeleteOrEdit.getRulesType() == 2)) {
      localHashSet.addAll(((RMDBRule)this.tempRuleToDeleteOrEdit).getRuleDeviceSet());
    }
    Iterator localIterator = localHashSet.iterator();
    String str;
    do
    {
      boolean bool1 = localIterator.hasNext();
      bool2 = false;
      if (!bool1) {
        break;
      }
      str = ((RMDBRuleDevice)localIterator.next()).getUiUdn();
    } while ((!str.contains("Bridge")) && (!str.equalsIgnoreCase(paramString)));
    boolean bool2 = true;
    return bool2;
  }
  
  public boolean isRuleDuplicate(RMRule paramRMRule)
  {
    Iterator localIterator = this.rulesList.iterator();
    RMRule localRMRule;
    do
    {
      boolean bool1 = localIterator.hasNext();
      bool2 = false;
      if (!bool1) {
        break;
      }
      localRMRule = (RMRule)localIterator.next();
    } while ((localRMRule.getRuleId() == paramRMRule.getRuleId()) || (!localRMRule.equals(paramRMRule)));
    boolean bool2 = true;
    return bool2;
  }
  
  /* Error */
  public RMRule replaceRule(RMRule paramRMRule)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 52	com/belkin/wemo/rules/data/RMUserRules:rulesList	Ljava/util/List;
    //   6: invokeinterface 59 1 0
    //   11: astore_3
    //   12: aload_3
    //   13: invokeinterface 65 1 0
    //   18: istore 4
    //   20: aconst_null
    //   21: astore 5
    //   23: iload 4
    //   25: ifeq +32 -> 57
    //   28: aload_3
    //   29: invokeinterface 69 1 0
    //   34: checkcast 71	com/belkin/wemo/rules/data/RMRule
    //   37: astore 5
    //   39: aload 5
    //   41: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   44: aload_1
    //   45: invokevirtual 78	com/belkin/wemo/rules/data/RMRule:getRuleId	()I
    //   48: if_icmpne +25 -> 73
    //   51: aload_3
    //   52: invokeinterface 146 1 0
    //   57: aload_0
    //   58: getfield 52	com/belkin/wemo/rules/data/RMUserRules:rulesList	Ljava/util/List;
    //   61: aload_1
    //   62: invokeinterface 128 2 0
    //   67: pop
    //   68: aload_0
    //   69: monitorexit
    //   70: aload 5
    //   72: areturn
    //   73: goto -61 -> 12
    //   76: astore_2
    //   77: aload_0
    //   78: monitorexit
    //   79: aload_2
    //   80: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	this	RMUserRules
    //   0	81	1	paramRMRule	RMRule
    //   76	4	2	localObject	Object
    //   11	41	3	localIterator	Iterator
    //   18	6	4	bool	boolean
    //   21	50	5	localRMRule	RMRule
    // Exception table:
    //   from	to	target	type
    //   2	12	76	finally
    //   12	20	76	finally
    //   28	57	76	finally
    //   57	68	76	finally
  }
  
  public void setRulesList(List<RMRule> paramList)
  {
    if (paramList == null) {}
    for (;;)
    {
      try
      {
        this.rulesList = new ArrayList();
        this.highestDBRuleId = 500;
        this.highestTNGRuleId = 500;
        return;
      }
      finally {}
      this.rulesList = paramList;
      calculateNextRuleId();
    }
  }
  
  public void setTempDBRuleToEditOrDelete(RMRule paramRMRule)
  {
    this.tempRuleToDeleteOrEdit = paramRMRule;
  }
  
  public void verifyRuleConflicts(RMRule paramRMRule, RMRuleConflictSuccessCallback paramRMRuleConflictSuccessCallback, RMRuleConflictErrorCallback paramRMRuleConflictErrorCallback)
  {
    int i = paramRMRule.getRuleId();
    SDKLogUtils.debugLog(TAG, "Rule Conflict Checks: Other/New Rule ID: " + i);
    if (isRuleDuplicate(paramRMRule)) {
      if (paramRMRuleConflictErrorCallback != null) {
        paramRMRuleConflictErrorCallback.onConflictFound(new RMRuleConflictError(505, "Rule is duplicate of an existing rule."));
      }
    }
    label540:
    label589:
    label678:
    do
    {
      return;
      String str1 = "";
      int j = paramRMRule.getRulesType();
      SDKLogUtils.debugLog(TAG, "Rule Conflict Check: Other/New rules type (DB/TNG): " + j);
      int k = 0;
      int m = 0;
      RMDBRule localRMDBRule;
      if (j == 2)
      {
        localRMDBRule = (RMDBRule)paramRMRule;
        RMDBRuleType localRMDBRuleType = localRMDBRule.getRuleType();
        SDKLogUtils.debugLog(TAG, "Rule Conflict Check: Other/New rule type: " + localRMDBRuleType);
        int n = 1.$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType[localRMDBRuleType.ordinal()];
        k = 0;
        m = 0;
        switch (n)
        {
        }
      }
      for (;;)
      {
        if (m == 0) {
          break label678;
        }
        if (paramRMRuleConflictErrorCallback == null) {
          break;
        }
        RMRuleConflictError localRMRuleConflictError = new RMRuleConflictError(k, str1);
        paramRMRuleConflictErrorCallback.onConflictFound(localRMRuleConflictError);
        return;
        RMLongPressRule localRMLongPressRule1 = (RMLongPressRule)localRMDBRule;
        Iterator localIterator1 = localRMLongPressRule1.getRuleDeviceSet().iterator();
        String str4;
        int i2;
        do
        {
          DeviceInformation localDeviceInformation;
          do
          {
            Iterator localIterator5;
            while (!localIterator5.hasNext())
            {
              do
              {
                if (!localIterator1.hasNext()) {
                  break;
                }
              } while (3 != ((RMDBRuleDevice)localIterator1.next()).getStartAction());
              localIterator5 = localRMLongPressRule1.getTargetDeviceSet().iterator();
            }
            str4 = ((RMTargetDevice)localIterator5.next()).getDeviceId();
            localDeviceInformation = DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).getDevice(str4);
          } while (localDeviceInformation == null);
          i2 = RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getFirmwareVersionRevisionNumber(localDeviceInformation.getFirmwareVersion());
        } while (i2 >= 10600);
        m = 1;
        k = 901;
        str1 = "Long Press Away Mode rule cannot created on target devices with old FWs!";
        SDKLogUtils.errorLog(TAG, "LONG PRESS AWAY MODE RULE Creation Error due to old FW. Target DeviceUDN: " + str4 + "; FW Revision No:" + i2);
        continue;
        Iterator localIterator2 = getRulesList().iterator();
        String str2;
        String str3;
        do
        {
          Iterator localIterator4;
          do
          {
            Iterator localIterator3;
            while (!localIterator3.hasNext())
            {
              RMLongPressRule localRMLongPressRule2;
              for (;;)
              {
                boolean bool = localIterator2.hasNext();
                k = 0;
                m = 0;
                if (!bool) {
                  break;
                }
                RMRule localRMRule = (RMRule)localIterator2.next();
                int i1 = localRMRule.getRuleId();
                if ((localRMRule.getRulesType() == 2) && (((RMDBRule)localRMRule).getRuleType() == RMDBRuleType.LONG_PRESS))
                {
                  localRMLongPressRule2 = (RMLongPressRule)localRMRule;
                  if (i1 != i) {
                    break label540;
                  }
                  SDKLogUtils.debugLog(TAG, "Rule Conflict Checks: LONG PRESS IS BEING EDITED. PLEASE CONTINUE - Rule ID: " + i1 + "; Other Rule ID: " + i);
                }
              }
              localIterator3 = localRMLongPressRule2.getRuleDeviceSet().iterator();
              break label589;
            }
            str2 = ((RMDBRuleDevice)localIterator3.next()).getUiUdn();
            localIterator4 = localRMLongPressRule1.getRuleDeviceSet().iterator();
          } while (!localIterator4.hasNext());
          str3 = ((RMDBRuleDevice)localIterator4.next()).getUiUdn();
          SDKLogUtils.debugLog(TAG, "Rule Conflict Check: LONG PRESS - UDN: " + str2 + "; Other UDN: " + str3);
        } while (!str3.equalsIgnoreCase(str2));
        m = 1;
        k = 900;
        str1 = "Duplicate Rule: A Long Press rule already exists on the device!";
      }
    } while (paramRMRuleConflictSuccessCallback == null);
    paramRMRuleConflictSuccessCallback.onNoConflictFound();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMUserRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */