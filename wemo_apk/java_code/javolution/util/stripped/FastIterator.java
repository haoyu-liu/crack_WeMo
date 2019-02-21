package javolution.util.stripped;

import java.util.Iterator;
import java.util.NoSuchElementException;

final class FastIterator
  implements Iterator
{
  private FastCollection _collection;
  private FastCollection.Record _current;
  private FastCollection.Record _next;
  private FastCollection.Record _tail;
  
  public static FastIterator valueOf(FastCollection paramFastCollection)
  {
    FastIterator localFastIterator = new FastIterator();
    localFastIterator._collection = paramFastCollection;
    localFastIterator._next = paramFastCollection.head().getNext();
    localFastIterator._tail = paramFastCollection.tail();
    return localFastIterator;
  }
  
  public boolean hasNext()
  {
    return this._next != this._tail;
  }
  
  public Object next()
  {
    if (this._next == this._tail) {
      throw new NoSuchElementException();
    }
    this._current = this._next;
    this._next = this._next.getNext();
    return this._collection.valueOf(this._current);
  }
  
  public void remove()
  {
    if (this._current != null)
    {
      FastCollection.Record localRecord = this._current.getPrevious();
      this._collection.delete(this._current);
      this._current = null;
      this._next = localRecord.getNext();
      return;
    }
    throw new IllegalStateException();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/javolution/util/stripped/FastIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */