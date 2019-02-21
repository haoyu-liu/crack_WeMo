package javolution.util.stripped;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.logging.Logger;

public class FastMap<K, V>
  implements Map<K, V>
{
  private static final int B0 = 4;
  private static final int B1 = 10;
  private static final int B2 = 6;
  private static final int C0 = 16;
  private static final int C1 = 1024;
  private static final int C2 = 64;
  private static final Entry[] NULL_ENTRIES = new Entry['Ѐ'];
  static volatile int ONE_VOLATILE = 1;
  public static final Logger logger = Logger.getLogger("javolution.util");
  private static final long serialVersionUID = 1L;
  private transient Entry<K, V>[] _entries;
  private transient int _entryCount;
  private transient FastMap<K, V>.EntrySet _entrySet;
  private transient Entry<K, V> _head;
  private transient boolean _isDirectKeyComparator;
  private transient boolean _isShared;
  private transient FastComparator _keyComparator;
  private transient FastMap<K, V>.KeySet _keySet;
  private transient int _keyShift;
  private transient int _nullCount;
  private transient FastMap[] _subMaps;
  private transient Entry<K, V> _tail;
  private transient Map<K, V> _unmodifiable;
  private transient boolean _useSubMaps;
  private transient FastComparator _valueComparator;
  private transient FastMap<K, V>.Values _values;
  
  public FastMap()
  {
    this(4);
  }
  
  public FastMap(int paramInt)
  {
    setKeyComparator(FastComparator.DEFAULT);
    setValueComparator(FastComparator.DEFAULT);
    setup(paramInt);
  }
  
  public FastMap(Map<? extends K, ? extends V> paramMap)
  {
    this(paramMap.size());
    putAll(paramMap);
  }
  
  private FastMap(Entry[] paramArrayOfEntry)
  {
    this._entries = paramArrayOfEntry;
  }
  
  private void clearShared()
  {
    try
    {
      Entry.access$002(this._head, this._tail);
      Entry.access$102(this._tail, this._head);
      this._entries = ((Entry[])new Entry[16]);
      if (this._useSubMaps)
      {
        this._useSubMaps = false;
        this._subMaps = newSubMaps(16);
      }
      this._entryCount = 0;
      this._nullCount = 0;
      return;
    }
    finally {}
  }
  
  private void clearTables()
  {
    if (this._useSubMaps)
    {
      int j;
      for (int i = 0; i < 64; i = j)
      {
        FastMap[] arrayOfFastMap = this._subMaps;
        j = i + 1;
        arrayOfFastMap[i].clearTables();
      }
      this._useSubMaps = false;
    }
    reset(this._entries);
    this._nullCount = 0;
    this._entryCount = 0;
  }
  
  private void copyEntries(Object[] paramArrayOfObject, Entry[] paramArrayOfEntry, int paramInt)
  {
    int i = -1 + paramArrayOfEntry.length;
    int j = 0;
    for (;;)
    {
      int k;
      if (j < paramInt)
      {
        k = j + 1;
        Entry localEntry = (Entry)paramArrayOfObject[j];
        if (localEntry != null)
        {
          if (localEntry == Entry.NULL)
          {
            j = k;
            continue;
          }
          for (int m = localEntry._keyHash >> this._keyShift;; m++) {
            if (paramArrayOfEntry[(m & i)] == null)
            {
              paramArrayOfEntry[(m & i)] = localEntry;
              j = k;
              break;
            }
          }
        }
      }
      else
      {
        return;
      }
      j = k;
    }
  }
  
  private void createNewEntries()
  {
    Object localObject = this._tail;
    for (int i = 0; i < 8; i++)
    {
      Entry localEntry = newEntry();
      Entry.access$102(localEntry, (Entry)localObject);
      Entry.access$002((Entry)localObject, localEntry);
      localObject = localEntry;
    }
  }
  
  private int getCapacity()
  {
    int i = 0;
    Entry localEntry = this._head;
    for (;;)
    {
      localEntry = localEntry._next;
      if (localEntry == null) {
        break;
      }
      i++;
    }
    return i - 1;
  }
  
  private final Entry getEntry(Object paramObject, int paramInt)
  {
    FastMap localFastMap = getSubMap(paramInt);
    Entry[] arrayOfEntry = localFastMap._entries;
    int i = -1 + arrayOfEntry.length;
    int j = paramInt >> localFastMap._keyShift;
    Entry localEntry = arrayOfEntry[(j & i)];
    if (localEntry == null) {
      localEntry = null;
    }
    do
    {
      do
      {
        return localEntry;
      } while (paramObject == localEntry._key);
      if (paramInt != localEntry._keyHash) {
        break;
      }
      if (!this._isDirectKeyComparator) {
        break label91;
      }
    } while (paramObject.equals(localEntry._key));
    label91:
    while (!this._keyComparator.areEqual(paramObject, localEntry._key))
    {
      j++;
      break;
    }
    return localEntry;
  }
  
  private int getMaximumDistance()
  {
    int i = 0;
    if (this._useSubMaps)
    {
      for (int m = 0; m < 64; m++) {
        i = Math.max(i, this._subMaps[m].getMaximumDistance());
      }
      return i;
    }
    for (int j = 0; j < this._entries.length; j++)
    {
      Entry localEntry = this._entries[j];
      if ((localEntry != null) && (localEntry != Entry.NULL))
      {
        int k = j - (localEntry._keyHash >> this._keyShift & -1 + this._entries.length);
        if (k < 0) {
          k += this._entries.length;
        }
        if (k > i) {
          i = k;
        }
      }
    }
    return i;
  }
  
  private final FastMap getSubMap(int paramInt)
  {
    if (this._useSubMaps) {
      this = this._subMaps[(paramInt & 0x3F)].getSubMap(paramInt >> 6);
    }
    return this;
  }
  
  private int getSubMapDepth()
  {
    if (this._useSubMaps)
    {
      int i = 0;
      for (int j = 0; j < 64; j++) {
        i = Math.max(i, this._subMaps[j].getSubMapDepth());
      }
      return i + 1;
    }
    return 0;
  }
  
  private long getSumDistance()
  {
    long l = 0L;
    if (this._useSubMaps)
    {
      for (int k = 0; k < 64; k++) {
        l += this._subMaps[k].getSumDistance();
      }
      return l;
    }
    for (int i = 0; i < this._entries.length; i++)
    {
      Entry localEntry = this._entries[i];
      if ((localEntry != null) && (localEntry != Entry.NULL))
      {
        int j = i - (localEntry._keyHash >> this._keyShift & -1 + this._entries.length);
        if (j < 0) {
          j += this._entries.length;
        }
        l += j;
      }
    }
    return l;
  }
  
  private int getTableLength()
  {
    if (this._useSubMaps)
    {
      i = 0;
      for (int j = 0; j < 64; j++) {
        i += this._subMaps[j].getTableLength();
      }
    }
    int i = this._entries.length;
    return i;
  }
  
  private void mapEntry(Entry paramEntry)
  {
    int i = -1 + this._entries.length;
    for (int j = paramEntry._keyHash >> this._keyShift;; j++) {
      if (this._entries[(j & i)] == null)
      {
        this._entries[(j & i)] = paramEntry;
        this._entryCount = (1 + this._entryCount);
        return;
      }
    }
  }
  
  public static <K, V> FastMap<K, V> newInstance()
  {
    return new FastMap();
  }
  
  private FastMap[] newSubMaps(int paramInt)
  {
    FastMap[] arrayOfFastMap = new FastMap[64];
    for (int i = 0; i < 64; i++)
    {
      FastMap localFastMap = new FastMap(new Entry[paramInt]);
      localFastMap._keyShift = (6 + this._keyShift);
      arrayOfFastMap[i] = localFastMap;
    }
    return arrayOfFastMap;
  }
  
  private final Object put(Object paramObject1, Object paramObject2, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    FastMap localFastMap = getSubMap(paramInt);
    Entry[] arrayOfEntry = localFastMap._entries;
    int i = -1 + arrayOfEntry.length;
    int j = -1;
    int k = paramInt >> localFastMap._keyShift;
    Object localObject1 = arrayOfEntry[(k & i)];
    if (localObject1 == null)
    {
      if (j < 0) {
        j = k & i;
      }
      if (!paramBoolean1) {}
    }
    else
    {
      for (;;)
      {
        try
        {
          localObject1 = put(paramObject1, paramObject2, paramInt, false, paramBoolean2, paramBoolean3);
          return localObject1;
        }
        finally {}
        if (localObject1 == Entry.NULL)
        {
          if (j < 0) {
            j = k & i;
          }
          k++;
          break;
        }
        if (paramObject1 != ((Entry)localObject1)._key)
        {
          if (paramInt != ((Entry)localObject1)._keyHash) {
            continue;
          }
          if (this._isDirectKeyComparator) {
            if (!paramObject1.equals(((Entry)localObject1)._key)) {
              continue;
            }
          }
        }
        else
        {
          if (!paramBoolean2) {
            continue;
          }
          if (paramBoolean3) {
            continue;
          }
          return ((Entry)localObject1)._value;
        }
        if (this._keyComparator.areEqual(paramObject1, ((Entry)localObject1)._key))
        {
          continue;
          Object localObject2 = ((Entry)localObject1)._value;
          Entry.access$202((Entry)localObject1, paramObject2);
          if (!paramBoolean3) {
            return localObject2;
          }
        }
      }
    }
    if (!this._isShared)
    {
      localObject1 = this._tail;
      Entry.access$302((Entry)localObject1, paramObject1);
      Entry.access$202((Entry)localObject1, paramObject2);
      Entry.access$402((Entry)localObject1, paramInt);
      if (((Entry)localObject1)._next == null) {
        createNewEntries();
      }
      arrayOfEntry[j] = localObject1;
      localFastMap._entryCount += ONE_VOLATILE;
      this._tail = this._tail._next;
    }
    for (;;)
    {
      if (localFastMap._entryCount + localFastMap._nullCount > arrayOfEntry.length >> 1) {
        localFastMap.resizeTable(this._isShared);
      }
      if (paramBoolean3) {
        break;
      }
      return null;
      if (this._tail._next == null) {
        createNewEntries();
      }
      localObject1 = this._tail._next;
      Entry.access$002(this._tail, ((Entry)localObject1)._next);
      Entry.access$302((Entry)localObject1, paramObject1);
      Entry.access$202((Entry)localObject1, paramObject2);
      Entry.access$402((Entry)localObject1, paramInt);
      Entry.access$002((Entry)localObject1, this._tail);
      Entry.access$102((Entry)localObject1, this._tail._previous);
      arrayOfEntry[j] = localObject1;
      localFastMap._entryCount += ONE_VOLATILE;
      Entry.access$102(((Entry)localObject1)._next, (Entry)localObject1);
      Entry.access$002(((Entry)localObject1)._previous, (Entry)localObject1);
    }
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    setKeyComparator((FastComparator)paramObjectInputStream.readObject());
    setValueComparator((FastComparator)paramObjectInputStream.readObject());
    this._isShared = paramObjectInputStream.readBoolean();
    int i = paramObjectInputStream.readInt();
    setup(i);
    for (int j = 0; j < i; j++) {
      put(paramObjectInputStream.readObject(), paramObjectInputStream.readObject());
    }
  }
  
  private final Object remove(Object paramObject, int paramInt, boolean paramBoolean)
  {
    FastMap localFastMap = getSubMap(paramInt);
    Entry[] arrayOfEntry = localFastMap._entries;
    int i = -1 + arrayOfEntry.length;
    int j = paramInt >> localFastMap._keyShift;
    Entry localEntry1 = arrayOfEntry[(j & i)];
    Object localObject1;
    if (localEntry1 == null) {
      localObject1 = null;
    }
    label115:
    label131:
    Entry localEntry2;
    do
    {
      do
      {
        return localObject1;
        if (paramObject != localEntry1._key)
        {
          if (paramInt != localEntry1._keyHash) {
            break label131;
          }
          if (!this._isDirectKeyComparator) {
            break label115;
          }
          if (!paramObject.equals(localEntry1._key)) {
            break label131;
          }
        }
        while (this._keyComparator.areEqual(paramObject, localEntry1._key))
        {
          if (!paramBoolean) {
            break;
          }
          try
          {
            Object localObject3 = remove(paramObject, paramInt, false);
            return localObject3;
          }
          finally {}
        }
        j++;
        break;
        Entry.access$002(localEntry1._previous, localEntry1._next);
        Entry.access$102(localEntry1._next, localEntry1._previous);
        arrayOfEntry[(j & i)] = Entry.NULL;
        localFastMap._nullCount = (1 + localFastMap._nullCount);
        localFastMap._entryCount = (-1 + localFastMap._entryCount);
        localObject1 = localEntry1._value;
      } while (this._isShared);
      Entry.access$302(localEntry1, null);
      Entry.access$202(localEntry1, null);
      localEntry2 = this._tail._next;
      Entry.access$102(localEntry1, this._tail);
      Entry.access$002(localEntry1, localEntry2);
      Entry.access$002(this._tail, localEntry1);
    } while (localEntry2 == null);
    Entry.access$102(localEntry2, localEntry1);
    return localObject1;
  }
  
  private static void reset(Object[] paramArrayOfObject)
  {
    int i = 0;
    while (i < paramArrayOfObject.length)
    {
      int j = Math.min(paramArrayOfObject.length - i, 1024);
      System.arraycopy(NULL_ENTRIES, 0, paramArrayOfObject, i, j);
      i += j;
    }
  }
  
  private void resizeTable(boolean paramBoolean)
  {
    int i = 1;
    int j = this._nullCount;
    this._nullCount = 0;
    if (j > this._entryCount)
    {
      if (paramBoolean)
      {
        Entry[] arrayOfEntry4 = new Entry[this._entries.length];
        copyEntries(this._entries, arrayOfEntry4, this._entries.length);
        this._entries = arrayOfEntry4;
        return;
      }
      Object[] arrayOfObject = (Object[])new Object[this._entries.length];
      System.arraycopy(this._entries, 0, arrayOfObject, 0, this._entries.length);
      reset(this._entries);
      copyEntries(arrayOfObject, this._entries, this._entries.length);
      return;
    }
    int k = this._entries.length << 1;
    if (k <= 1024)
    {
      Entry[] arrayOfEntry3 = new Entry[k];
      copyEntries(this._entries, arrayOfEntry3, this._entries.length);
      this._entries = arrayOfEntry3;
      return;
    }
    if (this._subMaps == null) {
      this._subMaps = newSubMaps(k >> 5);
    }
    int m = 0;
    for (;;)
    {
      int n;
      if (m < this._entries.length)
      {
        Entry[] arrayOfEntry1 = this._entries;
        n = m + 1;
        Entry localEntry = arrayOfEntry1[m];
        if (localEntry != null)
        {
          if (localEntry == Entry.NULL)
          {
            m = n;
            continue;
          }
          FastMap localFastMap = this._subMaps[(0x3F & localEntry._keyHash >> this._keyShift)];
          localFastMap.mapEntry(localEntry);
          if (localFastMap._entryCount + localFastMap._nullCount << 1 >= localFastMap._entries.length)
          {
            logger.warning("Unevenly distributed hash code - Degraded Preformance");
            Entry[] arrayOfEntry2 = new Entry[k];
            copyEntries(this._entries, arrayOfEntry2, this._entries.length);
            this._entries = arrayOfEntry2;
            this._subMaps = null;
            return;
          }
          m = n;
        }
      }
      else
      {
        if (paramBoolean)
        {
          reset(this._entries);
          this._nullCount = 0;
          this._entryCount = 0;
        }
        if (ONE_VOLATILE == i) {}
        for (;;)
        {
          this._useSubMaps = i;
          return;
          i = 0;
        }
      }
      m = n;
    }
  }
  
  private void setup(int paramInt)
  {
    int i = 16;
    while (i < paramInt) {
      i <<= 1;
    }
    this._entries = ((Entry[])new Entry[i << 1]);
    this._head = newEntry();
    this._tail = newEntry();
    Entry.access$002(this._head, this._tail);
    Entry.access$102(this._tail, this._head);
    Object localObject = this._tail;
    int k;
    for (int j = 0;; j = k)
    {
      k = j + 1;
      if (j >= paramInt) {
        break;
      }
      Entry localEntry = newEntry();
      Entry.access$102(localEntry, (Entry)localObject);
      Entry.access$002((Entry)localObject, localEntry);
      localObject = localEntry;
    }
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(getKeyComparator());
    paramObjectOutputStream.writeObject(getValueComparator());
    paramObjectOutputStream.writeBoolean(this._isShared);
    paramObjectOutputStream.writeInt(size());
    Entry localEntry1 = this._head;
    Entry localEntry2 = this._tail;
    for (;;)
    {
      localEntry1 = localEntry1._next;
      if (localEntry1 == localEntry2) {
        break;
      }
      paramObjectOutputStream.writeObject(localEntry1._key);
      paramObjectOutputStream.writeObject(localEntry1._value);
    }
  }
  
  public final void clear()
  {
    if (this._isShared)
    {
      clearShared();
      return;
    }
    Entry localEntry1 = this._head;
    Entry localEntry2 = this._tail;
    for (;;)
    {
      localEntry1 = localEntry1._next;
      if (localEntry1 == localEntry2) {
        break;
      }
      Entry.access$302(localEntry1, null);
      Entry.access$202(localEntry1, null);
    }
    this._tail = this._head._next;
    clearTables();
  }
  
  public final boolean containsKey(Object paramObject)
  {
    return getEntry(paramObject) != null;
  }
  
  public final boolean containsValue(Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  public final Set<Map.Entry<K, V>> entrySet()
  {
    if (this._entrySet == null) {
      this._entrySet = new EntrySet(null);
    }
    return this._entrySet;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof Map))
    {
      Map localMap = (Map)paramObject;
      return entrySet().equals(localMap.entrySet());
    }
    return false;
  }
  
  public final V get(Object paramObject)
  {
    Entry localEntry = getEntry(paramObject);
    if (localEntry != null) {
      return (V)localEntry._value;
    }
    return null;
  }
  
  public final Entry<K, V> getEntry(Object paramObject)
  {
    if (this._isDirectKeyComparator) {}
    for (int i = paramObject.hashCode();; i = this._keyComparator.hashCodeOf(paramObject)) {
      return getEntry(paramObject, i);
    }
  }
  
  public FastComparator<? super K> getKeyComparator()
  {
    return this._keyComparator;
  }
  
  public FastComparator<? super V> getValueComparator()
  {
    return this._valueComparator;
  }
  
  public int hashCode()
  {
    int i = 0;
    Entry localEntry1 = this._head;
    Entry localEntry2 = this._tail;
    for (;;)
    {
      localEntry1 = localEntry1._next;
      if (localEntry1 == localEntry2) {
        break;
      }
      i += localEntry1.hashCode();
    }
    return i;
  }
  
  public final Entry<K, V> head()
  {
    return this._head;
  }
  
  public final boolean isEmpty()
  {
    return this._head._next == this._tail;
  }
  
  public boolean isShared()
  {
    return this._isShared;
  }
  
  public final Set<K> keySet()
  {
    if (this._keySet == null) {
      this._keySet = new KeySet(null);
    }
    return this._keySet;
  }
  
  protected Entry<K, V> newEntry()
  {
    return new Entry();
  }
  
  public void printStatistics(PrintStream paramPrintStream)
  {
    long l = getSumDistance();
    int i = size();
    if (i != 0) {}
    for (int j = (int)(100L * l / i);; j = 0) {
      try
      {
        paramPrintStream.print("SIZE: " + i);
        paramPrintStream.print(", ENTRIES: " + getCapacity());
        paramPrintStream.print(", SLOTS: " + getTableLength());
        paramPrintStream.print(", USE SUB-MAPS: " + this._useSubMaps);
        paramPrintStream.print(", SUB-MAPS DEPTH: " + getSubMapDepth());
        paramPrintStream.print(", NULL COUNT: " + this._nullCount);
        paramPrintStream.print(", IS SHARED: " + this._isShared);
        paramPrintStream.print(", AVG DISTANCE: " + j + "%");
        paramPrintStream.print(", MAX DISTANCE: " + getMaximumDistance());
        paramPrintStream.println();
        return;
      }
      finally {}
    }
  }
  
  public final V put(K paramK, V paramV)
  {
    if (this._isDirectKeyComparator) {}
    for (int i = paramK.hashCode();; i = this._keyComparator.hashCodeOf(paramK)) {
      return (V)put(paramK, paramV, i, this._isShared, false, false);
    }
  }
  
  public final void putAll(Map<? extends K, ? extends V> paramMap)
  {
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      put(localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public final Entry<K, V> putEntry(K paramK, V paramV)
  {
    if (this._isDirectKeyComparator) {}
    for (int i = paramK.hashCode();; i = this._keyComparator.hashCodeOf(paramK)) {
      return (Entry)put(paramK, paramV, i, this._isShared, false, true);
    }
  }
  
  public final V putIfAbsent(K paramK, V paramV)
  {
    if (this._isDirectKeyComparator) {}
    for (int i = paramK.hashCode();; i = this._keyComparator.hashCodeOf(paramK)) {
      return (V)put(paramK, paramV, i, this._isShared, true, false);
    }
  }
  
  public final V remove(Object paramObject)
  {
    if (this._isDirectKeyComparator) {}
    for (int i = paramObject.hashCode();; i = this._keyComparator.hashCodeOf(paramObject)) {
      return (V)remove(paramObject, i, this._isShared);
    }
  }
  
  public void reset()
  {
    this._isShared = false;
    clear();
    setKeyComparator(FastComparator.DEFAULT);
    setValueComparator(FastComparator.DEFAULT);
  }
  
  public final FastMap<V, K> reverse()
  {
    FastMap localFastMap = new FastMap();
    Entry localEntry1 = this._head;
    Entry localEntry2 = this._tail;
    for (;;)
    {
      localEntry1 = localEntry1._next;
      if (localEntry1 == localEntry2) {
        break;
      }
      localFastMap.put(localEntry1._value, localEntry1._key);
    }
    return localFastMap;
  }
  
  public FastMap<K, V> setKeyComparator(FastComparator<? super K> paramFastComparator)
  {
    this._keyComparator = paramFastComparator;
    if ((paramFastComparator == FastComparator.DIRECT) || ((this._keyComparator == FastComparator.DEFAULT) && (!FastComparator._Rehash))) {}
    for (boolean bool = true;; bool = false)
    {
      this._isDirectKeyComparator = bool;
      return this;
    }
  }
  
  public FastMap<K, V> setShared(boolean paramBoolean)
  {
    this._isShared = paramBoolean;
    return this;
  }
  
  public FastMap<K, V> setValueComparator(FastComparator<? super V> paramFastComparator)
  {
    this._valueComparator = paramFastComparator;
    return this;
  }
  
  public FastMap<K, V> shared()
  {
    this._isShared = true;
    return this;
  }
  
  public final int size()
  {
    int i;
    if (!this._useSubMaps) {
      i = this._entryCount;
    }
    for (;;)
    {
      return i;
      i = 0;
      int k;
      for (int j = 0; j < this._subMaps.length; j = k)
      {
        FastMap[] arrayOfFastMap = this._subMaps;
        k = j + 1;
        i += arrayOfFastMap[j].size();
      }
    }
  }
  
  public final Entry<K, V> tail()
  {
    return this._tail;
  }
  
  public final Map<K, V> unmodifiable()
  {
    if (this._unmodifiable == null) {
      this._unmodifiable = new Unmodifiable(null);
    }
    return this._unmodifiable;
  }
  
  public final Collection<V> values()
  {
    if (this._values == null) {
      this._values = new Values(null);
    }
    return this._values;
  }
  
  public static class Entry<K, V>
    implements Map.Entry<K, V>, FastCollection.Record
  {
    public static final Entry NULL = new Entry();
    private K _key;
    private int _keyHash;
    private Entry<K, V> _next;
    private Entry<K, V> _previous;
    private V _value;
    
    public boolean equals(Object paramObject)
    {
      boolean bool1 = paramObject instanceof Map.Entry;
      boolean bool2 = false;
      if (bool1)
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        boolean bool3 = FastComparator.DEFAULT.areEqual(this._key, localEntry.getKey());
        bool2 = false;
        if (bool3)
        {
          boolean bool4 = FastComparator.DEFAULT.areEqual(this._value, localEntry.getValue());
          bool2 = false;
          if (bool4) {
            bool2 = true;
          }
        }
      }
      return bool2;
    }
    
    public final K getKey()
    {
      return (K)this._key;
    }
    
    public final Entry<K, V> getNext()
    {
      return this._next;
    }
    
    public final Entry<K, V> getPrevious()
    {
      return this._previous;
    }
    
    public final V getValue()
    {
      return (V)this._value;
    }
    
    public int hashCode()
    {
      if (this._key != null) {}
      for (int i = this._key.hashCode();; i = 0)
      {
        Object localObject = this._value;
        int j = 0;
        if (localObject != null) {
          j = this._value.hashCode();
        }
        return i ^ j;
      }
    }
    
    public final V setValue(V paramV)
    {
      Object localObject = this._value;
      this._value = paramV;
      return (V)localObject;
    }
    
    public String toString()
    {
      return this._key + "=" + this._value;
    }
  }
  
  private static final class EntryIterator
    implements Iterator
  {
    private FastMap.Entry _current;
    private FastMap _map;
    private FastMap.Entry _next;
    private FastMap.Entry _tail;
    
    public static EntryIterator valueOf(FastMap paramFastMap)
    {
      EntryIterator localEntryIterator = new EntryIterator();
      localEntryIterator._map = paramFastMap;
      localEntryIterator._next = FastMap.access$600(paramFastMap)._next;
      localEntryIterator._tail = paramFastMap._tail;
      return localEntryIterator;
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
      this._next = this._next._next;
      return this._current;
    }
    
    public void remove()
    {
      if (this._current != null)
      {
        this._next = this._current._next;
        this._map.remove(this._current._key);
        this._current = null;
        return;
      }
      throw new IllegalStateException();
    }
  }
  
  private final class EntrySet
    extends FastCollection
    implements Set
  {
    private final FastComparator _entryComparator = new FastComparator()
    {
      public boolean areEqual(Object paramAnonymousObject1, Object paramAnonymousObject2)
      {
        if (((paramAnonymousObject1 instanceof Map.Entry)) && ((paramAnonymousObject2 instanceof Map.Entry)))
        {
          localEntry1 = (Map.Entry)paramAnonymousObject1;
          localEntry2 = (Map.Entry)paramAnonymousObject2;
          if ((!FastMap.this._keyComparator.areEqual(localEntry1.getKey(), localEntry2.getKey())) || (!FastMap.this._valueComparator.areEqual(localEntry1.getValue(), localEntry2.getValue()))) {}
        }
        while ((paramAnonymousObject1 == null) && (paramAnonymousObject2 == null))
        {
          Map.Entry localEntry1;
          Map.Entry localEntry2;
          return true;
          return false;
        }
        return false;
      }
      
      public int compare(Object paramAnonymousObject1, Object paramAnonymousObject2)
      {
        return FastMap.this._keyComparator.compare(paramAnonymousObject1, paramAnonymousObject2);
      }
      
      public int hashCodeOf(Object paramAnonymousObject)
      {
        Map.Entry localEntry = (Map.Entry)paramAnonymousObject;
        return FastMap.this._keyComparator.hashCodeOf(localEntry.getKey()) + FastMap.this._valueComparator.hashCodeOf(localEntry.getValue());
      }
    };
    
    private EntrySet() {}
    
    public void clear()
    {
      FastMap.this.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      Map.Entry localEntry;
      FastMap.Entry localEntry1;
      if ((paramObject instanceof Map.Entry))
      {
        localEntry = (Map.Entry)paramObject;
        localEntry1 = FastMap.this.getEntry(localEntry.getKey());
        if (localEntry1 != null) {}
      }
      else
      {
        return false;
      }
      return FastMap.this._valueComparator.areEqual(localEntry1.getValue(), localEntry.getValue());
    }
    
    public void delete(FastCollection.Record paramRecord)
    {
      FastMap.this.remove(((FastMap.Entry)paramRecord).getKey());
    }
    
    public FastComparator getValueComparator()
    {
      return this._entryComparator;
    }
    
    public FastCollection.Record head()
    {
      return FastMap.this._head;
    }
    
    public Iterator iterator()
    {
      return FastMap.EntryIterator.valueOf(FastMap.this);
    }
    
    public int size()
    {
      return FastMap.this.size();
    }
    
    public FastCollection.Record tail()
    {
      return FastMap.this._tail;
    }
    
    public Object valueOf(FastCollection.Record paramRecord)
    {
      return (Map.Entry)paramRecord;
    }
  }
  
  private static final class KeyIterator
    implements Iterator
  {
    private FastMap.Entry _current;
    private FastMap _map;
    private FastMap.Entry _next;
    private FastMap.Entry _tail;
    
    public static KeyIterator valueOf(FastMap paramFastMap)
    {
      KeyIterator localKeyIterator = new KeyIterator();
      localKeyIterator._map = paramFastMap;
      localKeyIterator._next = FastMap.access$600(paramFastMap)._next;
      localKeyIterator._tail = paramFastMap._tail;
      return localKeyIterator;
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
      this._next = this._next._next;
      return this._current._key;
    }
    
    public void remove()
    {
      if (this._current != null)
      {
        this._next = this._current._next;
        this._map.remove(this._current._key);
        this._current = null;
        return;
      }
      throw new IllegalStateException();
    }
  }
  
  private final class KeySet
    extends FastCollection
    implements Set
  {
    private KeySet() {}
    
    public void clear()
    {
      FastMap.this.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      return FastMap.this.containsKey(paramObject);
    }
    
    public void delete(FastCollection.Record paramRecord)
    {
      FastMap.this.remove(((FastMap.Entry)paramRecord).getKey());
    }
    
    public FastComparator getValueComparator()
    {
      return FastMap.this._keyComparator;
    }
    
    public FastCollection.Record head()
    {
      return FastMap.this._head;
    }
    
    public Iterator iterator()
    {
      return FastMap.KeyIterator.valueOf(FastMap.this);
    }
    
    public boolean remove(Object paramObject)
    {
      return FastMap.this.remove(paramObject) != null;
    }
    
    public int size()
    {
      return FastMap.this.size();
    }
    
    public FastCollection.Record tail()
    {
      return FastMap.this._tail;
    }
    
    public Object valueOf(FastCollection.Record paramRecord)
    {
      return ((FastMap.Entry)paramRecord)._key;
    }
  }
  
  private final class Unmodifiable
    implements Map, Serializable
  {
    private Unmodifiable() {}
    
    public void clear()
    {
      throw new UnsupportedOperationException("Unmodifiable map");
    }
    
    public boolean containsKey(Object paramObject)
    {
      return FastMap.this.containsKey(paramObject);
    }
    
    public boolean containsValue(Object paramObject)
    {
      return FastMap.this.containsValue(paramObject);
    }
    
    public Set entrySet()
    {
      throw new UnsupportedOperationException("Direct view over unmodifiable map entries is not supported  (to prevent access to Entry.setValue(Object) method). To iterate over unmodifiable map entries, applications may use the keySet() and values() fast collection views in conjonction.");
    }
    
    public boolean equals(Object paramObject)
    {
      return FastMap.this.equals(paramObject);
    }
    
    public Object get(Object paramObject)
    {
      return FastMap.this.get(paramObject);
    }
    
    public int hashCode()
    {
      return FastMap.this.hashCode();
    }
    
    public boolean isEmpty()
    {
      return FastMap.this.isEmpty();
    }
    
    public Set keySet()
    {
      return (Set)((FastMap.KeySet)FastMap.this.keySet()).unmodifiable();
    }
    
    public Object put(Object paramObject1, Object paramObject2)
    {
      throw new UnsupportedOperationException("Unmodifiable map");
    }
    
    public void putAll(Map paramMap)
    {
      throw new UnsupportedOperationException("Unmodifiable map");
    }
    
    public Object remove(Object paramObject)
    {
      throw new UnsupportedOperationException("Unmodifiable map");
    }
    
    public int size()
    {
      return FastMap.this.size();
    }
    
    public Collection values()
    {
      return ((FastMap.Values)FastMap.this.values()).unmodifiable();
    }
  }
  
  private static final class ValueIterator
    implements Iterator
  {
    private FastMap.Entry _current;
    private FastMap _map;
    private FastMap.Entry _next;
    private FastMap.Entry _tail;
    
    public static ValueIterator valueOf(FastMap paramFastMap)
    {
      ValueIterator localValueIterator = new ValueIterator();
      localValueIterator._map = paramFastMap;
      localValueIterator._next = FastMap.access$600(paramFastMap)._next;
      localValueIterator._tail = paramFastMap._tail;
      return localValueIterator;
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
      this._next = this._next._next;
      return this._current._value;
    }
    
    public void remove()
    {
      if (this._current != null)
      {
        this._next = this._current._next;
        this._map.remove(this._current._key);
        this._current = null;
        return;
      }
      throw new IllegalStateException();
    }
  }
  
  private final class Values
    extends FastCollection
  {
    private Values() {}
    
    public void clear()
    {
      FastMap.this.clear();
    }
    
    public void delete(FastCollection.Record paramRecord)
    {
      FastMap.this.remove(((FastMap.Entry)paramRecord).getKey());
    }
    
    public FastComparator getValueComparator()
    {
      return FastMap.this._valueComparator;
    }
    
    public FastCollection.Record head()
    {
      return FastMap.this._head;
    }
    
    public Iterator iterator()
    {
      return FastMap.ValueIterator.valueOf(FastMap.this);
    }
    
    public int size()
    {
      return FastMap.this.size();
    }
    
    public FastCollection.Record tail()
    {
      return FastMap.this._tail;
    }
    
    public Object valueOf(FastCollection.Record paramRecord)
    {
      return ((FastMap.Entry)paramRecord)._value;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/javolution/util/stripped/FastMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */