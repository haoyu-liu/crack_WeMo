package android.support.v4.os;

import android.os.Build.VERSION;

public final class CancellationSignal
{
  private boolean mCancelInProgress;
  private Object mCancellationSignalObj;
  private boolean mIsCanceled;
  private OnCancelListener mOnCancelListener;
  
  private void waitForCancelFinishedLocked()
  {
    while (this.mCancelInProgress) {
      try
      {
        wait();
      }
      catch (InterruptedException localInterruptedException) {}
    }
  }
  
  /* Error */
  public void cancel()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 26	android/support/v4/os/CancellationSignal:mIsCanceled	Z
    //   6: ifeq +6 -> 12
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: aload_0
    //   13: iconst_1
    //   14: putfield 26	android/support/v4/os/CancellationSignal:mIsCanceled	Z
    //   17: aload_0
    //   18: iconst_1
    //   19: putfield 20	android/support/v4/os/CancellationSignal:mCancelInProgress	Z
    //   22: aload_0
    //   23: getfield 28	android/support/v4/os/CancellationSignal:mOnCancelListener	Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    //   26: astore_2
    //   27: aload_0
    //   28: getfield 30	android/support/v4/os/CancellationSignal:mCancellationSignalObj	Ljava/lang/Object;
    //   31: astore_3
    //   32: aload_0
    //   33: monitorexit
    //   34: aload_2
    //   35: ifnull +9 -> 44
    //   38: aload_2
    //   39: invokeinterface 35 1 0
    //   44: aload_3
    //   45: ifnull +7 -> 52
    //   48: aload_3
    //   49: invokestatic 40	android/support/v4/os/CancellationSignalCompatJellybean:cancel	(Ljava/lang/Object;)V
    //   52: aload_0
    //   53: monitorenter
    //   54: aload_0
    //   55: iconst_0
    //   56: putfield 20	android/support/v4/os/CancellationSignal:mCancelInProgress	Z
    //   59: aload_0
    //   60: invokevirtual 43	java/lang/Object:notifyAll	()V
    //   63: aload_0
    //   64: monitorexit
    //   65: return
    //   66: astore 6
    //   68: aload_0
    //   69: monitorexit
    //   70: aload 6
    //   72: athrow
    //   73: astore_1
    //   74: aload_0
    //   75: monitorexit
    //   76: aload_1
    //   77: athrow
    //   78: astore 4
    //   80: aload_0
    //   81: monitorenter
    //   82: aload_0
    //   83: iconst_0
    //   84: putfield 20	android/support/v4/os/CancellationSignal:mCancelInProgress	Z
    //   87: aload_0
    //   88: invokevirtual 43	java/lang/Object:notifyAll	()V
    //   91: aload_0
    //   92: monitorexit
    //   93: aload 4
    //   95: athrow
    //   96: astore 5
    //   98: aload_0
    //   99: monitorexit
    //   100: aload 5
    //   102: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	103	0	this	CancellationSignal
    //   73	4	1	localObject1	Object
    //   26	13	2	localOnCancelListener	OnCancelListener
    //   31	18	3	localObject2	Object
    //   78	16	4	localObject3	Object
    //   96	5	5	localObject4	Object
    //   66	5	6	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   54	65	66	finally
    //   68	70	66	finally
    //   2	11	73	finally
    //   12	34	73	finally
    //   74	76	73	finally
    //   38	44	78	finally
    //   48	52	78	finally
    //   82	93	96	finally
    //   98	100	96	finally
  }
  
  public Object getCancellationSignalObject()
  {
    if (Build.VERSION.SDK_INT < 16) {
      return null;
    }
    try
    {
      if (this.mCancellationSignalObj == null)
      {
        this.mCancellationSignalObj = CancellationSignalCompatJellybean.create();
        if (this.mIsCanceled) {
          CancellationSignalCompatJellybean.cancel(this.mCancellationSignalObj);
        }
      }
      Object localObject2 = this.mCancellationSignalObj;
      return localObject2;
    }
    finally {}
  }
  
  public boolean isCanceled()
  {
    try
    {
      boolean bool = this.mIsCanceled;
      return bool;
    }
    finally {}
  }
  
  public void setOnCancelListener(OnCancelListener paramOnCancelListener)
  {
    try
    {
      waitForCancelFinishedLocked();
      if (this.mOnCancelListener == paramOnCancelListener) {
        return;
      }
      this.mOnCancelListener = paramOnCancelListener;
      if ((!this.mIsCanceled) || (paramOnCancelListener == null)) {
        return;
      }
    }
    finally {}
    paramOnCancelListener.onCancel();
  }
  
  public void throwIfCanceled()
  {
    if (isCanceled()) {
      throw new OperationCanceledException();
    }
  }
  
  public static abstract interface OnCancelListener
  {
    public abstract void onCancel();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/os/CancellationSignal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */