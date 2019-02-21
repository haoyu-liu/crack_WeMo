package org.cybergarage.http;

public class Parameter
{
  private String name = new String();
  private String value = new String();
  
  public Parameter() {}
  
  public Parameter(String paramString1, String paramString2)
  {
    setName(paramString1);
    setValue(paramString2);
  }
  
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
    this.name = paramString;
  }
  
  public void setValue(String paramString)
  {
    this.value = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/Parameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */