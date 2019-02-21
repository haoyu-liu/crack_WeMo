package com.belkin.wemo;

import android.content.Context;
import com.belkin.utils.RuleUtility;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;

public class Permissions
  implements PermListner
{
  private static Permissions permissions;
  private CallbackContext mCallbackContext;
  private Context mContext = null;
  private PermissionListners permissionListners;
  private RuleUtility ruleUtility;
  
  private Permissions(Context paramContext)
  {
    this.mContext = paramContext;
    this.ruleUtility = new RuleUtility(paramContext);
  }
  
  public static Permissions getInstance(Context paramContext)
  {
    if (permissions == null) {
      permissions = new Permissions(paramContext);
    }
    return permissions;
  }
  
  public boolean checkLocationPermission()
  {
    try
    {
      if (this.permissionListners != null)
      {
        boolean bool = this.permissionListners.locationPermissionCheck();
        return bool;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public void fetchPermission(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
    if (this.permissionListners != null)
    {
      this.permissionListners.onPermissionCheck(permissions);
      return;
    }
    paramCallbackContext.error("No Permission Listner present");
  }
  
  public void onPermDenied()
  {
    this.mCallbackContext.error("Location Permission Denied");
  }
  
  public void onPermGranted()
  {
    try
    {
      JSONArray localJSONArray = this.ruleUtility.getLocationDetails(this.mContext);
      if ((localJSONArray != null) && (localJSONArray.length() > 0))
      {
        this.mCallbackContext.success(localJSONArray);
        return;
      }
      this.mCallbackContext.error("Location Permission Denied");
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public void setLocationRequestListener(PermissionListners paramPermissionListners)
  {
    this.permissionListners = paramPermissionListners;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/Permissions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */