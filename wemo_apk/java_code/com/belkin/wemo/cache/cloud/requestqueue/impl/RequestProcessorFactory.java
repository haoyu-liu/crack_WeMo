package com.belkin.wemo.cache.cloud.requestqueue.impl;

import android.content.Context;
import com.belkin.wemo.cache.cloud.requestqueue.IRequestProcessor;

public class RequestProcessorFactory
{
  private static IRequestProcessor requestProcessor;
  
  public static IRequestProcessor getRequestProcessor(Context paramContext)
  {
    try
    {
      if (requestProcessor == null) {
        requestProcessor = new WemoRequestProcessor(paramContext);
      }
      IRequestProcessor localIRequestProcessor = requestProcessor;
      return localIRequestProcessor;
    }
    finally {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */