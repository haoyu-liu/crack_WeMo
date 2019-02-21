package com.belkin.wemo.rules.operation.download.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMRulesDBDownloadErrorCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRulesDBDownloadException(Exception paramException);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */