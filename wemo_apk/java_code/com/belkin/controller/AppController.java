package com.belkin.controller;

import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract.CommonDataKinds.Phone;
import android.provider.ContactsContract.Contacts;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AppController
{
  public static final String TAG = "AppController";
  private static AppController appController = null;
  private Context mContext = null;
  
  private AppController(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public static AppController getInstance(Context paramContext)
  {
    try
    {
      if (appController == null) {
        appController = new AppController(paramContext);
      }
      AppController localAppController = appController;
      return localAppController;
    }
    finally {}
  }
  
  public boolean callEmergencyContact(String paramString, Context paramContext)
  {
    boolean bool1 = false;
    if (paramContext != null)
    {
      boolean bool2 = paramContext.getPackageManager().hasSystemFeature("android.hardware.telephony");
      bool1 = false;
      if (!bool2) {}
    }
    try
    {
      Intent localIntent = new Intent("android.intent.action.DIAL");
      if (!TextUtils.isEmpty(paramString)) {
        localIntent.setData(Uri.parse("tel:" + Uri.encode(paramString)));
      }
      localIntent.setFlags(268435456);
      bool1 = true;
      paramContext.startActivity(localIntent);
      return bool1;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      LogUtils.errorLog("AppController", "Exception in launching the DIAL PAD application:: " + localActivityNotFoundException);
    }
    return false;
  }
  
  public JSONArray getContactsList()
  {
    JSONArray localJSONArray = new JSONArray();
    ContentResolver localContentResolver = this.mContext.getContentResolver();
    Cursor localCursor1 = localContentResolver.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, "display_name ASC");
    if (localCursor1.getCount() > 0) {
      while (localCursor1.moveToNext())
      {
        String str1 = localCursor1.getString(localCursor1.getColumnIndex("_id"));
        Cursor localCursor2 = localContentResolver.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, "contact_id = " + str1, null, null);
        label272:
        while (localCursor2.moveToNext())
        {
          JSONObject localJSONObject = new JSONObject();
          String str2 = localCursor2.getString(localCursor2.getColumnIndex("data1"));
          int i = localCursor2.getInt(localCursor2.getColumnIndex("data2"));
          String str3 = localCursor1.getString(localCursor1.getColumnIndex("display_name"));
          if (i == 0) {}
          for (String str4 = localCursor2.getString(localCursor2.getColumnIndex("data3"));; str4 = (String)ContactsContract.CommonDataKinds.Phone.getTypeLabel(this.mContext.getResources(), i, ""))
          {
            if (str2 == null) {
              break label272;
            }
            try
            {
              if (str2.isEmpty()) {
                break;
              }
              localJSONObject.put("contactName", str3);
              localJSONObject.put("phoneNumber", str2);
              localJSONObject.put("phoneType", str4);
              localJSONArray.put(localJSONObject);
            }
            catch (JSONException localJSONException)
            {
              localJSONException.printStackTrace();
            }
            break;
          }
        }
        localCursor2.close();
      }
    }
    localCursor1.close();
    return localJSONArray;
  }
  
  public void sendJSCallBack(CordovaWebView paramCordovaWebView, String paramString)
  {
    LogUtils.infoLog("appController:Native:sendJavascriptCB cb", paramString);
    if (paramCordovaWebView != null) {
      paramCordovaWebView.sendJavascript(paramString);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/AppController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */