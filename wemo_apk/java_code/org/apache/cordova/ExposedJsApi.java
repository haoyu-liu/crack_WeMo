package org.apache.cordova;

import org.json.JSONException;

public abstract interface ExposedJsApi
{
  public abstract String exec(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4)
    throws JSONException, IllegalAccessException;
  
  public abstract String retrieveJsMessages(int paramInt, boolean paramBoolean)
    throws IllegalAccessException;
  
  public abstract void setNativeToJsBridgeMode(int paramInt1, int paramInt2)
    throws IllegalAccessException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/ExposedJsApi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */