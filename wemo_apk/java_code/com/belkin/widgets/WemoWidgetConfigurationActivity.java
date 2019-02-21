package com.belkin.widgets;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.belkin.controller.WidgetController;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import java.util.List;

public class WemoWidgetConfigurationActivity
  extends Activity
{
  private static final String TAG = WemoWidgetConfigurationActivity.class.getSimpleName();
  private WemoWidgetConfigurationAdapter adapter;
  private int appWidgetId;
  private ImageView cancelButton;
  private ListView devicesForWidgetListView;
  private ImageView nextButton;
  private TextView noDevicesTextView;
  
  private void toggleDeviceListForWidgetVisibility(boolean paramBoolean)
  {
    int i = 8;
    ListView localListView = this.devicesForWidgetListView;
    int j;
    TextView localTextView;
    if (paramBoolean)
    {
      j = 0;
      localListView.setVisibility(j);
      localTextView = this.noDevicesTextView;
      if (!paramBoolean) {
        break label44;
      }
    }
    for (;;)
    {
      localTextView.setVisibility(i);
      return;
      j = i;
      break;
      label44:
      i = 0;
    }
  }
  
  public WemoWidgetProvider getWidgetProvider()
  {
    Class localClass = WidgetUtil.getProviderClassForWidget(this, this.appWidgetId);
    try
    {
      WemoWidgetProvider localWemoWidgetProvider = (WemoWidgetProvider)localClass.newInstance();
      return localWemoWidgetProvider;
    }
    catch (InstantiationException localInstantiationException)
    {
      LogUtils.errorLog(TAG, "Unable to instantiate widget provider: " + localClass.getSimpleName());
      return new WemoOneByOneWidgetProvider();
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        LogUtils.errorLog(TAG, "WidgetProvider constructor is not accessible for " + localClass.getSimpleName());
      }
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    LogUtils.debugLog(TAG, "Activity Lifecycle: onCreate");
    setContentView(2130903048);
    this.cancelButton = ((ImageView)findViewById(2131296281));
    this.cancelButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        LogUtils.debugLog(WemoWidgetConfigurationActivity.TAG, "Cancel button clicked");
        WemoWidgetConfigurationActivity.this.setResult(0);
        WemoWidgetConfigurationActivity.this.finish();
      }
    });
    this.nextButton = ((ImageView)findViewById(2131296282));
    this.nextButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        LogUtils.debugLog(WemoWidgetConfigurationActivity.TAG, "Next button clicked");
        if ((WemoWidgetConfigurationActivity.this.adapter != null) && (WemoWidgetConfigurationActivity.this.adapter.getSelectedDevice() != null))
        {
          LogUtils.debugLog(WemoWidgetConfigurationActivity.TAG, "Selected position: " + WemoWidgetConfigurationActivity.this.adapter.getSelectedPosition());
          DeviceInformation localDeviceInformation = WemoWidgetConfigurationActivity.this.adapter.getSelectedDevice();
          if (TextUtils.isEmpty(localDeviceInformation.getCapabilities())) {
            localDeviceInformation.setCapabilities(DeviceListManager.getInstance(WemoWidgetConfigurationActivity.this.getApplicationContext()).getDeviceCapabilities(localDeviceInformation));
          }
          WidgetData localWidgetData = new WidgetData(localDeviceInformation);
          LogUtils.debugLog(WemoWidgetConfigurationActivity.TAG, localWidgetData.toString());
          WidgetUtil.storeWidgetData(WemoWidgetConfigurationActivity.this, WemoWidgetConfigurationActivity.this.appWidgetId, localWidgetData);
          WidgetUtil.addWidgetIdToMapping(WemoWidgetConfigurationActivity.this, localWidgetData.getId(), WemoWidgetConfigurationActivity.this.appWidgetId);
          WemoWidgetConfigurationActivity.this.getWidgetProvider().initializeWidgetView(WemoWidgetConfigurationActivity.this, WemoWidgetConfigurationActivity.this.appWidgetId, localDeviceInformation);
          Intent localIntent = new Intent();
          localIntent.putExtra("appWidgetId", WemoWidgetConfigurationActivity.this.appWidgetId);
          WemoWidgetConfigurationActivity.this.setResult(-1, localIntent);
        }
        for (;;)
        {
          WemoWidgetConfigurationActivity.this.finish();
          return;
          LogUtils.errorLog(WemoWidgetConfigurationActivity.TAG, "ListView adapter is null so we can't determine the selected device");
          WemoWidgetConfigurationActivity.this.setResult(0);
        }
      }
    });
    this.devicesForWidgetListView = ((ListView)findViewById(2131296283));
    this.adapter = new WemoWidgetConfigurationAdapter(this);
    this.devicesForWidgetListView.setAdapter(this.adapter);
    this.noDevicesTextView = ((TextView)findViewById(2131296284));
    Bundle localBundle = getIntent().getExtras();
    if (localBundle != null) {
      this.appWidgetId = localBundle.getInt("appWidgetId", 0);
    }
    if (this.appWidgetId == 0)
    {
      LogUtils.errorLog(TAG, "Invalid appWidget Id");
      finish();
      return;
    }
    LogUtils.debugLog(TAG, "appWidget Id: " + this.appWidgetId);
  }
  
  protected void onPause()
  {
    LogUtils.debugLog(TAG, "Activity Lifecycle: onPause");
    setResult(0);
    super.onPause();
  }
  
  protected void onResume()
  {
    super.onResume();
    LogUtils.debugLog(TAG, "Activity Lifecycle: onResume");
    List localList = WidgetController.getInstance(this).getDeviceList();
    if ((localList != null) && (localList.size() > 0))
    {
      this.adapter.setData(localList);
      toggleDeviceListForWidgetVisibility(true);
      return;
    }
    toggleDeviceListForWidgetVisibility(false);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WemoWidgetConfigurationActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */