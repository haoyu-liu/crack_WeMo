package com.almworks.sqlite4java;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

public class SQLiteProfiler
{
  private static final String HEADER = "-----------------------------------------------------------------------------";
  private final Map<String, SQLStat> myStats = new HashMap();
  
  private static String formatDuration(long paramLong)
  {
    if (paramLong > 1000000000L)
    {
      Locale localLocale5 = Locale.US;
      Object[] arrayOfObject5 = new Object[1];
      arrayOfObject5[0] = Double.valueOf(paramLong / 1.0E9D);
      return String.format(localLocale5, "%.1fs", arrayOfObject5);
    }
    if (paramLong > 100000000L)
    {
      Locale localLocale4 = Locale.US;
      Object[] arrayOfObject4 = new Object[1];
      arrayOfObject4[0] = Long.valueOf(paramLong / 1000000L);
      return String.format(localLocale4, "%dms", arrayOfObject4);
    }
    if (paramLong > 10000000L)
    {
      Locale localLocale3 = Locale.US;
      Object[] arrayOfObject3 = new Object[1];
      arrayOfObject3[0] = Double.valueOf(paramLong / 1000000.0D);
      return String.format(localLocale3, "%.1fms", arrayOfObject3);
    }
    if (paramLong > 100000L)
    {
      Locale localLocale2 = Locale.US;
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Double.valueOf(paramLong / 1000000.0D);
      return String.format(localLocale2, "%.2fms", arrayOfObject2);
    }
    Locale localLocale1 = Locale.US;
    Object[] arrayOfObject1 = new Object[1];
    arrayOfObject1[0] = Double.valueOf(paramLong / 1000.0D);
    return String.format(localLocale1, "%.2fmks", arrayOfObject1);
  }
  
  private SQLStat getStat(String paramString)
  {
    SQLStat localSQLStat = (SQLStat)this.myStats.get(paramString);
    if (localSQLStat == null)
    {
      localSQLStat = new SQLStat(paramString);
      this.myStats.put(paramString, localSQLStat);
    }
    return localSQLStat;
  }
  
  public String printReport()
  {
    StringWriter localStringWriter = new StringWriter();
    printReport(new PrintWriter(localStringWriter));
    return localStringWriter.toString();
  }
  
  public void printReport(PrintWriter paramPrintWriter)
  {
    ArrayList localArrayList = new ArrayList(this.myStats.values());
    Collections.sort(localArrayList, new Comparator()
    {
      public int compare(SQLiteProfiler.SQLStat paramAnonymousSQLStat1, SQLiteProfiler.SQLStat paramAnonymousSQLStat2)
      {
        if (paramAnonymousSQLStat1.getTotalTime() < paramAnonymousSQLStat2.getTotalTime()) {
          return 1;
        }
        return -1;
      }
    });
    Iterator localIterator = localArrayList.iterator();
    while (localIterator.hasNext()) {
      ((SQLStat)localIterator.next()).printReport(paramPrintWriter);
    }
  }
  
  /* Error */
  public void printReport(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 146	java/io/FileOutputStream
    //   5: dup
    //   6: aload_1
    //   7: invokespecial 147	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   10: astore_3
    //   11: new 98	java/io/PrintWriter
    //   14: dup
    //   15: new 149	java/io/OutputStreamWriter
    //   18: dup
    //   19: aload_3
    //   20: invokespecial 152	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
    //   23: invokespecial 101	java/io/PrintWriter:<init>	(Ljava/io/Writer;)V
    //   26: astore 4
    //   28: aload_0
    //   29: aload 4
    //   31: invokevirtual 104	com/almworks/sqlite4java/SQLiteProfiler:printReport	(Ljava/io/PrintWriter;)V
    //   34: aload 4
    //   36: invokevirtual 155	java/io/PrintWriter:close	()V
    //   39: aload_3
    //   40: ifnull +63 -> 103
    //   43: aload_3
    //   44: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   47: return
    //   48: astore 9
    //   50: return
    //   51: astore 5
    //   53: aload_0
    //   54: aload 5
    //   56: invokestatic 162	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   59: aload_2
    //   60: ifnull -13 -> 47
    //   63: aload_2
    //   64: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   67: return
    //   68: astore 8
    //   70: return
    //   71: astore 6
    //   73: aload_2
    //   74: ifnull +7 -> 81
    //   77: aload_2
    //   78: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   81: aload 6
    //   83: athrow
    //   84: astore 7
    //   86: goto -5 -> 81
    //   89: astore 6
    //   91: aload_3
    //   92: astore_2
    //   93: goto -20 -> 73
    //   96: astore 5
    //   98: aload_3
    //   99: astore_2
    //   100: goto -47 -> 53
    //   103: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	104	0	this	SQLiteProfiler
    //   0	104	1	paramString	String
    //   1	99	2	localObject1	Object
    //   10	89	3	localFileOutputStream	java.io.FileOutputStream
    //   26	9	4	localPrintWriter	PrintWriter
    //   51	4	5	localIOException1	java.io.IOException
    //   96	1	5	localIOException2	java.io.IOException
    //   71	11	6	localObject2	Object
    //   89	1	6	localObject3	Object
    //   84	1	7	localIOException3	java.io.IOException
    //   68	1	8	localIOException4	java.io.IOException
    //   48	1	9	localIOException5	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   43	47	48	java/io/IOException
    //   2	11	51	java/io/IOException
    //   63	67	68	java/io/IOException
    //   2	11	71	finally
    //   53	59	71	finally
    //   77	81	84	java/io/IOException
    //   11	39	89	finally
    //   11	39	96	java/io/IOException
  }
  
  void reportExec(String paramString, long paramLong1, long paramLong2, int paramInt)
  {
    SQLStat localSQLStat = getStat(paramString);
    if (paramInt == 0) {}
    for (String str = "exec";; str = "exec:error(" + paramInt + ")")
    {
      localSQLStat.report(str, paramLong1, paramLong2);
      return;
    }
  }
  
  void reportLoadInts(boolean paramBoolean, String paramString, long paramLong1, long paramLong2, int paramInt1, int paramInt2)
  {
    SQLStat localSQLStat = getStat(paramString);
    if ((paramInt1 != 100) && (paramInt1 != 101)) {
      localSQLStat.report("loadInts:error(" + paramInt1 + ")", paramLong1, paramLong2);
    }
    do
    {
      return;
      localSQLStat.report("loadInts", paramLong1, paramLong2);
    } while ((!paramBoolean) && (paramInt1 != 100));
    if (paramBoolean) {}
    for (String str = "loadInts:next";; str = "loadInts:first")
    {
      localSQLStat.report(str, paramLong1, paramLong2);
      return;
    }
  }
  
  void reportLoadLongs(boolean paramBoolean, String paramString, long paramLong1, long paramLong2, int paramInt1, int paramInt2)
  {
    SQLStat localSQLStat = getStat(paramString);
    if ((paramInt1 != 100) && (paramInt1 != 101)) {
      localSQLStat.report("loadLongs:error(" + paramInt1 + ")", paramLong1, paramLong2);
    }
    do
    {
      return;
      localSQLStat.report("loadLongs", paramLong1, paramLong2);
    } while ((!paramBoolean) && (paramInt1 != 100));
    if (paramBoolean) {}
    for (String str = "loadLongs:next";; str = "loadLongs:first")
    {
      localSQLStat.report(str, paramLong1, paramLong2);
      return;
    }
  }
  
  void reportPrepare(String paramString, long paramLong1, long paramLong2, int paramInt)
  {
    SQLStat localSQLStat = getStat(paramString);
    if (paramInt == 0) {}
    for (String str = "prepare";; str = "prepare:error(" + paramInt + ")")
    {
      localSQLStat.report(str, paramLong1, paramLong2);
      return;
    }
  }
  
  void reportStep(boolean paramBoolean, String paramString, long paramLong1, long paramLong2, int paramInt)
  {
    SQLStat localSQLStat = getStat(paramString);
    if ((paramInt != 100) && (paramInt != 101)) {
      localSQLStat.report("step:error(" + paramInt + ")", paramLong1, paramLong2);
    }
    do
    {
      return;
      localSQLStat.report("step", paramLong1, paramLong2);
    } while ((!paramBoolean) && (paramInt != 100));
    if (paramBoolean) {}
    for (String str = "step:next";; str = "step:first")
    {
      localSQLStat.report(str, paramLong1, paramLong2);
      return;
    }
  }
  
  private static class SQLStat
  {
    private final String mySQL;
    private final Map<String, SQLiteProfiler.Stat> myStats = new TreeMap();
    
    public SQLStat(String paramString)
    {
      this.mySQL = paramString;
    }
    
    private void addLeftColumn(StringBuilder paramStringBuilder, String paramString, int paramInt)
    {
      paramStringBuilder.append("    ");
      paramStringBuilder.append(paramString);
      for (int i = paramInt + 4 - paramStringBuilder.length(); i > 0; i--) {
        paramStringBuilder.append(' ');
      }
      paramStringBuilder.append("   ");
    }
    
    public String getSQL()
    {
      return this.mySQL;
    }
    
    public long getTotalTime()
    {
      long l = 0L;
      Iterator localIterator = this.myStats.values().iterator();
      while (localIterator.hasNext()) {
        l += SQLiteProfiler.Stat.access$100((SQLiteProfiler.Stat)localIterator.next());
      }
      return l;
    }
    
    public void printReport(PrintWriter paramPrintWriter)
    {
      paramPrintWriter.println("-----------------------------------------------------------------------------");
      paramPrintWriter.println(this.mySQL);
      paramPrintWriter.println("-----------------------------------------------------------------------------");
      int i = "total time".length();
      Iterator localIterator1 = this.myStats.keySet().iterator();
      while (localIterator1.hasNext()) {
        i = Math.max(i, ((String)localIterator1.next()).length());
      }
      StringBuilder localStringBuilder = new StringBuilder();
      addLeftColumn(localStringBuilder, "total time", i);
      localStringBuilder.append(SQLiteProfiler.formatDuration(getTotalTime()));
      paramPrintWriter.println(localStringBuilder.toString());
      Iterator localIterator2 = this.myStats.entrySet().iterator();
      while (localIterator2.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator2.next();
        localStringBuilder.setLength(0);
        addLeftColumn(localStringBuilder, (String)localEntry.getKey(), i);
        SQLiteProfiler.Stat localStat = (SQLiteProfiler.Stat)localEntry.getValue();
        localStringBuilder.append("total:").append(SQLiteProfiler.formatDuration(localStat.getTotalNanos())).append(' ');
        localStringBuilder.append("count:").append(localStat.getTotalCount()).append(' ');
        localStringBuilder.append("min|avg|max:").append(SQLiteProfiler.formatDuration(localStat.getMinNanos())).append('|').append(SQLiteProfiler.formatDuration(localStat.getAvgNanos())).append('|').append(SQLiteProfiler.formatDuration(localStat.getMaxNanos())).append(' ');
        localStringBuilder.append("freq:").append(localStat.getFrequency());
        paramPrintWriter.println(localStringBuilder.toString());
      }
      paramPrintWriter.println();
    }
    
    public void report(String paramString, long paramLong1, long paramLong2)
    {
      SQLiteProfiler.Stat localStat = (SQLiteProfiler.Stat)this.myStats.get(paramString);
      if (localStat == null)
      {
        localStat = new SQLiteProfiler.Stat(null);
        this.myStats.put(paramString, localStat);
      }
      localStat.report(paramLong1, paramLong2);
    }
  }
  
  private static class Stat
  {
    private long myFirstTime;
    private long myLastTime;
    private long myMaxNanos = -1L;
    private long myMinNanos = -1L;
    private int myTotalCount;
    private long myTotalNanos;
    
    public long getAvgNanos()
    {
      if (this.myTotalCount > 0) {
        return this.myTotalNanos / this.myTotalCount;
      }
      return 0L;
    }
    
    public String getFrequency()
    {
      if (this.myTotalCount < 10) {
        return "-";
      }
      long l = (this.myLastTime - this.myFirstTime) / this.myTotalCount;
      if (l == 0L) {
        return "-";
      }
      return "1/" + SQLiteProfiler.formatDuration(1000000L * l);
    }
    
    public long getMaxNanos()
    {
      return this.myMaxNanos;
    }
    
    public long getMinNanos()
    {
      return this.myMinNanos;
    }
    
    public int getTotalCount()
    {
      return this.myTotalCount;
    }
    
    public long getTotalNanos()
    {
      return this.myTotalNanos;
    }
    
    public void report(long paramLong1, long paramLong2)
    {
      long l = paramLong2 - paramLong1;
      if (l < 0L) {}
      do
      {
        return;
        this.myTotalCount = (1 + this.myTotalCount);
        this.myTotalNanos = (l + this.myTotalNanos);
        if ((this.myMinNanos < 0L) || (l < this.myMinNanos)) {
          this.myMinNanos = l;
        }
        if ((this.myMaxNanos < 0L) || (l > this.myMaxNanos)) {
          this.myMaxNanos = l;
        }
        this.myLastTime = System.currentTimeMillis();
      } while (this.myFirstTime != 0L);
      this.myFirstTime = this.myLastTime;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteProfiler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */