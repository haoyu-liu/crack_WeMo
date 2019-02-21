package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;

public class ReaderInputStream
  extends InputStream
{
  private static final int DEFAULT_BUFFER_SIZE = 1024;
  private final CharsetEncoder encoder;
  private final CharBuffer encoderIn;
  private final ByteBuffer encoderOut;
  private boolean endOfInput;
  private CoderResult lastCoderResult;
  private final Reader reader;
  
  public ReaderInputStream(Reader paramReader)
  {
    this(paramReader, Charset.defaultCharset());
  }
  
  public ReaderInputStream(Reader paramReader, String paramString)
  {
    this(paramReader, paramString, 1024);
  }
  
  public ReaderInputStream(Reader paramReader, String paramString, int paramInt)
  {
    this(paramReader, Charset.forName(paramString), paramInt);
  }
  
  public ReaderInputStream(Reader paramReader, Charset paramCharset)
  {
    this(paramReader, paramCharset, 1024);
  }
  
  public ReaderInputStream(Reader paramReader, Charset paramCharset, int paramInt)
  {
    this(paramReader, paramCharset.newEncoder().onMalformedInput(CodingErrorAction.REPLACE).onUnmappableCharacter(CodingErrorAction.REPLACE), paramInt);
  }
  
  public ReaderInputStream(Reader paramReader, CharsetEncoder paramCharsetEncoder)
  {
    this(paramReader, paramCharsetEncoder, 1024);
  }
  
  public ReaderInputStream(Reader paramReader, CharsetEncoder paramCharsetEncoder, int paramInt)
  {
    this.reader = paramReader;
    this.encoder = paramCharsetEncoder;
    this.encoderIn = CharBuffer.allocate(paramInt);
    this.encoderIn.flip();
    this.encoderOut = ByteBuffer.allocate(128);
    this.encoderOut.flip();
  }
  
  private void fillBuffer()
    throws IOException
  {
    int i;
    int j;
    if ((!this.endOfInput) && ((this.lastCoderResult == null) || (this.lastCoderResult.isUnderflow())))
    {
      this.encoderIn.compact();
      i = this.encoderIn.position();
      j = this.reader.read(this.encoderIn.array(), i, this.encoderIn.remaining());
      if (j != -1) {
        break label125;
      }
      this.endOfInput = true;
    }
    for (;;)
    {
      this.encoderIn.flip();
      this.encoderOut.compact();
      this.lastCoderResult = this.encoder.encode(this.encoderIn, this.encoderOut, this.endOfInput);
      this.encoderOut.flip();
      return;
      label125:
      this.encoderIn.position(i + j);
    }
  }
  
  public void close()
    throws IOException
  {
    this.reader.close();
  }
  
  public int read()
    throws IOException
  {
    do
    {
      if (this.encoderOut.hasRemaining()) {
        return 0xFF & this.encoderOut.get();
      }
      fillBuffer();
    } while ((!this.endOfInput) || (this.encoderOut.hasRemaining()));
    return -1;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException("Byte array must not be null");
    }
    if ((paramInt2 < 0) || (paramInt1 < 0) || (paramInt1 + paramInt2 > paramArrayOfByte.length)) {
      throw new IndexOutOfBoundsException("Array Size=" + paramArrayOfByte.length + ", offset=" + paramInt1 + ", length=" + paramInt2);
    }
    int i = 0;
    if (paramInt2 == 0) {
      return 0;
    }
    do
    {
      for (;;)
      {
        if (paramInt2 <= 0) {
          break label165;
        }
        if (!this.encoderOut.hasRemaining()) {
          break;
        }
        int j = Math.min(this.encoderOut.remaining(), paramInt2);
        this.encoderOut.get(paramArrayOfByte, paramInt1, j);
        paramInt1 += j;
        paramInt2 -= j;
        i += j;
      }
      fillBuffer();
    } while ((!this.endOfInput) || (this.encoderOut.hasRemaining()));
    label165:
    if ((i == 0) && (this.endOfInput)) {
      return -1;
    }
    return i;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/ReaderInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */