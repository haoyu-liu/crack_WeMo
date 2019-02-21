.class public Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
.super Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;
.source "UpnpDeviceSetup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$getEndList;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UpnpDeviceSetup"

.field private static upnpDeviceSetupInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;


# instance fields
.field ResponseString:Ljava/lang/String;

.field capabilityID:Ljava/lang/String;

.field deviceId:Ljava/lang/String;

.field isGroupAction:Ljava/lang/String;

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field private mContext:Landroid/content/Context;

.field mResponseString:Ljava/lang/String;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private networkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field onORoff:Ljava/lang/String;

.field private routerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;",
            ">;"
        }
    .end annotation
.end field

.field strDevIds:Ljava/lang/String;

.field private timeOpenNetworkCheck:J

.field private wifiUtil:Lcom/belkin/utils/WifiUtil;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 139
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->upnpDeviceSetupInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 157
    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;-><init>(Landroid/content/Context;)V

    .line 122
    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    .line 124
    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 135
    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->onORoff:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->deviceId:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->capabilityID:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isGroupAction:Ljava/lang/String;

    .line 158
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    .line 159
    new-instance v0, Lcom/belkin/utils/WifiUtil;

    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/WifiUtil;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->wifiUtil:Lcom/belkin/utils/WifiUtil;

    .line 160
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 161
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->networkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 164
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
    .param p1, "x1"    # Lorg/cybergarage/upnp/Action;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 118
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private createAttributeList(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 10
    .param p1, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 420
    const/4 v7, 0x4

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "Switch"

    aput-object v8, v0, v7

    const/4 v7, 0x1

    const-string v8, "Sensor"

    aput-object v8, v0, v7

    const/4 v7, 0x2

    const-string v8, "SwitchMode"

    aput-object v8, v0, v7

    const/4 v7, 0x3

    const-string v8, "SensorPresent"

    aput-object v8, v0, v7

    .line 421
    .local v0, "arr":[Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 423
    .local v6, "str":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "count":I
    :goto_0
    :try_start_0
    array-length v7, v0

    if-ge v3, v7, :cond_1

    .line 425
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 426
    .local v5, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 428
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 429
    .local v1, "attributeKey":Ljava/lang/String;
    aget-object v7, v0, v3

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 431
    const-string v7, "<attribute>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 432
    const-string v7, "<name>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 433
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 434
    .local v2, "attributeObejct":Lorg/json/JSONObject;
    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    const-string v7, "</name>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 436
    const-string v7, "<value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 437
    const-string v7, "value"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 439
    const-string v7, "</attribute>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 443
    .end local v1    # "attributeKey":Ljava/lang/String;
    .end local v2    # "attributeObejct":Lorg/json/JSONObject;
    .end local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v4

    .line 444
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 446
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_1
    const-string v7, "setAttriuteState"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "str.toString():::::::;"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 423
    .restart local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 144
    const-class v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->upnpDeviceSetupInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    if-nez v0, :cond_0

    .line 146
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-direct {v0, p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->upnpDeviceSetupInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .line 149
    :cond_0
    sget-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->upnpDeviceSetupInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRemoteAccessAgrs()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1153
    const/16 v3, 0x8

    new-array v0, v3, [Ljava/lang/String;

    .line 1154
    .local v0, "arrstrRemoteAccessArgs":[Ljava/lang/String;
    new-instance v2, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v2}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 1156
    .local v2, "wiFiSecurityUtil":Lcom/belkin/utils/WiFiSecurityUtil;
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v4}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 1157
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 1158
    .local v1, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1159
    const-string v3, "1"

    aput-object v3, v0, v6

    .line 1163
    :goto_0
    const/4 v3, 0x2

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 1164
    const/4 v3, 0x3

    new-instance v4, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 1165
    const/4 v3, 0x4

    const-string v4, ""

    aput-object v4, v0, v3

    .line 1166
    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v0, v3

    .line 1167
    const/4 v3, 0x6

    const-string v4, ""

    aput-object v4, v0, v3

    .line 1168
    const/4 v3, 0x7

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v4}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 1170
    return-object v0

    .line 1161
    :cond_0
    const-string v3, "0"

    aput-object v3, v0, v6

    goto :goto_0
.end method

.method private parseAPList()Lorg/json/JSONArray;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 236
    const-string v13, ""

    .line 237
    .local v13, "response":Ljava/lang/String;
    new-instance v12, Lcom/belkin/beans/APListResponseBean;

    invoke-direct {v12}, Lcom/belkin/beans/APListResponseBean;-><init>()V

    .line 238
    .local v12, "respObject":Lcom/belkin/beans/APListResponseBean;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v16, v0

    const-string v17, "GetNetworkList"

    invoke-virtual/range {v16 .. v17}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v10

    .line 239
    .local v10, "newAction":Lorg/cybergarage/upnp/Action;
    sget-object v16, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "newAction: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 241
    if-nez v10, :cond_1

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v16, v0

    const-string v17, "GetApList"

    invoke-virtual/range {v16 .. v17}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v3

    .line 244
    .local v3, "action1":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v13

    .line 246
    if-eqz v13, :cond_3

    const-string v16, "app_error"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_3

    .line 247
    new-instance v11, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v11}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 248
    .local v11, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v11, v12, v0, v13}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 249
    const/16 v16, 0x1

    iget v0, v12, Lcom/belkin/beans/APListResponseBean;->totalPagesOfAPList:I

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_3

    .line 250
    const/4 v5, 0x1

    .local v5, "counterForAPListRetrival":I
    :goto_0
    iget v0, v12, Lcom/belkin/beans/APListResponseBean;->totalPagesOfAPList:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v5, v0, :cond_3

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v16, v0

    const-string v17, "GetApList"

    invoke-virtual/range {v16 .. v17}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 252
    .local v2, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 253
    .local v4, "apResponse":Ljava/lang/String;
    const-string v16, "UpnpDeviceSetup"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Post of Action GET AP List Successful itr:::"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    if-eqz v4, :cond_0

    const-string v16, "app_error"

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_0

    .line 255
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v11, v12, v0, v4}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 250
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 263
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "action1":Lorg/cybergarage/upnp/Action;
    .end local v4    # "apResponse":Ljava/lang/String;
    .end local v5    # "counterForAPListRetrival":I
    .end local v11    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    :cond_1
    invoke-virtual {v10}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v13

    .line 265
    if-eqz v13, :cond_3

    const-string v16, "app_error"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_3

    .line 266
    new-instance v11, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v11}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 267
    .restart local v11    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v16, 0xf

    move/from16 v0, v16

    invoke-virtual {v11, v12, v0, v13}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 268
    const/16 v16, 0x1

    iget v0, v12, Lcom/belkin/beans/APListResponseBean;->totalPagesOfAPList:I

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_3

    .line 269
    const/4 v5, 0x1

    .restart local v5    # "counterForAPListRetrival":I
    :goto_1
    iget v0, v12, Lcom/belkin/beans/APListResponseBean;->totalPagesOfAPList:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v5, v0, :cond_3

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v16, v0

    const-string v17, "GetNetworkList"

    invoke-virtual/range {v16 .. v17}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 271
    .restart local v2    # "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 272
    .restart local v4    # "apResponse":Ljava/lang/String;
    const-string v16, "UpnpDeviceSetup"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Post of Action GET Network List Successful itr:::"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    if-eqz v4, :cond_2

    const-string v16, "app_error"

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_2

    .line 274
    const/16 v16, 0xf

    move/from16 v0, v16

    invoke-virtual {v11, v12, v0, v4}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 269
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 281
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "apResponse":Ljava/lang/String;
    .end local v5    # "counterForAPListRetrival":I
    .end local v11    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    :cond_3
    new-instance v15, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v15}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 282
    .local v15, "tempList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;>;"
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->strSSIDList:[Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_4

    .line 283
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->strSSIDList:[Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v6, v0, :cond_4

    .line 284
    new-instance v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V

    .line 285
    .local v8, "info":Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->strSSIDList:[Ljava/lang/String;

    move-object/from16 v16, v0

    aget-object v16, v16, v6

    move-object/from16 v0, v16

    iput-object v0, v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    .line 286
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->nChannel:[Ljava/lang/Integer;

    move-object/from16 v16, v0

    aget-object v16, v16, v6

    move-object/from16 v0, v16

    iput-object v0, v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->channel:Ljava/lang/Integer;

    .line 287
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->strSecurityStrength:[Ljava/lang/String;

    move-object/from16 v16, v0

    aget-object v16, v16, v6

    move-object/from16 v0, v16

    iput-object v0, v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->security:Ljava/lang/String;

    .line 288
    iget-object v0, v12, Lcom/belkin/beans/APListResponseBean;->nSignalStrength:[Ljava/lang/Integer;

    move-object/from16 v16, v0

    aget-object v16, v16, v6

    move-object/from16 v0, v16

    iput-object v0, v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    .line 289
    invoke-interface {v15, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 293
    .end local v6    # "i":I
    .end local v8    # "info":Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
    :cond_4
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    .line 294
    .local v14, "router":Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
    if-eqz v14, :cond_6

    iget-object v0, v14, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_6

    iget-object v0, v14, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->channel:Ljava/lang/Integer;

    move-object/from16 v16, v0

    if-eqz v16, :cond_6

    iget-object v0, v14, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->security:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_6

    iget-object v0, v14, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    move-object/from16 v16, v0

    if-nez v16, :cond_5

    .line 297
    :cond_6
    invoke-interface {v15, v14}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_3

    .line 300
    .end local v14    # "router":Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
    :cond_7
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    .line 301
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    if-eqz v16, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_8

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    new-instance v17, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$1;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V

    invoke-static/range {v16 .. v17}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 318
    :cond_8
    sget-object v16, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "router list size is : "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 319
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v16

    move/from16 v0, v16

    if-ge v6, v0, :cond_c

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    move-object/from16 v16, v0

    if-nez v16, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->security:Ljava/lang/String;

    move-object/from16 v16, v0

    if-nez v16, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->channel:Ljava/lang/Integer;

    move-object/from16 v16, v0

    if-eqz v16, :cond_a

    .line 328
    :cond_9
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 329
    .local v9, "jsonObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v16

    const-string v17, "wemo."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-nez v16, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string v17, "NetCam"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_b

    .line 319
    .end local v9    # "jsonObject":Lorg/json/JSONObject;
    :cond_a
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_4

    .line 333
    .restart local v9    # "jsonObject":Lorg/json/JSONObject;
    :cond_b
    const-string v17, "SSID"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->ssid:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 334
    const-string v17, "Channel"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->channel:Ljava/lang/Integer;

    move-object/from16 v16, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 335
    const-string v17, "SignalStrength"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    move-object/from16 v16, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 336
    const-string v17, "SecurityStrength"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->routerList:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->security:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_5

    .line 342
    .end local v9    # "jsonObject":Lorg/json/JSONObject;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    return-object v16
.end method

.method private preparePairDataXML([Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "argList"    # [Ljava/lang/String;

    .prologue
    .line 1044
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<PairingData><ssid><![CDATA["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]]>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</ssid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<auth>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</auth>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<password>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</password>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<encrypt>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</encrypt>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<channel>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</channel>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</PairingData>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private prepareRegistrationArgXML([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "arrstrRegistrationArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x2

    .line 1053
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<RegistrationData><DeviceId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</DeviceId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<DeviceName>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<![CDATA["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]]>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</DeviceName>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<smartprivateKey>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    aget-object v0, p1, v2

    if-nez v0, :cond_1

    :cond_0
    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</smartprivateKey>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<ReUnionKey>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, ""

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</ReUnionKey>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</RegistrationData>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    aget-object v0, p1, v2

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    aget-object v0, p1, v0

    goto :goto_1
.end method

.method private prepareRegistrationArgs()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1064
    const/4 v2, 0x4

    new-array v0, v2, [Ljava/lang/String;

    .line 1065
    .local v0, "arrstrRegistrationArgs":[Ljava/lang/String;
    new-instance v1, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v1}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 1067
    .local v1, "wiFiSecurityUtil":Lcom/belkin/utils/WiFiSecurityUtil;
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v3}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 1068
    const/4 v2, 0x1

    new-instance v3, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 1069
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 1070
    const/4 v2, 0x3

    new-instance v3, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;->generateReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 1072
    invoke-direct {p0, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->prepareRegistrationArgXML([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 3
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 719
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 720
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 721
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 724
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 726
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private timeSync()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 735
    const/4 v6, 0x4

    new-array v0, v6, [Ljava/lang/String;

    .line 736
    .local v0, "argList":[Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v5

    .line 738
    .local v5, "t":Ljava/util/TimeZone;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v2

    .line 739
    .local v2, "offset":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    div-int/lit8 v3, v6, 0x3c

    .line 740
    .local v3, "offsetHrs":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    rem-int/lit8 v4, v6, 0x3c

    .line 741
    .local v4, "offsetMins":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v8

    .line 742
    const/16 v6, 0x1e

    if-ne v4, v6, :cond_0

    .line 743
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v0, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".5"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v8

    .line 746
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {v1, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 747
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v5, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 748
    const-string v6, "1"

    aput-object v6, v0, v9

    .line 753
    :goto_0
    invoke-virtual {v5}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 754
    const-string v6, "1"

    aput-object v6, v0, v10

    .line 758
    :goto_1
    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v6

    .line 764
    return-object v0

    .line 750
    :cond_1
    const-string v6, "0"

    aput-object v6, v0, v9

    goto :goto_0

    .line 756
    :cond_2
    const-string v6, "0"

    aput-object v6, v0, v10

    goto :goto_1
.end method


# virtual methods
.method public addBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 16
    .param p1, "LedDeviceIds"    # Lorg/json/JSONArray;

    .prologue
    .line 634
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 636
    .local v11, "tempJsonArray":Lorg/json/JSONArray;
    :try_start_0
    const-string v13, "UpnpDeviceSetup"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "LED DEVICE IDS: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 639
    .local v5, "devIds":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v7, v13, :cond_1

    .line 640
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 641
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ge v7, v13, :cond_0

    .line 642
    const-string v13, ","

    invoke-virtual {v5, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 639
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 644
    :cond_1
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 646
    .local v9, "strDevIds":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 647
    .local v4, "devIdFriendlyNames":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    :goto_1
    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v7, v13, :cond_3

    .line 648
    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 649
    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ge v7, v13, :cond_2

    .line 650
    const-string v13, ","

    invoke-virtual {v4, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 647
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 652
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 654
    .local v10, "strdevIdFriendlyNames":Ljava/lang/String;
    const-string v13, "UpnpDeviceSetup"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "----- add dev ids:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "---"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 656
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v12

    .line 657
    .local v12, "udn":Ljava/lang/String;
    invoke-virtual {v3, v12}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "AddDeviceName"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 658
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_ADD_DEVICEIDS:[Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v9, v14, v15

    const/4 v15, 0x1

    aput-object v10, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v13, v14}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 659
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    .line 660
    const-string v13, "UpnpDeviceSetup"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "get add devices n/w===+"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    new-instance v8, Lcom/belkin/upnp/parser/LedDeviceResponseParser;

    invoke-direct {v8}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;-><init>()V

    .line 662
    .local v8, "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    invoke-virtual {v8, v13}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 663
    .local v2, "bridgeObj":Lorg/json/JSONObject;
    const-string v13, "bridgeUDN"

    invoke-virtual {v2, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 664
    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 668
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "bridgeObj":Lorg/json/JSONObject;
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "devIdFriendlyNames":Ljava/lang/StringBuffer;
    .end local v5    # "devIds":Ljava/lang/StringBuffer;
    .end local v7    # "i":I
    .end local v8    # "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    .end local v9    # "strDevIds":Ljava/lang/String;
    .end local v10    # "strdevIdFriendlyNames":Ljava/lang/String;
    .end local v12    # "udn":Ljava/lang/String;
    :goto_2
    return-object v11

    .line 665
    :catch_0
    move-exception v6

    .line 666
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public closeBridgeNetwork()Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 676
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 678
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->postTimeSync()Lorg/json/JSONObject;

    .line 679
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v4, "CloseNetwork"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 680
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVUDN:[Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {p0, v0, v3, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 681
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 682
    .local v2, "response":Ljava/lang/String;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CLOSE NETWORK RESPOMSE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 683
    if-eqz v2, :cond_0

    .line 684
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "CloseNetwork"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    .line 688
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 686
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "response":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "CloseNetwork"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 687
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "response":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 688
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "CloseNetwork"

    invoke-virtual {v3, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_0
.end method

.method public closeSetup()Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 832
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 834
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->postTimeSync()Lorg/json/JSONObject;

    .line 835
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->storeAPData()V

    .line 837
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v6, "CloseSetup"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 838
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 839
    .local v4, "response":Ljava/lang/String;
    new-instance v2, Lcom/belkin/upnp/parser/CloseSetupResponseParser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/CloseSetupResponseParser;-><init>()V

    .line 840
    .local v2, "closeSetupResponseParser":Lcom/belkin/upnp/parser/CloseSetupResponseParser;
    invoke-virtual {v2, v4}, Lcom/belkin/upnp/parser/CloseSetupResponseParser;->parseCloseSetupResponse(Ljava/lang/String;)Lcom/belkin/beans/CloseSetupResponseBean;

    move-result-object v1

    .line 841
    .local v1, "closeSetupResponseBean":Lcom/belkin/beans/CloseSetupResponseBean;
    invoke-virtual {v1}, Lcom/belkin/beans/CloseSetupResponseBean;->getCloseSetupStatus()Ljava/lang/String;

    move-result-object v5

    const-string v6, "success"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 842
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseSetup"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    .line 846
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "closeSetupResponseBean":Lcom/belkin/beans/CloseSetupResponseBean;
    .end local v2    # "closeSetupResponseParser":Lcom/belkin/upnp/parser/CloseSetupResponseParser;
    .end local v4    # "response":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 843
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "closeSetupResponseBean":Lcom/belkin/beans/CloseSetupResponseBean;
    .restart local v2    # "closeSetupResponseParser":Lcom/belkin/upnp/parser/CloseSetupResponseParser;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseSetup"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 845
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "closeSetupResponseBean":Lcom/belkin/beans/CloseSetupResponseBean;
    .end local v2    # "closeSetupResponseParser":Lcom/belkin/upnp/parser/CloseSetupResponseParser;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 846
    .local v3, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseSetup"

    invoke-virtual {v5, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    goto :goto_0
.end method

.method public connectHomeNetwork([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "argList"    # [Ljava/lang/String;

    .prologue
    .line 1009
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v4, "ConnectHomeNetwork"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1010
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->keyList:[Ljava/lang/String;

    invoke-direct {p0, v0, v3, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1011
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 1012
    .local v2, "response":Ljava/lang/String;
    const-string v3, "UpnpDeviceSetup"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connectHomeNetwork :: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1013
    const-string v3, "true"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1017
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 1014
    :catch_0
    move-exception v1

    .line 1015
    .local v1, "exception":Ljava/lang/Exception;
    const-string v3, "UpnpDeviceSetup"

    const-string v4, "connectHomeNetwork :: exception"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1017
    const-string v3, "false"

    goto :goto_0
.end method

.method public domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 23
    .param p1, "onORoff"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "capabilityID"    # Ljava/lang/String;
    .param p4, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 506
    const/16 v16, 0x0

    .line 508
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v10

    .line 509
    .local v10, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v10}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v9

    .line 512
    .local v9, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v8

    .line 514
    .local v8, "doc":Lorg/w3c/dom/Document;
    const-string v20, "DeviceStatus"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 515
    .local v7, "deviceStatusTag":Lorg/w3c/dom/Element;
    invoke-interface {v8, v7}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 518
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 519
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 520
    .local v5, "devIdslist":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_1

    .line 522
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v12

    .line 523
    .local v12, "groupAvailableTag1":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 524
    invoke-interface {v7, v12}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 527
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 528
    .local v6, "deviceIdTag":Lorg/w3c/dom/Element;
    aget-object v20, v5, v13

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 529
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 530
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 531
    .local v2, "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 532
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 535
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 536
    .local v3, "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 537
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 540
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 541
    .local v4, "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 542
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 520
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 547
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v5    # "devIdslist":[Ljava/lang/String;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v12    # "groupAvailableTag1":Lorg/w3c/dom/Element;
    .end local v13    # "i":I
    :cond_0
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v11

    .line 548
    .local v11, "groupAvailableTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v11, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 549
    invoke-interface {v7, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 552
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 553
    .restart local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p2

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 554
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 555
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 556
    .restart local v2    # "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 557
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 560
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 561
    .restart local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 562
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 565
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 566
    .restart local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 567
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 571
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v11    # "groupAvailableTag":Lorg/w3c/dom/Element;
    :cond_1
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v18

    .line 572
    .local v18, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v19, Ljava/io/StringWriter;

    invoke-direct/range {v19 .. v19}, Ljava/io/StringWriter;-><init>()V

    .line 573
    .local v19, "writer":Ljava/io/StringWriter;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 574
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v20, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v20

    invoke-direct {v0, v8}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 577
    invoke-virtual/range {v19 .. v19}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 578
    const-string v20, "UpnpDeviceSetup"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "File saved!"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 584
    .end local v7    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v8    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v10    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v18    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v19    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 579
    :catch_0
    move-exception v14

    .line 580
    .local v14, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v14}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 581
    .end local v14    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 582
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method public editIcon(Ljava/lang/String;)Z
    .locals 7
    .param p1, "iconLocation"    # Ljava/lang/String;

    .prologue
    .line 869
    const/4 v2, 0x0

    .line 870
    .local v2, "isSuccess":Z
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 871
    const-string v4, "UpnpDeviceSetup"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "editIcon during setup. Icon location: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    :try_start_0
    const-string v4, "file:///android_asset/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 877
    const-string v4, "file:///android_asset/"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 878
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 883
    .local v1, "iconBitmap":Landroid/graphics/Bitmap;
    :goto_0
    if-eqz v1, :cond_2

    .line 884
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/icon.jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 885
    .local v3, "url":Ljava/lang/String;
    invoke-static {v1}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v4

    const/16 v5, 0x3a98

    invoke-static {v3, v4, v5}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 893
    .end local v1    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "url":Ljava/lang/String;
    :cond_0
    :goto_1
    const-string v4, "UpnpDeviceSetup"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "editIcon during setup. isSuccess:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 894
    return v2

    .line 880
    :cond_1
    :try_start_1
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .restart local v1    # "iconBitmap":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 887
    :cond_2
    const-string v4, "UpnpDeviceSetup"

    const-string v5, "Failed to get bitmap from file in editIcon during setup"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 889
    .end local v1    # "iconBitmap":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v0

    .line 890
    .local v0, "ex":Ljava/io/IOException;
    const-string v4, "UpnpDeviceSetup"

    const-string v5, "IOException while reading file in editIcon during setup: "

    invoke-static {v4, v5, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public enableRemoteAccess()Lorg/json/JSONObject;
    .locals 7

    .prologue
    .line 953
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 954
    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getRemoteAccessAgrs()[Ljava/lang/String;

    move-result-object v2

    .line 956
    .local v2, "remoteAccessArg":[Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v6, "RemoteAccess"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 957
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_REMOTE_ACESS_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v5, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 958
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 959
    .local v4, "response":Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 960
    new-instance v3, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;-><init>()V

    .line 961
    .local v3, "remoteAccessResponseParser":Lcom/belkin/upnp/parser/RemoteAccessResponseParser;
    invoke-virtual {v3, v4}, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 967
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "remoteAccessResponseParser":Lcom/belkin/upnp/parser/RemoteAccessResponseParser;
    .end local v4    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    return-object v5

    .line 964
    :catch_0
    move-exception v1

    .line 965
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getAllApList()Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    .line 176
    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->parseAPList()Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    .line 178
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonArray:Lorg/json/JSONArray;

    return-object v0
.end method

.method public getAttribute()Lorg/json/JSONObject;
    .locals 7

    .prologue
    .line 899
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 901
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v5, "GetAttributes"

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 902
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 903
    .local v3, "response":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 904
    new-instance v2, Lcom/belkin/upnp/parser/GetAttributeMakerParser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetAttributeMakerParser;-><init>()V

    .line 905
    .local v2, "getAttributeResponseParser":Lcom/belkin/upnp/parser/GetAttributeMakerParser;
    invoke-virtual {v2, v3}, Lcom/belkin/upnp/parser/GetAttributeMakerParser;->parseGetAttributeRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    iput-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 910
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "getAttributeResponseParser":Lcom/belkin/upnp/parser/GetAttributeMakerParser;
    .end local v3    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    return-object v4

    .line 907
    :catch_0
    move-exception v1

    .line 908
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "UpnpDeviceSetup"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in getAttribute:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getCustomState()Lorg/json/JSONObject;
    .locals 9

    .prologue
    .line 933
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 935
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v7, "GetCustomizedState"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 936
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 937
    .local v5, "response":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 938
    new-instance v4, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;-><init>()V

    .line 939
    .local v4, "resetCustomizedParser":Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;
    invoke-virtual {v4, v5}, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->parseCustomizedResponse(Ljava/lang/String;)Lcom/belkin/beans/ResetCustomizedResponseBean;

    move-result-object v3

    .line 940
    .local v3, "resetCustomizedBean":Lcom/belkin/beans/ResetCustomizedResponseBean;
    invoke-virtual {v3}, Lcom/belkin/beans/ResetCustomizedResponseBean;->getCustomizedState()Ljava/lang/String;

    move-result-object v1

    .line 941
    .local v1, "customState":Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v7, "SetCustomizedState"

    invoke-virtual {v6, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 946
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "customState":Ljava/lang/String;
    .end local v3    # "resetCustomizedBean":Lcom/belkin/beans/ResetCustomizedResponseBean;
    .end local v4    # "resetCustomizedParser":Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;
    .end local v5    # "response":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 943
    :catch_0
    move-exception v2

    .line 944
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceSetup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception in getCustomState:: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 946
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0
.end method

.method public getDeviceType(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 1181
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirstDeviceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1185
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIconUrl()Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 793
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 795
    :try_start_0
    const-string v3, ""

    .line 796
    .local v3, "argumentValueStr":Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v7, "GetIconURL"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 797
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 799
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v2

    .line 800
    .local v2, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v6

    if-lez v6, :cond_1

    .line 802
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 803
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/Argument;

    .line 804
    .local v1, "argument":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 805
    if-eqz v3, :cond_0

    .line 810
    .end local v1    # "argument":Lorg/cybergarage/upnp/Argument;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v7, "GetIconURL"

    invoke-virtual {v6, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 812
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v3    # "argumentValueStr":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 811
    :catch_0
    move-exception v4

    .line 812
    .local v4, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v7, "GetIconURL"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    goto :goto_0
.end method

.method public getMetaInfo(Landroid/content/Context;)[Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 976
    const-string v6, "UpnpDeviceSetup"

    const-string v7, "getMetaInfo"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 977
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v7, "GetMetaInfo"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 978
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 979
    .local v5, "response":Ljava/lang/String;
    const-string v6, "UpnpDeviceSetup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Value : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 981
    const/4 v3, 0x0

    .line 982
    .local v3, "metaParseData":Ljava/lang/String;
    const/4 v2, 0x0

    .line 984
    .local v2, "metaArray":[Ljava/lang/String;
    new-instance v1, Lcom/belkin/beans/MetaDataResponseBean;

    invoke-direct {v1}, Lcom/belkin/beans/MetaDataResponseBean;-><init>()V

    .line 985
    .local v1, "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    if-eqz v5, :cond_1

    const-string v6, "app_error"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 986
    new-instance v4, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 987
    .local v4, "parseResponse1":Lcom/belkin/upnp/parser/Parser;
    const/16 v6, 0x9

    invoke-virtual {v4, v1, v6, v5}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 989
    if-eqz v1, :cond_0

    .line 990
    invoke-virtual {v1}, Lcom/belkin/beans/MetaDataResponseBean;->getMetadata()Ljava/lang/String;

    move-result-object v3

    .line 991
    const-string v6, "\\|"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1001
    .end local v4    # "parseResponse1":Lcom/belkin/upnp/parser/Parser;
    :cond_0
    :goto_0
    return-object v2

    .line 994
    :cond_1
    const-string v6, "UpnpDeviceSetup"

    const-string v7, "metaArray is null or response has error"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getNetworkStatus()I
    .locals 8

    .prologue
    .line 1081
    :try_start_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v6, "GetNetworkStatus"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1082
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 1083
    .local v4, "statusResponse":Ljava/lang/String;
    const-string v5, "UpnpDeviceSetup"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getNetworkStatus() :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1084
    new-instance v3, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;-><init>()V

    .line 1085
    .local v3, "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    invoke-virtual {v3, v4}, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lcom/belkin/beans/NetworkStatusResponseBean;

    move-result-object v2

    .line 1086
    .local v2, "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    invoke-virtual {v2}, Lcom/belkin/beans/NetworkStatusResponseBean;->getStatus()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 1089
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    .end local v3    # "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    .end local v4    # "statusResponse":Ljava/lang/String;
    :goto_0
    return v5

    .line 1087
    :catch_0
    move-exception v1

    .line 1088
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "UpnpDeviceSetup"

    const-string v6, "getNetworkStatus() :: Exception"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1089
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public isSmartSetup()Z
    .locals 2

    .prologue
    .line 1188
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v1, "GetRegistrationData"

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isSuperSmartSetup()Z
    .locals 2

    .prologue
    .line 1191
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v1, "GetCustomizedState"

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public networkStatus()Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 772
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 774
    :try_start_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v6, "GetNetworkStatus"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 776
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 777
    .local v4, "statusResponse":Ljava/lang/String;
    new-instance v3, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;-><init>()V

    .line 778
    .local v3, "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    invoke-virtual {v3, v4}, Lcom/belkin/upnp/parser/NetworkStatusResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lcom/belkin/beans/NetworkStatusResponseBean;

    move-result-object v2

    .line 779
    .local v2, "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    invoke-virtual {v2}, Lcom/belkin/beans/NetworkStatusResponseBean;->getStatus()I

    move-result v5

    if-ne v5, v7, :cond_0

    .line 780
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "GetNetworkStatus"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    .line 783
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    .end local v3    # "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    .end local v4    # "statusResponse":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 781
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    .restart local v3    # "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    .restart local v4    # "statusResponse":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "GetNetworkStatus"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 782
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "networkStatusResponseBean":Lcom/belkin/beans/NetworkStatusResponseBean;
    .end local v3    # "networkStatusResponseParser":Lcom/belkin/upnp/parser/NetworkStatusResponseParser;
    .end local v4    # "statusResponse":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 783
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "GetNetworkStatus"

    invoke-virtual {v5, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    goto :goto_0
.end method

.method public openBridgeNetwork()Lorg/json/JSONArray;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 353
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 354
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 355
    .local v6, "tempJsonArray":Lorg/json/JSONArray;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 356
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "IN OPEN NETWORK SIZE"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "---"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v8, "OpenNetwork"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 359
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVUDN:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 360
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 361
    .local v3, "statusResponse":Ljava/lang/String;
    const-string v7, "UpnpDeviceSetup"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "=========open network===="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    if-eqz v3, :cond_0

    .line 363
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "OpenNetwork"

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 364
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 365
    .local v4, "seconds":J
    const-wide/16 v8, 0xff

    add-long/2addr v8, v4

    iput-wide v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->timeOpenNetworkCheck:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 372
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "statusResponse":Ljava/lang/String;
    .end local v4    # "seconds":J
    :goto_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 373
    return-object v6

    .line 368
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "statusResponse":Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "OpenNetwork"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 369
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "statusResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 370
    .local v2, "e":Ljava/lang/Exception;
    const-string v7, "UpnpDeviceSetup"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public pairAndRegister([Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "argList"    # [Ljava/lang/String;

    .prologue
    .line 1026
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->postTimeSync()Lorg/json/JSONObject;

    .line 1027
    const/4 v4, 0x2

    new-array v1, v4, [Ljava/lang/String;

    .line 1028
    .local v1, "argArray":[Ljava/lang/String;
    const/4 v4, 0x0

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->preparePairDataXML([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v4

    .line 1029
    const/4 v4, 0x1

    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->prepareRegistrationArgs()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v4

    .line 1030
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v5, "PairAndRegister"

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1031
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->PAIR_AND_REGISTER_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v4, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1032
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 1033
    .local v3, "response":Ljava/lang/String;
    const-string v4, "UpnpDeviceSetup"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pairAndRegister response :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    const-string v4, "true"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1038
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argArray":[Ljava/lang/String;
    .end local v3    # "response":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 1035
    :catch_0
    move-exception v2

    .line 1036
    .local v2, "exception":Ljava/lang/Exception;
    const-string v4, "UpnpDeviceSetup"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pairAndRegister Exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1038
    const-string v4, "false"

    goto :goto_0
.end method

.method public parseGetEndDeviceList()Lorg/json/JSONArray;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 451
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 452
    .local v3, "jsonArrayForLED":Lorg/json/JSONArray;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 453
    .local v4, "seconds":J
    const-string v7, "UpnpDeviceSetup"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "seconds***"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "----"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->timeOpenNetworkCheck:J

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    const-wide/16 v8, 0x1f4

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    .line 457
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 458
    .local v6, "udn":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v8, "GetEndDevices"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 459
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v6, v8, v9

    const/4 v9, 0x1

    sget-object v10, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$getEndList;->SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$getEndList;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 460
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    .line 461
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "RESPONSE of Get end devices IS :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 462
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 463
    new-instance v2, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;-><init>()V

    .line 464
    .local v2, "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 466
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 467
    const-string v7, "0"

    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 494
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    .end local v6    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "LED get end devices******"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 495
    return-object v3

    .line 470
    :catch_0
    move-exception v1

    .line 472
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method public postTimeSync()Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 698
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 700
    :try_start_0
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v3, "TimeSync"

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 701
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_TIME_SYNC_ARGS:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->timeSync()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 702
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "failure"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 703
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "TimeSync"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    .line 706
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_0
    return-object v2

    .line 704
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_0
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "TimeSync"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 705
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :catch_0
    move-exception v1

    .line 706
    .local v1, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "TimeSync"

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_0
.end method

.method public setAttribute(Lorg/json/JSONObject;)Z
    .locals 8
    .param p1, "attributeList"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 401
    const/4 v4, 0x1

    .line 403
    .local v4, "result":Z
    const/4 v5, 0x1

    :try_start_0
    new-array v2, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->createAttributeList(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    .line 404
    .local v2, "argument":[Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v6, "SetAttributes"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 405
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_ATTRIBUTE_KEYS:[Ljava/lang/String;

    invoke-direct {p0, v0, v5, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 406
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 407
    .local v1, "actionResult":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 408
    const/4 v4, 0x0

    .line 416
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    .end local v2    # "argument":[Ljava/lang/String;
    :goto_0
    return v4

    .line 410
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "actionResult":Ljava/lang/String;
    .restart local v2    # "argument":[Ljava/lang/String;
    :cond_0
    new-instance v5, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;

    invoke-direct {v5}, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;-><init>()V

    invoke-virtual {v5, v1}, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->parseSetAttributeRespone(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    goto :goto_0

    .line 412
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    .end local v2    # "argument":[Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 414
    .local v3, "ex":Ljava/lang/Exception;
    const-string v5, "UpnpDeviceSetup"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception in setAttribute:: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setCustomState()Lorg/json/JSONObject;
    .locals 9

    .prologue
    .line 915
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 917
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v7, "SetCustomizedState"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 918
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 919
    .local v5, "response":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 920
    new-instance v4, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;-><init>()V

    .line 921
    .local v4, "resetCustomizedParser":Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;
    invoke-virtual {v4, v5}, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->parseCustomizedResponse(Ljava/lang/String;)Lcom/belkin/beans/ResetCustomizedResponseBean;

    move-result-object v3

    .line 922
    .local v3, "resetCustomizedBean":Lcom/belkin/beans/ResetCustomizedResponseBean;
    invoke-virtual {v3}, Lcom/belkin/beans/ResetCustomizedResponseBean;->getCustomizedState()Ljava/lang/String;

    move-result-object v1

    .line 923
    .local v1, "customState":Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v7, "SetCustomizedState"

    invoke-virtual {v6, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 928
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "customState":Ljava/lang/String;
    .end local v3    # "resetCustomizedBean":Lcom/belkin/beans/ResetCustomizedResponseBean;
    .end local v4    # "resetCustomizedParser":Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;
    .end local v5    # "response":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 925
    :catch_0
    move-exception v2

    .line 926
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceSetup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception in setCustomState:: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0
.end method

.method public setFriendlyName([Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "friendlyName"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 855
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 857
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v4, "ChangeFriendlyName"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 858
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_FRIENDLY_NAME_ARGS_KEYS:[Ljava/lang/String;

    invoke-direct {p0, v0, v3, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 859
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 860
    .local v2, "response":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 861
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "ChangeFriendlyName"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    .line 864
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 862
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "response":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "ChangeFriendlyName"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 863
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "response":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 864
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "ChangeFriendlyName"

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_0
.end method

.method public setIcon(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "iconUrl"    # Ljava/lang/String;

    .prologue
    .line 822
    if-eqz p1, :cond_0

    .line 823
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    const/16 v1, 0x3a98

    invoke-static {p2, v0, v1}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)Z

    .line 825
    :cond_0
    return-void
.end method

.method public setIconUsingUri(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "iconUrl"    # Ljava/lang/String;

    .prologue
    .line 1098
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1099
    .local v0, "bfo":Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x1

    iput v4, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1100
    const/4 v4, 0x0

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 1101
    const/4 v1, 0x0

    .line 1103
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_sensor_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1104
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_sensor_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 1136
    :goto_0
    if-eqz v1, :cond_0

    .line 1137
    invoke-static {v1}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v4

    const/16 v5, 0x3a98

    invoke-static {p2, v4, v5}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)Z

    .line 1138
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getSetupDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 1139
    .local v2, "d":Lorg/cybergarage/upnp/Device;
    if-eqz v2, :cond_0

    .line 1140
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v4

    const-string v5, "0"

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, p2, v5, v6}, Lcom/belkin/wemo/storage/FileStorage;->saveIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 1142
    .end local v2    # "d":Lorg/cybergarage/upnp/Device;
    :cond_0
    return-void

    .line 1105
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_switch_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1106
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_switch_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 1107
    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_light_switch_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1108
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_light_switch_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 1109
    :cond_3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_insight_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1110
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_insight_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 1111
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_icbulb_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1112
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_icbulb_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1113
    :cond_5
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_heater.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1114
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_heater.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1115
    :cond_6
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_airpurifier.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1116
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_airpurifier.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1117
    :cond_7
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_humidifier.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1118
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_humidifier.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1119
    :cond_8
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_humidifierb.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1120
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_humidifierb.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1121
    :cond_9
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_coffeemaker.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1122
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_coffeemaker.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1124
    :cond_a
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file:///android_asset/www/img/belkin_maker_small.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1125
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "www/img/belkin_maker_small.png"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 1127
    :cond_b
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto/16 :goto_0

    .line 1129
    :catch_0
    move-exception v3

    .line 1130
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 1131
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 1132
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 9
    .param p1, "params"    # Lorg/json/JSONArray;
    .param p2, "Ledparams"    # Lorg/json/JSONArray;

    .prologue
    .line 590
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 591
    .local v5, "setStatus":Lorg/json/JSONArray;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->jsonObject:Lorg/json/JSONObject;

    .line 592
    const-string v6, "UpnpDeviceSetup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "status of set status array:********"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "--"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 595
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->onORoff:Ljava/lang/String;

    .line 597
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 598
    .local v0, "devIds":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 599
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 600
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v2, v6, :cond_0

    .line 601
    const-string v6, ","

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 598
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 604
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->deviceId:Ljava/lang/String;

    .line 606
    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->capabilityID:Ljava/lang/String;

    .line 607
    const/4 v6, 0x2

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isGroupAction:Ljava/lang/String;

    .line 608
    const-string v6, "UpnpDeviceSetup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "status of set status:********"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->onORoff:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "------"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->deviceId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    new-instance v4, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;

    invoke-direct {v4, p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V

    .line 622
    .local v4, "runnable":Ljava/lang/Runnable;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 623
    .local v3, "mythread":Ljava/lang/Thread;
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 629
    .end local v0    # "devIds":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    .end local v3    # "mythread":Ljava/lang/Thread;
    .end local v4    # "runnable":Ljava/lang/Runnable;
    :goto_1
    return-object v5

    .line 625
    :catch_0
    move-exception v1

    .line 626
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public storeAPData()V
    .locals 15

    .prologue
    const/16 v14, 0x7c

    .line 1206
    const-string v2, ""

    .line 1207
    .local v2, "apValues":Ljava/lang/String;
    const-string v5, ""

    .line 1208
    .local v5, "mSignalStrength":Ljava/lang/String;
    const-string v3, ""

    .line 1209
    .local v3, "mFriendlyName":Ljava/lang/String;
    const-string v10, ""

    .line 1211
    .local v10, "serialNumber":Ljava/lang/String;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getMetaInfo(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v7

    .line 1212
    .local v7, "metaArray":[Ljava/lang/String;
    const/4 v11, 0x1

    aget-object v10, v7, v11

    .line 1213
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "serialNumber is : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1215
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v12, "GetFriendlyName"

    invoke-virtual {v11, v12}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 1216
    .local v1, "actionPost1":Lorg/cybergarage/upnp/Action;
    if-eqz v1, :cond_0

    .line 1217
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 1218
    .local v4, "mFriendlyNameResponse":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 1219
    new-instance v9, Lcom/belkin/beans/FriendlyNameResponseBean;

    invoke-direct {v9}, Lcom/belkin/beans/FriendlyNameResponseBean;-><init>()V

    .line 1220
    .local v9, "respObject":Lcom/belkin/beans/FriendlyNameResponseBean;
    new-instance v8, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v8}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 1221
    .local v8, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/4 v11, 0x4

    invoke-virtual {v8, v9, v11, v4}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 1222
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Lcom/belkin/beans/FriendlyNameResponseBean;->getStrFriendlyName()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_0

    .line 1223
    invoke-virtual {v9}, Lcom/belkin/beans/FriendlyNameResponseBean;->getStrFriendlyName()Ljava/lang/String;

    move-result-object v3

    .line 1224
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "friendly name is : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1228
    .end local v4    # "mFriendlyNameResponse":Ljava/lang/String;
    .end local v8    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v9    # "respObject":Lcom/belkin/beans/FriendlyNameResponseBean;
    :cond_0
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v12, "GetSignalStrength"

    invoke-virtual {v11, v12}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1229
    .local v0, "actionPost":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_1

    .line 1230
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 1231
    .local v6, "mSignalStrengthResponse":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 1232
    new-instance v9, Lcom/belkin/beans/SignalStrengthResponseBean;

    invoke-direct {v9}, Lcom/belkin/beans/SignalStrengthResponseBean;-><init>()V

    .line 1233
    .local v9, "respObject":Lcom/belkin/beans/SignalStrengthResponseBean;
    new-instance v8, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v8}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 1234
    .restart local v8    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v11, 0xe

    invoke-virtual {v8, v9, v11, v6}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 1235
    if-eqz v9, :cond_1

    invoke-virtual {v9}, Lcom/belkin/beans/SignalStrengthResponseBean;->getSignalStrength()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_1

    .line 1236
    invoke-virtual {v9}, Lcom/belkin/beans/SignalStrengthResponseBean;->getSignalStrength()Ljava/lang/String;

    move-result-object v5

    .line 1237
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "signal strength is : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1241
    .end local v6    # "mSignalStrengthResponse":Ljava/lang/String;
    .end local v8    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v9    # "respObject":Lcom/belkin/beans/SignalStrengthResponseBean;
    :cond_1
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1242
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveAPValues(Ljava/lang/String;)V

    .line 1244
    return-void
.end method
