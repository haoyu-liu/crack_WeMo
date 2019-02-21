package com.google.android.gms.maps;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.a.a;
import com.google.android.gms.common.internal.safeparcel.b;
import com.google.android.gms.maps.model.CameraPosition;

public class GoogleMapOptionsCreator
  implements Parcelable.Creator<GoogleMapOptions>
{
  public static final int CONTENT_DESCRIPTION;
  
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
  
  public GoogleMapOptions createFromParcel(Parcel paramParcel)
  {
    byte b1 = 0;
    int i = a.c(paramParcel);
    CameraPosition localCameraPosition = null;
    byte b2 = 0;
    byte b3 = 0;
    byte b4 = 0;
    byte b5 = 0;
    byte b6 = 0;
    int j = 0;
    byte b7 = 0;
    byte b8 = 0;
    int k = 0;
    while (paramParcel.dataPosition() < i)
    {
      int m = a.b(paramParcel);
      switch (a.m(m))
      {
      default: 
        a.b(paramParcel, m);
        break;
      case 1: 
        k = a.f(paramParcel, m);
        break;
      case 2: 
        b8 = a.d(paramParcel, m);
        break;
      case 3: 
        b7 = a.d(paramParcel, m);
        break;
      case 4: 
        j = a.f(paramParcel, m);
        break;
      case 5: 
        localCameraPosition = (CameraPosition)a.a(paramParcel, m, CameraPosition.CREATOR);
        break;
      case 6: 
        b6 = a.d(paramParcel, m);
        break;
      case 7: 
        b5 = a.d(paramParcel, m);
        break;
      case 8: 
        b4 = a.d(paramParcel, m);
        break;
      case 9: 
        b3 = a.d(paramParcel, m);
        break;
      case 10: 
        b2 = a.d(paramParcel, m);
        break;
      case 11: 
        b1 = a.d(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i) {
      throw new a.a("Overread allowed size end=" + i, paramParcel);
    }
    return new GoogleMapOptions(k, b8, b7, j, localCameraPosition, b6, b5, b4, b3, b2, b1);
  }
  
  public GoogleMapOptions[] newArray(int paramInt)
  {
    return new GoogleMapOptions[paramInt];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/GoogleMapOptionsCreator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */