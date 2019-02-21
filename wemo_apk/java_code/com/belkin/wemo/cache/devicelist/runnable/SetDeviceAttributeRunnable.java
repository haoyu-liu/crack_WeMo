package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class SetDeviceAttributeRunnable
  extends WeMoRunnable
{
  private JSONObject attributeList = null;
  private String binaryState;
  private Context context;
  private DeviceListManager devListManager;
  private DeviceInformation mDeviceInfo;
  private String udn;
  
  public SetDeviceAttributeRunnable(Context paramContext, String paramString, JSONObject paramJSONObject)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.udn = paramString;
    this.attributeList = paramJSONObject;
  }
  
  private void processResult(Boolean paramBoolean)
  {
    SDKLogUtils.infoLog("SetDeviceAttributeRunnable", "Result " + paramBoolean);
    if (paramBoolean.booleanValue())
    {
      JSONObject localJSONObject1 = this.mDeviceInfo.getAttributeList();
      Iterator localIterator = this.attributeList.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        try
        {
          JSONObject localJSONObject2 = (JSONObject)localJSONObject1.get(str);
          this.binaryState = String.valueOf(this.attributeList.opt(str));
          localJSONObject2.put("value", this.attributeList.opt(str));
          localJSONObject1.put(str, localJSONObject2);
          SDKLogUtils.infoLog(this.TAG, "WEMO-48289 deviceAttributes: " + localJSONObject1 + "; value: " + this.binaryState);
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
      this.mDeviceInfo.setAttributeList(localJSONObject1);
      this.mDeviceInfo.setBinaryState(this.binaryState);
      this.mDeviceInfo.setState(Integer.parseInt(this.binaryState));
      DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.mDeviceInfo);
      CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
      SDKLogUtils.infoLog(this.TAG, "WEMO-48289 mDeviceInfo: " + this.mDeviceInfo.toString());
    }
    DeviceListManager localDeviceListManager = this.devListManager;
    localDeviceListManager.sendNotification("set_state", Boolean.toString(paramBoolean.booleanValue()), this.mDeviceInfo.getUDN());
  }
  
  private void updateAttributeList() {}
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: iconst_1
    //   1: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   4: astore_1
    //   5: aload_0
    //   6: aload_0
    //   7: getfield 32	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:context	Landroid/content/Context;
    //   10: invokestatic 145	com/belkin/wemo/cache/data/DevicesArray:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;
    //   13: aload_0
    //   14: getfield 34	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:udn	Ljava/lang/String;
    //   17: invokevirtual 184	com/belkin/wemo/cache/data/DevicesArray:getDeviceInformation	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   20: putfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   23: aload_0
    //   24: getfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   27: ifnull +425 -> 452
    //   30: ldc 40
    //   32: new 42	java/lang/StringBuilder
    //   35: dup
    //   36: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   39: ldc -70
    //   41: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: aload_0
    //   45: getfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   48: invokevirtual 76	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   51: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   54: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   57: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   60: ldc 40
    //   62: new 42	java/lang/StringBuilder
    //   65: dup
    //   66: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   69: ldc -68
    //   71: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   74: aload_0
    //   75: getfield 22	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:attributeList	Lorg/json/JSONObject;
    //   78: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   81: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   84: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   87: iconst_1
    //   88: anewarray 93	java/lang/String
    //   91: astore_2
    //   92: aload_2
    //   93: iconst_0
    //   94: aload_0
    //   95: getfield 30	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   98: aload_0
    //   99: getfield 22	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:attributeList	Lorg/json/JSONObject;
    //   102: aload_0
    //   103: getfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   106: invokevirtual 76	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   109: invokevirtual 192	com/belkin/wemo/cache/devicelist/DeviceListManager:createAttributeList	(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;
    //   112: aastore
    //   113: ldc 40
    //   115: new 42	java/lang/StringBuilder
    //   118: dup
    //   119: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   122: ldc -62
    //   124: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: aload_2
    //   128: invokestatic 199	java/util/Arrays:toString	([Ljava/lang/Object;)Ljava/lang/String;
    //   131: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   137: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   140: aload_0
    //   141: getfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   144: astore_3
    //   145: aconst_null
    //   146: astore 4
    //   148: aload_3
    //   149: ifnull +12 -> 161
    //   152: aload_0
    //   153: getfield 70	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   156: invokevirtual 203	com/belkin/wemo/cache/data/DeviceInformation:getDevice	()Lorg/cybergarage/upnp/Device;
    //   159: astore 4
    //   161: aload 4
    //   163: ifnonnull +23 -> 186
    //   166: aload_0
    //   167: getfield 30	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   170: invokevirtual 207	com/belkin/wemo/cache/devicelist/DeviceListManager:getUpnpControl	()Lorg/cybergarage/upnp/ControlPoint;
    //   173: aload_0
    //   174: getfield 34	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:udn	Ljava/lang/String;
    //   177: invokevirtual 212	org/cybergarage/upnp/ControlPoint:getDevice	(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    //   180: astore 11
    //   182: aload 11
    //   184: astore 4
    //   186: aload 4
    //   188: ifnull +245 -> 433
    //   191: ldc 40
    //   193: ldc -42
    //   195: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   198: aload 4
    //   200: ldc -40
    //   202: invokevirtual 222	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   205: astore 6
    //   207: ldc 40
    //   209: new 42	java/lang/StringBuilder
    //   212: dup
    //   213: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   216: ldc -32
    //   218: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: aload 6
    //   223: invokevirtual 229	org/cybergarage/upnp/Action:getName	()Ljava/lang/String;
    //   226: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   232: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   235: aload_0
    //   236: getfield 30	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   239: aload 6
    //   241: getstatic 235	com/belkin/wemo/cache/devicelist/UpnpConstants:SET_ATTRIBUTE_KEYS	[Ljava/lang/String;
    //   244: aload_2
    //   245: invokevirtual 239	com/belkin/wemo/cache/devicelist/DeviceListManager:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    //   248: aload 6
    //   250: invokevirtual 242	org/cybergarage/upnp/Action:postControlAction	()Ljava/lang/String;
    //   253: astore 7
    //   255: ldc 40
    //   257: new 42	java/lang/StringBuilder
    //   260: dup
    //   261: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   264: ldc -12
    //   266: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   269: aload 7
    //   271: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   274: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   277: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   280: aload 7
    //   282: ifnonnull +81 -> 363
    //   285: iconst_0
    //   286: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   289: astore 8
    //   291: ldc 40
    //   293: new 42	java/lang/StringBuilder
    //   296: dup
    //   297: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   300: ldc -10
    //   302: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   305: aload 8
    //   307: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   310: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   313: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   316: aload_0
    //   317: aload 8
    //   319: invokespecial 248	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:processResult	(Ljava/lang/Boolean;)V
    //   322: return
    //   323: astore 9
    //   325: iconst_0
    //   326: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   329: astore 10
    //   331: ldc 40
    //   333: new 42	java/lang/StringBuilder
    //   336: dup
    //   337: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   340: ldc -6
    //   342: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   345: aload 10
    //   347: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   350: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   353: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   356: aload_0
    //   357: aload 10
    //   359: invokespecial 248	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:processResult	(Ljava/lang/Boolean;)V
    //   362: return
    //   363: new 252	org/cybergarage/xml/SetAttributeResponseParser
    //   366: dup
    //   367: invokespecial 253	org/cybergarage/xml/SetAttributeResponseParser:<init>	()V
    //   370: aload 7
    //   372: invokevirtual 257	org/cybergarage/xml/SetAttributeResponseParser:parseSetAttributeRespone	(Ljava/lang/String;)Z
    //   375: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   378: astore 8
    //   380: ldc 40
    //   382: new 42	java/lang/StringBuilder
    //   385: dup
    //   386: invokespecial 43	java/lang/StringBuilder:<init>	()V
    //   389: ldc_w 259
    //   392: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   395: aload 8
    //   397: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   400: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   403: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   406: goto -90 -> 316
    //   409: astore 5
    //   411: ldc 40
    //   413: ldc_w 261
    //   416: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   419: aload 5
    //   421: invokevirtual 262	java/lang/Exception:printStackTrace	()V
    //   424: aload_0
    //   425: iconst_0
    //   426: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   429: invokespecial 248	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:processResult	(Ljava/lang/Boolean;)V
    //   432: return
    //   433: aload_0
    //   434: getfield 115	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:TAG	Ljava/lang/String;
    //   437: ldc_w 264
    //   440: invokestatic 62	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   443: aload_0
    //   444: iconst_0
    //   445: invokestatic 180	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   448: invokespecial 248	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:processResult	(Ljava/lang/Boolean;)V
    //   451: return
    //   452: aload_0
    //   453: aload_1
    //   454: invokespecial 248	com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable:processResult	(Ljava/lang/Boolean;)V
    //   457: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	458	0	this	SetDeviceAttributeRunnable
    //   4	450	1	localBoolean1	Boolean
    //   91	154	2	arrayOfString	String[]
    //   144	5	3	localDeviceInformation	DeviceInformation
    //   146	53	4	localObject	Object
    //   409	11	5	localException1	Exception
    //   205	44	6	localAction	org.cybergarage.upnp.Action
    //   253	118	7	str	String
    //   289	107	8	localBoolean2	Boolean
    //   323	1	9	localException2	Exception
    //   329	29	10	localBoolean3	Boolean
    //   180	3	11	localDevice	org.cybergarage.upnp.Device
    // Exception table:
    //   from	to	target	type
    //   166	182	323	java/lang/Exception
    //   198	280	409	java/lang/Exception
    //   285	316	409	java/lang/Exception
    //   363	406	409	java/lang/Exception
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */