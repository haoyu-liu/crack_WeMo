package net.lingala.zip4j.core;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.io.ZipInputStream;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.EndCentralDirRecord;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.UnzipParameters;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.progress.ProgressMonitor;
import net.lingala.zip4j.unzip.Unzip;
import net.lingala.zip4j.util.ArchiveMaintainer;
import net.lingala.zip4j.util.InternalZipConstants;
import net.lingala.zip4j.util.Zip4jUtil;
import net.lingala.zip4j.zip.ZipEngine;

public class ZipFile
{
  private String file;
  private String fileNameCharset;
  private boolean isEncrypted;
  private int mode;
  private ProgressMonitor progressMonitor;
  private boolean runInThread;
  private ZipModel zipModel;
  
  public ZipFile(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("Input zip file parameter is not null", 1);
    }
    this.file = paramFile.getPath();
    this.mode = 2;
    this.progressMonitor = new ProgressMonitor();
    this.runInThread = false;
  }
  
  public ZipFile(String paramString)
    throws ZipException
  {
    this(new File(paramString));
  }
  
  private void addFolder(File paramFile, ZipParameters paramZipParameters, boolean paramBoolean)
    throws ZipException
  {
    checkZipModel();
    if (this.zipModel == null) {
      throw new ZipException("internal error: zip model is null");
    }
    if ((paramBoolean) && (this.zipModel.isSplitArchive())) {
      throw new ZipException("This is a split archive. Zip file format does not allow updating split/spanned files");
    }
    new ZipEngine(this.zipModel).addFolderToZip(paramFile, paramZipParameters, this.progressMonitor, this.runInThread);
  }
  
  private void checkZipModel()
    throws ZipException
  {
    if (this.zipModel == null)
    {
      if (Zip4jUtil.checkFileExists(this.file)) {
        readZipInfo();
      }
    }
    else {
      return;
    }
    createNewZipModel();
  }
  
  private void createNewZipModel()
  {
    this.zipModel = new ZipModel();
    this.zipModel.setZipFile(this.file);
    this.zipModel.setFileNameCharset(this.fileNameCharset);
  }
  
  /* Error */
  private void readZipInfo()
    throws ZipException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 36	net/lingala/zip4j/core/ZipFile:file	Ljava/lang/String;
    //   4: invokestatic 83	net/lingala/zip4j/util/Zip4jUtil:checkFileExists	(Ljava/lang/String;)Z
    //   7: ifne +13 -> 20
    //   10: new 20	net/lingala/zip4j/exception/ZipException
    //   13: dup
    //   14: ldc 104
    //   16: invokespecial 60	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   19: athrow
    //   20: aload_0
    //   21: getfield 36	net/lingala/zip4j/core/ZipFile:file	Ljava/lang/String;
    //   24: invokestatic 107	net/lingala/zip4j/util/Zip4jUtil:checkFileReadAccess	(Ljava/lang/String;)Z
    //   27: ifne +13 -> 40
    //   30: new 20	net/lingala/zip4j/exception/ZipException
    //   33: dup
    //   34: ldc 109
    //   36: invokespecial 60	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   39: athrow
    //   40: aload_0
    //   41: getfield 38	net/lingala/zip4j/core/ZipFile:mode	I
    //   44: iconst_2
    //   45: if_icmpeq +13 -> 58
    //   48: new 20	net/lingala/zip4j/exception/ZipException
    //   51: dup
    //   52: ldc 111
    //   54: invokespecial 60	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   57: athrow
    //   58: aconst_null
    //   59: astore_1
    //   60: new 113	java/io/RandomAccessFile
    //   63: dup
    //   64: new 30	java/io/File
    //   67: dup
    //   68: aload_0
    //   69: getfield 36	net/lingala/zip4j/core/ZipFile:file	Ljava/lang/String;
    //   72: invokespecial 48	java/io/File:<init>	(Ljava/lang/String;)V
    //   75: ldc 115
    //   77: invokespecial 118	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   80: astore_2
    //   81: aload_0
    //   82: getfield 57	net/lingala/zip4j/core/ZipFile:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   85: ifnonnull +40 -> 125
    //   88: aload_0
    //   89: new 120	net/lingala/zip4j/core/HeaderReader
    //   92: dup
    //   93: aload_2
    //   94: invokespecial 123	net/lingala/zip4j/core/HeaderReader:<init>	(Ljava/io/RandomAccessFile;)V
    //   97: aload_0
    //   98: getfield 95	net/lingala/zip4j/core/ZipFile:fileNameCharset	Ljava/lang/String;
    //   101: invokevirtual 127	net/lingala/zip4j/core/HeaderReader:readAllHeaders	(Ljava/lang/String;)Lnet/lingala/zip4j/model/ZipModel;
    //   104: putfield 57	net/lingala/zip4j/core/ZipFile:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   107: aload_0
    //   108: getfield 57	net/lingala/zip4j/core/ZipFile:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   111: ifnull +14 -> 125
    //   114: aload_0
    //   115: getfield 57	net/lingala/zip4j/core/ZipFile:zipModel	Lnet/lingala/zip4j/model/ZipModel;
    //   118: aload_0
    //   119: getfield 36	net/lingala/zip4j/core/ZipFile:file	Ljava/lang/String;
    //   122: invokevirtual 93	net/lingala/zip4j/model/ZipModel:setZipFile	(Ljava/lang/String;)V
    //   125: aload_2
    //   126: ifnull +7 -> 133
    //   129: aload_2
    //   130: invokevirtual 130	java/io/RandomAccessFile:close	()V
    //   133: return
    //   134: astore_3
    //   135: new 20	net/lingala/zip4j/exception/ZipException
    //   138: dup
    //   139: aload_3
    //   140: invokespecial 133	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   143: athrow
    //   144: astore 4
    //   146: aload_1
    //   147: ifnull +7 -> 154
    //   150: aload_1
    //   151: invokevirtual 130	java/io/RandomAccessFile:close	()V
    //   154: aload 4
    //   156: athrow
    //   157: astore 5
    //   159: goto -5 -> 154
    //   162: astore 6
    //   164: return
    //   165: astore 4
    //   167: aload_2
    //   168: astore_1
    //   169: goto -23 -> 146
    //   172: astore_3
    //   173: aload_2
    //   174: astore_1
    //   175: goto -40 -> 135
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	178	0	this	ZipFile
    //   59	116	1	localObject1	Object
    //   80	94	2	localRandomAccessFile	java.io.RandomAccessFile
    //   134	6	3	localFileNotFoundException1	java.io.FileNotFoundException
    //   172	1	3	localFileNotFoundException2	java.io.FileNotFoundException
    //   144	11	4	localObject2	Object
    //   165	1	4	localObject3	Object
    //   157	1	5	localIOException1	java.io.IOException
    //   162	1	6	localIOException2	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   60	81	134	java/io/FileNotFoundException
    //   60	81	144	finally
    //   135	144	144	finally
    //   150	154	157	java/io/IOException
    //   129	133	162	java/io/IOException
    //   81	125	165	finally
    //   81	125	172	java/io/FileNotFoundException
  }
  
  public void addFile(File paramFile, ZipParameters paramZipParameters)
    throws ZipException
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramFile);
    addFiles(localArrayList, paramZipParameters);
  }
  
  public void addFiles(ArrayList paramArrayList, ZipParameters paramZipParameters)
    throws ZipException
  {
    checkZipModel();
    if (this.zipModel == null) {
      throw new ZipException("internal error: zip model is null");
    }
    if (paramArrayList == null) {
      throw new ZipException("input file ArrayList is null, cannot add files");
    }
    if (!Zip4jUtil.checkArrayListTypes(paramArrayList, 1)) {
      throw new ZipException("One or more elements in the input ArrayList is not of type File");
    }
    if (paramZipParameters == null) {
      throw new ZipException("input parameters are null, cannot add files to zip");
    }
    if (this.progressMonitor.getState() == 1) {
      throw new ZipException("invalid operation - Zip4j is in busy state");
    }
    if ((Zip4jUtil.checkFileExists(this.file)) && (this.zipModel.isSplitArchive())) {
      throw new ZipException("Zip file already exists. Zip file format does not allow updating split/spanned files");
    }
    new ZipEngine(this.zipModel).addFiles(paramArrayList, paramZipParameters, this.progressMonitor, this.runInThread);
  }
  
  public void addFolder(File paramFile, ZipParameters paramZipParameters)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("input path is null, cannot add folder to zip file");
    }
    if (paramZipParameters == null) {
      throw new ZipException("input parameters are null, cannot add folder to zip file");
    }
    addFolder(paramFile, paramZipParameters, true);
  }
  
  public void addFolder(String paramString, ZipParameters paramZipParameters)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("input path is null or empty, cannot add folder to zip file");
    }
    addFolder(new File(paramString), paramZipParameters);
  }
  
  public void addStream(InputStream paramInputStream, ZipParameters paramZipParameters)
    throws ZipException
  {
    if (paramInputStream == null) {
      throw new ZipException("inputstream is null, cannot add file to zip");
    }
    if (paramZipParameters == null) {
      throw new ZipException("zip parameters are null");
    }
    setRunInThread(false);
    checkZipModel();
    if (this.zipModel == null) {
      throw new ZipException("internal error: zip model is null");
    }
    if ((Zip4jUtil.checkFileExists(this.file)) && (this.zipModel.isSplitArchive())) {
      throw new ZipException("Zip file already exists. Zip file format does not allow updating split/spanned files");
    }
    new ZipEngine(this.zipModel).addStreamToZip(paramInputStream, paramZipParameters);
  }
  
  public void createZipFile(File paramFile, ZipParameters paramZipParameters)
    throws ZipException
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramFile);
    createZipFile(localArrayList, paramZipParameters, false, -1L);
  }
  
  public void createZipFile(File paramFile, ZipParameters paramZipParameters, boolean paramBoolean, long paramLong)
    throws ZipException
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramFile);
    createZipFile(localArrayList, paramZipParameters, paramBoolean, paramLong);
  }
  
  public void createZipFile(ArrayList paramArrayList, ZipParameters paramZipParameters)
    throws ZipException
  {
    createZipFile(paramArrayList, paramZipParameters, false, -1L);
  }
  
  public void createZipFile(ArrayList paramArrayList, ZipParameters paramZipParameters, boolean paramBoolean, long paramLong)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(this.file)) {
      throw new ZipException("zip file path is empty");
    }
    if (Zip4jUtil.checkFileExists(this.file)) {
      throw new ZipException("zip file: " + this.file + " already exists. To add files to existing zip file use addFile method");
    }
    if (paramArrayList == null) {
      throw new ZipException("input file ArrayList is null, cannot create zip file");
    }
    if (!Zip4jUtil.checkArrayListTypes(paramArrayList, 1)) {
      throw new ZipException("One or more elements in the input ArrayList is not of type File");
    }
    createNewZipModel();
    this.zipModel.setSplitArchive(paramBoolean);
    this.zipModel.setSplitLength(paramLong);
    addFiles(paramArrayList, paramZipParameters);
  }
  
  public void createZipFileFromFolder(File paramFile, ZipParameters paramZipParameters, boolean paramBoolean, long paramLong)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("folderToAdd is null, cannot create zip file from folder");
    }
    if (paramZipParameters == null) {
      throw new ZipException("input parameters are null, cannot create zip file from folder");
    }
    if (Zip4jUtil.checkFileExists(this.file)) {
      throw new ZipException("zip file: " + this.file + " already exists. To add files to existing zip file use addFolder method");
    }
    createNewZipModel();
    this.zipModel.setSplitArchive(paramBoolean);
    if (paramBoolean) {
      this.zipModel.setSplitLength(paramLong);
    }
    addFolder(paramFile, paramZipParameters, false);
  }
  
  public void createZipFileFromFolder(String paramString, ZipParameters paramZipParameters, boolean paramBoolean, long paramLong)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("folderToAdd is empty or null, cannot create Zip File from folder");
    }
    createZipFileFromFolder(new File(paramString), paramZipParameters, paramBoolean, paramLong);
  }
  
  public void extractAll(String paramString)
    throws ZipException
  {
    extractAll(paramString, null);
  }
  
  public void extractAll(String paramString, UnzipParameters paramUnzipParameters)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("output path is null or invalid");
    }
    if (!Zip4jUtil.checkOutputFolder(paramString)) {
      throw new ZipException("invalid output path");
    }
    if (this.zipModel == null) {
      readZipInfo();
    }
    if (this.zipModel == null) {
      throw new ZipException("Internal error occurred when extracting zip file");
    }
    if (this.progressMonitor.getState() == 1) {
      throw new ZipException("invalid operation - Zip4j is in busy state");
    }
    new Unzip(this.zipModel).extractAll(paramUnzipParameters, paramString, this.progressMonitor, this.runInThread);
  }
  
  public void extractFile(String paramString1, String paramString2)
    throws ZipException
  {
    extractFile(paramString1, paramString2, null);
  }
  
  public void extractFile(String paramString1, String paramString2, UnzipParameters paramUnzipParameters)
    throws ZipException
  {
    extractFile(paramString1, paramString2, paramUnzipParameters, null);
  }
  
  public void extractFile(String paramString1, String paramString2, UnzipParameters paramUnzipParameters, String paramString3)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString1)) {
      throw new ZipException("file to extract is null or empty, cannot extract file");
    }
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString2)) {
      throw new ZipException("destination string path is empty or null, cannot extract file");
    }
    readZipInfo();
    FileHeader localFileHeader = Zip4jUtil.getFileHeader(this.zipModel, paramString1);
    if (localFileHeader == null) {
      throw new ZipException("file header not found for given file name, cannot extract file");
    }
    if (this.progressMonitor.getState() == 1) {
      throw new ZipException("invalid operation - Zip4j is in busy state");
    }
    localFileHeader.extractFile(this.zipModel, paramString2, paramUnzipParameters, paramString3, this.progressMonitor, this.runInThread);
  }
  
  public void extractFile(FileHeader paramFileHeader, String paramString)
    throws ZipException
  {
    extractFile(paramFileHeader, paramString, null);
  }
  
  public void extractFile(FileHeader paramFileHeader, String paramString, UnzipParameters paramUnzipParameters)
    throws ZipException
  {
    extractFile(paramFileHeader, paramString, paramUnzipParameters, null);
  }
  
  public void extractFile(FileHeader paramFileHeader, String paramString1, UnzipParameters paramUnzipParameters, String paramString2)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("input file header is null, cannot extract file");
    }
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString1)) {
      throw new ZipException("destination path is empty or null, cannot extract file");
    }
    readZipInfo();
    if (this.progressMonitor.getState() == 1) {
      throw new ZipException("invalid operation - Zip4j is in busy state");
    }
    paramFileHeader.extractFile(this.zipModel, paramString1, paramUnzipParameters, paramString2, this.progressMonitor, this.runInThread);
  }
  
  public String getComment()
    throws ZipException
  {
    return getComment(null);
  }
  
  public String getComment(String paramString)
    throws ZipException
  {
    if (paramString == null) {
      if (!Zip4jUtil.isSupportedCharset("windows-1254")) {
        break label49;
      }
    }
    label49:
    for (paramString = "windows-1254"; Zip4jUtil.checkFileExists(this.file); paramString = InternalZipConstants.CHARSET_DEFAULT)
    {
      checkZipModel();
      if (this.zipModel != null) {
        break label67;
      }
      throw new ZipException("zip model is null, cannot read comment");
    }
    throw new ZipException("zip file does not exist, cannot read comment");
    label67:
    if (this.zipModel.getEndCentralDirRecord() == null) {
      throw new ZipException("end of central directory record is null, cannot read comment");
    }
    if ((this.zipModel.getEndCentralDirRecord().getCommentBytes() == null) || (this.zipModel.getEndCentralDirRecord().getCommentBytes().length <= 0)) {
      return null;
    }
    try
    {
      String str = new String(this.zipModel.getEndCentralDirRecord().getCommentBytes(), paramString);
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new ZipException(localUnsupportedEncodingException);
    }
  }
  
  public File getFile()
  {
    return new File(this.file);
  }
  
  public FileHeader getFileHeader(String paramString)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("input file name is emtpy or null, cannot get FileHeader");
    }
    readZipInfo();
    if ((this.zipModel == null) || (this.zipModel.getCentralDirectory() == null)) {
      return null;
    }
    return Zip4jUtil.getFileHeader(this.zipModel, paramString);
  }
  
  public List getFileHeaders()
    throws ZipException
  {
    readZipInfo();
    if ((this.zipModel == null) || (this.zipModel.getCentralDirectory() == null)) {
      return null;
    }
    return this.zipModel.getCentralDirectory().getFileHeaders();
  }
  
  public ZipInputStream getInputStream(FileHeader paramFileHeader)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("FileHeader is null, cannot get InputStream");
    }
    checkZipModel();
    if (this.zipModel == null) {
      throw new ZipException("zip model is null, cannot get inputstream");
    }
    return new Unzip(this.zipModel).getInputStream(paramFileHeader);
  }
  
  public ProgressMonitor getProgressMonitor()
  {
    return this.progressMonitor;
  }
  
  public ArrayList getSplitZipFiles()
    throws ZipException
  {
    checkZipModel();
    return Zip4jUtil.getSplitZipFiles(this.zipModel);
  }
  
  public boolean isEncrypted()
    throws ZipException
  {
    if (this.zipModel == null)
    {
      readZipInfo();
      if (this.zipModel == null) {
        throw new ZipException("Zip Model is null");
      }
    }
    if ((this.zipModel.getCentralDirectory() == null) || (this.zipModel.getCentralDirectory().getFileHeaders() == null)) {
      throw new ZipException("invalid zip file");
    }
    ArrayList localArrayList = this.zipModel.getCentralDirectory().getFileHeaders();
    for (int i = 0;; i++)
    {
      if (i >= localArrayList.size()) {}
      for (;;)
      {
        return this.isEncrypted;
        FileHeader localFileHeader = (FileHeader)localArrayList.get(i);
        if ((localFileHeader == null) || (!localFileHeader.isEncrypted())) {
          break;
        }
        this.isEncrypted = true;
      }
    }
  }
  
  public boolean isRunInThread()
  {
    return this.runInThread;
  }
  
  public boolean isSplitArchive()
    throws ZipException
  {
    if (this.zipModel == null)
    {
      readZipInfo();
      if (this.zipModel == null) {
        throw new ZipException("Zip Model is null");
      }
    }
    return this.zipModel.isSplitArchive();
  }
  
  public boolean isValidZipFile()
  {
    try
    {
      readZipInfo();
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public void mergeSplitFiles(File paramFile)
    throws ZipException
  {
    if (paramFile == null) {
      throw new ZipException("outputZipFile is null, cannot merge split files");
    }
    if (paramFile.exists()) {
      throw new ZipException("output Zip File already exists");
    }
    checkZipModel();
    if (this.zipModel == null) {
      throw new ZipException("zip model is null, corrupt zip file?");
    }
    ArchiveMaintainer localArchiveMaintainer = new ArchiveMaintainer();
    localArchiveMaintainer.initProgressMonitorForMergeOp(this.zipModel, this.progressMonitor);
    localArchiveMaintainer.mergeSplitZipFiles(this.zipModel, paramFile, this.progressMonitor, this.runInThread);
  }
  
  public void removeFile(String paramString)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("file name is empty or null, cannot remove file");
    }
    if ((this.zipModel == null) && (Zip4jUtil.checkFileExists(this.file))) {
      readZipInfo();
    }
    if (this.zipModel.isSplitArchive()) {
      throw new ZipException("Zip file format does not allow updating split/spanned files");
    }
    FileHeader localFileHeader = Zip4jUtil.getFileHeader(this.zipModel, paramString);
    if (localFileHeader == null) {
      throw new ZipException("could not find file header for file: " + paramString);
    }
    removeFile(localFileHeader);
  }
  
  public void removeFile(FileHeader paramFileHeader)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("file header is null, cannot remove file");
    }
    if ((this.zipModel == null) && (Zip4jUtil.checkFileExists(this.file))) {
      readZipInfo();
    }
    if (this.zipModel.isSplitArchive()) {
      throw new ZipException("Zip file format does not allow updating split/spanned files");
    }
    ArchiveMaintainer localArchiveMaintainer = new ArchiveMaintainer();
    localArchiveMaintainer.initProgressMonitorForRemoveOp(this.zipModel, paramFileHeader, this.progressMonitor);
    localArchiveMaintainer.removeZipFile(this.zipModel, paramFileHeader, this.progressMonitor, this.runInThread);
  }
  
  public void setComment(String paramString)
    throws ZipException
  {
    if (paramString == null) {
      throw new ZipException("input comment is null, cannot update zip file");
    }
    if (!Zip4jUtil.checkFileExists(this.file)) {
      throw new ZipException("zip file does not exist, cannot set comment for zip file");
    }
    readZipInfo();
    if (this.zipModel == null) {
      throw new ZipException("zipModel is null, cannot update zip file");
    }
    if (this.zipModel.getEndCentralDirRecord() == null) {
      throw new ZipException("end of central directory is null, cannot set comment");
    }
    new ArchiveMaintainer().setComment(this.zipModel, paramString);
  }
  
  public void setFileNameCharset(String paramString)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new ZipException("null or empty charset name");
    }
    if (!Zip4jUtil.isSupportedCharset(paramString)) {
      throw new ZipException("unsupported charset: " + paramString);
    }
    this.fileNameCharset = paramString;
  }
  
  public void setPassword(String paramString)
    throws ZipException
  {
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString)) {
      throw new NullPointerException();
    }
    setPassword(paramString.toCharArray());
  }
  
  public void setPassword(char[] paramArrayOfChar)
    throws ZipException
  {
    if (this.zipModel == null)
    {
      readZipInfo();
      if (this.zipModel == null) {
        throw new ZipException("Zip Model is null");
      }
    }
    if ((this.zipModel.getCentralDirectory() == null) || (this.zipModel.getCentralDirectory().getFileHeaders() == null)) {
      throw new ZipException("invalid zip file");
    }
    for (int i = 0;; i++)
    {
      if (i >= this.zipModel.getCentralDirectory().getFileHeaders().size()) {
        return;
      }
      if ((this.zipModel.getCentralDirectory().getFileHeaders().get(i) != null) && (((FileHeader)this.zipModel.getCentralDirectory().getFileHeaders().get(i)).isEncrypted())) {
        ((FileHeader)this.zipModel.getCentralDirectory().getFileHeaders().get(i)).setPassword(paramArrayOfChar);
      }
    }
  }
  
  public void setRunInThread(boolean paramBoolean)
  {
    this.runInThread = paramBoolean;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/core/ZipFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */