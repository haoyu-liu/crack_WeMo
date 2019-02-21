package org.apache.commons.io;

import java.io.File;
import java.io.IOException;

public class FileDeleteStrategy
{
  public static final FileDeleteStrategy FORCE = new ForceFileDeleteStrategy();
  public static final FileDeleteStrategy NORMAL = new FileDeleteStrategy("Normal");
  private final String name;
  
  protected FileDeleteStrategy(String paramString)
  {
    this.name = paramString;
  }
  
  public void delete(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!doDelete(paramFile))) {
      throw new IOException("Deletion failed: " + paramFile);
    }
  }
  
  public boolean deleteQuietly(File paramFile)
  {
    if ((paramFile == null) || (!paramFile.exists())) {
      return true;
    }
    try
    {
      boolean bool = doDelete(paramFile);
      return bool;
    }
    catch (IOException localIOException) {}
    return false;
  }
  
  protected boolean doDelete(File paramFile)
    throws IOException
  {
    return paramFile.delete();
  }
  
  public String toString()
  {
    return "FileDeleteStrategy[" + this.name + "]";
  }
  
  static class ForceFileDeleteStrategy
    extends FileDeleteStrategy
  {
    ForceFileDeleteStrategy()
    {
      super();
    }
    
    protected boolean doDelete(File paramFile)
      throws IOException
    {
      FileUtils.forceDelete(paramFile);
      return true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FileDeleteStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */