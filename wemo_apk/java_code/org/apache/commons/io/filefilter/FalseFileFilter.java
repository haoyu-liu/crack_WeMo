package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class FalseFileFilter
  implements IOFileFilter, Serializable
{
  public static final IOFileFilter FALSE = new FalseFileFilter();
  public static final IOFileFilter INSTANCE = FALSE;
  
  public boolean accept(File paramFile)
  {
    return false;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/FalseFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */