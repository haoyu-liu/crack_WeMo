package com.belkin.controller.listener;

import android.net.Uri;

public abstract interface SelectPhotoListener
{
  public abstract void onPhotoSelected(Uri paramUri);
  
  public abstract void onPhotoSelectionError(String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/listener/SelectPhotoListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */