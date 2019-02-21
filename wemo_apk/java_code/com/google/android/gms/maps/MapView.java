package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.dynamic.a;
import com.google.android.gms.dynamic.d;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.p;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class MapView
  extends FrameLayout
{
  private final b gD;
  private GoogleMap gz;
  
  public MapView(Context paramContext)
  {
    super(paramContext);
    this.gD = new b(this, paramContext, null);
  }
  
  public MapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.gD = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }
  
  public MapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.gD = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }
  
  public MapView(Context paramContext, GoogleMapOptions paramGoogleMapOptions)
  {
    super(paramContext);
    this.gD = new b(this, paramContext, paramGoogleMapOptions);
  }
  
  public final GoogleMap getMap()
  {
    if (this.gz != null) {
      return this.gz;
    }
    this.gD.bi();
    if (this.gD.at() == null) {
      return null;
    }
    try
    {
      this.gz = new GoogleMap(((a)this.gD.at()).bj().getMap());
      return this.gz;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void onCreate(Bundle paramBundle)
  {
    this.gD.onCreate(paramBundle);
    if (this.gD.at() == null) {
      this.gD.a(this);
    }
  }
  
  public final void onDestroy()
  {
    this.gD.onDestroy();
  }
  
  public final void onLowMemory()
  {
    this.gD.onLowMemory();
  }
  
  public final void onPause()
  {
    this.gD.onPause();
  }
  
  public final void onResume()
  {
    this.gD.onResume();
  }
  
  public final void onSaveInstanceState(Bundle paramBundle)
  {
    this.gD.onSaveInstanceState(paramBundle);
  }
  
  static class a
    implements LifecycleDelegate
  {
    private final ViewGroup gE;
    private final IMapViewDelegate gF;
    private View gG;
    
    public a(ViewGroup paramViewGroup, IMapViewDelegate paramIMapViewDelegate)
    {
      this.gF = ((IMapViewDelegate)s.d(paramIMapViewDelegate));
      this.gE = ((ViewGroup)s.d(paramViewGroup));
    }
    
    public IMapViewDelegate bj()
    {
      return this.gF;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      try
      {
        this.gF.onCreate(paramBundle);
        this.gG = ((View)com.google.android.gms.dynamic.c.a(this.gF.getView()));
        this.gE.removeAllViews();
        this.gE.addView(this.gG);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
    }
    
    public void onDestroy()
    {
      try
      {
        this.gF.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
    }
    
    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
    }
    
    public void onLowMemory()
    {
      try
      {
        this.gF.onLowMemory();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onPause()
    {
      try
      {
        this.gF.onPause();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onResume()
    {
      try
      {
        this.gF.onResume();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onSaveInstanceState(Bundle paramBundle)
    {
      try
      {
        this.gF.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }
  
  static class b
    extends a<MapView.a>
  {
    protected d<MapView.a> gC;
    private final ViewGroup gH;
    private final GoogleMapOptions gI;
    private final Context mContext;
    
    b(ViewGroup paramViewGroup, Context paramContext, GoogleMapOptions paramGoogleMapOptions)
    {
      this.gH = paramViewGroup;
      this.mContext = paramContext;
      this.gI = paramGoogleMapOptions;
    }
    
    protected void a(d<MapView.a> paramd)
    {
      this.gC = paramd;
      bi();
    }
    
    public void bi()
    {
      if ((this.gC != null) && (at() == null)) {}
      try
      {
        IMapViewDelegate localIMapViewDelegate = p.i(this.mContext).a(com.google.android.gms.dynamic.c.f(this.mContext), this.gI);
        this.gC.a(new MapView.a(this.gH, localIMapViewDelegate));
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException) {}
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/MapView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */