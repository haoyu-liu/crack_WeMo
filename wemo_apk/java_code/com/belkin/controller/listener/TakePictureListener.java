package com.belkin.controller.listener;

import android.net.Uri;

public abstract interface TakePictureListener
{
  public abstract void onPictureTaken(Uri paramUri);
  
  public abstract void onTakePictureError(String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/listener/TakePictureListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */