package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface e
  extends IInterface
{
  public abstract void a(d paramd)
    throws RemoteException;
  
  public abstract void a(d paramd, int paramInt)
    throws RemoteException;
  
  public abstract void a(d paramd, int paramInt, String paramString, byte[] paramArrayOfByte)
    throws RemoteException;
  
  public abstract void a(d paramd, int paramInt, byte[] paramArrayOfByte)
    throws RemoteException;
  
  public abstract void b(d paramd)
    throws RemoteException;
  
  public abstract void b(d paramd, int paramInt)
    throws RemoteException;
  
  public abstract void c(d paramd)
    throws RemoteException;
  
  public abstract int getMaxNumKeys()
    throws RemoteException;
  
  public abstract int getMaxStateSize()
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements e
  {
    public static e e(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appstate.internal.IAppStateService");
      if ((localIInterface != null) && ((localIInterface instanceof e))) {
        return (e)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.appstate.internal.IAppStateService");
        return true;
      case 5001: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int j = getMaxStateSize();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(j);
        return true;
      case 5002: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int i = getMaxNumKeys();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i);
        return true;
      case 5003: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(d.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5004: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(d.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5005: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(d.a.d(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5006: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(d.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5007: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        b(d.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5008: 
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        b(d.a.d(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
      c(d.a.d(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class a
      implements e
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public void a(d paramd)
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
        //   15: ifnull +46 -> 61
        //   18: aload_1
        //   19: invokeinterface 36 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   36: sipush 5005
        //   39: aload_2
        //   40: aload_3
        //   41: iconst_0
        //   42: invokeinterface 45 5 0
        //   47: pop
        //   48: aload_3
        //   49: invokevirtual 48	android/os/Parcel:readException	()V
        //   52: aload_3
        //   53: invokevirtual 51	android/os/Parcel:recycle	()V
        //   56: aload_2
        //   57: invokevirtual 51	android/os/Parcel:recycle	()V
        //   60: return
        //   61: aconst_null
        //   62: astore 5
        //   64: goto -38 -> 26
        //   67: astore 4
        //   69: aload_3
        //   70: invokevirtual 51	android/os/Parcel:recycle	()V
        //   73: aload_2
        //   74: invokevirtual 51	android/os/Parcel:recycle	()V
        //   77: aload 4
        //   79: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	80	0	this	a
        //   0	80	1	paramd	d
        //   3	71	2	localParcel1	Parcel
        //   7	63	3	localParcel2	Parcel
        //   67	11	4	localObject	Object
        //   24	39	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	67	finally
        //   18	26	67	finally
        //   26	52	67	finally
      }
      
      /* Error */
      public void a(d paramd, int paramInt)
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
        //   16: ifnull +54 -> 70
        //   19: aload_1
        //   20: invokeinterface 36 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: iload_2
        //   35: invokevirtual 56	android/os/Parcel:writeInt	(I)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   42: sipush 5004
        //   45: aload_3
        //   46: aload 4
        //   48: iconst_0
        //   49: invokeinterface 45 5 0
        //   54: pop
        //   55: aload 4
        //   57: invokevirtual 48	android/os/Parcel:readException	()V
        //   60: aload 4
        //   62: invokevirtual 51	android/os/Parcel:recycle	()V
        //   65: aload_3
        //   66: invokevirtual 51	android/os/Parcel:recycle	()V
        //   69: return
        //   70: aconst_null
        //   71: astore 6
        //   73: goto -46 -> 27
        //   76: astore 5
        //   78: aload 4
        //   80: invokevirtual 51	android/os/Parcel:recycle	()V
        //   83: aload_3
        //   84: invokevirtual 51	android/os/Parcel:recycle	()V
        //   87: aload 5
        //   89: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	90	0	this	a
        //   0	90	1	paramd	d
        //   0	90	2	paramInt	int
        //   3	81	3	localParcel1	Parcel
        //   7	72	4	localParcel2	Parcel
        //   76	12	5	localObject	Object
        //   25	47	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	76	finally
        //   19	27	76	finally
        //   27	60	76	finally
      }
      
      /* Error */
      public void a(d paramd, int paramInt, String paramString, byte[] paramArrayOfByte)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 5
        //   5: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 6
        //   10: aload 5
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +71 -> 89
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: iload_2
        //   39: invokevirtual 56	android/os/Parcel:writeInt	(I)V
        //   42: aload 5
        //   44: aload_3
        //   45: invokevirtual 60	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload 5
        //   50: aload 4
        //   52: invokevirtual 64	android/os/Parcel:writeByteArray	([B)V
        //   55: aload_0
        //   56: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   59: sipush 5006
        //   62: aload 5
        //   64: aload 6
        //   66: iconst_0
        //   67: invokeinterface 45 5 0
        //   72: pop
        //   73: aload 6
        //   75: invokevirtual 48	android/os/Parcel:readException	()V
        //   78: aload 6
        //   80: invokevirtual 51	android/os/Parcel:recycle	()V
        //   83: aload 5
        //   85: invokevirtual 51	android/os/Parcel:recycle	()V
        //   88: return
        //   89: aconst_null
        //   90: astore 8
        //   92: goto -63 -> 29
        //   95: astore 7
        //   97: aload 6
        //   99: invokevirtual 51	android/os/Parcel:recycle	()V
        //   102: aload 5
        //   104: invokevirtual 51	android/os/Parcel:recycle	()V
        //   107: aload 7
        //   109: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	110	0	this	a
        //   0	110	1	paramd	d
        //   0	110	2	paramInt	int
        //   0	110	3	paramString	String
        //   0	110	4	paramArrayOfByte	byte[]
        //   3	100	5	localParcel1	Parcel
        //   8	90	6	localParcel2	Parcel
        //   95	13	7	localObject	Object
        //   27	64	8	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	95	finally
        //   21	29	95	finally
        //   29	78	95	finally
      }
      
      /* Error */
      public void a(d paramd, int paramInt, byte[] paramArrayOfByte)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +64 -> 82
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: iload_2
        //   39: invokevirtual 56	android/os/Parcel:writeInt	(I)V
        //   42: aload 4
        //   44: aload_3
        //   45: invokevirtual 64	android/os/Parcel:writeByteArray	([B)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   52: sipush 5003
        //   55: aload 4
        //   57: aload 5
        //   59: iconst_0
        //   60: invokeinterface 45 5 0
        //   65: pop
        //   66: aload 5
        //   68: invokevirtual 48	android/os/Parcel:readException	()V
        //   71: aload 5
        //   73: invokevirtual 51	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: invokevirtual 51	android/os/Parcel:recycle	()V
        //   81: return
        //   82: aconst_null
        //   83: astore 7
        //   85: goto -56 -> 29
        //   88: astore 6
        //   90: aload 5
        //   92: invokevirtual 51	android/os/Parcel:recycle	()V
        //   95: aload 4
        //   97: invokevirtual 51	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramd	d
        //   0	103	2	paramInt	int
        //   0	103	3	paramArrayOfByte	byte[]
        //   3	93	4	localParcel1	Parcel
        //   8	83	5	localParcel2	Parcel
        //   88	13	6	localObject	Object
        //   27	57	7	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	88	finally
        //   21	29	88	finally
        //   29	71	88	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      /* Error */
      public void b(d paramd)
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
        //   15: ifnull +46 -> 61
        //   18: aload_1
        //   19: invokeinterface 36 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   36: sipush 5008
        //   39: aload_2
        //   40: aload_3
        //   41: iconst_0
        //   42: invokeinterface 45 5 0
        //   47: pop
        //   48: aload_3
        //   49: invokevirtual 48	android/os/Parcel:readException	()V
        //   52: aload_3
        //   53: invokevirtual 51	android/os/Parcel:recycle	()V
        //   56: aload_2
        //   57: invokevirtual 51	android/os/Parcel:recycle	()V
        //   60: return
        //   61: aconst_null
        //   62: astore 5
        //   64: goto -38 -> 26
        //   67: astore 4
        //   69: aload_3
        //   70: invokevirtual 51	android/os/Parcel:recycle	()V
        //   73: aload_2
        //   74: invokevirtual 51	android/os/Parcel:recycle	()V
        //   77: aload 4
        //   79: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	80	0	this	a
        //   0	80	1	paramd	d
        //   3	71	2	localParcel1	Parcel
        //   7	63	3	localParcel2	Parcel
        //   67	11	4	localObject	Object
        //   24	39	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	67	finally
        //   18	26	67	finally
        //   26	52	67	finally
      }
      
      /* Error */
      public void b(d paramd, int paramInt)
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
        //   16: ifnull +54 -> 70
        //   19: aload_1
        //   20: invokeinterface 36 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: iload_2
        //   35: invokevirtual 56	android/os/Parcel:writeInt	(I)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   42: sipush 5007
        //   45: aload_3
        //   46: aload 4
        //   48: iconst_0
        //   49: invokeinterface 45 5 0
        //   54: pop
        //   55: aload 4
        //   57: invokevirtual 48	android/os/Parcel:readException	()V
        //   60: aload 4
        //   62: invokevirtual 51	android/os/Parcel:recycle	()V
        //   65: aload_3
        //   66: invokevirtual 51	android/os/Parcel:recycle	()V
        //   69: return
        //   70: aconst_null
        //   71: astore 6
        //   73: goto -46 -> 27
        //   76: astore 5
        //   78: aload 4
        //   80: invokevirtual 51	android/os/Parcel:recycle	()V
        //   83: aload_3
        //   84: invokevirtual 51	android/os/Parcel:recycle	()V
        //   87: aload 5
        //   89: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	90	0	this	a
        //   0	90	1	paramd	d
        //   0	90	2	paramInt	int
        //   3	81	3	localParcel1	Parcel
        //   7	72	4	localParcel2	Parcel
        //   76	12	5	localObject	Object
        //   25	47	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	76	finally
        //   19	27	76	finally
        //   27	60	76	finally
      }
      
      /* Error */
      public void c(d paramd)
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
        //   15: ifnull +46 -> 61
        //   18: aload_1
        //   19: invokeinterface 36 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/e$a$a:a	Landroid/os/IBinder;
        //   36: sipush 5009
        //   39: aload_2
        //   40: aload_3
        //   41: iconst_0
        //   42: invokeinterface 45 5 0
        //   47: pop
        //   48: aload_3
        //   49: invokevirtual 48	android/os/Parcel:readException	()V
        //   52: aload_3
        //   53: invokevirtual 51	android/os/Parcel:recycle	()V
        //   56: aload_2
        //   57: invokevirtual 51	android/os/Parcel:recycle	()V
        //   60: return
        //   61: aconst_null
        //   62: astore 5
        //   64: goto -38 -> 26
        //   67: astore 4
        //   69: aload_3
        //   70: invokevirtual 51	android/os/Parcel:recycle	()V
        //   73: aload_2
        //   74: invokevirtual 51	android/os/Parcel:recycle	()V
        //   77: aload 4
        //   79: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	80	0	this	a
        //   0	80	1	paramd	d
        //   3	71	2	localParcel1	Parcel
        //   7	63	3	localParcel2	Parcel
        //   67	11	4	localObject	Object
        //   24	39	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	67	finally
        //   18	26	67	finally
        //   26	52	67	finally
      }
      
      public int getMaxNumKeys()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.a.transact(5002, localParcel1, localParcel2, 0);
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
      
      public int getMaxStateSize()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.a.transact(5001, localParcel1, localParcel2, 0);
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
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/e.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */