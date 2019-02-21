package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.GoogleMapOptionsCreator;

public abstract interface IMapFragmentDelegate
  extends IInterface
{
  public abstract IGoogleMapDelegate getMap()
    throws RemoteException;
  
  public abstract boolean isReady()
    throws RemoteException;
  
  public abstract void onCreate(Bundle paramBundle)
    throws RemoteException;
  
  public abstract b onCreateView(b paramb1, b paramb2, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void onDestroy()
    throws RemoteException;
  
  public abstract void onDestroyView()
    throws RemoteException;
  
  public abstract void onInflate(b paramb, GoogleMapOptions paramGoogleMapOptions, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void onLowMemory()
    throws RemoteException;
  
  public abstract void onPause()
    throws RemoteException;
  
  public abstract void onResume()
    throws RemoteException;
  
  public abstract void onSaveInstanceState(Bundle paramBundle)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements IMapFragmentDelegate
  {
    public static IMapFragmentDelegate z(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof IMapFragmentDelegate))) {
        return (IMapFragmentDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        IGoogleMapDelegate localIGoogleMapDelegate = getMap();
        paramParcel2.writeNoException();
        if (localIGoogleMapDelegate != null) {}
        for (IBinder localIBinder2 = localIGoogleMapDelegate.asBinder();; localIBinder2 = null)
        {
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        b localb4 = b.a.l(paramParcel1.readStrongBinder());
        GoogleMapOptions localGoogleMapOptions;
        if (paramParcel1.readInt() != 0)
        {
          localGoogleMapOptions = GoogleMapOptions.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label244;
          }
        }
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle4 = null)
        {
          onInflate(localb4, localGoogleMapOptions, localBundle4);
          paramParcel2.writeNoException();
          return true;
          localGoogleMapOptions = null;
          break;
        }
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle3 = null)
        {
          onCreate(localBundle3);
          paramParcel2.writeNoException();
          return true;
        }
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        b localb1 = b.a.l(paramParcel1.readStrongBinder());
        b localb2 = b.a.l(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle2 = null)
        {
          b localb3 = onCreateView(localb1, localb2, localBundle2);
          paramParcel2.writeNoException();
          IBinder localIBinder1 = null;
          if (localb3 != null) {
            localIBinder1 = localb3.asBinder();
          }
          paramParcel2.writeStrongBinder(localIBinder1);
          return true;
        }
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        onResume();
        paramParcel2.writeNoException();
        return true;
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        onPause();
        paramParcel2.writeNoException();
        return true;
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        onDestroyView();
        paramParcel2.writeNoException();
        return true;
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        onDestroy();
        paramParcel2.writeNoException();
        return true;
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        onLowMemory();
        paramParcel2.writeNoException();
        return true;
      case 10: 
        label244:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle1 = null)
        {
          onSaveInstanceState(localBundle1);
          paramParcel2.writeNoException();
          if (localBundle1 == null) {
            break;
          }
          paramParcel2.writeInt(1);
          localBundle1.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IMapFragmentDelegate");
      boolean bool = isReady();
      paramParcel2.writeNoException();
      if (bool) {}
      for (int i = 1;; i = 0)
      {
        paramParcel2.writeInt(i);
        return true;
      }
    }
    
    private static class a
      implements IMapFragmentDelegate
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
      
      public IGoogleMapDelegate getMap()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          IGoogleMapDelegate localIGoogleMapDelegate = IGoogleMapDelegate.a.w(localParcel2.readStrongBinder());
          return localIGoogleMapDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public boolean isReady()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(11, localParcel1, localParcel2, 0);
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
      public void onCreate(Bundle paramBundle)
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
        //   15: ifnull +41 -> 56
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 72	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IMapFragmentDelegate$a$a:a	Landroid/os/IBinder;
        //   33: iconst_3
        //   34: aload_2
        //   35: aload_3
        //   36: iconst_0
        //   37: invokeinterface 39 5 0
        //   42: pop
        //   43: aload_3
        //   44: invokevirtual 42	android/os/Parcel:readException	()V
        //   47: aload_3
        //   48: invokevirtual 54	android/os/Parcel:recycle	()V
        //   51: aload_2
        //   52: invokevirtual 54	android/os/Parcel:recycle	()V
        //   55: return
        //   56: aload_2
        //   57: iconst_0
        //   58: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   61: goto -32 -> 29
        //   64: astore 4
        //   66: aload_3
        //   67: invokevirtual 54	android/os/Parcel:recycle	()V
        //   70: aload_2
        //   71: invokevirtual 54	android/os/Parcel:recycle	()V
        //   74: aload 4
        //   76: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	77	0	this	a
        //   0	77	1	paramBundle	Bundle
        //   3	68	2	localParcel1	Parcel
        //   7	60	3	localParcel2	Parcel
        //   64	11	4	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   8	14	64	finally
        //   18	29	64	finally
        //   29	47	64	finally
        //   56	61	64	finally
      }
      
      /* Error */
      public b onCreateView(b paramb1, b paramb2, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 29
        //   14: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +101 -> 119
        //   21: aload_1
        //   22: invokeinterface 78 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 81	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aconst_null
        //   37: astore 8
        //   39: aload_2
        //   40: ifnull +11 -> 51
        //   43: aload_2
        //   44: invokeinterface 78 1 0
        //   49: astore 8
        //   51: aload 4
        //   53: aload 8
        //   55: invokevirtual 81	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   58: aload_3
        //   59: ifnull +66 -> 125
        //   62: aload 4
        //   64: iconst_1
        //   65: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   68: aload_3
        //   69: aload 4
        //   71: iconst_0
        //   72: invokevirtual 72	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   75: aload_0
        //   76: getfield 15	com/google/android/gms/maps/internal/IMapFragmentDelegate$a$a:a	Landroid/os/IBinder;
        //   79: iconst_4
        //   80: aload 4
        //   82: aload 5
        //   84: iconst_0
        //   85: invokeinterface 39 5 0
        //   90: pop
        //   91: aload 5
        //   93: invokevirtual 42	android/os/Parcel:readException	()V
        //   96: aload 5
        //   98: invokevirtual 45	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   101: invokestatic 87	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   104: astore 10
        //   106: aload 5
        //   108: invokevirtual 54	android/os/Parcel:recycle	()V
        //   111: aload 4
        //   113: invokevirtual 54	android/os/Parcel:recycle	()V
        //   116: aload 10
        //   118: areturn
        //   119: aconst_null
        //   120: astore 7
        //   122: goto -93 -> 29
        //   125: aload 4
        //   127: iconst_0
        //   128: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   131: goto -56 -> 75
        //   134: astore 6
        //   136: aload 5
        //   138: invokevirtual 54	android/os/Parcel:recycle	()V
        //   141: aload 4
        //   143: invokevirtual 54	android/os/Parcel:recycle	()V
        //   146: aload 6
        //   148: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	149	0	this	a
        //   0	149	1	paramb1	b
        //   0	149	2	paramb2	b
        //   0	149	3	paramBundle	Bundle
        //   3	139	4	localParcel1	Parcel
        //   8	129	5	localParcel2	Parcel
        //   134	13	6	localObject	Object
        //   27	94	7	localIBinder1	IBinder
        //   37	17	8	localIBinder2	IBinder
        //   104	13	10	localb	b
        // Exception table:
        //   from	to	target	type
        //   10	17	134	finally
        //   21	29	134	finally
        //   29	36	134	finally
        //   43	51	134	finally
        //   51	58	134	finally
        //   62	75	134	finally
        //   75	106	134	finally
        //   125	131	134	finally
      }
      
      public void onDestroy()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
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
      
      public void onDestroyView()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void onInflate(b paramb, GoogleMapOptions paramGoogleMapOptions, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        label132:
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
            IBinder localIBinder;
            if (paramb != null)
            {
              localIBinder = paramb.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              if (paramGoogleMapOptions != null)
              {
                localParcel1.writeInt(1);
                paramGoogleMapOptions.writeToParcel(localParcel1, 0);
                if (paramBundle == null) {
                  break label132;
                }
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.a.transact(2, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void onLowMemory()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(9, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void onPause()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void onResume()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IMapFragmentDelegate");
          this.a.transact(5, localParcel1, localParcel2, 0);
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
      public void onSaveInstanceState(Bundle paramBundle)
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
        //   15: ifnull +54 -> 69
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 72	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/maps/internal/IMapFragmentDelegate$a$a:a	Landroid/os/IBinder;
        //   33: bipush 10
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 39 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 42	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 60	android/os/Parcel:readInt	()I
        //   52: ifeq +8 -> 60
        //   55: aload_1
        //   56: aload_3
        //   57: invokevirtual 102	android/os/Bundle:readFromParcel	(Landroid/os/Parcel;)V
        //   60: aload_3
        //   61: invokevirtual 54	android/os/Parcel:recycle	()V
        //   64: aload_2
        //   65: invokevirtual 54	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aload_2
        //   70: iconst_0
        //   71: invokevirtual 66	android/os/Parcel:writeInt	(I)V
        //   74: goto -45 -> 29
        //   77: astore 4
        //   79: aload_3
        //   80: invokevirtual 54	android/os/Parcel:recycle	()V
        //   83: aload_2
        //   84: invokevirtual 54	android/os/Parcel:recycle	()V
        //   87: aload 4
        //   89: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	90	0	this	a
        //   0	90	1	paramBundle	Bundle
        //   3	81	2	localParcel1	Parcel
        //   7	73	3	localParcel2	Parcel
        //   77	11	4	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   8	14	77	finally
        //   18	29	77	finally
        //   29	60	77	finally
        //   69	74	77	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/IMapFragmentDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */