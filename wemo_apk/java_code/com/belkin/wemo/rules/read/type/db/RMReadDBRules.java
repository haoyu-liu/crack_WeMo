package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import com.belkin.wemo.rules.read.type.RMIReadRulesType;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeErrorCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeSuccessCallback;
import com.belkin.wemo.rules.read.type.db.handler.RMReadDBRulesHandler;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RMReadDBRules
  implements RMIReadRulesType
{
  private static final String TAG = RMReadDBRules.class.getSimpleName();
  
  public void parseRules(RMReadRulesTypeSuccessCallback paramRMReadRulesTypeSuccessCallback, RMReadRulesTypeErrorCallback paramRMReadRulesTypeErrorCallback)
  {
    try
    {
      List localList = RMRulesDBManager.getInstance().getRules();
      int i = localList.size();
      SDKLogUtils.infoLog(TAG, "Fetch Rules: Row Objects (Entries) in RULES table: " + i);
      if (localList.isEmpty())
      {
        if (paramRMReadRulesTypeSuccessCallback != null) {
          paramRMReadRulesTypeSuccessCallback.onRulesParsed(new ArrayList(), 2);
        }
      }
      else
      {
        RMReadDBRulesHandler localRMReadDBRulesHandler = new RMReadDBRulesHandler(paramRMReadRulesTypeSuccessCallback, paramRMReadRulesTypeErrorCallback, i);
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          RMTRules localRMTRules = (RMTRules)localIterator.next();
          WeMoThreadPoolHandler.getInstance().executeViaBackground(new ReadDBRulesTypeRunnable(localRMTRules, localRMReadDBRulesHandler));
        }
      }
      return;
    }
    catch (RuleDBException localRuleDBException)
    {
      if (paramRMReadRulesTypeErrorCallback != null) {
        paramRMReadRulesTypeErrorCallback.onRulesExtractionFailed(new RMParseRuleError(2, ""));
      }
    }
  }
  
  private class ReadDBRulesTypeRunnable
    extends WeMoRunnable
  {
    private RMReadDBRulesHandler handler;
    private RMTRules ruleDBEntry;
    
    public ReadDBRulesTypeRunnable(RMTRules paramRMTRules, RMReadDBRulesHandler paramRMReadDBRulesHandler)
    {
      this.ruleDBEntry = paramRMTRules;
      this.handler = paramRMReadDBRulesHandler;
    }
    
    public void run()
    {
      String str = this.ruleDBEntry.getType();
      SDKLogUtils.debugLog(this.TAG, "Fetch Rules: Reading rule devices for type: " + str);
      try
      {
        RMDBRuleType localRMDBRuleType = RMDBRuleType.fromString(str);
        RMIDBRuleParser localRMIDBRuleParser = RMDBRuleParserFactory.INSTANCE.getDBRuleParserInstance(localRMDBRuleType);
        if (localRMIDBRuleParser != null)
        {
          SDKLogUtils.debugLog(this.TAG, "Fetch Rules: DBRuleParser returned by factory: " + localRMIDBRuleParser.getClass().getSimpleName());
          localRMIDBRuleParser.extractRule(this.ruleDBEntry, this.handler, this.handler);
          return;
        }
        SDKLogUtils.errorLog(this.TAG, "Fetch Rules: DBRuleParser returned by factory: NULL: Most probably as parsing is currently supported only for LONG PRESS.");
        this.handler.onInvalidRuleFound(new RMParseRuleError(2, str));
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        SDKLogUtils.errorLog(this.TAG, "Fetch Rules: IllegalArgumentException while converting String to DBRuleType: ", localIllegalArgumentException);
        RMParseRuleError localRMParseRuleError = new RMParseRuleError(2, str);
        localRMParseRuleError.setErrorMessage(localIllegalArgumentException.getMessage());
        this.handler.onInvalidRuleFound(localRMParseRuleError);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMReadDBRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */