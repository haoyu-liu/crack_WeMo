package com.synconset;

import android.app.Activity;
import android.content.res.AssetManager;
import android.util.Base64;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaHttpPlugin
  extends CordovaPlugin
{
  private HashMap<String, String> globalHeaders;
  
  private HashMap<String, String> addToMap(HashMap<String, String> paramHashMap, JSONObject paramJSONObject)
    throws JSONException
  {
    HashMap localHashMap = (HashMap)paramHashMap.clone();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramJSONObject.getString(str));
    }
    return localHashMap;
  }
  
  private void enableSSLPinning(boolean paramBoolean)
    throws GeneralSecurityException, IOException
  {
    if (paramBoolean)
    {
      String[] arrayOfString = this.cordova.getActivity().getAssets().list("");
      ArrayList localArrayList = new ArrayList();
      for (int i = 0; i < arrayOfString.length; i++)
      {
        int k = arrayOfString[i].lastIndexOf('.');
        if ((k != -1) && (arrayOfString[i].substring(k).equals(".cer"))) {
          localArrayList.add(arrayOfString[i]);
        }
      }
      for (int j = 0; j < localArrayList.size(); j++) {
        HttpRequest.addCert(new BufferedInputStream(this.cordova.getActivity().getAssets().open((String)localArrayList.get(j))));
      }
      CordovaHttp.enableSSLPinning(true);
      return;
    }
    CordovaHttp.enableSSLPinning(false);
  }
  
  private HashMap<String, Object> getMapFromJSONObject(JSONObject paramJSONObject)
    throws JSONException
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramJSONObject.get(str));
    }
    return localHashMap;
  }
  
  private void setHeader(String paramString1, String paramString2)
  {
    this.globalHeaders.put(paramString1, paramString2);
  }
  
  private void useBasicAuth(String paramString1, String paramString2)
  {
    String str1 = paramString1 + ":" + paramString2;
    String str2 = "Basic " + Base64.encodeToString(str1.getBytes(), 2);
    this.globalHeaders.put("Authorization", str2);
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (paramString.equals("get"))
    {
      String str4 = paramJSONArray.getString(0);
      JSONObject localJSONObject7 = paramJSONArray.getJSONObject(1);
      JSONObject localJSONObject8 = paramJSONArray.getJSONObject(2);
      HashMap localHashMap3 = getMapFromJSONObject(localJSONObject7);
      HashMap localHashMap4 = addToMap(this.globalHeaders, localJSONObject8);
      CordovaHttpGet localCordovaHttpGet = new CordovaHttpGet(str4, localHashMap3, localHashMap4, paramCallbackContext);
      this.cordova.getThreadPool().execute(localCordovaHttpGet);
    }
    for (;;)
    {
      return true;
      if (paramString.equals("post"))
      {
        String str3 = paramJSONArray.getString(0);
        JSONObject localJSONObject5 = paramJSONArray.getJSONObject(1);
        JSONObject localJSONObject6 = paramJSONArray.getJSONObject(2);
        HashMap localHashMap1 = getMapFromJSONObject(localJSONObject5);
        HashMap localHashMap2 = addToMap(this.globalHeaders, localJSONObject6);
        CordovaHttpPost localCordovaHttpPost = new CordovaHttpPost(str3, localHashMap1, localHashMap2, paramCallbackContext);
        this.cordova.getThreadPool().execute(localCordovaHttpPost);
      }
      else if (paramString.equals("useBasicAuth"))
      {
        useBasicAuth(paramJSONArray.getString(0), paramJSONArray.getString(1));
        paramCallbackContext.success();
      }
      else if (paramString.equals("enableSSLPinning"))
      {
        try
        {
          enableSSLPinning(paramJSONArray.getBoolean(0));
          paramCallbackContext.success();
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
          paramCallbackContext.error("There was an error setting up ssl pinning");
        }
      }
      else if (paramString.equals("acceptAllCerts"))
      {
        CordovaHttp.acceptAllCerts(paramJSONArray.getBoolean(0));
      }
      else if (paramString.equals("setHeader"))
      {
        setHeader(paramJSONArray.getString(0), paramJSONArray.getString(1));
        paramCallbackContext.success();
      }
      else if (paramString.equals("uploadFile"))
      {
        String str2 = paramJSONArray.getString(0);
        JSONObject localJSONObject3 = paramJSONArray.getJSONObject(1);
        JSONObject localJSONObject4 = paramJSONArray.getJSONObject(2);
        CordovaHttpUpload localCordovaHttpUpload = new CordovaHttpUpload(str2, getMapFromJSONObject(localJSONObject3), addToMap(this.globalHeaders, localJSONObject4), paramCallbackContext, paramJSONArray.getString(3), paramJSONArray.getString(4));
        this.cordova.getThreadPool().execute(localCordovaHttpUpload);
      }
      else
      {
        if (!paramString.equals("downloadFile")) {
          break;
        }
        String str1 = paramJSONArray.getString(0);
        JSONObject localJSONObject1 = paramJSONArray.getJSONObject(1);
        JSONObject localJSONObject2 = paramJSONArray.getJSONObject(2);
        CordovaHttpDownload localCordovaHttpDownload = new CordovaHttpDownload(str1, getMapFromJSONObject(localJSONObject1), addToMap(this.globalHeaders, localJSONObject2), paramCallbackContext, paramJSONArray.getString(3));
        this.cordova.getThreadPool().execute(localCordovaHttpDownload);
      }
    }
    return false;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.globalHeaders = new HashMap();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/synconset/CordovaHttpPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */