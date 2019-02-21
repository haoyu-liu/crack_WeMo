.class public Lcom/belkin/devices/ScheduleDevices;
.super Ljava/lang/Object;
.source "ScheduleDevices.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

.field private rDB:Lcom/belkin/rules/db/RulesDb;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    :try_start_0
    iput-object p1, p0, Lcom/belkin/devices/ScheduleDevices;->mContext:Landroid/content/Context;

    .line 20
    iget-object v1, p0, Lcom/belkin/devices/ScheduleDevices;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/rules/db/RulesDb;->getRulesDatabase(Landroid/content/Context;)Lcom/belkin/rules/db/RulesDb;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/devices/ScheduleDevices;->rDB:Lcom/belkin/rules/db/RulesDb;

    .line 21
    iget-object v1, p0, Lcom/belkin/devices/ScheduleDevices;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/devices/ScheduleDevices;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :goto_0
    return-void

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public updateDeviceSchedule(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 28
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/belkin/devices/ScheduleDevices;->updateDeviceSchedule([Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public updateDeviceSchedule([Ljava/lang/String;)V
    .locals 10
    .param p1, "udns"    # [Ljava/lang/String;

    .prologue
    const/4 v9, 0x7

    .line 32
    new-instance v5, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;

    iget-object v8, p0, Lcom/belkin/devices/ScheduleDevices;->mContext:Landroid/content/Context;

    invoke-direct {v5, v8}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;-><init>(Landroid/content/Context;)V

    .line 34
    .local v5, "schdStrConst":Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v7, v0, v2

    .line 35
    .local v7, "udn":Ljava/lang/String;
    const/16 v8, 0x8

    new-array v4, v8, [Ljava/lang/String;

    .line 38
    .local v4, "schStr":[Ljava/lang/String;
    aput-object v7, v4, v9

    .line 40
    const/4 v1, 0x1

    .local v1, "day":I
    :goto_1
    if-gt v1, v9, :cond_2

    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v8, v7}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getScheduleString(Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 42
    .local v6, "tmp":Ljava/lang/String;
    const-string v8, "0"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 44
    const-string v6, ""

    .line 46
    :cond_0
    const/4 v8, 0x1

    if-ne v1, v8, :cond_1

    .line 47
    const/4 v8, 0x6

    aput-object v6, v4, v8

    .line 40
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 49
    :cond_1
    add-int/lit8 v8, v1, -0x2

    aput-object v6, v4, v8

    goto :goto_2

    .line 53
    .end local v6    # "tmp":Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lcom/belkin/devices/ScheduleDevices;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v8, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->updateWeeklyCalenderString([Ljava/lang/String;)Ljava/lang/String;

    .line 34
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 55
    .end local v1    # "day":I
    .end local v4    # "schStr":[Ljava/lang/String;
    .end local v7    # "udn":Ljava/lang/String;
    :cond_3
    return-void
.end method
