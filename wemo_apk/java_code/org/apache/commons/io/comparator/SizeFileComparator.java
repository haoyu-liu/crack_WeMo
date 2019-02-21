package org.apache.commons.io.comparator;

import java.io.File;
import java.io.Serializable;
import java.util.Comparator;
import org.apache.commons.io.FileUtils;

public class SizeFileComparator
  extends AbstractFileComparator
  implements Serializable
{
  public static final Comparator<File> SIZE_COMPARATOR = new SizeFileComparator();
  public static final Comparator<File> SIZE_REVERSE = new ReverseComparator(SIZE_COMPARATOR);
  public static final Comparator<File> SIZE_SUMDIR_COMPARATOR = new SizeFileComparator(true);
  public static final Comparator<File> SIZE_SUMDIR_REVERSE = new ReverseComparator(SIZE_SUMDIR_COMPARATOR);
  private final boolean sumDirectoryContents;
  
  public SizeFileComparator()
  {
    this.sumDirectoryContents = false;
  }
  
  public SizeFileComparator(boolean paramBoolean)
  {
    this.sumDirectoryContents = paramBoolean;
  }
  
  public int compare(File paramFile1, File paramFile2)
  {
    long l1;
    long l2;
    if (paramFile1.isDirectory()) {
      if ((this.sumDirectoryContents) && (paramFile1.exists()))
      {
        l1 = FileUtils.sizeOfDirectory(paramFile1);
        if (!paramFile2.isDirectory()) {
          break label87;
        }
        if ((!this.sumDirectoryContents) || (!paramFile2.exists())) {
          break label81;
        }
        l2 = FileUtils.sizeOfDirectory(paramFile2);
      }
    }
    long l3;
    for (;;)
    {
      l3 = l1 - l2;
      if (l3 >= 0L) {
        break label96;
      }
      return -1;
      l1 = 0L;
      break;
      l1 = paramFile1.length();
      break;
      label81:
      l2 = 0L;
      continue;
      label87:
      l2 = paramFile2.length();
    }
    label96:
    if (l3 > 0L) {
      return 1;
    }
    return 0;
  }
  
  public String toString()
  {
    return super.toString() + "[sumDirectoryContents=" + this.sumDirectoryContents + "]";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/comparator/SizeFileComparator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */