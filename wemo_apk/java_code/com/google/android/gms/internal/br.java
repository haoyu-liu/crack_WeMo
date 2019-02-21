package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface br
  extends IInterface
{
  public abstract void cancelClick()
    throws RemoteException;
  
  public abstract PendingIntent getResolution()
    throws RemoteException;
  
  public abstract void reinitialize()
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements br
  {
    public static br aa(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusOneDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof br))) {
        return (br)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusOneDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusOneDelegate");
        PendingIntent localPendingIntent = getResolution();
        paramParcel2.writeNoException();
        if (localPendingIntent != null)
        {
          paramParcel2.writeInt(1);
          localPendingIntent.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusOneDelegate");
        cancelClick();
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusOneDelegate");
      reinitialize();
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class a
      implements br
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
      
      public void cancelClick()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusOneDelegate");
          this.a.transact(2, localParcel1, localParcel2, 0);
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
      public PendingIntent getResolution()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 26	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 26	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 28
        //   11: invokevirtual 32	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	com/google/android/gms/internal/br$a$a:a	Landroid/os/IBinder;
        //   18: iconst_1
        //   19: aload_1
        //   20: aload_2
        //   21: iconst_0
        //   22: invokeinterface 38 5 0
        //   27: pop
        //   28: aload_2
        //   29: invokevirtual 41	android/os/Parcel:readException	()V
        //   32: aload_2
        //   33: invokevirtual 50	android/os/Parcel:readInt	()I
        //   36: ifeq +28 -> 64
        //   39: getstatic 56	android/app/PendingIntent:CREATOR	Landroid/os/Parcelable$Creator;
        //   42: aload_2
        //   43: invokeinterface 62 2 0
        //   48: checkcast 52	android/app/PendingIntent
        //   51: astore 5
        //   53: aload_2
        //   54: invokevirtual 44	android/os/Parcel:recycle	()V
        //   57: aload_1
        //   58: invokevirtual 44	android/os/Parcel:recycle	()V
        //   61: aload 5
        //   63: areturn
        //   64: aconst_null
        //   65: astore 5
        //   67: goto -14 -> 53
        //   70: astore_3
        //   71: aload_2
        //   72: invokevirtual 44	android/os/Parcel:recycle	()V
        //   75: aload_1
        //   76: invokevirtual 44	android/os/Parcel:recycle	()V
        //   79: aload_3
        //   80: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	81	0	this	a
        //   3	73	1	localParcel1	Parcel
        //   7	65	2	localParcel2	Parcel
        //   70	10	3	localObject	Object
        //   51	15	5	localPendingIntent	PendingIntent
        // Exception table:
        //   from	to	target	type
        //   8	53	70	finally
      }
      
      public void reinitialize()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusOneDelegate");
          this.a.transact(3, localParcel1, localParcel2, 0);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/br.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */