package com.belkin.wemo.rules.device.runnable;

import android.text.TextUtils;
import com.belkin.cybergarage.wrapper.ControlActionHandler;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionErrorCallback;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionSuccessCallback;
import com.belkin.rules.beans.RulesDBPathResponseBean;
import com.belkin.rules.beans.RulesDBVersionResponseBean;
import com.belkin.upnp.parser.Parser;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.concurrent.atomic.AtomicInteger;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class FetchDeviceRulesNoFetchSupportRunnable
  extends WeMoRunnable
{
  public static final int TOTAL_FETCH_RULES_CALLBACKS_COUNT = 2;
  private FetchDeviceRulesCallback callback;
  private AtomicInteger callbackCount;
  private String dbPathXMLStr;
  private String dbVersionXMLStr;
  private Device device;
  
  public FetchDeviceRulesNoFetchSupportRunnable(FetchDeviceRulesCallback paramFetchDeviceRulesCallback, Device paramDevice)
  {
    this.device = paramDevice;
    this.callback = paramFetchDeviceRulesCallback;
    this.callbackCount = new AtomicInteger();
  }
  
  private String getDBPath(Parser paramParser, String paramString)
  {
    RulesDBPathResponseBean localRulesDBPathResponseBean = new RulesDBPathResponseBean();
    paramParser.uPnPResponseParser(localRulesDBPathResponseBean, 12, paramString);
    return localRulesDBPathResponseBean.getStrRulesDBPath();
  }
  
  private int getDBVersion(Parser paramParser, String paramString)
    throws NumberFormatException
  {
    RulesDBVersionResponseBean localRulesDBVersionResponseBean = new RulesDBVersionResponseBean();
    paramParser.uPnPResponseParser(localRulesDBVersionResponseBean, 13, paramString);
    return Integer.valueOf(localRulesDBVersionResponseBean.getStrRulesDBVersion()).intValue();
  }
  
  private void onAllCallbacksCompleted()
  {
    String str = this.device.getUDN();
    Parser localParser;
    if (this.callback != null)
    {
      if ((!TextUtils.isEmpty(this.dbVersionXMLStr)) && (!this.dbVersionXMLStr.equals("app_error")) && (!TextUtils.isEmpty(this.dbPathXMLStr))) {
        localParser = new Parser();
      }
    }
    else {
      try
      {
        this.callback.onSuccess(getDBVersion(localParser, this.dbVersionXMLStr), getDBPath(localParser, this.dbPathXMLStr), this.device.getUDN());
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        LogUtils.errorLog(this.TAG, "NumberFormatException in Device FETCH RULES with No Fetch Support: ", localNumberFormatException);
        this.callback.onError(new RuleDeviceError(-1, localNumberFormatException.getMessage(), str));
        return;
      }
    }
    this.callback.onError(new RuleDeviceError(str));
  }
  
  public void run()
  {
    Action localAction1 = this.device.getAction("GetRulesDBPath");
    Object localObject1;
    Action localAction2;
    if (this.callback == null)
    {
      localObject1 = null;
      ControlActionHandler.newInstance().postControlAction(localAction1, 15000, 4000, (ControlActionHandler.ControlActionErrorCallback)localObject1, (ControlActionHandler.ControlActionSuccessCallback)localObject1);
      localAction2 = this.device.getAction("GetRulesDBVersion");
      if (this.callback != null) {
        break label85;
      }
    }
    label85:
    for (Object localObject2 = null;; localObject2 = new GetDBVersionActionCallback(null))
    {
      ControlActionHandler.newInstance().postControlAction(localAction2, 15000, 4000, (ControlActionHandler.ControlActionErrorCallback)localObject2, (ControlActionHandler.ControlActionSuccessCallback)localObject2);
      return;
      localObject1 = new GetDBPathActionCallback(null);
      break;
    }
  }
  
  private class GetDBPathActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private GetDBPathActionCallback() {}
    
    public void onActionError(Exception paramException)
    {
      onCallbackReveived();
    }
    
    public void onActionSuccess(String paramString)
    {
      FetchDeviceRulesNoFetchSupportRunnable.access$202(FetchDeviceRulesNoFetchSupportRunnable.this, paramString);
      onCallbackReveived();
    }
    
    protected void onCallbackReveived()
    {
      if (FetchDeviceRulesNoFetchSupportRunnable.this.callbackCount.incrementAndGet() == 2) {
        FetchDeviceRulesNoFetchSupportRunnable.this.onAllCallbacksCompleted();
      }
    }
  }
  
  private class GetDBVersionActionCallback
    extends FetchDeviceRulesNoFetchSupportRunnable.GetDBPathActionCallback
  {
    private GetDBVersionActionCallback()
    {
      super(null);
    }
    
    public void onActionSuccess(String paramString)
    {
      FetchDeviceRulesNoFetchSupportRunnable.access$502(FetchDeviceRulesNoFetchSupportRunnable.this, paramString);
      onCallbackReveived();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */