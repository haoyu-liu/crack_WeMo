package com.belkin.wemo.cache.cloud.requestqueue;

import com.android.volley.Request;

public abstract interface IRequestProcessor
{
  public abstract <T> void add(Request<T> paramRequest);
  
  public abstract void cancelAll(Object paramObject);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */