package com.localytics.android;

import java.math.BigDecimal;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

final class MarketingCondition
{
  private final String mName;
  private final Opt mOpt;
  private String mPkgName;
  private final Vector<String> mValues;
  
  MarketingCondition(String paramString1, String paramString2, Vector<String> paramVector)
  {
    this.mName = paramString1;
    this.mOpt = stringToOperator(paramString2);
    this.mValues = paramVector;
  }
  
  private boolean isSatisfiedByNumber(String paramString)
  {
    BigDecimal localBigDecimal = new BigDecimal(paramString);
    int i = localBigDecimal.compareTo(new BigDecimal((String)this.mValues.get(0)));
    int j;
    if (this.mValues.size() > 1)
    {
      j = localBigDecimal.compareTo(new BigDecimal((String)this.mValues.get(1)));
      switch (this.mOpt)
      {
      }
    }
    Iterator localIterator;
    do
    {
      while (!localIterator.hasNext())
      {
        return false;
        j = 0;
        break;
        return i == 0;
        if (i != 0) {
          return true;
        }
        return false;
        return i > 0;
        if (i >= 0) {
          return true;
        }
        return false;
        return i < 0;
        if (i <= 0) {
          return true;
        }
        return false;
        return (i >= 0) && (j <= 0);
        localIterator = this.mValues.iterator();
      }
    } while (localBigDecimal.compareTo(new BigDecimal((String)localIterator.next())) != 0);
    return true;
  }
  
  private boolean isSatisfiedByString(String paramString)
  {
    boolean bool2;
    switch (this.mOpt)
    {
    default: 
      bool2 = isSatisfiedByNumber(paramString);
      return bool2;
    case ???: 
      return paramString.equals(this.mValues.get(0));
    case ???: 
      return !paramString.equals(this.mValues.get(0));
    }
    Iterator localIterator = this.mValues.iterator();
    do
    {
      boolean bool1 = localIterator.hasNext();
      bool2 = false;
      if (!bool1) {
        break;
      }
    } while (!paramString.equals((String)localIterator.next()));
    return true;
  }
  
  private String operatorToString(Opt paramOpt)
  {
    switch (paramOpt)
    {
    default: 
      return "INVALID OPERATOR";
    case ???: 
      return "is equal to";
    case ???: 
      return "not equal to";
    case ???: 
      return "is greater than";
    case ???: 
      return "is greater than or equal to";
    case ???: 
      return "is less than";
    case ???: 
      return "is less than or equal to";
    case ???: 
      return "is in between values";
    }
    return "is a member of the list";
  }
  
  private Opt stringToOperator(String paramString)
  {
    if (paramString.equals("eq")) {
      return Opt.EQUAL;
    }
    if (paramString.equals("neq")) {
      return Opt.NOT_EQUAL;
    }
    if (paramString.equals("gt")) {
      return Opt.GREATER_THAN;
    }
    if (paramString.equals("gte")) {
      return Opt.GREATER_THEN_OR_EQUAL;
    }
    if (paramString.equals("lt")) {
      return Opt.LESS_THAN;
    }
    if (paramString.equals("lte")) {
      return Opt.LESS_THAN_OR_EQUAL;
    }
    if (paramString.equals("btw")) {
      return Opt.BETWEEN;
    }
    if (paramString.equals("in")) {
      return Opt.IN_LIST;
    }
    return Opt.INVALID;
  }
  
  boolean isSatisfiedByAttributes(Map<String, String> paramMap)
  {
    if (paramMap == null) {
      return false;
    }
    Object localObject = paramMap.get(this.mName);
    if (localObject == null) {
      localObject = paramMap.get(this.mPkgName + ":" + this.mName);
    }
    if (localObject == null)
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = this.mName;
      Localytics.Log.w(String.format("Could not find the in-app condition %s in the attributes dictionary.", arrayOfObject2));
      return false;
    }
    if ((localObject instanceof String)) {
      return isSatisfiedByString((String)localObject);
    }
    if ((localObject instanceof Number)) {
      return isSatisfiedByNumber((String)localObject);
    }
    Object[] arrayOfObject1 = new Object[1];
    arrayOfObject1[0] = localObject.getClass().getCanonicalName();
    Localytics.Log.w(String.format("Invalid value type %s in the attributes dictionary.", arrayOfObject1));
    return false;
  }
  
  void setPackageName(String paramString)
  {
    this.mPkgName = paramString;
  }
  
  static enum Opt
  {
    static
    {
      EQUAL = new Opt("EQUAL", 1);
      NOT_EQUAL = new Opt("NOT_EQUAL", 2);
      GREATER_THAN = new Opt("GREATER_THAN", 3);
      GREATER_THEN_OR_EQUAL = new Opt("GREATER_THEN_OR_EQUAL", 4);
      LESS_THAN = new Opt("LESS_THAN", 5);
      LESS_THAN_OR_EQUAL = new Opt("LESS_THAN_OR_EQUAL", 6);
      BETWEEN = new Opt("BETWEEN", 7);
      IN_LIST = new Opt("IN_LIST", 8);
      Opt[] arrayOfOpt = new Opt[9];
      arrayOfOpt[0] = INVALID;
      arrayOfOpt[1] = EQUAL;
      arrayOfOpt[2] = NOT_EQUAL;
      arrayOfOpt[3] = GREATER_THAN;
      arrayOfOpt[4] = GREATER_THEN_OR_EQUAL;
      arrayOfOpt[5] = LESS_THAN;
      arrayOfOpt[6] = LESS_THAN_OR_EQUAL;
      arrayOfOpt[7] = BETWEEN;
      arrayOfOpt[8] = IN_LIST;
      $VALUES = arrayOfOpt;
    }
    
    private Opt() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingCondition.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */