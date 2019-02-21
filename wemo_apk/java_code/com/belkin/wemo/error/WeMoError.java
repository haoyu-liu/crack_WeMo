package com.belkin.wemo.error;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class WeMoError
{
  public static final String ERROR_CODE = "ERROR_CODE";
  public static final String ERROR_MSG = "ERROR_MSG";
  private static final String TAG = WeMoError.class.getSimpleName();
  protected int errorCode;
  protected String errorMessage;
  
  public WeMoError()
  {
    this.errorMessage = new String();
  }
  
  public WeMoError(int paramInt, String paramString)
  {
    this.errorCode = paramInt;
    setErrorMessage(paramString);
  }
  
  public int getErrorCode()
  {
    return this.errorCode;
  }
  
  public String getErrorMessage()
  {
    return this.errorMessage;
  }
  
  public void setErrorCode(int paramInt)
  {
    this.errorCode = paramInt;
  }
  
  public void setErrorMessage(String paramString)
  {
    if (paramString == null) {
      paramString = new String();
    }
    this.errorMessage = paramString;
  }
  
  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("ERROR_CODE", this.errorCode);
      localJSONObject.put("ERROR_MSG", this.errorMessage);
      SDKLogUtils.errorLog(TAG, "Error JSON = " + localJSONObject.toString());
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "JSONException while creating JSONObject from WeMoError: ", localJSONException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/error/WeMoError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */