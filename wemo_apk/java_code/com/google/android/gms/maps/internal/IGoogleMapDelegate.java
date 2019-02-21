package com.google.android.gms.maps.internal;

import android.location.Location;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.CircleOptionsCreator;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.GroundOverlayOptionsCreator;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.MarkerOptionsCreator;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.PolygonOptionsCreator;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.PolylineOptionsCreator;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.TileOverlayOptionsCreator;
import com.google.android.gms.maps.model.internal.IPolylineDelegate;
import com.google.android.gms.maps.model.internal.c;

public abstract interface IGoogleMapDelegate
  extends IInterface
{
  public abstract com.google.android.gms.maps.model.internal.b addCircle(CircleOptions paramCircleOptions)
    throws RemoteException;
  
  public abstract c addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
    throws RemoteException;
  
  public abstract com.google.android.gms.maps.model.internal.d addMarker(MarkerOptions paramMarkerOptions)
    throws RemoteException;
  
  public abstract com.google.android.gms.maps.model.internal.e addPolygon(PolygonOptions paramPolygonOptions)
    throws RemoteException;
  
  public abstract IPolylineDelegate addPolyline(PolylineOptions paramPolylineOptions)
    throws RemoteException;
  
  public abstract com.google.android.gms.maps.model.internal.f addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
    throws RemoteException;
  
  public abstract void animateCamera(com.google.android.gms.dynamic.b paramb)
    throws RemoteException;
  
  public abstract void animateCameraWithCallback(com.google.android.gms.dynamic.b paramb, b paramb1)
    throws RemoteException;
  
  public abstract void animateCameraWithDurationAndCallback(com.google.android.gms.dynamic.b paramb, int paramInt, b paramb1)
    throws RemoteException;
  
  public abstract void clear()
    throws RemoteException;
  
  public abstract CameraPosition getCameraPosition()
    throws RemoteException;
  
  public abstract int getMapType()
    throws RemoteException;
  
  public abstract float getMaxZoomLevel()
    throws RemoteException;
  
  public abstract float getMinZoomLevel()
    throws RemoteException;
  
  public abstract Location getMyLocation()
    throws RemoteException;
  
  public abstract IProjectionDelegate getProjection()
    throws RemoteException;
  
  public abstract com.google.android.gms.dynamic.b getTestingHelper()
    throws RemoteException;
  
  public abstract IUiSettingsDelegate getUiSettings()
    throws RemoteException;
  
  public abstract boolean isIndoorEnabled()
    throws RemoteException;
  
  public abstract boolean isMyLocationEnabled()
    throws RemoteException;
  
  public abstract boolean isTrafficEnabled()
    throws RemoteException;
  
  public abstract void moveCamera(com.google.android.gms.dynamic.b paramb)
    throws RemoteException;
  
  public abstract boolean setIndoorEnabled(boolean paramBoolean)
    throws RemoteException;
  
  public abstract void setInfoWindowAdapter(d paramd)
    throws RemoteException;
  
  public abstract void setLocationSource(ILocationSourceDelegate paramILocationSourceDelegate)
    throws RemoteException;
  
  public abstract void setMapType(int paramInt)
    throws RemoteException;
  
  public abstract void setMyLocationEnabled(boolean paramBoolean)
    throws RemoteException;
  
  public abstract void setOnCameraChangeListener(e parame)
    throws RemoteException;
  
  public abstract void setOnInfoWindowClickListener(f paramf)
    throws RemoteException;
  
  public abstract void setOnMapClickListener(h paramh)
    throws RemoteException;
  
  public abstract void setOnMapLongClickListener(i parami)
    throws RemoteException;
  
  public abstract void setOnMarkerClickListener(j paramj)
    throws RemoteException;
  
  public abstract void setOnMarkerDragListener(k paramk)
    throws RemoteException;
  
  public abstract void setOnMyLocationButtonClickListener(l paraml)
    throws RemoteException;
  
  public abstract void setOnMyLocationChangeListener(m paramm)
    throws RemoteException;
  
  public abstract void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws RemoteException;
  
  public abstract void setTrafficEnabled(boolean paramBoolean)
    throws RemoteException;
  
  public abstract void snapshot(n paramn, com.google.android.gms.dynamic.b paramb)
    throws RemoteException;
  
  public abstract void stopAnimation()
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements IGoogleMapDelegate
  {
    public static IGoogleMapDelegate w(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof IGoogleMapDelegate))) {
        return (IGoogleMapDelegate)localIInterface;
      }
      return new a(paramIBinder);
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        CameraPosition localCameraPosition = getCameraPosition();
        paramParcel2.writeNoException();
        if (localCameraPosition != null)
        {
          paramParcel2.writeInt(1);
          localCameraPosition.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        float f2 = getMaxZoomLevel();
        paramParcel2.writeNoException();
        paramParcel2.writeFloat(f2);
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        float f1 = getMinZoomLevel();
        paramParcel2.writeNoException();
        paramParcel2.writeFloat(f1);
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        moveCamera(com.google.android.gms.dynamic.b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        animateCamera(com.google.android.gms.dynamic.b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        animateCameraWithCallback(com.google.android.gms.dynamic.b.a.l(paramParcel1.readStrongBinder()), b.a.u(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        animateCameraWithDurationAndCallback(com.google.android.gms.dynamic.b.a.l(paramParcel1.readStrongBinder()), paramParcel1.readInt(), b.a.u(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        stopAnimation();
        paramParcel2.writeNoException();
        return true;
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (PolylineOptions localPolylineOptions = PolylineOptions.CREATOR.createFromParcel(paramParcel1);; localPolylineOptions = null)
        {
          IPolylineDelegate localIPolylineDelegate = addPolyline(localPolylineOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder9 = null;
          if (localIPolylineDelegate != null) {
            localIBinder9 = localIPolylineDelegate.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder9);
          return true;
        }
      case 10: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (PolygonOptions localPolygonOptions = PolygonOptions.CREATOR.createFromParcel(paramParcel1);; localPolygonOptions = null)
        {
          com.google.android.gms.maps.model.internal.e locale = addPolygon(localPolygonOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder8 = null;
          if (locale != null) {
            localIBinder8 = locale.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder8);
          return true;
        }
      case 11: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (MarkerOptions localMarkerOptions = MarkerOptions.CREATOR.createFromParcel(paramParcel1);; localMarkerOptions = null)
        {
          com.google.android.gms.maps.model.internal.d locald = addMarker(localMarkerOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder7 = null;
          if (locald != null) {
            localIBinder7 = locald.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder7);
          return true;
        }
      case 12: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (GroundOverlayOptions localGroundOverlayOptions = GroundOverlayOptions.CREATOR.createFromParcel(paramParcel1);; localGroundOverlayOptions = null)
        {
          c localc = addGroundOverlay(localGroundOverlayOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder6 = null;
          if (localc != null) {
            localIBinder6 = localc.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder6);
          return true;
        }
      case 13: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (TileOverlayOptions localTileOverlayOptions = TileOverlayOptions.CREATOR.createFromParcel(paramParcel1);; localTileOverlayOptions = null)
        {
          com.google.android.gms.maps.model.internal.f localf = addTileOverlay(localTileOverlayOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder5 = null;
          if (localf != null) {
            localIBinder5 = localf.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder5);
          return true;
        }
      case 14: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        clear();
        paramParcel2.writeNoException();
        return true;
      case 15: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        int i2 = getMapType();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i2);
        return true;
      case 16: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setMapType(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 17: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        boolean bool7 = isTrafficEnabled();
        paramParcel2.writeNoException();
        int i1 = 0;
        if (bool7) {
          i1 = 1;
        }
        paramParcel2.writeInt(i1);
        return true;
      case 18: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        int n = paramParcel1.readInt();
        boolean bool6 = false;
        if (n != 0) {
          bool6 = true;
        }
        setTrafficEnabled(bool6);
        paramParcel2.writeNoException();
        return true;
      case 19: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        boolean bool5 = isIndoorEnabled();
        paramParcel2.writeNoException();
        int m = 0;
        if (bool5) {
          m = 1;
        }
        paramParcel2.writeInt(m);
        return true;
      case 20: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (boolean bool3 = true;; bool3 = false)
        {
          boolean bool4 = setIndoorEnabled(bool3);
          paramParcel2.writeNoException();
          int k = 0;
          if (bool4) {
            k = 1;
          }
          paramParcel2.writeInt(k);
          return true;
        }
      case 21: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        boolean bool2 = isMyLocationEnabled();
        paramParcel2.writeNoException();
        int j = 0;
        if (bool2) {
          j = 1;
        }
        paramParcel2.writeInt(j);
        return true;
      case 22: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        int i = paramParcel1.readInt();
        boolean bool1 = false;
        if (i != 0) {
          bool1 = true;
        }
        setMyLocationEnabled(bool1);
        paramParcel2.writeNoException();
        return true;
      case 23: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        Location localLocation = getMyLocation();
        paramParcel2.writeNoException();
        if (localLocation != null)
        {
          paramParcel2.writeInt(1);
          localLocation.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 24: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setLocationSource(ILocationSourceDelegate.a.y(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 25: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        IUiSettingsDelegate localIUiSettingsDelegate = getUiSettings();
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localIUiSettingsDelegate != null) {
          localIBinder4 = localIUiSettingsDelegate.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 26: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        IProjectionDelegate localIProjectionDelegate = getProjection();
        paramParcel2.writeNoException();
        IBinder localIBinder3 = null;
        if (localIProjectionDelegate != null) {
          localIBinder3 = localIProjectionDelegate.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder3);
        return true;
      case 27: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnCameraChangeListener(e.a.B(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 28: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMapClickListener(h.a.E(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 29: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMapLongClickListener(i.a.F(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 30: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMarkerClickListener(j.a.G(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 31: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMarkerDragListener(k.a.H(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 32: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnInfoWindowClickListener(f.a.C(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 33: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setInfoWindowAdapter(d.a.x(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 34: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        com.google.android.gms.dynamic.b localb1 = getTestingHelper();
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localb1 != null) {
          localIBinder2 = localb1.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 35: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (CircleOptions localCircleOptions = CircleOptions.CREATOR.createFromParcel(paramParcel1);; localCircleOptions = null)
        {
          com.google.android.gms.maps.model.internal.b localb = addCircle(localCircleOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder1 = null;
          if (localb != null) {
            localIBinder1 = localb.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder1);
          return true;
        }
      case 36: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMyLocationChangeListener(m.a.J(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 37: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        setOnMyLocationButtonClickListener(l.a.I(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 38: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        snapshot(n.a.L(paramParcel1.readStrongBinder()), com.google.android.gms.dynamic.b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setPadding(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class a
      implements IGoogleMapDelegate
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public com.google.android.gms.maps.model.internal.b addCircle(CircleOptions paramCircleOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 41	com/google/android/gms/maps/model/CircleOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 35
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 60	com/google/android/gms/maps/model/internal/b$a:O	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/b;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramCircleOptions	CircleOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localb	com.google.android.gms.maps.model.internal.b
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public c addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 68	com/google/android/gms/maps/model/GroundOverlayOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 12
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 74	com/google/android/gms/maps/model/internal/c$a:P	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/c;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramGroundOverlayOptions	GroundOverlayOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localc	c
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public com.google.android.gms.maps.model.internal.d addMarker(MarkerOptions paramMarkerOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 79	com/google/android/gms/maps/model/MarkerOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 11
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 85	com/google/android/gms/maps/model/internal/d$a:Q	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/d;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramMarkerOptions	MarkerOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	locald	com.google.android.gms.maps.model.internal.d
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public com.google.android.gms.maps.model.internal.e addPolygon(PolygonOptions paramPolygonOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 90	com/google/android/gms/maps/model/PolygonOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 10
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 96	com/google/android/gms/maps/model/internal/e$a:R	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/e;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramPolygonOptions	PolygonOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	locale	com.google.android.gms.maps.model.internal.e
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public IPolylineDelegate addPolyline(PolylineOptions paramPolylineOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 101	com/google/android/gms/maps/model/PolylineOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 9
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 107	com/google/android/gms/maps/model/internal/IPolylineDelegate$a:S	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/IPolylineDelegate;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramPolylineOptions	PolylineOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localIPolylineDelegate	IPolylineDelegate
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public com.google.android.gms.maps.model.internal.f addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 112	com/google/android/gms/maps/model/TileOverlayOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 13
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 47 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 50	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 54	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 118	com/google/android/gms/maps/model/internal/f$a:T	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/f;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 63	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 63	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 63	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 63	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramTileOverlayOptions	TileOverlayOptions
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localf	com.google.android.gms.maps.model.internal.f
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public void animateCamera(com.google.android.gms.dynamic.b paramb)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +44 -> 59
        //   18: aload_1
        //   19: invokeinterface 125 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: iconst_5
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 47 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 50	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 63	android/os/Parcel:recycle	()V
        //   54: aload_2
        //   55: invokevirtual 63	android/os/Parcel:recycle	()V
        //   58: return
        //   59: aconst_null
        //   60: astore 5
        //   62: goto -36 -> 26
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 63	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 63	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	a
        //   0	78	1	paramb	com.google.android.gms.dynamic.b
        //   3	69	2	localParcel1	Parcel
        //   7	61	3	localParcel2	Parcel
        //   65	11	4	localObject	Object
        //   24	37	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	26	65	finally
        //   26	50	65	finally
      }
      
      /* Error */
      public void animateCameraWithCallback(com.google.android.gms.dynamic.b paramb, b paramb1)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +69 -> 85
        //   19: aload_1
        //   20: invokeinterface 125 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aconst_null
        //   34: astore 7
        //   36: aload_2
        //   37: ifnull +11 -> 48
        //   40: aload_2
        //   41: invokeinterface 133 1 0
        //   46: astore 7
        //   48: aload_3
        //   49: aload 7
        //   51: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   54: aload_0
        //   55: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   58: bipush 6
        //   60: aload_3
        //   61: aload 4
        //   63: iconst_0
        //   64: invokeinterface 47 5 0
        //   69: pop
        //   70: aload 4
        //   72: invokevirtual 50	android/os/Parcel:readException	()V
        //   75: aload 4
        //   77: invokevirtual 63	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: invokevirtual 63	android/os/Parcel:recycle	()V
        //   84: return
        //   85: aconst_null
        //   86: astore 6
        //   88: goto -61 -> 27
        //   91: astore 5
        //   93: aload 4
        //   95: invokevirtual 63	android/os/Parcel:recycle	()V
        //   98: aload_3
        //   99: invokevirtual 63	android/os/Parcel:recycle	()V
        //   102: aload 5
        //   104: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	105	0	this	a
        //   0	105	1	paramb	com.google.android.gms.dynamic.b
        //   0	105	2	paramb1	b
        //   3	96	3	localParcel1	Parcel
        //   7	87	4	localParcel2	Parcel
        //   91	12	5	localObject	Object
        //   25	62	6	localIBinder1	IBinder
        //   34	16	7	localIBinder2	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	91	finally
        //   19	27	91	finally
        //   27	33	91	finally
        //   40	48	91	finally
        //   48	75	91	finally
      }
      
      /* Error */
      public void animateCameraWithDurationAndCallback(com.google.android.gms.dynamic.b paramb, int paramInt, b paramb1)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 27
        //   14: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +79 -> 97
        //   21: aload_1
        //   22: invokeinterface 125 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: iload_2
        //   39: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   42: aconst_null
        //   43: astore 8
        //   45: aload_3
        //   46: ifnull +11 -> 57
        //   49: aload_3
        //   50: invokeinterface 133 1 0
        //   55: astore 8
        //   57: aload 4
        //   59: aload 8
        //   61: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   64: aload_0
        //   65: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   68: bipush 7
        //   70: aload 4
        //   72: aload 5
        //   74: iconst_0
        //   75: invokeinterface 47 5 0
        //   80: pop
        //   81: aload 5
        //   83: invokevirtual 50	android/os/Parcel:readException	()V
        //   86: aload 5
        //   88: invokevirtual 63	android/os/Parcel:recycle	()V
        //   91: aload 4
        //   93: invokevirtual 63	android/os/Parcel:recycle	()V
        //   96: return
        //   97: aconst_null
        //   98: astore 7
        //   100: goto -71 -> 29
        //   103: astore 6
        //   105: aload 5
        //   107: invokevirtual 63	android/os/Parcel:recycle	()V
        //   110: aload 4
        //   112: invokevirtual 63	android/os/Parcel:recycle	()V
        //   115: aload 6
        //   117: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	118	0	this	a
        //   0	118	1	paramb	com.google.android.gms.dynamic.b
        //   0	118	2	paramInt	int
        //   0	118	3	paramb1	b
        //   3	108	4	localParcel1	Parcel
        //   8	98	5	localParcel2	Parcel
        //   103	13	6	localObject	Object
        //   27	72	7	localIBinder1	IBinder
        //   43	17	8	localIBinder2	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	103	finally
        //   21	29	103	finally
        //   29	42	103	finally
        //   49	57	103	finally
        //   57	86	103	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      public void clear()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(14, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public CameraPosition getCameraPosition()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   18: iconst_1
        //   19: aload_1
        //   20: aload_2
        //   21: iconst_0
        //   22: invokeinterface 47 5 0
        //   27: pop
        //   28: aload_2
        //   29: invokevirtual 50	android/os/Parcel:readException	()V
        //   32: aload_2
        //   33: invokevirtual 142	android/os/Parcel:readInt	()I
        //   36: ifeq +27 -> 63
        //   39: getstatic 148	com/google/android/gms/maps/model/CameraPosition:CREATOR	Lcom/google/android/gms/maps/model/CameraPositionCreator;
        //   42: aload_2
        //   43: invokevirtual 154	com/google/android/gms/maps/model/CameraPositionCreator:createFromParcel	(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/CameraPosition;
        //   46: astore 6
        //   48: aload 6
        //   50: astore 5
        //   52: aload_2
        //   53: invokevirtual 63	android/os/Parcel:recycle	()V
        //   56: aload_1
        //   57: invokevirtual 63	android/os/Parcel:recycle	()V
        //   60: aload 5
        //   62: areturn
        //   63: aconst_null
        //   64: astore 5
        //   66: goto -14 -> 52
        //   69: astore_3
        //   70: aload_2
        //   71: invokevirtual 63	android/os/Parcel:recycle	()V
        //   74: aload_1
        //   75: invokevirtual 63	android/os/Parcel:recycle	()V
        //   78: aload_3
        //   79: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	80	0	this	a
        //   3	72	1	localParcel1	Parcel
        //   7	64	2	localParcel2	Parcel
        //   69	10	3	localObject	Object
        //   50	15	5	localCameraPosition1	CameraPosition
        //   46	3	6	localCameraPosition2	CameraPosition
        // Exception table:
        //   from	to	target	type
        //   8	48	69	finally
      }
      
      public int getMapType()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(15, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public float getMaxZoomLevel()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          float f = localParcel2.readFloat();
          return f;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public float getMinZoomLevel()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          float f = localParcel2.readFloat();
          return f;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public Location getMyLocation()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   18: bipush 23
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 47 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 50	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 142	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 168	android/location/Location:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 173 2 0
        //   49: checkcast 165	android/location/Location
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 63	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 63	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 63	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	a
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localLocation	Location
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public IProjectionDelegate getProjection()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(26, localParcel1, localParcel2, 0);
          localParcel2.readException();
          IProjectionDelegate localIProjectionDelegate = IProjectionDelegate.a.K(localParcel2.readStrongBinder());
          return localIProjectionDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public com.google.android.gms.dynamic.b getTestingHelper()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(34, localParcel1, localParcel2, 0);
          localParcel2.readException();
          com.google.android.gms.dynamic.b localb = com.google.android.gms.dynamic.b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public IUiSettingsDelegate getUiSettings()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(25, localParcel1, localParcel2, 0);
          localParcel2.readException();
          IUiSettingsDelegate localIUiSettingsDelegate = IUiSettingsDelegate.a.M(localParcel2.readStrongBinder());
          return localIUiSettingsDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public boolean isIndoorEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(19, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0) {
            bool = true;
          }
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public boolean isMyLocationEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(21, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0) {
            bool = true;
          }
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public boolean isTrafficEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(17, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0) {
            bool = true;
          }
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void moveCamera(com.google.android.gms.dynamic.b paramb)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +44 -> 59
        //   18: aload_1
        //   19: invokeinterface 125 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: iconst_4
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 47 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 50	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 63	android/os/Parcel:recycle	()V
        //   54: aload_2
        //   55: invokevirtual 63	android/os/Parcel:recycle	()V
        //   58: return
        //   59: aconst_null
        //   60: astore 5
        //   62: goto -36 -> 26
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 63	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 63	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	a
        //   0	78	1	paramb	com.google.android.gms.dynamic.b
        //   3	69	2	localParcel1	Parcel
        //   7	61	3	localParcel2	Parcel
        //   65	11	4	localObject	Object
        //   24	37	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	26	65	finally
        //   26	50	65	finally
      }
      
      /* Error */
      public boolean setIndoorEnabled(boolean paramBoolean)
        throws RemoteException
      {
        // Byte code:
        //   0: iconst_1
        //   1: istore_2
        //   2: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   5: astore_3
        //   6: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   9: astore 4
        //   11: aload_3
        //   12: ldc 27
        //   14: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: iload_1
        //   18: ifeq +56 -> 74
        //   21: iload_2
        //   22: istore 6
        //   24: aload_3
        //   25: iload 6
        //   27: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   30: aload_0
        //   31: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   34: bipush 20
        //   36: aload_3
        //   37: aload 4
        //   39: iconst_0
        //   40: invokeinterface 47 5 0
        //   45: pop
        //   46: aload 4
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload 4
        //   53: invokevirtual 142	android/os/Parcel:readInt	()I
        //   56: istore 8
        //   58: iload 8
        //   60: ifeq +20 -> 80
        //   63: aload 4
        //   65: invokevirtual 63	android/os/Parcel:recycle	()V
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: iload_2
        //   73: ireturn
        //   74: iconst_0
        //   75: istore 6
        //   77: goto -53 -> 24
        //   80: iconst_0
        //   81: istore_2
        //   82: goto -19 -> 63
        //   85: astore 5
        //   87: aload 4
        //   89: invokevirtual 63	android/os/Parcel:recycle	()V
        //   92: aload_3
        //   93: invokevirtual 63	android/os/Parcel:recycle	()V
        //   96: aload 5
        //   98: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	99	0	this	a
        //   0	99	1	paramBoolean	boolean
        //   1	81	2	i	int
        //   5	88	3	localParcel1	Parcel
        //   9	79	4	localParcel2	Parcel
        //   85	12	5	localObject	Object
        //   22	4	6	j	int
        //   75	1	6	k	int
        //   56	3	8	m	int
        // Exception table:
        //   from	to	target	type
        //   11	17	85	finally
        //   24	58	85	finally
      }
      
      /* Error */
      public void setInfoWindowAdapter(d paramd)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 209 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 33
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramd	d
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setLocationSource(ILocationSourceDelegate paramILocationSourceDelegate)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 214 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 24
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramILocationSourceDelegate	ILocationSourceDelegate
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      public void setMapType(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          localParcel1.writeInt(paramInt);
          this.a.transact(16, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void setMyLocationEnabled(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          int i = 0;
          if (paramBoolean) {
            i = 1;
          }
          localParcel1.writeInt(i);
          this.a.transact(22, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void setOnCameraChangeListener(e parame)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 222 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 27
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parame	e
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnInfoWindowClickListener(f paramf)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 227 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 32
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramf	f
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMapClickListener(h paramh)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 232 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 28
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramh	h
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMapLongClickListener(i parami)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 237 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 29
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parami	i
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMarkerClickListener(j paramj)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 242 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 30
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramj	j
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMarkerDragListener(k paramk)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 247 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 31
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramk	k
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMyLocationButtonClickListener(l paraml)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 252 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 37
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paraml	l
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void setOnMyLocationChangeListener(m paramm)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 257 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   36: bipush 36
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 47 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 50	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 63	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 63	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 63	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 63	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramm	m
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeInt(paramInt3);
          localParcel1.writeInt(paramInt4);
          this.a.transact(39, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void setTrafficEnabled(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          int i = 0;
          if (paramBoolean) {
            i = 1;
          }
          localParcel1.writeInt(i);
          this.a.transact(18, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void snapshot(n paramn, com.google.android.gms.dynamic.b paramb)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +69 -> 85
        //   19: aload_1
        //   20: invokeinterface 265 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aconst_null
        //   34: astore 7
        //   36: aload_2
        //   37: ifnull +11 -> 48
        //   40: aload_2
        //   41: invokeinterface 125 1 0
        //   46: astore 7
        //   48: aload_3
        //   49: aload 7
        //   51: invokevirtual 128	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   54: aload_0
        //   55: getfield 15	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:a	Landroid/os/IBinder;
        //   58: bipush 38
        //   60: aload_3
        //   61: aload 4
        //   63: iconst_0
        //   64: invokeinterface 47 5 0
        //   69: pop
        //   70: aload 4
        //   72: invokevirtual 50	android/os/Parcel:readException	()V
        //   75: aload 4
        //   77: invokevirtual 63	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: invokevirtual 63	android/os/Parcel:recycle	()V
        //   84: return
        //   85: aconst_null
        //   86: astore 6
        //   88: goto -61 -> 27
        //   91: astore 5
        //   93: aload 4
        //   95: invokevirtual 63	android/os/Parcel:recycle	()V
        //   98: aload_3
        //   99: invokevirtual 63	android/os/Parcel:recycle	()V
        //   102: aload 5
        //   104: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	105	0	this	a
        //   0	105	1	paramn	n
        //   0	105	2	paramb	com.google.android.gms.dynamic.b
        //   3	96	3	localParcel1	Parcel
        //   7	87	4	localParcel2	Parcel
        //   91	12	5	localObject	Object
        //   25	62	6	localIBinder1	IBinder
        //   34	16	7	localIBinder2	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	91	finally
        //   19	27	91	finally
        //   27	33	91	finally
        //   40	48	91	finally
        //   48	75	91	finally
      }
      
      public void stopAnimation()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          this.a.transact(8, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/IGoogleMapDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */