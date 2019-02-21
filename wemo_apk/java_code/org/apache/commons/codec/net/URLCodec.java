package org.apache.commons.codec.net;

import java.io.UnsupportedEncodingException;
import java.util.BitSet;
import org.apache.commons.codec.BinaryDecoder;
import org.apache.commons.codec.BinaryEncoder;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.StringDecoder;
import org.apache.commons.codec.StringEncoder;

@Deprecated
public class URLCodec
  implements BinaryEncoder, BinaryDecoder, StringEncoder, StringDecoder
{
  protected static byte ESCAPE_CHAR;
  protected static final BitSet WWW_FORM_URL = null;
  protected String charset;
  
  public URLCodec()
  {
    throw new RuntimeException("Stub!");
  }
  
  public URLCodec(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final byte[] decodeUrl(byte[] paramArrayOfByte)
    throws DecoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final byte[] encodeUrl(BitSet paramBitSet, byte[] paramArrayOfByte)
  {
    throw new RuntimeException("Stub!");
  }
  
  public Object decode(Object paramObject)
    throws DecoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public String decode(String paramString)
    throws DecoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public String decode(String paramString1, String paramString2)
    throws DecoderException, UnsupportedEncodingException
  {
    throw new RuntimeException("Stub!");
  }
  
  public byte[] decode(byte[] paramArrayOfByte)
    throws DecoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public Object encode(Object paramObject)
    throws EncoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public String encode(String paramString)
    throws EncoderException
  {
    throw new RuntimeException("Stub!");
  }
  
  public String encode(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    throw new RuntimeException("Stub!");
  }
  
  public byte[] encode(byte[] paramArrayOfByte)
  {
    throw new RuntimeException("Stub!");
  }
  
  public String getDefaultCharset()
  {
    throw new RuntimeException("Stub!");
  }
  
  @Deprecated
  public String getEncoding()
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/codec/net/URLCodec.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */