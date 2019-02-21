package com.belkin.wemo;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import java.util.HashMap;

public class PermissionController
{
  private static final int CAMERA_REQUEST_CODE = 1;
  private static final int LOCATION_REQUEST_CODE = 2;
  private static final int PHONE_REQUEST_CODE = 3;
  public static final int REQUEST_PERMISSION_SETTING = 10;
  private static final int STORAGE_REQUEST_CODE = 4;
  private static PermissionController permissionController;
  private Activity mActivity;
  private Context mContext;
  private HashMap<Integer, PermissionListener> mPermissionListeners;
  
  private PermissionController(Activity paramActivity)
  {
    this.mActivity = paramActivity;
    this.mContext = paramActivity;
    this.mPermissionListeners = new HashMap();
  }
  
  private PermissionController(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private void askPermission(String paramString, int paramInt, PermissionListener paramPermissionListener)
  {
    if (this.mActivity != null)
    {
      this.mPermissionListeners.put(Integer.valueOf(paramInt), paramPermissionListener);
      ActivityCompat.requestPermissions(this.mActivity, new String[] { paramString }, paramInt);
    }
  }
  
  public static PermissionController getContextInstance(Context paramContext)
  {
    if (permissionController == null) {
      permissionController = new PermissionController(paramContext);
    }
    return permissionController;
  }
  
  public static PermissionController getInstance(Activity paramActivity)
  {
    return new PermissionController(paramActivity);
  }
  
  private boolean hasPermission(String paramString)
  {
    return ContextCompat.checkSelfPermission(this.mContext, paramString) == 0;
  }
  
  public void askCameraPermission(PermissionListener paramPermissionListener)
  {
    askPermission("android.permission.CAMERA", 1, paramPermissionListener);
  }
  
  public void askLocPermission()
  {
    ActivityCompat.requestPermissions(this.mActivity, new String[] { "android.permission.ACCESS_FINE_LOCATION" }, 2);
  }
  
  public void askLocationPermission(PermissionListener paramPermissionListener)
  {
    askPermission("android.permission.ACCESS_FINE_LOCATION", 2, paramPermissionListener);
  }
  
  public void askPhonePermission(PermissionListener paramPermissionListener)
  {
    askPermission("android.permission.READ_PHONE_STATE", 3, paramPermissionListener);
  }
  
  public void askStoragePermission(PermissionListener paramPermissionListener)
  {
    askPermission("android.permission.WRITE_EXTERNAL_STORAGE", 4, paramPermissionListener);
  }
  
  public boolean canAccessCamera()
  {
    return hasPermission("android.permission.CAMERA");
  }
  
  public boolean canAccessLocation()
  {
    return hasPermission("android.permission.ACCESS_FINE_LOCATION");
  }
  
  public boolean canAccessPhone()
  {
    return hasPermission("android.permission.READ_PHONE_STATE");
  }
  
  public boolean canAccessStorage()
  {
    return hasPermission("android.permission.WRITE_EXTERNAL_STORAGE");
  }
  
  public void onRequestPermissionsResult(int paramInt, String[] paramArrayOfString, int[] paramArrayOfInt)
  {
    PermissionListener localPermissionListener;
    boolean bool;
    if (this.mPermissionListeners != null)
    {
      localPermissionListener = (PermissionListener)this.mPermissionListeners.get(Integer.valueOf(paramInt));
      bool = ActivityCompat.shouldShowRequestPermissionRationale(this.mActivity, paramArrayOfString[0]);
      if (localPermissionListener != null)
      {
        if (paramArrayOfInt[0] != 0) {
          break label55;
        }
        localPermissionListener.permissionResult(true);
      }
    }
    return;
    label55:
    if (!bool)
    {
      showSettingsAlert(Integer.valueOf(paramInt));
      localPermissionListener.permissionResult(false);
      return;
    }
    localPermissionListener.permissionResult(false);
  }
  
  public void showSettingsAlert(Integer paramInteger)
  {
    String[] arrayOfString = { "Contacts", "Camera", "Location", "Phone", "Storage" };
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.mContext);
    localBuilder.setTitle("Grant Access");
    localBuilder.setMessage("Wemo will need permission to use your " + arrayOfString[paramInteger.intValue()] + ". Go to your device’s app settings to grant access.");
    localBuilder.setPositiveButton("Settings", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        Intent localIntent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        localIntent.setData(Uri.fromParts("package", PermissionController.this.mContext.getApplicationContext().getPackageName(), null));
        PermissionController.this.mActivity.startActivityForResult(localIntent, 10);
      }
    });
    localBuilder.setNegativeButton("Cancel", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.cancel();
      }
    });
    localBuilder.show();
  }
  
  public static abstract interface PermissionListener
  {
    public abstract void permissionResult(boolean paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/PermissionController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */