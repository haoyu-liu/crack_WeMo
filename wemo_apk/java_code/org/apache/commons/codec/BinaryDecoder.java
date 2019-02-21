package org.apache.commons.codec;

@Deprecated
public abstract interface BinaryDecoder
  extends Decoder
{
  public abstract byte[] decode(byte[] paramArrayOfByte)
    throws DecoderException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/codec/BinaryDecoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */