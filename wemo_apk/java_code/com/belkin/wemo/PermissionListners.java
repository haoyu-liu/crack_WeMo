package com.belkin.wemo;

public abstract interface PermissionListners
{
  public abstract boolean locationPermissionCheck();
  
  public abstract void onPermissionCheck(PermListner paramPermListner);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/PermissionListners.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */