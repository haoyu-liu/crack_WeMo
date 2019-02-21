package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.GoogleMapOptionsCreator;
import com.google.android.gms.maps.model.internal.a;
import com.google.android.gms.maps.model.internal.a.a;

public abstract interface c
  extends IInterface
{
  public abstract IMapViewDelegate a(b paramb, GoogleMapOptions paramGoogleMapOptions)
    throws RemoteException;
  
  public abstract void a(b paramb, int paramInt)
    throws RemoteException;
  
  public abstract ICameraUpdateFactoryDelegate bk()
    throws RemoteException;
  
  public abstract a bl()
    throws RemoteException;
  
  public abstract void c(b paramb)
    throws RemoteException;
  
  public abstract IMapFragmentDelegate d(b paramb)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements c
  {
    public static c v(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICreator");
      if ((localIInterface != null) && ((localIInterface instanceof c))) {
        return (c)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICreator");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        c(b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        IMapFragmentDelegate localIMapFragmentDelegate = d(b.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localIMapFragmentDelegate != null) {
          localIBinder4 = localIMapFragmentDelegate.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        b localb = b.a.l(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (GoogleMapOptions localGoogleMapOptions = GoogleMapOptions.CREATOR.createFromParcel(paramParcel1);; localGoogleMapOptions = null)
        {
          IMapViewDelegate localIMapViewDelegate = a(localb, localGoogleMapOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder3 = null;
          if (localIMapViewDelegate != null) {
            localIBinder3 = localIMapViewDelegate.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder3);
          return true;
        }
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = bk();
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localICameraUpdateFactoryDelegate != null) {
          localIBinder2 = localICameraUpdateFactoryDelegate.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        a locala = bl();
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (locala != null) {
          localIBinder1 = locala.asBinder();
        }
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
      a(b.a.l(paramParcel1.readStrongBinder()), paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class a
      implements c
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public IMapViewDelegate a(b paramb, GoogleMapOptions paramGoogleMapOptions)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 26
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +74 -> 90
        //   19: aload_1
        //   20: invokeinterface 36 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_2
        //   34: ifnull +62 -> 96
        //   37: aload_3
        //   38: iconst_1
        //   39: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   42: aload_2
        //   43: aload_3
        //   44: iconst_0
        //   45: invokevirtual 49	com/google/android/gms/maps/GoogleMapOptions:writeToParcel	(Landroid/os/Parcel;I)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/maps/internal/c$a$a:a	Landroid/os/IBinder;
        //   52: iconst_3
        //   53: aload_3
        //   54: aload 4
        //   56: iconst_0
        //   57: invokeinterface 55 5 0
        //   62: pop
        //   63: aload 4
        //   65: invokevirtual 58	android/os/Parcel:readException	()V
        //   68: aload 4
        //   70: invokevirtual 61	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   73: invokestatic 67	com/google/android/gms/maps/internal/IMapViewDelegate$a:A	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/internal/IMapViewDelegate;
        //   76: astore 8
        //   78: aload 4
        //   80: invokevirtual 70	android/os/Parcel:recycle	()V
        //   83: aload_3
        //   84: invokevirtual 70	android/os/Parcel:recycle	()V
        //   87: aload 8
        //   89: areturn
        //   90: aconst_null
        //   91: astore 6
        //   93: goto -66 -> 27
        //   96: aload_3
        //   97: iconst_0
        //   98: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   101: goto -53 -> 48
        //   104: astore 5
        //   106: aload 4
        //   108: invokevirtual 70	android/os/Parcel:recycle	()V
        //   111: aload_3
        //   112: invokevirtual 70	android/os/Parcel:recycle	()V
        //   115: aload 5
        //   117: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	118	0	this	a
        //   0	118	1	paramb	b
        //   0	118	2	paramGoogleMapOptions	GoogleMapOptions
        //   3	109	3	localParcel1	Parcel
        //   7	100	4	localParcel2	Parcel
        //   104	12	5	localObject	Object
        //   25	67	6	localIBinder	IBinder
        //   76	12	8	localIMapViewDelegate	IMapViewDelegate
        // Exception table:
        //   from	to	target	type
        //   9	15	104	finally
        //   19	27	104	finally
        //   27	33	104	finally
        //   37	48	104	finally
        //   48	78	104	finally
        //   96	101	104	finally
      }
      
      /* Error */
      public void a(b paramb, int paramInt)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 26
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 36 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: iload_2
        //   35: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/maps/internal/c$a$a:a	Landroid/os/IBinder;
        //   42: bipush 6
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 55 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 58	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 70	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 70	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 70	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 70	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramb	b
        //   0	89	2	paramInt	int
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      public ICameraUpdateFactoryDelegate bk()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.a.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = ICameraUpdateFactoryDelegate.a.t(localParcel2.readStrongBinder());
          return localICameraUpdateFactoryDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public a bl()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.a.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          a locala = a.a.N(localParcel2.readStrongBinder());
          return locala;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void c(b paramb)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 26
        //   11: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +44 -> 59
        //   18: aload_1
        //   19: invokeinterface 36 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/c$a$a:a	Landroid/os/IBinder;
        //   36: iconst_1
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 55 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 58	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 70	android/os/Parcel:recycle	()V
        //   54: aload_2
        //   55: invokevirtual 70	android/os/Parcel:recycle	()V
        //   58: return
        //   59: aconst_null
        //   60: astore 5
        //   62: goto -36 -> 26
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 70	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 70	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	a
        //   0	78	1	paramb	b
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
      public IMapFragmentDelegate d(b paramb)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 26
        //   11: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +55 -> 70
        //   18: aload_1
        //   19: invokeinterface 36 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/maps/internal/c$a$a:a	Landroid/os/IBinder;
        //   36: iconst_2
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 55 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 58	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 61	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   54: invokestatic 97	com/google/android/gms/maps/internal/IMapFragmentDelegate$a:z	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/internal/IMapFragmentDelegate;
        //   57: astore 7
        //   59: aload_3
        //   60: invokevirtual 70	android/os/Parcel:recycle	()V
        //   63: aload_2
        //   64: invokevirtual 70	android/os/Parcel:recycle	()V
        //   67: aload 7
        //   69: areturn
        //   70: aconst_null
        //   71: astore 5
        //   73: goto -47 -> 26
        //   76: astore 4
        //   78: aload_3
        //   79: invokevirtual 70	android/os/Parcel:recycle	()V
        //   82: aload_2
        //   83: invokevirtual 70	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramb	b
        //   3	80	2	localParcel1	Parcel
        //   7	72	3	localParcel2	Parcel
        //   76	11	4	localObject	Object
        //   24	48	5	localIBinder	IBinder
        //   57	11	7	localIMapFragmentDelegate	IMapFragmentDelegate
        // Exception table:
        //   from	to	target	type
        //   8	14	76	finally
        //   18	26	76	finally
        //   26	59	76	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */