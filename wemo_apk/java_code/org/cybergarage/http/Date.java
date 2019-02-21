package org.cybergarage.http;

import java.util.Calendar;
import java.util.TimeZone;

public class Date
{
  private static final String[] MONTH_STRING = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
  private static final String[] WEEK_STRING = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
  private Calendar cal;
  
  public Date(Calendar paramCalendar)
  {
    this.cal = paramCalendar;
  }
  
  public static final Date getInstance()
  {
    return new Date(Calendar.getInstance(TimeZone.getTimeZone("GMT")));
  }
  
  public static final Date getLocalInstance()
  {
    return new Date(Calendar.getInstance());
  }
  
  public static final String toDateString(int paramInt)
  {
    if (paramInt < 10) {
      return "0" + Integer.toString(paramInt);
    }
    return Integer.toString(paramInt);
  }
  
  public static final String toMonthString(int paramInt)
  {
    int i = paramInt + 0;
    if ((i >= 0) && (i < 12)) {
      return MONTH_STRING[i];
    }
    return "";
  }
  
  public static final String toTimeString(int paramInt)
  {
    String str = "";
    if (paramInt < 10) {
      str = str + "0";
    }
    return str + Integer.toString(paramInt);
  }
  
  public static final String toWeekString(int paramInt)
  {
    int i = paramInt - 1;
    if ((i >= 0) && (i < 7)) {
      return WEEK_STRING[i];
    }
    return "";
  }
  
  public Calendar getCalendar()
  {
    return this.cal;
  }
  
  public String getDateString()
  {
    Calendar localCalendar = getCalendar();
    return toWeekString(localCalendar.get(7)) + ", " + toTimeString(localCalendar.get(5)) + " " + toMonthString(localCalendar.get(2)) + " " + Integer.toString(localCalendar.get(1)) + " " + toTimeString(localCalendar.get(11)) + ":" + toTimeString(localCalendar.get(12)) + ":" + toTimeString(localCalendar.get(13)) + " GMT";
  }
  
  public int getHour()
  {
    return getCalendar().get(11);
  }
  
  public int getMinute()
  {
    return getCalendar().get(12);
  }
  
  public int getSecond()
  {
    return getCalendar().get(13);
  }
  
  public String getTimeString()
  {
    Calendar localCalendar = getCalendar();
    StringBuilder localStringBuilder = new StringBuilder().append(toDateString(localCalendar.get(11)));
    if (localCalendar.get(13) % 2 == 0) {}
    for (String str = ":";; str = " ") {
      return str + toDateString(localCalendar.get(12));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/Date.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */