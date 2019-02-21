package org.cybergarage.upnp.xml;

import org.cybergarage.upnp.control.QueryListener;
import org.cybergarage.upnp.control.QueryResponse;

public class StateVariableData
  extends NodeData
{
  private QueryListener queryListener = null;
  private QueryResponse queryRes = null;
  private String value = "";
  
  public QueryListener getQueryListener()
  {
    return this.queryListener;
  }
  
  public QueryResponse getQueryResponse()
  {
    return this.queryRes;
  }
  
  public String getValue()
  {
    return this.value;
  }
  
  public void setQueryListener(QueryListener paramQueryListener)
  {
    this.queryListener = paramQueryListener;
  }
  
  public void setQueryResponse(QueryResponse paramQueryResponse)
  {
    this.queryRes = paramQueryResponse;
  }
  
  public void setValue(String paramString)
  {
    this.value = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/xml/StateVariableData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */