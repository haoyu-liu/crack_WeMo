package com.belkin.controller.listener;

import android.net.Uri;

public abstract interface PhotoRequestedListener
{
  public abstract void onCropImageByUser(Uri paramUri, CropImageByUserCallback paramCropImageByUserCallback);
  
  public abstract void onSelectPhoto(SelectPhotoListener paramSelectPhotoListener);
  
  public abstract void onTakePicture(TakePictureListener paramTakePictureListener, Uri paramUri);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/listener/PhotoRequestedListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */