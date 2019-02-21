package org.cybergarage.upnp.device;

import java.io.File;

public class InvalidDescriptionException
  extends Exception
{
  public InvalidDescriptionException() {}
  
  public InvalidDescriptionException(Exception paramException)
  {
    super(paramException.getMessage());
  }
  
  public InvalidDescriptionException(String paramString)
  {
    super(paramString);
  }
  
  public InvalidDescriptionException(String paramString, File paramFile)
  {
    super(paramString + " (" + paramFile.toString() + ")");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/InvalidDescriptionException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */