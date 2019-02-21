package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class NotFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  private final IOFileFilter filter;
  
  public NotFileFilter(IOFileFilter paramIOFileFilter)
  {
    if (paramIOFileFilter == null) {
      throw new IllegalArgumentException("The filter must not be null");
    }
    this.filter = paramIOFileFilter;
  }
  
  public boolean accept(File paramFile)
  {
    return !this.filter.accept(paramFile);
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return !this.filter.accept(paramFile, paramString);
  }
  
  public String toString()
  {
    return super.toString() + "(" + this.filter.toString() + ")";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/NotFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */