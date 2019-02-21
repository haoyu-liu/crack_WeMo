package org.apache.commons.io.filefilter;

import java.io.File;

public abstract class AbstractFileFilter
  implements IOFileFilter
{
  public boolean accept(File paramFile)
  {
    return accept(paramFile.getParentFile(), paramFile.getName());
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return accept(new File(paramFile, paramString));
  }
  
  public String toString()
  {
    return getClass().getSimpleName();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/AbstractFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */