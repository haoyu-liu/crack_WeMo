package net.lingala.zip4j.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipModel;

public class Zip4jUtil
{
  public static boolean checkArrayListTypes(ArrayList paramArrayList, int paramInt)
    throws ZipException
  {
    if (paramArrayList == null) {
      throw new ZipException("input arraylist is null, cannot check types");
    }
    if (paramArrayList.size() <= 0) {
      return true;
    }
    int i = 0;
    switch (paramInt)
    {
    default: 
      if (i != 0) {
        return false;
      }
      break;
    case 1: 
      label48:
      for (int m = 0;; m++)
      {
        int n = paramArrayList.size();
        i = 0;
        if (m >= n) {
          break;
        }
        if (!(paramArrayList.get(m) instanceof File))
        {
          i = 1;
          break;
        }
      }
    }
    for (int j = 0;; j++)
    {
      int k = paramArrayList.size();
      i = 0;
      if (j >= k) {
        break label48;
      }
      if (!(paramArrayList.get(j) instanceof String))
      {
        i = 1;
        break label48;
        break;
      }
    }
  }
  
  public static boolean checkFileExists(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("cannot check if file exists: input file is null");
    }
    return paramFile.exists();
  }
  
  public static boolean checkFileExists(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("path is null");
    }
    return checkFileExists(new File(paramString));
  }
  
  public static boolean checkFileReadAccess(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("path is null");
    }
    if (!checkFileExists(paramString)) {
      throw new ZipException("file does not exist: " + paramString);
    }
    try
    {
      boolean bool = new File(paramString).canRead();
      return bool;
    }
    catch (Exception localException)
    {
      throw new ZipException("cannot read zip file");
    }
  }
  
  public static boolean checkFileWriteAccess(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("path is null");
    }
    if (!checkFileExists(paramString)) {
      throw new ZipException("file does not exist: " + paramString);
    }
    try
    {
      boolean bool = new File(paramString).canWrite();
      return bool;
    }
    catch (Exception localException)
    {
      throw new ZipException("cannot read zip file");
    }
  }
  
  public static boolean checkOutputFolder(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException(new NullPointerException("output path is null"));
    }
    File localFile = new File(paramString);
    if (localFile.exists())
    {
      if (!localFile.isDirectory()) {
        throw new ZipException("output folder is not valid");
      }
      if (!localFile.canWrite()) {
        throw new ZipException("no write access to output folder");
      }
    }
    else
    {
      try
      {
        localFile.mkdirs();
        if (!localFile.isDirectory()) {
          throw new ZipException("output folder is not valid");
        }
      }
      catch (Exception localException)
      {
        throw new ZipException("Cannot create destination folder");
      }
      if (!localFile.canWrite()) {
        throw new ZipException("no write access to destination folder");
      }
    }
    return true;
  }
  
  public static byte[] convertCharset(String paramString)
    throws ZipException
  {
    try
    {
      ((byte[])null);
      String str = detectCharSet(paramString);
      if (str.equals("Cp850")) {
        return paramString.getBytes("Cp850");
      }
      if (str.equals("UTF8")) {
        return paramString.getBytes("UTF8");
      }
      byte[] arrayOfByte = paramString.getBytes();
      return arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      return paramString.getBytes();
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  public static String decodeFileName(byte[] paramArrayOfByte, boolean paramBoolean)
  {
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF8");
        return str;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        return new String(paramArrayOfByte);
      }
    }
    return getCp850EncodedString(paramArrayOfByte);
  }
  
  public static String detectCharSet(String paramString)
    throws ZipException
  {
    if (paramString == null) {
      throw new ZipException("input string is null, cannot detect charset");
    }
    try
    {
      boolean bool1 = paramString.equals(new String(paramString.getBytes("Cp850"), "Cp850"));
      if (bool1) {
        return "Cp850";
      }
      boolean bool2 = paramString.equals(new String(paramString.getBytes("UTF8"), "UTF8"));
      if (bool2) {
        return "UTF8";
      }
      String str = InternalZipConstants.CHARSET_DEFAULT;
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      return InternalZipConstants.CHARSET_DEFAULT;
    }
    catch (Exception localException) {}
    return InternalZipConstants.CHARSET_DEFAULT;
  }
  
  public static long dosToJavaTme(int paramInt)
  {
    int i = 2 * (paramInt & 0x1F);
    int j = 0x3F & paramInt >> 5;
    int k = 0x1F & paramInt >> 11;
    int m = 0x1F & paramInt >> 16;
    int n = -1 + (0xF & paramInt >> 21);
    int i1 = 1980 + (0x7F & paramInt >> 25);
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(i1, n, m, k, j, i);
    localCalendar.set(14, 0);
    return localCalendar.getTime().getTime();
  }
  
  public static String getAbsoluteFilePath(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("filePath is null or empty, cannot get absolute file path");
    }
    return new File(paramString).getAbsolutePath();
  }
  
  public static long[] getAllHeaderSignatures()
  {
    return new long[] { 67324752L, 134695760L, 33639248L, 101010256L, 84233040L, 134630224L, 134695760L, 117853008L, 101075792L, 1L, 39169L };
  }
  
  public static String getCp850EncodedString(byte[] paramArrayOfByte)
  {
    try
    {
      String str = new String(paramArrayOfByte, "Cp850");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
    return new String(paramArrayOfByte);
  }
  
  public static int getEncodedStringLength(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("input string is null, cannot calculate encoded String length");
    }
    return getEncodedStringLength(paramString, detectCharSet(paramString));
  }
  
  public static int getEncodedStringLength(String paramString1, String paramString2)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString1)) {
      throw new ZipException("input string is null, cannot calculate encoded String length");
    }
    if (!isStringNotNullAndNotEmpty(paramString2)) {
      throw new ZipException("encoding is not defined, cannot calculate string length");
    }
    for (;;)
    {
      try
      {
        if (!paramString2.equals("Cp850")) {
          continue;
        }
        ByteBuffer localByteBuffer2 = ByteBuffer.wrap(paramString1.getBytes("Cp850"));
        localObject = localByteBuffer2;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        ByteBuffer localByteBuffer1;
        Object localObject = ByteBuffer.wrap(paramString1.getBytes());
        continue;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
      return ((ByteBuffer)localObject).limit();
      if (paramString2.equals("UTF8"))
      {
        localObject = ByteBuffer.wrap(paramString1.getBytes("UTF8"));
      }
      else
      {
        localByteBuffer1 = ByteBuffer.wrap(paramString1.getBytes(paramString2));
        localObject = localByteBuffer1;
      }
    }
  }
  
  public static FileHeader getFileHeader(ZipModel paramZipModel, String paramString)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot determine file header for fileName: " + paramString);
    }
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("file name is null, cannot determine file header for fileName: " + paramString);
    }
    FileHeader localFileHeader = getFileHeaderWithExactMatch(paramZipModel, paramString);
    if (localFileHeader == null)
    {
      String str = paramString.replaceAll("\\\\", "/");
      localFileHeader = getFileHeaderWithExactMatch(paramZipModel, str);
      if (localFileHeader == null) {
        localFileHeader = getFileHeaderWithExactMatch(paramZipModel, str.replaceAll("/", "\\\\"));
      }
    }
    return localFileHeader;
  }
  
  public static FileHeader getFileHeaderWithExactMatch(ZipModel paramZipModel, String paramString)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("zip model is null, cannot determine file header with exact match for fileName: " + paramString);
    }
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("file name is null, cannot determine file header with exact match for fileName: " + paramString);
    }
    if (paramZipModel.getCentralDirectory() == null) {
      throw new ZipException("central directory is null, cannot determine file header with exact match for fileName: " + paramString);
    }
    if (paramZipModel.getCentralDirectory().getFileHeaders() == null) {
      throw new ZipException("file Headers are null, cannot determine file header with exact match for fileName: " + paramString);
    }
    if (paramZipModel.getCentralDirectory().getFileHeaders().size() <= 0) {
      return null;
    }
    ArrayList localArrayList = paramZipModel.getCentralDirectory().getFileHeaders();
    int i = 0;
    if (i >= localArrayList.size()) {
      return null;
    }
    FileHeader localFileHeader = (FileHeader)localArrayList.get(i);
    String str = localFileHeader.getFileName();
    if (!isStringNotNullAndNotEmpty(str)) {}
    while (!paramString.equalsIgnoreCase(str))
    {
      i++;
      break;
    }
    return localFileHeader;
  }
  
  public static long getFileLengh(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input file is null, cannot calculate file length");
    }
    if (paramFile.isDirectory()) {
      return -1L;
    }
    return paramFile.length();
  }
  
  public static long getFileLengh(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("invalid file name");
    }
    return getFileLengh(new File(paramString));
  }
  
  public static String getFileNameFromFilePath(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input file is null, cannot get file name");
    }
    if (paramFile.isDirectory()) {
      return null;
    }
    return paramFile.getName();
  }
  
  public static ArrayList getFilesInDirectoryRec(File paramFile, boolean paramBoolean)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input path is null, cannot read files in the directory");
    }
    ArrayList localArrayList = new ArrayList();
    List localList = Arrays.asList(paramFile.listFiles());
    if (!paramFile.canRead()) {}
    label109:
    for (;;)
    {
      return localArrayList;
      for (int i = 0;; i++)
      {
        if (i >= localList.size()) {
          break label109;
        }
        File localFile = (File)localList.get(i);
        if ((localFile.isHidden()) && (!paramBoolean)) {
          break;
        }
        localArrayList.add(localFile);
        if (localFile.isDirectory()) {
          localArrayList.addAll(getFilesInDirectoryRec(localFile, paramBoolean));
        }
      }
    }
  }
  
  public static int getIndexOfFileHeader(ZipModel paramZipModel, FileHeader paramFileHeader)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramFileHeader == null)) {
      throw new ZipException("input parameters is null, cannot determine index of file header");
    }
    if (paramZipModel.getCentralDirectory() == null) {
      throw new ZipException("central directory is null, ccannot determine index of file header");
    }
    if (paramZipModel.getCentralDirectory().getFileHeaders() == null) {
      throw new ZipException("file Headers are null, cannot determine index of file header");
    }
    if (paramZipModel.getCentralDirectory().getFileHeaders().size() <= 0) {
      return -1;
    }
    String str1 = paramFileHeader.getFileName();
    if (!isStringNotNullAndNotEmpty(str1)) {
      throw new ZipException("file name in file header is empty or null, cannot determine index of file header");
    }
    ArrayList localArrayList = paramZipModel.getCentralDirectory().getFileHeaders();
    int i = 0;
    if (i >= localArrayList.size()) {
      return -1;
    }
    String str2 = ((FileHeader)localArrayList.get(i)).getFileName();
    if (!isStringNotNullAndNotEmpty(str2)) {}
    while (!str1.equalsIgnoreCase(str2))
    {
      i++;
      break;
    }
    return i;
  }
  
  public static long getLastModifiedFileTime(File paramFile, TimeZone paramTimeZone)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input file is null, cannot read last modified file time");
    }
    if (!paramFile.exists()) {
      throw new ZipException("input file does not exist, cannot read last modified file time");
    }
    return paramFile.lastModified();
  }
  
  public static String getRelativeFileName(String paramString1, String paramString2, String paramString3)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString1)) {
      throw new ZipException("input file path/name is empty, cannot calculate relative file name");
    }
    String str3;
    File localFile2;
    String str4;
    String str1;
    if (isStringNotNullAndNotEmpty(paramString3))
    {
      String str2 = new File(paramString3).getPath();
      if (!str2.endsWith(InternalZipConstants.FILE_SEPARATOR)) {
        str2 = str2 + InternalZipConstants.FILE_SEPARATOR;
      }
      str3 = paramString1.substring(str2.length());
      if (str3.startsWith(System.getProperty("file.separator"))) {
        str3 = str3.substring(1);
      }
      localFile2 = new File(paramString1);
      if (localFile2.isDirectory())
      {
        str4 = str3.replaceAll("\\\\", "/") + "/";
        str1 = str4;
      }
    }
    for (;;)
    {
      if (isStringNotNullAndNotEmpty(paramString2)) {
        str1 = paramString2 + str1;
      }
      if (isStringNotNullAndNotEmpty(str1)) {
        break label311;
      }
      throw new ZipException("Error determining file name");
      str4 = str3.substring(0, str3.lastIndexOf(localFile2.getName())).replaceAll("\\\\", "/") + localFile2.getName();
      break;
      File localFile1 = new File(paramString1);
      if (localFile1.isDirectory()) {
        str1 = localFile1.getName() + "/";
      } else {
        str1 = getFileNameFromFilePath(new File(paramString1));
      }
    }
    label311:
    return str1;
  }
  
  public static ArrayList getSplitZipFiles(ZipModel paramZipModel)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("cannot get split zip files: zipmodel is null");
    }
    ArrayList localArrayList;
    if (paramZipModel.getEndCentralDirRecord() == null) {
      localArrayList = null;
    }
    String str1;
    String str2;
    int j;
    for (;;)
    {
      return localArrayList;
      localArrayList = new ArrayList();
      str1 = paramZipModel.getZipFile();
      str2 = new File(str1).getName();
      if (!isStringNotNullAndNotEmpty(str1)) {
        throw new ZipException("cannot get split zip files: zipfile is null");
      }
      if (!paramZipModel.isSplitArchive())
      {
        localArrayList.add(str1);
        return localArrayList;
      }
      int i = paramZipModel.getEndCentralDirRecord().getNoOfThisDisk();
      if (i == 0)
      {
        localArrayList.add(str1);
        return localArrayList;
      }
      for (j = 0; j <= i; j++)
      {
        if (j != i) {
          break label138;
        }
        localArrayList.add(paramZipModel.getZipFile());
      }
    }
    label138:
    String str3 = ".z0";
    if (j > 9) {
      str3 = ".z";
    }
    if (str2.indexOf(".") >= 0) {}
    for (String str4 = str1.substring(0, str1.lastIndexOf("."));; str4 = str1)
    {
      localArrayList.add(str4 + str3 + (j + 1));
      break;
    }
  }
  
  public static String getZipFileNameWithoutExt(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("zip file name is empty or null, cannot determine zip file name");
    }
    String str = paramString;
    if (paramString.indexOf(System.getProperty("file.separator")) >= 0) {
      str = paramString.substring(paramString.lastIndexOf(System.getProperty("file.separator")));
    }
    if (str.indexOf(".") > 0) {
      str = str.substring(0, str.lastIndexOf("."));
    }
    return str;
  }
  
  public static boolean isStringNotNullAndNotEmpty(String paramString)
  {
    return (paramString != null) && (paramString.trim().length() > 0);
  }
  
  public static boolean isSupportedCharset(String paramString)
    throws ZipException
  {
    if (!isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("charset is null or empty, cannot check if it is supported");
    }
    try
    {
      new String("a".getBytes(), paramString);
      return true;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      return false;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  public static boolean isWindows()
  {
    return System.getProperty("os.name").toLowerCase().indexOf("win") >= 0;
  }
  
  public static long javaToDosTime(long paramLong)
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTimeInMillis(paramLong);
    int i = localCalendar.get(1);
    if (i < 1980) {
      return 2162688L;
    }
    return i - 1980 << 25 | 1 + localCalendar.get(2) << 21 | localCalendar.get(5) << 16 | localCalendar.get(11) << 11 | localCalendar.get(12) << 5 | localCalendar.get(13) >> 1;
  }
  
  public static void setFileArchive(File paramFile)
    throws ZipException
  {}
  
  public static void setFileHidden(File paramFile)
    throws ZipException
  {}
  
  public static void setFileReadOnly(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input file is null. cannot set read only file attribute");
    }
    if (paramFile.exists()) {
      paramFile.setReadOnly();
    }
  }
  
  public static void setFileSystemMode(File paramFile)
    throws ZipException
  {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/Zip4jUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */