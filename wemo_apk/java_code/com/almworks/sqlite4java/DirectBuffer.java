package com.almworks.sqlite4java;

import java.io.IOException;
import java.nio.ByteBuffer;

final class DirectBuffer
{
  static final int CONTROL_BYTES = 2;
  private ByteBuffer myControlBuffer;
  private ByteBuffer myDataBuffer;
  private SWIGTYPE_p_direct_buffer myHandle;
  private final int mySize;
  
  static
  {
    if (!DirectBuffer.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  DirectBuffer(SWIGTYPE_p_direct_buffer paramSWIGTYPE_p_direct_buffer, ByteBuffer paramByteBuffer1, ByteBuffer paramByteBuffer2, int paramInt)
  {
    assert (paramInt == paramByteBuffer1.capacity() + paramByteBuffer2.capacity()) : (paramInt + " " + paramByteBuffer1.capacity() + " " + paramByteBuffer2.capacity());
    assert (paramByteBuffer1.capacity() == 2) : paramByteBuffer1.capacity();
    assert (paramInt > 2) : paramInt;
    this.myHandle = paramSWIGTYPE_p_direct_buffer;
    this.myControlBuffer = paramByteBuffer1;
    this.myDataBuffer = paramByteBuffer2;
    this.mySize = paramInt;
  }
  
  public ByteBuffer data()
    throws IOException
  {
    if (!isValid()) {
      throw new IOException("buffer disposed");
    }
    return this.myDataBuffer;
  }
  
  public void decUsed()
  {
    ByteBuffer localByteBuffer = this.myControlBuffer;
    if (localByteBuffer != null)
    {
      int i = localByteBuffer.get(0);
      if (i > 0) {
        localByteBuffer.put(0, (byte)(i - 1));
      }
    }
  }
  
  public int getCapacity()
  {
    return -2 + this.mySize;
  }
  
  public SWIGTYPE_p_direct_buffer getHandle()
  {
    return this.myHandle;
  }
  
  public int getPosition()
  {
    ByteBuffer localByteBuffer = this.myDataBuffer;
    if (localByteBuffer == null) {
      return 0;
    }
    return localByteBuffer.position();
  }
  
  public void incUsed()
  {
    ByteBuffer localByteBuffer = this.myControlBuffer;
    if (localByteBuffer != null) {
      localByteBuffer.put(0, (byte)(1 + localByteBuffer.get(0)));
    }
  }
  
  void invalidate()
  {
    this.myControlBuffer = null;
    this.myDataBuffer = null;
    this.myHandle = null;
  }
  
  public boolean isUsed()
  {
    ByteBuffer localByteBuffer = this.myControlBuffer;
    if (localByteBuffer == null) {}
    while (localByteBuffer.get(0) == 0) {
      return false;
    }
    return true;
  }
  
  public boolean isValid()
  {
    int i = 1;
    ByteBuffer localByteBuffer = this.myControlBuffer;
    if ((localByteBuffer == null) || (this.myDataBuffer == null) || (this.myHandle == null)) {
      i = 0;
    }
    while (localByteBuffer.get(i) == 0) {
      return i;
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/DirectBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */