package com.belkin.wemo.rules.composer.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;

public abstract interface RMComposeRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onRulesCompositionFailed();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */