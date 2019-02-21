package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

public final class TestModeButton
  extends DialogFragment
{
  static final String TEST_MODE_BUTTON_TAG = "marketing_test_mode_button";
  private Map<Integer, MarketingCallable> mCallbacks;
  private final AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  
  static TestModeButton newInstance()
  {
    TestModeButton localTestModeButton = new TestModeButton();
    localTestModeButton.setRetainInstance(true);
    return localTestModeButton;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onActivityCreated");
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    Localytics.Log.d("[TestModeButton]: onAttach");
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onCreate");
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onCreateDialog");
    return new TestModeDialog(getActivity(), 16973835);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onCreateView");
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    Localytics.Log.d("[TestModeButton]: onDestroy");
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    Localytics.Log.d("[TestModeButton]: onDestroyView");
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    Localytics.Log.d("[TestModeButton]: onDetach");
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    Localytics.Log.d("[TestModeButton]: onDismiss");
    super.onDismiss(paramDialogInterface);
  }
  
  public void onPause()
  {
    Localytics.Log.d("[TestModeButton]: onPause");
    super.onPause();
  }
  
  public void onResume()
  {
    Localytics.Log.d("[TestModeButton]: onResume");
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onSaveInstanceState");
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    Localytics.Log.d("[TestModeButton]: onStart");
    super.onStart();
  }
  
  public void onStop()
  {
    Localytics.Log.d("[TestModeButton]: onStop");
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeButton]: onViewStateRestored");
    super.onViewStateRestored(paramBundle);
  }
  
  TestModeButton setCallbacks(Map<Integer, MarketingCallable> paramMap)
  {
    this.mCallbacks = paramMap;
    return this;
  }
  
  public void show(FragmentManager paramFragmentManager, String paramString)
  {
    this.mEnterAnimatable.set(true);
    super.show(paramFragmentManager, paramString);
  }
  
  final class TestModeDialog
    extends Dialog
  {
    private static final int X_OFFSET = 0;
    private static final int Y_OFFSET = 85;
    private TranslateAnimation mAnimIn;
    private TranslateAnimation mAnimOut;
    private RelativeLayout mDialogLayout;
    private DisplayMetrics mMetrics;
    
    public TestModeDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      setupViews();
      createAnimations();
      adjustLayout();
    }
    
    @SuppressLint({"NewApi"})
    private void adjustLayout()
    {
      this.mMetrics = new DisplayMetrics();
      ((WindowManager)TestModeButton.this.getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(this.mMetrics);
      Window localWindow = getWindow();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setGravity(51);
      WindowManager.LayoutParams localLayoutParams = localWindow.getAttributes();
      localLayoutParams.x = ((int)TypedValue.applyDimension(1, 0.0F, this.mMetrics));
      localLayoutParams.y = ((int)TypedValue.applyDimension(1, 85.0F, this.mMetrics));
      localLayoutParams.dimAmount = 0.0F;
      localWindow.setAttributes(localLayoutParams);
      localWindow.clearFlags(2);
      localWindow.setFlags(32, 32);
      if (TestModeButton.this.mEnterAnimatable.getAndSet(false)) {
        this.mDialogLayout.startAnimation(this.mAnimIn);
      }
      localWindow.setFlags(1024, 1024);
    }
    
    private void createAnimations()
    {
      this.mAnimIn = new TranslateAnimation(2, -1.0F, 2, 0.0F, 2, 0.0F, 2, 0.0F);
      this.mAnimIn.setDuration(250L);
      this.mAnimOut = new TranslateAnimation(2, 0.0F, 2, -1.0F, 2, 0.0F, 2, 0.0F);
      this.mAnimOut.setDuration(250L);
      this.mAnimOut.setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          TestModeButton.this.dismiss();
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      });
    }
    
    private void setupViews()
    {
      this.mDialogLayout = new RelativeLayout(getContext());
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      this.mDialogLayout.setLayoutParams(localLayoutParams);
      Button localButton = new Button(getContext(), null);
      localButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          TestModeButton.TestModeDialog.this.mDialogLayout.startAnimation(TestModeButton.TestModeDialog.this.mAnimOut);
          if (TestModeButton.this.mCallbacks != null)
          {
            MarketingCallable localMarketingCallable = (MarketingCallable)TestModeButton.this.mCallbacks.get(Integer.valueOf(9));
            if (localMarketingCallable != null) {
              localMarketingCallable.call(null);
            }
          }
        }
      });
      this.mDialogLayout.addView(localButton);
      requestWindowFeature(1);
      setContentView(this.mDialogLayout);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4)
      {
        this.mDialogLayout.startAnimation(this.mAnimOut);
        Constants.setTestModeEnabled(false);
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    
    final class Button
      extends View
    {
      private static final int HEIGHT = 60;
      private static final int WIDTH = 60;
      private final int BACKGROUND_COLOR = Color.argb(255, 51, 51, 51);
      private final int BAR1_COLOR = Color.argb(255, 138, 138, 138);
      private final int BAR2_COLOR = Color.argb(255, 217, 217, 217);
      private final int BAR3_COLOR = Color.argb(255, 220, 220, 220);
      private final int OVAL_COLOR = Color.argb(255, 70, 70, 70);
      private final Paint mPaint;
      private final RectF mRectF;
      
      @TargetApi(11)
      Button(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        if (DatapointHelper.getApiLevel() >= 19) {
          setLayerType(1, null);
        }
        float f = getResources().getDisplayMetrics().density;
        this.mRectF = new RectF(55.0F * f, 0.0F, 65.0F * f, 60.0F * f);
        setLayoutParams(new RelativeLayout.LayoutParams((int)(0.5F + 65.0F * f), (int)(0.5F + 60.0F * f)));
        this.mPaint = new Paint(1);
        this.mPaint.setColor(this.BACKGROUND_COLOR);
        this.mPaint.setStyle(Paint.Style.FILL);
      }
      
      protected void onDraw(Canvas paramCanvas)
      {
        super.onDraw(paramCanvas);
        float f = getResources().getDisplayMetrics().density;
        this.mPaint.setColor(this.BACKGROUND_COLOR);
        paramCanvas.drawRect(0.0F, 0.0F, 60.0F * f, 60.0F * f, this.mPaint);
        paramCanvas.drawRoundRect(this.mRectF, 5.0F * f, 5.0F * f, this.mPaint);
        this.mPaint.setColor(this.BAR1_COLOR);
        paramCanvas.drawRect(7.0F * f, 42.0F * f, 13.0F * f, 48.0F * f, this.mPaint);
        this.mPaint.setColor(this.BAR2_COLOR);
        paramCanvas.drawRect(16.0F * f, 36.0F * f, 22.0F * f, 48.0F * f, this.mPaint);
        this.mPaint.setColor(this.BAR3_COLOR);
        paramCanvas.drawRect(25.0F * f, 27.0F * f, 31.0F * f, 48.0F * f, this.mPaint);
        this.mPaint.setColor(-1);
        paramCanvas.drawRect(34.0F * f, 12.0F * f, 40.0F * f, 48.0F * f, this.mPaint);
        this.mPaint.setColor(-1);
        paramCanvas.drawRect(37.0F * f, 42.0F * f, 55.0F * f, 48.0F * f, this.mPaint);
        this.mPaint.setColor(this.OVAL_COLOR);
        paramCanvas.drawOval(new RectF(59.0F * f, 40.0F * f, 63.0F * f, 44.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 30.0F * f, 63.0F * f, 34.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 20.0F * f, 63.0F * f, 24.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 10.0F * f, 63.0F * f, 14.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 35.0F * f, 58.0F * f, 39.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 25.0F * f, 58.0F * f, 29.0F * f), this.mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 15.0F * f, 58.0F * f, 19.0F * f), this.mPaint);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/TestModeButton.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */