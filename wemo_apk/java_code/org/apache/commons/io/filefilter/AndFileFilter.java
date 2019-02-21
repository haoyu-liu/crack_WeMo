package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class AndFileFilter
  extends AbstractFileFilter
  implements ConditionalFileFilter, Serializable
{
  private final List<IOFileFilter> fileFilters;
  
  public AndFileFilter()
  {
    this.fileFilters = new ArrayList();
  }
  
  public AndFileFilter(List<IOFileFilter> paramList)
  {
    if (paramList == null)
    {
      this.fileFilters = new ArrayList();
      return;
    }
    this.fileFilters = new ArrayList(paramList);
  }
  
  public AndFileFilter(IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    if ((paramIOFileFilter1 == null) || (paramIOFileFilter2 == null)) {
      throw new IllegalArgumentException("The filters must not be null");
    }
    this.fileFilters = new ArrayList(2);
    addFileFilter(paramIOFileFilter1);
    addFileFilter(paramIOFileFilter2);
  }
  
  public boolean accept(File paramFile)
  {
    if (this.fileFilters.isEmpty()) {
      return false;
    }
    Iterator localIterator = this.fileFilters.iterator();
    while (localIterator.hasNext()) {
      if (!((IOFileFilter)localIterator.next()).accept(paramFile)) {
        return false;
      }
    }
    return true;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    if (this.fileFilters.isEmpty()) {
      return false;
    }
    Iterator localIterator = this.fileFilters.iterator();
    while (localIterator.hasNext()) {
      if (!((IOFileFilter)localIterator.next()).accept(paramFile, paramString)) {
        return false;
      }
    }
    return true;
  }
  
  public void addFileFilter(IOFileFilter paramIOFileFilter)
  {
    this.fileFilters.add(paramIOFileFilter);
  }
  
  public List<IOFileFilter> getFileFilters()
  {
    return Collections.unmodifiableList(this.fileFilters);
  }
  
  public boolean removeFileFilter(IOFileFilter paramIOFileFilter)
  {
    return this.fileFilters.remove(paramIOFileFilter);
  }
  
  public void setFileFilters(List<IOFileFilter> paramList)
  {
    this.fileFilters.clear();
    this.fileFilters.addAll(paramList);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(super.toString());
    localStringBuilder.append("(");
    if (this.fileFilters != null)
    {
      int i = 0;
      if (i < this.fileFilters.size())
      {
        if (i > 0) {
          localStringBuilder.append(",");
        }
        Object localObject = this.fileFilters.get(i);
        if (localObject == null) {}
        for (String str = "null";; str = localObject.toString())
        {
          localStringBuilder.append(str);
          i++;
          break;
        }
      }
    }
    localStringBuilder.append(")");
    return localStringBuilder.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/filefilter/AndFileFilter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */