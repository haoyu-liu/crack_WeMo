package com.belkin.wemo.cache.remoteaccess;

public class RemoteAccessResponseBean
{
  private String homeId = null;
  private String privateKeyphone = null;
  private String privateKeyplugin = null;
  private String statusCode = null;
  
  public String getHomeId()
  {
    return this.homeId;
  }
  
  public String getPrivateKeyphone()
  {
    return this.privateKeyphone;
  }
  
  public String getPrivateKeyplugin()
  {
    return this.privateKeyplugin;
  }
  
  public String getStatusCode()
  {
    return this.statusCode;
  }
  
  public void setHomeId(String paramString)
  {
    this.homeId = paramString;
  }
  
  public void setPrivateKeyphone(String paramString)
  {
    this.privateKeyphone = paramString;
  }
  
  public void setPrivateKeyplugin(String paramString)
  {
    this.privateKeyplugin = paramString;
  }
  
  public void setStatusCode(String paramString)
  {
    this.statusCode = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/remoteaccess/RemoteAccessResponseBean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */