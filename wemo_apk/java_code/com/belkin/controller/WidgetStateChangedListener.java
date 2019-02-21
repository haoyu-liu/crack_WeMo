package com.belkin.controller;

import android.content.Context;

public abstract interface WidgetStateChangedListener
{
  public abstract boolean appliesToDevice(String paramString);
  
  public abstract void deviceStateChanged(Context paramContext, String paramString, boolean paramBoolean);
  
  public abstract int getState();
  
  public abstract int getWidgetId();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/WidgetStateChangedListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */