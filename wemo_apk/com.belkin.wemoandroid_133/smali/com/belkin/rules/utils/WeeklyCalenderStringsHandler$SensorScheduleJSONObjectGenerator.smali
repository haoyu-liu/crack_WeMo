.class Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONObjectGenerator;
.super Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;
.source "WeeklyCalenderStringsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SensorScheduleJSONObjectGenerator"
.end annotation


# direct methods
.method public constructor <init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;
    .param p3, "deviceUDNsArray"    # [Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;[Ljava/lang/String;Landroid/content/Context;)V

    .line 58
    return-void
.end method


# virtual methods
.method protected getScheduleJSONArrayGenerator(Ljava/lang/String;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SensorScheduleJSONObjectGenerator: Creating Runnable for SensorScheduleJSONArrayGenerator"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;

    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONObjectGenerator;->context:Landroid/content/Context;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method
