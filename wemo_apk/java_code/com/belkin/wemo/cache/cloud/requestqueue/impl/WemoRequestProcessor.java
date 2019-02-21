package com.belkin.wemo.cache.cloud.requestqueue.impl;

import android.content.Context;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;
import com.belkin.wemo.cache.cloud.requestqueue.IRequestProcessor;

public class WemoRequestProcessor
  implements IRequestProcessor
{
  private RequestQueue queue;
  
  public WemoRequestProcessor(Context paramContext)
  {
    this.queue = Volley.newRequestQueue(paramContext);
  }
  
  public <T> void add(Request<T> paramRequest)
  {
    this.queue.add(paramRequest);
  }
  
  public void cancelAll(Object paramObject)
  {
    this.queue.cancelAll(paramObject);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */