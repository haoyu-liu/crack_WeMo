package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class EmptyFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  public static final IOFileFilter EMPTY = new EmptyFileFilter();
  public static final IOFileFilter NOT_EMPTY = new NotFileFilter(EMPTY);
  
  public boolean accept(File paramFile)
  {
    boolean bool1 = true;
    if (paramFile.isDirectory())
    {
      File[] arrayOfFile = paramFile.listFiles();
      boolean bool2;
      if (arrayOfFile != null)
      {
        int i = arrayOfFile.length;
        bool2 = false;
        if (i != 0) {}
      }
      else
      {
        bool2 = bool1;
      }
      return bool2;
    }
    if (paramFile.length() == 0L) {}
    for (;;)
    {
      return bool1;
      bool1 = false;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/EmptyFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */