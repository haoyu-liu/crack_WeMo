package com.almworks.sqlite4java;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public final class SQLParts
{
  private static final String[] PARAMS_STRINGS = new String[101];
  private boolean myFixed;
  private int myHash;
  private final List<String> myParts;
  private String mySql;
  
  public SQLParts()
  {
    this.myParts = new ArrayList(5);
  }
  
  public SQLParts(SQLParts paramSQLParts)
  {
    if (paramSQLParts == null) {}
    for (int i = 5;; i = paramSQLParts.myParts.size())
    {
      this.myParts = new ArrayList(i);
      if (paramSQLParts != null) {
        this.myParts.addAll(paramSQLParts.myParts);
      }
      return;
    }
  }
  
  public SQLParts(String paramString)
  {
    this.myParts = new ArrayList(1);
    append(paramString);
  }
  
  private int calcHash()
  {
    int i = 0;
    Iterator localIterator = this.myParts.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      i = i * 31 + str.hashCode();
    }
    return i;
  }
  
  private String createParamsString(int paramInt)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; i < paramInt; i++)
    {
      if (i > 0) {
        localStringBuilder.append(',');
      }
      localStringBuilder.append('?');
    }
    return localStringBuilder.toString();
  }
  
  private void dropCachedValues()
  {
    this.myHash = 0;
    this.mySql = null;
  }
  
  private String getParamsString(int paramInt)
  {
    String str1;
    if (paramInt < 1) {
      str1 = null;
    }
    do
    {
      return str1;
      if (paramInt >= PARAMS_STRINGS.length) {
        return createParamsString(paramInt);
      }
      str1 = PARAMS_STRINGS[paramInt];
    } while (str1 != null);
    String[] arrayOfString = PARAMS_STRINGS;
    String str2 = createParamsString(paramInt);
    arrayOfString[paramInt] = str2;
    return str2;
  }
  
  public SQLParts append(SQLParts paramSQLParts)
  {
    if (this.myFixed) {
      throw new IllegalStateException(String.valueOf(this));
    }
    if ((paramSQLParts != null) && (!paramSQLParts.myParts.isEmpty()))
    {
      this.myParts.addAll(paramSQLParts.myParts);
      dropCachedValues();
    }
    return this;
  }
  
  public SQLParts append(String paramString)
  {
    if (this.myFixed) {
      throw new IllegalStateException(String.valueOf(this));
    }
    if ((paramString != null) && (paramString.length() > 0))
    {
      this.myParts.add(paramString);
      dropCachedValues();
    }
    return this;
  }
  
  public SQLParts appendParams(int paramInt)
  {
    return append(getParamsString(paramInt));
  }
  
  public void clear()
  {
    if (this.myFixed) {
      throw new IllegalStateException(String.valueOf(this));
    }
    this.myParts.clear();
    dropCachedValues();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if ((paramObject == null) || (getClass() != paramObject.getClass())) {
      return false;
    }
    List localList = ((SQLParts)paramObject).myParts;
    if (this.myParts.size() != localList.size()) {
      return false;
    }
    for (int i = 0; i < this.myParts.size(); i++) {
      if (!((String)this.myParts.get(i)).equals(localList.get(i))) {
        return false;
      }
    }
    return true;
  }
  
  public SQLParts fix()
  {
    this.myFixed = true;
    return this;
  }
  
  public SQLParts getFixedParts()
  {
    if (this.myFixed) {
      return this;
    }
    return new SQLParts(this).fix();
  }
  
  public List<String> getParts()
  {
    return Collections.unmodifiableList(this.myParts);
  }
  
  public int hashCode()
  {
    if (this.myHash == 0) {
      this.myHash = calcHash();
    }
    return this.myHash;
  }
  
  public boolean isFixed()
  {
    return this.myFixed;
  }
  
  public String toString()
  {
    if (this.mySql == null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      for (int i = 0; i < this.myParts.size(); i++) {
        localStringBuilder.append((String)this.myParts.get(i));
      }
      this.mySql = localStringBuilder.toString();
    }
    return this.mySql;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLParts.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */