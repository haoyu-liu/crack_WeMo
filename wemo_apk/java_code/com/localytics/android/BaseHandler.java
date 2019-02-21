package com.localytics.android;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

abstract class BaseHandler
  extends Handler
{
  private static final String CANCEL_UPLOAD = "cancel";
  private static final int MESSAGE_GET_VALUE = 2;
  static final int MESSAGE_INIT = 1;
  private static final int MESSAGE_UPLOAD = 3;
  static final int MESSAGE_UPLOAD_CALLBACK = 4;
  private static final String UPLOAD_WAKE_LOCK = "UPLOAD_WAKE_LOCK";
  protected boolean doesRetry = true;
  ListenersSet listeners;
  LocalyticsDao mLocalyticsDao;
  BaseProvider mProvider;
  private PowerManager.WakeLock mWakeLock;
  private int maxRowToUpload = 0;
  private int numberOfRetries = 0;
  private Message pendingUploadMessage = null;
  private boolean queuePriorityMessages = false;
  String siloName;
  private BaseUploadThread uploadThread = null;
  
  BaseHandler(LocalyticsDao paramLocalyticsDao, Looper paramLooper)
  {
    super(paramLooper);
    this.mLocalyticsDao = paramLocalyticsDao;
  }
  
  private void _uploadCallback(int paramInt, String paramString)
  {
    String str = this.uploadThread.customerID;
    this.uploadThread = null;
    if (paramInt > 0) {
      _deleteUploadedData(paramInt);
    }
    for (this.numberOfRetries = 0; (!this.doesRetry) || (paramInt == this.maxRowToUpload) || (this.numberOfRetries > 3); this.numberOfRetries = (1 + this.numberOfRetries))
    {
      if (paramInt == this.maxRowToUpload) {
        _onUploadCompleted(paramString);
      }
      cancelPendingUpload();
      this.numberOfRetries = 0;
      this.maxRowToUpload = 0;
      exitWakeLock();
      return;
    }
    upload(false, 10000L, str);
  }
  
  private void cancelPendingUpload()
  {
    if (this.pendingUploadMessage != null)
    {
      Bundle localBundle = new Bundle();
      localBundle.putBoolean("cancel", true);
      this.pendingUploadMessage.setData(localBundle);
      this.pendingUploadMessage = null;
      this.numberOfRetries = 0;
      this.maxRowToUpload = 0;
    }
  }
  
  private void enterWakeLock()
  {
    Context localContext = this.mLocalyticsDao.getAppContext();
    if (localContext.getPackageManager().checkPermission("android.permission.WAKE_LOCK", localContext.getPackageName()) == 0)
    {
      if (this.mWakeLock == null)
      {
        this.mWakeLock = ((PowerManager)localContext.getSystemService("power")).newWakeLock(1, "UPLOAD_WAKE_LOCK");
        if (this.mWakeLock.isHeld()) {
          Localytics.Log.w("Wake lock will be acquired but is held when shouldn't be.");
        }
        this.mWakeLock.acquire();
        if (this.mWakeLock.isHeld()) {
          Localytics.Log.v("Wake lock acquired.");
        }
      }
      else
      {
        return;
      }
      Localytics.Log.w("Localytics library failed to get wake lock");
      return;
    }
    Localytics.Log.v("android.permission.WAKE_LOCK is missing from the Manifest file.");
  }
  
  private void exitWakeLock()
  {
    Context localContext = this.mLocalyticsDao.getAppContext();
    if (localContext.getPackageManager().checkPermission("android.permission.WAKE_LOCK", localContext.getPackageName()) == 0)
    {
      if (this.mWakeLock != null)
      {
        if (!this.mWakeLock.isHeld()) {
          Localytics.Log.w("Wake lock will be released but not held when should be.");
        }
        this.mWakeLock.release();
        if (!this.mWakeLock.isHeld()) {
          break label78;
        }
        Localytics.Log.w("Wake lock was not released when it should have been.");
      }
      for (;;)
      {
        this.mWakeLock = null;
        return;
        label78:
        Localytics.Log.v("Wake lock released.");
      }
    }
    Localytics.Log.v("android.permission.WAKE_LOCK is missing from the Manifest file.");
  }
  
  private <T> FutureTask<T> getFuture(Callable<T> paramCallable)
  {
    FutureTask localFutureTask = new FutureTask(paramCallable);
    queueMessage(obtainMessage(2, localFutureTask));
    return localFutureTask;
  }
  
  private <T> T getType(Callable<T> paramCallable, T paramT)
  {
    if (Looper.getMainLooper() == Looper.myLooper()) {
      throw new RuntimeException("Cannot be called on the main thread.");
    }
    return (T)getFutureTaskValue(getFuture(paramCallable), paramT);
  }
  
  protected abstract void _deleteUploadedData(int paramInt);
  
  protected abstract TreeMap<Integer, Object> _getDataToUpload();
  
  protected abstract int _getMaxRowToUpload();
  
  abstract void _init();
  
  protected abstract void _onUploadCompleted(String paramString);
  
  void _upload(boolean paramBoolean, String paramString)
  {
    if ((this.maxRowToUpload != 0) && (this.uploadThread != null) && (!this.uploadThread.isAlive()))
    {
      this.maxRowToUpload = 0;
      this.uploadThread = null;
    }
    int i = _getMaxRowToUpload();
    if ((paramBoolean) && (this.maxRowToUpload != 0))
    {
      this.maxRowToUpload = i;
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.siloName.toLowerCase();
      Localytics.Log.d(String.format("Already uploading %s", arrayOfObject));
      return;
    }
    TreeMap localTreeMap;
    try
    {
      localTreeMap = _getDataToUpload();
      if (localTreeMap.size() == 0)
      {
        this.maxRowToUpload = 0;
        return;
      }
    }
    catch (Exception localException)
    {
      Localytics.Log.w("Error occurred during upload", localException);
      this.maxRowToUpload = 0;
      return;
    }
    if (paramBoolean) {
      this.maxRowToUpload = i;
    }
    enterWakeLock();
    BaseUploadThread localBaseUploadThread = getUploadThread(localTreeMap, paramString);
    this.uploadThread = localBaseUploadThread;
    localBaseUploadThread.start();
  }
  
  void addListener(BaseListener paramBaseListener)
  {
    synchronized (this.listeners)
    {
      this.listeners.add(paramBaseListener);
      return;
    }
  }
  
  boolean getBool(Callable<Boolean> paramCallable)
  {
    return ((Boolean)getType(paramCallable, Boolean.valueOf(false))).booleanValue();
  }
  
  <T> T getFutureTaskValue(FutureTask<T> paramFutureTask, T paramT)
  {
    try
    {
      Object localObject2 = paramFutureTask.get();
      return (T)localObject2;
    }
    catch (Exception localException)
    {
      localException = localException;
      return paramT;
    }
    finally
    {
      localObject1 = finally;
    }
    return paramT;
  }
  
  List getList(Callable<List> paramCallable)
  {
    return (List)getType(paramCallable, null);
  }
  
  Map getMap(Callable<Map> paramCallable)
  {
    return (Map)getType(paramCallable, null);
  }
  
  String getString(Callable<String> paramCallable)
  {
    return (String)getType(paramCallable, null);
  }
  
  protected abstract BaseUploadThread getUploadThread(TreeMap<Integer, Object> paramTreeMap, String paramString);
  
  public void handleMessage(Message paramMessage)
  {
    try
    {
      super.handleMessage(paramMessage);
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = this.siloName;
      arrayOfObject2[1] = paramMessage;
      Localytics.Log.v(String.format("%s handler received %s", arrayOfObject2));
      switch (paramMessage.what)
      {
      default: 
        handleMessageExtended(paramMessage);
        return;
      }
    }
    catch (Exception localException)
    {
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = this.siloName;
      arrayOfObject1[1] = String.valueOf(paramMessage.what);
      Localytics.Log.e(String.format("%s handler can't handle message %s", arrayOfObject1), localException);
      return;
    }
    _init();
    return;
    final FutureTask localFutureTask = (FutureTask)paramMessage.obj;
    this.mProvider.runBatchTransaction(new Runnable()
    {
      public void run()
      {
        localFutureTask.run();
      }
    });
    return;
    Object[] arrayOfObject5 = new Object[1];
    arrayOfObject5[0] = this.siloName;
    Localytics.Log.d(String.format("%s handler received MESSAGE_UPLOAD", arrayOfObject5));
    Object[] arrayOfObject6 = (Object[])paramMessage.obj;
    final Boolean localBoolean = (Boolean)arrayOfObject6[0];
    final String str2 = (String)arrayOfObject6[1];
    if (!paramMessage.getData().getBoolean("cancel"))
    {
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          BaseHandler.this._upload(localBoolean.booleanValue(), str2);
        }
      });
      return;
      Object[] arrayOfObject3 = new Object[1];
      arrayOfObject3[0] = this.siloName;
      Localytics.Log.d(String.format("%s handler received MESSAGE_UPLOAD_CALLBACK", arrayOfObject3));
      Object[] arrayOfObject4 = (Object[])paramMessage.obj;
      final int i = ((Integer)arrayOfObject4[0]).intValue();
      final String str1 = (String)arrayOfObject4[1];
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          BaseHandler.this._uploadCallback(i, str1);
        }
      });
    }
  }
  
  void handleMessageExtended(Message paramMessage)
    throws Exception
  {
    throw new Exception("Fell through switch statement");
  }
  
  boolean queueMessage(Message paramMessage)
  {
    if ((this.queuePriorityMessages) && (getLooper().getThread() == Thread.currentThread()))
    {
      handleMessage(paramMessage);
      return true;
    }
    return sendMessage(paramMessage);
  }
  
  final boolean queueMessageDelayed(Message paramMessage, long paramLong)
  {
    if (paramLong == 0L) {
      return queueMessage(paramMessage);
    }
    return sendMessageDelayed(paramMessage, paramLong);
  }
  
  void removeListener(BaseListener paramBaseListener)
  {
    synchronized (this.listeners)
    {
      this.listeners.remove(paramBaseListener);
      return;
    }
  }
  
  void upload(String paramString)
  {
    upload(true, 0L, paramString);
  }
  
  void upload(boolean paramBoolean, long paramLong, String paramString)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Boolean.valueOf(paramBoolean);
    arrayOfObject[1] = paramString;
    Message localMessage = obtainMessage(3, arrayOfObject);
    if (paramLong == 0L)
    {
      cancelPendingUpload();
      queueMessage(localMessage);
      return;
    }
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("cancel", false);
    this.pendingUploadMessage = localMessage;
    this.pendingUploadMessage.setData(localBundle);
    queueMessageDelayed(this.pendingUploadMessage, paramLong);
  }
  
  public static abstract interface BaseListener {}
  
  abstract class ListenersSet
    extends HashSet<BaseHandler.BaseListener>
  {
    ListenersSet() {}
    
    /* Error */
    void callListeners(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 11	com/localytics/android/BaseHandler$ListenersSet:this$0	Lcom/localytics/android/BaseHandler;
      //   6: astore 5
      //   8: aload 5
      //   10: monitorenter
      //   11: aload_0
      //   12: getfield 11	com/localytics/android/BaseHandler$ListenersSet:this$0	Lcom/localytics/android/BaseHandler;
      //   15: iconst_1
      //   16: invokestatic 24	com/localytics/android/BaseHandler:access$102	(Lcom/localytics/android/BaseHandler;Z)Z
      //   19: pop
      //   20: aload_0
      //   21: invokevirtual 28	com/localytics/android/BaseHandler$ListenersSet:iterator	()Ljava/util/Iterator;
      //   24: astore 8
      //   26: aload 8
      //   28: invokeinterface 34 1 0
      //   33: ifeq +29 -> 62
      //   36: aload 8
      //   38: invokeinterface 38 1 0
      //   43: astore 10
      //   45: aload 10
      //   47: aload_1
      //   48: aload_2
      //   49: aload_3
      //   50: invokestatic 44	com/localytics/android/ReflectionUtils:tryInvokeInstance	(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
      //   53: pop
      //   54: goto -28 -> 26
      //   57: astore 11
      //   59: goto -33 -> 26
      //   62: aload_0
      //   63: getfield 11	com/localytics/android/BaseHandler$ListenersSet:this$0	Lcom/localytics/android/BaseHandler;
      //   66: iconst_0
      //   67: invokestatic 24	com/localytics/android/BaseHandler:access$102	(Lcom/localytics/android/BaseHandler;Z)Z
      //   70: pop
      //   71: aload 5
      //   73: monitorexit
      //   74: aload_0
      //   75: monitorexit
      //   76: return
      //   77: astore 6
      //   79: aload 5
      //   81: monitorexit
      //   82: aload 6
      //   84: athrow
      //   85: astore 4
      //   87: aload_0
      //   88: monitorexit
      //   89: aload 4
      //   91: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	92	0	this	ListenersSet
      //   0	92	1	paramString	String
      //   0	92	2	paramArrayOfClass	Class<?>[]
      //   0	92	3	paramArrayOfObject	Object[]
      //   85	5	4	localObject1	Object
      //   77	6	6	localObject2	Object
      //   24	13	8	localIterator	java.util.Iterator
      //   43	3	10	localObject3	Object
      //   57	1	11	localException	Exception
      // Exception table:
      //   from	to	target	type
      //   45	54	57	java/lang/Exception
      //   11	26	77	finally
      //   26	45	77	finally
      //   45	54	77	finally
      //   62	74	77	finally
      //   79	82	77	finally
      //   2	11	85	finally
      //   82	85	85	finally
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/BaseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */