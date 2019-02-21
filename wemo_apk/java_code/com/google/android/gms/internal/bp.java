package com.google.android.gms.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.d;
import com.google.android.gms.common.data.e;
import java.util.List;

public abstract interface bp
  extends IInterface
{
  public abstract void E(String paramString)
    throws RemoteException;
  
  public abstract void a(int paramInt1, Bundle paramBundle, int paramInt2)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, ParcelFileDescriptor paramParcelFileDescriptor)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, ak paramak)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, co paramco)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, cq paramcq)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, String paramString)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, String paramString, bv parambv)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
    throws RemoteException;
  
  public abstract void a(int paramInt, Bundle paramBundle, List<x> paramList)
    throws RemoteException;
  
  public abstract void a(d paramd, String paramString)
    throws RemoteException;
  
  public abstract void a(d paramd, String paramString1, String paramString2)
    throws RemoteException;
  
  public abstract void b(int paramInt, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void b(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
    throws RemoteException;
  
  public abstract void b(d paramd, String paramString)
    throws RemoteException;
  
  public abstract void c(int paramInt, Bundle paramBundle)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements bp
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.plus.internal.IPlusCallbacks");
    }
    
    public static bp Y(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof bp))) {
        return (bp)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusCallbacks");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i16 = paramParcel1.readInt();
        Bundle localBundle14;
        if (paramParcel1.readInt() != 0)
        {
          localBundle14 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label250;
          }
        }
        for (Bundle localBundle15 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle15 = null)
        {
          a(i16, localBundle14, localBundle15);
          paramParcel2.writeNoException();
          return true;
          localBundle14 = null;
          break;
        }
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i15 = paramParcel1.readInt();
        Bundle localBundle13;
        if (paramParcel1.readInt() != 0)
        {
          localBundle13 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label332;
          }
        }
        for (ParcelFileDescriptor localParcelFileDescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(paramParcel1);; localParcelFileDescriptor = null)
        {
          a(i15, localBundle13, localParcelFileDescriptor);
          paramParcel2.writeNoException();
          return true;
          localBundle13 = null;
          break;
        }
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        E(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i14 = paramParcel1.readInt();
        d locald3 = null;
        if (i14 != 0) {
          locald3 = d.CREATOR.a(paramParcel1);
        }
        a(locald3, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i12 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle12 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle12 = null)
        {
          int i13 = paramParcel1.readInt();
          ak localak = null;
          if (i13 != 0) {
            localak = ak.CREATOR.m(paramParcel1);
          }
          a(i12, localBundle12, localak);
          paramParcel2.writeNoException();
          return true;
        }
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i11 = paramParcel1.readInt();
        d locald2 = null;
        if (i11 != 0) {
          locald2 = d.CREATOR.a(paramParcel1);
        }
        a(locald2, paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i10 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle11 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle11 = null)
        {
          b(i10, localBundle11);
          paramParcel2.writeNoException();
          return true;
        }
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i9 = paramParcel1.readInt();
        d locald1 = null;
        if (i9 != 0) {
          locald1 = d.CREATOR.a(paramParcel1);
        }
        b(locald1, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i8 = paramParcel1.readInt();
        Bundle localBundle9;
        if (paramParcel1.readInt() != 0)
        {
          localBundle9 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label704;
          }
        }
        for (Bundle localBundle10 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle10 = null)
        {
          b(i8, localBundle9, localBundle10);
          paramParcel2.writeNoException();
          return true;
          localBundle9 = null;
          break;
        }
      case 10: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i6 = paramParcel1.readInt();
        int i7 = paramParcel1.readInt();
        Bundle localBundle8 = null;
        if (i7 != 0) {
          localBundle8 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        }
        a(i6, localBundle8, paramParcel1.readString(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList());
        paramParcel2.writeNoException();
        return true;
      case 11: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i4 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle7 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle7 = null)
        {
          String str = paramParcel1.readString();
          int i5 = paramParcel1.readInt();
          bv localbv = null;
          if (i5 != 0) {
            localbv = bv.CREATOR.v(paramParcel1);
          }
          a(i4, localBundle7, str, localbv);
          paramParcel2.writeNoException();
          return true;
        }
      case 12: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i3 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle6 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle6 = null)
        {
          c(i3, localBundle6);
          paramParcel2.writeNoException();
          return true;
        }
      case 13: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i1 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle5 = null)
        {
          int i2 = paramParcel1.readInt();
          co localco = null;
          if (i2 != 0) {
            localco = co.CREATOR.I(paramParcel1);
          }
          a(i1, localBundle5, localco);
          paramParcel2.writeNoException();
          return true;
        }
      case 14: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int m = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle4 = null)
        {
          int n = paramParcel1.readInt();
          cq localcq = null;
          if (n != 0) {
            localcq = cq.CREATOR.J(paramParcel1);
          }
          a(m, localBundle4, localcq);
          paramParcel2.writeNoException();
          return true;
        }
      case 15: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int k = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle3 = null)
        {
          a(k, localBundle3, paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 16: 
        label250:
        label332:
        label704:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int j = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle2 = null)
        {
          a(j, localBundle2, paramParcel1.createTypedArrayList(x.CREATOR));
          paramParcel2.writeNoException();
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
      int i = paramParcel1.readInt();
      if (paramParcel1.readInt() != 0) {}
      for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle1 = null)
      {
        a(i, localBundle1, paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      }
    }
    
    private static class a
      implements bp
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      public void E(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          localParcel1.writeString(paramString);
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
      
      /* Error */
      public void a(int paramInt1, Bundle paramBundle, int paramInt2)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 27
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload 4
        //   19: iload_1
        //   20: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   23: aload_2
        //   24: ifnull +55 -> 79
        //   27: aload 4
        //   29: iconst_1
        //   30: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   33: aload_2
        //   34: aload 4
        //   36: iconst_0
        //   37: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   40: aload 4
        //   42: iload_3
        //   43: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   46: aload_0
        //   47: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   50: bipush 17
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 39 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 42	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 45	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 45	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aload 4
        //   81: iconst_0
        //   82: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   85: goto -45 -> 40
        //   88: astore 6
        //   90: aload 5
        //   92: invokevirtual 45	android/os/Parcel:recycle	()V
        //   95: aload 4
        //   97: invokevirtual 45	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramInt1	int
        //   0	103	2	paramBundle	Bundle
        //   0	103	3	paramInt2	int
        //   3	93	4	localParcel1	Parcel
        //   8	83	5	localParcel2	Parcel
        //   88	13	6	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   10	23	88	finally
        //   27	40	88	finally
        //   40	68	88	finally
        //   79	85	88	finally
      }
      
      public void a(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle1 != null)
            {
              localParcel1.writeInt(1);
              paramBundle1.writeToParcel(localParcel1, 0);
              if (paramBundle2 != null)
              {
                localParcel1.writeInt(1);
                paramBundle2.writeToParcel(localParcel1, 0);
                this.a.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void a(int paramInt, Bundle paramBundle, ParcelFileDescriptor paramParcelFileDescriptor)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramParcelFileDescriptor != null)
              {
                localParcel1.writeInt(1);
                paramParcelFileDescriptor.writeToParcel(localParcel1, 0);
                this.a.transact(2, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void a(int paramInt, Bundle paramBundle, ak paramak)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramak != null)
              {
                localParcel1.writeInt(1);
                paramak.writeToParcel(localParcel1, 0);
                this.a.transact(5, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void a(int paramInt, Bundle paramBundle, co paramco)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramco != null)
              {
                localParcel1.writeInt(1);
                paramco.writeToParcel(localParcel1, 0);
                this.a.transact(13, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void a(int paramInt, Bundle paramBundle, cq paramcq)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramcq != null)
              {
                localParcel1.writeInt(1);
                paramcq.writeToParcel(localParcel1, 0);
                this.a.transact(14, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      /* Error */
      public void a(int paramInt, Bundle paramBundle, String paramString)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 27
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload 4
        //   19: iload_1
        //   20: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   23: aload_2
        //   24: ifnull +55 -> 79
        //   27: aload 4
        //   29: iconst_1
        //   30: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   33: aload_2
        //   34: aload 4
        //   36: iconst_0
        //   37: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   40: aload 4
        //   42: aload_3
        //   43: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   46: aload_0
        //   47: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   50: bipush 15
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 39 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 42	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 45	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 45	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aload 4
        //   81: iconst_0
        //   82: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   85: goto -45 -> 40
        //   88: astore 6
        //   90: aload 5
        //   92: invokevirtual 45	android/os/Parcel:recycle	()V
        //   95: aload 4
        //   97: invokevirtual 45	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramInt	int
        //   0	103	2	paramBundle	Bundle
        //   0	103	3	paramString	String
        //   3	93	4	localParcel1	Parcel
        //   8	83	5	localParcel2	Parcel
        //   88	13	6	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   10	23	88	finally
        //   27	40	88	finally
        //   40	68	88	finally
        //   79	85	88	finally
      }
      
      public void a(int paramInt, Bundle paramBundle, String paramString, bv parambv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              localParcel1.writeString(paramString);
              if (parambv != null)
              {
                localParcel1.writeInt(1);
                parambv.writeToParcel(localParcel1, 0);
                this.a.transact(11, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      /* Error */
      public void a(int paramInt, Bundle paramBundle, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 7
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 8
        //   10: aload 7
        //   12: ldc 27
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload 7
        //   19: iload_1
        //   20: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   23: aload_2
        //   24: ifnull +76 -> 100
        //   27: aload 7
        //   29: iconst_1
        //   30: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   33: aload_2
        //   34: aload 7
        //   36: iconst_0
        //   37: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   40: aload 7
        //   42: aload_3
        //   43: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   46: aload 7
        //   48: aload 4
        //   50: invokevirtual 83	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   53: aload 7
        //   55: aload 5
        //   57: invokevirtual 83	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   60: aload 7
        //   62: aload 6
        //   64: invokevirtual 83	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   67: aload_0
        //   68: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   71: bipush 10
        //   73: aload 7
        //   75: aload 8
        //   77: iconst_0
        //   78: invokeinterface 39 5 0
        //   83: pop
        //   84: aload 8
        //   86: invokevirtual 42	android/os/Parcel:readException	()V
        //   89: aload 8
        //   91: invokevirtual 45	android/os/Parcel:recycle	()V
        //   94: aload 7
        //   96: invokevirtual 45	android/os/Parcel:recycle	()V
        //   99: return
        //   100: aload 7
        //   102: iconst_0
        //   103: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   106: goto -66 -> 40
        //   109: astore 9
        //   111: aload 8
        //   113: invokevirtual 45	android/os/Parcel:recycle	()V
        //   116: aload 7
        //   118: invokevirtual 45	android/os/Parcel:recycle	()V
        //   121: aload 9
        //   123: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	124	0	this	a
        //   0	124	1	paramInt	int
        //   0	124	2	paramBundle	Bundle
        //   0	124	3	paramString	String
        //   0	124	4	paramList1	List<String>
        //   0	124	5	paramList2	List<String>
        //   0	124	6	paramList3	List<String>
        //   3	114	7	localParcel1	Parcel
        //   8	104	8	localParcel2	Parcel
        //   109	13	9	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   10	23	109	finally
        //   27	40	109	finally
        //   40	89	109	finally
        //   100	106	109	finally
      }
      
      /* Error */
      public void a(int paramInt, Bundle paramBundle, List<x> paramList)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 27
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload 4
        //   19: iload_1
        //   20: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   23: aload_2
        //   24: ifnull +55 -> 79
        //   27: aload 4
        //   29: iconst_1
        //   30: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   33: aload_2
        //   34: aload 4
        //   36: iconst_0
        //   37: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   40: aload 4
        //   42: aload_3
        //   43: invokevirtual 87	android/os/Parcel:writeTypedList	(Ljava/util/List;)V
        //   46: aload_0
        //   47: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   50: bipush 16
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 39 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 42	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 45	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 45	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aload 4
        //   81: iconst_0
        //   82: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   85: goto -45 -> 40
        //   88: astore 6
        //   90: aload 5
        //   92: invokevirtual 45	android/os/Parcel:recycle	()V
        //   95: aload 4
        //   97: invokevirtual 45	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramInt	int
        //   0	103	2	paramBundle	Bundle
        //   0	103	3	paramList	List<x>
        //   3	93	4	localParcel1	Parcel
        //   8	83	5	localParcel2	Parcel
        //   88	13	6	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   10	23	88	finally
        //   27	40	88	finally
        //   40	68	88	finally
        //   79	85	88	finally
      }
      
      /* Error */
      public void a(d paramd, String paramString)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +49 -> 65
        //   19: aload_3
        //   20: iconst_1
        //   21: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   24: aload_1
        //   25: aload_3
        //   26: iconst_0
        //   27: invokevirtual 91	com/google/android/gms/common/data/d:writeToParcel	(Landroid/os/Parcel;I)V
        //   30: aload_3
        //   31: aload_2
        //   32: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   39: iconst_4
        //   40: aload_3
        //   41: aload 4
        //   43: iconst_0
        //   44: invokeinterface 39 5 0
        //   49: pop
        //   50: aload 4
        //   52: invokevirtual 42	android/os/Parcel:readException	()V
        //   55: aload 4
        //   57: invokevirtual 45	android/os/Parcel:recycle	()V
        //   60: aload_3
        //   61: invokevirtual 45	android/os/Parcel:recycle	()V
        //   64: return
        //   65: aload_3
        //   66: iconst_0
        //   67: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   70: goto -40 -> 30
        //   73: astore 5
        //   75: aload 4
        //   77: invokevirtual 45	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: invokevirtual 45	android/os/Parcel:recycle	()V
        //   84: aload 5
        //   86: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	87	0	this	a
        //   0	87	1	paramd	d
        //   0	87	2	paramString	String
        //   3	78	3	localParcel1	Parcel
        //   7	69	4	localParcel2	Parcel
        //   73	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	15	73	finally
        //   19	30	73	finally
        //   30	55	73	finally
        //   65	70	73	finally
      }
      
      /* Error */
      public void a(d paramd, String paramString1, String paramString2)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 27
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +61 -> 79
        //   21: aload 4
        //   23: iconst_1
        //   24: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   27: aload_1
        //   28: aload 4
        //   30: iconst_0
        //   31: invokevirtual 91	com/google/android/gms/common/data/d:writeToParcel	(Landroid/os/Parcel;I)V
        //   34: aload 4
        //   36: aload_2
        //   37: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   40: aload 4
        //   42: aload_3
        //   43: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   46: aload_0
        //   47: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   50: bipush 6
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 39 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 42	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 45	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 45	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aload 4
        //   81: iconst_0
        //   82: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   85: goto -51 -> 34
        //   88: astore 6
        //   90: aload 5
        //   92: invokevirtual 45	android/os/Parcel:recycle	()V
        //   95: aload 4
        //   97: invokevirtual 45	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	103	0	this	a
        //   0	103	1	paramd	d
        //   0	103	2	paramString1	String
        //   0	103	3	paramString2	String
        //   3	93	4	localParcel1	Parcel
        //   8	83	5	localParcel2	Parcel
        //   88	13	6	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   10	17	88	finally
        //   21	34	88	finally
        //   34	68	88	finally
        //   79	85	88	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      /* Error */
      public void b(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: iload_1
        //   17: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   39: bipush 7
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 39 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 42	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 45	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 45	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   71: goto -36 -> 35
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 45	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 45	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	paramInt	int
        //   0	88	2	paramBundle	Bundle
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	74	finally
        //   24	35	74	finally
        //   35	56	74	finally
        //   66	71	74	finally
      }
      
      public void b(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle1 != null)
            {
              localParcel1.writeInt(1);
              paramBundle1.writeToParcel(localParcel1, 0);
              if (paramBundle2 != null)
              {
                localParcel1.writeInt(1);
                paramBundle2.writeToParcel(localParcel1, 0);
                this.a.transact(9, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      /* Error */
      public void b(d paramd, String paramString)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +50 -> 66
        //   19: aload_3
        //   20: iconst_1
        //   21: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   24: aload_1
        //   25: aload_3
        //   26: iconst_0
        //   27: invokevirtual 91	com/google/android/gms/common/data/d:writeToParcel	(Landroid/os/Parcel;I)V
        //   30: aload_3
        //   31: aload_2
        //   32: invokevirtual 33	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   39: bipush 8
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 39 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 42	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 45	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 45	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   71: goto -41 -> 30
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 45	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 45	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	paramd	d
        //   0	88	2	paramString	String
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	15	74	finally
        //   19	30	74	finally
        //   30	56	74	finally
        //   66	71	74	finally
      }
      
      /* Error */
      public void c(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: iload_1
        //   17: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 56	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	com/google/android/gms/internal/bp$a$a:a	Landroid/os/IBinder;
        //   39: bipush 12
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 39 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 42	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 45	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 45	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 50	android/os/Parcel:writeInt	(I)V
        //   71: goto -36 -> 35
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 45	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 45	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	paramInt	int
        //   0	88	2	paramBundle	Bundle
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	74	finally
        //   24	35	74	finally
        //   35	56	74	finally
        //   66	71	74	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bp.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */