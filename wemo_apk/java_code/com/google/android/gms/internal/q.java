package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;

public abstract interface q
  extends IInterface
{
  public abstract b a(b paramb, int paramInt1, int paramInt2)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements q
  {
    public static q i(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
      if ((localIInterface != null) && ((localIInterface instanceof q))) {
        return (q)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.common.internal.ISignInButtonCreator");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
      b localb = a(b.a.l(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt());
      paramParcel2.writeNoException();
      if (localb != null) {}
      for (IBinder localIBinder = localb.asBinder();; localIBinder = null)
      {
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      }
    }
    
    private static class a
      implements q
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public b a(b paramb, int paramInt1, int paramInt2)
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
        //   18: ifnull +74 -> 92
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: iload_2
        //   39: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   42: aload 4
        //   44: iload_3
        //   45: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/q$a$a:a	Landroid/os/IBinder;
        //   52: iconst_1
        //   53: aload 4
        //   55: aload 5
        //   57: iconst_0
        //   58: invokeinterface 49 5 0
        //   63: pop
        //   64: aload 5
        //   66: invokevirtual 52	android/os/Parcel:readException	()V
        //   69: aload 5
        //   71: invokevirtual 55	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   74: invokestatic 61	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   77: astore 9
        //   79: aload 5
        //   81: invokevirtual 64	android/os/Parcel:recycle	()V
        //   84: aload 4
        //   86: invokevirtual 64	android/os/Parcel:recycle	()V
        //   89: aload 9
        //   91: areturn
        //   92: aconst_null
        //   93: astore 7
        //   95: goto -66 -> 29
        //   98: astore 6
        //   100: aload 5
        //   102: invokevirtual 64	android/os/Parcel:recycle	()V
        //   105: aload 4
        //   107: invokevirtual 64	android/os/Parcel:recycle	()V
        //   110: aload 6
        //   112: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	113	0	this	a
        //   0	113	1	paramb	b
        //   0	113	2	paramInt1	int
        //   0	113	3	paramInt2	int
        //   3	103	4	localParcel1	Parcel
        //   8	93	5	localParcel2	Parcel
        //   98	13	6	localObject	Object
        //   27	67	7	localIBinder	IBinder
        //   77	13	9	localb	b
        // Exception table:
        //   from	to	target	type
        //   10	17	98	finally
        //   21	29	98	finally
        //   29	79	98	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/q.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */