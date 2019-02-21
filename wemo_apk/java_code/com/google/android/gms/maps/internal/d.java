package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;

public abstract interface d
  extends IInterface
{
  public abstract b f(com.google.android.gms.maps.model.internal.d paramd)
    throws RemoteException;
  
  public abstract b g(com.google.android.gms.maps.model.internal.d paramd)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements d
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IInfoWindowAdapter");
    }
    
    public static d x(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      if ((localIInterface != null) && ((localIInterface instanceof d))) {
        return (d)localIInterface;
      }
      return new a(paramIBinder);
    }
    
    public IBinder asBinder()
    {
      return this;
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        b localb2 = f(com.google.android.gms.maps.model.internal.d.a.Q(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localb2 != null) {
          localIBinder2 = localb2.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      b localb1 = g(com.google.android.gms.maps.model.internal.d.a.Q(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localb1 != null) {
        localIBinder1 = localb1.asBinder();
      }
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }
    
    private static class a
      implements d
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
      public b f(com.google.android.gms.maps.model.internal.d paramd)
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
        //   15: ifnull +55 -> 70
        //   18: aload_1
        //   19: invokeinterface 37 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 40	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/d$a$a:a	Landroid/os/IBinder;
        //   36: iconst_1
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 46 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 49	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 52	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   54: invokestatic 58	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   57: astore 7
        //   59: aload_3
        //   60: invokevirtual 61	android/os/Parcel:recycle	()V
        //   63: aload_2
        //   64: invokevirtual 61	android/os/Parcel:recycle	()V
        //   67: aload 7
        //   69: areturn
        //   70: aconst_null
        //   71: astore 5
        //   73: goto -47 -> 26
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 61	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 61	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramd	com.google.android.gms.maps.model.internal.d
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   24	48	5	localIBinder	IBinder
        //   57	11	7	localb	b
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	26	76	finally
        //   26	59	76	finally
      }
      
      /* Error */
      public b g(com.google.android.gms.maps.model.internal.d paramd)
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
        //   15: ifnull +55 -> 70
        //   18: aload_1
        //   19: invokeinterface 37 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 40	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/d$a$a:a	Landroid/os/IBinder;
        //   36: iconst_2
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 46 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 49	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 52	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   54: invokestatic 58	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   57: astore 7
        //   59: aload_3
        //   60: invokevirtual 61	android/os/Parcel:recycle	()V
        //   63: aload_2
        //   64: invokevirtual 61	android/os/Parcel:recycle	()V
        //   67: aload 7
        //   69: areturn
        //   70: aconst_null
        //   71: astore 5
        //   73: goto -47 -> 26
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 61	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 61	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramd	com.google.android.gms.maps.model.internal.d
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   24	48	5	localIBinder	IBinder
        //   57	11	7	localb	b
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	26	76	finally
        //   26	59	76	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/d.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */