package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.d;
import com.google.android.gms.maps.model.internal.d.a;

public abstract interface j
  extends IInterface
{
  public abstract boolean a(d paramd)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements j
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IOnMarkerClickListener");
    }
    
    public static j G(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMarkerClickListener");
      if ((localIInterface != null) && ((localIInterface instanceof j))) {
        return (j)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IOnMarkerClickListener");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IOnMarkerClickListener");
      boolean bool = a(d.a.Q(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      if (bool) {}
      for (int i = 1;; i = 0)
      {
        paramParcel2.writeInt(i);
        return true;
      }
    }
    
    private static class a
      implements j
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public boolean a(d paramd)
        throws RemoteException
      {
        // Byte code:
        //   0: iconst_1
        //   1: istore_2
        //   2: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   5: astore_3
        //   6: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   9: astore 4
        //   11: aload_3
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +60 -> 78
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 6
        //   29: aload_3
        //   30: aload 6
        //   32: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/maps/internal/j$a$a:a	Landroid/os/IBinder;
        //   39: iconst_1
        //   40: aload_3
        //   41: aload 4
        //   43: iconst_0
        //   44: invokeinterface 45 5 0
        //   49: pop
        //   50: aload 4
        //   52: invokevirtual 48	android/os/Parcel:readException	()V
        //   55: aload 4
        //   57: invokevirtual 52	android/os/Parcel:readInt	()I
        //   60: istore 8
        //   62: iload 8
        //   64: ifeq +20 -> 84
        //   67: aload 4
        //   69: invokevirtual 55	android/os/Parcel:recycle	()V
        //   72: aload_3
        //   73: invokevirtual 55	android/os/Parcel:recycle	()V
        //   76: iload_2
        //   77: ireturn
        //   78: aconst_null
        //   79: astore 6
        //   81: goto -52 -> 29
        //   84: iconst_0
        //   85: istore_2
        //   86: goto -19 -> 67
        //   89: astore 5
        //   91: aload 4
        //   93: invokevirtual 55	android/os/Parcel:recycle	()V
        //   96: aload_3
        //   97: invokevirtual 55	android/os/Parcel:recycle	()V
        //   100: aload 5
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramd	d
        //   1	85	2	bool	boolean
        //   5	92	3	localParcel1	Parcel
        //   9	83	4	localParcel2	Parcel
        //   89	12	5	localObject	Object
        //   27	53	6	localIBinder	IBinder
        //   60	3	8	i	int
        // Exception table:
        //   from	to	target	type
        //   11	17	89	finally
        //   21	29	89	finally
        //   29	62	89	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/j.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */