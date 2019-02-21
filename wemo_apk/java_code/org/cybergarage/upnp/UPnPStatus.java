package org.cybergarage.upnp;

import org.cybergarage.http.HTTPStatus;

public class UPnPStatus
{
  public static final int ACTION_FAILED = 501;
  public static final int INVALID_ACTION = 401;
  public static final int INVALID_ARGS = 402;
  public static final int INVALID_VAR = 404;
  public static final int OUT_OF_SYNC = 403;
  public static final int PRECONDITION_FAILED = 412;
  private int code;
  private String description;
  
  public UPnPStatus()
  {
    setCode(0);
    setDescription("");
  }
  
  public UPnPStatus(int paramInt, String paramString)
  {
    setCode(paramInt);
    setDescription(paramString);
  }
  
  public static final String code2String(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return HTTPStatus.code2String(paramInt);
    case 401: 
      return "Invalid Action";
    case 402: 
      return "Invalid Args";
    case 403: 
      return "Out of Sync";
    case 404: 
      return "Invalid Var";
    case 412: 
      return "Precondition Failed";
    }
    return "Action Failed";
  }
  
  public int getCode()
  {
    return this.code;
  }
  
  public String getDescription()
  {
    return this.description;
  }
  
  public void setCode(int paramInt)
  {
    this.code = paramInt;
  }
  
  public void setDescription(String paramString)
  {
    this.description = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/UPnPStatus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */