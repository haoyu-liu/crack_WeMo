package com.google.android.gms.internal;

import android.net.LocalSocket;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.games.RealTimeSocket;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

final class bb
  implements RealTimeSocket
{
  private ParcelFileDescriptor aB;
  private final String dX;
  private final LocalSocket en;
  
  bb(LocalSocket paramLocalSocket, String paramString)
  {
    this.en = paramLocalSocket;
    this.dX = paramString;
  }
  
  public void close()
    throws IOException
  {
    this.en.close();
  }
  
  public InputStream getInputStream()
    throws IOException
  {
    return this.en.getInputStream();
  }
  
  public OutputStream getOutputStream()
    throws IOException
  {
    return this.en.getOutputStream();
  }
  
  public ParcelFileDescriptor getParcelFileDescriptor()
    throws IOException
  {
    if ((this.aB == null) && (!isClosed()))
    {
      Parcel localParcel = Parcel.obtain();
      localParcel.writeFileDescriptor(this.en.getFileDescriptor());
      localParcel.setDataPosition(0);
      this.aB = localParcel.readFileDescriptor();
    }
    return this.aB;
  }
  
  public boolean isClosed()
  {
    return (!this.en.isConnected()) && (!this.en.isBound());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bb.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */