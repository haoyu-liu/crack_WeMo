package com.google.android.gms.maps;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.b;

public class a
{
  static void a(GoogleMapOptions paramGoogleMapOptions, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramGoogleMapOptions.i());
    b.a(paramParcel, 2, paramGoogleMapOptions.aZ());
    b.a(paramParcel, 3, paramGoogleMapOptions.ba());
    b.c(paramParcel, 4, paramGoogleMapOptions.getMapType());
    b.a(paramParcel, 5, paramGoogleMapOptions.getCamera(), paramInt, false);
    b.a(paramParcel, 6, paramGoogleMapOptions.bb());
    b.a(paramParcel, 7, paramGoogleMapOptions.bc());
    b.a(paramParcel, 8, paramGoogleMapOptions.bd());
    b.a(paramParcel, 9, paramGoogleMapOptions.be());
    b.a(paramParcel, 10, paramGoogleMapOptions.bf());
    b.a(paramParcel, 11, paramGoogleMapOptions.bg());
    b.C(paramParcel, i);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */