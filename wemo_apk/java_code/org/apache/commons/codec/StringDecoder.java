package org.apache.commons.codec;

@Deprecated
public abstract interface StringDecoder
  extends Decoder
{
  public abstract String decode(String paramString)
    throws DecoderException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/codec/StringDecoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */