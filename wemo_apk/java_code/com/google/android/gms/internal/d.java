package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.data.e;

public abstract interface d
  extends IInterface
{
  public abstract void a(int paramInt)
    throws RemoteException;
  
  public abstract void a(int paramInt, com.google.android.gms.common.data.d paramd)
    throws RemoteException;
  
  public abstract void a(com.google.android.gms.common.data.d paramd)
    throws RemoteException;
  
  public abstract void onSignOutComplete()
    throws RemoteException;
  
  public abstract void onStateDeleted(int paramInt1, int paramInt2)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements d
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.appstate.internal.IAppStateCallbacks");
    }
    
    public static d d(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
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
        paramParcel2.writeString("com.google.android.gms.appstate.internal.IAppStateCallbacks");
        return true;
      case 5001: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
        int j = paramParcel1.readInt();
        int k = paramParcel1.readInt();
        com.google.android.gms.common.data.d locald2 = null;
        if (k != 0) {
          locald2 = com.google.android.gms.common.data.d.CREATOR.a(paramParcel1);
        }
        a(j, locald2);
        paramParcel2.writeNoException();
        return true;
      case 5002: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
        int i = paramParcel1.readInt();
        com.google.android.gms.common.data.d locald1 = null;
        if (i != 0) {
          locald1 = com.google.android.gms.common.data.d.CREATOR.a(paramParcel1);
        }
        a(locald1);
        paramParcel2.writeNoException();
        return true;
      case 5003: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
        onStateDeleted(paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5004: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
        onSignOutComplete();
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateCallbacks");
      a(paramParcel1.readInt());
      paramParcel2.writeNoException();
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
      
      public void a(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateCallbacks");
          localParcel1.writeInt(paramInt);
          this.a.transact(5005, localParcel1, localParcel2, 0);
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
      public void a(int paramInt, com.google.android.gms.common.data.d paramd)
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
        //   15: aload_3
        //   16: iload_1
        //   17: invokevirtual 33	android/os/Parcel:writeInt	(I)V
        //   20: aload_2
        //   21: ifnull +46 -> 67
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 33	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 52	com/google/android/gms/common/data/d:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/internal/d$a$a:a	Landroid/os/IBinder;
        //   39: sipush 5001
        //   42: aload_3
        //   43: aload 4
        //   45: iconst_0
        //   46: invokeinterface 39 5 0
        //   51: pop
        //   52: aload 4
        //   54: invokevirtual 42	android/os/Parcel:readException	()V
        //   57: aload 4
        //   59: invokevirtual 45	android/os/Parcel:recycle	()V
        //   62: aload_3
        //   63: invokevirtual 45	android/os/Parcel:recycle	()V
        //   66: return
        //   67: aload_3
        //   68: iconst_0
        //   69: invokevirtual 33	android/os/Parcel:writeInt	(I)V
        //   72: goto -37 -> 35
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 45	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 45	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	paramInt	int
        //   0	89	2	paramd	com.google.android.gms.common.data.d
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	75	finally
        //   24	35	75	finally
        //   35	57	75	finally
        //   67	72	75	finally
      }
      
      /* Error */
      public void a(com.google.android.gms.common.data.d paramd)
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
        //   15: ifnull +43 -> 58
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 33	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 52	com/google/android/gms/common/data/d:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/internal/d$a$a:a	Landroid/os/IBinder;
        //   33: sipush 5002
        //   36: aload_2
        //   37: aload_3
        //   38: iconst_0
        //   39: invokeinterface 39 5 0
        //   44: pop
        //   45: aload_3
        //   46: invokevirtual 42	android/os/Parcel:readException	()V
        //   49: aload_3
        //   50: invokevirtual 45	android/os/Parcel:recycle	()V
        //   53: aload_2
        //   54: invokevirtual 45	android/os/Parcel:recycle	()V
        //   57: return
        //   58: aload_2
        //   59: iconst_0
        //   60: invokevirtual 33	android/os/Parcel:writeInt	(I)V
        //   63: goto -34 -> 29
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 45	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 45	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	paramd	com.google.android.gms.common.data.d
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	29	66	finally
        //   29	49	66	finally
        //   58	63	66	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      public void onSignOutComplete()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateCallbacks");
          this.a.transact(5004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void onStateDeleted(int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateCallbacks");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          this.a.transact(5003, localParcel1, localParcel2, 0);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/d.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */