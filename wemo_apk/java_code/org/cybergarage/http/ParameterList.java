package org.cybergarage.http;

import java.util.Vector;

public class ParameterList
  extends Vector
{
  public Parameter at(int paramInt)
  {
    return (Parameter)get(paramInt);
  }
  
  public Parameter getParameter(int paramInt)
  {
    return (Parameter)get(paramInt);
  }
  
  public Parameter getParameter(String paramString)
  {
    Parameter localParameter;
    if (paramString == null)
    {
      localParameter = null;
      return localParameter;
    }
    int i = size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        break label47;
      }
      localParameter = at(j);
      if (paramString.compareTo(localParameter.getName()) == 0) {
        break;
      }
    }
    label47:
    return null;
  }
  
  public String getValue(String paramString)
  {
    Parameter localParameter = getParameter(paramString);
    if (localParameter == null) {
      return "";
    }
    return localParameter.getValue();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/ParameterList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */