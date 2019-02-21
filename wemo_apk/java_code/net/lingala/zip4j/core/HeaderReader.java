package net.lingala.zip4j.core;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.AESExtraDataRecord;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.DigitalSignature;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.ExtraDataRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.LocalFileHeader;
import net.lingala.zip4j.model.Zip64EndCentralDirLocator;
import net.lingala.zip4j.model.Zip64EndCentralDirRecord;
import net.lingala.zip4j.model.Zip64ExtendedInfo;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.util.Raw;
import net.lingala.zip4j.util.Zip4jUtil;

public class HeaderReader
{
  private RandomAccessFile zip4jRaf = null;
  private ZipModel zipModel;
  
  public HeaderReader(RandomAccessFile paramRandomAccessFile)
  {
    this.zip4jRaf = paramRandomAccessFile;
  }
  
  private byte[] getLongByteFromIntByte(byte[] paramArrayOfByte)
    throws ZipException
  {
    if (paramArrayOfByte == null) {
      throw new ZipException("input parameter is null, cannot expand to 8 bytes");
    }
    if (paramArrayOfByte.length != 4) {
      throw new ZipException("invalid byte length, cannot expand to 8 bytes");
    }
    byte[] arrayOfByte = new byte[8];
    arrayOfByte[0] = paramArrayOfByte[0];
    arrayOfByte[1] = paramArrayOfByte[1];
    arrayOfByte[2] = paramArrayOfByte[2];
    arrayOfByte[3] = paramArrayOfByte[3];
    return arrayOfByte;
  }
  
  private AESExtraDataRecord readAESExtraDataRecord(ArrayList paramArrayList)
    throws ZipException
  {
    if (paramArrayList == null) {
      return null;
    }
    int i = 0;
    label8:
    ExtraDataRecord localExtraDataRecord;
    if (i < paramArrayList.size())
    {
      localExtraDataRecord = (ExtraDataRecord)paramArrayList.get(i);
      if (localExtraDataRecord != null) {
        break label35;
      }
    }
    label35:
    while (localExtraDataRecord.getHeader() != 39169L)
    {
      i++;
      break label8;
      break;
    }
    if (localExtraDataRecord.getData() == null) {
      throw new ZipException("corrput AES extra data records");
    }
    AESExtraDataRecord localAESExtraDataRecord = new AESExtraDataRecord();
    localAESExtraDataRecord.setSignature(39169L);
    localAESExtraDataRecord.setDataSize(localExtraDataRecord.getSizeOfData());
    byte[] arrayOfByte1 = localExtraDataRecord.getData();
    localAESExtraDataRecord.setVersionNumber(Raw.readShortLittleEndian(arrayOfByte1, 0));
    byte[] arrayOfByte2 = new byte[2];
    System.arraycopy(arrayOfByte1, 2, arrayOfByte2, 0, 2);
    localAESExtraDataRecord.setVendorID(new String(arrayOfByte2));
    localAESExtraDataRecord.setAesStrength(0xFF & arrayOfByte1[4]);
    localAESExtraDataRecord.setCompressionMethod(Raw.readShortLittleEndian(arrayOfByte1, 5));
    return localAESExtraDataRecord;
  }
  
  private void readAndSaveAESExtraDataRecord(FileHeader paramFileHeader)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("file header is null in reading Zip64 Extended Info");
    }
    if ((paramFileHeader.getExtraDataRecords() == null) || (paramFileHeader.getExtraDataRecords().size() <= 0)) {}
    AESExtraDataRecord localAESExtraDataRecord;
    do
    {
      return;
      localAESExtraDataRecord = readAESExtraDataRecord(paramFileHeader.getExtraDataRecords());
    } while (localAESExtraDataRecord == null);
    paramFileHeader.setAesExtraDataRecord(localAESExtraDataRecord);
    paramFileHeader.setEncryptionMethod(99);
  }
  
  private void readAndSaveAESExtraDataRecord(LocalFileHeader paramLocalFileHeader)
    throws ZipException
  {
    if (paramLocalFileHeader == null) {
      throw new ZipException("file header is null in reading Zip64 Extended Info");
    }
    if ((paramLocalFileHeader.getExtraDataRecords() == null) || (paramLocalFileHeader.getExtraDataRecords().size() <= 0)) {}
    AESExtraDataRecord localAESExtraDataRecord;
    do
    {
      return;
      localAESExtraDataRecord = readAESExtraDataRecord(paramLocalFileHeader.getExtraDataRecords());
    } while (localAESExtraDataRecord == null);
    paramLocalFileHeader.setAesExtraDataRecord(localAESExtraDataRecord);
    paramLocalFileHeader.setEncryptionMethod(99);
  }
  
  private void readAndSaveExtraDataRecord(FileHeader paramFileHeader)
    throws ZipException
  {
    if (this.zip4jRaf == null) {
      throw new ZipException("invalid file handler when trying to read extra data record");
    }
    if (paramFileHeader == null) {
      throw new ZipException("file header is null");
    }
    int i = paramFileHeader.getExtraFieldLength();
    if (i <= 0) {
      return;
    }
    paramFileHeader.setExtraDataRecords(readExtraDataRecords(i));
  }
  
  private void readAndSaveExtraDataRecord(LocalFileHeader paramLocalFileHeader)
    throws ZipException
  {
    if (this.zip4jRaf == null) {
      throw new ZipException("invalid file handler when trying to read extra data record");
    }
    if (paramLocalFileHeader == null) {
      throw new ZipException("file header is null");
    }
    int i = paramLocalFileHeader.getExtraFieldLength();
    if (i <= 0) {
      return;
    }
    paramLocalFileHeader.setExtraDataRecords(readExtraDataRecords(i));
  }
  
  private void readAndSaveZip64ExtendedInfo(FileHeader paramFileHeader)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("file header is null in reading Zip64 Extended Info");
    }
    if ((paramFileHeader.getExtraDataRecords() == null) || (paramFileHeader.getExtraDataRecords().size() <= 0)) {}
    Zip64ExtendedInfo localZip64ExtendedInfo;
    do
    {
      do
      {
        return;
        localZip64ExtendedInfo = readZip64ExtendedInfo(paramFileHeader.getExtraDataRecords(), paramFileHeader.getUncompressedSize(), paramFileHeader.getCompressedSize(), paramFileHeader.getOffsetLocalHeader(), paramFileHeader.getDiskNumberStart());
      } while (localZip64ExtendedInfo == null);
      paramFileHeader.setZip64ExtendedInfo(localZip64ExtendedInfo);
      if (localZip64ExtendedInfo.getUnCompressedSize() != -1L) {
        paramFileHeader.setUncompressedSize(localZip64ExtendedInfo.getUnCompressedSize());
      }
      if (localZip64ExtendedInfo.getCompressedSize() != -1L) {
        paramFileHeader.setCompressedSize(localZip64ExtendedInfo.getCompressedSize());
      }
      if (localZip64ExtendedInfo.getOffsetLocalHeader() != -1L) {
        paramFileHeader.setOffsetLocalHeader(localZip64ExtendedInfo.getOffsetLocalHeader());
      }
    } while (localZip64ExtendedInfo.getDiskNumberStart() == -1);
    paramFileHeader.setDiskNumberStart(localZip64ExtendedInfo.getDiskNumberStart());
  }
  
  private void readAndSaveZip64ExtendedInfo(LocalFileHeader paramLocalFileHeader)
    throws ZipException
  {
    if (paramLocalFileHeader == null) {
      throw new ZipException("file header is null in reading Zip64 Extended Info");
    }
    if ((paramLocalFileHeader.getExtraDataRecords() == null) || (paramLocalFileHeader.getExtraDataRecords().size() <= 0)) {}
    Zip64ExtendedInfo localZip64ExtendedInfo;
    do
    {
      do
      {
        return;
        localZip64ExtendedInfo = readZip64ExtendedInfo(paramLocalFileHeader.getExtraDataRecords(), paramLocalFileHeader.getUncompressedSize(), paramLocalFileHeader.getCompressedSize(), -1L, -1);
      } while (localZip64ExtendedInfo == null);
      paramLocalFileHeader.setZip64ExtendedInfo(localZip64ExtendedInfo);
      if (localZip64ExtendedInfo.getUnCompressedSize() != -1L) {
        paramLocalFileHeader.setUncompressedSize(localZip64ExtendedInfo.getUnCompressedSize());
      }
    } while (localZip64ExtendedInfo.getCompressedSize() == -1L);
    paramLocalFileHeader.setCompressedSize(localZip64ExtendedInfo.getCompressedSize());
  }
  
  private CentralDirectory readCentralDirectory()
    throws ZipException
  {
    if (this.zip4jRaf == null) {
      throw new ZipException("random access file was null", 3);
    }
    if (this.zipModel.getEndCentralDirRecord() == null) {
      throw new ZipException("EndCentralRecord was null, maybe a corrupt zip file");
    }
    CentralDirectory localCentralDirectory;
    ArrayList localArrayList;
    byte[] arrayOfByte1;
    byte[] arrayOfByte2;
    int j;
    DigitalSignature localDigitalSignature;
    int k;
    FileHeader localFileHeader;
    int n;
    try
    {
      localCentralDirectory = new CentralDirectory();
      localArrayList = new ArrayList();
      EndCentralDirRecord localEndCentralDirRecord = this.zipModel.getEndCentralDirRecord();
      long l = localEndCentralDirRecord.getOffsetOfStartOfCentralDir();
      int i = localEndCentralDirRecord.getTotNoOfEntriesInCentralDir();
      if (this.zipModel.isZip64Format())
      {
        l = this.zipModel.getZip64EndCentralDirRecord().getOffsetStartCenDirWRTStartDiskNo();
        i = (int)this.zipModel.getZip64EndCentralDirRecord().getTotNoOfEntriesInCentralDir();
      }
      this.zip4jRaf.seek(l);
      arrayOfByte1 = new byte[4];
      arrayOfByte2 = new byte[2];
      new byte[8];
      j = 0;
      if (j >= i)
      {
        localCentralDirectory.setFileHeaders(localArrayList);
        localDigitalSignature = new DigitalSignature();
        readIntoBuff(this.zip4jRaf, arrayOfByte1);
        k = Raw.readIntLittleEndian(arrayOfByte1, 0);
        if (k == 84233040L) {
          break label998;
        }
        return localCentralDirectory;
      }
      localFileHeader = new FileHeader();
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      n = Raw.readIntLittleEndian(arrayOfByte1, 0);
      if (n != 33639248L) {
        throw new ZipException("Expected central directory entry not found (#" + (j + 1) + ")");
      }
    }
    catch (IOException localIOException)
    {
      ZipException localZipException = new ZipException(localIOException);
      throw localZipException;
    }
    localFileHeader.setSignature(n);
    readIntoBuff(this.zip4jRaf, arrayOfByte2);
    localFileHeader.setVersionMadeBy(Raw.readShortLittleEndian(arrayOfByte2, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte2);
    localFileHeader.setVersionNeededToExtract(Raw.readShortLittleEndian(arrayOfByte2, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte2);
    boolean bool1;
    label355:
    boolean bool2;
    label405:
    int i3;
    if ((0x800 & Raw.readShortLittleEndian(arrayOfByte2, 0)) != 0)
    {
      bool1 = true;
      localFileHeader.setFileNameUTF8Encoded(bool1);
      int i1 = arrayOfByte2[0];
      if ((i1 & 0x1) != 0) {
        localFileHeader.setEncrypted(true);
      }
      localFileHeader.setGeneralPurposeFlag((byte[])arrayOfByte2.clone());
      if (i1 >> 3 != 1) {
        break label1079;
      }
      bool2 = true;
      localFileHeader.setDataDescriptorExists(bool2);
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localFileHeader.setCompressionMethod(Raw.readShortLittleEndian(arrayOfByte2, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setLastModFileTime(Raw.readIntLittleEndian(arrayOfByte1, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setCrc32(Raw.readIntLittleEndian(arrayOfByte1, 0));
      localFileHeader.setCrcBuff((byte[])arrayOfByte1.clone());
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setCompressedSize(Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte1), 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setUncompressedSize(Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte1), 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      int i2 = Raw.readShortLittleEndian(arrayOfByte2, 0);
      localFileHeader.setFileNameLength(i2);
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localFileHeader.setExtraFieldLength(Raw.readShortLittleEndian(arrayOfByte2, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      i3 = Raw.readShortLittleEndian(arrayOfByte2, 0);
      String str2 = new String(arrayOfByte2);
      localFileHeader.setFileComment(str2);
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localFileHeader.setDiskNumberStart(Raw.readShortLittleEndian(arrayOfByte2, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localFileHeader.setInternalFileAttr((byte[])arrayOfByte2.clone());
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setExternalFileAttr((byte[])arrayOfByte1.clone());
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localFileHeader.setOffsetLocalHeader(0xFFFFFFFF & Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte1), 0));
      if (i2 > 0)
      {
        byte[] arrayOfByte4 = new byte[i2];
        readIntoBuff(this.zip4jRaf, arrayOfByte4);
        if (Zip4jUtil.isStringNotNullAndNotEmpty(this.zipModel.getFileNameCharset())) {}
        for (String str3 = new String(arrayOfByte4, this.zipModel.getFileNameCharset()); str3 == null; str3 = Zip4jUtil.decodeFileName(arrayOfByte4, localFileHeader.isFileNameUTF8Encoded())) {
          throw new ZipException("fileName is null when reading central directory");
        }
        if (str3.indexOf(":" + System.getProperty("file.separator")) >= 0) {
          str3 = str3.substring(2 + str3.indexOf(":" + System.getProperty("file.separator")));
        }
        localFileHeader.setFileName(str3);
        if ((str3.endsWith("/")) || (str3.endsWith("\\"))) {
          break label1085;
        }
      }
    }
    label998:
    label1079:
    label1085:
    for (boolean bool3 = false;; bool3 = true)
    {
      localFileHeader.setDirectory(bool3);
      for (;;)
      {
        readAndSaveExtraDataRecord(localFileHeader);
        readAndSaveZip64ExtendedInfo(localFileHeader);
        readAndSaveAESExtraDataRecord(localFileHeader);
        if (i3 > 0)
        {
          byte[] arrayOfByte5 = new byte[i3];
          readIntoBuff(this.zip4jRaf, arrayOfByte5);
          String str4 = new String(arrayOfByte5);
          localFileHeader.setFileComment(str4);
        }
        localArrayList.add(localFileHeader);
        j++;
        break;
        localFileHeader.setFileName(null);
      }
      localDigitalSignature.setHeaderSignature(k);
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      int m = Raw.readShortLittleEndian(arrayOfByte2, 0);
      localDigitalSignature.setSizeOfData(m);
      if (m > 0)
      {
        byte[] arrayOfByte3 = new byte[m];
        readIntoBuff(this.zip4jRaf, arrayOfByte3);
        String str1 = new String(arrayOfByte3);
        localDigitalSignature.setSignatureData(str1);
      }
      return localCentralDirectory;
      bool1 = false;
      break label355;
      bool2 = false;
      break label405;
    }
  }
  
  private EndCentralDirRecord readEndOfCentralDirectoryRecord()
    throws ZipException
  {
    if (this.zip4jRaf == null) {
      throw new ZipException("random access file was null", 3);
    }
    for (;;)
    {
      EndCentralDirRecord localEndCentralDirRecord;
      long l3;
      try
      {
        byte[] arrayOfByte1 = new byte[4];
        long l1 = this.zip4jRaf.length() - 22L;
        localEndCentralDirRecord = new EndCentralDirRecord();
        int i = 0;
        l2 = l1;
        RandomAccessFile localRandomAccessFile = this.zip4jRaf;
        l3 = l2 - 1L;
        localRandomAccessFile.seek(l2);
        i++;
        if ((Raw.readLeInt(this.zip4jRaf, arrayOfByte1) != 101010256L) && (i <= 3000)) {
          break label403;
        }
        if (Raw.readIntLittleEndian(arrayOfByte1, 0) != 101010256L) {
          throw new ZipException("zip headers not found. probably not a zip file");
        }
      }
      catch (IOException localIOException)
      {
        ZipException localZipException = new ZipException("Probably not a zip file or a corrupted zip file", localIOException, 4);
        throw localZipException;
      }
      byte[] arrayOfByte2 = new byte[4];
      byte[] arrayOfByte3 = new byte[2];
      localEndCentralDirRecord.setSignature(101010256L);
      readIntoBuff(this.zip4jRaf, arrayOfByte3);
      localEndCentralDirRecord.setNoOfThisDisk(Raw.readShortLittleEndian(arrayOfByte3, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte3);
      localEndCentralDirRecord.setNoOfThisDiskStartOfCentralDir(Raw.readShortLittleEndian(arrayOfByte3, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte3);
      localEndCentralDirRecord.setTotNoOfEntriesInCentralDirOnThisDisk(Raw.readShortLittleEndian(arrayOfByte3, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte3);
      localEndCentralDirRecord.setTotNoOfEntriesInCentralDir(Raw.readShortLittleEndian(arrayOfByte3, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localEndCentralDirRecord.setSizeOfCentralDir(Raw.readIntLittleEndian(arrayOfByte2, 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localEndCentralDirRecord.setOffsetOfStartOfCentralDir(Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte2), 0));
      readIntoBuff(this.zip4jRaf, arrayOfByte3);
      int j = Raw.readShortLittleEndian(arrayOfByte3, 0);
      localEndCentralDirRecord.setCommentLength(j);
      if (j > 0)
      {
        byte[] arrayOfByte4 = new byte[j];
        readIntoBuff(this.zip4jRaf, arrayOfByte4);
        String str = new String(arrayOfByte4);
        localEndCentralDirRecord.setComment(str);
        localEndCentralDirRecord.setCommentBytes(arrayOfByte4);
      }
      while (localEndCentralDirRecord.getNoOfThisDisk() > 0)
      {
        this.zipModel.setSplitArchive(true);
        return localEndCentralDirRecord;
        localEndCentralDirRecord.setComment(null);
      }
      this.zipModel.setSplitArchive(false);
      return localEndCentralDirRecord;
      label403:
      long l2 = l3;
    }
  }
  
  private ArrayList readExtraDataRecords(int paramInt)
    throws ZipException
  {
    ArrayList localArrayList;
    if (paramInt <= 0)
    {
      localArrayList = null;
      return localArrayList;
    }
    for (;;)
    {
      int i;
      try
      {
        arrayOfByte1 = new byte[paramInt];
        this.zip4jRaf.read(arrayOfByte1);
        localArrayList = new ArrayList();
        i = 0;
      }
      catch (IOException localIOException)
      {
        byte[] arrayOfByte1;
        ExtraDataRecord localExtraDataRecord;
        int j;
        int k;
        int m;
        byte[] arrayOfByte2;
        throw new ZipException(localIOException);
      }
      if (localArrayList.size() > 0) {
        break;
      }
      return null;
      localExtraDataRecord = new ExtraDataRecord();
      localExtraDataRecord.setHeader(Raw.readShortLittleEndian(arrayOfByte1, i));
      j = i + 2;
      k = Raw.readShortLittleEndian(arrayOfByte1, j);
      if (k + 2 > paramInt)
      {
        k = Raw.readShortBigEndian(arrayOfByte1, j);
        if (k + 2 > paramInt) {}
      }
      else
      {
        localExtraDataRecord.setSizeOfData(k);
        m = j + 2;
        if (k > 0)
        {
          arrayOfByte2 = new byte[k];
          System.arraycopy(arrayOfByte1, m, arrayOfByte2, 0, k);
          localExtraDataRecord.setData(arrayOfByte2);
        }
        i = m + k;
        localArrayList.add(localExtraDataRecord);
        if (i < paramInt) {}
      }
    }
  }
  
  private byte[] readIntoBuff(RandomAccessFile paramRandomAccessFile, byte[] paramArrayOfByte)
    throws ZipException
  {
    try
    {
      if (paramRandomAccessFile.read(paramArrayOfByte, 0, paramArrayOfByte.length) != -1) {
        return paramArrayOfByte;
      }
      throw new ZipException("unexpected end of file when reading short buff");
    }
    catch (IOException localIOException)
    {
      throw new ZipException("IOException when reading short buff", localIOException);
    }
  }
  
  private Zip64EndCentralDirLocator readZip64EndCentralDirLocator()
    throws ZipException
  {
    if (this.zip4jRaf == null) {
      throw new ZipException("invalid file handler when trying to read Zip64EndCentralDirLocator");
    }
    try
    {
      Zip64EndCentralDirLocator localZip64EndCentralDirLocator = new Zip64EndCentralDirLocator();
      setFilePointerToReadZip64EndCentralDirLoc();
      byte[] arrayOfByte1 = new byte[4];
      byte[] arrayOfByte2 = new byte[8];
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      int i = Raw.readIntLittleEndian(arrayOfByte1, 0);
      if (i == 117853008L)
      {
        this.zipModel.setZip64Format(true);
        localZip64EndCentralDirLocator.setSignature(i);
        readIntoBuff(this.zip4jRaf, arrayOfByte1);
        localZip64EndCentralDirLocator.setNoOfDiskStartOfZip64EndOfCentralDirRec(Raw.readIntLittleEndian(arrayOfByte1, 0));
        readIntoBuff(this.zip4jRaf, arrayOfByte2);
        localZip64EndCentralDirLocator.setOffsetZip64EndOfCentralDirRec(Raw.readLongLittleEndian(arrayOfByte2, 0));
        readIntoBuff(this.zip4jRaf, arrayOfByte1);
        localZip64EndCentralDirLocator.setTotNumberOfDiscs(Raw.readIntLittleEndian(arrayOfByte1, 0));
        return localZip64EndCentralDirLocator;
      }
      this.zipModel.setZip64Format(false);
      return null;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private Zip64EndCentralDirRecord readZip64EndCentralDirRec()
    throws ZipException
  {
    if (this.zipModel.getZip64EndCentralDirLocator() == null) {
      throw new ZipException("invalid zip64 end of central directory locator");
    }
    long l1 = this.zipModel.getZip64EndCentralDirLocator().getOffsetZip64EndOfCentralDirRec();
    if (l1 < 0L) {
      throw new ZipException("invalid offset for start of end of central directory record");
    }
    Zip64EndCentralDirRecord localZip64EndCentralDirRecord;
    byte[] arrayOfByte1;
    byte[] arrayOfByte2;
    byte[] arrayOfByte3;
    int i;
    try
    {
      this.zip4jRaf.seek(l1);
      localZip64EndCentralDirRecord = new Zip64EndCentralDirRecord();
      arrayOfByte1 = new byte[2];
      arrayOfByte2 = new byte[4];
      arrayOfByte3 = new byte[8];
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      i = Raw.readIntLittleEndian(arrayOfByte2, 0);
      if (i != 101075792L) {
        throw new ZipException("invalid signature for zip64 end of central directory record");
      }
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
    long l2 = i;
    localZip64EndCentralDirRecord.setSignature(l2);
    readIntoBuff(this.zip4jRaf, arrayOfByte3);
    localZip64EndCentralDirRecord.setSizeOfZip64EndCentralDirRec(Raw.readLongLittleEndian(arrayOfByte3, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte1);
    localZip64EndCentralDirRecord.setVersionMadeBy(Raw.readShortLittleEndian(arrayOfByte1, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte1);
    localZip64EndCentralDirRecord.setVersionNeededToExtract(Raw.readShortLittleEndian(arrayOfByte1, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte2);
    localZip64EndCentralDirRecord.setNoOfThisDisk(Raw.readIntLittleEndian(arrayOfByte2, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte2);
    localZip64EndCentralDirRecord.setNoOfThisDiskStartOfCentralDir(Raw.readIntLittleEndian(arrayOfByte2, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte3);
    localZip64EndCentralDirRecord.setTotNoOfEntriesInCentralDirOnThisDisk(Raw.readLongLittleEndian(arrayOfByte3, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte3);
    localZip64EndCentralDirRecord.setTotNoOfEntriesInCentralDir(Raw.readLongLittleEndian(arrayOfByte3, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte3);
    localZip64EndCentralDirRecord.setSizeOfCentralDir(Raw.readLongLittleEndian(arrayOfByte3, 0));
    readIntoBuff(this.zip4jRaf, arrayOfByte3);
    localZip64EndCentralDirRecord.setOffsetStartCenDirWRTStartDiskNo(Raw.readLongLittleEndian(arrayOfByte3, 0));
    long l3 = localZip64EndCentralDirRecord.getSizeOfZip64EndCentralDirRec() - 44L;
    if (l3 > 0L)
    {
      byte[] arrayOfByte4 = new byte[(int)l3];
      readIntoBuff(this.zip4jRaf, arrayOfByte4);
      localZip64EndCentralDirRecord.setExtensibleDataSector(arrayOfByte4);
    }
    return localZip64EndCentralDirRecord;
  }
  
  private Zip64ExtendedInfo readZip64ExtendedInfo(ArrayList paramArrayList, long paramLong1, long paramLong2, long paramLong3, int paramInt)
    throws ZipException
  {
    int i = 0;
    if (i >= paramArrayList.size()) {}
    Zip64ExtendedInfo localZip64ExtendedInfo;
    int k;
    do
    {
      ExtraDataRecord localExtraDataRecord;
      byte[] arrayOfByte1;
      do
      {
        return null;
        localExtraDataRecord = (ExtraDataRecord)paramArrayList.get(i);
        if (localExtraDataRecord == null) {}
        while (localExtraDataRecord.getHeader() != 1L)
        {
          i++;
          break;
        }
        localZip64ExtendedInfo = new Zip64ExtendedInfo();
        arrayOfByte1 = localExtraDataRecord.getData();
      } while (localExtraDataRecord.getSizeOfData() <= 0);
      byte[] arrayOfByte2 = new byte[8];
      byte[] arrayOfByte3 = new byte[4];
      boolean bool = (0xFFFF & paramLong1) < 65535L;
      int j = 0;
      k = 0;
      if (!bool)
      {
        int m = localExtraDataRecord.getSizeOfData();
        j = 0;
        k = 0;
        if (m < 0)
        {
          System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, 8);
          localZip64ExtendedInfo.setUnCompressedSize(Raw.readLongLittleEndian(arrayOfByte2, 0));
          j = 0 + 8;
          k = 1;
        }
      }
      if (((0xFFFF & paramLong2) == 65535L) && (j < localExtraDataRecord.getSizeOfData()))
      {
        System.arraycopy(arrayOfByte1, j, arrayOfByte2, 0, 8);
        localZip64ExtendedInfo.setCompressedSize(Raw.readLongLittleEndian(arrayOfByte2, 0));
        j += 8;
        k = 1;
      }
      if (((0xFFFF & paramLong3) == 65535L) && (j < localExtraDataRecord.getSizeOfData()))
      {
        System.arraycopy(arrayOfByte1, j, arrayOfByte2, 0, 8);
        localZip64ExtendedInfo.setOffsetLocalHeader(Raw.readLongLittleEndian(arrayOfByte2, 0));
        j += 8;
        k = 1;
      }
      if (((0xFFFF & paramInt) == 65535) && (j < localExtraDataRecord.getSizeOfData()))
      {
        System.arraycopy(arrayOfByte1, j, arrayOfByte3, 0, 4);
        localZip64ExtendedInfo.setDiskNumberStart(Raw.readIntLittleEndian(arrayOfByte3, 0));
        (j + 8);
        k = 1;
      }
    } while (k == 0);
    return localZip64ExtendedInfo;
  }
  
  private void setFilePointerToReadZip64EndCentralDirLoc()
    throws ZipException
  {
    for (;;)
    {
      long l2;
      try
      {
        byte[] arrayOfByte = new byte[4];
        l1 = this.zip4jRaf.length() - 22L;
        RandomAccessFile localRandomAccessFile = this.zip4jRaf;
        l2 = l1 - 1L;
        localRandomAccessFile.seek(l1);
        if (Raw.readLeInt(this.zip4jRaf, arrayOfByte) == 101010256L)
        {
          this.zip4jRaf.seek(this.zip4jRaf.getFilePointer() - 4L - 4L - 8L - 4L - 4L);
          return;
        }
      }
      catch (IOException localIOException)
      {
        throw new ZipException(localIOException);
      }
      long l1 = l2;
    }
  }
  
  public ZipModel readAllHeaders()
    throws ZipException
  {
    return readAllHeaders(null);
  }
  
  public ZipModel readAllHeaders(String paramString)
    throws ZipException
  {
    this.zipModel = new ZipModel();
    this.zipModel.setFileNameCharset(paramString);
    this.zipModel.setEndCentralDirRecord(readEndOfCentralDirectoryRecord());
    this.zipModel.setZip64EndCentralDirLocator(readZip64EndCentralDirLocator());
    if (this.zipModel.isZip64Format())
    {
      this.zipModel.setZip64EndCentralDirRecord(readZip64EndCentralDirRec());
      if ((this.zipModel.getZip64EndCentralDirRecord() == null) || (this.zipModel.getZip64EndCentralDirRecord().getNoOfThisDisk() <= 0)) {
        break label109;
      }
      this.zipModel.setSplitArchive(true);
    }
    for (;;)
    {
      this.zipModel.setCentralDirectory(readCentralDirectory());
      return this.zipModel;
      label109:
      this.zipModel.setSplitArchive(false);
    }
  }
  
  public LocalFileHeader readLocalFileHeader(FileHeader paramFileHeader)
    throws ZipException
  {
    if ((paramFileHeader == null) || (this.zip4jRaf == null)) {
      throw new ZipException("invalid read parameters for local header");
    }
    long l = paramFileHeader.getOffsetLocalHeader();
    if ((paramFileHeader.getZip64ExtendedInfo() != null) && (paramFileHeader.getZip64ExtendedInfo().getOffsetLocalHeader() > 0L)) {
      l = paramFileHeader.getOffsetLocalHeader();
    }
    if (l < 0L) {
      throw new ZipException("invalid local header offset");
    }
    LocalFileHeader localLocalFileHeader;
    byte[] arrayOfByte1;
    byte[] arrayOfByte2;
    int i;
    try
    {
      this.zip4jRaf.seek(l);
      localLocalFileHeader = new LocalFileHeader();
      arrayOfByte1 = new byte[2];
      arrayOfByte2 = new byte[4];
      new byte[8];
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      i = Raw.readIntLittleEndian(arrayOfByte2, 0);
      if (i != 67324752L) {
        throw new ZipException("invalid local header signature for file: " + paramFileHeader.getFileName());
      }
    }
    catch (IOException localIOException)
    {
      ZipException localZipException = new ZipException(localIOException);
      throw localZipException;
    }
    localLocalFileHeader.setSignature(i);
    int j = 0 + 4;
    readIntoBuff(this.zip4jRaf, arrayOfByte1);
    localLocalFileHeader.setVersionNeededToExtract(Raw.readShortLittleEndian(arrayOfByte1, 0));
    int k = j + 2;
    readIntoBuff(this.zip4jRaf, arrayOfByte1);
    boolean bool1;
    int m;
    int n;
    if ((0x800 & Raw.readShortLittleEndian(arrayOfByte1, 0)) != 0)
    {
      bool1 = true;
      localLocalFileHeader.setFileNameUTF8Encoded(bool1);
      m = arrayOfByte1[0];
      if ((m & 0x1) != 0) {
        localLocalFileHeader.setEncrypted(true);
      }
      localLocalFileHeader.setGeneralPurposeFlag(arrayOfByte1);
      n = k + 2;
      String str1 = Integer.toBinaryString(m);
      if (str1.length() >= 4) {
        if (str1.charAt(3) != '1') {
          break label839;
        }
      }
    }
    label824:
    label839:
    for (boolean bool2 = true;; bool2 = false)
    {
      localLocalFileHeader.setDataDescriptorExists(bool2);
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      localLocalFileHeader.setCompressionMethod(Raw.readShortLittleEndian(arrayOfByte1, 0));
      int i1 = n + 2;
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localLocalFileHeader.setLastModFileTime(Raw.readIntLittleEndian(arrayOfByte2, 0));
      int i2 = i1 + 4;
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localLocalFileHeader.setCrc32(Raw.readIntLittleEndian(arrayOfByte2, 0));
      localLocalFileHeader.setCrcBuff((byte[])arrayOfByte2.clone());
      int i3 = i2 + 4;
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localLocalFileHeader.setCompressedSize(Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte2), 0));
      int i4 = i3 + 4;
      readIntoBuff(this.zip4jRaf, arrayOfByte2);
      localLocalFileHeader.setUncompressedSize(Raw.readLongLittleEndian(getLongByteFromIntByte(arrayOfByte2), 0));
      int i5 = i4 + 4;
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      int i6 = Raw.readShortLittleEndian(arrayOfByte1, 0);
      localLocalFileHeader.setFileNameLength(i6);
      int i7 = i5 + 2;
      readIntoBuff(this.zip4jRaf, arrayOfByte1);
      int i8 = Raw.readShortLittleEndian(arrayOfByte1, 0);
      localLocalFileHeader.setExtraFieldLength(i8);
      int i9 = i7 + 2;
      if (i6 > 0)
      {
        byte[] arrayOfByte3 = new byte[i6];
        readIntoBuff(this.zip4jRaf, arrayOfByte3);
        String str2 = Zip4jUtil.decodeFileName(arrayOfByte3, localLocalFileHeader.isFileNameUTF8Encoded());
        if (str2 == null) {
          throw new ZipException("file name is null, cannot assign file name to local file header");
        }
        if (str2.indexOf(":" + System.getProperty("file.separator")) >= 0) {
          str2 = str2.substring(2 + str2.indexOf(":" + System.getProperty("file.separator")));
        }
        localLocalFileHeader.setFileName(str2);
        i9 = i6 + 30;
        readAndSaveExtraDataRecord(localLocalFileHeader);
        localLocalFileHeader.setOffsetStartOfData(l + (i9 + i8));
        localLocalFileHeader.setPassword(paramFileHeader.getPassword());
        readAndSaveZip64ExtendedInfo(localLocalFileHeader);
        readAndSaveAESExtraDataRecord(localLocalFileHeader);
        if ((localLocalFileHeader.isEncrypted()) && (localLocalFileHeader.getEncryptionMethod() != 99))
        {
          if ((m & 0x40) != 64) {
            break label824;
          }
          localLocalFileHeader.setEncryptionMethod(1);
        }
      }
      for (;;)
      {
        if (localLocalFileHeader.getCrc32() <= 0L)
        {
          localLocalFileHeader.setCrc32(paramFileHeader.getCrc32());
          localLocalFileHeader.setCrcBuff(paramFileHeader.getCrcBuff());
        }
        if (localLocalFileHeader.getCompressedSize() <= 0L) {
          localLocalFileHeader.setCompressedSize(paramFileHeader.getCompressedSize());
        }
        if (localLocalFileHeader.getUncompressedSize() > 0L) {
          break label845;
        }
        localLocalFileHeader.setUncompressedSize(paramFileHeader.getUncompressedSize());
        return localLocalFileHeader;
        localLocalFileHeader.setFileName(null);
        break;
        localLocalFileHeader.setEncryptionMethod(0);
      }
      bool1 = false;
      break;
    }
    label845:
    return localLocalFileHeader;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/core/HeaderReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */