package net.lingala.zip4j.core;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.io.SplitOutputStream;
import net.lingala.zip4j.model.AESExtraDataRecord;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.LocalFileHeader;
import net.lingala.zip4j.model.Zip64EndCentralDirLocator;
import net.lingala.zip4j.model.Zip64EndCentralDirRecord;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.util.Raw;
import net.lingala.zip4j.util.Zip4jUtil;

public class HeaderWriter
{
  private final int ZIP64_EXTRA_BUF = 50;
  
  private byte[] byteArrayListToByteArray(List paramList)
    throws ZipException
  {
    if (paramList == null) {
      throw new ZipException("input byte array list is null, cannot conver to byte array");
    }
    byte[] arrayOfByte;
    if (paramList.size() <= 0) {
      arrayOfByte = null;
    }
    for (;;)
    {
      return arrayOfByte;
      arrayOfByte = new byte[paramList.size()];
      for (int i = 0; i < paramList.size(); i++) {
        arrayOfByte[i] = Byte.parseByte((String)paramList.get(i));
      }
    }
  }
  
  private void copyByteArrayToArrayList(byte[] paramArrayOfByte, List paramList)
    throws ZipException
  {
    if ((paramList == null) || (paramArrayOfByte == null)) {
      throw new ZipException("one of the input parameters is null, cannot copy byte array to array list");
    }
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfByte.length) {
        return;
      }
      paramList.add(Byte.toString(paramArrayOfByte[i]));
    }
  }
  
  private int countNumberOfFileHeaderEntriesOnDisk(ArrayList paramArrayList, int paramInt)
    throws ZipException
  {
    if (paramArrayList == null) {
      throw new ZipException("file headers are null, cannot calculate number of entries on this disk");
    }
    int i = 0;
    for (int j = 0;; j++)
    {
      if (j >= paramArrayList.size()) {
        return i;
      }
      if (((FileHeader)paramArrayList.get(j)).getDiskNumberStart() == paramInt) {
        i++;
      }
    }
  }
  
  private void processHeaderData(ZipModel paramZipModel, OutputStream paramOutputStream)
    throws ZipException
  {
    try
    {
      boolean bool = paramOutputStream instanceof SplitOutputStream;
      int i = 0;
      if (bool)
      {
        paramZipModel.getEndCentralDirRecord().setOffsetOfStartOfCentralDir(((SplitOutputStream)paramOutputStream).getFilePointer());
        i = ((SplitOutputStream)paramOutputStream).getCurrSplitFileCounter();
      }
      if (paramZipModel.isZip64Format())
      {
        if (paramZipModel.getZip64EndCentralDirRecord() == null) {
          paramZipModel.setZip64EndCentralDirRecord(new Zip64EndCentralDirRecord());
        }
        if (paramZipModel.getZip64EndCentralDirLocator() == null) {
          paramZipModel.setZip64EndCentralDirLocator(new Zip64EndCentralDirLocator());
        }
        paramZipModel.getZip64EndCentralDirLocator().setNoOfDiskStartOfZip64EndOfCentralDirRec(i);
        paramZipModel.getZip64EndCentralDirLocator().setTotNumberOfDiscs(i + 1);
      }
      paramZipModel.getEndCentralDirRecord().setNoOfThisDisk(i);
      paramZipModel.getEndCentralDirRecord().setNoOfThisDiskStartOfCentralDir(i);
      return;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
  }
  
  private void updateCompressedSizeInLocalFileHeader(SplitOutputStream paramSplitOutputStream, LocalFileHeader paramLocalFileHeader, long paramLong1, long paramLong2, byte[] paramArrayOfByte, boolean paramBoolean)
    throws ZipException
  {
    if (paramSplitOutputStream == null) {
      throw new ZipException("invalid output stream, cannot update compressed size for local file header");
    }
    try
    {
      if (!paramLocalFileHeader.isWriteComprSizeInZip64ExtraRecord()) {
        break label125;
      }
      if (paramArrayOfByte.length != 8) {
        throw new ZipException("attempting to write a non 8-byte compressed size block for a zip64 file");
      }
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
    long l1 = 2L + (2L + (4L + (4L + (paramLong1 + paramLong2))));
    long l2 = 8L + (2L + (2L + (l1 + paramLocalFileHeader.getFileNameLength())));
    if (paramLong2 == 22L) {
      l2 += 8L;
    }
    paramSplitOutputStream.seek(l2);
    paramSplitOutputStream.write(paramArrayOfByte);
    return;
    label125:
    paramSplitOutputStream.seek(paramLong1 + paramLong2);
    paramSplitOutputStream.write(paramArrayOfByte);
  }
  
  private int writeCentralDirectory(ZipModel paramZipModel, OutputStream paramOutputStream, List paramList)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramOutputStream == null)) {
      throw new ZipException("input parameters is null, cannot write central directory");
    }
    int i;
    if ((paramZipModel.getCentralDirectory() == null) || (paramZipModel.getCentralDirectory().getFileHeaders() == null) || (paramZipModel.getCentralDirectory().getFileHeaders().size() <= 0)) {
      i = 0;
    }
    for (;;)
    {
      return i;
      i = 0;
      for (int j = 0; j < paramZipModel.getCentralDirectory().getFileHeaders().size(); j++) {
        i += writeFileHeader(paramZipModel, (FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(j), paramOutputStream, paramList);
      }
    }
  }
  
  private void writeEndOfCentralDirectoryRecord(ZipModel paramZipModel, OutputStream paramOutputStream, int paramInt, long paramLong, List paramList)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramOutputStream == null)) {
      throw new ZipException("zip model or output stream is null, cannot write end of central directory record");
    }
    byte[] arrayOfByte1;
    byte[] arrayOfByte2;
    byte[] arrayOfByte3;
    try
    {
      arrayOfByte1 = new byte[2];
      arrayOfByte2 = new byte[4];
      arrayOfByte3 = new byte[8];
      Raw.writeIntLittleEndian(arrayOfByte2, 0, (int)paramZipModel.getEndCentralDirRecord().getSignature());
      copyByteArrayToArrayList(arrayOfByte2, paramList);
      Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramZipModel.getEndCentralDirRecord().getNoOfThisDisk());
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramZipModel.getEndCentralDirRecord().getNoOfThisDiskStartOfCentralDir());
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      if ((paramZipModel.getCentralDirectory() == null) || (paramZipModel.getCentralDirectory().getFileHeaders() == null)) {
        throw new ZipException("invalid central directory/file headers, cannot write end of central directory record");
      }
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
    int i = paramZipModel.getCentralDirectory().getFileHeaders().size();
    if (paramZipModel.isSplitArchive()) {}
    for (int j = countNumberOfFileHeaderEntriesOnDisk(paramZipModel.getCentralDirectory().getFileHeaders(), paramZipModel.getEndCentralDirRecord().getNoOfThisDisk());; j = i)
    {
      Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)j);
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)i);
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      Raw.writeIntLittleEndian(arrayOfByte2, 0, paramInt);
      copyByteArrayToArrayList(arrayOfByte2, paramList);
      if (paramLong > 4294967295L)
      {
        Raw.writeLongLittleEndian(arrayOfByte3, 0, 4294967295L);
        System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
        copyByteArrayToArrayList(arrayOfByte2, paramList);
      }
      for (;;)
      {
        String str = paramZipModel.getEndCentralDirRecord().getComment();
        int k = 0;
        if (str != null) {
          k = paramZipModel.getEndCentralDirRecord().getCommentLength();
        }
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)k);
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        if (k <= 0) {
          break;
        }
        copyByteArrayToArrayList(paramZipModel.getEndCentralDirRecord().getCommentBytes(), paramList);
        return;
        Raw.writeLongLittleEndian(arrayOfByte3, 0, paramLong);
        System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
        copyByteArrayToArrayList(arrayOfByte2, paramList);
      }
      return;
    }
  }
  
  private int writeFileHeader(ZipModel paramZipModel, FileHeader paramFileHeader, OutputStream paramOutputStream, List paramList)
    throws ZipException
  {
    if ((paramFileHeader == null) || (paramOutputStream == null)) {
      throw new ZipException("input parameters is null, cannot write local file header");
    }
    int i15;
    for (;;)
    {
      byte[] arrayOfByte5;
      int i5;
      int i7;
      int i8;
      int i17;
      try
      {
        byte[] arrayOfByte1 = new byte[2];
        byte[] arrayOfByte2 = new byte[4];
        byte[] arrayOfByte3 = new byte[8];
        byte[] arrayOfByte4 = new byte[2];
        arrayOfByte5 = new byte[4];
        Raw.writeIntLittleEndian(arrayOfByte2, 0, paramFileHeader.getSignature());
        copyByteArrayToArrayList(arrayOfByte2, paramList);
        int i = 0 + 4;
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramFileHeader.getVersionMadeBy());
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        int j = i + 2;
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramFileHeader.getVersionNeededToExtract());
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        int k = j + 2;
        copyByteArrayToArrayList(paramFileHeader.getGeneralPurposeFlag(), paramList);
        int m = k + 2;
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramFileHeader.getCompressionMethod());
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        int n = m + 2;
        Raw.writeIntLittleEndian(arrayOfByte2, 0, paramFileHeader.getLastModFileTime());
        copyByteArrayToArrayList(arrayOfByte2, paramList);
        int i1 = n + 4;
        Raw.writeIntLittleEndian(arrayOfByte2, 0, (int)paramFileHeader.getCrc32());
        copyByteArrayToArrayList(arrayOfByte2, paramList);
        int i2 = i1 + 4;
        int i4;
        byte[] arrayOfByte6;
        if ((paramFileHeader.getCompressedSize() >= 4294967295L) || (50L + paramFileHeader.getUncompressedSize() >= 4294967295L))
        {
          Raw.writeLongLittleEndian(arrayOfByte3, 0, 4294967295L);
          System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
          copyByteArrayToArrayList(arrayOfByte2, paramList);
          int i3 = i2 + 4;
          copyByteArrayToArrayList(arrayOfByte2, paramList);
          i4 = i3 + 4;
          i5 = 1;
          Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramFileHeader.getFileNameLength());
          copyByteArrayToArrayList(arrayOfByte1, paramList);
          int i6 = i4 + 2;
          arrayOfByte6 = new byte[4];
          if (paramFileHeader.getOffsetLocalHeader() > 4294967295L)
          {
            Raw.writeLongLittleEndian(arrayOfByte3, 0, 4294967295L);
            System.arraycopy(arrayOfByte3, 0, arrayOfByte6, 0, 4);
            i7 = 1;
            break label956;
            if (paramFileHeader.getAesExtraDataRecord() != null) {
              i8 += 11;
            }
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)i8);
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            int i9 = i6 + 2;
            copyByteArrayToArrayList(arrayOfByte4, paramList);
            int i10 = i9 + 2;
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramFileHeader.getDiskNumberStart());
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            int i11 = i10 + 2;
            copyByteArrayToArrayList(arrayOfByte4, paramList);
            int i12 = i11 + 2;
            if (paramFileHeader.getExternalFileAttr() == null) {
              break label913;
            }
            copyByteArrayToArrayList(paramFileHeader.getExternalFileAttr(), paramList);
            int i13 = i12 + 4;
            copyByteArrayToArrayList(arrayOfByte6, paramList);
            (i13 + 4);
            if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramZipModel.getFileNameCharset())) {
              break label924;
            }
            byte[] arrayOfByte8 = paramFileHeader.getFileName().getBytes(paramZipModel.getFileNameCharset());
            copyByteArrayToArrayList(arrayOfByte8, paramList);
            i15 = 46 + arrayOfByte8.length;
            break label993;
            paramZipModel.setZip64Format(true);
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)1);
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            int i16 = i15 + 2;
            i17 = 0;
            if (i5 == 0) {
              break label1006;
            }
            i17 = 0 + 16;
            break label1006;
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)i17);
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            i15 = i16 + 2;
            if (i5 != 0)
            {
              Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getUncompressedSize());
              copyByteArrayToArrayList(arrayOfByte3, paramList);
              int i18 = i15 + 8;
              Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getCompressedSize());
              copyByteArrayToArrayList(arrayOfByte3, paramList);
              i15 = i18 + 8;
            }
            if (i7 != 0)
            {
              Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getOffsetLocalHeader());
              copyByteArrayToArrayList(arrayOfByte3, paramList);
              i15 += 8;
            }
            if (paramFileHeader.getAesExtraDataRecord() == null) {
              break;
            }
            AESExtraDataRecord localAESExtraDataRecord = paramFileHeader.getAesExtraDataRecord();
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)(int)localAESExtraDataRecord.getSignature());
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getDataSize());
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getVersionNumber());
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            copyByteArrayToArrayList(localAESExtraDataRecord.getVendorID().getBytes(), paramList);
            byte[] arrayOfByte7 = new byte[1];
            arrayOfByte7[0] = ((byte)localAESExtraDataRecord.getAesStrength());
            copyByteArrayToArrayList(arrayOfByte7, paramList);
            Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getCompressionMethod());
            copyByteArrayToArrayList(arrayOfByte1, paramList);
            return i15 + 11;
          }
        }
        else
        {
          Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getCompressedSize());
          System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
          copyByteArrayToArrayList(arrayOfByte2, paramList);
          int i19 = i2 + 4;
          Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getUncompressedSize());
          System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
          copyByteArrayToArrayList(arrayOfByte2, paramList);
          i4 = i19 + 4;
          i5 = 0;
          continue;
        }
        Raw.writeLongLittleEndian(arrayOfByte3, 0, paramFileHeader.getOffsetLocalHeader());
        System.arraycopy(arrayOfByte3, 0, arrayOfByte6, 0, 4);
        i7 = 0;
      }
      catch (Exception localException)
      {
        ZipException localZipException = new ZipException(localException);
        throw localZipException;
      }
      label913:
      copyByteArrayToArrayList(arrayOfByte5, paramList);
      continue;
      label924:
      copyByteArrayToArrayList(Zip4jUtil.convertCharset(paramFileHeader.getFileName()), paramList);
      int i14 = Zip4jUtil.getEncodedStringLength(paramFileHeader.getFileName());
      i15 = i14 + 46;
      label956:
      if (i5 == 0)
      {
        i8 = 0;
        if (i7 == 0) {}
      }
      else
      {
        i8 = 0 + 4;
        if (i5 != 0) {
          i8 += 16;
        }
        if (i7 != 0)
        {
          i8 += 8;
          continue;
          label993:
          if (i5 == 0) {
            if (i7 != 0)
            {
              continue;
              label1006:
              if (i7 != 0) {
                i17 += 8;
              }
            }
          }
        }
      }
    }
    return i15;
  }
  
  private void writeZip64EndOfCentralDirectoryLocator(ZipModel paramZipModel, OutputStream paramOutputStream, List paramList)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramOutputStream == null)) {
      throw new ZipException("zip model or output stream is null, cannot write zip64 end of central directory locator");
    }
    try
    {
      byte[] arrayOfByte1 = new byte[4];
      byte[] arrayOfByte2 = new byte[8];
      Raw.writeIntLittleEndian(arrayOfByte1, 0, 117853008);
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      Raw.writeIntLittleEndian(arrayOfByte1, 0, paramZipModel.getZip64EndCentralDirLocator().getNoOfDiskStartOfZip64EndOfCentralDirRec());
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      Raw.writeLongLittleEndian(arrayOfByte2, 0, paramZipModel.getZip64EndCentralDirLocator().getOffsetZip64EndOfCentralDirRec());
      copyByteArrayToArrayList(arrayOfByte2, paramList);
      Raw.writeIntLittleEndian(arrayOfByte1, 0, paramZipModel.getZip64EndCentralDirLocator().getTotNumberOfDiscs());
      copyByteArrayToArrayList(arrayOfByte1, paramList);
      return;
    }
    catch (ZipException localZipException)
    {
      throw localZipException;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private void writeZip64EndOfCentralDirectoryRecord(ZipModel paramZipModel, OutputStream paramOutputStream, int paramInt, long paramLong, List paramList)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramOutputStream == null)) {
      throw new ZipException("zip model or output stream is null, cannot write zip64 end of central directory record");
    }
    byte[] arrayOfByte4;
    int i;
    try
    {
      byte[] arrayOfByte1 = new byte[2];
      arrayOfByte2 = new byte[2];
      byte[] arrayOfByte3 = new byte[4];
      arrayOfByte4 = new byte[8];
      Raw.writeIntLittleEndian(arrayOfByte3, 0, 101075792);
      copyByteArrayToArrayList(arrayOfByte3, paramList);
      Raw.writeLongLittleEndian(arrayOfByte4, 0, 44L);
      copyByteArrayToArrayList(arrayOfByte4, paramList);
      if ((paramZipModel.getCentralDirectory() != null) && (paramZipModel.getCentralDirectory().getFileHeaders() != null) && (paramZipModel.getCentralDirectory().getFileHeaders().size() > 0))
      {
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(0)).getVersionMadeBy());
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)((FileHeader)paramZipModel.getCentralDirectory().getFileHeaders().get(0)).getVersionNeededToExtract());
        copyByteArrayToArrayList(arrayOfByte1, paramList);
        Raw.writeIntLittleEndian(arrayOfByte3, 0, paramZipModel.getEndCentralDirRecord().getNoOfThisDisk());
        copyByteArrayToArrayList(arrayOfByte3, paramList);
        Raw.writeIntLittleEndian(arrayOfByte3, 0, paramZipModel.getEndCentralDirRecord().getNoOfThisDiskStartOfCentralDir());
        copyByteArrayToArrayList(arrayOfByte3, paramList);
        i = 0;
        if ((paramZipModel.getCentralDirectory() != null) && (paramZipModel.getCentralDirectory().getFileHeaders() != null)) {
          break label276;
        }
        throw new ZipException("invalid central directory/file headers, cannot write end of central directory record");
      }
    }
    catch (ZipException localZipException)
    {
      for (;;)
      {
        byte[] arrayOfByte2;
        throw localZipException;
        copyByteArrayToArrayList(arrayOfByte2, paramList);
        copyByteArrayToArrayList(arrayOfByte2, paramList);
      }
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
    label276:
    int j = paramZipModel.getCentralDirectory().getFileHeaders().size();
    if (paramZipModel.isSplitArchive()) {
      countNumberOfFileHeaderEntriesOnDisk(paramZipModel.getCentralDirectory().getFileHeaders(), paramZipModel.getEndCentralDirRecord().getNoOfThisDisk());
    }
    for (;;)
    {
      Raw.writeLongLittleEndian(arrayOfByte4, 0, i);
      copyByteArrayToArrayList(arrayOfByte4, paramList);
      Raw.writeLongLittleEndian(arrayOfByte4, 0, j);
      copyByteArrayToArrayList(arrayOfByte4, paramList);
      Raw.writeLongLittleEndian(arrayOfByte4, 0, paramInt);
      copyByteArrayToArrayList(arrayOfByte4, paramList);
      Raw.writeLongLittleEndian(arrayOfByte4, 0, paramLong);
      copyByteArrayToArrayList(arrayOfByte4, paramList);
      return;
      i = j;
    }
  }
  
  private void writeZipHeaderBytes(ZipModel paramZipModel, OutputStream paramOutputStream, byte[] paramArrayOfByte)
    throws ZipException
  {
    if (paramArrayOfByte == null) {
      throw new ZipException("invalid buff to write as zip headers");
    }
    try
    {
      if (((paramOutputStream instanceof SplitOutputStream)) && (((SplitOutputStream)paramOutputStream).checkBuffSizeAndStartNextSplitFile(paramArrayOfByte.length)))
      {
        finalizeZipFile(paramZipModel, paramOutputStream);
        return;
      }
      paramOutputStream.write(paramArrayOfByte);
      return;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
  }
  
  /* Error */
  public void finalizeZipFile(ZipModel paramZipModel, OutputStream paramOutputStream)
    throws ZipException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +7 -> 8
    //   4: aload_2
    //   5: ifnonnull +14 -> 19
    //   8: new 16	net/lingala/zip4j/exception/ZipException
    //   11: dup
    //   12: ldc_w 357
    //   15: invokespecial 21	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   18: athrow
    //   19: aload_0
    //   20: aload_1
    //   21: aload_2
    //   22: invokespecial 359	net/lingala/zip4j/core/HeaderWriter:processHeaderData	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    //   25: aload_1
    //   26: invokevirtual 76	net/lingala/zip4j/model/ZipModel:getEndCentralDirRecord	()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    //   29: invokevirtual 362	net/lingala/zip4j/model/EndCentralDirRecord:getOffsetOfStartOfCentralDir	()J
    //   32: lstore 5
    //   34: new 57	java/util/ArrayList
    //   37: dup
    //   38: invokespecial 363	java/util/ArrayList:<init>	()V
    //   41: astore 7
    //   43: aload_0
    //   44: aload_1
    //   45: aload_2
    //   46: aload 7
    //   48: invokespecial 365	net/lingala/zip4j/core/HeaderWriter:writeCentralDirectory	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)I
    //   51: istore 8
    //   53: aload_1
    //   54: invokevirtual 93	net/lingala/zip4j/model/ZipModel:isZip64Format	()Z
    //   57: ifeq +109 -> 166
    //   60: aload_1
    //   61: invokevirtual 97	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirRecord	()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;
    //   64: ifnonnull +14 -> 78
    //   67: aload_1
    //   68: new 99	net/lingala/zip4j/model/Zip64EndCentralDirRecord
    //   71: dup
    //   72: invokespecial 100	net/lingala/zip4j/model/Zip64EndCentralDirRecord:<init>	()V
    //   75: invokevirtual 104	net/lingala/zip4j/model/ZipModel:setZip64EndCentralDirRecord	(Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;)V
    //   78: aload_1
    //   79: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   82: ifnonnull +14 -> 96
    //   85: aload_1
    //   86: new 110	net/lingala/zip4j/model/Zip64EndCentralDirLocator
    //   89: dup
    //   90: invokespecial 111	net/lingala/zip4j/model/Zip64EndCentralDirLocator:<init>	()V
    //   93: invokevirtual 115	net/lingala/zip4j/model/ZipModel:setZip64EndCentralDirLocator	(Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;)V
    //   96: aload_1
    //   97: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   100: lload 5
    //   102: iload 8
    //   104: i2l
    //   105: ladd
    //   106: invokevirtual 368	net/lingala/zip4j/model/Zip64EndCentralDirLocator:setOffsetZip64EndOfCentralDirRec	(J)V
    //   109: aload_2
    //   110: instanceof 70
    //   113: ifeq +78 -> 191
    //   116: aload_1
    //   117: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   120: aload_2
    //   121: checkcast 70	net/lingala/zip4j/io/SplitOutputStream
    //   124: invokevirtual 89	net/lingala/zip4j/io/SplitOutputStream:getCurrSplitFileCounter	()I
    //   127: invokevirtual 119	net/lingala/zip4j/model/Zip64EndCentralDirLocator:setNoOfDiskStartOfZip64EndOfCentralDirRec	(I)V
    //   130: aload_1
    //   131: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   134: iconst_1
    //   135: aload_2
    //   136: checkcast 70	net/lingala/zip4j/io/SplitOutputStream
    //   139: invokevirtual 89	net/lingala/zip4j/io/SplitOutputStream:getCurrSplitFileCounter	()I
    //   142: iadd
    //   143: invokevirtual 122	net/lingala/zip4j/model/Zip64EndCentralDirLocator:setTotNumberOfDiscs	(I)V
    //   146: aload_0
    //   147: aload_1
    //   148: aload_2
    //   149: iload 8
    //   151: lload 5
    //   153: aload 7
    //   155: invokespecial 370	net/lingala/zip4j/core/HeaderWriter:writeZip64EndOfCentralDirectoryRecord	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V
    //   158: aload_0
    //   159: aload_1
    //   160: aload_2
    //   161: aload 7
    //   163: invokespecial 372	net/lingala/zip4j/core/HeaderWriter:writeZip64EndOfCentralDirectoryLocator	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)V
    //   166: aload_0
    //   167: aload_1
    //   168: aload_2
    //   169: iload 8
    //   171: lload 5
    //   173: aload 7
    //   175: invokespecial 374	net/lingala/zip4j/core/HeaderWriter:writeEndOfCentralDirectoryRecord	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V
    //   178: aload_0
    //   179: aload_1
    //   180: aload_2
    //   181: aload_0
    //   182: aload 7
    //   184: invokespecial 376	net/lingala/zip4j/core/HeaderWriter:byteArrayListToByteArray	(Ljava/util/List;)[B
    //   187: invokespecial 378	net/lingala/zip4j/core/HeaderWriter:writeZipHeaderBytes	(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;[B)V
    //   190: return
    //   191: aload_1
    //   192: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   195: iconst_0
    //   196: invokevirtual 119	net/lingala/zip4j/model/Zip64EndCentralDirLocator:setNoOfDiskStartOfZip64EndOfCentralDirRec	(I)V
    //   199: aload_1
    //   200: invokevirtual 108	net/lingala/zip4j/model/ZipModel:getZip64EndCentralDirLocator	()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;
    //   203: iconst_1
    //   204: invokevirtual 122	net/lingala/zip4j/model/Zip64EndCentralDirLocator:setTotNumberOfDiscs	(I)V
    //   207: goto -61 -> 146
    //   210: astore 4
    //   212: aload 4
    //   214: athrow
    //   215: astore_3
    //   216: new 16	net/lingala/zip4j/exception/ZipException
    //   219: dup
    //   220: aload_3
    //   221: invokespecial 131	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   224: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	225	0	this	HeaderWriter
    //   0	225	1	paramZipModel	ZipModel
    //   0	225	2	paramOutputStream	OutputStream
    //   215	6	3	localException	Exception
    //   210	3	4	localZipException	ZipException
    //   32	140	5	l	long
    //   41	142	7	localArrayList	ArrayList
    //   51	119	8	i	int
    // Exception table:
    //   from	to	target	type
    //   19	78	210	net/lingala/zip4j/exception/ZipException
    //   78	96	210	net/lingala/zip4j/exception/ZipException
    //   96	146	210	net/lingala/zip4j/exception/ZipException
    //   146	166	210	net/lingala/zip4j/exception/ZipException
    //   166	190	210	net/lingala/zip4j/exception/ZipException
    //   191	207	210	net/lingala/zip4j/exception/ZipException
    //   19	78	215	java/lang/Exception
    //   78	96	215	java/lang/Exception
    //   96	146	215	java/lang/Exception
    //   146	166	215	java/lang/Exception
    //   166	190	215	java/lang/Exception
    //   191	207	215	java/lang/Exception
  }
  
  public void finalizeZipFileWithoutValidations(ZipModel paramZipModel, OutputStream paramOutputStream)
    throws ZipException
  {
    if ((paramZipModel == null) || (paramOutputStream == null)) {
      throw new ZipException("input parameters is null, cannot finalize zip file without validations");
    }
    try
    {
      ArrayList localArrayList = new ArrayList();
      long l = paramZipModel.getEndCentralDirRecord().getOffsetOfStartOfCentralDir();
      int i = writeCentralDirectory(paramZipModel, paramOutputStream, localArrayList);
      if (paramZipModel.isZip64Format())
      {
        if (paramZipModel.getZip64EndCentralDirRecord() == null) {
          paramZipModel.setZip64EndCentralDirRecord(new Zip64EndCentralDirRecord());
        }
        if (paramZipModel.getZip64EndCentralDirLocator() == null) {
          paramZipModel.setZip64EndCentralDirLocator(new Zip64EndCentralDirLocator());
        }
        paramZipModel.getZip64EndCentralDirLocator().setOffsetZip64EndOfCentralDirRec(l + i);
        writeZip64EndOfCentralDirectoryRecord(paramZipModel, paramOutputStream, i, l, localArrayList);
        writeZip64EndOfCentralDirectoryLocator(paramZipModel, paramOutputStream, localArrayList);
      }
      writeEndOfCentralDirectoryRecord(paramZipModel, paramOutputStream, i, l, localArrayList);
      writeZipHeaderBytes(paramZipModel, paramOutputStream, byteArrayListToByteArray(localArrayList));
      return;
    }
    catch (ZipException localZipException)
    {
      throw localZipException;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  public void updateLocalFileHeader(LocalFileHeader paramLocalFileHeader, long paramLong, int paramInt1, ZipModel paramZipModel, byte[] paramArrayOfByte, int paramInt2, SplitOutputStream paramSplitOutputStream)
    throws ZipException
  {
    if ((paramLocalFileHeader == null) || (paramLong < 0L) || (paramZipModel == null)) {
      throw new ZipException("invalid input parameters, cannot update local file header");
    }
    for (;;)
    {
      long l1;
      try
      {
        if (paramInt2 == paramSplitOutputStream.getCurrSplitFileCounter()) {
          break label318;
        }
        File localFile = new File(paramZipModel.getZipFile());
        String str1 = localFile.getParent();
        String str2 = Zip4jUtil.getZipFileNameWithoutExt(localFile.getName());
        String str3 = str1 + System.getProperty("file.separator");
        String str4;
        if (paramInt2 < 9)
        {
          str4 = str3 + str2 + ".z0" + (paramInt2 + 1);
          SplitOutputStream localSplitOutputStream1 = new SplitOutputStream(new File(str4));
          i = 1;
          localSplitOutputStream2 = localSplitOutputStream1;
          l1 = localSplitOutputStream2.getFilePointer();
        }
        switch (paramInt1)
        {
        default: 
          if (i == 0) {
            break label310;
          }
          localSplitOutputStream2.close();
          return;
          str4 = str3 + str2 + ".z" + (paramInt2 + 1);
          break;
        case 14: 
          localSplitOutputStream2.seek(paramLong + paramInt1);
          localSplitOutputStream2.write(paramArrayOfByte);
          break;
        case 18: 
        case 22: 
          l2 = paramInt1;
        }
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
      long l2;
      updateCompressedSizeInLocalFileHeader(localSplitOutputStream2, paramLocalFileHeader, paramLong, l2, paramArrayOfByte, paramZipModel.isZip64Format());
      continue;
      label310:
      paramSplitOutputStream.seek(l1);
      return;
      label318:
      SplitOutputStream localSplitOutputStream2 = paramSplitOutputStream;
      int i = 0;
    }
  }
  
  public int writeExtendedLocalHeader(LocalFileHeader paramLocalFileHeader, OutputStream paramOutputStream)
    throws ZipException, IOException
  {
    if ((paramLocalFileHeader == null) || (paramOutputStream == null)) {
      throw new ZipException("input parameters is null, cannot write extended local header");
    }
    ArrayList localArrayList = new ArrayList();
    byte[] arrayOfByte1 = new byte[4];
    Raw.writeIntLittleEndian(arrayOfByte1, 0, 134695760);
    copyByteArrayToArrayList(arrayOfByte1, localArrayList);
    Raw.writeIntLittleEndian(arrayOfByte1, 0, (int)paramLocalFileHeader.getCrc32());
    copyByteArrayToArrayList(arrayOfByte1, localArrayList);
    long l1 = paramLocalFileHeader.getCompressedSize();
    if (l1 >= 2147483647L) {
      l1 = 2147483647L;
    }
    Raw.writeIntLittleEndian(arrayOfByte1, 0, (int)l1);
    copyByteArrayToArrayList(arrayOfByte1, localArrayList);
    long l2 = paramLocalFileHeader.getUncompressedSize();
    if (l2 >= 2147483647L) {
      l2 = 2147483647L;
    }
    Raw.writeIntLittleEndian(arrayOfByte1, 0, (int)l2);
    copyByteArrayToArrayList(arrayOfByte1, localArrayList);
    byte[] arrayOfByte2 = byteArrayListToByteArray(localArrayList);
    paramOutputStream.write(arrayOfByte2);
    return arrayOfByte2.length;
  }
  
  public int writeLocalFileHeader(ZipModel paramZipModel, LocalFileHeader paramLocalFileHeader, OutputStream paramOutputStream)
    throws ZipException
  {
    if (paramLocalFileHeader == null) {
      throw new ZipException("input parameters are null, cannot write local file header");
    }
    for (;;)
    {
      try
      {
        localArrayList = new ArrayList();
        arrayOfByte1 = new byte[2];
        arrayOfByte2 = new byte[4];
        arrayOfByte3 = new byte[8];
        arrayOfByte4 = new byte[8];
        Raw.writeIntLittleEndian(arrayOfByte2, 0, paramLocalFileHeader.getSignature());
        copyByteArrayToArrayList(arrayOfByte2, localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramLocalFileHeader.getVersionNeededToExtract());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        copyByteArrayToArrayList(paramLocalFileHeader.getGeneralPurposeFlag(), localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramLocalFileHeader.getCompressionMethod());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        Raw.writeIntLittleEndian(arrayOfByte2, 0, paramLocalFileHeader.getLastModFileTime());
        copyByteArrayToArrayList(arrayOfByte2, localArrayList);
        Raw.writeIntLittleEndian(arrayOfByte2, 0, (int)paramLocalFileHeader.getCrc32());
        copyByteArrayToArrayList(arrayOfByte2, localArrayList);
        if (50L + paramLocalFileHeader.getUncompressedSize() < 4294967295L) {
          continue;
        }
        Raw.writeLongLittleEndian(arrayOfByte3, 0, 4294967295L);
        System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
        copyByteArrayToArrayList(arrayOfByte2, localArrayList);
        copyByteArrayToArrayList(arrayOfByte2, localArrayList);
        paramZipModel.setZip64Format(true);
        i = 1;
        paramLocalFileHeader.setWriteComprSizeInZip64ExtraRecord(true);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)paramLocalFileHeader.getFileNameLength());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        int j = 0;
        if (i != 0) {
          j = 0 + 20;
        }
        if (paramLocalFileHeader.getAesExtraDataRecord() != null) {
          j += 11;
        }
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)j);
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramZipModel.getFileNameCharset())) {
          continue;
        }
        copyByteArrayToArrayList(paramLocalFileHeader.getFileName().getBytes(paramZipModel.getFileNameCharset()), localArrayList);
      }
      catch (ZipException localZipException2)
      {
        ArrayList localArrayList;
        byte[] arrayOfByte1;
        byte[] arrayOfByte2;
        byte[] arrayOfByte3;
        byte[] arrayOfByte4;
        int i;
        AESExtraDataRecord localAESExtraDataRecord;
        byte[] arrayOfByte6;
        byte[] arrayOfByte5;
        throw localZipException2;
        copyByteArrayToArrayList(Zip4jUtil.convertCharset(paramLocalFileHeader.getFileName()), localArrayList);
        continue;
      }
      catch (Exception localException)
      {
        ZipException localZipException1 = new ZipException(localException);
        throw localZipException1;
      }
      if (i != 0)
      {
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)1);
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)16);
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        Raw.writeLongLittleEndian(arrayOfByte3, 0, paramLocalFileHeader.getUncompressedSize());
        copyByteArrayToArrayList(arrayOfByte3, localArrayList);
        copyByteArrayToArrayList(arrayOfByte4, localArrayList);
      }
      if (paramLocalFileHeader.getAesExtraDataRecord() != null)
      {
        localAESExtraDataRecord = paramLocalFileHeader.getAesExtraDataRecord();
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)(int)localAESExtraDataRecord.getSignature());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getDataSize());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getVersionNumber());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
        copyByteArrayToArrayList(localAESExtraDataRecord.getVendorID().getBytes(), localArrayList);
        arrayOfByte6 = new byte[1];
        arrayOfByte6[0] = ((byte)localAESExtraDataRecord.getAesStrength());
        copyByteArrayToArrayList(arrayOfByte6, localArrayList);
        Raw.writeShortLittleEndian(arrayOfByte1, 0, (short)localAESExtraDataRecord.getCompressionMethod());
        copyByteArrayToArrayList(arrayOfByte1, localArrayList);
      }
      arrayOfByte5 = byteArrayListToByteArray(localArrayList);
      paramOutputStream.write(arrayOfByte5);
      return arrayOfByte5.length;
      Raw.writeLongLittleEndian(arrayOfByte3, 0, paramLocalFileHeader.getCompressedSize());
      System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
      copyByteArrayToArrayList(arrayOfByte2, localArrayList);
      Raw.writeLongLittleEndian(arrayOfByte3, 0, paramLocalFileHeader.getUncompressedSize());
      System.arraycopy(arrayOfByte3, 0, arrayOfByte2, 0, 4);
      copyByteArrayToArrayList(arrayOfByte2, localArrayList);
      paramLocalFileHeader.setWriteComprSizeInZip64ExtraRecord(false);
      i = 0;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/core/HeaderWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */