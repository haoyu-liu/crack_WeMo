package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.json.JSONArray;
import org.json.JSONException;

public class CloudRequestForSalesforce
  implements CloudRequestInterfaceForMultipart
{
  private final String TAG = "SDK_CloudRequestForSalesforce";
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/analytic/support/reportAProblem";
  private String[] finalResponse = new String[2];
  private String[] formKeys = new String[8];
  private String[] formValues = new String[8];
  
  public CloudRequestForSalesforce(JSONArray paramJSONArray)
  {
    SDKLogUtils.infoLog("SDK_CloudRequestForSalesforce", "In CloudRequestForSalesforce: Constructor");
    int i = 0;
    for (;;)
    {
      if (i < paramJSONArray.length()) {
        try
        {
          this.formValues[i] = paramJSONArray.getString(i);
          i++;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
      }
    }
    this.formKeys[0] = "firstName";
    this.formKeys[1] = "lastName";
    this.formKeys[2] = "email";
    this.formKeys[3] = "phone";
    this.formKeys[4] = "product";
    this.formKeys[5] = "problemCode";
    this.formKeys[6] = "caseSubject";
    this.formKeys[7] = "caseNotes";
  }
  
  public String[] getFormKeys()
  {
    return this.formKeys;
  }
  
  public String[] getFormValues()
  {
    return this.formValues;
  }
  
  public boolean getRequestMethod()
  {
    return true;
  }
  
  public String getURL()
  {
    SDKLogUtils.infoLog("SDK_CloudRequestForSalesforce", " requestURL: " + this.URL);
    return this.URL;
  }
  
  public String[] requestComplete(int paramInt, String paramString)
  {
    SDKLogUtils.infoLog("SDK_CloudRequestForSalesforce", "In CloudRequestForSalesforce: requestComplete status: " + paramInt + " response: " + paramString);
    this.finalResponse[0] = Integer.toString(paramInt);
    this.finalResponse[1] = paramString;
    return this.finalResponse;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForSalesforce.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */