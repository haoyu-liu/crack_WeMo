package com.google.android.gms.maps.model;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;
import com.google.android.gms.internal.s;
import com.google.android.gms.maps.internal.q;

public final class CameraPosition
  implements SafeParcelable
{
  public static final CameraPositionCreator CREATOR = new CameraPositionCreator();
  private final int ab;
  public final float bearing;
  public final LatLng target;
  public final float tilt;
  public final float zoom;
  
  CameraPosition(int paramInt, LatLng paramLatLng, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    s.b(paramLatLng, "null camera target");
    if ((0.0F <= paramFloat2) && (paramFloat2 <= 90.0F)) {}
    for (boolean bool = true;; bool = false)
    {
      s.b(bool, "Tilt needs to be between 0 and 90 inclusive");
      this.ab = paramInt;
      this.target = paramLatLng;
      this.zoom = paramFloat1;
      this.tilt = (paramFloat2 + 0.0F);
      if (paramFloat3 <= 0.0D) {
        paramFloat3 = 360.0F + paramFloat3 % 360.0F;
      }
      this.bearing = (paramFloat3 % 360.0F);
      return;
    }
  }
  
  public CameraPosition(LatLng paramLatLng, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(1, paramLatLng, paramFloat1, paramFloat2, paramFloat3);
  }
  
  public static Builder builder()
  {
    return new Builder();
  }
  
  public static Builder builder(CameraPosition paramCameraPosition)
  {
    return new Builder(paramCameraPosition);
  }
  
  public static CameraPosition createFromAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null) {
      return null;
    }
    TypedArray localTypedArray = paramContext.getResources().obtainAttributes(paramAttributeSet, R.styleable.MapAttrs);
    if (localTypedArray.hasValue(2)) {}
    for (float f1 = localTypedArray.getFloat(2, 0.0F);; f1 = 0.0F)
    {
      if (localTypedArray.hasValue(3)) {}
      for (float f2 = localTypedArray.getFloat(3, 0.0F);; f2 = 0.0F)
      {
        LatLng localLatLng = new LatLng(f1, f2);
        Builder localBuilder = builder();
        localBuilder.target(localLatLng);
        if (localTypedArray.hasValue(5)) {
          localBuilder.zoom(localTypedArray.getFloat(5, 0.0F));
        }
        if (localTypedArray.hasValue(1)) {
          localBuilder.bearing(localTypedArray.getFloat(1, 0.0F));
        }
        if (localTypedArray.hasValue(4)) {
          localBuilder.tilt(localTypedArray.getFloat(4, 0.0F));
        }
        return localBuilder.build();
      }
    }
  }
  
  public static final CameraPosition fromLatLngZoom(LatLng paramLatLng, float paramFloat)
  {
    return new CameraPosition(paramLatLng, paramFloat, 0.0F, 0.0F);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    CameraPosition localCameraPosition;
    do
    {
      return true;
      if (!(paramObject instanceof CameraPosition)) {
        return false;
      }
      localCameraPosition = (CameraPosition)paramObject;
    } while ((this.target.equals(localCameraPosition.target)) && (Float.floatToIntBits(this.zoom) == Float.floatToIntBits(localCameraPosition.zoom)) && (Float.floatToIntBits(this.tilt) == Float.floatToIntBits(localCameraPosition.tilt)) && (Float.floatToIntBits(this.bearing) == Float.floatToIntBits(localCameraPosition.bearing)));
    return false;
  }
  
  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.target;
    arrayOfObject[1] = Float.valueOf(this.zoom);
    arrayOfObject[2] = Float.valueOf(this.tilt);
    arrayOfObject[3] = Float.valueOf(this.bearing);
    return r.hashCode(arrayOfObject);
  }
  
  int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    return r.c(this).a("target", this.target).a("zoom", Float.valueOf(this.zoom)).a("tilt", Float.valueOf(this.tilt)).a("bearing", Float.valueOf(this.bearing)).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (q.bn())
    {
      a.a(this, paramParcel, paramInt);
      return;
    }
    CameraPositionCreator.a(this, paramParcel, paramInt);
  }
  
  public static final class Builder
  {
    private LatLng gR;
    private float gS;
    private float gT;
    private float gU;
    
    public Builder() {}
    
    public Builder(CameraPosition paramCameraPosition)
    {
      this.gR = paramCameraPosition.target;
      this.gS = paramCameraPosition.zoom;
      this.gT = paramCameraPosition.tilt;
      this.gU = paramCameraPosition.bearing;
    }
    
    public Builder bearing(float paramFloat)
    {
      this.gU = paramFloat;
      return this;
    }
    
    public CameraPosition build()
    {
      return new CameraPosition(this.gR, this.gS, this.gT, this.gU);
    }
    
    public Builder target(LatLng paramLatLng)
    {
      this.gR = paramLatLng;
      return this;
    }
    
    public Builder tilt(float paramFloat)
    {
      this.gT = paramFloat;
      return this;
    }
    
    public Builder zoom(float paramFloat)
    {
      this.gS = paramFloat;
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/maps/model/CameraPosition.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */