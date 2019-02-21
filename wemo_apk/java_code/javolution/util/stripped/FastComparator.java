package javolution.util.stripped;

import java.io.ObjectStreamException;
import java.util.Comparator;

public abstract class FastComparator<T>
  implements Comparator<T>
{
  public static final FastComparator<Object> DEFAULT;
  public static final FastComparator<Object> DIRECT;
  public static final FastComparator<Object> IDENTITY = new Identity(null);
  public static final FastComparator<CharSequence> LEXICAL = new Lexical(null);
  public static final FastComparator<Object> REHASH;
  public static final FastComparator<String> STRING;
  public static boolean _Rehash = ;
  
  static
  {
    DEFAULT = new Default(null);
    DIRECT = new Direct(null);
    REHASH = new Rehash(null);
    STRING = new StringComparator(null);
  }
  
  private static boolean isPoorSystemHash()
  {
    boolean[] arrayOfBoolean = new boolean[64];
    for (int i = 0; i < arrayOfBoolean.length; i++) {
      arrayOfBoolean[(new Object().hashCode() & -1 + arrayOfBoolean.length)] = true;
    }
    int j = 0;
    int k = 0;
    if (k < arrayOfBoolean.length)
    {
      int m = k + 1;
      if (arrayOfBoolean[k] != 0) {}
      for (int n = 1;; n = 0)
      {
        j += n;
        k = m;
        break;
      }
    }
    return j < arrayOfBoolean.length >> 2;
  }
  
  public abstract boolean areEqual(T paramT1, T paramT2);
  
  public abstract int compare(T paramT1, T paramT2);
  
  public abstract int hashCodeOf(T paramT);
  
  private static final class Default<T>
    extends FastComparator<T>
  {
    public boolean areEqual(T paramT1, T paramT2)
    {
      if (paramT1 == null) {
        if (paramT2 != null) {}
      }
      while ((paramT1 == paramT2) || (paramT1.equals(paramT2)))
      {
        return true;
        return false;
      }
      return false;
    }
    
    public int compare(T paramT1, T paramT2)
    {
      return ((Comparable)paramT1).compareTo(paramT2);
    }
    
    public int hashCodeOf(T paramT)
    {
      if (paramT == null) {
        return 0;
      }
      if (_Rehash) {
        return REHASH.hashCodeOf(paramT);
      }
      return paramT.hashCode();
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return DEFAULT;
    }
    
    public String toString()
    {
      return "Default";
    }
  }
  
  private static final class Direct<T>
    extends FastComparator<T>
  {
    public boolean areEqual(T paramT1, T paramT2)
    {
      if (paramT1 == null) {
        if (paramT2 != null) {}
      }
      while ((paramT1 == paramT2) || (paramT1.equals(paramT2)))
      {
        return true;
        return false;
      }
      return false;
    }
    
    public int compare(T paramT1, T paramT2)
    {
      return ((Comparable)paramT1).compareTo(paramT2);
    }
    
    public int hashCodeOf(T paramT)
    {
      if (paramT == null) {
        return 0;
      }
      return paramT.hashCode();
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return DIRECT;
    }
    
    public String toString()
    {
      return "Direct";
    }
  }
  
  private static final class Identity
    extends FastComparator
  {
    public boolean areEqual(Object paramObject1, Object paramObject2)
    {
      return paramObject1 == paramObject2;
    }
    
    public int compare(Object paramObject1, Object paramObject2)
    {
      return ((Comparable)paramObject1).compareTo(paramObject2);
    }
    
    public int hashCodeOf(Object paramObject)
    {
      int i = System.identityHashCode(paramObject);
      if (!_Rehash) {
        return i;
      }
      int j = i + (0xFFFFFFFF ^ i << 9);
      int k = j ^ j >>> 14;
      int m = k + (k << 4);
      return m ^ m >>> 10;
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return IDENTITY;
    }
    
    public String toString()
    {
      return "Identity";
    }
  }
  
  private static final class Lexical
    extends FastComparator
  {
    public boolean areEqual(Object paramObject1, Object paramObject2)
    {
      boolean bool1 = true;
      boolean bool2;
      if (((paramObject1 instanceof String)) && ((paramObject2 instanceof String))) {
        bool2 = paramObject1.equals(paramObject2);
      }
      label131:
      label238:
      CharSequence localCharSequence1;
      CharSequence localCharSequence2;
      int i;
      int j;
      do
      {
        CharSequence localCharSequence3;
        String str1;
        int i2;
        int i3;
        do
        {
          CharSequence localCharSequence4;
          String str2;
          int i8;
          int i9;
          do
          {
            return bool2;
            if ((!(paramObject1 instanceof CharSequence)) || (!(paramObject2 instanceof String))) {
              break;
            }
            localCharSequence4 = (CharSequence)paramObject1;
            str2 = (String)paramObject2;
            i8 = str2.length();
            i9 = localCharSequence4.length();
            bool2 = false;
          } while (i9 != i8);
          int i12;
          for (int i10 = 0;; i10 = i12)
          {
            if (i10 >= i8) {
              break label131;
            }
            int i11 = str2.charAt(i10);
            i12 = i10 + 1;
            int i13 = localCharSequence4.charAt(i10);
            bool2 = false;
            if (i11 != i13) {
              break;
            }
          }
          return bool1;
          if ((!(paramObject1 instanceof String)) || (!(paramObject2 instanceof CharSequence))) {
            break;
          }
          localCharSequence3 = (CharSequence)paramObject2;
          str1 = (String)paramObject1;
          i2 = str1.length();
          i3 = localCharSequence3.length();
          bool2 = false;
        } while (i3 != i2);
        int i6;
        for (int i4 = 0;; i4 = i6)
        {
          if (i4 >= i2) {
            break label238;
          }
          int i5 = str1.charAt(i4);
          i6 = i4 + 1;
          int i7 = localCharSequence3.charAt(i4);
          bool2 = false;
          if (i5 != i7) {
            break;
          }
        }
        return bool1;
        if ((paramObject1 == null) || (paramObject2 == null))
        {
          if (paramObject1 == paramObject2) {}
          for (;;)
          {
            return bool1;
            bool1 = false;
          }
        }
        localCharSequence1 = (CharSequence)paramObject1;
        localCharSequence2 = (CharSequence)paramObject2;
        i = localCharSequence1.length();
        j = localCharSequence2.length();
        bool2 = false;
      } while (j != i);
      int n;
      for (int k = 0;; k = n)
      {
        if (k >= i) {
          return bool1;
        }
        int m = localCharSequence1.charAt(k);
        n = k + 1;
        int i1 = localCharSequence2.charAt(k);
        bool2 = false;
        if (m != i1) {
          break;
        }
      }
      return bool1;
    }
    
    public int compare(Object paramObject1, Object paramObject2)
    {
      if ((paramObject1 instanceof String))
      {
        if ((paramObject2 instanceof String)) {
          return ((String)paramObject1).compareTo((String)paramObject2);
        }
        String str = (String)paramObject1;
        CharSequence localCharSequence3 = (CharSequence)paramObject2;
        int i2 = Math.min(str.length(), localCharSequence3.length());
        int i6;
        for (int i3 = 0;; i3 = i6)
        {
          int i4 = i2 - 1;
          if (i2 == 0) {
            break;
          }
          int i5 = str.charAt(i3);
          i6 = i3 + 1;
          int i7 = localCharSequence3.charAt(i3);
          if (i5 != i7) {
            return i5 - i7;
          }
          i2 = i4;
        }
        return str.length() - localCharSequence3.length();
      }
      if ((paramObject2 instanceof String)) {
        return -compare(paramObject2, paramObject1);
      }
      CharSequence localCharSequence1 = (CharSequence)paramObject1;
      CharSequence localCharSequence2 = (CharSequence)paramObject2;
      int i = Math.min(localCharSequence1.length(), localCharSequence2.length());
      int n;
      for (int j = 0;; j = n)
      {
        int k = i - 1;
        if (i == 0) {
          break;
        }
        int m = localCharSequence1.charAt(j);
        n = j + 1;
        int i1 = localCharSequence2.charAt(j);
        if (m != i1) {
          return m - i1;
        }
        i = k;
      }
      return localCharSequence1.length() - localCharSequence2.length();
    }
    
    public int hashCodeOf(Object paramObject)
    {
      int i;
      if (paramObject == null) {
        i = 0;
      }
      for (;;)
      {
        return i;
        if ((paramObject instanceof String)) {
          return paramObject.hashCode();
        }
        CharSequence localCharSequence = (CharSequence)paramObject;
        i = 0;
        int j = localCharSequence.length();
        int n;
        for (int k = 0; k < j; k = n)
        {
          int m = i * 31;
          n = k + 1;
          i = m + localCharSequence.charAt(k);
        }
      }
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return LEXICAL;
    }
    
    public String toString()
    {
      return "Lexical";
    }
  }
  
  private static final class Rehash<T>
    extends FastComparator<T>
  {
    public boolean areEqual(T paramT1, T paramT2)
    {
      if (paramT1 == null) {
        if (paramT2 != null) {}
      }
      while ((paramT1 == paramT2) || (paramT1.equals(paramT2)))
      {
        return true;
        return false;
      }
      return false;
    }
    
    public int compare(T paramT1, T paramT2)
    {
      return ((Comparable)paramT1).compareTo(paramT2);
    }
    
    public int hashCodeOf(T paramT)
    {
      if (paramT == null) {
        return 0;
      }
      int i = paramT.hashCode();
      int j = i + (0xFFFFFFFF ^ i << 9);
      int k = j ^ j >>> 14;
      int m = k + (k << 4);
      return m ^ m >>> 10;
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return REHASH;
    }
    
    public String toString()
    {
      return "Rehash";
    }
  }
  
  private static final class StringComparator
    extends FastComparator
  {
    public boolean areEqual(Object paramObject1, Object paramObject2)
    {
      if (paramObject1 == null) {
        if (paramObject2 != null) {}
      }
      while ((paramObject1 == paramObject2) || (paramObject1.equals(paramObject2)))
      {
        return true;
        return false;
      }
      return false;
    }
    
    public int compare(Object paramObject1, Object paramObject2)
    {
      return ((String)paramObject1).compareTo((String)paramObject2);
    }
    
    public int hashCodeOf(Object paramObject)
    {
      if (paramObject == null) {}
      String str;
      int i;
      do
      {
        return 0;
        str = (String)paramObject;
        i = str.length();
      } while (i == 0);
      return str.charAt(0) + '\037' * str.charAt(i - 1) + 'ϱ' * str.charAt(i >> 1) + '殿' * str.charAt(i >> 2) + 73408859 * str.charAt(i - 1 - (i >> 2));
    }
    
    public Object readResolve()
      throws ObjectStreamException
    {
      return STRING;
    }
    
    public String toString()
    {
      return "String";
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/javolution/util/stripped/FastComparator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */