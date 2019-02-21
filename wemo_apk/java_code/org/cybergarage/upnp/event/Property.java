package org.cybergarage.upnp.event;

public class Property
{
  private String name = "";
  private String value = "";
  
  public String getName()
  {
    return this.name;
  }
  
  public String getValue()
  {
    return this.value;
  }
  
  public void setName(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.name = paramString;
  }
  
  public void setValue(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.value = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/Property.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */