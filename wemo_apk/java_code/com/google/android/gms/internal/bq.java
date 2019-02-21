package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.dynamic.b.a;

public abstract interface bq
  extends IInterface
{
  public abstract b a(b paramb, int paramInt1, int paramInt2, String paramString, int paramInt3)
    throws RemoteException;
  
  public abstract b a(b paramb, int paramInt1, int paramInt2, String paramString1, String paramString2)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements bq
  {
    public static bq Z(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
      if ((localIInterface != null) && ((localIInterface instanceof bq))) {
        return (bq)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
        b localb2 = a(b.a.l(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        if (localb2 != null) {}
        for (IBinder localIBinder2 = localb2.asBinder();; localIBinder2 = null)
        {
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
      b localb1 = a(b.a.l(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.readString());
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localb1 != null) {
        localIBinder1 = localb1.asBinder();
      }
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }
    
    private static class a
      implements bq
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public b a(b paramb, int paramInt1, int paramInt2, String paramString, int paramInt3)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 6
        //   5: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 7
        //   10: aload 6
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +88 -> 106
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: iload_2
        //   39: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   42: aload 6
        //   44: iload_3
        //   45: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   48: aload 6
        //   50: aload 4
        //   52: invokevirtual 46	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   55: aload 6
        //   57: iload 5
        //   59: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   62: aload_0
        //   63: getfield 15	com/google/android/gms/internal/bq$a$a:a	Landroid/os/IBinder;
        //   66: iconst_1
        //   67: aload 6
        //   69: aload 7
        //   71: iconst_0
        //   72: invokeinterface 52 5 0
        //   77: pop
        //   78: aload 7
        //   80: invokevirtual 55	android/os/Parcel:readException	()V
        //   83: aload 7
        //   85: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   88: invokestatic 64	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   91: astore 11
        //   93: aload 7
        //   95: invokevirtual 67	android/os/Parcel:recycle	()V
        //   98: aload 6
        //   100: invokevirtual 67	android/os/Parcel:recycle	()V
        //   103: aload 11
        //   105: areturn
        //   106: aconst_null
        //   107: astore 9
        //   109: goto -80 -> 29
        //   112: astore 8
        //   114: aload 7
        //   116: invokevirtual 67	android/os/Parcel:recycle	()V
        //   119: aload 6
        //   121: invokevirtual 67	android/os/Parcel:recycle	()V
        //   124: aload 8
        //   126: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	127	0	this	a
        //   0	127	1	paramb	b
        //   0	127	2	paramInt1	int
        //   0	127	3	paramInt2	int
        //   0	127	4	paramString	String
        //   0	127	5	paramInt3	int
        //   3	117	6	localParcel1	Parcel
        //   8	107	7	localParcel2	Parcel
        //   112	13	8	localObject	Object
        //   27	81	9	localIBinder	IBinder
        //   91	13	11	localb	b
        // Exception table:
        //   from	to	target	type
        //   10	17	112	finally
        //   21	29	112	finally
        //   29	93	112	finally
      }
      
      /* Error */
      public b a(b paramb, int paramInt1, int paramInt2, String paramString1, String paramString2)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 6
        //   5: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 7
        //   10: aload 6
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +88 -> 106
        //   21: aload_1
        //   22: invokeinterface 36 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 39	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: iload_2
        //   39: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   42: aload 6
        //   44: iload_3
        //   45: invokevirtual 43	android/os/Parcel:writeInt	(I)V
        //   48: aload 6
        //   50: aload 4
        //   52: invokevirtual 46	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   55: aload 6
        //   57: aload 5
        //   59: invokevirtual 46	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   62: aload_0
        //   63: getfield 15	com/google/android/gms/internal/bq$a$a:a	Landroid/os/IBinder;
        //   66: iconst_2
        //   67: aload 6
        //   69: aload 7
        //   71: iconst_0
        //   72: invokeinterface 52 5 0
        //   77: pop
        //   78: aload 7
        //   80: invokevirtual 55	android/os/Parcel:readException	()V
        //   83: aload 7
        //   85: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   88: invokestatic 64	com/google/android/gms/dynamic/b$a:l	(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/b;
        //   91: astore 11
        //   93: aload 7
        //   95: invokevirtual 67	android/os/Parcel:recycle	()V
        //   98: aload 6
        //   100: invokevirtual 67	android/os/Parcel:recycle	()V
        //   103: aload 11
        //   105: areturn
        //   106: aconst_null
        //   107: astore 9
        //   109: goto -80 -> 29
        //   112: astore 8
        //   114: aload 7
        //   116: invokevirtual 67	android/os/Parcel:recycle	()V
        //   119: aload 6
        //   121: invokevirtual 67	android/os/Parcel:recycle	()V
        //   124: aload 8
        //   126: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	127	0	this	a
        //   0	127	1	paramb	b
        //   0	127	2	paramInt1	int
        //   0	127	3	paramInt2	int
        //   0	127	4	paramString1	String
        //   0	127	5	paramString2	String
        //   3	117	6	localParcel1	Parcel
        //   8	107	7	localParcel2	Parcel
        //   112	13	8	localObject	Object
        //   27	81	9	localIBinder	IBinder
        //   91	13	11	localb	b
        // Exception table:
        //   from	to	target	type
        //   10	17	112	finally
        //   21	29	112	finally
        //   29	93	112	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bq.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */