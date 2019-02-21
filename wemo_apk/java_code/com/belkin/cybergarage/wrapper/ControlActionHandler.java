package com.belkin.cybergarage.wrapper;

import android.text.TextUtils;
import com.belkin.exception.WemoException;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.cybergarage.upnp.Action;

public class ControlActionHandler
{
  public static final String TAG = "ControlActionHandler";
  
  public static ControlActionHandler newInstance()
  {
    return new ControlActionHandler();
  }
  
  public void postControlAction(Action paramAction, int paramInt1, int paramInt2, ControlActionErrorCallback paramControlActionErrorCallback, ControlActionSuccessCallback paramControlActionSuccessCallback)
  {
    try
    {
      postControlAction(paramAction, paramInt1, paramInt2, paramControlActionErrorCallback, paramControlActionSuccessCallback, null);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void postControlAction(Action paramAction, int paramInt1, int paramInt2, ControlActionErrorCallback paramControlActionErrorCallback, ControlActionSuccessCallback paramControlActionSuccessCallback, HashMap<String, String> paramHashMap)
  {
    if (paramAction != null) {
      if (paramHashMap != null) {
        try
        {
          Iterator localIterator = paramHashMap.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            paramAction.setArgumentValue((String)localEntry.getKey(), (String)localEntry.getValue());
          }
          try
          {
            str = paramAction.postControlAction(paramInt1, paramInt2);
            LogUtils.debugLog("ControlActionHandler", "XML response received after posting uPnP action: " + str);
            if (TextUtils.isEmpty(str)) {
              if (paramControlActionErrorCallback != null) {
                paramControlActionErrorCallback.onActionError(new WemoException("Socket connection error while trying to post uPnP Action."));
              }
            }
          }
          catch (Exception localException)
          {
            for (;;)
            {
              LogUtils.errorLog("ControlActionHandler", "Exception while posting control action: ", localException);
              if ((paramControlActionErrorCallback != null) && (localException != null)) {
                paramControlActionErrorCallback.onActionError(localException);
              }
            }
          }
        }
        finally {}
      }
    }
    for (;;)
    {
      String str;
      return;
      if (paramControlActionSuccessCallback != null)
      {
        paramControlActionSuccessCallback.onActionSuccess(str);
        continue;
        if (paramControlActionErrorCallback != null) {
          paramControlActionErrorCallback.onActionError(new InvalidArgumentsException("ACTION is invalid!"));
        }
      }
    }
  }
  
  public void postControlAction(Action paramAction, ControlActionErrorCallback paramControlActionErrorCallback, ControlActionSuccessCallback paramControlActionSuccessCallback)
  {
    try
    {
      postControlAction(paramAction, 180000, 30000, paramControlActionErrorCallback, paramControlActionSuccessCallback, null);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static abstract interface ControlActionErrorCallback
  {
    public abstract void onActionError(Exception paramException);
  }
  
  public static abstract interface ControlActionSuccessCallback
  {
    public abstract void onActionSuccess(String paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cybergarage/wrapper/ControlActionHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */