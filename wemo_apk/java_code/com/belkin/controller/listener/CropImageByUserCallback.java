package com.belkin.controller.listener;

import android.net.Uri;

public abstract interface CropImageByUserCallback
{
  public abstract void onCropError(String paramString);
  
  public abstract void onImageCropped(Uri paramUri);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/listener/CropImageByUserCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */