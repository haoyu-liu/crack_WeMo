package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.b;

public class j
{
  static void a(TileOverlayOptions paramTileOverlayOptions, Parcel paramParcel, int paramInt)
  {
    int i = b.d(paramParcel);
    b.c(paramParcel, 1, paramTileOverlayOptions.i());
    b.a(paramParcel, 2, paramTileOverlayOptions.bs(), false);
    b.a(paramParcel, 3, paramTileOverlayOptions.isVisible());
    b.a(paramParcel, 4, paramTileOverlayOptions.getZIndex());
    b.C(paramParcel, i);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/j.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */