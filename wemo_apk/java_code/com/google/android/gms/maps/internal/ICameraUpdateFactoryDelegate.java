package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CameraPositionCreator;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.LatLngBoundsCreator;
import com.google.android.gms.maps.model.LatLngCreator;

public abstract interface ICameraUpdateFactoryDelegate
  extends IInterface
{
  public abstract b newCameraPosition(CameraPosition paramCameraPosition)
    throws RemoteException;
  
  public abstract b newLatLng(LatLng paramLatLng)
    throws RemoteException;
  
  public abstract b newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
    throws RemoteException;
  
  public abstract b newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;
  
  public abstract b newLatLngZoom(LatLng paramLatLng, float paramFloat)
    throws RemoteException;
  
  public abstract b scrollBy(float paramFloat1, float paramFloat2)
    throws RemoteException;
  
  public abstract b zoomBy(float paramFloat)
    throws RemoteException;
  
  public abstract b zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
    throws RemoteException;
  
  public abstract b zoomIn()
    throws RemoteException;
  
  public abstract b zoomOut()
    throws RemoteException;
  
  public abstract b zoomTo(float paramFloat)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements ICameraUpdateFactoryDelegate
  {
    public static ICameraUpdateFactoryDelegate t(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof ICameraUpdateFactoryDelegate))) {
        return (ICameraUpdateFactoryDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb11 = zoomIn();
        paramParcel2.writeNoException();
        IBinder localIBinder11 = null;
        if (localb11 != null) {
          localIBinder11 = localb11.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder11);
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb10 = zoomOut();
        paramParcel2.writeNoException();
        IBinder localIBinder10 = null;
        if (localb10 != null) {
          localIBinder10 = localb10.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder10);
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb9 = scrollBy(paramParcel1.readFloat(), paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder9 = null;
        if (localb9 != null) {
          localIBinder9 = localb9.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder9);
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb8 = zoomTo(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder8 = null;
        if (localb8 != null) {
          localIBinder8 = localb8.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder8);
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb7 = zoomBy(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder7 = null;
        if (localb7 != null) {
          localIBinder7 = localb7.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder7);
        return true;
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        b localb6 = zoomByWithFocus(paramParcel1.readFloat(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localb6 != null) {
          localIBinder6 = localb6.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (CameraPosition localCameraPosition = CameraPosition.CREATOR.createFromParcel(paramParcel1);; localCameraPosition = null)
        {
          b localb5 = newCameraPosition(localCameraPosition);
          paramParcel2.writeNoException();
          IBinder localIBinder5 = null;
          if (localb5 != null) {
            localIBinder5 = localb5.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder5);
          return true;
        }
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (LatLng localLatLng2 = LatLng.CREATOR.createFromParcel(paramParcel1);; localLatLng2 = null)
        {
          b localb4 = newLatLng(localLatLng2);
          paramParcel2.writeNoException();
          IBinder localIBinder4 = null;
          if (localb4 != null) {
            localIBinder4 = localb4.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder4);
          return true;
        }
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (LatLng localLatLng1 = LatLng.CREATOR.createFromParcel(paramParcel1);; localLatLng1 = null)
        {
          b localb3 = newLatLngZoom(localLatLng1, paramParcel1.readFloat());
          paramParcel2.writeNoException();
          IBinder localIBinder3 = null;
          if (localb3 != null) {
            localIBinder3 = localb3.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder3);
          return true;
        }
      case 10: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (LatLngBounds localLatLngBounds2 = LatLngBounds.CREATOR.createFromParcel(paramParcel1);; localLatLngBounds2 = null)
        {
          b localb2 = newLatLngBounds(localLatLngBounds2, paramParcel1.readInt());
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localb2 != null) {
            localIBinder2 = localb2.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (LatLngBounds localLatLngBounds1 = LatLngBounds.CREATOR.createFromParcel(paramParcel1);; localLatLngBounds1 = null)
      {
        b localb1 = newLatLngBoundsWithSize(localLatLngBounds1, paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localb1 != null) {
          localIBinder1 = localb1.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      }
    }
    
    private static class a
      implements ICameraUpdateFactoryDelegate
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      /* Error */
      public b newCameraPosition(CameraPosition paramCameraPosition)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 29
        //   11: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 43	com/google/android/gms/maps/model/CameraPosition:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 7
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 49 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 52	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 64	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 64	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 64	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 64	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramCameraPosition	CameraPosition
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localb	b
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public b newLatLng(LatLng paramLatLng)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 29
        //   11: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +53 -> 68
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 69	com/google/android/gms/maps/model/LatLng:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 8
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 49 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 52	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   52: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   55: astore 6
        //   57: aload_3
        //   58: invokevirtual 64	android/os/Parcel:recycle	()V
        //   61: aload_2
        //   62: invokevirtual 64	android/os/Parcel:recycle	()V
        //   65: aload 6
        //   67: areturn
        //   68: aload_2
        //   69: iconst_0
        //   70: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   73: goto -44 -> 29
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 64	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 64	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramLatLng	LatLng
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   55	11	6	localb	b
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	29	76	finally
        //   29	57	76	finally
        //   68	73	76	finally
      }
      
      /* Error */
      public b newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 29
        //   12: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +62 -> 78
        //   19: aload_3
        //   20: iconst_1
        //   21: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   24: aload_1
        //   25: aload_3
        //   26: iconst_0
        //   27: invokevirtual 74	com/google/android/gms/maps/model/LatLngBounds:writeToParcel	(Landroid/os/Parcel;I)V
        //   30: aload_3
        //   31: iload_2
        //   32: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate$a$a:a	Landroid/os/IBinder;
        //   39: bipush 10
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 49 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 52	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   61: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   64: astore 7
        //   66: aload 4
        //   68: invokevirtual 64	android/os/Parcel:recycle	()V
        //   71: aload_3
        //   72: invokevirtual 64	android/os/Parcel:recycle	()V
        //   75: aload 7
        //   77: areturn
        //   78: aload_3
        //   79: iconst_0
        //   80: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   83: goto -53 -> 30
        //   86: astore 5
        //   88: aload 4
        //   90: invokevirtual 64	android/os/Parcel:recycle	()V
        //   93: aload_3
        //   94: invokevirtual 64	android/os/Parcel:recycle	()V
        //   97: aload 5
        //   99: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	100	0	this	a
        //   0	100	1	paramLatLngBounds	LatLngBounds
        //   0	100	2	paramInt	int
        //   3	91	3	localParcel1	Parcel
        //   7	82	4	localParcel2	Parcel
        //   86	12	5	localObject	Object
        //   64	12	7	localb	b
        // Exception table:
        //   from	to	target	type
        //   9	15	86	finally
        //   19	30	86	finally
        //   30	66	86	finally
        //   78	83	86	finally
      }
      
      /* Error */
      public b newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 5
        //   5: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 6
        //   10: aload 5
        //   12: ldc 29
        //   14: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +80 -> 98
        //   21: aload 5
        //   23: iconst_1
        //   24: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   27: aload_1
        //   28: aload 5
        //   30: iconst_0
        //   31: invokevirtual 74	com/google/android/gms/maps/model/LatLngBounds:writeToParcel	(Landroid/os/Parcel;I)V
        //   34: aload 5
        //   36: iload_2
        //   37: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   40: aload 5
        //   42: iload_3
        //   43: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   46: aload 5
        //   48: iload 4
        //   50: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   53: aload_0
        //   54: getfield 15	com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate$a$a:a	Landroid/os/IBinder;
        //   57: bipush 11
        //   59: aload 5
        //   61: aload 6
        //   63: iconst_0
        //   64: invokeinterface 49 5 0
        //   69: pop
        //   70: aload 6
        //   72: invokevirtual 52	android/os/Parcel:readException	()V
        //   75: aload 6
        //   77: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   80: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   83: astore 9
        //   85: aload 6
        //   87: invokevirtual 64	android/os/Parcel:recycle	()V
        //   90: aload 5
        //   92: invokevirtual 64	android/os/Parcel:recycle	()V
        //   95: aload 9
        //   97: areturn
        //   98: aload 5
        //   100: iconst_0
        //   101: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   104: goto -70 -> 34
        //   107: astore 7
        //   109: aload 6
        //   111: invokevirtual 64	android/os/Parcel:recycle	()V
        //   114: aload 5
        //   116: invokevirtual 64	android/os/Parcel:recycle	()V
        //   119: aload 7
        //   121: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	122	0	this	a
        //   0	122	1	paramLatLngBounds	LatLngBounds
        //   0	122	2	paramInt1	int
        //   0	122	3	paramInt2	int
        //   0	122	4	paramInt3	int
        //   3	112	5	localParcel1	Parcel
        //   8	102	6	localParcel2	Parcel
        //   107	13	7	localObject	Object
        //   83	13	9	localb	b
        // Exception table:
        //   from	to	target	type
        //   10	17	107	finally
        //   21	34	107	finally
        //   34	85	107	finally
        //   98	104	107	finally
      }
      
      /* Error */
      public b newLatLngZoom(LatLng paramLatLng, float paramFloat)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 29
        //   12: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +62 -> 78
        //   19: aload_3
        //   20: iconst_1
        //   21: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   24: aload_1
        //   25: aload_3
        //   26: iconst_0
        //   27: invokevirtual 69	com/google/android/gms/maps/model/LatLng:writeToParcel	(Landroid/os/Parcel;I)V
        //   30: aload_3
        //   31: fload_2
        //   32: invokevirtual 82	android/os/Parcel:writeFloat	(F)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate$a$a:a	Landroid/os/IBinder;
        //   39: bipush 9
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 49 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 52	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   61: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   64: astore 7
        //   66: aload 4
        //   68: invokevirtual 64	android/os/Parcel:recycle	()V
        //   71: aload_3
        //   72: invokevirtual 64	android/os/Parcel:recycle	()V
        //   75: aload 7
        //   77: areturn
        //   78: aload_3
        //   79: iconst_0
        //   80: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   83: goto -53 -> 30
        //   86: astore 5
        //   88: aload 4
        //   90: invokevirtual 64	android/os/Parcel:recycle	()V
        //   93: aload_3
        //   94: invokevirtual 64	android/os/Parcel:recycle	()V
        //   97: aload 5
        //   99: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	100	0	this	a
        //   0	100	1	paramLatLng	LatLng
        //   0	100	2	paramFloat	float
        //   3	91	3	localParcel1	Parcel
        //   7	82	4	localParcel2	Parcel
        //   86	12	5	localObject	Object
        //   64	12	7	localb	b
        // Exception table:
        //   from	to	target	type
        //   9	15	86	finally
        //   19	30	86	finally
        //   30	66	86	finally
        //   78	83	86	finally
      }
      
      public b scrollBy(float paramFloat1, float paramFloat2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat1);
          localParcel1.writeFloat(paramFloat2);
          this.a.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public b zoomBy(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          this.a.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public b zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          this.a.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public b zoomIn()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          this.a.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public b zoomOut()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          this.a.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public b zoomTo(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          this.a.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          b localb = b.a.l(localParcel2.readStrongBinder());
          return localb;
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/ICameraUpdateFactoryDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */