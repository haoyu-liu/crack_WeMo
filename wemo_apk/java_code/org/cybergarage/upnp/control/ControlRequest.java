package org.cybergarage.upnp.control;

import java.net.MalformedURLException;
import java.net.URL;
import org.cybergarage.http.HTTP;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.soap.SOAPRequest;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.Service;

public class ControlRequest
  extends SOAPRequest
{
  public ControlRequest() {}
  
  public ControlRequest(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
  }
  
  public boolean isActionControl()
  {
    return !isQueryControl();
  }
  
  public boolean isQueryControl()
  {
    return isSOAPAction("urn:schemas-upnp-org:control-1-0#QueryStateVariable");
  }
  
  protected void setRequestHost(Service paramService)
  {
    Object localObject1 = paramService.getControlURL();
    String str1 = paramService.getRootDevice().getURLBase();
    if ((str1 != null) && (str1.length() > 0)) {}
    try
    {
      String str3 = new URL(str1).getPath();
      int j = str3.length();
      if ((j > 0) && ((1 < j) || (str3.charAt(0) != '/')))
      {
        String str4 = str3 + (String)localObject1;
        localObject1 = str4;
      }
    }
    catch (MalformedURLException localMalformedURLException)
    {
      Object localObject2;
      String str2;
      int i;
      for (;;) {}
    }
    setURI((String)localObject1, true);
    localObject2 = "";
    if (HTTP.isAbsoluteURL((String)localObject1) == true) {
      localObject2 = localObject1;
    }
    if ((localObject2 == null) || (((String)localObject2).length() <= 0)) {
      localObject2 = paramService.getRootDevice().getURLBase();
    }
    if ((localObject2 == null) || (((String)localObject2).length() <= 0)) {
      localObject2 = paramService.getRootDevice().getLocation();
    }
    str2 = HTTP.getHost((String)localObject2);
    i = HTTP.getPort((String)localObject2);
    setHost(str2, i);
    setRequestHost(str2);
    setRequestPort(i);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/ControlRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */