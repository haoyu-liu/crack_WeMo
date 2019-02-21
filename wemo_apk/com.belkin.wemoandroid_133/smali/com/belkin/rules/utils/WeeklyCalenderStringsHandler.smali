.class public Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;
.super Ljava/lang/Object;
.source "WeeklyCalenderStringsHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONObjectGenerator;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;,
        Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "ScheduleStringConstructor"

    sput-object v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static declared-synchronized getScheduleJSONObject(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "schdDeviceUDNs"    # [Ljava/lang/String;
    .param p2, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;

    .prologue
    .line 41
    const-class v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->TAG:Ljava/lang/String;

    const-string v2, "getScheduleJSONObject: JSON Object requested for number for devices"

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;

    invoke-direct {v0, p2, p3, p1, p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;[Ljava/lang/String;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit v1

    return-void

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getSensorScheduleJSONObject(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sensorDeviceUDNs"    # [Ljava/lang/String;
    .param p2, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;

    .prologue
    .line 46
    const-class v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->TAG:Ljava/lang/String;

    const-string v2, "getSensorScheduleJSONObject: JSON Object requested for number for sesnor devices"

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONObjectGenerator;

    invoke-direct {v0, p2, p3, p1, p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONObjectGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;[Ljava/lang/String;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    monitor-exit v1

    return-void

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
