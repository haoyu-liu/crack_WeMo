package org.apache.commons.io.monitor;

import java.io.File;
import java.io.FileFilter;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOCase;
import org.apache.commons.io.comparator.NameFileComparator;

public class FileAlterationObserver
  implements Serializable
{
  private final Comparator<File> comparator;
  private final FileFilter fileFilter;
  private final List<FileAlterationListener> listeners = new CopyOnWriteArrayList();
  private final FileEntry rootEntry;
  
  public FileAlterationObserver(File paramFile)
  {
    this(paramFile, (FileFilter)null);
  }
  
  public FileAlterationObserver(File paramFile, FileFilter paramFileFilter)
  {
    this(paramFile, paramFileFilter, (IOCase)null);
  }
  
  public FileAlterationObserver(File paramFile, FileFilter paramFileFilter, IOCase paramIOCase)
  {
    this(new FileEntry(paramFile), paramFileFilter, paramIOCase);
  }
  
  public FileAlterationObserver(String paramString)
  {
    this(new File(paramString));
  }
  
  public FileAlterationObserver(String paramString, FileFilter paramFileFilter)
  {
    this(new File(paramString), paramFileFilter);
  }
  
  public FileAlterationObserver(String paramString, FileFilter paramFileFilter, IOCase paramIOCase)
  {
    this(new File(paramString), paramFileFilter, paramIOCase);
  }
  
  protected FileAlterationObserver(FileEntry paramFileEntry, FileFilter paramFileFilter, IOCase paramIOCase)
  {
    if (paramFileEntry == null) {
      throw new IllegalArgumentException("Root entry is missing");
    }
    if (paramFileEntry.getFile() == null) {
      throw new IllegalArgumentException("Root directory is missing");
    }
    this.rootEntry = paramFileEntry;
    this.fileFilter = paramFileFilter;
    if ((paramIOCase == null) || (paramIOCase.equals(IOCase.SYSTEM)))
    {
      this.comparator = NameFileComparator.NAME_SYSTEM_COMPARATOR;
      return;
    }
    if (paramIOCase.equals(IOCase.INSENSITIVE))
    {
      this.comparator = NameFileComparator.NAME_INSENSITIVE_COMPARATOR;
      return;
    }
    this.comparator = NameFileComparator.NAME_COMPARATOR;
  }
  
  private void checkAndNotify(FileEntry paramFileEntry, FileEntry[] paramArrayOfFileEntry, File[] paramArrayOfFile)
  {
    int i = 0;
    if (paramArrayOfFile.length > 0) {}
    int k;
    FileEntry localFileEntry;
    for (FileEntry[] arrayOfFileEntry = new FileEntry[paramArrayOfFile.length];; arrayOfFileEntry = FileEntry.EMPTY_ENTRIES)
    {
      int j = paramArrayOfFileEntry.length;
      k = 0;
      if (k >= j) {
        break label196;
      }
      localFileEntry = paramArrayOfFileEntry[k];
      while ((i < paramArrayOfFile.length) && (this.comparator.compare(localFileEntry.getFile(), paramArrayOfFile[i]) > 0))
      {
        arrayOfFileEntry[i] = createFileEntry(paramFileEntry, paramArrayOfFile[i]);
        doCreate(arrayOfFileEntry[i]);
        i++;
      }
    }
    if ((i < paramArrayOfFile.length) && (this.comparator.compare(localFileEntry.getFile(), paramArrayOfFile[i]) == 0))
    {
      doMatch(localFileEntry, paramArrayOfFile[i]);
      checkAndNotify(localFileEntry, localFileEntry.getChildren(), listFiles(paramArrayOfFile[i]));
      arrayOfFileEntry[i] = localFileEntry;
      i++;
    }
    for (;;)
    {
      k++;
      break;
      checkAndNotify(localFileEntry, localFileEntry.getChildren(), FileUtils.EMPTY_FILE_ARRAY);
      doDelete(localFileEntry);
    }
    label196:
    while (i < paramArrayOfFile.length)
    {
      arrayOfFileEntry[i] = createFileEntry(paramFileEntry, paramArrayOfFile[i]);
      doCreate(arrayOfFileEntry[i]);
      i++;
    }
    paramFileEntry.setChildren(arrayOfFileEntry);
  }
  
  private FileEntry createFileEntry(FileEntry paramFileEntry, File paramFile)
  {
    FileEntry localFileEntry = paramFileEntry.newChildInstance(paramFile);
    localFileEntry.refresh(paramFile);
    File[] arrayOfFile = listFiles(paramFile);
    if (arrayOfFile.length > 0) {}
    for (FileEntry[] arrayOfFileEntry = new FileEntry[arrayOfFile.length];; arrayOfFileEntry = FileEntry.EMPTY_ENTRIES) {
      for (int i = 0; i < arrayOfFile.length; i++) {
        arrayOfFileEntry[i] = createFileEntry(localFileEntry, arrayOfFile[i]);
      }
    }
    localFileEntry.setChildren(arrayOfFileEntry);
    return localFileEntry;
  }
  
  private void doCreate(FileEntry paramFileEntry)
  {
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext())
    {
      FileAlterationListener localFileAlterationListener = (FileAlterationListener)localIterator.next();
      if (paramFileEntry.isDirectory()) {
        localFileAlterationListener.onDirectoryCreate(paramFileEntry.getFile());
      } else {
        localFileAlterationListener.onFileCreate(paramFileEntry.getFile());
      }
    }
    FileEntry[] arrayOfFileEntry = paramFileEntry.getChildren();
    int i = arrayOfFileEntry.length;
    for (int j = 0; j < i; j++) {
      doCreate(arrayOfFileEntry[j]);
    }
  }
  
  private void doDelete(FileEntry paramFileEntry)
  {
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext())
    {
      FileAlterationListener localFileAlterationListener = (FileAlterationListener)localIterator.next();
      if (paramFileEntry.isDirectory()) {
        localFileAlterationListener.onDirectoryDelete(paramFileEntry.getFile());
      } else {
        localFileAlterationListener.onFileDelete(paramFileEntry.getFile());
      }
    }
  }
  
  private void doMatch(FileEntry paramFileEntry, File paramFile)
  {
    if (paramFileEntry.refresh(paramFile))
    {
      Iterator localIterator = this.listeners.iterator();
      while (localIterator.hasNext())
      {
        FileAlterationListener localFileAlterationListener = (FileAlterationListener)localIterator.next();
        if (paramFileEntry.isDirectory()) {
          localFileAlterationListener.onDirectoryChange(paramFile);
        } else {
          localFileAlterationListener.onFileChange(paramFile);
        }
      }
    }
  }
  
  private File[] listFiles(File paramFile)
  {
    boolean bool = paramFile.isDirectory();
    File[] arrayOfFile = null;
    if (bool) {
      if (this.fileFilter != null) {
        break label54;
      }
    }
    label54:
    for (arrayOfFile = paramFile.listFiles();; arrayOfFile = paramFile.listFiles(this.fileFilter))
    {
      if (arrayOfFile == null) {
        arrayOfFile = FileUtils.EMPTY_FILE_ARRAY;
      }
      if ((this.comparator != null) && (arrayOfFile.length > 1)) {
        Arrays.sort(arrayOfFile, this.comparator);
      }
      return arrayOfFile;
    }
  }
  
  public void addListener(FileAlterationListener paramFileAlterationListener)
  {
    if (paramFileAlterationListener != null) {
      this.listeners.add(paramFileAlterationListener);
    }
  }
  
  public void checkAndNotify()
  {
    Iterator localIterator1 = this.listeners.iterator();
    while (localIterator1.hasNext()) {
      ((FileAlterationListener)localIterator1.next()).onStart(this);
    }
    File localFile = this.rootEntry.getFile();
    if (localFile.exists()) {
      checkAndNotify(this.rootEntry, this.rootEntry.getChildren(), listFiles(localFile));
    }
    for (;;)
    {
      Iterator localIterator2 = this.listeners.iterator();
      while (localIterator2.hasNext()) {
        ((FileAlterationListener)localIterator2.next()).onStop(this);
      }
      if (this.rootEntry.isExists()) {
        checkAndNotify(this.rootEntry, this.rootEntry.getChildren(), FileUtils.EMPTY_FILE_ARRAY);
      }
    }
  }
  
  public void destroy()
    throws Exception
  {}
  
  public File getDirectory()
  {
    return this.rootEntry.getFile();
  }
  
  public FileFilter getFileFilter()
  {
    return this.fileFilter;
  }
  
  public Iterable<FileAlterationListener> getListeners()
  {
    return this.listeners;
  }
  
  public void initialize()
    throws Exception
  {
    this.rootEntry.refresh(this.rootEntry.getFile());
    File[] arrayOfFile = listFiles(this.rootEntry.getFile());
    if (arrayOfFile.length > 0) {}
    for (FileEntry[] arrayOfFileEntry = new FileEntry[arrayOfFile.length];; arrayOfFileEntry = FileEntry.EMPTY_ENTRIES) {
      for (int i = 0; i < arrayOfFile.length; i++) {
        arrayOfFileEntry[i] = createFileEntry(this.rootEntry, arrayOfFile[i]);
      }
    }
    this.rootEntry.setChildren(arrayOfFileEntry);
  }
  
  public void removeListener(FileAlterationListener paramFileAlterationListener)
  {
    while ((paramFileAlterationListener != null) && (this.listeners.remove(paramFileAlterationListener))) {}
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName());
    localStringBuilder.append("[file='");
    localStringBuilder.append(getDirectory().getPath());
    localStringBuilder.append('\'');
    if (this.fileFilter != null)
    {
      localStringBuilder.append(", ");
      localStringBuilder.append(this.fileFilter.toString());
    }
    localStringBuilder.append(", listeners=");
    localStringBuilder.append(this.listeners.size());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/monitor/FileAlterationObserver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */