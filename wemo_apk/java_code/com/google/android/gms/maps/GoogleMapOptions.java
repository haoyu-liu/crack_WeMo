package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.q;
import com.google.android.gms.maps.model.CameraPosition;

public final class GoogleMapOptions
  implements SafeParcelable
{
  public static final GoogleMapOptionsCreator CREATOR = new GoogleMapOptionsCreator();
  private final int ab;
  private Boolean go;
  private Boolean gp;
  private int gq = -1;
  private CameraPosition gr;
  private Boolean gs;
  private Boolean gt;
  private Boolean gu;
  private Boolean gv;
  private Boolean gw;
  private Boolean gx;
  
  public GoogleMapOptions()
  {
    this.ab = 1;
  }
  
  GoogleMapOptions(int paramInt1, byte paramByte1, byte paramByte2, int paramInt2, CameraPosition paramCameraPosition, byte paramByte3, byte paramByte4, byte paramByte5, byte paramByte6, byte paramByte7, byte paramByte8)
  {
    this.ab = paramInt1;
    this.go = com.google.android.gms.maps.internal.a.a(paramByte1);
    this.gp = com.google.android.gms.maps.internal.a.a(paramByte2);
    this.gq = paramInt2;
    this.gr = paramCameraPosition;
    this.gs = com.google.android.gms.maps.internal.a.a(paramByte3);
    this.gt = com.google.android.gms.maps.internal.a.a(paramByte4);
    this.gu = com.google.android.gms.maps.internal.a.a(paramByte5);
    this.gv = com.google.android.gms.maps.internal.a.a(paramByte6);
    this.gw = com.google.android.gms.maps.internal.a.a(paramByte7);
    this.gx = com.google.android.gms.maps.internal.a.a(paramByte8);
  }
  
  public static GoogleMapOptions createFromAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null) {
      return null;
    }
    TypedArray localTypedArray = paramContext.getResources().obtainAttributes(paramAttributeSet, R.styleable.MapAttrs);
    GoogleMapOptions localGoogleMapOptions = new GoogleMapOptions();
    if (localTypedArray.hasValue(0)) {
      localGoogleMapOptions.mapType(localTypedArray.getInt(0, -1));
    }
    if (localTypedArray.hasValue(13)) {
      localGoogleMapOptions.zOrderOnTop(localTypedArray.getBoolean(13, false));
    }
    if (localTypedArray.hasValue(12)) {
      localGoogleMapOptions.useViewLifecycleInFragment(localTypedArray.getBoolean(12, false));
    }
    if (localTypedArray.hasValue(6)) {
      localGoogleMapOptions.compassEnabled(localTypedArray.getBoolean(6, true));
    }
    if (localTypedArray.hasValue(7)) {
      localGoogleMapOptions.rotateGesturesEnabled(localTypedArray.getBoolean(7, true));
    }
    if (localTypedArray.hasValue(8)) {
      localGoogleMapOptions.scrollGesturesEnabled(localTypedArray.getBoolean(8, true));
    }
    if (localTypedArray.hasValue(9)) {
      localGoogleMapOptions.tiltGesturesEnabled(localTypedArray.getBoolean(9, true));
    }
    if (localTypedArray.hasValue(11)) {
      localGoogleMapOptions.zoomGesturesEnabled(localTypedArray.getBoolean(11, true));
    }
    if (localTypedArray.hasValue(10)) {
      localGoogleMapOptions.zoomControlsEnabled(localTypedArray.getBoolean(10, true));
    }
    localGoogleMapOptions.camera(CameraPosition.createFromAttributes(paramContext, paramAttributeSet));
    localTypedArray.recycle();
    return localGoogleMapOptions;
  }
  
  byte aZ()
  {
    return com.google.android.gms.maps.internal.a.b(this.go);
  }
  
  byte ba()
  {
    return com.google.android.gms.maps.internal.a.b(this.gp);
  }
  
  byte bb()
  {
    return com.google.android.gms.maps.internal.a.b(this.gs);
  }
  
  byte bc()
  {
    return com.google.android.gms.maps.internal.a.b(this.gt);
  }
  
  byte bd()
  {
    return com.google.android.gms.maps.internal.a.b(this.gu);
  }
  
  byte be()
  {
    return com.google.android.gms.maps.internal.a.b(this.gv);
  }
  
  byte bf()
  {
    return com.google.android.gms.maps.internal.a.b(this.gw);
  }
  
  byte bg()
  {
    return com.google.android.gms.maps.internal.a.b(this.gx);
  }
  
  public GoogleMapOptions camera(CameraPosition paramCameraPosition)
  {
    this.gr = paramCameraPosition;
    return this;
  }
  
  public GoogleMapOptions compassEnabled(boolean paramBoolean)
  {
    this.gt = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public CameraPosition getCamera()
  {
    return this.gr;
  }
  
  public Boolean getCompassEnabled()
  {
    return this.gt;
  }
  
  public int getMapType()
  {
    return this.gq;
  }
  
  public Boolean getRotateGesturesEnabled()
  {
    return this.gx;
  }
  
  public Boolean getScrollGesturesEnabled()
  {
    return this.gu;
  }
  
  public Boolean getTiltGesturesEnabled()
  {
    return this.gw;
  }
  
  public Boolean getUseViewLifecycleInFragment()
  {
    return this.gp;
  }
  
  public Boolean getZOrderOnTop()
  {
    return this.go;
  }
  
  public Boolean getZoomControlsEnabled()
  {
    return this.gs;
  }
  
  public Boolean getZoomGesturesEnabled()
  {
    return this.gv;
  }
  
  int i()
  {
    return this.ab;
  }
  
  public GoogleMapOptions mapType(int paramInt)
  {
    this.gq = paramInt;
    return this;
  }
  
  public GoogleMapOptions rotateGesturesEnabled(boolean paramBoolean)
  {
    this.gx = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public GoogleMapOptions scrollGesturesEnabled(boolean paramBoolean)
  {
    this.gu = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public GoogleMapOptions tiltGesturesEnabled(boolean paramBoolean)
  {
    this.gw = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public GoogleMapOptions useViewLifecycleInFragment(boolean paramBoolean)
  {
    this.gp = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      a.a(this, paramParcel, paramInt);
      return;
    }
    GoogleMapOptionsCreator.a(this, paramParcel, paramInt);
  }
  
  public GoogleMapOptions zOrderOnTop(boolean paramBoolean)
  {
    this.go = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public GoogleMapOptions zoomControlsEnabled(boolean paramBoolean)
  {
    this.gs = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public GoogleMapOptions zoomGesturesEnabled(boolean paramBoolean)
  {
    this.gv = Boolean.valueOf(paramBoolean);
    return this;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/GoogleMapOptions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */