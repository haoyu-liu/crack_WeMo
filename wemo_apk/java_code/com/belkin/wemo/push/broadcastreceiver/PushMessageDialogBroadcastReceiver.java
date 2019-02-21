package com.belkin.wemo.push.broadcastreceiver;

import android.app.Dialog;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.utils.WeMoUtils;

public class PushMessageDialogBroadcastReceiver
  extends BroadcastReceiver
{
  public static final String ACTION_DISPLAY_PUSH_MESSAGE = "com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE";
  public static final String KEY_EVENT_CODE = "event_code";
  public static final String KEY_NOTIFY_ID = "notify_id";
  public static final String KEY_PUSH_MESSAGE_TEXT = "push_message";
  public static final int PUSH_DIALOG_MSG_PADDING_BOTTOM = 25;
  public static final int PUSH_DIALOG_MSG_PADDING_TOP = 25;
  public static final int PUSH_DIALOG_MSG_SIZE = 17;
  public static final int PUSH_DIALOG_TITLE_BAR_HEIGHT = 2;
  public static final int PUSH_DIALOG_TITLE_PADDING_BOTTOM = 15;
  public static final int PUSH_DIALOG_TITLE_PADDING_LEFT = 15;
  public static final int PUSH_DIALOG_TITLE_PADDING_RIGHT = 15;
  public static final int PUSH_DIALOG_TITLE_PADDING_TOP = 15;
  public static final int PUSH_DIALOG_TITLE_SIZE = 20;
  public static final String TAG = "PushMessageDialogBroadcastReceiver";
  private Resources resources;
  
  private Button getPushDialogButton(Context paramContext)
  {
    Button localButton = new Button(paramContext);
    localButton.setText(2131165193);
    localButton.setPadding(WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext));
    localButton.setTextColor(this.resources.getColor(2131034116));
    localButton.setTextSize(17.0F);
    localButton.setBackgroundColor(0);
    return localButton;
  }
  
  private View getPushDialogCustomView(Context paramContext, View[] paramArrayOfView)
  {
    LinearLayout localLinearLayout = new LinearLayout(paramContext);
    localLinearLayout.setOrientation(1);
    localLinearLayout.setBackgroundColor(-1);
    int i = paramArrayOfView.length;
    for (int j = 0; j < i; j++) {
      localLinearLayout.addView(paramArrayOfView[j]);
    }
    return localLinearLayout;
  }
  
  private View getPushDialogMessageView(Context paramContext)
  {
    View localView = new View(paramContext);
    localView.setBackgroundColor(paramContext.getResources().getColor(2131034117));
    localView.setLayoutParams(new FrameLayout.LayoutParams(-1, 2));
    return localView;
  }
  
  private TextView getPushDialogMsgText(Context paramContext, String paramString)
  {
    TextView localTextView = new TextView(paramContext);
    if (paramString.contains(this.resources.getString(2131165189))) {
      localTextView.setText(2131165196);
    }
    for (;;)
    {
      localTextView.setPadding(WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(25, paramContext), WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(25, paramContext));
      localTextView.setTextColor(this.resources.getColor(2131034116));
      localTextView.setTextSize(17.0F);
      return localTextView;
      if (paramString.contains(this.resources.getString(2131165190))) {
        localTextView.setText(2131165199);
      } else {
        localTextView.setText(paramString);
      }
    }
  }
  
  private View getPushDialogTitleBarView(Context paramContext)
  {
    View localView = new View(paramContext);
    localView.setBackgroundColor(this.resources.getColor(2131034118));
    localView.setLayoutParams(new FrameLayout.LayoutParams(-1, WeMoUtils.convertDpToPixels(2, paramContext)));
    return localView;
  }
  
  private TextView getPushDialogTitleText(Context paramContext, String paramString)
  {
    TextView localTextView = new TextView(paramContext);
    if (paramString.contains(this.resources.getString(2131165189))) {
      localTextView.setText(2131165195);
    }
    for (;;)
    {
      localTextView.setPadding(WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext), WeMoUtils.convertDpToPixels(15, paramContext));
      localTextView.setTextColor(this.resources.getColor(2131034118));
      localTextView.setTextSize(20.0F);
      localTextView.setTypeface(Typeface.DEFAULT_BOLD);
      return localTextView;
      if (paramString.contains(this.resources.getString(2131165190))) {
        localTextView.setText(2131165197);
      } else {
        localTextView.setText(2131165192);
      }
    }
  }
  
  private void showMessage(final Context paramContext, String paramString, final int paramInt)
  {
    if (paramContext != null)
    {
      this.resources = paramContext.getResources();
      if (this.resources != null)
      {
        final Dialog localDialog = new Dialog(paramContext);
        localDialog.requestWindowFeature(1);
        localDialog.setCanceledOnTouchOutside(false);
        localDialog.setCancelable(false);
        Button localButton = getPushDialogButton(paramContext);
        localButton.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            if (paramInt > -1)
            {
              LogUtils.infoLog("PushMessageDialogBroadcastReceiver", "Push Notification: Cancelling notification from Notification Bar: notify ID: " + paramInt);
              ((NotificationManager)paramContext.getSystemService("notification")).cancel(paramInt);
            }
            localDialog.dismiss();
          }
        });
        View[] arrayOfView = new View[5];
        arrayOfView[0] = getPushDialogTitleText(paramContext, paramString);
        arrayOfView[1] = getPushDialogTitleBarView(paramContext);
        arrayOfView[2] = getPushDialogMsgText(paramContext, paramString);
        arrayOfView[3] = getPushDialogMessageView(paramContext);
        arrayOfView[4] = localButton;
        localDialog.setContentView(getPushDialogCustomView(paramContext, arrayOfView));
        localDialog.show();
      }
    }
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent != null)
    {
      String str1 = paramIntent.getAction();
      if (!TextUtils.isEmpty(str1))
      {
        LogUtils.infoLog("PushMessageDialogBroadcastReceiver", "Push Notification: Broadcast received to display push message on screen. Action: " + str1);
        if (str1.equals("com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE"))
        {
          String str2 = paramIntent.getStringExtra("push_message");
          int i = paramIntent.getIntExtra("notify_id", -1);
          String str3 = paramIntent.getStringExtra("event_code");
          LogUtils.infoLog("PushMessageDialogBroadcastReceiver", "Push Notification: Push Msg to display on screen: " + str2 + ", notify ID: " + i + ", eventCode: " + str3);
          if ((!str3.equalsIgnoreCase("overtempon")) && (str2 != null)) {
            showMessage(paramContext, str2, i);
          }
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */