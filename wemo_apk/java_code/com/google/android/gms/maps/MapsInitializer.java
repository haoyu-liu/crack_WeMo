package com.google.android.gms.maps;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.c;
import com.google.android.gms.maps.internal.p;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class MapsInitializer
{
  public static void initialize(Context paramContext)
    throws GooglePlayServicesNotAvailableException
  {
    s.d(paramContext);
    c localc = p.i(paramContext);
    try
    {
      CameraUpdateFactory.a(localc.bk());
      BitmapDescriptorFactory.a(localc.bl());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/MapsInitializer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */