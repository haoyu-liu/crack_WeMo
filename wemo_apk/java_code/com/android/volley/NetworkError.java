package com.android.volley;

public class NetworkError
  extends VolleyError
{
  public NetworkError() {}
  
  public NetworkError(NetworkResponse paramNetworkResponse)
  {
    super(paramNetworkResponse);
  }
  
  public NetworkError(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/NetworkError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */