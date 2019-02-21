package com.belkin.rules.utils;

import java.util.Comparator;

public class ScheduleStringActionComparator
  implements Comparator<ScheduleStringAction>
{
  public int compare(ScheduleStringAction paramScheduleStringAction1, ScheduleStringAction paramScheduleStringAction2)
  {
    return paramScheduleStringAction1.getTime() - paramScheduleStringAction2.getTime();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/ScheduleStringActionComparator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */