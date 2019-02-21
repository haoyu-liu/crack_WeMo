package com.loopj.android.http;

import java.io.IOException;
import java.net.URI;
import org.apache.http.Header;
import org.apache.http.HttpResponse;

public abstract interface ResponseHandlerInterface
{
  public abstract Header[] getRequestHeaders();
  
  public abstract URI getRequestURI();
  
  public abstract boolean getUseSynchronousMode();
  
  public abstract void onPostProcessResponse(ResponseHandlerInterface paramResponseHandlerInterface, HttpResponse paramHttpResponse);
  
  public abstract void onPreProcessResponse(ResponseHandlerInterface paramResponseHandlerInterface, HttpResponse paramHttpResponse);
  
  public abstract void sendCancelMessage();
  
  public abstract void sendFailureMessage(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte, Throwable paramThrowable);
  
  public abstract void sendFinishMessage();
  
  public abstract void sendProgressMessage(int paramInt1, int paramInt2);
  
  public abstract void sendResponseMessage(HttpResponse paramHttpResponse)
    throws IOException;
  
  public abstract void sendRetryMessage(int paramInt);
  
  public abstract void sendStartMessage();
  
  public abstract void sendSuccessMessage(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte);
  
  public abstract void setRequestHeaders(Header[] paramArrayOfHeader);
  
  public abstract void setRequestURI(URI paramURI);
  
  public abstract void setUseSynchronousMode(boolean paramBoolean);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/ResponseHandlerInterface.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */