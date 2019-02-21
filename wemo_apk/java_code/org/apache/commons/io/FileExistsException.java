package org.apache.commons.io;

import java.io.File;
import java.io.IOException;

public class FileExistsException
  extends IOException
{
  private static final long serialVersionUID = 1L;
  
  public FileExistsException() {}
  
  public FileExistsException(File paramFile)
  {
    super("File " + paramFile + " exists");
  }
  
  public FileExistsException(String paramString)
  {
    super(paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FileExistsException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */