package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface l
  extends IInterface
{
  public abstract boolean onMyLocationButtonClick()
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements l
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IOnMyLocationButtonClickListener");
    }
    
    public static l I(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMyLocationButtonClickListener");
      if ((localIInterface != null) && ((localIInterface instanceof l))) {
        return (l)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IOnMyLocationButtonClickListener");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IOnMyLocationButtonClickListener");
      boolean bool = onMyLocationButtonClick();
      paramParcel2.writeNoException();
      if (bool) {}
      for (int i = 1;; i = 0)
      {
        paramParcel2.writeInt(i);
        return true;
      }
    }
    
    private static class a
      implements l
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
      public boolean onMyLocationButtonClick()
        throws RemoteException
      {
        // Byte code:
        //   0: iconst_1
        //   1: istore_1
        //   2: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   5: astore_2
        //   6: invokestatic 27	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   9: astore_3
        //   10: aload_2
        //   11: ldc 29
        //   13: invokevirtual 33	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   16: aload_0
        //   17: getfield 15	com/google/android/gms/maps/internal/l$a$a:a	Landroid/os/IBinder;
        //   20: iconst_1
        //   21: aload_2
        //   22: aload_3
        //   23: iconst_0
        //   24: invokeinterface 39 5 0
        //   29: pop
        //   30: aload_3
        //   31: invokevirtual 42	android/os/Parcel:readException	()V
        //   34: aload_3
        //   35: invokevirtual 46	android/os/Parcel:readInt	()I
        //   38: istore 6
        //   40: iload 6
        //   42: ifeq +13 -> 55
        //   45: aload_3
        //   46: invokevirtual 49	android/os/Parcel:recycle	()V
        //   49: aload_2
        //   50: invokevirtual 49	android/os/Parcel:recycle	()V
        //   53: iload_1
        //   54: ireturn
        //   55: iconst_0
        //   56: istore_1
        //   57: goto -12 -> 45
        //   60: astore 4
        //   62: aload_3
        //   63: invokevirtual 49	android/os/Parcel:recycle	()V
        //   66: aload_2
        //   67: invokevirtual 49	android/os/Parcel:recycle	()V
        //   70: aload 4
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	a
        //   1	56	1	bool	boolean
        //   5	62	2	localParcel1	Parcel
        //   9	54	3	localParcel2	Parcel
        //   60	11	4	localObject	Object
        //   38	3	6	i	int
        // Exception table:
        //   from	to	target	type
        //   10	40	60	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/internal/l.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */