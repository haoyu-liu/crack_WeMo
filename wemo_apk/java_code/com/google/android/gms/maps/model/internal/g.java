package com.google.android.gms.maps.model.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.Tile;

public abstract interface g
  extends IInterface
{
  public abstract Tile getTile(int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements g
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.model.internal.ITileProviderDelegate");
    }
    
    public static g U(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.model.internal.ITileProviderDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof g))) {
        return (g)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.model.internal.ITileProviderDelegate");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.ITileProviderDelegate");
      Tile localTile = getTile(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
      paramParcel2.writeNoException();
      if (localTile != null)
      {
        paramParcel2.writeInt(1);
        localTile.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    }
    
    private static class a
      implements g
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
      public Tile getTile(int paramInt1, int paramInt2, int paramInt3)
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
        //   17: aload 4
        //   19: iload_1
        //   20: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   23: aload 4
        //   25: iload_2
        //   26: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   29: aload 4
        //   31: iload_3
        //   32: invokevirtual 37	android/os/Parcel:writeInt	(I)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/maps/model/internal/g$a$a:a	Landroid/os/IBinder;
        //   39: iconst_1
        //   40: aload 4
        //   42: aload 5
        //   44: iconst_0
        //   45: invokeinterface 43 5 0
        //   50: pop
        //   51: aload 5
        //   53: invokevirtual 46	android/os/Parcel:readException	()V
        //   56: aload 5
        //   58: invokevirtual 50	android/os/Parcel:readInt	()I
        //   61: ifeq +30 -> 91
        //   64: getstatic 56	com/google/android/gms/maps/model/Tile:CREATOR	Lcom/google/android/gms/maps/model/TileCreator;
        //   67: aload 5
        //   69: invokevirtual 62	com/google/android/gms/maps/model/TileCreator:createFromParcel	(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/Tile;
        //   72: astore 9
        //   74: aload 9
        //   76: astore 8
        //   78: aload 5
        //   80: invokevirtual 65	android/os/Parcel:recycle	()V
        //   83: aload 4
        //   85: invokevirtual 65	android/os/Parcel:recycle	()V
        //   88: aload 8
        //   90: areturn
        //   91: aconst_null
        //   92: astore 8
        //   94: goto -16 -> 78
        //   97: astore 6
        //   99: aload 5
        //   101: invokevirtual 65	android/os/Parcel:recycle	()V
        //   104: aload 4
        //   106: invokevirtual 65	android/os/Parcel:recycle	()V
        //   109: aload 6
        //   111: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	112	0	this	a
        //   0	112	1	paramInt1	int
        //   0	112	2	paramInt2	int
        //   0	112	3	paramInt3	int
        //   3	102	4	localParcel1	Parcel
        //   8	92	5	localParcel2	Parcel
        //   97	13	6	localObject	Object
        //   76	17	8	localTile1	Tile
        //   72	3	9	localTile2	Tile
        // Exception table:
        //   from	to	target	type
        //   10	74	97	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/internal/g.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */