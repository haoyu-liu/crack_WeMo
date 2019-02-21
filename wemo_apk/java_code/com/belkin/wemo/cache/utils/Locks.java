package com.belkin.wemo.cache.utils;

import java.util.ArrayList;

public class Locks
{
  public static final Integer LOCK_GET_DEVICE_LIST = Integer.valueOf(1);
  public static final Integer LOCK_GET_DEVICE_LIST_SYNC = Integer.valueOf(2);
  public static final Integer LOCK_REMOTE_ACCESS_ENABLE = Integer.valueOf(0);
  public static final Integer LOCK_UNICAST_DISOCVERY = Integer.valueOf(3);
  private static Locks ourInstance = new Locks();
  private ArrayList<Integer> locksArray = null;
  
  public static Locks getInstance()
  {
    return ourInstance;
  }
  
  /* Error */
  public boolean isLocked(Integer paramInteger)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 38	com/belkin/wemo/cache/utils/Locks:locksArray	Ljava/util/ArrayList;
    //   6: aload_1
    //   7: invokevirtual 49	java/util/ArrayList:contains	(Ljava/lang/Object;)Z
    //   10: istore_3
    //   11: iload_3
    //   12: ifeq +11 -> 23
    //   15: iconst_1
    //   16: istore 4
    //   18: aload_0
    //   19: monitorexit
    //   20: iload 4
    //   22: ireturn
    //   23: iconst_0
    //   24: istore 4
    //   26: goto -8 -> 18
    //   29: astore_2
    //   30: aload_0
    //   31: monitorexit
    //   32: aload_2
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	this	Locks
    //   0	34	1	paramInteger	Integer
    //   29	4	2	localObject	Object
    //   10	2	3	bool1	boolean
    //   16	9	4	bool2	boolean
    // Exception table:
    //   from	to	target	type
    //   2	11	29	finally
  }
  
  public void setLock(Integer paramInteger)
  {
    try
    {
      this.locksArray.add(paramInteger);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void unsetLock(Integer paramInteger)
  {
    try
    {
      this.locksArray.remove(paramInteger);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/Locks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */