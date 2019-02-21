package com.belkin.wemo.rules.read.callback;

import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;

public abstract interface RMParseRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onRulesParsingFailed(WeMoError paramWeMoError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */