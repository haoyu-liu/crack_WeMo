package javolution.util.stripped;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

public abstract class FastCollection<E>
  implements Collection<E>
{
  private static final Object NULL = new Object();
  
  private static boolean contains(Collection paramCollection, Object paramObject, FastComparator paramFastComparator)
  {
    if (((paramCollection instanceof FastCollection)) && (((FastCollection)paramCollection).getValueComparator().equals(paramFastComparator))) {
      return paramCollection.contains(paramObject);
    }
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext()) {
      if (paramFastComparator.areEqual(paramObject, localIterator.next())) {
        return true;
      }
    }
    return false;
  }
  
  private boolean equalsOrder(List paramList)
  {
    if (paramList == this) {
      return true;
    }
    if (size() != paramList.size()) {
      return false;
    }
    Iterator localIterator = paramList.iterator();
    FastComparator localFastComparator = getValueComparator();
    Record localRecord1 = head();
    Record localRecord2 = tail();
    do
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
    } while (localFastComparator.areEqual(valueOf(localRecord1), localIterator.next()));
    return false;
  }
  
  private int hashCodeList()
  {
    FastComparator localFastComparator = getValueComparator();
    int i = 1;
    Record localRecord1 = head();
    Record localRecord2 = tail();
    for (;;)
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
      i = i * 31 + localFastComparator.hashCodeOf(valueOf(localRecord1));
    }
    return i;
  }
  
  public boolean add(E paramE)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    boolean bool = false;
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext()) {
      if (add(localIterator.next())) {
        bool = true;
      }
    }
    return bool;
  }
  
  public void clear()
  {
    Record localRecord1 = head();
    for (Record localRecord2 = tail().getPrevious(); localRecord2 != localRecord1; localRecord2 = localRecord2.getPrevious()) {
      delete(localRecord2);
    }
  }
  
  public boolean contains(Object paramObject)
  {
    FastComparator localFastComparator = getValueComparator();
    Record localRecord1 = head();
    Record localRecord2 = tail();
    do
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
    } while (!localFastComparator.areEqual(paramObject, valueOf(localRecord1)));
    return true;
    return false;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext()) {
      if (!contains(localIterator.next())) {
        return false;
      }
    }
    return true;
  }
  
  public abstract void delete(Record paramRecord);
  
  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if ((this instanceof List))
    {
      boolean bool5 = paramObject instanceof List;
      bool2 = false;
      if (bool5) {
        bool2 = equalsOrder((List)paramObject);
      }
    }
    boolean bool4;
    do
    {
      Collection localCollection;
      int i;
      int j;
      do
      {
        boolean bool3;
        do
        {
          boolean bool1;
          do
          {
            return bool2;
            bool1 = paramObject instanceof List;
            bool2 = false;
          } while (bool1);
          bool3 = paramObject instanceof Collection;
          bool2 = false;
        } while (!bool3);
        localCollection = (Collection)paramObject;
        if (this == localCollection) {
          break;
        }
        i = size();
        j = localCollection.size();
        bool2 = false;
      } while (i != j);
      bool4 = containsAll(localCollection);
      bool2 = false;
    } while (!bool4);
    return true;
  }
  
  public FastComparator<? super E> getValueComparator()
  {
    return FastComparator.DEFAULT;
  }
  
  public int hashCode()
  {
    if ((this instanceof List))
    {
      i = hashCodeList();
      return i;
    }
    FastComparator localFastComparator = getValueComparator();
    int i = 0;
    Record localRecord1 = head();
    Record localRecord2 = tail();
    for (;;)
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
      i += localFastComparator.hashCodeOf(valueOf(localRecord1));
    }
  }
  
  public abstract Record head();
  
  public final boolean isEmpty()
  {
    return size() == 0;
  }
  
  public Iterator<E> iterator()
  {
    return FastIterator.valueOf(this);
  }
  
  public boolean remove(Object paramObject)
  {
    FastComparator localFastComparator = getValueComparator();
    Record localRecord1 = head();
    Record localRecord2 = tail();
    do
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
    } while (!localFastComparator.areEqual(paramObject, valueOf(localRecord1)));
    delete(localRecord1);
    return true;
    return false;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    boolean bool = false;
    Record localRecord1 = head();
    Record localRecord2;
    for (Object localObject = tail().getPrevious(); localObject != localRecord1; localObject = localRecord2)
    {
      localRecord2 = ((Record)localObject).getPrevious();
      if (contains(paramCollection, valueOf((Record)localObject), getValueComparator()))
      {
        delete((Record)localObject);
        bool = true;
      }
    }
    return bool;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    boolean bool = false;
    Record localRecord1 = head();
    Record localRecord2;
    for (Object localObject = tail().getPrevious(); localObject != localRecord1; localObject = localRecord2)
    {
      localRecord2 = ((Record)localObject).getPrevious();
      if (!contains(paramCollection, valueOf((Record)localObject), getValueComparator()))
      {
        delete((Record)localObject);
        bool = true;
      }
    }
    return bool;
  }
  
  public Collection<E> shared()
  {
    return new Shared(null);
  }
  
  public abstract int size();
  
  public abstract Record tail();
  
  public Object[] toArray()
  {
    return toArray(new Object[size()]);
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    int i = size();
    if (paramArrayOfT.length < i) {
      throw new UnsupportedOperationException("Destination array too small");
    }
    if (paramArrayOfT.length > i) {
      paramArrayOfT[i] = null;
    }
    int j = 0;
    Record localRecord1 = head();
    Record localRecord2 = tail();
    for (;;)
    {
      localRecord1 = localRecord1.getNext();
      if (localRecord1 == localRecord2) {
        break;
      }
      int k = j + 1;
      paramArrayOfT[j] = valueOf(localRecord1);
      j = k;
    }
    return paramArrayOfT;
  }
  
  public Collection<E> unmodifiable()
  {
    return new Unmodifiable();
  }
  
  public abstract E valueOf(Record paramRecord);
  
  public static abstract interface Record
  {
    public abstract Record getNext();
    
    public abstract Record getPrevious();
  }
  
  private class Shared
    implements Collection, Serializable
  {
    private Shared() {}
    
    private void writeObject(ObjectOutputStream paramObjectOutputStream)
      throws IOException
    {
      try
      {
        paramObjectOutputStream.defaultWriteObject();
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean add(Object paramObject)
    {
      try
      {
        boolean bool = FastCollection.this.add(paramObject);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean addAll(Collection paramCollection)
    {
      try
      {
        boolean bool = FastCollection.this.addAll(paramCollection);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void clear()
    {
      try
      {
        FastCollection.this.clear();
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean contains(Object paramObject)
    {
      try
      {
        boolean bool = FastCollection.this.contains(paramObject);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean containsAll(Collection paramCollection)
    {
      try
      {
        boolean bool = FastCollection.this.containsAll(paramCollection);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean isEmpty()
    {
      try
      {
        boolean bool = FastCollection.this.isEmpty();
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    /* Error */
    public Iterator iterator()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 14	javolution/util/stripped/FastCollection$Shared:this$0	Ljavolution/util/stripped/FastCollection;
      //   6: instanceof 56
      //   9: ifeq +23 -> 32
      //   12: new 58	javolution/util/stripped/FastCollection$Shared$ListArrayIterator
      //   15: dup
      //   16: aload_0
      //   17: aload_0
      //   18: getfield 14	javolution/util/stripped/FastCollection$Shared:this$0	Ljavolution/util/stripped/FastCollection;
      //   21: invokevirtual 62	javolution/util/stripped/FastCollection:toArray	()[Ljava/lang/Object;
      //   24: invokespecial 65	javolution/util/stripped/FastCollection$Shared$ListArrayIterator:<init>	(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
      //   27: astore_2
      //   28: aload_0
      //   29: monitorexit
      //   30: aload_2
      //   31: areturn
      //   32: new 67	javolution/util/stripped/FastCollection$Shared$CollectionArrayIterator
      //   35: dup
      //   36: aload_0
      //   37: aload_0
      //   38: getfield 14	javolution/util/stripped/FastCollection$Shared:this$0	Ljavolution/util/stripped/FastCollection;
      //   41: invokevirtual 62	javolution/util/stripped/FastCollection:toArray	()[Ljava/lang/Object;
      //   44: invokespecial 68	javolution/util/stripped/FastCollection$Shared$CollectionArrayIterator:<init>	(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
      //   47: astore_2
      //   48: goto -20 -> 28
      //   51: astore_1
      //   52: aload_0
      //   53: monitorexit
      //   54: aload_1
      //   55: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	56	0	this	Shared
      //   51	4	1	localObject1	Object
      //   27	21	2	localObject2	Object
      // Exception table:
      //   from	to	target	type
      //   2	28	51	finally
      //   32	48	51	finally
    }
    
    public boolean remove(Object paramObject)
    {
      try
      {
        boolean bool = FastCollection.this.remove(paramObject);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean removeAll(Collection paramCollection)
    {
      try
      {
        boolean bool = FastCollection.this.removeAll(paramCollection);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean retainAll(Collection paramCollection)
    {
      try
      {
        boolean bool = FastCollection.this.retainAll(paramCollection);
        return bool;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public int size()
    {
      try
      {
        int i = FastCollection.this.size();
        return i;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public Object[] toArray()
    {
      try
      {
        Object[] arrayOfObject = FastCollection.this.toArray();
        return arrayOfObject;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public Object[] toArray(Object[] paramArrayOfObject)
    {
      try
      {
        Object[] arrayOfObject = FastCollection.this.toArray(paramArrayOfObject);
        return arrayOfObject;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public String toString()
    {
      try
      {
        String str = FastCollection.this.toString();
        return str;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    private class CollectionArrayIterator
      implements Iterator
    {
      private final Object[] _elements;
      private int _index;
      private Object _next;
      
      public CollectionArrayIterator(Object[] paramArrayOfObject)
      {
        this._elements = paramArrayOfObject;
      }
      
      public boolean hasNext()
      {
        return this._index < this._elements.length;
      }
      
      public Object next()
      {
        Object[] arrayOfObject = this._elements;
        int i = this._index;
        this._index = (i + 1);
        Object localObject = arrayOfObject[i];
        this._next = localObject;
        return localObject;
      }
      
      public void remove()
      {
        if (this._next == null) {
          throw new IllegalStateException();
        }
        FastCollection.Shared.this.remove(this._next);
        this._next = null;
      }
    }
    
    private class ListArrayIterator
      implements Iterator
    {
      private final Object[] _elements;
      private int _index;
      private int _removed;
      
      public ListArrayIterator(Object[] paramArrayOfObject)
      {
        this._elements = paramArrayOfObject;
      }
      
      public boolean hasNext()
      {
        return this._index < this._elements.length;
      }
      
      public Object next()
      {
        Object[] arrayOfObject = this._elements;
        int i = this._index;
        this._index = (i + 1);
        return arrayOfObject[i];
      }
      
      public void remove()
      {
        if (this._index == 0) {
          throw new IllegalStateException();
        }
        if (this._elements[(-1 + this._index)] == FastCollection.NULL) {
          throw new IllegalStateException();
        }
        this._elements[(-1 + this._index)] = FastCollection.NULL;
        this._removed = (1 + this._removed);
        synchronized (FastCollection.Shared.this)
        {
          ((List)FastCollection.this).remove(this._index - this._removed);
          return;
        }
      }
    }
  }
  
  class Unmodifiable
    extends FastCollection
    implements List, Set
  {
    Unmodifiable() {}
    
    public void add(int paramInt, Object paramObject)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public boolean add(Object paramObject)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public boolean addAll(int paramInt, Collection paramCollection)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public boolean contains(Object paramObject)
    {
      return FastCollection.this.contains(paramObject);
    }
    
    public boolean containsAll(Collection paramCollection)
    {
      return FastCollection.this.containsAll(paramCollection);
    }
    
    public void delete(FastCollection.Record paramRecord)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public Object get(int paramInt)
    {
      return ((List)FastCollection.this).get(paramInt);
    }
    
    public FastComparator getValueComparator()
    {
      return FastCollection.this.getValueComparator();
    }
    
    public FastCollection.Record head()
    {
      return FastCollection.this.head();
    }
    
    public int indexOf(Object paramObject)
    {
      return ((List)FastCollection.this).indexOf(paramObject);
    }
    
    public int lastIndexOf(Object paramObject)
    {
      return ((List)FastCollection.this).lastIndexOf(paramObject);
    }
    
    public ListIterator listIterator()
    {
      throw new UnsupportedOperationException("List iterator not supported for unmodifiable collection");
    }
    
    public ListIterator listIterator(int paramInt)
    {
      throw new UnsupportedOperationException("List iterator not supported for unmodifiable collection");
    }
    
    public Object remove(int paramInt)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public Object set(int paramInt, Object paramObject)
    {
      throw new UnsupportedOperationException("Unmodifiable");
    }
    
    public int size()
    {
      return FastCollection.this.size();
    }
    
    public List subList(int paramInt1, int paramInt2)
    {
      throw new UnsupportedOperationException("Sub-List not supported for unmodifiable collection");
    }
    
    public FastCollection.Record tail()
    {
      return FastCollection.this.tail();
    }
    
    public Object valueOf(FastCollection.Record paramRecord)
    {
      return FastCollection.this.valueOf(paramRecord);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/javolution/util/stripped/FastCollection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */