package com.belkin.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.ArrayList;
import java.util.List;

public class ReceiverManager
{
  private static List<BroadcastReceiver> receivers = new ArrayList();
  private static ReceiverManager ref;
  private Context context;
  
  private ReceiverManager(Context paramContext)
  {
    this.context = paramContext;
  }
  
  public static ReceiverManager init(Context paramContext)
  {
    try
    {
      if (ref == null) {
        ref = new ReceiverManager(paramContext);
      }
      ReceiverManager localReceiverManager = ref;
      return localReceiverManager;
    }
    finally {}
  }
  
  public boolean isReceiverRegistered(BroadcastReceiver paramBroadcastReceiver)
  {
    return receivers.contains(paramBroadcastReceiver);
  }
  
  public Intent registerReceiver(BroadcastReceiver paramBroadcastReceiver, IntentFilter paramIntentFilter)
  {
    receivers.add(paramBroadcastReceiver);
    return this.context.registerReceiver(paramBroadcastReceiver, paramIntentFilter);
  }
  
  public void unregisterReceiver(BroadcastReceiver paramBroadcastReceiver)
  {
    receivers.remove(paramBroadcastReceiver);
    this.context.unregisterReceiver(paramBroadcastReceiver);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/ReceiverManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */