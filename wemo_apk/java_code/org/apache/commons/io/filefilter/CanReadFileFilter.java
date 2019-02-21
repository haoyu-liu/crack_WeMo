package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class CanReadFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  public static final IOFileFilter CANNOT_READ = new NotFileFilter(CAN_READ);
  public static final IOFileFilter CAN_READ = new CanReadFileFilter();
  public static final IOFileFilter READ_ONLY = new AndFileFilter(CAN_READ, CanWriteFileFilter.CANNOT_WRITE);
  
  public boolean accept(File paramFile)
  {
    return paramFile.canRead();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/CanReadFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */