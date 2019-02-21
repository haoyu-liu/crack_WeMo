package com.belkin.devices;

import android.content.Context;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.rules.db.RulesDb;
import org.json.JSONException;

public class ResetDevice
{
  private Context mContext;
  private UpnpDeviceList mUpnpDeviceList;
  private RulesDb rDB;
  
  public ResetDevice(Context paramContext)
  {
    try
    {
      this.mContext = paramContext;
      this.rDB = RulesDb.getRulesDatabase(this.mContext);
      this.mUpnpDeviceList = UpnpDeviceList.getInstance(this.mContext);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public boolean resetByUDN(String paramString)
  {
    try
    {
      ScheduleDevices localScheduleDevices = new ScheduleDevices(this.mContext);
      this.rDB.removeRulesByUDN(paramString);
      localScheduleDevices.updateDeviceSchedule(paramString);
      this.mUpnpDeviceList.sendDBDataToPlugin(this.mContext);
      boolean bool = this.mUpnpDeviceList.clearNameIconRule(paramString);
      return bool;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return false;
  }
  
  /* Error */
  public boolean resetRemote(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore 5
    //   3: new 69	com/belkin/cloud/CloudServices
    //   6: dup
    //   7: aload_0
    //   8: getfield 19	com/belkin/devices/ResetDevice:mContext	Landroid/content/Context;
    //   11: invokespecial 70	com/belkin/cloud/CloudServices:<init>	(Landroid/content/Context;)V
    //   14: aload_1
    //   15: aload_2
    //   16: aload 4
    //   18: invokevirtual 74	com/belkin/cloud/CloudServices:resetNameIconRules	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   21: pop
    //   22: aload_0
    //   23: getfield 27	com/belkin/devices/ResetDevice:rDB	Lcom/belkin/rules/db/RulesDb;
    //   26: aload_3
    //   27: invokevirtual 50	com/belkin/rules/db/RulesDb:removeRulesByUDN	(Ljava/lang/String;)V
    //   30: iconst_3
    //   31: anewarray 76	java/lang/String
    //   34: astore 8
    //   36: aload 8
    //   38: iconst_0
    //   39: sipush 5008
    //   42: invokestatic 80	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   45: aastore
    //   46: aload 8
    //   48: iconst_1
    //   49: aload 4
    //   51: aastore
    //   52: aload 8
    //   54: iconst_2
    //   55: aload_1
    //   56: aastore
    //   57: new 82	com/belkin/remoteservice/RestfulWebservice
    //   60: dup
    //   61: aload 8
    //   63: aload_0
    //   64: getfield 19	com/belkin/devices/ResetDevice:mContext	Landroid/content/Context;
    //   67: invokespecial 85	com/belkin/remoteservice/RestfulWebservice:<init>	([Ljava/lang/String;Landroid/content/Context;)V
    //   70: astore 9
    //   72: aload 9
    //   74: iconst_0
    //   75: anewarray 87	java/lang/Void
    //   78: invokevirtual 91	com/belkin/remoteservice/RestfulWebservice:execute	([Ljava/lang/Object;)Landroid/os/AsyncTask;
    //   81: invokevirtual 97	android/os/AsyncTask:get	()Ljava/lang/Object;
    //   84: pop
    //   85: aload 9
    //   87: invokevirtual 101	com/belkin/remoteservice/RestfulWebservice:getStatus	()Landroid/os/AsyncTask$Status;
    //   90: getstatic 107	android/os/AsyncTask$Status:RUNNING	Landroid/os/AsyncTask$Status;
    //   93: invokevirtual 111	android/os/AsyncTask$Status:equals	(Ljava/lang/Object;)Z
    //   96: istore 11
    //   98: iload 11
    //   100: ifeq +32 -> 132
    //   103: ldc2_w 112
    //   106: invokestatic 119	java/lang/Thread:sleep	(J)V
    //   109: goto -24 -> 85
    //   112: astore 12
    //   114: aload 12
    //   116: invokevirtual 120	java/lang/InterruptedException:printStackTrace	()V
    //   119: goto -34 -> 85
    //   122: astore 6
    //   124: aload 6
    //   126: invokevirtual 38	java/lang/Exception:printStackTrace	()V
    //   129: iconst_0
    //   130: istore 5
    //   132: iload 5
    //   134: ireturn
    //   135: astore 13
    //   137: aload 13
    //   139: invokevirtual 120	java/lang/InterruptedException:printStackTrace	()V
    //   142: goto -57 -> 85
    //   145: astore 10
    //   147: aload 10
    //   149: invokevirtual 121	java/util/concurrent/ExecutionException:printStackTrace	()V
    //   152: goto -67 -> 85
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	155	0	this	ResetDevice
    //   0	155	1	paramString1	String
    //   0	155	2	paramString2	String
    //   0	155	3	paramString3	String
    //   0	155	4	paramString4	String
    //   1	132	5	bool1	boolean
    //   122	3	6	localException	Exception
    //   34	28	8	arrayOfString	String[]
    //   70	16	9	localRestfulWebservice	com.belkin.remoteservice.RestfulWebservice
    //   145	3	10	localExecutionException	java.util.concurrent.ExecutionException
    //   96	3	11	bool2	boolean
    //   112	3	12	localInterruptedException1	InterruptedException
    //   135	3	13	localInterruptedException2	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   103	109	112	java/lang/InterruptedException
    //   3	72	122	java/lang/Exception
    //   72	85	122	java/lang/Exception
    //   85	98	122	java/lang/Exception
    //   103	109	122	java/lang/Exception
    //   114	119	122	java/lang/Exception
    //   137	142	122	java/lang/Exception
    //   147	152	122	java/lang/Exception
    //   72	85	135	java/lang/InterruptedException
    //   72	85	145	java/util/concurrent/ExecutionException
  }
  
  /* Error */
  public void resetRemoteByUDN(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 27	com/belkin/devices/ResetDevice:rDB	Lcom/belkin/rules/db/RulesDb;
    //   4: aload_2
    //   5: invokevirtual 50	com/belkin/rules/db/RulesDb:removeRulesByUDN	(Ljava/lang/String;)V
    //   8: iconst_3
    //   9: anewarray 76	java/lang/String
    //   12: astore 5
    //   14: aload 5
    //   16: iconst_0
    //   17: sipush 5008
    //   20: invokestatic 80	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   23: aastore
    //   24: aload 5
    //   26: iconst_1
    //   27: aload_3
    //   28: aastore
    //   29: aload 5
    //   31: iconst_2
    //   32: aload_1
    //   33: aastore
    //   34: new 82	com/belkin/remoteservice/RestfulWebservice
    //   37: dup
    //   38: aload 5
    //   40: aload_0
    //   41: getfield 19	com/belkin/devices/ResetDevice:mContext	Landroid/content/Context;
    //   44: invokespecial 85	com/belkin/remoteservice/RestfulWebservice:<init>	([Ljava/lang/String;Landroid/content/Context;)V
    //   47: astore 6
    //   49: aload 6
    //   51: iconst_0
    //   52: anewarray 87	java/lang/Void
    //   55: invokevirtual 91	com/belkin/remoteservice/RestfulWebservice:execute	([Ljava/lang/Object;)Landroid/os/AsyncTask;
    //   58: invokevirtual 97	android/os/AsyncTask:get	()Ljava/lang/Object;
    //   61: pop
    //   62: aload 6
    //   64: invokevirtual 101	com/belkin/remoteservice/RestfulWebservice:getStatus	()Landroid/os/AsyncTask$Status;
    //   67: getstatic 107	android/os/AsyncTask$Status:RUNNING	Landroid/os/AsyncTask$Status;
    //   70: invokevirtual 111	android/os/AsyncTask$Status:equals	(Ljava/lang/Object;)Z
    //   73: istore 8
    //   75: iload 8
    //   77: ifeq +29 -> 106
    //   80: ldc2_w 112
    //   83: invokestatic 119	java/lang/Thread:sleep	(J)V
    //   86: goto -24 -> 62
    //   89: astore 9
    //   91: aload 9
    //   93: invokevirtual 120	java/lang/InterruptedException:printStackTrace	()V
    //   96: goto -34 -> 62
    //   99: astore 4
    //   101: aload 4
    //   103: invokevirtual 38	java/lang/Exception:printStackTrace	()V
    //   106: return
    //   107: astore 10
    //   109: aload 10
    //   111: invokevirtual 120	java/lang/InterruptedException:printStackTrace	()V
    //   114: goto -52 -> 62
    //   117: astore 7
    //   119: aload 7
    //   121: invokevirtual 121	java/util/concurrent/ExecutionException:printStackTrace	()V
    //   124: goto -62 -> 62
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	127	0	this	ResetDevice
    //   0	127	1	paramString1	String
    //   0	127	2	paramString2	String
    //   0	127	3	paramString3	String
    //   99	3	4	localException	Exception
    //   12	27	5	arrayOfString	String[]
    //   47	16	6	localRestfulWebservice	com.belkin.remoteservice.RestfulWebservice
    //   117	3	7	localExecutionException	java.util.concurrent.ExecutionException
    //   73	3	8	bool	boolean
    //   89	3	9	localInterruptedException1	InterruptedException
    //   107	3	10	localInterruptedException2	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   80	86	89	java/lang/InterruptedException
    //   0	49	99	java/lang/Exception
    //   49	62	99	java/lang/Exception
    //   62	75	99	java/lang/Exception
    //   80	86	99	java/lang/Exception
    //   91	96	99	java/lang/Exception
    //   109	114	99	java/lang/Exception
    //   119	124	99	java/lang/Exception
    //   49	62	107	java/lang/InterruptedException
    //   49	62	117	java/util/concurrent/ExecutionException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/ResetDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */