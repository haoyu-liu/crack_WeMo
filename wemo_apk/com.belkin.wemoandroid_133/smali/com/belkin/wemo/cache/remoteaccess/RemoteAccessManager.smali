.class public Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
.super Ljava/lang/Object;
.source "RemoteAccessManager.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static lastDeviceIndex:I


# instance fields
.field private mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private mContext:Landroid/content/Context;

.field private mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "RemoteAccessManager"

    sput-object v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    .line 39
    const/4 v0, 0x0

    sput v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)V
    .locals 2
    .param p1, "act"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p2, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    .line 44
    iput-object p1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 45
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 46
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 47
    return-void
.end method

.method private getRemoteAccessAgrs()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 150
    const/16 v4, 0x8

    new-array v0, v4, [Ljava/lang/String;

    .line 151
    .local v0, "arrstrRemoteAccessArgs":[Ljava/lang/String;
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v4, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    invoke-direct {v2, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 152
    .local v2, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v3, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;-><init>()V

    .line 154
    .local v3, "wiFiSecurityUtil":Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 155
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 156
    .local v1, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 157
    const-string v4, "1"

    aput-object v4, v0, v6

    .line 161
    :goto_0
    const/4 v4, 0x2

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 162
    const/4 v4, 0x3

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    aput-object v5, v0, v4

    .line 163
    const/4 v4, 0x4

    const-string v5, ""

    aput-object v5, v0, v4

    .line 164
    const/4 v4, 0x5

    const-string v5, ""

    aput-object v5, v0, v4

    .line 165
    const/4 v4, 0x6

    const-string v5, ""

    aput-object v5, v0, v4

    .line 166
    const/4 v4, 0x7

    iget-object v5, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 168
    return-object v0

    .line 159
    :cond_0
    const-string v4, "0"

    aput-object v4, v0, v6

    goto :goto_0
.end method

.method private sendRemoteEnabledBroadcast()V
    .locals 2

    .prologue
    .line 134
    sget-object v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    const-string v1, "Enable Remote Access ACTION successful. Notifying all listeners."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteEnabledNotify()V

    .line 138
    return-void
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 179
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 180
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 181
    sget-object v1, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 185
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 187
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public enableLocationRemoteAccess(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;
    .locals 18
    .param p1, "locationName"    # Ljava/lang/String;

    .prologue
    .line 209
    const/4 v7, 0x0

    .line 210
    .local v7, "location":Lcom/belkin/wemo/cache/location/Location;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 211
    .local v10, "obj":Lorg/json/JSONObject;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->isLocked(Ljava/lang/Integer;)Z

    move-result v15

    if-nez v15, :cond_3

    .line 212
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->setLock(Ljava/lang/Integer;)V

    .line 214
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getRemoteAccessAgrs()[Ljava/lang/String;

    move-result-object v11

    .line 216
    .local v11, "remoteAccessArg":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v14

    .line 217
    .local v14, "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz v14, :cond_2

    .line 218
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getActiveDeviceInfoList()Ljava/util/ArrayList;

    move-result-object v9

    .line 219
    .local v9, "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lez v15, :cond_2

    .line 220
    sget v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-lt v15, v0, :cond_0

    .line 222
    const/4 v15, 0x0

    sput v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    .line 225
    :cond_0
    sget v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 226
    .local v3, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    add-int/lit8 v15, v15, 0x1

    sput v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    .line 228
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 230
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v6, :cond_2

    .line 231
    const-string v15, "RemoteAccess"

    invoke-virtual {v6, v15}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 232
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_REMOTE_ACESS_ARGS:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v15, v11}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 233
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v13

    .line 234
    .local v13, "response":Ljava/lang/String;
    if-nez v13, :cond_1

    .line 236
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    const/4 v8, 0x0

    .line 264
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 268
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v9    # "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v11    # "remoteAccessArg":[Ljava/lang/String;
    .end local v13    # "response":Ljava/lang/String;
    .end local v14    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :goto_0
    return-object v8

    .line 239
    .restart local v1    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v9    # "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v11    # "remoteAccessArg":[Ljava/lang/String;
    .restart local v13    # "response":Ljava/lang/String;
    .restart local v14    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_1
    :try_start_1
    sget-object v15, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "enableLocationRemoteAccess response: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v12, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;

    invoke-direct {v12}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;-><init>()V

    .line 241
    .local v12, "remoteAccessResponseParser":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 243
    const-string v15, "statusCode"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2

    const-string v15, "statusCode"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v16, "S"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 244
    new-instance v8, Lcom/belkin/wemo/cache/location/Location;

    const-string v15, "homeId"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-direct {v8, v15, v0}, Lcom/belkin/wemo/cache/location/Location;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 245
    .end local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    .local v8, "location":Lcom/belkin/wemo/cache/location/Location;
    :try_start_2
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 246
    .local v5, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 247
    invoke-virtual {v8, v5}, Lcom/belkin/wemo/cache/location/Location;->setSsids(Ljava/util/Set;)V

    .line 249
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 250
    .local v2, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 251
    invoke-virtual {v8, v2}, Lcom/belkin/wemo/cache/location/Location;->setArpMacs(Ljava/util/Set;)V

    .line 254
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->sendRemoteEnabledBroadcast()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 264
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    move-object v7, v8

    .end local v8    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    goto :goto_0

    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v3    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v9    # "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v12    # "remoteAccessResponseParser":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
    .end local v13    # "response":Ljava/lang/String;
    :cond_2
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 268
    .end local v11    # "remoteAccessArg":[Ljava/lang/String;
    .end local v14    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_3
    :goto_1
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 261
    :catch_0
    move-exception v4

    .line 262
    .local v4, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 264
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v15

    sget-object v16, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    goto :goto_1

    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v15

    :goto_3
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v16

    sget-object v17, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v17}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    throw v15

    .end local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v1    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v8    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v9    # "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v11    # "remoteAccessArg":[Ljava/lang/String;
    .restart local v12    # "remoteAccessResponseParser":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
    .restart local v13    # "response":Ljava/lang/String;
    .restart local v14    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :catchall_1
    move-exception v15

    move-object v7, v8

    .end local v8    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    goto :goto_3

    .line 261
    .end local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v8    # "location":Lcom/belkin/wemo/cache/location/Location;
    :catch_1
    move-exception v4

    move-object v7, v8

    .end local v8    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v7    # "location":Lcom/belkin/wemo/cache/location/Location;
    goto :goto_2
.end method

.method public enableRemoteAccess()Z
    .locals 20

    .prologue
    .line 59
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .local v10, "obj":Lorg/json/JSONObject;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/Locks;->isLocked(Ljava/lang/Integer;)Z

    move-result v17

    if-nez v17, :cond_6

    .line 61
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/Locks;->setLock(Ljava/lang/Integer;)V

    .line 63
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getRemoteAccessAgrs()[Ljava/lang/String;

    move-result-object v12

    .line 65
    .local v12, "remoteAccessArg":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v15

    .line 66
    .local v15, "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz v15, :cond_5

    .line 67
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getActiveDeviceInfoList()Ljava/util/ArrayList;

    move-result-object v9

    .line 68
    .local v9, "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v9, :cond_5

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_5

    .line 69
    sget v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_0

    .line 71
    const/16 v17, 0x0

    sput v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    .line 75
    :cond_0
    sget v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    add-int/lit8 v17, v17, 0x1

    sput v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->lastDeviceIndex:I

    .line 77
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 78
    .local v4, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v8

    .line 79
    .local v8, "localDevice":Lorg/cybergarage/upnp/Device;
    sget-object v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Trying remote enable for : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    if-eqz v8, :cond_1

    .line 81
    const-string v17, "RemoteAccess"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 82
    .local v2, "action":Lorg/cybergarage/upnp/Action;
    sget-object v17, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_REMOTE_ACESS_ARGS:[Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v2, v1, v12}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 83
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v14

    .line 84
    .local v14, "response":Ljava/lang/String;
    if-nez v14, :cond_2

    .line 86
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 87
    sget-object v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "remote enable failed for : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_2
    sget-object v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "enableRemoteAccess response: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    new-instance v13, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;

    invoke-direct {v13}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;-><init>()V

    .line 92
    .local v13, "remoteAccessResponseParser":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 94
    const-string v17, "statusCode"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_1

    const-string v17, "statusCode"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v18, "S"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 95
    const/16 v16, 0x1

    .line 96
    .local v16, "success":Z
    const-string v17, "privateKeyPhone"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 97
    .local v11, "privateKey":Ljava/lang/String;
    const-string v17, "NOKEY"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_3

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 100
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    const-string v18, "homeId"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 101
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 102
    .local v6, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 105
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 106
    .local v3, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 109
    if-nez v16, :cond_4

    .line 110
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v17, v0

    const-string v18, "0"

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 112
    :cond_4
    sget-object v17, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "remote enable succeeded for : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 116
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->sendRemoteEnabledBroadcast()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    const/16 v17, 0x1

    .line 126
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v18

    sget-object v19, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 130
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v6    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v9    # "mDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v11    # "privateKey":Ljava/lang/String;
    .end local v12    # "remoteAccessArg":[Ljava/lang/String;
    .end local v13    # "remoteAccessResponseParser":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
    .end local v14    # "response":Ljava/lang/String;
    .end local v15    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v16    # "success":Z
    :goto_0
    return v17

    .line 126
    .restart local v12    # "remoteAccessArg":[Ljava/lang/String;
    .restart local v15    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_5
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 130
    .end local v12    # "remoteAccessArg":[Ljava/lang/String;
    .end local v15    # "sdkContext":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_6
    :goto_1
    const/16 v17, 0x0

    goto :goto_0

    .line 123
    :catch_0
    move-exception v5

    .line 124
    .local v5, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    goto :goto_1

    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v17

    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v18

    sget-object v19, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    throw v17
.end method

.method public getARPMacs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getARPMacs()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getHomeId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 195
    iget-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "locationHomeId":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 198
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v0

    .line 200
    :cond_1
    return-object v0
.end method

.method public getHomeSSID()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 191
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getHomeSSIDs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 276
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isRemoteEnabled()Z
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    return v0
.end method
