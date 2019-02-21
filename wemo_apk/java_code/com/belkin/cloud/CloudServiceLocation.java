package com.belkin.cloud;

import android.content.Context;
import com.belkin.cloud.objects.CloudObjectLocation;

public class CloudServiceLocation
  extends CloudServiceBase
{
  private final String SERVICE_URL = "https://api.xbcs.net:8443/apis/http/plugin/geoInfo/cityLocations?cityName=";
  
  public CloudServiceLocation(Context paramContext)
  {
    super(paramContext);
  }
  
  public CloudObjectLocation makeRequest(String paramString)
  {
    CloudObjectLocation localCloudObjectLocation = new CloudObjectLocation();
    this.urlStr = ("https://api.xbcs.net:8443/apis/http/plugin/geoInfo/cityLocations?cityName=" + paramString);
    this.data = "";
    super.makeRequest();
    return localCloudObjectLocation;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cloud/CloudServiceLocation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */