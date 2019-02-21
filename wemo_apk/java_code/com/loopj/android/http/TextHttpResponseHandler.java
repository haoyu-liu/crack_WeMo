package com.loopj.android.http;

import android.util.Log;
import java.io.UnsupportedEncodingException;
import org.apache.http.Header;

public abstract class TextHttpResponseHandler
  extends AsyncHttpResponseHandler
{
  private static final String LOG_TAG = "TextHttpResponseHandler";
  
  public TextHttpResponseHandler()
  {
    this("UTF-8");
  }
  
  public TextHttpResponseHandler(String paramString)
  {
    setCharset(paramString);
  }
  
  public static String getResponseString(byte[] paramArrayOfByte, String paramString)
  {
    if (paramArrayOfByte == null) {}
    for (String str = null; str != null; str = new String(paramArrayOfByte, paramString)) {
      try
      {
        if (!str.startsWith("﻿")) {
          break;
        }
        return str.substring(1);
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        Log.e("TextHttpResponseHandler", "Encoding response into string failed", localUnsupportedEncodingException);
        str = null;
      }
    }
    return str;
  }
  
  public abstract void onFailure(int paramInt, Header[] paramArrayOfHeader, String paramString, Throwable paramThrowable);
  
  public void onFailure(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte, Throwable paramThrowable)
  {
    onFailure(paramInt, paramArrayOfHeader, getResponseString(paramArrayOfByte, getCharset()), paramThrowable);
  }
  
  public abstract void onSuccess(int paramInt, Header[] paramArrayOfHeader, String paramString);
  
  public void onSuccess(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte)
  {
    onSuccess(paramInt, paramArrayOfHeader, getResponseString(paramArrayOfByte, getCharset()));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/TextHttpResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */