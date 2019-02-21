package com.belkin.wemo.rules.read;

import com.belkin.wemo.rules.read.callback.RMParseRulesErrorCallback;
import com.belkin.wemo.rules.read.callback.RMParseRulesSuccessCallback;
import com.belkin.wemo.rules.read.type.RMIReadRulesType;
import com.belkin.wemo.rules.read.type.db.RMReadDBRulesFactory;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;

public enum RMParseRulesManager
{
  static
  {
    RMParseRulesManager[] arrayOfRMParseRulesManager = new RMParseRulesManager[1];
    arrayOfRMParseRulesManager[0] = INSTANCE;
    $VALUES = arrayOfRMParseRulesManager;
  }
  
  private RMParseRulesManager() {}
  
  public void parseRules(RMParseRulesSuccessCallback paramRMParseRulesSuccessCallback, RMParseRulesErrorCallback paramRMParseRulesErrorCallback)
  {
    RMParseRulesHandler localRMParseRulesHandler = new RMParseRulesHandler(paramRMParseRulesSuccessCallback, paramRMParseRulesErrorCallback, 1);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new ParseRulesTypeRunnable(RMReadDBRulesFactory.INSTANCE.getParseDBRulesInstance(), localRMParseRulesHandler));
  }
  
  private class ParseRulesTypeRunnable
    extends WeMoRunnable
  {
    private RMParseRulesHandler handler;
    private RMIReadRulesType parseRulesTypeIns;
    
    public ParseRulesTypeRunnable(RMIReadRulesType paramRMIReadRulesType, RMParseRulesHandler paramRMParseRulesHandler)
    {
      this.parseRulesTypeIns = paramRMIReadRulesType;
      this.handler = paramRMParseRulesHandler;
    }
    
    public void run()
    {
      this.parseRulesTypeIns.parseRules(this.handler, this.handler);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/RMParseRulesManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */