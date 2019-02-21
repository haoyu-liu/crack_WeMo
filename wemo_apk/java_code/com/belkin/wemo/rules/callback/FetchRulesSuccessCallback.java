package com.belkin.wemo.rules.callback;

import java.util.ArrayList;

public abstract interface FetchRulesSuccessCallback
  extends WeMoRulesCallback
{
  public abstract void onSuccess(String paramString, int paramInt, ArrayList<String> paramArrayList);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/FetchRulesSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */