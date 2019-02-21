package org.apache.commons.io.input;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.ByteOrderMark;

public class XmlStreamReader
  extends Reader
{
  private static final ByteOrderMark[] BOMS;
  private static final int BUFFER_SIZE = 4096;
  private static final Pattern CHARSET_PATTERN = Pattern.compile("charset=[\"']?([.[^; \"']]*)[\"']?");
  private static final String EBCDIC = "CP1047";
  public static final Pattern ENCODING_PATTERN = Pattern.compile("<\\?xml.*encoding[\\s]*=[\\s]*((?:\".[^\"]*\")|(?:'.[^']*'))", 8);
  private static final String HTTP_EX_1 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], BOM must be NULL";
  private static final String HTTP_EX_2 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], encoding mismatch";
  private static final String HTTP_EX_3 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], Invalid MIME";
  private static final String RAW_EX_1 = "Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch";
  private static final String RAW_EX_2 = "Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] unknown BOM";
  private static final String US_ASCII = "US-ASCII";
  private static final String UTF_16 = "UTF-16";
  private static final String UTF_16BE = "UTF-16BE";
  private static final String UTF_16LE = "UTF-16LE";
  private static final String UTF_32 = "UTF-32";
  private static final String UTF_32BE = "UTF-32BE";
  private static final String UTF_32LE = "UTF-32LE";
  private static final String UTF_8 = "UTF-8";
  private static final ByteOrderMark[] XML_GUESS_BYTES;
  private final String defaultEncoding;
  private final String encoding;
  private final Reader reader;
  
  static
  {
    ByteOrderMark[] arrayOfByteOrderMark1 = new ByteOrderMark[5];
    arrayOfByteOrderMark1[0] = ByteOrderMark.UTF_8;
    arrayOfByteOrderMark1[1] = ByteOrderMark.UTF_16BE;
    arrayOfByteOrderMark1[2] = ByteOrderMark.UTF_16LE;
    arrayOfByteOrderMark1[3] = ByteOrderMark.UTF_32BE;
    arrayOfByteOrderMark1[4] = ByteOrderMark.UTF_32LE;
    BOMS = arrayOfByteOrderMark1;
    ByteOrderMark[] arrayOfByteOrderMark2 = new ByteOrderMark[6];
    arrayOfByteOrderMark2[0] = new ByteOrderMark("UTF-8", new int[] { 60, 63, 120, 109 });
    arrayOfByteOrderMark2[1] = new ByteOrderMark("UTF-16BE", new int[] { 0, 60, 0, 63 });
    arrayOfByteOrderMark2[2] = new ByteOrderMark("UTF-16LE", new int[] { 60, 0, 63, 0 });
    arrayOfByteOrderMark2[3] = new ByteOrderMark("UTF-32BE", new int[] { 0, 0, 0, 60, 0, 0, 0, 63, 0, 0, 0, 120, 0, 0, 0, 109 });
    arrayOfByteOrderMark2[4] = new ByteOrderMark("UTF-32LE", new int[] { 60, 0, 0, 0, 63, 0, 0, 0, 120, 0, 0, 0, 109, 0, 0, 0 });
    arrayOfByteOrderMark2[5] = new ByteOrderMark("CP1047", new int[] { 76, 111, 167, 148 });
    XML_GUESS_BYTES = arrayOfByteOrderMark2;
  }
  
  public XmlStreamReader(File paramFile)
    throws IOException
  {
    this(new FileInputStream(paramFile));
  }
  
  public XmlStreamReader(InputStream paramInputStream)
    throws IOException
  {
    this(paramInputStream, true);
  }
  
  public XmlStreamReader(InputStream paramInputStream, String paramString)
    throws IOException
  {
    this(paramInputStream, paramString, true);
  }
  
  public XmlStreamReader(InputStream paramInputStream, String paramString, boolean paramBoolean)
    throws IOException
  {
    this(paramInputStream, paramString, paramBoolean, null);
  }
  
  public XmlStreamReader(InputStream paramInputStream, String paramString1, boolean paramBoolean, String paramString2)
    throws IOException
  {
    this.defaultEncoding = paramString2;
    BOMInputStream localBOMInputStream1 = new BOMInputStream(new BufferedInputStream(paramInputStream, 4096), false, BOMS);
    BOMInputStream localBOMInputStream2 = new BOMInputStream(localBOMInputStream1, true, XML_GUESS_BYTES);
    this.encoding = doHttpStream(localBOMInputStream1, localBOMInputStream2, paramString1, paramBoolean);
    this.reader = new InputStreamReader(localBOMInputStream2, this.encoding);
  }
  
  public XmlStreamReader(InputStream paramInputStream, boolean paramBoolean)
    throws IOException
  {
    this(paramInputStream, paramBoolean, null);
  }
  
  public XmlStreamReader(InputStream paramInputStream, boolean paramBoolean, String paramString)
    throws IOException
  {
    this.defaultEncoding = paramString;
    BOMInputStream localBOMInputStream1 = new BOMInputStream(new BufferedInputStream(paramInputStream, 4096), false, BOMS);
    BOMInputStream localBOMInputStream2 = new BOMInputStream(localBOMInputStream1, true, XML_GUESS_BYTES);
    this.encoding = doRawStream(localBOMInputStream1, localBOMInputStream2, paramBoolean);
    this.reader = new InputStreamReader(localBOMInputStream2, this.encoding);
  }
  
  public XmlStreamReader(URL paramURL)
    throws IOException
  {
    this(paramURL.openConnection(), null);
  }
  
  public XmlStreamReader(URLConnection paramURLConnection, String paramString)
    throws IOException
  {
    this.defaultEncoding = paramString;
    String str = paramURLConnection.getContentType();
    BOMInputStream localBOMInputStream1 = new BOMInputStream(new BufferedInputStream(paramURLConnection.getInputStream(), 4096), false, BOMS);
    BOMInputStream localBOMInputStream2 = new BOMInputStream(localBOMInputStream1, true, XML_GUESS_BYTES);
    if (((paramURLConnection instanceof HttpURLConnection)) || (str != null)) {}
    for (this.encoding = doHttpStream(localBOMInputStream1, localBOMInputStream2, str, true);; this.encoding = doRawStream(localBOMInputStream1, localBOMInputStream2, true))
    {
      this.reader = new InputStreamReader(localBOMInputStream2, this.encoding);
      return;
    }
  }
  
  private String doHttpStream(BOMInputStream paramBOMInputStream1, BOMInputStream paramBOMInputStream2, String paramString, boolean paramBoolean)
    throws IOException
  {
    String str1 = paramBOMInputStream1.getBOMCharsetName();
    String str2 = paramBOMInputStream2.getBOMCharsetName();
    String str3 = getXmlProlog(paramBOMInputStream2, str2);
    try
    {
      String str4 = calculateHttpEncoding(paramString, str1, str2, str3, paramBoolean);
      return str4;
    }
    catch (XmlStreamReaderException localXmlStreamReaderException)
    {
      if (paramBoolean) {
        return doLenientDetection(paramString, localXmlStreamReaderException);
      }
      throw localXmlStreamReaderException;
    }
  }
  
  private String doLenientDetection(String paramString, XmlStreamReaderException paramXmlStreamReaderException)
    throws IOException
  {
    String str3;
    if ((paramString != null) && (paramString.startsWith("text/html")))
    {
      String str2 = paramString.substring("text/html".length());
      str3 = "text/xml" + str2;
    }
    String str1;
    do
    {
      try
      {
        String str4 = calculateHttpEncoding(str3, paramXmlStreamReaderException.getBomEncoding(), paramXmlStreamReaderException.getXmlGuessEncoding(), paramXmlStreamReaderException.getXmlEncoding(), true);
        str1 = str4;
        return str1;
      }
      catch (XmlStreamReaderException localXmlStreamReaderException)
      {
        paramXmlStreamReaderException = localXmlStreamReaderException;
      }
      str1 = paramXmlStreamReaderException.getXmlEncoding();
      if (str1 == null) {
        str1 = paramXmlStreamReaderException.getContentTypeEncoding();
      }
    } while (str1 != null);
    if (this.defaultEncoding == null) {
      return "UTF-8";
    }
    return this.defaultEncoding;
  }
  
  private String doRawStream(BOMInputStream paramBOMInputStream1, BOMInputStream paramBOMInputStream2, boolean paramBoolean)
    throws IOException
  {
    String str1 = paramBOMInputStream1.getBOMCharsetName();
    String str2 = paramBOMInputStream2.getBOMCharsetName();
    String str3 = getXmlProlog(paramBOMInputStream2, str2);
    try
    {
      String str4 = calculateRawEncoding(str1, str2, str3);
      return str4;
    }
    catch (XmlStreamReaderException localXmlStreamReaderException)
    {
      if (paramBoolean) {
        return doLenientDetection(null, localXmlStreamReaderException);
      }
      throw localXmlStreamReaderException;
    }
  }
  
  static String getContentTypeEncoding(String paramString)
  {
    String str1 = null;
    Matcher localMatcher;
    if (paramString != null)
    {
      int i = paramString.indexOf(";");
      str1 = null;
      if (i > -1)
      {
        String str2 = paramString.substring(i + 1);
        localMatcher = CHARSET_PATTERN.matcher(str2);
        if (!localMatcher.find()) {
          break label69;
        }
      }
    }
    label69:
    for (String str3 = localMatcher.group(1); str3 != null; str3 = null)
    {
      str1 = str3.toUpperCase(Locale.US);
      return str1;
    }
    return null;
  }
  
  static String getContentTypeMime(String paramString)
  {
    String str1 = null;
    int i;
    if (paramString != null)
    {
      i = paramString.indexOf(";");
      if (i < 0) {
        break label31;
      }
    }
    label31:
    for (String str2 = paramString.substring(0, i);; str2 = paramString)
    {
      str1 = str2.trim();
      return str1;
    }
  }
  
  private static String getXmlProlog(InputStream paramInputStream, String paramString)
    throws IOException
  {
    String str1 = null;
    if (paramString != null)
    {
      byte[] arrayOfByte = new byte['က'];
      paramInputStream.mark(4096);
      int i = 0;
      int j = 4096;
      int k = paramInputStream.read(arrayOfByte, 0, j);
      int m = -1;
      String str2 = null;
      while ((k != -1) && (m == -1) && (i < 4096))
      {
        i += k;
        j -= k;
        k = paramInputStream.read(arrayOfByte, i, j);
        str2 = new String(arrayOfByte, 0, i, paramString);
        m = str2.indexOf('>');
      }
      if (m == -1)
      {
        if (k == -1) {
          throw new IOException("Unexpected end of XML stream");
        }
        throw new IOException("XML prolog or ROOT element not found on first " + i + " bytes");
      }
      int n = i;
      str1 = null;
      if (n > 0)
      {
        paramInputStream.reset();
        BufferedReader localBufferedReader = new BufferedReader(new StringReader(str2.substring(0, m + 1)));
        StringBuffer localStringBuffer = new StringBuffer();
        for (String str3 = localBufferedReader.readLine(); str3 != null; str3 = localBufferedReader.readLine()) {
          localStringBuffer.append(str3);
        }
        Matcher localMatcher = ENCODING_PATTERN.matcher(localStringBuffer);
        boolean bool = localMatcher.find();
        str1 = null;
        if (bool)
        {
          String str4 = localMatcher.group(1).toUpperCase();
          str1 = str4.substring(1, -1 + str4.length());
        }
      }
    }
    return str1;
  }
  
  static boolean isAppXml(String paramString)
  {
    return (paramString != null) && ((paramString.equals("application/xml")) || (paramString.equals("application/xml-dtd")) || (paramString.equals("application/xml-external-parsed-entity")) || ((paramString.startsWith("application/")) && (paramString.endsWith("+xml"))));
  }
  
  static boolean isTextXml(String paramString)
  {
    return (paramString != null) && ((paramString.equals("text/xml")) || (paramString.equals("text/xml-external-parsed-entity")) || ((paramString.startsWith("text/")) && (paramString.endsWith("+xml"))));
  }
  
  String calculateHttpEncoding(String paramString1, String paramString2, String paramString3, String paramString4, boolean paramBoolean)
    throws IOException
  {
    String str2;
    if ((paramBoolean) && (paramString4 != null)) {
      str2 = paramString4;
    }
    String str1;
    do
    {
      do
      {
        do
        {
          return str2;
          str1 = getContentTypeMime(paramString1);
          str2 = getContentTypeEncoding(paramString1);
          boolean bool1 = isAppXml(str1);
          boolean bool2 = isTextXml(str1);
          if ((!bool1) && (!bool2)) {
            throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], Invalid MIME", new Object[] { str1, str2, paramString2, paramString3, paramString4 }), str1, str2, paramString2, paramString3, paramString4);
          }
          if (str2 == null)
          {
            if (bool1) {
              return calculateRawEncoding(paramString2, paramString3, paramString4);
            }
            if (this.defaultEncoding == null) {}
            for (String str3 = "US-ASCII";; str3 = this.defaultEncoding) {
              return str3;
            }
          }
          if ((!str2.equals("UTF-16BE")) && (!str2.equals("UTF-16LE"))) {
            break;
          }
        } while (paramString2 == null);
        throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], BOM must be NULL", new Object[] { str1, str2, paramString2, paramString3, paramString4 }), str1, str2, paramString2, paramString3, paramString4);
        if (str2.equals("UTF-16"))
        {
          if ((paramString2 != null) && (paramString2.startsWith("UTF-16"))) {
            return paramString2;
          }
          throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], encoding mismatch", new Object[] { str1, str2, paramString2, paramString3, paramString4 }), str1, str2, paramString2, paramString3, paramString4);
        }
        if ((!str2.equals("UTF-32BE")) && (!str2.equals("UTF-32LE"))) {
          break;
        }
      } while (paramString2 == null);
      throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], BOM must be NULL", new Object[] { str1, str2, paramString2, paramString3, paramString4 }), str1, str2, paramString2, paramString3, paramString4);
    } while (!str2.equals("UTF-32"));
    if ((paramString2 != null) && (paramString2.startsWith("UTF-32"))) {
      return paramString2;
    }
    throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], encoding mismatch", new Object[] { str1, str2, paramString2, paramString3, paramString4 }), str1, str2, paramString2, paramString3, paramString4);
  }
  
  String calculateRawEncoding(String paramString1, String paramString2, String paramString3)
    throws IOException
  {
    String str;
    if (paramString1 == null) {
      if ((paramString2 == null) || (paramString3 == null)) {
        if (this.defaultEncoding == null)
        {
          str = "UTF-8";
          paramString1 = str;
        }
      }
    }
    label167:
    label282:
    do
    {
      do
      {
        do
        {
          return paramString1;
          str = this.defaultEncoding;
          break;
          if ((paramString3.equals("UTF-16")) && ((paramString2.equals("UTF-16BE")) || (paramString2.equals("UTF-16LE")))) {
            return paramString2;
          }
          return paramString3;
          if (!paramString1.equals("UTF-8")) {
            break label167;
          }
          if ((paramString2 != null) && (!paramString2.equals("UTF-8"))) {
            throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
          }
        } while ((paramString3 == null) || (paramString3.equals("UTF-8")));
        throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
        if ((!paramString1.equals("UTF-16BE")) && (!paramString1.equals("UTF-16LE"))) {
          break label282;
        }
        if ((paramString2 != null) && (!paramString2.equals(paramString1))) {
          throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
        }
      } while ((paramString3 == null) || (paramString3.equals("UTF-16")) || (paramString3.equals(paramString1)));
      throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
      if ((!paramString1.equals("UTF-32BE")) && (!paramString1.equals("UTF-32LE"))) {
        break label397;
      }
      if ((paramString2 != null) && (!paramString2.equals(paramString1))) {
        throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
      }
    } while ((paramString3 == null) || (paramString3.equals("UTF-32")) || (paramString3.equals(paramString1)));
    throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
    label397:
    throw new XmlStreamReaderException(MessageFormat.format("Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] unknown BOM", new Object[] { paramString1, paramString2, paramString3 }), paramString1, paramString2, paramString3);
  }
  
  public void close()
    throws IOException
  {
    this.reader.close();
  }
  
  public String getDefaultEncoding()
  {
    return this.defaultEncoding;
  }
  
  public String getEncoding()
  {
    return this.encoding;
  }
  
  public int read(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    return this.reader.read(paramArrayOfChar, paramInt1, paramInt2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/XmlStreamReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */