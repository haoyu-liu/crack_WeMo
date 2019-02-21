package com.google.android.gms.maps;

import android.graphics.Bitmap;
import android.location.Location;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate.a;
import com.google.android.gms.maps.internal.b.a;
import com.google.android.gms.maps.internal.d.a;
import com.google.android.gms.maps.internal.e.a;
import com.google.android.gms.maps.internal.f.a;
import com.google.android.gms.maps.internal.g;
import com.google.android.gms.maps.internal.h.a;
import com.google.android.gms.maps.internal.i.a;
import com.google.android.gms.maps.internal.j.a;
import com.google.android.gms.maps.internal.k.a;
import com.google.android.gms.maps.internal.l.a;
import com.google.android.gms.maps.internal.m.a;
import com.google.android.gms.maps.internal.n.a;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.internal.d;
import com.google.android.gms.maps.model.internal.f;

public final class GoogleMap
{
  public static final int MAP_TYPE_HYBRID = 4;
  public static final int MAP_TYPE_NONE = 0;
  public static final int MAP_TYPE_NORMAL = 1;
  public static final int MAP_TYPE_SATELLITE = 2;
  public static final int MAP_TYPE_TERRAIN = 3;
  private final IGoogleMapDelegate fX;
  private UiSettings fY;
  
  protected GoogleMap(IGoogleMapDelegate paramIGoogleMapDelegate)
  {
    this.fX = ((IGoogleMapDelegate)s.d(paramIGoogleMapDelegate));
  }
  
  IGoogleMapDelegate aY()
  {
    return this.fX;
  }
  
  public final Circle addCircle(CircleOptions paramCircleOptions)
  {
    try
    {
      Circle localCircle = new Circle(this.fX.addCircle(paramCircleOptions));
      return localCircle;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final GroundOverlay addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
  {
    try
    {
      com.google.android.gms.maps.model.internal.c localc = this.fX.addGroundOverlay(paramGroundOverlayOptions);
      if (localc != null)
      {
        GroundOverlay localGroundOverlay = new GroundOverlay(localc);
        return localGroundOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final Marker addMarker(MarkerOptions paramMarkerOptions)
  {
    try
    {
      d locald = this.fX.addMarker(paramMarkerOptions);
      if (locald != null)
      {
        Marker localMarker = new Marker(locald);
        return localMarker;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final Polygon addPolygon(PolygonOptions paramPolygonOptions)
  {
    try
    {
      Polygon localPolygon = new Polygon(this.fX.addPolygon(paramPolygonOptions));
      return localPolygon;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final Polyline addPolyline(PolylineOptions paramPolylineOptions)
  {
    try
    {
      Polyline localPolyline = new Polyline(this.fX.addPolyline(paramPolylineOptions));
      return localPolyline;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final TileOverlay addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
  {
    try
    {
      f localf = this.fX.addTileOverlay(paramTileOverlayOptions);
      if (localf != null)
      {
        TileOverlay localTileOverlay = new TileOverlay(localf);
        return localTileOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void animateCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.fX.animateCamera(paramCameraUpdate.aW());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  /* Error */
  public final void animateCamera(CameraUpdate paramCameraUpdate, int paramInt, CancelableCallback paramCancelableCallback)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 34	com/google/android/gms/maps/GoogleMap:fX	Lcom/google/android/gms/maps/internal/IGoogleMapDelegate;
    //   4: astore 5
    //   6: aload_1
    //   7: invokevirtual 111	com/google/android/gms/maps/CameraUpdate:aW	()Lcom/google/android/gms/dynamic/b;
    //   10: astore 6
    //   12: aload_3
    //   13: ifnonnull +19 -> 32
    //   16: aconst_null
    //   17: astore 7
    //   19: aload 5
    //   21: aload 6
    //   23: iload_2
    //   24: aload 7
    //   26: invokeinterface 119 4 0
    //   31: return
    //   32: new 121	com/google/android/gms/maps/GoogleMap$a
    //   35: dup
    //   36: aload_3
    //   37: invokespecial 124	com/google/android/gms/maps/GoogleMap$a:<init>	(Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V
    //   40: astore 7
    //   42: goto -23 -> 19
    //   45: astore 4
    //   47: new 50	com/google/android/gms/maps/model/RuntimeRemoteException
    //   50: dup
    //   51: aload 4
    //   53: invokespecial 53	com/google/android/gms/maps/model/RuntimeRemoteException:<init>	(Landroid/os/RemoteException;)V
    //   56: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	this	GoogleMap
    //   0	57	1	paramCameraUpdate	CameraUpdate
    //   0	57	2	paramInt	int
    //   0	57	3	paramCancelableCallback	CancelableCallback
    //   45	7	4	localRemoteException	RemoteException
    //   4	16	5	localIGoogleMapDelegate	IGoogleMapDelegate
    //   10	12	6	localb	b
    //   17	24	7	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   0	12	45	android/os/RemoteException
    //   19	31	45	android/os/RemoteException
    //   32	42	45	android/os/RemoteException
  }
  
  /* Error */
  public final void animateCamera(CameraUpdate paramCameraUpdate, CancelableCallback paramCancelableCallback)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 34	com/google/android/gms/maps/GoogleMap:fX	Lcom/google/android/gms/maps/internal/IGoogleMapDelegate;
    //   4: astore 4
    //   6: aload_1
    //   7: invokevirtual 111	com/google/android/gms/maps/CameraUpdate:aW	()Lcom/google/android/gms/dynamic/b;
    //   10: astore 5
    //   12: aload_2
    //   13: ifnonnull +18 -> 31
    //   16: aconst_null
    //   17: astore 6
    //   19: aload 4
    //   21: aload 5
    //   23: aload 6
    //   25: invokeinterface 129 3 0
    //   30: return
    //   31: new 121	com/google/android/gms/maps/GoogleMap$a
    //   34: dup
    //   35: aload_2
    //   36: invokespecial 124	com/google/android/gms/maps/GoogleMap$a:<init>	(Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V
    //   39: astore 6
    //   41: goto -22 -> 19
    //   44: astore_3
    //   45: new 50	com/google/android/gms/maps/model/RuntimeRemoteException
    //   48: dup
    //   49: aload_3
    //   50: invokespecial 53	com/google/android/gms/maps/model/RuntimeRemoteException:<init>	(Landroid/os/RemoteException;)V
    //   53: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	54	0	this	GoogleMap
    //   0	54	1	paramCameraUpdate	CameraUpdate
    //   0	54	2	paramCancelableCallback	CancelableCallback
    //   44	6	3	localRemoteException	RemoteException
    //   4	16	4	localIGoogleMapDelegate	IGoogleMapDelegate
    //   10	12	5	localb	b
    //   17	23	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   0	12	44	android/os/RemoteException
    //   19	30	44	android/os/RemoteException
    //   31	41	44	android/os/RemoteException
  }
  
  public final void clear()
  {
    try
    {
      this.fX.clear();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final CameraPosition getCameraPosition()
  {
    try
    {
      CameraPosition localCameraPosition = this.fX.getCameraPosition();
      return localCameraPosition;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final int getMapType()
  {
    try
    {
      int i = this.fX.getMapType();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final float getMaxZoomLevel()
  {
    try
    {
      float f = this.fX.getMaxZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final float getMinZoomLevel()
  {
    try
    {
      float f = this.fX.getMinZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  @Deprecated
  public final Location getMyLocation()
  {
    try
    {
      Location localLocation = this.fX.getMyLocation();
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final Projection getProjection()
  {
    try
    {
      Projection localProjection = new Projection(this.fX.getProjection());
      return localProjection;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final UiSettings getUiSettings()
  {
    try
    {
      if (this.fY == null) {
        this.fY = new UiSettings(this.fX.getUiSettings());
      }
      UiSettings localUiSettings = this.fY;
      return localUiSettings;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final boolean isIndoorEnabled()
  {
    try
    {
      boolean bool = this.fX.isIndoorEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final boolean isMyLocationEnabled()
  {
    try
    {
      boolean bool = this.fX.isMyLocationEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final boolean isTrafficEnabled()
  {
    try
    {
      boolean bool = this.fX.isTrafficEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void moveCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.fX.moveCamera(paramCameraUpdate.aW());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final boolean setIndoorEnabled(boolean paramBoolean)
  {
    try
    {
      boolean bool = this.fX.setIndoorEnabled(paramBoolean);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void setInfoWindowAdapter(final InfoWindowAdapter paramInfoWindowAdapter)
  {
    if (paramInfoWindowAdapter == null) {}
    try
    {
      this.fX.setInfoWindowAdapter(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setInfoWindowAdapter(new d.a()
    {
      public b f(d paramAnonymousd)
      {
        return com.google.android.gms.dynamic.c.f(paramInfoWindowAdapter.getInfoWindow(new Marker(paramAnonymousd)));
      }
      
      public b g(d paramAnonymousd)
      {
        return com.google.android.gms.dynamic.c.f(paramInfoWindowAdapter.getInfoContents(new Marker(paramAnonymousd)));
      }
    });
  }
  
  public final void setLocationSource(final LocationSource paramLocationSource)
  {
    if (paramLocationSource == null) {}
    try
    {
      this.fX.setLocationSource(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setLocationSource(new ILocationSourceDelegate.a()
    {
      public void activate(final g paramAnonymousg)
      {
        paramLocationSource.activate(new LocationSource.OnLocationChangedListener()
        {
          public void onLocationChanged(Location paramAnonymous2Location)
          {
            try
            {
              paramAnonymousg.e(com.google.android.gms.dynamic.c.f(paramAnonymous2Location));
              return;
            }
            catch (RemoteException localRemoteException)
            {
              throw new RuntimeRemoteException(localRemoteException);
            }
          }
        });
      }
      
      public void deactivate()
      {
        paramLocationSource.deactivate();
      }
    });
  }
  
  public final void setMapType(int paramInt)
  {
    try
    {
      this.fX.setMapType(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void setMyLocationEnabled(boolean paramBoolean)
  {
    try
    {
      this.fX.setMyLocationEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void setOnCameraChangeListener(final OnCameraChangeListener paramOnCameraChangeListener)
  {
    if (paramOnCameraChangeListener == null) {}
    try
    {
      this.fX.setOnCameraChangeListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnCameraChangeListener(new e.a()
    {
      public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
      {
        paramOnCameraChangeListener.onCameraChange(paramAnonymousCameraPosition);
      }
    });
  }
  
  public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener paramOnInfoWindowClickListener)
  {
    if (paramOnInfoWindowClickListener == null) {}
    try
    {
      this.fX.setOnInfoWindowClickListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnInfoWindowClickListener(new f.a()
    {
      public void e(d paramAnonymousd)
      {
        paramOnInfoWindowClickListener.onInfoWindowClick(new Marker(paramAnonymousd));
      }
    });
  }
  
  public final void setOnMapClickListener(final OnMapClickListener paramOnMapClickListener)
  {
    if (paramOnMapClickListener == null) {}
    try
    {
      this.fX.setOnMapClickListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMapClickListener(new h.a()
    {
      public void onMapClick(LatLng paramAnonymousLatLng)
      {
        paramOnMapClickListener.onMapClick(paramAnonymousLatLng);
      }
    });
  }
  
  public final void setOnMapLongClickListener(final OnMapLongClickListener paramOnMapLongClickListener)
  {
    if (paramOnMapLongClickListener == null) {}
    try
    {
      this.fX.setOnMapLongClickListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMapLongClickListener(new i.a()
    {
      public void onMapLongClick(LatLng paramAnonymousLatLng)
      {
        paramOnMapLongClickListener.onMapLongClick(paramAnonymousLatLng);
      }
    });
  }
  
  public final void setOnMarkerClickListener(final OnMarkerClickListener paramOnMarkerClickListener)
  {
    if (paramOnMarkerClickListener == null) {}
    try
    {
      this.fX.setOnMarkerClickListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMarkerClickListener(new j.a()
    {
      public boolean a(d paramAnonymousd)
      {
        return paramOnMarkerClickListener.onMarkerClick(new Marker(paramAnonymousd));
      }
    });
  }
  
  public final void setOnMarkerDragListener(final OnMarkerDragListener paramOnMarkerDragListener)
  {
    if (paramOnMarkerDragListener == null) {}
    try
    {
      this.fX.setOnMarkerDragListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMarkerDragListener(new k.a()
    {
      public void b(d paramAnonymousd)
      {
        paramOnMarkerDragListener.onMarkerDragStart(new Marker(paramAnonymousd));
      }
      
      public void c(d paramAnonymousd)
      {
        paramOnMarkerDragListener.onMarkerDragEnd(new Marker(paramAnonymousd));
      }
      
      public void d(d paramAnonymousd)
      {
        paramOnMarkerDragListener.onMarkerDrag(new Marker(paramAnonymousd));
      }
    });
  }
  
  public final void setOnMyLocationButtonClickListener(final OnMyLocationButtonClickListener paramOnMyLocationButtonClickListener)
  {
    if (paramOnMyLocationButtonClickListener == null) {}
    try
    {
      this.fX.setOnMyLocationButtonClickListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMyLocationButtonClickListener(new l.a()
    {
      public boolean onMyLocationButtonClick()
        throws RemoteException
      {
        return paramOnMyLocationButtonClickListener.onMyLocationButtonClick();
      }
    });
  }
  
  @Deprecated
  public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener paramOnMyLocationChangeListener)
  {
    if (paramOnMyLocationChangeListener == null) {}
    try
    {
      this.fX.setOnMyLocationChangeListener(null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    this.fX.setOnMyLocationChangeListener(new m.a()
    {
      public void b(b paramAnonymousb)
      {
        paramOnMyLocationChangeListener.onMyLocationChange((Location)com.google.android.gms.dynamic.c.a(paramAnonymousb));
      }
    });
  }
  
  public final void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      this.fX.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void setTrafficEnabled(boolean paramBoolean)
  {
    try
    {
      this.fX.setTrafficEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public final void snapshot(SnapshotReadyCallback paramSnapshotReadyCallback)
  {
    snapshot(paramSnapshotReadyCallback, null);
  }
  
  public final void snapshot(final SnapshotReadyCallback paramSnapshotReadyCallback, Bitmap paramBitmap)
  {
    if (paramBitmap != null) {}
    for (b localb = com.google.android.gms.dynamic.c.f(paramBitmap);; localb = null)
    {
      com.google.android.gms.dynamic.c localc = (com.google.android.gms.dynamic.c)localb;
      try
      {
        this.fX.snapshot(new n.a()
        {
          public void onSnapshotReady(Bitmap paramAnonymousBitmap)
            throws RemoteException
          {
            paramSnapshotReadyCallback.onSnapshotReady(paramAnonymousBitmap);
          }
        }, localc);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }
  
  public final void stopAnimation()
  {
    try
    {
      this.fX.stopAnimation();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public static abstract interface CancelableCallback
  {
    public abstract void onCancel();
    
    public abstract void onFinish();
  }
  
  public static abstract interface InfoWindowAdapter
  {
    public abstract View getInfoContents(Marker paramMarker);
    
    public abstract View getInfoWindow(Marker paramMarker);
  }
  
  public static abstract interface OnCameraChangeListener
  {
    public abstract void onCameraChange(CameraPosition paramCameraPosition);
  }
  
  public static abstract interface OnInfoWindowClickListener
  {
    public abstract void onInfoWindowClick(Marker paramMarker);
  }
  
  public static abstract interface OnMapClickListener
  {
    public abstract void onMapClick(LatLng paramLatLng);
  }
  
  public static abstract interface OnMapLongClickListener
  {
    public abstract void onMapLongClick(LatLng paramLatLng);
  }
  
  public static abstract interface OnMarkerClickListener
  {
    public abstract boolean onMarkerClick(Marker paramMarker);
  }
  
  public static abstract interface OnMarkerDragListener
  {
    public abstract void onMarkerDrag(Marker paramMarker);
    
    public abstract void onMarkerDragEnd(Marker paramMarker);
    
    public abstract void onMarkerDragStart(Marker paramMarker);
  }
  
  public static abstract interface OnMyLocationButtonClickListener
  {
    public abstract boolean onMyLocationButtonClick();
  }
  
  @Deprecated
  public static abstract interface OnMyLocationChangeListener
  {
    public abstract void onMyLocationChange(Location paramLocation);
  }
  
  public static abstract interface SnapshotReadyCallback
  {
    public abstract void onSnapshotReady(Bitmap paramBitmap);
  }
  
  private static final class a
    extends b.a
  {
    private final GoogleMap.CancelableCallback gn;
    
    a(GoogleMap.CancelableCallback paramCancelableCallback)
    {
      this.gn = paramCancelableCallback;
    }
    
    public void onCancel()
    {
      this.gn.onCancel();
    }
    
    public void onFinish()
    {
      this.gn.onFinish();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/GoogleMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */