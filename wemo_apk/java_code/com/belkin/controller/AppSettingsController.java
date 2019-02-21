package com.belkin.controller;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.cloud.CloudRequestForSalesforce;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import org.json.JSONArray;
import org.json.JSONObject;

public class AppSettingsController
{
  public static final String TAG = "AppSettingsController";
  private static AppSettingsController appSettingsController = null;
  private Context mContext = null;
  
  private AppSettingsController(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public static AppSettingsController getInstance(Context paramContext)
  {
    try
    {
      if (appSettingsController == null) {
        appSettingsController = new AppSettingsController(paramContext);
      }
      AppSettingsController localAppSettingsController = appSettingsController;
      return localAppSettingsController;
    }
    finally {}
  }
  
  public String reportAProblem(JSONArray paramJSONArray)
  {
    try
    {
      LogUtils.infoLog("AppSettingsController", "In AppSettingsController: inParamArray: " + paramJSONArray.toString());
      CloudRequestForSalesforce localCloudRequestForSalesforce = new CloudRequestForSalesforce(paramJSONArray);
      String[] arrayOfString = new CloudRequestManager(this.mContext).makeMultiPartRequest(localCloudRequestForSalesforce);
      if ((arrayOfString != null) && (arrayOfString.length > 0))
      {
        LogUtils.infoLog("AppSettingsController", "In AppSettingsController: result: statusCode: " + arrayOfString[0] + " response: " + arrayOfString[1]);
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("statusCode", arrayOfString[0]);
        localJSONObject.put("response", arrayOfString[1]);
        String str = localJSONObject.toString();
        return str;
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("AppSettingsController", "Caught an Exception in AppSettingsController: reportAProblem: ", localException);
    }
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/AppSettingsController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */