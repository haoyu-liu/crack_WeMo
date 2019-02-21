package org.apache.cordova;

import android.util.Log;
import java.security.SecureRandom;
import org.json.JSONArray;
import org.json.JSONException;

public class CordovaBridge
{
  private static final String LOG_TAG = "CordovaBridge";
  private volatile int expectedBridgeSecret = -1;
  private NativeToJsMessageQueue jsMessageQueue;
  private PluginManager pluginManager;
  
  public CordovaBridge(PluginManager paramPluginManager, NativeToJsMessageQueue paramNativeToJsMessageQueue)
  {
    this.pluginManager = paramPluginManager;
    this.jsMessageQueue = paramNativeToJsMessageQueue;
  }
  
  private boolean verifySecret(String paramString, int paramInt)
    throws IllegalAccessException
  {
    if (!this.jsMessageQueue.isBridgeEnabled())
    {
      if (paramInt == -1) {
        Log.d("CordovaBridge", paramString + " call made before bridge was enabled.");
      }
      for (;;)
      {
        return false;
        Log.d("CordovaBridge", "Ignoring " + paramString + " from previous page load.");
      }
    }
    if ((this.expectedBridgeSecret < 0) || (paramInt != this.expectedBridgeSecret))
    {
      Log.e("CordovaBridge", "Bridge access attempt with wrong secret token, possibly from malicious code. Disabling exec() bridge!");
      clearBridgeSecret();
      throw new IllegalAccessException();
    }
    return true;
  }
  
  void clearBridgeSecret()
  {
    this.expectedBridgeSecret = -1;
  }
  
  int generateBridgeSecret()
  {
    this.expectedBridgeSecret = new SecureRandom().nextInt(Integer.MAX_VALUE);
    return this.expectedBridgeSecret;
  }
  
  public boolean isSecretEstablished()
  {
    return this.expectedBridgeSecret != -1;
  }
  
  public String jsExec(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4)
    throws JSONException, IllegalAccessException
  {
    if (!verifySecret("exec()", paramInt)) {
      return null;
    }
    if (paramString4 == null) {
      return "@Null arguments.";
    }
    this.jsMessageQueue.setPaused(true);
    try
    {
      CordovaResourceApi.jsThread = Thread.currentThread();
      this.pluginManager.exec(paramString1, paramString2, paramString3, paramString4);
      String str = this.jsMessageQueue.popAndEncode(false);
      return str;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      return "";
    }
    finally
    {
      this.jsMessageQueue.setPaused(false);
    }
  }
  
  public String jsRetrieveJsMessages(int paramInt, boolean paramBoolean)
    throws IllegalAccessException
  {
    if (!verifySecret("retrieveJsMessages()", paramInt)) {
      return null;
    }
    return this.jsMessageQueue.popAndEncode(paramBoolean);
  }
  
  public void jsSetNativeToJsBridgeMode(int paramInt1, int paramInt2)
    throws IllegalAccessException
  {
    if (!verifySecret("setNativeToJsBridgeMode()", paramInt1)) {
      return;
    }
    this.jsMessageQueue.setBridgeMode(paramInt2);
  }
  
  public String promptOnJsPrompt(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString3 != null) && (paramString3.length() > 3) && (paramString3.startsWith("gap:"))) {}
    for (;;)
    {
      String str;
      try
      {
        JSONArray localJSONArray = new JSONArray(paramString3.substring(4));
        str = jsExec(localJSONArray.getInt(0), localJSONArray.getString(1), localJSONArray.getString(2), localJSONArray.getString(3), paramString2);
        if (str == null) {
          str = "";
        }
        return str;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return "";
      }
      catch (IllegalAccessException localIllegalAccessException3)
      {
        localIllegalAccessException3.printStackTrace();
        continue;
      }
      if ((paramString3 != null) && (paramString3.startsWith("gap_bridge_mode:"))) {
        try
        {
          jsSetNativeToJsBridgeMode(Integer.parseInt(paramString3.substring(16)), Integer.parseInt(paramString2));
          return "";
        }
        catch (NumberFormatException localNumberFormatException)
        {
          for (;;)
          {
            localNumberFormatException.printStackTrace();
          }
        }
        catch (IllegalAccessException localIllegalAccessException2)
        {
          for (;;)
          {
            localIllegalAccessException2.printStackTrace();
          }
        }
      }
      if ((paramString3 != null) && (paramString3.startsWith("gap_poll:")))
      {
        int k = Integer.parseInt(paramString3.substring(9));
        try
        {
          str = jsRetrieveJsMessages(k, "1".equals(paramString2));
          if (str == null) {
            return "";
          }
        }
        catch (IllegalAccessException localIllegalAccessException1)
        {
          localIllegalAccessException1.printStackTrace();
          return "";
        }
      }
    }
    if ((paramString3 != null) && (paramString3.startsWith("gap_init:")))
    {
      if (this.pluginManager.shouldAllowBridgeAccess(paramString1))
      {
        int i = Integer.parseInt(paramString3.substring(9));
        this.jsMessageQueue.setBridgeMode(i);
        int j = generateBridgeSecret();
        return "" + j;
      }
      Log.e("CordovaBridge", "gap_init called from restricted origin: " + paramString1);
      return "";
    }
    return null;
  }
  
  public void reset()
  {
    this.jsMessageQueue.reset();
    clearBridgeSecret();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/CordovaBridge.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */