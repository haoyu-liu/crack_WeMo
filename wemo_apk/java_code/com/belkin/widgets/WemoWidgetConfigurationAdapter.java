package com.belkin.widgets;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class WemoWidgetConfigurationAdapter
  extends BaseAdapter
{
  private static final String TAG = WemoWidgetConfigurationAdapter.class.getSimpleName();
  private Context context;
  private List<DeviceInformation> data;
  private RadioButton selectedButton;
  private int selectedPosition;
  
  public WemoWidgetConfigurationAdapter(Context paramContext)
  {
    this(paramContext, new ArrayList(0));
  }
  
  public WemoWidgetConfigurationAdapter(Context paramContext, List<DeviceInformation> paramList)
  {
    this.context = paramContext;
    this.selectedPosition = -1;
    setData(paramList);
  }
  
  public int getCount()
  {
    if (this.data == null) {
      return 0;
    }
    return this.data.size();
  }
  
  public Object getItem(int paramInt)
  {
    return this.data.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public DeviceInformation getSelectedDevice()
  {
    List localList = this.data;
    DeviceInformation localDeviceInformation = null;
    if (localList != null)
    {
      int i = this.selectedPosition;
      localDeviceInformation = null;
      if (i >= 0)
      {
        int j = this.selectedPosition;
        int k = this.data.size();
        localDeviceInformation = null;
        if (j < k) {
          localDeviceInformation = (DeviceInformation)this.data.get(this.selectedPosition);
        }
      }
    }
    return localDeviceInformation;
  }
  
  public int getSelectedPosition()
  {
    return this.selectedPosition;
  }
  
  public View getView(final int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    DeviceViewHolder localDeviceViewHolder;
    DeviceInformation localDeviceInformation;
    String str1;
    label124:
    String str2;
    label152:
    File localFile;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(this.context).inflate(2130903049, paramViewGroup, false);
      localDeviceViewHolder = new DeviceViewHolder(null);
      localDeviceViewHolder.name = ((TextView)paramView.findViewById(2131296286));
      localDeviceViewHolder.radioButton = ((RadioButton)paramView.findViewById(2131296287));
      localDeviceViewHolder.deviceIcon = ((ImageView)paramView.findViewById(2131296285));
      localDeviceViewHolder.notSupportedMessage = ((TextView)paramView.findViewById(2131296288));
      paramView.setTag(localDeviceViewHolder);
      localDeviceInformation = (DeviceInformation)this.data.get(paramInt);
      if (!TextUtils.isEmpty(localDeviceInformation.getGroupID())) {
        break label278;
      }
      str1 = localDeviceInformation.getFriendlyName();
      localDeviceViewHolder.name.setText(str1);
      if (!TextUtils.isEmpty(localDeviceInformation.getGroupID())) {
        break label288;
      }
      str2 = localDeviceInformation.getIcon();
      if (!TextUtils.isEmpty(str2)) {
        break label298;
      }
      localFile = null;
      label163:
      if ((localFile == null) || (!localFile.exists())) {
        break label312;
      }
      localDeviceViewHolder.deviceIcon.setImageURI(Uri.parse(str2));
      label189:
      if (!WidgetUtil.supportsWidgets(localDeviceInformation)) {
        break label385;
      }
      localDeviceViewHolder.notSupportedMessage.setVisibility(8);
      localDeviceViewHolder.radioButton.setVisibility(0);
      localDeviceViewHolder.deviceIcon.setAlpha(1.0F);
      paramView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if ((WemoWidgetConfigurationAdapter.this.selectedPosition != paramInt) && (WemoWidgetConfigurationAdapter.this.selectedButton != null)) {
            WemoWidgetConfigurationAdapter.this.selectedButton.setChecked(false);
          }
          WemoWidgetConfigurationAdapter.DeviceViewHolder localDeviceViewHolder = (WemoWidgetConfigurationAdapter.DeviceViewHolder)paramAnonymousView.getTag();
          localDeviceViewHolder.radioButton.setChecked(true);
          WemoWidgetConfigurationAdapter.access$102(WemoWidgetConfigurationAdapter.this, paramInt);
          WemoWidgetConfigurationAdapter.access$202(WemoWidgetConfigurationAdapter.this, localDeviceViewHolder.radioButton);
        }
      });
    }
    for (;;)
    {
      localDeviceViewHolder.radioButton.setClickable(false);
      if (this.selectedPosition == paramInt) {
        break label422;
      }
      localDeviceViewHolder.radioButton.setChecked(false);
      return paramView;
      localDeviceViewHolder = (DeviceViewHolder)paramView.getTag();
      break;
      label278:
      str1 = localDeviceInformation.getGroupName();
      break label124;
      label288:
      str2 = localDeviceInformation.getGroupIcon();
      break label152;
      label298:
      localFile = new File(str2);
      break label163;
      label312:
      Drawable localDrawable = WidgetUtil.getDefaultDeviceIcon(this.context, localDeviceInformation);
      if (localDrawable != null)
      {
        localDeviceViewHolder.deviceIcon.setImageDrawable(localDrawable);
        break label189;
      }
      String str3 = TAG;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localDeviceInformation.getUDN();
      arrayOfObject[1] = localDeviceInformation.getType();
      LogUtils.errorLog(str3, String.format("Unable to find default icon for device with udn, type: %s, %s", arrayOfObject));
      break label189;
      label385:
      localDeviceViewHolder.notSupportedMessage.setVisibility(0);
      localDeviceViewHolder.radioButton.setVisibility(8);
      localDeviceViewHolder.deviceIcon.setAlpha(0.65F);
      paramView.setOnClickListener(null);
    }
    label422:
    localDeviceViewHolder.radioButton.setChecked(true);
    this.selectedButton = localDeviceViewHolder.radioButton;
    return paramView;
  }
  
  public void setData(List<DeviceInformation> paramList)
  {
    this.data = paramList;
    if ((this.selectedPosition < 0) || (this.selectedPosition >= paramList.size()) || (!WidgetUtil.supportsWidgets((DeviceInformation)paramList.get(this.selectedPosition)))) {
      this.selectedPosition = WidgetUtil.getFirstSupportedDeviceIndex(paramList);
    }
    notifyDataSetChanged();
  }
  
  private static class DeviceViewHolder
  {
    ImageView deviceIcon;
    TextView name;
    TextView notSupportedMessage;
    RadioButton radioButton;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WemoWidgetConfigurationAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */