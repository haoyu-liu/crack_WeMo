package org.apache.commons.io;

import java.io.File;
import java.lang.ref.PhantomReference;
import java.lang.ref.ReferenceQueue;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

public class FileCleaningTracker
{
  final List<String> deleteFailures = Collections.synchronizedList(new ArrayList());
  volatile boolean exitWhenFinished = false;
  ReferenceQueue<Object> q = new ReferenceQueue();
  Thread reaper;
  final Collection<Tracker> trackers = Collections.synchronizedSet(new HashSet());
  
  private void addTracker(String paramString, Object paramObject, FileDeleteStrategy paramFileDeleteStrategy)
  {
    try
    {
      if (this.exitWhenFinished) {
        throw new IllegalStateException("No new trackers can be added once exitWhenFinished() is called");
      }
    }
    finally {}
    if (this.reaper == null)
    {
      this.reaper = new Reaper();
      this.reaper.start();
    }
    this.trackers.add(new Tracker(paramString, paramFileDeleteStrategy, paramObject, this.q));
  }
  
  /* Error */
  public void exitWhenFinished()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iconst_1
    //   4: putfield 48	org/apache/commons/io/FileCleaningTracker:exitWhenFinished	Z
    //   7: aload_0
    //   8: getfield 59	org/apache/commons/io/FileCleaningTracker:reaper	Ljava/lang/Thread;
    //   11: ifnull +19 -> 30
    //   14: aload_0
    //   15: getfield 59	org/apache/commons/io/FileCleaningTracker:reaper	Ljava/lang/Thread;
    //   18: astore_2
    //   19: aload_2
    //   20: monitorenter
    //   21: aload_0
    //   22: getfield 59	org/apache/commons/io/FileCleaningTracker:reaper	Ljava/lang/Thread;
    //   25: invokevirtual 83	java/lang/Thread:interrupt	()V
    //   28: aload_2
    //   29: monitorexit
    //   30: aload_0
    //   31: monitorexit
    //   32: return
    //   33: astore_3
    //   34: aload_2
    //   35: monitorexit
    //   36: aload_3
    //   37: athrow
    //   38: astore_1
    //   39: aload_0
    //   40: monitorexit
    //   41: aload_1
    //   42: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	43	0	this	FileCleaningTracker
    //   38	4	1	localObject1	Object
    //   33	4	3	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   21	30	33	finally
    //   34	36	33	finally
    //   2	21	38	finally
    //   36	38	38	finally
  }
  
  public List<String> getDeleteFailures()
  {
    return this.deleteFailures;
  }
  
  public int getTrackCount()
  {
    return this.trackers.size();
  }
  
  public void track(File paramFile, Object paramObject)
  {
    track(paramFile, paramObject, (FileDeleteStrategy)null);
  }
  
  public void track(File paramFile, Object paramObject, FileDeleteStrategy paramFileDeleteStrategy)
  {
    if (paramFile == null) {
      throw new NullPointerException("The file must not be null");
    }
    addTracker(paramFile.getPath(), paramObject, paramFileDeleteStrategy);
  }
  
  public void track(String paramString, Object paramObject)
  {
    track(paramString, paramObject, (FileDeleteStrategy)null);
  }
  
  public void track(String paramString, Object paramObject, FileDeleteStrategy paramFileDeleteStrategy)
  {
    if (paramString == null) {
      throw new NullPointerException("The path must not be null");
    }
    addTracker(paramString, paramObject, paramFileDeleteStrategy);
  }
  
  private final class Reaper
    extends Thread
  {
    Reaper()
    {
      super();
      setPriority(10);
      setDaemon(true);
    }
    
    public void run()
    {
      while ((!FileCleaningTracker.this.exitWhenFinished) || (FileCleaningTracker.this.trackers.size() > 0)) {
        try
        {
          FileCleaningTracker.Tracker localTracker = (FileCleaningTracker.Tracker)FileCleaningTracker.this.q.remove();
          FileCleaningTracker.this.trackers.remove(localTracker);
          if (!localTracker.delete()) {
            FileCleaningTracker.this.deleteFailures.add(localTracker.getPath());
          }
          localTracker.clear();
        }
        catch (InterruptedException localInterruptedException) {}
      }
    }
  }
  
  private static final class Tracker
    extends PhantomReference<Object>
  {
    private final FileDeleteStrategy deleteStrategy;
    private final String path;
    
    Tracker(String paramString, FileDeleteStrategy paramFileDeleteStrategy, Object paramObject, ReferenceQueue<? super Object> paramReferenceQueue)
    {
      super(paramReferenceQueue);
      this.path = paramString;
      if (paramFileDeleteStrategy == null) {
        paramFileDeleteStrategy = FileDeleteStrategy.NORMAL;
      }
      this.deleteStrategy = paramFileDeleteStrategy;
    }
    
    public boolean delete()
    {
      return this.deleteStrategy.deleteQuietly(new File(this.path));
    }
    
    public String getPath()
    {
      return this.path;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FileCleaningTracker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */