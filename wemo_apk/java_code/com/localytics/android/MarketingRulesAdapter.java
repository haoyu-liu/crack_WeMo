package com.localytics.android;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

final class MarketingRulesAdapter
  extends BaseAdapter
{
  private final Context mContext;
  private final MarketingHandler mHandler;
  private final List<MarketingMessage> mMarketingRules;
  
  MarketingRulesAdapter(Context paramContext, MarketingHandler paramMarketingHandler)
  {
    this.mContext = paramContext;
    this.mMarketingRules = new ArrayList();
    this.mHandler = paramMarketingHandler;
  }
  
  public int getCount()
  {
    return this.mMarketingRules.size();
  }
  
  public Map<String, Object> getItem(int paramInt)
  {
    return (Map)this.mMarketingRules.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return ((Integer)((MarketingMessage)this.mMarketingRules.get(paramInt)).get("campaign_id")).intValue();
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject = paramView;
    if (localObject == null)
    {
      LinearLayout localLinearLayout1 = new LinearLayout(this.mContext);
      localLinearLayout1.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
      localLinearLayout1.setOrientation(0);
      LinearLayout localLinearLayout2 = new LinearLayout(this.mContext);
      localLinearLayout2.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      localLinearLayout2.setGravity(16);
      localLinearLayout2.setOrientation(1);
      int i = (int)(0.5F + 8.0F * this.mContext.getResources().getDisplayMetrics().density);
      localLinearLayout2.setPadding(i << 1, i, i << 1, i);
      localLinearLayout1.addView(localLinearLayout2);
      TextView localTextView1 = new TextView(this.mContext);
      localTextView1.setId(1);
      localTextView1.setTextSize(16.0F);
      localTextView1.setTextColor(-16777216);
      TextView localTextView2 = new TextView(this.mContext);
      localTextView2.setId(2);
      localTextView2.setTextSize(24.0F);
      localTextView2.setTextColor(-16777216);
      localLinearLayout2.addView(localTextView2);
      localLinearLayout2.addView(localTextView1);
      localObject = localLinearLayout1;
    }
    TextView localTextView3 = (TextView)((View)localObject).findViewById(1);
    TextView localTextView4 = (TextView)((View)localObject).findViewById(2);
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Long.valueOf(getItemId(paramInt));
    localTextView3.setText(String.format("Campaign ID: %d", arrayOfObject));
    localTextView4.setText((String)getItem(paramInt).get("rule_name_non_unique"));
    return (View)localObject;
  }
  
  boolean updateDataSet()
  {
    this.mMarketingRules.clear();
    final FutureTask localFutureTask = new FutureTask(new Callable()
    {
      public Boolean call()
        throws Exception
      {
        boolean bool = false;
        Iterator localIterator = MarketingRulesAdapter.this.mHandler.getMarketingMessages().iterator();
        while (localIterator.hasNext())
        {
          MarketingMessage localMarketingMessage = (MarketingMessage)localIterator.next();
          bool = true;
          MarketingRulesAdapter.this.mMarketingRules.add(localMarketingMessage);
        }
        return Boolean.valueOf(bool);
      }
    });
    new Thread()
    {
      public void run()
      {
        try
        {
          localFutureTask.run();
          return;
        }
        catch (Exception localException)
        {
          Localytics.Log.w("Caught an exception", localException);
        }
      }
    }.start();
    try
    {
      boolean bool = ((Boolean)localFutureTask.get()).booleanValue();
      return bool;
    }
    catch (Exception localException) {}
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingRulesAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */