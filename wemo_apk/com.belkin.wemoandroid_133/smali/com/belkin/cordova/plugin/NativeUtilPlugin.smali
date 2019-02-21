.class public Lcom/belkin/cordova/plugin/NativeUtilPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "NativeUtilPlugin.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "NativeUtilPlugin"

.field public static sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# instance fields
.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mContext:Landroid/content/Context;

.field private mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

.field private mNativeUtil:Lcom/belkin/utils/NativeUtil;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mPluginResult:Lorg/apache/cordova/PluginResult;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mSpinner:Landroid/widget/ProgressBar;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field private mpermissionController:Lcom/belkin/wemo/PermissionController;

.field private permissions:Lcom/belkin/wemo/Permissions;

.field private ruleUtility:Lcom/belkin/utils/RuleUtility;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/utils/RuleUtility;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private mergeHomeSsid(Ljava/util/Set;)Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 566
    .local p1, "groupSsid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v3

    .line 567
    .local v3, "newHomeSsid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x1

    .line 568
    .local v0, "isNewHomeMerge":Z
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 569
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 570
    .local v4, "string":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 571
    .local v2, "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 572
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 573
    .local v5, "string2":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 575
    const/4 v0, 0x0

    .line 579
    .end local v5    # "string2":Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_0

    .line 581
    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 584
    .end local v2    # "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "string":Ljava/lang/String;
    :cond_3
    return-object v3
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 38
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 94
    .local v5, "actionID":I
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "actionID: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    sparse-switch v5, :sswitch_data_0

    .line 555
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Incorrect action ID: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    :goto_0
    const/16 v33, 0x1

    return v33

    .line 98
    :sswitch_0
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_ANALYTICS_DATA"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->analyticsData(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 103
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v33

    new-instance v34, Lcom/belkin/cordova/plugin/NativeUtilPlugin$1;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$1;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V

    invoke-interface/range {v33 .. v34}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 109
    const-string v33, "true"

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 114
    :sswitch_2
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_LOCATION_INFO"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/Permissions;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->permissions:Lcom/belkin/wemo/Permissions;

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->permissions:Lcom/belkin/wemo/Permissions;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/Permissions;->fetchPermission(Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 123
    :sswitch_3
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_SR_SS_TIME"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    sget-object v33, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "CordovaConstants.ACTION_GET_SR_SS_TIME:  "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "  ::  "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v34

    const/16 v36, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v36

    invoke-virtual/range {v33 .. v37}, Lcom/belkin/utils/RuleUtility;->getSunriseSunsetTime(DD)Lorg/json/JSONArray;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 130
    :sswitch_4
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 133
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 137
    :sswitch_5
    if-eqz p2, :cond_1

    .line 139
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v30

    .line 140
    .local v30, "remoteEnable":Z
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 141
    if-nez v30, :cond_0

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 147
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 150
    .end local v30    # "remoteEnable":Z
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 154
    :sswitch_6
    new-instance v22, Landroid/content/Intent;

    const-string v33, "android.intent.action.SEND"

    move-object/from16 v0, v22

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 155
    .local v22, "intent":Landroid/content/Intent;
    const-string v33, "message/rfc822"

    move-object/from16 v0, v22

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 156
    const-string v33, "android.intent.extra.EMAIL"

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const/16 v36, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, v22

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 157
    const-string v33, "android.intent.extra.SUBJECT"

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v22

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    const-string v33, "android.intent.extra.TEXT"

    const/16 v34, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v22

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    const-string v34, "Send Email"

    move-object/from16 v0, v22

    move-object/from16 v1, v34

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 160
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 163
    .end local v22    # "intent":Landroid/content/Intent;
    :sswitch_7
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_CHECK_LOCATION_SERVICE"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    new-instance v14, Lcom/belkin/utils/GPSTracker;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-direct {v14, v0}, Lcom/belkin/utils/GPSTracker;-><init>(Landroid/content/Context;)V

    .line 165
    .local v14, "gps":Lcom/belkin/utils/GPSTracker;
    invoke-virtual {v14}, Lcom/belkin/utils/GPSTracker;->canGetLocation()Z

    move-result v33

    if-nez v33, :cond_2

    .line 166
    const/16 v33, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(I)V

    goto/16 :goto_0

    .line 168
    :cond_2
    const/16 v33, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto/16 :goto_0

    .line 172
    .end local v14    # "gps":Lcom/belkin/utils/GPSTracker;
    :sswitch_8
    new-instance v26, Landroid/content/Intent;

    const-string v33, "android.settings.LOCATION_SOURCE_SETTINGS"

    move-object/from16 v0, v26

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 173
    .local v26, "myIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 174
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 178
    .end local v26    # "myIntent":Landroid/content/Intent;
    :sswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->generateAndCallMarketUri(Landroid/content/Context;)V

    .line 179
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 183
    :sswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 187
    :sswitch_b
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 190
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 195
    :sswitch_c
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .local v25, "mobileInfo":Ljava/lang/StringBuilder;
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, ": "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getVersionNumber()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, ", "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\n"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ": "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\n"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v35, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ": "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 204
    .end local v25    # "mobileInfo":Ljava/lang/StringBuilder;
    :sswitch_d
    new-instance v33, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 217
    :sswitch_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareDetails(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 221
    :sswitch_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveConfigurationStatus(Z)V

    .line 222
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 226
    :sswitch_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setNestAuthCallbackStatus(I)V

    .line 227
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 231
    :sswitch_11
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getNestAuthCallbackStatus()I

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 237
    :sswitch_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setNestDeauthCallbackStatus(I)V

    .line 238
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 242
    :sswitch_13
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getNestDeauthCallbackStatus()I

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 248
    :sswitch_14
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->checkConfigurationStatus()Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 274
    :sswitch_15
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_SHOW_PROGRESS:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    const-string v33, "title"

    const-string v34, "message"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->showSpinner(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 281
    :sswitch_16
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_HIDE_PROGRESS:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->hideSpinner()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    :goto_1
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 284
    :catch_0
    move-exception v13

    .line 285
    .local v13, "exception":Ljava/lang/Exception;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "hide progress:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    sget-object v33, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/16 v34, 0x1

    invoke-virtual/range {v33 .. v34}, Landroid/app/Dialog;->setCancelable(Z)V

    goto :goto_1

    .line 292
    .end local v13    # "exception":Ljava/lang/Exception;
    :sswitch_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getAppAndDeviceInfo(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 297
    :sswitch_18
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_SHOW_SPLASH_ON_LOADING:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->showSplash()V

    .line 299
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 303
    :sswitch_19
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_HIDE_SPLASH_ON_LOADING:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->hideSpinner()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 310
    :goto_2
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 306
    :catch_1
    move-exception v13

    .line 307
    .restart local v13    # "exception":Ljava/lang/Exception;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "hide progress:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    sget-object v33, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/16 v34, 0x1

    invoke-virtual/range {v33 .. v34}, Landroid/app/Dialog;->setCancelable(Z)V

    goto :goto_2

    .line 314
    .end local v13    # "exception":Ljava/lang/Exception;
    :sswitch_1a
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_SHOW_RULE_PROGRESS:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 320
    :sswitch_1b
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_HIDE_PROGRESS_DIALOG:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->hideProgressDialog()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 327
    :goto_3
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 323
    :catch_2
    move-exception v13

    .line 324
    .restart local v13    # "exception":Ljava/lang/Exception;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "hide progress dialog:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    sget-object v33, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/16 v34, 0x1

    invoke-virtual/range {v33 .. v34}, Landroid/app/Dialog;->setCancelable(Z)V

    goto :goto_3

    .line 331
    .end local v13    # "exception":Ljava/lang/Exception;
    :sswitch_1c
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_SAVE_IMAGE_TO_DB:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/String;->getBytes()[B

    move-result-object v35

    invoke-virtual/range {v33 .. v35}, Lcom/belkin/utils/NativeUtil;->setImage(Ljava/lang/String;[B)V

    .line 334
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    .line 335
    :catch_3
    move-exception v13

    .line 336
    .restart local v13    # "exception":Ljava/lang/Exception;
    const/16 v33, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto/16 :goto_0

    .line 341
    .end local v13    # "exception":Ljava/lang/Exception;
    :sswitch_1d
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_BASE64_IMAGE_FROM_DB:"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/utils/NativeUtil;->getBase64Image(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 344
    .local v20, "imageString":Ljava/lang/String;
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 347
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    .line 348
    .end local v20    # "imageString":Ljava/lang/String;
    :catch_4
    move-exception v13

    .line 349
    .restart local v13    # "exception":Ljava/lang/Exception;
    const/16 v33, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto/16 :goto_0

    .line 354
    .end local v13    # "exception":Ljava/lang/Exception;
    :sswitch_1e
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_NETWORK_TYPE_NEW"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v28

    .line 357
    .local v28, "networkName":Ljava/lang/String;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Network Name: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    move-object/from16 v0, p3

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 361
    .end local v28    # "networkName":Ljava/lang/String;
    :sswitch_1f
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_CACHE_SSID"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCacheSSID()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 365
    :sswitch_20
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_CACHE_SSID ssid: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheSSID(Ljava/lang/String;)Z

    .line 367
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 370
    :sswitch_21
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_CACHE_ARPMAC"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCacheArpMac()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 374
    :sswitch_22
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_CACHE_ARPMAC arpmac: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheArpMac(Ljava/lang/String;)Z

    .line 376
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 379
    :sswitch_23
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v31

    .line 380
    .local v31, "ssidsArray":Lorg/json/JSONArray;
    const/16 v33, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    .line 381
    .local v6, "arpMacArray":Lorg/json/JSONArray;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_SSID ssid: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " arpMac: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    new-instance v18, Ljava/util/HashSet;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashSet;-><init>()V

    .line 383
    .local v18, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_4
    invoke-virtual/range {v31 .. v31}, Lorg/json/JSONArray;->length()I

    move-result v33

    move/from16 v0, v19

    move/from16 v1, v33

    if-ge v0, v1, :cond_3

    .line 384
    move-object/from16 v0, v31

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v18

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 383
    add-int/lit8 v19, v19, 0x1

    goto :goto_4

    .line 386
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mergeHomeSsid(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v16

    .line 387
    .local v16, "groupSSid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 388
    const/16 v29, 0x0

    .line 389
    .local v29, "newNetworkHome":Z
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v33

    if-lez v33, :cond_5

    .line 391
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 392
    .local v8, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/16 v19, 0x0

    :goto_5
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v33

    move/from16 v0, v19

    move/from16 v1, v33

    if-ge v0, v1, :cond_4

    .line 393
    move/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 392
    add-int/lit8 v19, v19, 0x1

    goto :goto_5

    .line 395
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getARPMacs()Ljava/util/Set;

    move-result-object v32

    .line 396
    .local v32, "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v32, :cond_6

    const/16 v21, 0x0

    .line 397
    .local v21, "initialSize":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v8}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mergeArpMacs(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v15

    .line 398
    .local v15, "groupArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 399
    if-nez v21, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v33

    if-eqz v33, :cond_5

    .line 401
    const/16 v29, 0x1

    .line 402
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 407
    .end local v8    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v15    # "groupArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v21    # "initialSize":I
    .end local v32    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_5
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 396
    .restart local v8    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v32    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_6
    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->size()I

    move-result v21

    goto :goto_6

    .line 410
    .end local v6    # "arpMacArray":Lorg/json/JSONArray;
    .end local v8    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v16    # "groupSSid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v19    # "i":I
    .end local v29    # "newNetworkHome":Z
    .end local v31    # "ssidsArray":Lorg/json/JSONArray;
    .end local v32    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :sswitch_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 412
    new-instance v17, Ljava/util/HashSet;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashSet;-><init>()V

    .line 413
    .local v17, "homeSSID":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 414
    .restart local v8    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/16 v33, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 415
    const/4 v7, 0x0

    .line 417
    .local v7, "arpMacArrayTemp":Lorg/json/JSONArray;
    const/16 v33, 0x2

    :try_start_5
    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v7

    .line 418
    if-eqz v7, :cond_7

    .line 420
    const/16 v19, 0x0

    .restart local v19    # "i":I
    :goto_7
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v33

    move/from16 v0, v19

    move/from16 v1, v33

    if-ge v0, v1, :cond_7

    .line 421
    move/from16 v0, v19

    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 420
    add-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 424
    .end local v19    # "i":I
    :catch_5
    move-exception v10

    .line 425
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    .line 427
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_7
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_HOME_CHANGE_SSID Home Id: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " Home Ssid "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " arpMacArrayTemp: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 430
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 433
    .end local v7    # "arpMacArrayTemp":Lorg/json/JSONArray;
    .end local v8    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v17    # "homeSSID":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :sswitch_25
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_NETWORK_NAME"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkName()Ljava/lang/String;

    move-result-object v27

    .line 435
    .local v27, "name":Ljava/lang/String;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Network Name: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    move-object/from16 v0, p3

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 440
    .end local v27    # "name":Ljava/lang/String;
    :sswitch_26
    const-string v33, "NativeUtilPlugin"

    const-string v34, "GET_CURRENT_ARPMAC"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v33

    new-instance v34, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface/range {v33 .. v34}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 448
    :sswitch_27
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_PREF_GET_CONFIG_STRING"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 453
    :sswitch_28
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_OPEN_SOFT_KEYBOARD"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v33

    const-string v34, "input_method"

    invoke-virtual/range {v33 .. v34}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Landroid/view/inputmethod/InputMethodManager;

    const/16 v34, 0x2

    const/16 v35, 0x1

    invoke-virtual/range {v33 .. v35}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 455
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 459
    :sswitch_29
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_HIDE_SOFT_KEYBOARD"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v33

    const-string v34, "input_method"

    invoke-virtual/range {v33 .. v34}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Landroid/view/inputmethod/InputMethodManager;

    .line 462
    .local v24, "mgr":Landroid/view/inputmethod/InputMethodManager;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 463
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 467
    .end local v24    # "mgr":Landroid/view/inputmethod/InputMethodManager;
    :sswitch_2a
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_PREF_GET_STARTED_DONE"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getGetStartedNeeded()Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 470
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 473
    :sswitch_2b
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_PREF_SET_GET_STARTED_NEEDED"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setGetStartedNeeded(Z)V

    .line 475
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 478
    :sswitch_2c
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->isCurrNtwDiffFromSetup()Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 481
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 484
    :sswitch_2d
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_REUNION_KEY Start"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    new-instance v33, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 489
    :sswitch_2e
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_LED_IMAGE_FROM_DB"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/utils/NativeUtil;->getLedBase64Image(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 493
    :sswitch_2f
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_INSERT_LED_IMAGE_TO_DB"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v33 .. v36}, Lcom/belkin/utils/NativeUtil;->setLedDeviceImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 497
    :sswitch_30
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_RESET_LED_IMAGE_TO_DB"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/utils/NativeUtil;->resetLedDeviceImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 501
    :sswitch_31
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_USER_PREF_TIME_FORMAT"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v35

    invoke-direct/range {v33 .. v35}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 504
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 505
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 506
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 509
    :sswitch_32
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailIds()Ljava/lang/String;

    move-result-object v12

    .line 510
    .local v12, "emailSubscription":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 511
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_GET_EMAIL- emailSubscription: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 514
    .end local v12    # "emailSubscription":Ljava/lang/String;
    :sswitch_33
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_EMAIL_ADDRESS inParamArray: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeEmailIds(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_8

    const-string v33, "true"

    :goto_8
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    const-string v33, "false"

    goto :goto_8

    .line 518
    :sswitch_34
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->deleteEmailIds(I)Z

    move-result v33

    if-eqz v33, :cond_9

    const-string v33, "true"

    :goto_9
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_9
    const-string v33, "false"

    goto :goto_9

    .line 521
    :sswitch_35
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_SET_BRIDGE_DATA"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveBridgeSetup(Ljava/lang/String;)V

    .line 523
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 526
    :sswitch_36
    const-string v33, "NativeUtilPlugin"

    const-string v34, "ACTION_GET_BRIDGE_DATA"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getbridgeValues()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 530
    :sswitch_37
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_IAB_WEMOHEADERHEIGHT"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppHeaderHeight(I)Z

    goto/16 :goto_0

    .line 534
    :sswitch_38
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_GET_STORED_LEGACY_EMAILID inParamArray: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getStoredLegacyEmails()Ljava/lang/String;

    goto/16 :goto_0

    .line 538
    :sswitch_39
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ACTION_SET_EMAIL_DEVICE_TYPE inParamArray: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " : "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    const/4 v4, 0x0

    .line 540
    .local v4, "OptDeviceType":Ljava/lang/String;
    new-instance v23, Lorg/json/JSONObject;

    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 541
    .local v23, "jsonObject":Lorg/json/JSONObject;
    const-string v33, "deviceType"

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    .line 542
    .local v9, "deviceType":Ljava/lang/String;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "deviceType: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailOptDeviceType()Ljava/lang/String;

    move-result-object v11

    .line 544
    .local v11, "emailOptDeviceType":Ljava/lang/String;
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "emailOptDeviceType: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    const-string v33, ""

    move-object/from16 v0, v33

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_a

    .line 546
    move-object v4, v9

    .line 551
    :goto_a
    const-string v33, "NativeUtilPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "OptDeviceType: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeEmailOptDeviceType(Ljava/lang/String;)Z

    goto/16 :goto_0

    .line 549
    :cond_a
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v33

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, ","

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_a

    .line 95
    :sswitch_data_0
    .sparse-switch
        0x802 -> :sswitch_2d
        0x806 -> :sswitch_2c
        0x808 -> :sswitch_1f
        0x809 -> :sswitch_20
        0x80b -> :sswitch_23
        0x80c -> :sswitch_24
        0x1397 -> :sswitch_2
        0x1398 -> :sswitch_3
        0x139a -> :sswitch_1
        0x13a3 -> :sswitch_7
        0x13a4 -> :sswitch_8
        0x1776 -> :sswitch_0
        0x1b59 -> :sswitch_4
        0x1b5a -> :sswitch_5
        0x1b5b -> :sswitch_6
        0x1b5c -> :sswitch_9
        0x1b5d -> :sswitch_a
        0x1b5e -> :sswitch_b
        0x1b5f -> :sswitch_c
        0x1b60 -> :sswitch_d
        0x1b61 -> :sswitch_e
        0x1b62 -> :sswitch_f
        0x1b63 -> :sswitch_14
        0x1b68 -> :sswitch_1d
        0x1b69 -> :sswitch_1e
        0x1b6a -> :sswitch_27
        0x1b6b -> :sswitch_2b
        0x1b6c -> :sswitch_2a
        0x1b6d -> :sswitch_1c
        0x1b6e -> :sswitch_25
        0x1b6f -> :sswitch_31
        0x1b70 -> :sswitch_26
        0x1b71 -> :sswitch_21
        0x1b72 -> :sswitch_22
        0x1b73 -> :sswitch_17
        0x1b76 -> :sswitch_10
        0x1b77 -> :sswitch_11
        0x1b78 -> :sswitch_12
        0x1b79 -> :sswitch_13
        0x1f55 -> :sswitch_2e
        0x1f56 -> :sswitch_2f
        0x1f57 -> :sswitch_30
        0x1f59 -> :sswitch_35
        0x1f5a -> :sswitch_36
        0x2329 -> :sswitch_15
        0x232a -> :sswitch_16
        0x232b -> :sswitch_28
        0x232c -> :sswitch_1a
        0x232d -> :sswitch_1b
        0x2331 -> :sswitch_29
        0x2332 -> :sswitch_32
        0x2333 -> :sswitch_33
        0x2334 -> :sswitch_34
        0x2337 -> :sswitch_18
        0x2338 -> :sswitch_19
        0x233d -> :sswitch_37
        0x2343 -> :sswitch_38
        0x2344 -> :sswitch_39
    .end sparse-switch
.end method

.method public declared-synchronized hideKeyBoard()V
    .locals 3

    .prologue
    .line 672
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "hideKeyBoard"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 674
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isAcceptingText()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 676
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 678
    :cond_0
    monitor-exit p0

    return-void

    .line 672
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized hideProgressDialog()V
    .locals 4

    .prologue
    .line 726
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "hideProgressDialog: "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 728
    :try_start_1
    sget-object v1, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    .line 729
    sget-object v1, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 731
    :cond_0
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_1

    .line 732
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 737
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 734
    :catch_0
    move-exception v0

    .line 735
    .local v0, "exception":Ljava/lang/Exception;
    :try_start_2
    const-string v1, "NativeUtilPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hideProgressDialog: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 726
    .end local v0    # "exception":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized hideSpinner()V
    .locals 4

    .prologue
    .line 681
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "hideSpinner: "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    const-string v1, "NativeUtilPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mProgressDialog: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 685
    :try_start_1
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    .line 686
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 692
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 689
    :catch_0
    move-exception v0

    .line 690
    .local v0, "exception":Ljava/lang/Exception;
    :try_start_2
    const-string v1, "NativeUtilPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hideSpinner : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 681
    .end local v0    # "exception":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 80
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    .line 81
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 82
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 83
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 84
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    .line 85
    new-instance v0, Lcom/belkin/utils/NativeUtil;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/NativeUtil;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mNativeUtil:Lcom/belkin/utils/NativeUtil;

    .line 86
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    .line 87
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 88
    return-void
.end method

.method public isCurrNtwDiffFromSetup()Z
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 740
    const-string v6, "NativeUtilPlugin"

    const-string v7, "isCurrNtwDiffFromSetup"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    new-instance v2, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v2, v6}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    .line 743
    .local v2, "networkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 744
    .local v1, "currentSSID":Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v3

    .line 745
    .local v3, "savedConfig":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 746
    const-string v5, "NativeUtilPlugin"

    const-string v6, "isCurrNtwDiffFromSetup savedConfig is null"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    :cond_0
    :goto_0
    return v4

    .line 749
    :cond_1
    const-string v6, "\\|"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 750
    .local v0, "configArray":[Ljava/lang/String;
    const-string v6, "NativeUtilPlugin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "isCurrNtwDiffFromSetup currentSSID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " saved: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v0, v5

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 751
    aget-object v6, v0, v5

    invoke-virtual {v1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v4, v5

    .line 754
    goto :goto_0
.end method

.method public declared-synchronized showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 695
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "showProgressDialog: "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 696
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 697
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 700
    :cond_0
    new-instance v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;

    invoke-direct {v0, p0, p1, p2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 723
    monitor-exit p0

    return-void

    .line 695
    .end local v0    # "runnable":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized showSpinner(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 616
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "showSpinner: "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 618
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 621
    :cond_0
    new-instance v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;

    invoke-direct {v0, p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V

    .line 643
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    monitor-exit p0

    return-void

    .line 616
    .end local v0    # "runnable":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public showSpinnerNew()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x2

    .line 588
    const-string v2, "NativeUtilPlugin"

    const-string v3, "showSpinner: "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 590
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 592
    :cond_0
    new-instance v0, Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 593
    .local v0, "mSpinner":Landroid/widget/ProgressBar;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 595
    new-instance v2, Landroid/app/Dialog;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    .line 596
    const-string v2, "NativeUtilPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mProgressDialog: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v5}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 598
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 599
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 600
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 601
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 602
    new-instance v1, Lcom/belkin/cordova/plugin/NativeUtilPlugin$4;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$4;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V

    .line 612
    .local v1, "runnable":Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 613
    return-void
.end method

.method public declared-synchronized showSplash()V
    .locals 3

    .prologue
    .line 647
    monitor-enter p0

    :try_start_0
    const-string v1, "NativeUtilPlugin"

    const-string v2, "showSplash: "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 649
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 652
    :cond_0
    new-instance v0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$6;

    invoke-direct {v0, p0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin$6;-><init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V

    .line 668
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 669
    monitor-exit p0

    return-void

    .line 647
    .end local v0    # "runnable":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
