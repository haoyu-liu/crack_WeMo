package org.apache.commons.codec;

@Deprecated
public abstract interface StringEncoder
  extends Encoder
{
  public abstract String encode(String paramString)
    throws EncoderException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/codec/StringEncoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */