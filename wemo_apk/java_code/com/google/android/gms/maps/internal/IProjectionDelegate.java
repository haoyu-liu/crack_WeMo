package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngCreator;
import com.google.android.gms.maps.model.VisibleRegion;

public abstract interface IProjectionDelegate
  extends IInterface
{
  public abstract LatLng fromScreenLocation(b paramb)
    throws RemoteException;
  
  public abstract VisibleRegion getVisibleRegion()
    throws RemoteException;
  
  public abstract b toScreenLocation(LatLng paramLatLng)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements IProjectionDelegate
  {
    public static IProjectionDelegate K(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof IProjectionDelegate))) {
        return (IProjectionDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IProjectionDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        LatLng localLatLng2 = fromScreenLocation(b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        if (localLatLng2 != null)
        {
          paramParcel2.writeInt(1);
          localLatLng2.writeToParcel(paramParcel2, 1);
        }
        for (;;)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (LatLng localLatLng1 = LatLng.CREATOR.createFromParcel(paramParcel1);; localLatLng1 = null)
        {
          b localb = toScreenLocation(localLatLng1);
          paramParcel2.writeNoException();
          IBinder localIBinder = null;
          if (localb != null) {
            localIBinder = localb.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder);
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
      VisibleRegion localVisibleRegion = getVisibleRegion();
      paramParcel2.writeNoException();
      if (localVisibleRegion != null)
      {
        paramParcel2.writeInt(1);
        localVisibleRegion.writeToParcel(paramParcel2, 1);
      }
      for (;;)
      {
        return true;
        paramParcel2.writeInt(0);
      }
    }
    
    private static class a
      implements IProjectionDelegate
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
      public LatLng fromScreenLocation(b paramb)
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
        //   15: ifnull +73 -> 88
        //   18: aload_1
        //   19: invokeinterface 37 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 40	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/IProjectionDelegate$a$a:a	Landroid/os/IBinder;
        //   36: iconst_1
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 46 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 49	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 53	android/os/Parcel:readInt	()I
        //   54: istore 7
        //   56: aconst_null
        //   57: astore 8
        //   59: iload 7
        //   61: ifeq +16 -> 77
        //   64: getstatic 59	com/google/android/gms/maps/model/LatLng:CREATOR	Lcom/google/android/gms/maps/model/LatLngCreator;
        //   67: aload_3
        //   68: invokevirtual 65	com/google/android/gms/maps/model/LatLngCreator:createFromParcel	(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLng;
        //   71: astore 9
        //   73: aload 9
        //   75: astore 8
        //   77: aload_3
        //   78: invokevirtual 68	android/os/Parcel:recycle	()V
        //   81: aload_2
        //   82: invokevirtual 68	android/os/Parcel:recycle	()V
        //   85: aload 8
        //   87: areturn
        //   88: aconst_null
        //   89: astore 5
        //   91: goto -65 -> 26
        //   94: astore 4
        //   96: aload_3
        //   97: invokevirtual 68	android/os/Parcel:recycle	()V
        //   100: aload_2
        //   101: invokevirtual 68	android/os/Parcel:recycle	()V
        //   104: aload 4
        //   106: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	107	0	this	a
        //   0	107	1	paramb	b
        //   3	98	2	localParcel1	Parcel
        //   7	90	3	localParcel2	Parcel
        //   94	11	4	localObject1	Object
        //   24	66	5	localIBinder	IBinder
        //   54	6	7	i	int
        //   57	29	8	localObject2	Object
        //   71	3	9	localLatLng	LatLng
        // Exception table:
        //   from	to	target	type
        //   8	14	94	finally
        //   18	26	94	finally
        //   26	56	94	finally
        //   64	73	94	finally
      }
      
      /* Error */
      public VisibleRegion getVisibleRegion()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 29
        //   11: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	com/google/android/gms/maps/internal/IProjectionDelegate$a$a:a	Landroid/os/IBinder;
        //   18: iconst_3
        //   19: aload_1
        //   20: aload_2
        //   21: iconst_0
        //   22: invokeinterface 46 5 0
        //   27: pop
        //   28: aload_2
        //   29: invokevirtual 49	android/os/Parcel:readException	()V
        //   32: aload_2
        //   33: invokevirtual 53	android/os/Parcel:readInt	()I
        //   36: ifeq +27 -> 63
        //   39: getstatic 75	com/google/android/gms/maps/model/VisibleRegion:CREATOR	Lcom/google/android/gms/maps/model/VisibleRegionCreator;
        //   42: aload_2
        //   43: invokevirtual 80	com/google/android/gms/maps/model/VisibleRegionCreator:createFromParcel	(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/VisibleRegion;
        //   46: astore 6
        //   48: aload 6
        //   50: astore 5
        //   52: aload_2
        //   53: invokevirtual 68	android/os/Parcel:recycle	()V
        //   56: aload_1
        //   57: invokevirtual 68	android/os/Parcel:recycle	()V
        //   60: aload 5
        //   62: areturn
        //   63: aconst_null
        //   64: astore 5
        //   66: goto -14 -> 52
        //   69: astore_3
        //   70: aload_2
        //   71: invokevirtual 68	android/os/Parcel:recycle	()V
        //   74: aload_1
        //   75: invokevirtual 68	android/os/Parcel:recycle	()V
        //   78: aload_3
        //   79: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	80	0	this	a
        //   3	72	1	localParcel1	Parcel
        //   7	64	2	localParcel2	Parcel
        //   69	10	3	localObject	Object
        //   50	15	5	localVisibleRegion1	VisibleRegion
        //   46	3	6	localVisibleRegion2	VisibleRegion
        // Exception table:
        //   from	to	target	type
        //   8	48	69	finally
      }
      
      /* Error */
      public b toScreenLocation(LatLng paramLatLng)
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
        //   15: ifnull +52 -> 67
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 86	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 90	com/google/android/gms/maps/model/LatLng:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IProjectionDelegate$a$a:a	Landroid/os/IBinder;
        //   33: iconst_2
        //   34: aload_2
        //   35: aload_3
        //   36: iconst_0
        //   37: invokeinterface 46 5 0
        //   42: pop
        //   43: aload_3
        //   44: invokevirtual 49	android/os/Parcel:readException	()V
        //   47: aload_3
        //   48: invokevirtual 93	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   51: invokestatic 99	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   54: astore 6
        //   56: aload_3
        //   57: invokevirtual 68	android/os/Parcel:recycle	()V
        //   60: aload_2
        //   61: invokevirtual 68	android/os/Parcel:recycle	()V
        //   64: aload 6
        //   66: areturn
        //   67: aload_2
        //   68: iconst_0
        //   69: invokevirtual 86	android/os/Parcel:writeInt	(I)V
        //   72: goto -43 -> 29
        //   75: astore 4
        //   77: aload_3
        //   78: invokevirtual 68	android/os/Parcel:recycle	()V
        //   81: aload_2
        //   82: invokevirtual 68	android/os/Parcel:recycle	()V
        //   85: aload 4
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	paramLatLng	LatLng
        //   3	79	2	localParcel1	Parcel
        //   7	71	3	localParcel2	Parcel
        //   75	11	4	localObject	Object
        //   54	11	6	localb	b
        // Exception table:
        //   from	to	target	type
        //   8	14	75	finally
        //   18	29	75	finally
        //   29	56	75	finally
        //   67	72	75	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/IProjectionDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */