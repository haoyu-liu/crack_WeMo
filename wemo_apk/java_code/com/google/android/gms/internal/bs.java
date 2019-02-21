package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import java.util.ArrayList;
import java.util.List;

public abstract interface bs
  extends IInterface
{
  public abstract void a(ak paramak)
    throws RemoteException;
  
  public abstract void a(bp parambp)
    throws RemoteException;
  
  public abstract void a(bp parambp, int paramInt1, int paramInt2, int paramInt3, String paramString)
    throws RemoteException;
  
  public abstract void a(bp parambp, int paramInt1, int paramInt2, String paramString)
    throws RemoteException;
  
  public abstract void a(bp parambp, int paramInt, String paramString)
    throws RemoteException;
  
  public abstract void a(bp parambp, int paramInt, String paramString1, Uri paramUri, String paramString2)
    throws RemoteException;
  
  public abstract void a(bp parambp, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
    throws RemoteException;
  
  public abstract void a(bp parambp, Uri paramUri, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void a(bp parambp, co paramco)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString1, int paramInt, String paramString2)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, bv parambv)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString1, String paramString2)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString1, String paramString2, int paramInt, String paramString3)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString1, String paramString2, boolean paramBoolean, String paramString3)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, List<x> paramList)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, List<x> paramList, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, List<x> paramList, boolean paramBoolean)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString, boolean paramBoolean)
    throws RemoteException;
  
  public abstract void a(bp parambp, String paramString1, boolean paramBoolean, String paramString2)
    throws RemoteException;
  
  public abstract void a(bp parambp, List<String> paramList)
    throws RemoteException;
  
  public abstract void a(bp parambp, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;
  
  public abstract void b(bp parambp)
    throws RemoteException;
  
  public abstract void b(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void c(bp parambp)
    throws RemoteException;
  
  public abstract void c(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void clearDefaultAccount()
    throws RemoteException;
  
  public abstract void d(bp parambp)
    throws RemoteException;
  
  public abstract void d(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void e(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void f(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void f(String paramString1, String paramString2)
    throws RemoteException;
  
  public abstract void g(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract String getAccountName()
    throws RemoteException;
  
  public abstract void h(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void i(bp parambp, String paramString)
    throws RemoteException;
  
  public abstract void removeMoment(String paramString)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements bs
  {
    public static bs ab(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusService");
      if ((localIInterface != null) && ((localIInterface instanceof bs))) {
        return (bs)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusService");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        b(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        if (paramParcel1.readInt() != 0) {}
        for (ak localak = ak.CREATOR.m(paramParcel1);; localak = null)
        {
          a(localak);
          paramParcel2.writeNoException();
          return true;
        }
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        String str10 = getAccountName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str10);
        return true;
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        clearDefaultAccount();
        paramParcel2.writeNoException();
        return true;
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        c(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp11 = bp.a.Y(paramParcel1.readStrongBinder());
        Uri localUri3;
        if (paramParcel1.readInt() != 0)
        {
          localUri3 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label636;
          }
        }
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle2 = null)
        {
          a(localbp11, localUri3, localBundle2);
          paramParcel2.writeNoException();
          return true;
          localUri3 = null;
          break;
        }
      case 10: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        d(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 11: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        f(paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 13: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        b(bp.a.Y(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 14: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp10 = bp.a.Y(paramParcel1.readStrongBinder());
        int i4 = paramParcel1.readInt();
        String str9 = paramParcel1.readString();
        int i5 = paramParcel1.readInt();
        Uri localUri2 = null;
        if (i5 != 0) {
          localUri2 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        }
        a(localbp10, i4, str9, localUri2, paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 16: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 17: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        removeMoment(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 18: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        e(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 19: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        c(bp.a.Y(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 21: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp9 = bp.a.Y(paramParcel1.readStrongBinder());
        String str8 = paramParcel1.readString();
        int i3 = paramParcel1.readInt();
        boolean bool6 = false;
        if (i3 != 0) {
          bool6 = true;
        }
        a(localbp9, str8, bool6);
        paramParcel2.writeNoException();
        return true;
      case 22: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp8 = bp.a.Y(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (boolean bool4 = true;; bool4 = false)
        {
          int i2 = paramParcel1.readInt();
          boolean bool5 = false;
          if (i2 != 0) {
            bool5 = true;
          }
          a(localbp8, bool4, bool5);
          paramParcel2.writeNoException();
          return true;
        }
      case 23: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList());
        paramParcel2.writeNoException();
        return true;
      case 24: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        f(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 25: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp7 = bp.a.Y(paramParcel1.readStrongBinder());
        String str7 = paramParcel1.readString();
        int i1 = paramParcel1.readInt();
        bv localbv = null;
        if (i1 != 0) {
          localbv = bv.CREATOR.v(paramParcel1);
        }
        a(localbp7, str7, localbv);
        paramParcel2.writeNoException();
        return true;
      case 26: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        g(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 27: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp6 = bp.a.Y(paramParcel1.readStrongBinder());
        String str6 = paramParcel1.readString();
        int n = paramParcel1.readInt();
        boolean bool3 = false;
        if (n != 0) {
          bool3 = true;
        }
        a(localbp6, str6, bool3, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 28: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.createTypedArrayList(x.CREATOR));
        paramParcel2.writeNoException();
        return true;
      case 29: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp5 = bp.a.Y(paramParcel1.readStrongBinder());
        String str5 = paramParcel1.readString();
        ArrayList localArrayList2 = paramParcel1.createTypedArrayList(x.CREATOR);
        int m = paramParcel1.readInt();
        boolean bool2 = false;
        if (m != 0) {
          bool2 = true;
        }
        a(localbp5, str5, localArrayList2, bool2);
        paramParcel2.writeNoException();
        return true;
      case 30: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp4 = bp.a.Y(paramParcel1.readStrongBinder());
        int k = paramParcel1.readInt();
        co localco = null;
        if (k != 0) {
          localco = co.CREATOR.I(paramParcel1);
        }
        a(localbp4, localco);
        paramParcel2.writeNoException();
        return true;
      case 31: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp3 = bp.a.Y(paramParcel1.readStrongBinder());
        String str4 = paramParcel1.readString();
        ArrayList localArrayList1 = paramParcel1.createTypedArrayList(x.CREATOR);
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle1 = null)
        {
          a(localbp3, str4, localArrayList1, localBundle1);
          paramParcel2.writeNoException();
          return true;
        }
      case 32: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp2 = bp.a.Y(paramParcel1.readStrongBinder());
        int i = paramParcel1.readInt();
        String str3 = paramParcel1.readString();
        int j = paramParcel1.readInt();
        Uri localUri1 = null;
        if (j != 0) {
          localUri1 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        }
        a(localbp2, i, str3, localUri1, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 33: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        h(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 34: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.createStringArrayList());
        paramParcel2.writeNoException();
        return true;
      case 35: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        i(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 36: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 37: 
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        bp localbp1 = bp.a.Y(paramParcel1.readStrongBinder());
        String str1 = paramParcel1.readString();
        String str2 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0) {}
        for (boolean bool1 = true;; bool1 = false)
        {
          a(localbp1, str1, str2, bool1, paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 38: 
        label636:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        d(bp.a.Y(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
      a(bp.a.Y(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class a
      implements bs
    {
      private IBinder a;
      
      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }
      
      /* Error */
      public void a(ak paramak)
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
        //   15: ifnull +41 -> 56
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 40	com/google/android/gms/internal/ak:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   33: iconst_4
        //   34: aload_2
        //   35: aload_3
        //   36: iconst_0
        //   37: invokeinterface 46 5 0
        //   42: pop
        //   43: aload_3
        //   44: invokevirtual 49	android/os/Parcel:readException	()V
        //   47: aload_3
        //   48: invokevirtual 52	android/os/Parcel:recycle	()V
        //   51: aload_2
        //   52: invokevirtual 52	android/os/Parcel:recycle	()V
        //   55: return
        //   56: aload_2
        //   57: iconst_0
        //   58: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   61: goto -32 -> 29
        //   64: astore 4
        //   66: aload_3
        //   67: invokevirtual 52	android/os/Parcel:recycle	()V
        //   70: aload_2
        //   71: invokevirtual 52	android/os/Parcel:recycle	()V
        //   74: aload 4
        //   76: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	77	0	this	a
        //   0	77	1	paramak	ak
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
      public void a(bp parambp)
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
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 59 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   36: bipush 8
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 46 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 49	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 52	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 52	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 52	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 52	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parambp	bp
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void a(bp parambp, int paramInt1, int paramInt2, int paramInt3, String paramString)
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
        //   18: ifnull +77 -> 95
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: iload_2
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload 6
        //   44: iload_3
        //   45: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   48: aload 6
        //   50: iload 4
        //   52: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   55: aload 6
        //   57: aload 5
        //   59: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   62: aload_0
        //   63: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   66: bipush 16
        //   68: aload 6
        //   70: aload 7
        //   72: iconst_0
        //   73: invokeinterface 46 5 0
        //   78: pop
        //   79: aload 7
        //   81: invokevirtual 49	android/os/Parcel:readException	()V
        //   84: aload 7
        //   86: invokevirtual 52	android/os/Parcel:recycle	()V
        //   89: aload 6
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: return
        //   95: aconst_null
        //   96: astore 9
        //   98: goto -69 -> 29
        //   101: astore 8
        //   103: aload 7
        //   105: invokevirtual 52	android/os/Parcel:recycle	()V
        //   108: aload 6
        //   110: invokevirtual 52	android/os/Parcel:recycle	()V
        //   113: aload 8
        //   115: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	116	0	this	a
        //   0	116	1	parambp	bp
        //   0	116	2	paramInt1	int
        //   0	116	3	paramInt2	int
        //   0	116	4	paramInt3	int
        //   0	116	5	paramString	String
        //   3	106	6	localParcel1	Parcel
        //   8	96	7	localParcel2	Parcel
        //   101	13	8	localObject	Object
        //   27	70	9	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	101	finally
        //   21	29	101	finally
        //   29	84	101	finally
      }
      
      /* Error */
      public void a(bp parambp, int paramInt1, int paramInt2, String paramString)
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
        //   18: ifnull +70 -> 88
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: iload_2
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload 5
        //   44: iload_3
        //   45: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   48: aload 5
        //   50: aload 4
        //   52: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   55: aload_0
        //   56: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   59: bipush 39
        //   61: aload 5
        //   63: aload 6
        //   65: iconst_0
        //   66: invokeinterface 46 5 0
        //   71: pop
        //   72: aload 6
        //   74: invokevirtual 49	android/os/Parcel:readException	()V
        //   77: aload 6
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload 5
        //   84: invokevirtual 52	android/os/Parcel:recycle	()V
        //   87: return
        //   88: aconst_null
        //   89: astore 8
        //   91: goto -62 -> 29
        //   94: astore 7
        //   96: aload 6
        //   98: invokevirtual 52	android/os/Parcel:recycle	()V
        //   101: aload 5
        //   103: invokevirtual 52	android/os/Parcel:recycle	()V
        //   106: aload 7
        //   108: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	109	0	this	a
        //   0	109	1	parambp	bp
        //   0	109	2	paramInt1	int
        //   0	109	3	paramInt2	int
        //   0	109	4	paramString	String
        //   3	99	5	localParcel1	Parcel
        //   8	89	6	localParcel2	Parcel
        //   94	13	7	localObject	Object
        //   27	63	8	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	94	finally
        //   21	29	94	finally
        //   29	77	94	finally
      }
      
      /* Error */
      public void a(bp parambp, int paramInt, String paramString)
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
        //   18: ifnull +63 -> 81
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: iload_2
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload 4
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   52: bipush 20
        //   54: aload 4
        //   56: aload 5
        //   58: iconst_0
        //   59: invokeinterface 46 5 0
        //   64: pop
        //   65: aload 5
        //   67: invokevirtual 49	android/os/Parcel:readException	()V
        //   70: aload 5
        //   72: invokevirtual 52	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: invokevirtual 52	android/os/Parcel:recycle	()V
        //   80: return
        //   81: aconst_null
        //   82: astore 7
        //   84: goto -55 -> 29
        //   87: astore 6
        //   89: aload 5
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: aload 4
        //   96: invokevirtual 52	android/os/Parcel:recycle	()V
        //   99: aload 6
        //   101: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	102	0	this	a
        //   0	102	1	parambp	bp
        //   0	102	2	paramInt	int
        //   0	102	3	paramString	String
        //   3	92	4	localParcel1	Parcel
        //   8	82	5	localParcel2	Parcel
        //   87	13	6	localObject	Object
        //   27	56	7	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	87	finally
        //   21	29	87	finally
        //   29	70	87	finally
      }
      
      /* Error */
      public void a(bp parambp, int paramInt, String paramString1, Uri paramUri, String paramString2)
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
        //   18: ifnull +89 -> 107
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: iload_2
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload 6
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload 4
        //   50: ifnull +63 -> 113
        //   53: aload 6
        //   55: iconst_1
        //   56: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   59: aload 4
        //   61: aload 6
        //   63: iconst_0
        //   64: invokevirtual 72	android/net/Uri:writeToParcel	(Landroid/os/Parcel;I)V
        //   67: aload 6
        //   69: aload 5
        //   71: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   74: aload_0
        //   75: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   78: bipush 32
        //   80: aload 6
        //   82: aload 7
        //   84: iconst_0
        //   85: invokeinterface 46 5 0
        //   90: pop
        //   91: aload 7
        //   93: invokevirtual 49	android/os/Parcel:readException	()V
        //   96: aload 7
        //   98: invokevirtual 52	android/os/Parcel:recycle	()V
        //   101: aload 6
        //   103: invokevirtual 52	android/os/Parcel:recycle	()V
        //   106: return
        //   107: aconst_null
        //   108: astore 9
        //   110: goto -81 -> 29
        //   113: aload 6
        //   115: iconst_0
        //   116: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   119: goto -52 -> 67
        //   122: astore 8
        //   124: aload 7
        //   126: invokevirtual 52	android/os/Parcel:recycle	()V
        //   129: aload 6
        //   131: invokevirtual 52	android/os/Parcel:recycle	()V
        //   134: aload 8
        //   136: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	137	0	this	a
        //   0	137	1	parambp	bp
        //   0	137	2	paramInt	int
        //   0	137	3	paramString1	String
        //   0	137	4	paramUri	Uri
        //   0	137	5	paramString2	String
        //   3	127	6	localParcel1	Parcel
        //   8	117	7	localParcel2	Parcel
        //   122	13	8	localObject	Object
        //   27	82	9	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	122	finally
        //   21	29	122	finally
        //   29	48	122	finally
        //   53	67	122	finally
        //   67	96	122	finally
        //   113	119	122	finally
      }
      
      /* Error */
      public void a(bp parambp, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 7
        //   5: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 8
        //   10: aload 7
        //   12: ldc 26
        //   14: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +96 -> 114
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 10
        //   29: aload 7
        //   31: aload 10
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 7
        //   38: iload_2
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload 7
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload 4
        //   50: ifnull +70 -> 120
        //   53: aload 7
        //   55: iconst_1
        //   56: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   59: aload 4
        //   61: aload 7
        //   63: iconst_0
        //   64: invokevirtual 72	android/net/Uri:writeToParcel	(Landroid/os/Parcel;I)V
        //   67: aload 7
        //   69: aload 5
        //   71: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   74: aload 7
        //   76: aload 6
        //   78: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   81: aload_0
        //   82: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   85: bipush 14
        //   87: aload 7
        //   89: aload 8
        //   91: iconst_0
        //   92: invokeinterface 46 5 0
        //   97: pop
        //   98: aload 8
        //   100: invokevirtual 49	android/os/Parcel:readException	()V
        //   103: aload 8
        //   105: invokevirtual 52	android/os/Parcel:recycle	()V
        //   108: aload 7
        //   110: invokevirtual 52	android/os/Parcel:recycle	()V
        //   113: return
        //   114: aconst_null
        //   115: astore 10
        //   117: goto -88 -> 29
        //   120: aload 7
        //   122: iconst_0
        //   123: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   126: goto -59 -> 67
        //   129: astore 9
        //   131: aload 8
        //   133: invokevirtual 52	android/os/Parcel:recycle	()V
        //   136: aload 7
        //   138: invokevirtual 52	android/os/Parcel:recycle	()V
        //   141: aload 9
        //   143: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	144	0	this	a
        //   0	144	1	parambp	bp
        //   0	144	2	paramInt	int
        //   0	144	3	paramString1	String
        //   0	144	4	paramUri	Uri
        //   0	144	5	paramString2	String
        //   0	144	6	paramString3	String
        //   3	134	7	localParcel1	Parcel
        //   8	124	8	localParcel2	Parcel
        //   129	13	9	localObject	Object
        //   27	89	10	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	129	finally
        //   21	29	129	finally
        //   29	48	129	finally
        //   53	67	129	finally
        //   67	103	129	finally
        //   120	126	129	finally
      }
      
      public void a(bp parambp, Uri paramUri, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        label133:
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
            IBinder localIBinder;
            if (parambp != null)
            {
              localIBinder = parambp.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              if (paramUri != null)
              {
                localParcel1.writeInt(1);
                paramUri.writeToParcel(localParcel1, 0);
                if (paramBundle == null) {
                  break label133;
                }
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.a.transact(9, localParcel1, localParcel2, 0);
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
      
      /* Error */
      public void a(bp parambp, co paramco)
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
        //   16: ifnull +63 -> 79
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_2
        //   34: ifnull +51 -> 85
        //   37: aload_3
        //   38: iconst_1
        //   39: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   42: aload_2
        //   43: aload_3
        //   44: iconst_0
        //   45: invokevirtual 81	com/google/android/gms/internal/co:writeToParcel	(Landroid/os/Parcel;I)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   52: bipush 30
        //   54: aload_3
        //   55: aload 4
        //   57: iconst_0
        //   58: invokeinterface 46 5 0
        //   63: pop
        //   64: aload 4
        //   66: invokevirtual 49	android/os/Parcel:readException	()V
        //   69: aload 4
        //   71: invokevirtual 52	android/os/Parcel:recycle	()V
        //   74: aload_3
        //   75: invokevirtual 52	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aconst_null
        //   80: astore 6
        //   82: goto -55 -> 27
        //   85: aload_3
        //   86: iconst_0
        //   87: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   90: goto -42 -> 48
        //   93: astore 5
        //   95: aload 4
        //   97: invokevirtual 52	android/os/Parcel:recycle	()V
        //   100: aload_3
        //   101: invokevirtual 52	android/os/Parcel:recycle	()V
        //   104: aload 5
        //   106: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	107	0	this	a
        //   0	107	1	parambp	bp
        //   0	107	2	paramco	co
        //   3	98	3	localParcel1	Parcel
        //   7	89	4	localParcel2	Parcel
        //   93	12	5	localObject	Object
        //   25	56	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	93	finally
        //   19	27	93	finally
        //   27	33	93	finally
        //   37	48	93	finally
        //   48	69	93	finally
        //   85	90	93	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString)
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
        //   16: ifnull +52 -> 68
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: iconst_1
        //   43: aload_3
        //   44: aload 4
        //   46: iconst_0
        //   47: invokeinterface 46 5 0
        //   52: pop
        //   53: aload 4
        //   55: invokevirtual 49	android/os/Parcel:readException	()V
        //   58: aload 4
        //   60: invokevirtual 52	android/os/Parcel:recycle	()V
        //   63: aload_3
        //   64: invokevirtual 52	android/os/Parcel:recycle	()V
        //   67: return
        //   68: aconst_null
        //   69: astore 6
        //   71: goto -44 -> 27
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 52	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 52	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	parambp	bp
        //   0	88	2	paramString	String
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        //   25	45	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	74	finally
        //   19	27	74	finally
        //   27	58	74	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString1, int paramInt, String paramString2)
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
        //   18: ifnull +70 -> 88
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 5
        //   44: iload_3
        //   45: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   48: aload 5
        //   50: aload 4
        //   52: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   55: aload_0
        //   56: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   59: bipush 36
        //   61: aload 5
        //   63: aload 6
        //   65: iconst_0
        //   66: invokeinterface 46 5 0
        //   71: pop
        //   72: aload 6
        //   74: invokevirtual 49	android/os/Parcel:readException	()V
        //   77: aload 6
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload 5
        //   84: invokevirtual 52	android/os/Parcel:recycle	()V
        //   87: return
        //   88: aconst_null
        //   89: astore 8
        //   91: goto -62 -> 29
        //   94: astore 7
        //   96: aload 6
        //   98: invokevirtual 52	android/os/Parcel:recycle	()V
        //   101: aload 5
        //   103: invokevirtual 52	android/os/Parcel:recycle	()V
        //   106: aload 7
        //   108: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	109	0	this	a
        //   0	109	1	parambp	bp
        //   0	109	2	paramString1	String
        //   0	109	3	paramInt	int
        //   0	109	4	paramString2	String
        //   3	99	5	localParcel1	Parcel
        //   8	89	6	localParcel2	Parcel
        //   94	13	7	localObject	Object
        //   27	63	8	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	94	finally
        //   21	29	94	finally
        //   29	77	94	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, bv parambv)
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
        //   22: invokeinterface 59 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload_3
        //   43: ifnull +55 -> 98
        //   46: aload 4
        //   48: iconst_1
        //   49: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   52: aload_3
        //   53: aload 4
        //   55: iconst_0
        //   56: invokevirtual 87	com/google/android/gms/internal/bv:writeToParcel	(Landroid/os/Parcel;I)V
        //   59: aload_0
        //   60: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   63: bipush 25
        //   65: aload 4
        //   67: aload 5
        //   69: iconst_0
        //   70: invokeinterface 46 5 0
        //   75: pop
        //   76: aload 5
        //   78: invokevirtual 49	android/os/Parcel:readException	()V
        //   81: aload 5
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: invokevirtual 52	android/os/Parcel:recycle	()V
        //   91: return
        //   92: aconst_null
        //   93: astore 7
        //   95: goto -66 -> 29
        //   98: aload 4
        //   100: iconst_0
        //   101: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   104: goto -45 -> 59
        //   107: astore 6
        //   109: aload 5
        //   111: invokevirtual 52	android/os/Parcel:recycle	()V
        //   114: aload 4
        //   116: invokevirtual 52	android/os/Parcel:recycle	()V
        //   119: aload 6
        //   121: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	122	0	this	a
        //   0	122	1	parambp	bp
        //   0	122	2	paramString	String
        //   0	122	3	parambv	bv
        //   3	112	4	localParcel1	Parcel
        //   8	102	5	localParcel2	Parcel
        //   107	13	6	localObject	Object
        //   27	67	7	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	107	finally
        //   21	29	107	finally
        //   29	42	107	finally
        //   46	59	107	finally
        //   59	81	107	finally
        //   98	104	107	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString1, String paramString2)
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
        //   18: ifnull +62 -> 80
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 4
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   52: iconst_2
        //   53: aload 4
        //   55: aload 5
        //   57: iconst_0
        //   58: invokeinterface 46 5 0
        //   63: pop
        //   64: aload 5
        //   66: invokevirtual 49	android/os/Parcel:readException	()V
        //   69: aload 5
        //   71: invokevirtual 52	android/os/Parcel:recycle	()V
        //   74: aload 4
        //   76: invokevirtual 52	android/os/Parcel:recycle	()V
        //   79: return
        //   80: aconst_null
        //   81: astore 7
        //   83: goto -54 -> 29
        //   86: astore 6
        //   88: aload 5
        //   90: invokevirtual 52	android/os/Parcel:recycle	()V
        //   93: aload 4
        //   95: invokevirtual 52	android/os/Parcel:recycle	()V
        //   98: aload 6
        //   100: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	101	0	this	a
        //   0	101	1	parambp	bp
        //   0	101	2	paramString1	String
        //   0	101	3	paramString2	String
        //   3	91	4	localParcel1	Parcel
        //   8	81	5	localParcel2	Parcel
        //   86	13	6	localObject	Object
        //   27	55	7	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	86	finally
        //   21	29	86	finally
        //   29	69	86	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString1, String paramString2, int paramInt, String paramString3)
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
        //   18: ifnull +77 -> 95
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 6
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: aload 6
        //   50: iload 4
        //   52: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   55: aload 6
        //   57: aload 5
        //   59: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   62: aload_0
        //   63: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   66: bipush 12
        //   68: aload 6
        //   70: aload 7
        //   72: iconst_0
        //   73: invokeinterface 46 5 0
        //   78: pop
        //   79: aload 7
        //   81: invokevirtual 49	android/os/Parcel:readException	()V
        //   84: aload 7
        //   86: invokevirtual 52	android/os/Parcel:recycle	()V
        //   89: aload 6
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: return
        //   95: aconst_null
        //   96: astore 9
        //   98: goto -69 -> 29
        //   101: astore 8
        //   103: aload 7
        //   105: invokevirtual 52	android/os/Parcel:recycle	()V
        //   108: aload 6
        //   110: invokevirtual 52	android/os/Parcel:recycle	()V
        //   113: aload 8
        //   115: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	116	0	this	a
        //   0	116	1	parambp	bp
        //   0	116	2	paramString1	String
        //   0	116	3	paramString2	String
        //   0	116	4	paramInt	int
        //   0	116	5	paramString3	String
        //   3	106	6	localParcel1	Parcel
        //   8	96	7	localParcel2	Parcel
        //   101	13	8	localObject	Object
        //   27	70	9	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	101	finally
        //   21	29	101	finally
        //   29	84	101	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString1, String paramString2, boolean paramBoolean, String paramString3)
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
        //   22: invokeinterface 59 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 6
        //   44: aload_3
        //   45: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   48: iconst_0
        //   49: istore 10
        //   51: iload 4
        //   53: ifeq +6 -> 59
        //   56: iconst_1
        //   57: istore 10
        //   59: aload 6
        //   61: iload 10
        //   63: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   66: aload 6
        //   68: aload 5
        //   70: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   73: aload_0
        //   74: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   77: bipush 37
        //   79: aload 6
        //   81: aload 7
        //   83: iconst_0
        //   84: invokeinterface 46 5 0
        //   89: pop
        //   90: aload 7
        //   92: invokevirtual 49	android/os/Parcel:readException	()V
        //   95: aload 7
        //   97: invokevirtual 52	android/os/Parcel:recycle	()V
        //   100: aload 6
        //   102: invokevirtual 52	android/os/Parcel:recycle	()V
        //   105: return
        //   106: aconst_null
        //   107: astore 9
        //   109: goto -80 -> 29
        //   112: astore 8
        //   114: aload 7
        //   116: invokevirtual 52	android/os/Parcel:recycle	()V
        //   119: aload 6
        //   121: invokevirtual 52	android/os/Parcel:recycle	()V
        //   124: aload 8
        //   126: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	127	0	this	a
        //   0	127	1	parambp	bp
        //   0	127	2	paramString1	String
        //   0	127	3	paramString2	String
        //   0	127	4	paramBoolean	boolean
        //   0	127	5	paramString3	String
        //   3	117	6	localParcel1	Parcel
        //   8	107	7	localParcel2	Parcel
        //   112	13	8	localObject	Object
        //   27	81	9	localIBinder	IBinder
        //   49	13	10	i	int
        // Exception table:
        //   from	to	target	type
        //   10	17	112	finally
        //   21	29	112	finally
        //   29	48	112	finally
        //   59	95	112	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, List<x> paramList)
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
        //   18: ifnull +63 -> 81
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 4
        //   44: aload_3
        //   45: invokevirtual 95	android/os/Parcel:writeTypedList	(Ljava/util/List;)V
        //   48: aload_0
        //   49: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   52: bipush 28
        //   54: aload 4
        //   56: aload 5
        //   58: iconst_0
        //   59: invokeinterface 46 5 0
        //   64: pop
        //   65: aload 5
        //   67: invokevirtual 49	android/os/Parcel:readException	()V
        //   70: aload 5
        //   72: invokevirtual 52	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: invokevirtual 52	android/os/Parcel:recycle	()V
        //   80: return
        //   81: aconst_null
        //   82: astore 7
        //   84: goto -55 -> 29
        //   87: astore 6
        //   89: aload 5
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: aload 4
        //   96: invokevirtual 52	android/os/Parcel:recycle	()V
        //   99: aload 6
        //   101: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	102	0	this	a
        //   0	102	1	parambp	bp
        //   0	102	2	paramString	String
        //   0	102	3	paramList	List<x>
        //   3	92	4	localParcel1	Parcel
        //   8	82	5	localParcel2	Parcel
        //   87	13	6	localObject	Object
        //   27	56	7	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	87	finally
        //   21	29	87	finally
        //   29	70	87	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, List<x> paramList, Bundle paramBundle)
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
        //   18: ifnull +82 -> 100
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 5
        //   44: aload_3
        //   45: invokevirtual 95	android/os/Parcel:writeTypedList	(Ljava/util/List;)V
        //   48: aload 4
        //   50: ifnull +56 -> 106
        //   53: aload 5
        //   55: iconst_1
        //   56: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   59: aload 4
        //   61: aload 5
        //   63: iconst_0
        //   64: invokevirtual 77	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   67: aload_0
        //   68: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   71: bipush 31
        //   73: aload 5
        //   75: aload 6
        //   77: iconst_0
        //   78: invokeinterface 46 5 0
        //   83: pop
        //   84: aload 6
        //   86: invokevirtual 49	android/os/Parcel:readException	()V
        //   89: aload 6
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: aload 5
        //   96: invokevirtual 52	android/os/Parcel:recycle	()V
        //   99: return
        //   100: aconst_null
        //   101: astore 8
        //   103: goto -74 -> 29
        //   106: aload 5
        //   108: iconst_0
        //   109: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   112: goto -45 -> 67
        //   115: astore 7
        //   117: aload 6
        //   119: invokevirtual 52	android/os/Parcel:recycle	()V
        //   122: aload 5
        //   124: invokevirtual 52	android/os/Parcel:recycle	()V
        //   127: aload 7
        //   129: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	130	0	this	a
        //   0	130	1	parambp	bp
        //   0	130	2	paramString	String
        //   0	130	3	paramList	List<x>
        //   0	130	4	paramBundle	Bundle
        //   3	120	5	localParcel1	Parcel
        //   8	110	6	localParcel2	Parcel
        //   115	13	7	localObject	Object
        //   27	75	8	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	115	finally
        //   21	29	115	finally
        //   29	48	115	finally
        //   53	67	115	finally
        //   67	89	115	finally
        //   106	112	115	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
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
        //   18: ifnull +77 -> 95
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 9
        //   29: aload 6
        //   31: aload 9
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 6
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 6
        //   44: aload_3
        //   45: invokevirtual 100	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   48: aload 6
        //   50: aload 4
        //   52: invokevirtual 100	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   55: aload 6
        //   57: aload 5
        //   59: invokevirtual 100	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   62: aload_0
        //   63: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   66: bipush 23
        //   68: aload 6
        //   70: aload 7
        //   72: iconst_0
        //   73: invokeinterface 46 5 0
        //   78: pop
        //   79: aload 7
        //   81: invokevirtual 49	android/os/Parcel:readException	()V
        //   84: aload 7
        //   86: invokevirtual 52	android/os/Parcel:recycle	()V
        //   89: aload 6
        //   91: invokevirtual 52	android/os/Parcel:recycle	()V
        //   94: return
        //   95: aconst_null
        //   96: astore 9
        //   98: goto -69 -> 29
        //   101: astore 8
        //   103: aload 7
        //   105: invokevirtual 52	android/os/Parcel:recycle	()V
        //   108: aload 6
        //   110: invokevirtual 52	android/os/Parcel:recycle	()V
        //   113: aload 8
        //   115: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	116	0	this	a
        //   0	116	1	parambp	bp
        //   0	116	2	paramString	String
        //   0	116	3	paramList1	List<String>
        //   0	116	4	paramList2	List<String>
        //   0	116	5	paramList3	List<String>
        //   3	106	6	localParcel1	Parcel
        //   8	96	7	localParcel2	Parcel
        //   101	13	8	localObject	Object
        //   27	70	9	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   10	17	101	finally
        //   21	29	101	finally
        //   29	84	101	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, List<x> paramList, boolean paramBoolean)
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
        //   18: ifnull +81 -> 99
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: aload 5
        //   44: aload_3
        //   45: invokevirtual 95	android/os/Parcel:writeTypedList	(Ljava/util/List;)V
        //   48: iconst_0
        //   49: istore 9
        //   51: iload 4
        //   53: ifeq +6 -> 59
        //   56: iconst_1
        //   57: istore 9
        //   59: aload 5
        //   61: iload 9
        //   63: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   66: aload_0
        //   67: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   70: bipush 29
        //   72: aload 5
        //   74: aload 6
        //   76: iconst_0
        //   77: invokeinterface 46 5 0
        //   82: pop
        //   83: aload 6
        //   85: invokevirtual 49	android/os/Parcel:readException	()V
        //   88: aload 6
        //   90: invokevirtual 52	android/os/Parcel:recycle	()V
        //   93: aload 5
        //   95: invokevirtual 52	android/os/Parcel:recycle	()V
        //   98: return
        //   99: aconst_null
        //   100: astore 8
        //   102: goto -73 -> 29
        //   105: astore 7
        //   107: aload 6
        //   109: invokevirtual 52	android/os/Parcel:recycle	()V
        //   112: aload 5
        //   114: invokevirtual 52	android/os/Parcel:recycle	()V
        //   117: aload 7
        //   119: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	120	0	this	a
        //   0	120	1	parambp	bp
        //   0	120	2	paramString	String
        //   0	120	3	paramList	List<x>
        //   0	120	4	paramBoolean	boolean
        //   3	110	5	localParcel1	Parcel
        //   8	100	6	localParcel2	Parcel
        //   105	13	7	localObject	Object
        //   27	74	8	localIBinder	IBinder
        //   49	13	9	i	int
        // Exception table:
        //   from	to	target	type
        //   10	17	105	finally
        //   21	29	105	finally
        //   29	48	105	finally
        //   59	88	105	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString, boolean paramBoolean)
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
        //   22: invokeinterface 59 1 0
        //   27: astore 7
        //   29: aload 4
        //   31: aload 7
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 4
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: iconst_0
        //   43: istore 8
        //   45: iload_3
        //   46: ifeq +6 -> 52
        //   49: iconst_1
        //   50: istore 8
        //   52: aload 4
        //   54: iload 8
        //   56: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   59: aload_0
        //   60: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   63: bipush 21
        //   65: aload 4
        //   67: aload 5
        //   69: iconst_0
        //   70: invokeinterface 46 5 0
        //   75: pop
        //   76: aload 5
        //   78: invokevirtual 49	android/os/Parcel:readException	()V
        //   81: aload 5
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 4
        //   88: invokevirtual 52	android/os/Parcel:recycle	()V
        //   91: return
        //   92: aconst_null
        //   93: astore 7
        //   95: goto -66 -> 29
        //   98: astore 6
        //   100: aload 5
        //   102: invokevirtual 52	android/os/Parcel:recycle	()V
        //   105: aload 4
        //   107: invokevirtual 52	android/os/Parcel:recycle	()V
        //   110: aload 6
        //   112: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	113	0	this	a
        //   0	113	1	parambp	bp
        //   0	113	2	paramString	String
        //   0	113	3	paramBoolean	boolean
        //   3	103	4	localParcel1	Parcel
        //   8	93	5	localParcel2	Parcel
        //   98	13	6	localObject	Object
        //   27	67	7	localIBinder	IBinder
        //   43	12	8	i	int
        // Exception table:
        //   from	to	target	type
        //   10	17	98	finally
        //   21	29	98	finally
        //   29	42	98	finally
        //   52	81	98	finally
      }
      
      /* Error */
      public void a(bp parambp, String paramString1, boolean paramBoolean, String paramString2)
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
        //   18: ifnull +81 -> 99
        //   21: aload_1
        //   22: invokeinterface 59 1 0
        //   27: astore 8
        //   29: aload 5
        //   31: aload 8
        //   33: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload 5
        //   38: aload_2
        //   39: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   42: iconst_0
        //   43: istore 9
        //   45: iload_3
        //   46: ifeq +6 -> 52
        //   49: iconst_1
        //   50: istore 9
        //   52: aload 5
        //   54: iload 9
        //   56: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   59: aload 5
        //   61: aload 4
        //   63: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   66: aload_0
        //   67: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   70: bipush 27
        //   72: aload 5
        //   74: aload 6
        //   76: iconst_0
        //   77: invokeinterface 46 5 0
        //   82: pop
        //   83: aload 6
        //   85: invokevirtual 49	android/os/Parcel:readException	()V
        //   88: aload 6
        //   90: invokevirtual 52	android/os/Parcel:recycle	()V
        //   93: aload 5
        //   95: invokevirtual 52	android/os/Parcel:recycle	()V
        //   98: return
        //   99: aconst_null
        //   100: astore 8
        //   102: goto -73 -> 29
        //   105: astore 7
        //   107: aload 6
        //   109: invokevirtual 52	android/os/Parcel:recycle	()V
        //   112: aload 5
        //   114: invokevirtual 52	android/os/Parcel:recycle	()V
        //   117: aload 7
        //   119: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	120	0	this	a
        //   0	120	1	parambp	bp
        //   0	120	2	paramString1	String
        //   0	120	3	paramBoolean	boolean
        //   0	120	4	paramString2	String
        //   3	110	5	localParcel1	Parcel
        //   8	100	6	localParcel2	Parcel
        //   105	13	7	localObject	Object
        //   27	74	8	localIBinder	IBinder
        //   43	12	9	i	int
        // Exception table:
        //   from	to	target	type
        //   10	17	105	finally
        //   21	29	105	finally
        //   29	42	105	finally
        //   52	88	105	finally
      }
      
      /* Error */
      public void a(bp parambp, List<String> paramList)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 100	android/os/Parcel:writeStringList	(Ljava/util/List;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 34
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramList	List<String>
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      /* Error */
      public void a(bp parambp, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        // Byte code:
        //   0: iconst_1
        //   1: istore 4
        //   3: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 5
        //   8: invokestatic 24	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 6
        //   13: aload 5
        //   15: ldc 26
        //   17: invokevirtual 30	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload_1
        //   21: ifnull +77 -> 98
        //   24: aload_1
        //   25: invokeinterface 59 1 0
        //   30: astore 8
        //   32: aload 5
        //   34: aload 8
        //   36: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   39: iload_2
        //   40: ifeq +64 -> 104
        //   43: iload 4
        //   45: istore 9
        //   47: aload 5
        //   49: iload 9
        //   51: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   54: iload_3
        //   55: ifeq +55 -> 110
        //   58: aload 5
        //   60: iload 4
        //   62: invokevirtual 34	android/os/Parcel:writeInt	(I)V
        //   65: aload_0
        //   66: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   69: bipush 22
        //   71: aload 5
        //   73: aload 6
        //   75: iconst_0
        //   76: invokeinterface 46 5 0
        //   81: pop
        //   82: aload 6
        //   84: invokevirtual 49	android/os/Parcel:readException	()V
        //   87: aload 6
        //   89: invokevirtual 52	android/os/Parcel:recycle	()V
        //   92: aload 5
        //   94: invokevirtual 52	android/os/Parcel:recycle	()V
        //   97: return
        //   98: aconst_null
        //   99: astore 8
        //   101: goto -69 -> 32
        //   104: iconst_0
        //   105: istore 9
        //   107: goto -60 -> 47
        //   110: iconst_0
        //   111: istore 4
        //   113: goto -55 -> 58
        //   116: astore 7
        //   118: aload 6
        //   120: invokevirtual 52	android/os/Parcel:recycle	()V
        //   123: aload 5
        //   125: invokevirtual 52	android/os/Parcel:recycle	()V
        //   128: aload 7
        //   130: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	131	0	this	a
        //   0	131	1	parambp	bp
        //   0	131	2	paramBoolean1	boolean
        //   0	131	3	paramBoolean2	boolean
        //   1	111	4	i	int
        //   6	118	5	localParcel1	Parcel
        //   11	108	6	localParcel2	Parcel
        //   116	13	7	localObject	Object
        //   30	70	8	localIBinder	IBinder
        //   45	61	9	j	int
        // Exception table:
        //   from	to	target	type
        //   13	20	116	finally
        //   24	32	116	finally
        //   32	39	116	finally
        //   47	54	116	finally
        //   58	87	116	finally
      }
      
      public IBinder asBinder()
      {
        return this.a;
      }
      
      /* Error */
      public void b(bp parambp)
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
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 59 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   36: bipush 13
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 46 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 49	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 52	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 52	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 52	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 52	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parambp	bp
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void b(bp parambp, String paramString)
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
        //   16: ifnull +52 -> 68
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: iconst_3
        //   43: aload_3
        //   44: aload 4
        //   46: iconst_0
        //   47: invokeinterface 46 5 0
        //   52: pop
        //   53: aload 4
        //   55: invokevirtual 49	android/os/Parcel:readException	()V
        //   58: aload 4
        //   60: invokevirtual 52	android/os/Parcel:recycle	()V
        //   63: aload_3
        //   64: invokevirtual 52	android/os/Parcel:recycle	()V
        //   67: return
        //   68: aconst_null
        //   69: astore 6
        //   71: goto -44 -> 27
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 52	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 52	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	a
        //   0	88	1	parambp	bp
        //   0	88	2	paramString	String
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        //   25	45	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	74	finally
        //   19	27	74	finally
        //   27	58	74	finally
      }
      
      /* Error */
      public void c(bp parambp)
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
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 59 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   36: bipush 19
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 46 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 49	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 52	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 52	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 52	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 52	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parambp	bp
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void c(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 7
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      public void clearDefaultAccount()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
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
      
      /* Error */
      public void d(bp parambp)
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
        //   15: ifnull +45 -> 60
        //   18: aload_1
        //   19: invokeinterface 59 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   36: bipush 38
        //   38: aload_2
        //   39: aload_3
        //   40: iconst_0
        //   41: invokeinterface 46 5 0
        //   46: pop
        //   47: aload_3
        //   48: invokevirtual 49	android/os/Parcel:readException	()V
        //   51: aload_3
        //   52: invokevirtual 52	android/os/Parcel:recycle	()V
        //   55: aload_2
        //   56: invokevirtual 52	android/os/Parcel:recycle	()V
        //   59: return
        //   60: aconst_null
        //   61: astore 5
        //   63: goto -37 -> 26
        //   66: astore 4
        //   68: aload_3
        //   69: invokevirtual 52	android/os/Parcel:recycle	()V
        //   72: aload_2
        //   73: invokevirtual 52	android/os/Parcel:recycle	()V
        //   76: aload 4
        //   78: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	79	0	this	a
        //   0	79	1	parambp	bp
        //   3	70	2	localParcel1	Parcel
        //   7	62	3	localParcel2	Parcel
        //   66	11	4	localObject	Object
        //   24	38	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	66	finally
        //   18	26	66	finally
        //   26	51	66	finally
      }
      
      /* Error */
      public void d(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 10
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      /* Error */
      public void e(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 18
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      /* Error */
      public void f(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 24
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      public void f(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.a.transact(11, localParcel1, localParcel2, 0);
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
      public void g(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 26
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      public String getAccountName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.a.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void h(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 33
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      /* Error */
      public void i(bp parambp, String paramString)
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
        //   16: ifnull +53 -> 69
        //   19: aload_1
        //   20: invokeinterface 59 1 0
        //   25: astore 6
        //   27: aload_3
        //   28: aload 6
        //   30: invokevirtual 62	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   33: aload_3
        //   34: aload_2
        //   35: invokevirtual 66	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   38: aload_0
        //   39: getfield 15	com/google/android/gms/internal/bs$a$a:a	Landroid/os/IBinder;
        //   42: bipush 35
        //   44: aload_3
        //   45: aload 4
        //   47: iconst_0
        //   48: invokeinterface 46 5 0
        //   53: pop
        //   54: aload 4
        //   56: invokevirtual 49	android/os/Parcel:readException	()V
        //   59: aload 4
        //   61: invokevirtual 52	android/os/Parcel:recycle	()V
        //   64: aload_3
        //   65: invokevirtual 52	android/os/Parcel:recycle	()V
        //   68: return
        //   69: aconst_null
        //   70: astore 6
        //   72: goto -45 -> 27
        //   75: astore 5
        //   77: aload 4
        //   79: invokevirtual 52	android/os/Parcel:recycle	()V
        //   82: aload_3
        //   83: invokevirtual 52	android/os/Parcel:recycle	()V
        //   86: aload 5
        //   88: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	89	0	this	a
        //   0	89	1	parambp	bp
        //   0	89	2	paramString	String
        //   3	80	3	localParcel1	Parcel
        //   7	71	4	localParcel2	Parcel
        //   75	12	5	localObject	Object
        //   25	46	6	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   9	15	75	finally
        //   19	27	75	finally
        //   27	59	75	finally
      }
      
      public void removeMoment(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          localParcel1.writeString(paramString);
          this.a.transact(17, localParcel1, localParcel2, 0);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bs.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */