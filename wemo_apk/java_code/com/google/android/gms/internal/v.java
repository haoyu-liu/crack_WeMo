package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;

public class v
{
  public static String a(String paramString1, String paramString2, Context paramContext, AttributeSet paramAttributeSet, boolean paramBoolean1, boolean paramBoolean2, String paramString3)
  {
    String str1;
    if (paramAttributeSet == null) {
      str1 = null;
    }
    for (;;)
    {
      String str2;
      String str3;
      TypedValue localTypedValue;
      if ((str1 != null) && (str1.startsWith("@string/")) && (paramBoolean1))
      {
        str2 = str1.substring("@string/".length());
        str3 = paramContext.getPackageName();
        localTypedValue = new TypedValue();
      }
      try
      {
        paramContext.getResources().getValue(str3 + ":string/" + str2, localTypedValue, true);
        if (localTypedValue.string != null)
        {
          str1 = localTypedValue.string.toString();
          if ((paramBoolean2) && (str1 == null)) {
            Log.w(paramString3, "Required XML attribute \"" + paramString2 + "\" missing");
          }
          return str1;
          str1 = paramAttributeSet.getAttributeValue(paramString1, paramString2);
        }
      }
      catch (Resources.NotFoundException localNotFoundException)
      {
        for (;;)
        {
          Log.w(paramString3, "Could not find resource for " + paramString2 + ": " + str1);
          continue;
          Log.w(paramString3, "Resource " + paramString2 + " was not a string: " + localTypedValue);
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/v.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */