package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceRequestTracker;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.upnp.parser.InsightBinaryStateResponseParser;
import com.belkin.wemo.upnp.response.InsightBinaryState;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SetDeviceStateRunnable
  extends WeMoRunnable
{
  String actionResult = null;
  private String changedBrightness;
  private String changedFader;
  private String changedState;
  private JSONArray changedValues = null;
  private Context context;
  private DeviceListManager devListManager;
  private JSONArray executedActions = null;
  private DeviceInformation mDeviceInfo;
  private String mode;
  private Object[] params;
  private String time;
  
  public SetDeviceStateRunnable(Context paramContext, Object... paramVarArgs)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.params = paramVarArgs;
  }
  
  private void processResult(Boolean paramBoolean)
  {
    String str1 = "set_state";
    String str2;
    if (this.mDeviceInfo != null)
    {
      str2 = this.mDeviceInfo.getUDN();
      if (paramBoolean == null)
      {
        SDKLogUtils.errorLog(this.TAG, " Setting state FAILED.");
        if (this.mDeviceInfo != null)
        {
          this.mDeviceInfo.setInActive(1);
          this.mDeviceInfo.setIsDiscovered(false);
          DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.mDeviceInfo);
          CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
        }
        this.devListManager.sendNotification(str1, Boolean.toString(paramBoolean.booleanValue()), str2);
      }
    }
    else
    {
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", this.context);
      }
      return;
    }
    if (paramBoolean.booleanValue()) {
      if (!IsDevice.Crockpot(str2)) {
        if ((!IsDevice.Insight(str2)) || (this.changedValues == null)) {}
      }
    }
    label820:
    for (int i = 0;; i++)
    {
      String str3;
      String[] arrayOfString;
      try
      {
        if (i < this.executedActions.length())
        {
          str3 = this.executedActions.get(i).toString();
          arrayOfString = (String[])this.changedValues.getJSONObject(i).get(str3);
          if (str3.equals("SetInsightHomeSettings"))
          {
            this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST, arrayOfString[0]);
            this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_CURRENCY, arrayOfString[1]);
          }
          else if (str3.equals("SetPowerThreshold"))
          {
            this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_POWER_THRESHOLD, arrayOfString[0]);
          }
        }
      }
      catch (JSONException localJSONException4)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while saving insight attributes ", localJSONException4);
      }
      for (;;)
      {
        if (TextUtils.isEmpty(this.changedFader))
        {
          DeviceRequestTracker localDeviceRequestTracker = (DeviceRequestTracker)this.devListManager.getBinaryStateRequestTrackerMap().get(str2);
          if (localDeviceRequestTracker == null)
          {
            localDeviceRequestTracker = new DeviceRequestTracker(str2);
            this.devListManager.getBinaryStateRequestTrackerMap().put(str2, localDeviceRequestTracker);
          }
          localDeviceRequestTracker.onRequestSuccess();
        }
        DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.mDeviceInfo);
        CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
        break;
        if (!str3.equals("ScheduleDataExport")) {
          break label820;
        }
        this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_EXPORT_EMAIL, arrayOfString[0]);
        this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_EXPORT_INTERVAL, arrayOfString[1]);
        break label820;
        InsightBinaryState localInsightBinaryState = new InsightBinaryStateResponseParser().parseResponse(this.actionResult);
        this.changedState = localInsightBinaryState.getBinaryState();
        if (!TextUtils.isEmpty(this.changedState))
        {
          this.mDeviceInfo.setBinaryState(this.changedState);
          this.mDeviceInfo.setState(Integer.valueOf(this.changedState).intValue());
        }
        try
        {
          this.mDeviceInfo.setAttributeValue("binaryState", this.changedState);
          str1 = "change_state";
        }
        catch (JSONException localJSONException3)
        {
          for (;;)
          {
            SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while saving binaryState attribute: ", localJSONException3);
          }
        }
        this.changedBrightness = localInsightBinaryState.getBrightness();
        if (!TextUtils.isEmpty(this.changedBrightness)) {}
        try
        {
          this.mDeviceInfo.setAttributeValue("brightness", this.changedBrightness);
          str1 = "change_state";
        }
        catch (JSONException localJSONException2)
        {
          for (;;)
          {
            SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while saving brightness attribute: ", localJSONException2);
          }
        }
        SDKLogUtils.infoLog(this.TAG, " changedState : " + this.changedState + "; changedBrightness: " + this.changedBrightness + "; changedFader: UPDATED ONLY VIA FW NOTIFICATION.");
      }
      JSONObject localJSONObject1 = this.mDeviceInfo.getAttributeList();
      try
      {
        JSONObject localJSONObject2 = (JSONObject)localJSONObject1.get("mode");
        localJSONObject2.put("value", this.mode);
        localJSONObject1.put("mode", localJSONObject2);
        JSONObject localJSONObject3 = (JSONObject)localJSONObject1.get("time");
        localJSONObject3.put("value", this.time);
        localJSONObject1.put("time", localJSONObject3);
        this.mDeviceInfo.setAttributeList(localJSONObject1);
        DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.mDeviceInfo);
        CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
        SDKLogUtils.infoLog(this.TAG, "SetDeviceStateRunnable State Changed for crockpot::");
      }
      catch (JSONException localJSONException1)
      {
        for (;;)
        {
          localJSONException1.printStackTrace();
        }
      }
      this.mDeviceInfo.setInActive(0);
      this.mDeviceInfo.setIsDiscovered(true);
      DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.mDeviceInfo);
      CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
      break;
    }
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: iconst_1
    //   1: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   4: astore_1
    //   5: aload_0
    //   6: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   9: iconst_1
    //   10: aaload
    //   11: checkcast 160	java/lang/String
    //   14: astore_2
    //   15: aload_0
    //   16: aload_0
    //   17: getfield 43	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:context	Landroid/content/Context;
    //   20: invokestatic 83	com/belkin/wemo/cache/data/DevicesArray:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;
    //   23: aload_2
    //   24: invokevirtual 317	com/belkin/wemo/cache/data/DevicesArray:getDeviceInformation	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   27: putfield 53	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   30: aload_0
    //   31: getfield 53	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   34: ifnull +851 -> 885
    //   37: aload_0
    //   38: getfield 53	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   41: invokevirtual 321	com/belkin/wemo/cache/data/DeviceInformation:getDevice	()Lorg/cybergarage/upnp/Device;
    //   44: astore_3
    //   45: aload_3
    //   46: ifnonnull +34 -> 80
    //   49: aload_0
    //   50: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   53: ldc_w 323
    //   56: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   59: aload_0
    //   60: getfield 41	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   63: invokevirtual 327	com/belkin/wemo/cache/devicelist/DeviceListManager:getUpnpControl	()Lorg/cybergarage/upnp/ControlPoint;
    //   66: astore 17
    //   68: aload 17
    //   70: ifnull +10 -> 80
    //   73: aload 17
    //   75: aload_2
    //   76: invokevirtual 332	org/cybergarage/upnp/ControlPoint:getDevice	(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    //   79: astore_3
    //   80: aload_0
    //   81: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   84: new 264	java/lang/StringBuilder
    //   87: dup
    //   88: invokespecial 265	java/lang/StringBuilder:<init>	()V
    //   91: ldc_w 334
    //   94: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: aload_0
    //   98: getfield 53	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mDeviceInfo	Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   101: invokevirtual 321	com/belkin/wemo/cache/data/DeviceInformation:getDevice	()Lorg/cybergarage/upnp/Device;
    //   104: invokevirtual 337	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   107: ldc_w 339
    //   110: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   113: aload_2
    //   114: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: invokevirtual 276	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   120: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   123: aload_3
    //   124: ifnull +753 -> 877
    //   127: aconst_null
    //   128: astore 4
    //   130: aload_2
    //   131: invokestatic 128	com/belkin/wemo/cache/utils/IsDevice:Crockpot	(Ljava/lang/String;)Z
    //   134: ifeq +302 -> 436
    //   137: aload_0
    //   138: aload_0
    //   139: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   142: iconst_0
    //   143: aaload
    //   144: checkcast 160	java/lang/String
    //   147: putfield 292	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mode	Ljava/lang/String;
    //   150: aload_0
    //   151: aload_0
    //   152: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   155: iconst_2
    //   156: aaload
    //   157: checkcast 160	java/lang/String
    //   160: putfield 298	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:time	Ljava/lang/String;
    //   163: aload_3
    //   164: ldc_w 341
    //   167: invokevirtual 347	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   170: astore 4
    //   172: aload 4
    //   174: ifnonnull +12 -> 186
    //   177: aload_0
    //   178: iconst_0
    //   179: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   182: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   185: return
    //   186: aload_0
    //   187: getfield 41	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   190: astore 14
    //   192: iconst_2
    //   193: anewarray 160	java/lang/String
    //   196: dup
    //   197: iconst_0
    //   198: ldc_w 288
    //   201: aastore
    //   202: dup
    //   203: iconst_1
    //   204: ldc_w 296
    //   207: aastore
    //   208: astore 15
    //   210: iconst_2
    //   211: anewarray 160	java/lang/String
    //   214: astore 16
    //   216: aload 16
    //   218: iconst_0
    //   219: aload_0
    //   220: getfield 292	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:mode	Ljava/lang/String;
    //   223: aastore
    //   224: aload 16
    //   226: iconst_1
    //   227: aload_0
    //   228: getfield 298	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:time	Ljava/lang/String;
    //   231: aastore
    //   232: aload 14
    //   234: aload 4
    //   236: aload 15
    //   238: aload 16
    //   240: invokevirtual 353	com/belkin/wemo/cache/devicelist/DeviceListManager:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    //   243: aload_0
    //   244: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   247: ldc_w 355
    //   250: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   253: aload_0
    //   254: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   257: new 264	java/lang/StringBuilder
    //   260: dup
    //   261: invokespecial 265	java/lang/StringBuilder:<init>	()V
    //   264: ldc_w 357
    //   267: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   270: aload 4
    //   272: invokevirtual 337	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   275: invokevirtual 276	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   278: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   281: aload_0
    //   282: getfield 29	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:executedActions	Lorg/json/JSONArray;
    //   285: astore 7
    //   287: aload 7
    //   289: ifnonnull +42 -> 331
    //   292: aload_0
    //   293: aload 4
    //   295: invokevirtual 362	org/cybergarage/upnp/Action:postControlAction	()Ljava/lang/String;
    //   298: putfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   301: aload_0
    //   302: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   305: new 264	java/lang/StringBuilder
    //   308: dup
    //   309: invokespecial 265	java/lang/StringBuilder:<init>	()V
    //   312: ldc_w 364
    //   315: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   318: aload_0
    //   319: getfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   322: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   325: invokevirtual 276	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   328: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   331: aload_0
    //   332: getfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   335: ifnull +16 -> 351
    //   338: aload_0
    //   339: getfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   342: getstatic 369	com/belkin/wemo/cache/devicelist/UpnpConstants:ERROR	Ljava/lang/String;
    //   345: invokevirtual 372	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   348: ifeq +82 -> 430
    //   351: aload_0
    //   352: getfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   355: ldc_w 374
    //   358: invokevirtual 372	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   361: ifeq +504 -> 865
    //   364: aload_0
    //   365: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   368: new 264	java/lang/StringBuilder
    //   371: dup
    //   372: invokespecial 265	java/lang/StringBuilder:<init>	()V
    //   375: ldc_w 376
    //   378: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   381: aload_2
    //   382: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   385: ldc_w 378
    //   388: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   391: aload_0
    //   392: getfield 236	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedState	Ljava/lang/String;
    //   395: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: invokevirtual 276	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   401: invokestatic 381	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   404: aload_0
    //   405: getfield 41	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   408: ldc 51
    //   410: ldc_w 383
    //   413: aload_2
    //   414: invokevirtual 110	com/belkin/wemo/cache/devicelist/DeviceListManager:sendNotification	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   417: return
    //   418: astore 5
    //   420: aload 5
    //   422: invokevirtual 384	java/lang/Exception:printStackTrace	()V
    //   425: iconst_0
    //   426: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   429: astore_1
    //   430: aload_0
    //   431: aload_1
    //   432: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   435: return
    //   436: aload_2
    //   437: invokestatic 131	com/belkin/wemo/cache/utils/IsDevice:Insight	(Ljava/lang/String;)Z
    //   440: ifeq +230 -> 670
    //   443: aload_0
    //   444: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   447: arraylength
    //   448: iconst_2
    //   449: if_icmple +221 -> 670
    //   452: aload_0
    //   453: aload_0
    //   454: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   457: iconst_0
    //   458: aaload
    //   459: checkcast 133	org/json/JSONArray
    //   462: putfield 29	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:executedActions	Lorg/json/JSONArray;
    //   465: aload_0
    //   466: aload_0
    //   467: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   470: iconst_2
    //   471: aaload
    //   472: checkcast 133	org/json/JSONArray
    //   475: putfield 31	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedValues	Lorg/json/JSONArray;
    //   478: aconst_null
    //   479: astore 10
    //   481: iconst_0
    //   482: istore 11
    //   484: iload 11
    //   486: aload_0
    //   487: getfield 29	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:executedActions	Lorg/json/JSONArray;
    //   490: invokevirtual 137	org/json/JSONArray:length	()I
    //   493: if_icmpge -240 -> 253
    //   496: aload_0
    //   497: getfield 29	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:executedActions	Lorg/json/JSONArray;
    //   500: iload 11
    //   502: invokevirtual 141	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   505: invokevirtual 145	java/lang/Object:toString	()Ljava/lang/String;
    //   508: astore 12
    //   510: aload_3
    //   511: aload 12
    //   513: invokevirtual 347	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   516: astore 4
    //   518: aload 4
    //   520: ifnonnull +12 -> 532
    //   523: aload_0
    //   524: iconst_0
    //   525: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   528: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   531: return
    //   532: aload 12
    //   534: ldc -98
    //   536: invokevirtual 164	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   539: ifeq +84 -> 623
    //   542: getstatic 387	com/belkin/wemo/cache/devicelist/UpnpConstants:ENERGY_PER_UNIT_COST_DATA	[Ljava/lang/String;
    //   545: astore 10
    //   547: aload_0
    //   548: getfield 41	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   551: aload 4
    //   553: aload 10
    //   555: aload_0
    //   556: getfield 31	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedValues	Lorg/json/JSONArray;
    //   559: iload 11
    //   561: invokevirtual 149	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   564: aload 12
    //   566: invokevirtual 154	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   569: checkcast 156	[Ljava/lang/String;
    //   572: checkcast 156	[Ljava/lang/String;
    //   575: invokevirtual 353	com/belkin/wemo/cache/devicelist/DeviceListManager:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    //   578: aload_0
    //   579: aload 4
    //   581: invokevirtual 362	org/cybergarage/upnp/Action:postControlAction	()Ljava/lang/String;
    //   584: putfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   587: aload_0
    //   588: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   591: new 264	java/lang/StringBuilder
    //   594: dup
    //   595: invokespecial 265	java/lang/StringBuilder:<init>	()V
    //   598: ldc_w 364
    //   601: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   604: aload_0
    //   605: getfield 33	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:actionResult	Ljava/lang/String;
    //   608: invokevirtual 271	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   611: invokevirtual 276	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   614: invokestatic 279	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   617: iinc 11 1
    //   620: goto -136 -> 484
    //   623: aload 12
    //   625: ldc -79
    //   627: invokevirtual 164	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   630: ifeq +11 -> 641
    //   633: getstatic 390	com/belkin/wemo/cache/devicelist/UpnpConstants:POWER_THRESHOLD	[Ljava/lang/String;
    //   636: astore 10
    //   638: goto -91 -> 547
    //   641: aload 12
    //   643: ldc -40
    //   645: invokevirtual 164	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   648: ifeq -101 -> 547
    //   651: getstatic 393	com/belkin/wemo/cache/devicelist/UpnpConstants:SCHEDULE_DATA_EXPORT_ARGS	[Ljava/lang/String;
    //   654: astore 10
    //   656: goto -109 -> 547
    //   659: astore 13
    //   661: aload_0
    //   662: iconst_0
    //   663: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   666: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   669: return
    //   670: aload_2
    //   671: invokestatic 396	com/belkin/wemo/cache/utils/IsDevice:Dimmer	(Ljava/lang/String;)Z
    //   674: ifeq +116 -> 790
    //   677: aload_0
    //   678: aload_0
    //   679: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   682: iconst_0
    //   683: aaload
    //   684: checkcast 160	java/lang/String
    //   687: putfield 236	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedState	Ljava/lang/String;
    //   690: aload_0
    //   691: aload_0
    //   692: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   695: iconst_2
    //   696: aaload
    //   697: checkcast 160	java/lang/String
    //   700: putfield 260	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedBrightness	Ljava/lang/String;
    //   703: aload_0
    //   704: aload_0
    //   705: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   708: iconst_3
    //   709: aaload
    //   710: checkcast 160	java/lang/String
    //   713: putfield 187	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedFader	Ljava/lang/String;
    //   716: aload_3
    //   717: ldc_w 398
    //   720: invokevirtual 347	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   723: astore 4
    //   725: aload 4
    //   727: ifnull +44 -> 771
    //   730: aload 4
    //   732: ldc_w 262
    //   735: aload_0
    //   736: getfield 260	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedBrightness	Ljava/lang/String;
    //   739: invokevirtual 401	org/cybergarage/upnp/Action:setArgumentValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   742: aload 4
    //   744: ldc_w 403
    //   747: aload_0
    //   748: getfield 187	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedFader	Ljava/lang/String;
    //   751: invokevirtual 401	org/cybergarage/upnp/Action:setArgumentValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   754: aload 4
    //   756: getstatic 406	com/belkin/wemo/cache/devicelist/UpnpConstants:SET_BINARY_STATE_ARGS	[Ljava/lang/String;
    //   759: iconst_0
    //   760: aaload
    //   761: aload_0
    //   762: getfield 236	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedState	Ljava/lang/String;
    //   765: invokevirtual 401	org/cybergarage/upnp/Action:setArgumentValue	(Ljava/lang/String;Ljava/lang/String;)V
    //   768: goto -515 -> 253
    //   771: aload_0
    //   772: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   775: ldc_w 408
    //   778: invokestatic 70	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   781: aload_0
    //   782: iconst_0
    //   783: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   786: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   789: return
    //   790: aload_0
    //   791: getfield 45	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:params	[Ljava/lang/Object;
    //   794: iconst_0
    //   795: aaload
    //   796: checkcast 160	java/lang/String
    //   799: astore 6
    //   801: aload_0
    //   802: aload 6
    //   804: putfield 236	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:changedState	Ljava/lang/String;
    //   807: aload_3
    //   808: ldc_w 398
    //   811: invokevirtual 347	org/cybergarage/upnp/Device:getAction	(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    //   814: astore 4
    //   816: aload 4
    //   818: ifnonnull +12 -> 830
    //   821: aload_0
    //   822: iconst_0
    //   823: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   826: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   829: return
    //   830: aload_0
    //   831: getfield 41	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:devListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   834: aload 4
    //   836: getstatic 406	com/belkin/wemo/cache/devicelist/UpnpConstants:SET_BINARY_STATE_ARGS	[Ljava/lang/String;
    //   839: iconst_1
    //   840: anewarray 160	java/lang/String
    //   843: dup
    //   844: iconst_0
    //   845: aload 6
    //   847: aastore
    //   848: invokevirtual 353	com/belkin/wemo/cache/devicelist/DeviceListManager:setArgument	(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    //   851: goto -598 -> 253
    //   854: astore 9
    //   856: aload_0
    //   857: iconst_0
    //   858: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   861: invokespecial 349	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:processResult	(Ljava/lang/Boolean;)V
    //   864: return
    //   865: iconst_0
    //   866: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   869: astore 8
    //   871: aload 8
    //   873: astore_1
    //   874: goto -444 -> 430
    //   877: iconst_0
    //   878: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   881: astore_1
    //   882: goto -452 -> 430
    //   885: aload_0
    //   886: getfield 62	com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable:TAG	Ljava/lang/String;
    //   889: ldc_w 410
    //   892: invokestatic 70	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   895: iconst_0
    //   896: invokestatic 313	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   899: astore_1
    //   900: goto -470 -> 430
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	903	0	this	SetDeviceStateRunnable
    //   4	896	1	localObject	Object
    //   14	657	2	str1	String
    //   44	764	3	localDevice	org.cybergarage.upnp.Device
    //   128	707	4	localAction	org.cybergarage.upnp.Action
    //   418	3	5	localException1	Exception
    //   799	47	6	str2	String
    //   285	3	7	localJSONArray	JSONArray
    //   869	3	8	localBoolean	Boolean
    //   854	1	9	localException2	Exception
    //   479	176	10	arrayOfString1	String[]
    //   482	136	11	i	int
    //   508	134	12	str3	String
    //   659	1	13	localException3	Exception
    //   190	43	14	localDeviceListManager	DeviceListManager
    //   208	29	15	arrayOfString2	String[]
    //   214	25	16	arrayOfString3	String[]
    //   66	8	17	localControlPoint	org.cybergarage.upnp.ControlPoint
    // Exception table:
    //   from	to	target	type
    //   130	172	418	java/lang/Exception
    //   177	185	418	java/lang/Exception
    //   186	253	418	java/lang/Exception
    //   253	287	418	java/lang/Exception
    //   331	351	418	java/lang/Exception
    //   351	417	418	java/lang/Exception
    //   436	478	418	java/lang/Exception
    //   484	518	418	java/lang/Exception
    //   523	531	418	java/lang/Exception
    //   532	547	418	java/lang/Exception
    //   547	578	418	java/lang/Exception
    //   623	638	418	java/lang/Exception
    //   641	656	418	java/lang/Exception
    //   661	669	418	java/lang/Exception
    //   670	725	418	java/lang/Exception
    //   730	768	418	java/lang/Exception
    //   771	789	418	java/lang/Exception
    //   790	816	418	java/lang/Exception
    //   821	829	418	java/lang/Exception
    //   830	851	418	java/lang/Exception
    //   856	864	418	java/lang/Exception
    //   865	871	418	java/lang/Exception
    //   578	617	659	java/lang/Exception
    //   292	331	854	java/lang/Exception
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */