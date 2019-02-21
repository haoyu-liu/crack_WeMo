package org.apache.http;

@Deprecated
public abstract interface Header
{
  public abstract HeaderElement[] getElements()
    throws ParseException;
  
  public abstract String getName();
  
  public abstract String getValue();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/Header.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */