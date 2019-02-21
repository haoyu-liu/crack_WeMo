package com.google.android.gms.location;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.s;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class ActivityRecognitionResult
  implements SafeParcelable
{
  public static final ActivityRecognitionResultCreator CREATOR = new ActivityRecognitionResultCreator();
  public static final String EXTRA_ACTIVITY_RESULT = "com.google.android.location.internal.EXTRA_ACTIVITY_RESULT";
  private final int ab;
  List<DetectedActivity> fp;
  long fq;
  long fr;
  
  public ActivityRecognitionResult(int paramInt, List<DetectedActivity> paramList, long paramLong1, long paramLong2)
  {
    this.ab = 1;
    this.fp = paramList;
    this.fq = paramLong1;
    this.fr = paramLong2;
  }
  
  public ActivityRecognitionResult(DetectedActivity paramDetectedActivity, long paramLong1, long paramLong2)
  {
    this(Collections.singletonList(paramDetectedActivity), paramLong1, paramLong2);
  }
  
  public ActivityRecognitionResult(List<DetectedActivity> paramList, long paramLong1, long paramLong2)
  {
    if ((paramList != null) && (paramList.size() > 0)) {}
    for (boolean bool = true;; bool = false)
    {
      s.b(bool, "Must have at least 1 detected activity");
      this.ab = 1;
      this.fp = paramList;
      this.fq = paramLong1;
      this.fr = paramLong2;
      return;
    }
  }
  
  public static ActivityRecognitionResult extractResult(Intent paramIntent)
  {
    if (!hasResult(paramIntent)) {
      return null;
    }
    return (ActivityRecognitionResult)paramIntent.getExtras().get("com.google.android.location.internal.EXTRA_ACTIVITY_RESULT");
  }
  
  public static boolean hasResult(Intent paramIntent)
  {
    if (paramIntent == null) {
      return false;
    }
    return paramIntent.hasExtra("com.google.android.location.internal.EXTRA_ACTIVITY_RESULT");
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int getActivityConfidence(int paramInt)
  {
    Iterator localIterator = this.fp.iterator();
    while (localIterator.hasNext())
    {
      DetectedActivity localDetectedActivity = (DetectedActivity)localIterator.next();
      if (localDetectedActivity.getType() == paramInt) {
        return localDetectedActivity.getConfidence();
      }
    }
    return 0;
  }
  
  public long getElapsedRealtimeMillis()
  {
    return this.fr;
  }
  
  public DetectedActivity getMostProbableActivity()
  {
    return (DetectedActivity)this.fp.get(0);
  }
  
  public List<DetectedActivity> getProbableActivities()
  {
    return this.fp;
  }
  
  public long getTime()
  {
    return this.fq;
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public String toString()
  {
    return "ActivityRecognitionResult [probableActivities=" + this.fp + ", timeMillis=" + this.fq + ", elapsedRealtimeMillis=" + this.fr + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ActivityRecognitionResultCreator.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/location/ActivityRecognitionResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */