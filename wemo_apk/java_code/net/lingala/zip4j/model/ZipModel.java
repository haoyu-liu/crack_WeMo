package net.lingala.zip4j.model;

import java.util.List;

public class ZipModel
  implements Cloneable
{
  private ArchiveExtraDataRecord archiveExtraDataRecord;
  private CentralDirectory centralDirectory;
  private List dataDescriptorList;
  private long end;
  private EndCentralDirRecord endCentralDirRecord;
  private String fileNameCharset;
  private boolean isNestedZipFile;
  private boolean isZip64Format;
  private List localFileHeaderList;
  private boolean splitArchive;
  private long splitLength = -1L;
  private long start;
  private Zip64EndCentralDirLocator zip64EndCentralDirLocator;
  private Zip64EndCentralDirRecord zip64EndCentralDirRecord;
  private String zipFile;
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public ArchiveExtraDataRecord getArchiveExtraDataRecord()
  {
    return this.archiveExtraDataRecord;
  }
  
  public CentralDirectory getCentralDirectory()
  {
    return this.centralDirectory;
  }
  
  public List getDataDescriptorList()
  {
    return this.dataDescriptorList;
  }
  
  public long getEnd()
  {
    return this.end;
  }
  
  public EndCentralDirRecord getEndCentralDirRecord()
  {
    return this.endCentralDirRecord;
  }
  
  public String getFileNameCharset()
  {
    return this.fileNameCharset;
  }
  
  public List getLocalFileHeaderList()
  {
    return this.localFileHeaderList;
  }
  
  public long getSplitLength()
  {
    return this.splitLength;
  }
  
  public long getStart()
  {
    return this.start;
  }
  
  public Zip64EndCentralDirLocator getZip64EndCentralDirLocator()
  {
    return this.zip64EndCentralDirLocator;
  }
  
  public Zip64EndCentralDirRecord getZip64EndCentralDirRecord()
  {
    return this.zip64EndCentralDirRecord;
  }
  
  public String getZipFile()
  {
    return this.zipFile;
  }
  
  public boolean isNestedZipFile()
  {
    return this.isNestedZipFile;
  }
  
  public boolean isSplitArchive()
  {
    return this.splitArchive;
  }
  
  public boolean isZip64Format()
  {
    return this.isZip64Format;
  }
  
  public void setArchiveExtraDataRecord(ArchiveExtraDataRecord paramArchiveExtraDataRecord)
  {
    this.archiveExtraDataRecord = paramArchiveExtraDataRecord;
  }
  
  public void setCentralDirectory(CentralDirectory paramCentralDirectory)
  {
    this.centralDirectory = paramCentralDirectory;
  }
  
  public void setDataDescriptorList(List paramList)
  {
    this.dataDescriptorList = paramList;
  }
  
  public void setEnd(long paramLong)
  {
    this.end = paramLong;
  }
  
  public void setEndCentralDirRecord(EndCentralDirRecord paramEndCentralDirRecord)
  {
    this.endCentralDirRecord = paramEndCentralDirRecord;
  }
  
  public void setFileNameCharset(String paramString)
  {
    this.fileNameCharset = paramString;
  }
  
  public void setLocalFileHeaderList(List paramList)
  {
    this.localFileHeaderList = paramList;
  }
  
  public void setNestedZipFile(boolean paramBoolean)
  {
    this.isNestedZipFile = paramBoolean;
  }
  
  public void setSplitArchive(boolean paramBoolean)
  {
    this.splitArchive = paramBoolean;
  }
  
  public void setSplitLength(long paramLong)
  {
    this.splitLength = paramLong;
  }
  
  public void setStart(long paramLong)
  {
    this.start = paramLong;
  }
  
  public void setZip64EndCentralDirLocator(Zip64EndCentralDirLocator paramZip64EndCentralDirLocator)
  {
    this.zip64EndCentralDirLocator = paramZip64EndCentralDirLocator;
  }
  
  public void setZip64EndCentralDirRecord(Zip64EndCentralDirRecord paramZip64EndCentralDirRecord)
  {
    this.zip64EndCentralDirRecord = paramZip64EndCentralDirRecord;
  }
  
  public void setZip64Format(boolean paramBoolean)
  {
    this.isZip64Format = paramBoolean;
  }
  
  public void setZipFile(String paramString)
  {
    this.zipFile = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/ZipModel.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */