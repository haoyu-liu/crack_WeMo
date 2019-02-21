package org.apache.commons.io.comparator;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public class CompositeFileComparator
  extends AbstractFileComparator
  implements Serializable
{
  private static final Comparator<?>[] NO_COMPARATORS = new Comparator[0];
  private final Comparator<File>[] delegates;
  
  public CompositeFileComparator(Iterable<Comparator<File>> paramIterable)
  {
    if (paramIterable == null)
    {
      this.delegates = ((Comparator[])NO_COMPARATORS);
      return;
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((Comparator)localIterator.next());
    }
    this.delegates = ((Comparator[])localArrayList.toArray(new Comparator[localArrayList.size()]));
  }
  
  public CompositeFileComparator(Comparator<File>... paramVarArgs)
  {
    if (paramVarArgs == null)
    {
      this.delegates = ((Comparator[])NO_COMPARATORS);
      return;
    }
    this.delegates = ((Comparator[])new Comparator[paramVarArgs.length]);
    System.arraycopy(paramVarArgs, 0, this.delegates, 0, paramVarArgs.length);
  }
  
  public int compare(File paramFile1, File paramFile2)
  {
    int i = 0;
    Comparator[] arrayOfComparator = this.delegates;
    int j = arrayOfComparator.length;
    for (int k = 0;; k++) {
      if (k < j)
      {
        i = arrayOfComparator[k].compare(paramFile1, paramFile2);
        if (i == 0) {}
      }
      else
      {
        return i;
      }
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(super.toString());
    localStringBuilder.append('{');
    for (int i = 0; i < this.delegates.length; i++)
    {
      if (i > 0) {
        localStringBuilder.append(',');
      }
      localStringBuilder.append(this.delegates[i]);
    }
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/comparator/CompositeFileComparator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */