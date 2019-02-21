package com.belkin.wemo.rules.operation.download.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMRulesDBDownloadSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRulesDBDownloaded(String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */