package org.cybergarage.upnp;

import java.util.Vector;

public class ArgumentList
  extends Vector
{
  public static final String ELEM_NAME = "argumentList";
  
  public Argument getArgument(int paramInt)
  {
    return (Argument)get(paramInt);
  }
  
  public Argument getArgument(String paramString)
  {
    int i = size();
    int j = 0;
    if (j < i)
    {
      Argument localArgument = getArgument(j);
      String str = localArgument.getName();
      if (str == null) {}
      while (str.equals(paramString) != true)
      {
        j++;
        break;
      }
      return localArgument;
    }
    return null;
  }
  
  public void set(ArgumentList paramArgumentList)
  {
    int i = paramArgumentList.size();
    int j = 0;
    if (j < i)
    {
      Argument localArgument1 = paramArgumentList.getArgument(j);
      Argument localArgument2 = getArgument(localArgument1.getName());
      if (localArgument2 == null) {}
      for (;;)
      {
        j++;
        break;
        localArgument2.setValue(localArgument1.getValue());
      }
    }
  }
  
  public void setReqArgs(ArgumentList paramArgumentList)
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      Argument localArgument1 = getArgument(j);
      if (localArgument1.isInDirection())
      {
        String str = localArgument1.getName();
        Argument localArgument2 = paramArgumentList.getArgument(str);
        if (localArgument2 == null) {
          throw new IllegalArgumentException("Argument \"" + str + "\" missing.");
        }
        localArgument1.setValue(localArgument2.getValue());
      }
    }
  }
  
  public void setResArgs(ArgumentList paramArgumentList)
  {
    int i = size();
    for (int j = 0; j < i; j++)
    {
      Argument localArgument1 = getArgument(j);
      if (localArgument1.isOutDirection())
      {
        String str = localArgument1.getName();
        Argument localArgument2 = paramArgumentList.getArgument(str);
        if (localArgument2 == null) {
          throw new IllegalArgumentException("Argument \"" + str + "\" missing.");
        }
        localArgument1.setValue(localArgument2.getValue());
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ArgumentList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */