package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.GradientDrawable.Orientation;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.DisplayMetrics;
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
import android.widget.AbsListView.LayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

final class TestModeListView
  extends DialogFragment
{
  static final String TEST_MODE_LIST_TAG = "marketing_test_mode_list";
  private ListAdapter mAdapter;
  private Map<Integer, MarketingCallable> mCallbacks;
  private final AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  
  public static TestModeListView newInstance()
  {
    TestModeListView localTestModeListView = new TestModeListView();
    localTestModeListView.setRetainInstance(true);
    return localTestModeListView;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onActivityCreated");
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    Localytics.Log.d("[TestModeListView]: onAttach");
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onCreate");
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onCreateDialog");
    return new TestModeDialog(getActivity(), 16973835);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onCreateView");
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    Localytics.Log.d("[TestModeListView]: onDestroy");
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    Localytics.Log.d("[TestModeListView]: onDestroyView");
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    Localytics.Log.d("[TestModeListView]: onDetach");
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    Localytics.Log.d("[TestModeListView]: onDismiss");
    super.onDismiss(paramDialogInterface);
  }
  
  public void onPause()
  {
    Localytics.Log.d("[TestModeListView]: onPause");
    super.onPause();
  }
  
  public void onResume()
  {
    Localytics.Log.d("[TestModeListView]: onResume");
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onSaveInstanceState");
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    Localytics.Log.d("[TestModeListView]: onStart");
    super.onStart();
  }
  
  public void onStop()
  {
    Localytics.Log.d("[TestModeListView]: onStop");
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    Localytics.Log.d("[TestModeListView]: onViewStateRestored");
    super.onViewStateRestored(paramBundle);
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    this.mAdapter = paramListAdapter;
  }
  
  public TestModeListView setCallbacks(Map<Integer, MarketingCallable> paramMap)
  {
    this.mCallbacks = paramMap;
    return this;
  }
  
  public void show(FragmentManager paramFragmentManager, String paramString)
  {
    this.mEnterAnimatable.set(true);
    super.show(paramFragmentManager, paramString);
  }
  
  final class CancelItemAdapter
    extends BaseAdapter
  {
    private final String[] MENU_ITEMS = { "Cancel" };
    private final Context mContext;
    
    CancelItemAdapter(Context paramContext)
    {
      this.mContext = paramContext;
    }
    
    public int getCount()
    {
      return this.MENU_ITEMS.length;
    }
    
    public String getItem(int paramInt)
    {
      return this.MENU_ITEMS[paramInt];
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    @TargetApi(16)
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      Object localObject = paramView;
      if (localObject == null)
      {
        LinearLayout localLinearLayout = new LinearLayout(this.mContext);
        localLinearLayout.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        localLinearLayout.setOrientation(1);
        int i = (int)(0.5F + 6.0F * this.mContext.getResources().getDisplayMetrics().density);
        localLinearLayout.setPadding(0, i, 0, i);
        TextView localTextView1 = new TextView(this.mContext);
        localTextView1.setId(1);
        localTextView1.setTextSize(26.0F);
        localTextView1.setTextColor(Color.argb(255, 0, 91, 255));
        localTextView1.setGravity(17);
        localLinearLayout.addView(localTextView1);
        localObject = localLinearLayout;
        float f = 8.0F * TestModeListView.this.getResources().getDisplayMetrics().density;
        GradientDrawable localGradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[] { -1, -1, -1 });
        localGradientDrawable.setGradientType(0);
        localGradientDrawable.setCornerRadii(new float[] { f, f, f, f, f, f, f, f });
        if (DatapointHelper.getApiLevel() < 16) {
          break label285;
        }
        ((View)localObject).setBackground(localGradientDrawable);
      }
      for (;;)
      {
        TextView localTextView2 = (TextView)((View)localObject).findViewById(1);
        localTextView2.setText(this.MENU_ITEMS[paramInt]);
        localTextView2.setTypeface(null, 1);
        return (View)localObject;
        label285:
        ((View)localObject).setBackgroundColor(-1);
      }
    }
  }
  
  class MenuDialog
    extends Dialog
  {
    private LinearLayout mDialogLayout;
    private DisplayMetrics mMetrics;
    
    public MenuDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      setupViews();
      adjustLayout();
    }
    
    private void adjustLayout()
    {
      this.mMetrics = new DisplayMetrics();
      ((WindowManager)TestModeListView.this.getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(this.mMetrics);
      Window localWindow = getWindow();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setAttributes(localWindow.getAttributes());
      localWindow.setFlags(1024, 1024);
    }
    
    @TargetApi(16)
    private void setupViews()
    {
      this.mDialogLayout = new LinearLayout(getContext());
      this.mDialogLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      this.mDialogLayout.setGravity(16);
      this.mDialogLayout.setOrientation(1);
      int i = getContext().getResources().getColor(17170445);
      TestModeListView.MenuItemAdapter localMenuItemAdapter = new TestModeListView.MenuItemAdapter(TestModeListView.this, TestModeListView.this.getActivity());
      ListView localListView1 = new ListView(TestModeListView.this.getActivity());
      localListView1.setAdapter(localMenuItemAdapter);
      View localView;
      label183:
      ListView localListView2;
      if (DatapointHelper.getApiLevel() >= 16)
      {
        localListView1.setBackground(new ColorDrawable(i));
        localListView1.setDividerHeight(1);
        localListView1.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
          @TargetApi(11)
          public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            if (paramAnonymousInt == 0)
            {
              Constants.setTestModeEnabled(false);
              TestModeListView.this.dismiss();
            }
            for (;;)
            {
              TestModeListView.MenuDialog.this.dismiss();
              return;
              if (paramAnonymousInt == 1)
              {
                if (TestModeListView.this.mCallbacks != null)
                {
                  MarketingCallable localMarketingCallable3 = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(12));
                  if (localMarketingCallable3 != null) {
                    localMarketingCallable3.call(null);
                  }
                }
              }
              else if (paramAnonymousInt == 2)
              {
                if (TestModeListView.this.mCallbacks != null)
                {
                  MarketingCallable localMarketingCallable2 = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(13));
                  if (localMarketingCallable2 != null) {
                    localMarketingCallable2.call(null);
                  }
                }
              }
              else if ((paramAnonymousInt == 3) && (TestModeListView.this.mCallbacks != null))
              {
                MarketingCallable localMarketingCallable1 = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(14));
                if (localMarketingCallable1 != null) {
                  localMarketingCallable1.call(null);
                }
              }
            }
          }
        });
        this.mDialogLayout.addView(localListView1);
        localView = new View(TestModeListView.this.getActivity());
        if (DatapointHelper.getApiLevel() < 16) {
          break label334;
        }
        localView.setBackground(new ColorDrawable(i));
        localView.setLayoutParams(new LinearLayout.LayoutParams(-1, (int)(0.5F + 10.0F * TestModeListView.this.getResources().getDisplayMetrics().density)));
        this.mDialogLayout.addView(localView);
        TestModeListView.CancelItemAdapter localCancelItemAdapter = new TestModeListView.CancelItemAdapter(TestModeListView.this, TestModeListView.this.getActivity());
        localListView2 = new ListView(TestModeListView.this.getActivity());
        localListView2.setAdapter(localCancelItemAdapter);
        if (DatapointHelper.getApiLevel() < 16) {
          break label343;
        }
        localListView2.setBackground(new ColorDrawable(i));
      }
      for (;;)
      {
        localListView2.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
          public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            TestModeListView.MenuDialog.this.dismiss();
          }
        });
        this.mDialogLayout.addView(localListView2);
        requestWindowFeature(1);
        setContentView(this.mDialogLayout);
        return;
        localListView1.setBackgroundColor(i);
        break;
        label334:
        localView.setBackgroundColor(i);
        break label183;
        label343:
        localView.setBackgroundColor(i);
      }
    }
  }
  
  final class MenuItemAdapter
    extends BaseAdapter
  {
    private final String[] MENU_ITEMS = { "Disable Test Mode", "Refresh", "Copy Push Token", "Copy Install ID" };
    private final Context mContext;
    
    public MenuItemAdapter(Context paramContext)
    {
      this.mContext = paramContext;
    }
    
    private Drawable getShape(int paramInt)
    {
      float f = 8.0F * TestModeListView.this.getResources().getDisplayMetrics().density;
      GradientDrawable localGradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[] { -1, -1, -1 });
      localGradientDrawable.setGradientType(0);
      switch (paramInt)
      {
      case 1: 
      case 2: 
      default: 
        return localGradientDrawable;
      case 0: 
        localGradientDrawable.setCornerRadii(new float[] { f, f, f, f, 0.0F, 0.0F, 0.0F, 0.0F });
        return localGradientDrawable;
      }
      localGradientDrawable.setCornerRadii(new float[] { 0.0F, 0.0F, 0.0F, 0.0F, f, f, f, f });
      return localGradientDrawable;
    }
    
    public int getCount()
    {
      return this.MENU_ITEMS.length;
    }
    
    public String getItem(int paramInt)
    {
      return this.MENU_ITEMS[paramInt];
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    @TargetApi(16)
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      Object localObject = paramView;
      if (localObject == null)
      {
        LinearLayout localLinearLayout = new LinearLayout(this.mContext);
        localLinearLayout.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        localLinearLayout.setOrientation(1);
        int i = (int)(0.5F + 6.0F * this.mContext.getResources().getDisplayMetrics().density);
        localLinearLayout.setPadding(0, i, 0, i);
        TextView localTextView1 = new TextView(this.mContext);
        localTextView1.setId(1);
        localTextView1.setTextSize(26.0F);
        localTextView1.setTextColor(Color.argb(255, 0, 91, 255));
        localTextView1.setGravity(17);
        localLinearLayout.addView(localTextView1);
        localObject = localLinearLayout;
        if (DatapointHelper.getApiLevel() < 16) {
          break label199;
        }
        ((View)localObject).setBackground(getShape(paramInt));
      }
      TextView localTextView2;
      for (;;)
      {
        localTextView2 = (TextView)((View)localObject).findViewById(1);
        localTextView2.setText(this.MENU_ITEMS[paramInt]);
        switch (paramInt)
        {
        default: 
          return (View)localObject;
          label199:
          ((View)localObject).setBackgroundColor(-1);
        }
      }
      localTextView2.setTextColor(-65536);
      return (View)localObject;
    }
  }
  
  final class TestModeDialog
    extends Dialog
  {
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
      ((WindowManager)TestModeListView.this.getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(this.mMetrics);
      Window localWindow = getWindow();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setGravity(17);
      WindowManager.LayoutParams localLayoutParams = localWindow.getAttributes();
      localLayoutParams.dimAmount = 0.0F;
      localLayoutParams.width = this.mMetrics.widthPixels;
      localWindow.setAttributes(localLayoutParams);
      if (TestModeListView.this.mEnterAnimatable.getAndSet(false)) {
        this.mDialogLayout.startAnimation(this.mAnimIn);
      }
      localWindow.setFlags(1024, 1024);
    }
    
    private void createAnimations()
    {
      this.mAnimIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      this.mAnimIn.setDuration(250L);
      this.mAnimOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      this.mAnimOut.setDuration(250L);
      this.mAnimOut.setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          TestModeListView.this.dismiss();
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      });
    }
    
    private void setupViews()
    {
      float f = TestModeListView.this.getResources().getDisplayMetrics().density;
      this.mDialogLayout = new RelativeLayout(getContext());
      this.mDialogLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
      this.mDialogLayout.setBackgroundColor(-1);
      RelativeLayout localRelativeLayout1 = new RelativeLayout(getContext());
      RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-1, -2);
      localLayoutParams1.addRule(10);
      localRelativeLayout1.setId(1);
      localRelativeLayout1.setLayoutParams(localLayoutParams1);
      localRelativeLayout1.setBackgroundColor(Color.argb(255, 73, 73, 73));
      localRelativeLayout1.setPadding((int)(0.5F + 8.0F * f), (int)(0.5F + 12.0F * f), (int)(0.5F + 8.0F * f), (int)(0.5F + 12.0F * f));
      this.mDialogLayout.addView(localRelativeLayout1);
      TextView localTextView1 = new TextView(getContext());
      localTextView1.setText("Close");
      localTextView1.setTextSize(22.0F);
      int[][] arrayOfInt1 = { { 16842919 }, { 16842908 }, new int[0] };
      int[] arrayOfInt2 = new int[3];
      arrayOfInt2[0] = Color.argb(255, 255, 0, 0);
      arrayOfInt2[1] = Color.argb(255, 0, 91, 255);
      arrayOfInt2[2] = Color.argb(255, 0, 91, 255);
      localTextView1.setTextColor(new ColorStateList(arrayOfInt1, arrayOfInt2));
      localTextView1.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          TestModeListView.TestModeDialog.this.mDialogLayout.startAnimation(TestModeListView.TestModeDialog.this.mAnimOut);
          if (TestModeListView.this.mCallbacks != null)
          {
            MarketingCallable localMarketingCallable = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(10));
            if (localMarketingCallable != null) {
              localMarketingCallable.call(null);
            }
          }
        }
      });
      RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams2.addRule(9);
      localTextView1.setLayoutParams(localLayoutParams2);
      localRelativeLayout1.addView(localTextView1);
      TextView localTextView2 = new TextView(getContext());
      localTextView2.setText("Localytics");
      localTextView2.setTextSize(22.0F);
      localTextView2.setTextColor(-1);
      RelativeLayout.LayoutParams localLayoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams3.addRule(13);
      localTextView2.setLayoutParams(localLayoutParams3);
      localRelativeLayout1.addView(localTextView2);
      TextView localTextView3 = new TextView(getContext());
      localTextView3.setText("Menu");
      localTextView3.setTextSize(22.0F);
      int[][] arrayOfInt3 = { { 16842919 }, { 16842908 }, new int[0] };
      int[] arrayOfInt4 = new int[3];
      arrayOfInt4[0] = Color.argb(255, 255, 0, 0);
      arrayOfInt4[1] = Color.argb(255, 0, 91, 255);
      arrayOfInt4[2] = Color.argb(255, 0, 91, 255);
      localTextView3.setTextColor(new ColorStateList(arrayOfInt3, arrayOfInt4));
      localTextView3.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (TestModeListView.this.mCallbacks != null) {
            new TestModeListView.MenuDialog(TestModeListView.this, TestModeListView.this.getActivity(), 16973835).show();
          }
        }
      });
      RelativeLayout.LayoutParams localLayoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams4.addRule(11);
      localTextView3.setLayoutParams(localLayoutParams4);
      localRelativeLayout1.addView(localTextView3);
      RelativeLayout localRelativeLayout2 = new RelativeLayout(getContext());
      RelativeLayout.LayoutParams localLayoutParams5 = new RelativeLayout.LayoutParams(-1, -1);
      localLayoutParams5.addRule(3, 1);
      localRelativeLayout2.setLayoutParams(localLayoutParams5);
      this.mDialogLayout.addView(localRelativeLayout2);
      ListView localListView = new ListView(getContext());
      localListView.setAdapter(TestModeListView.this.mAdapter);
      localListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          if (TestModeListView.this.mCallbacks != null)
          {
            MarketingCallable localMarketingCallable = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(11));
            if (localMarketingCallable != null)
            {
              Object[] arrayOfObject = new Object[1];
              arrayOfObject[0] = paramAnonymousAdapterView.getItemAtPosition(paramAnonymousInt);
              localMarketingCallable.call(arrayOfObject);
            }
          }
        }
      });
      localRelativeLayout2.addView(localListView);
      requestWindowFeature(1);
      setContentView(this.mDialogLayout);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4)
      {
        this.mDialogLayout.startAnimation(this.mAnimOut);
        if (TestModeListView.this.mCallbacks != null)
        {
          MarketingCallable localMarketingCallable = (MarketingCallable)TestModeListView.this.mCallbacks.get(Integer.valueOf(10));
          if (localMarketingCallable != null) {
            localMarketingCallable.call(null);
          }
        }
        return super.onKeyDown(paramInt, paramKeyEvent);
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/TestModeListView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */