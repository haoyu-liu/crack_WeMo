.class Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;
.super Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;
.source "WeeklyCalenderStringsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SensorScheduleJSONArrayGenerator"
.end annotation


# direct methods
.method public constructor <init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;
    .param p3, "deviceUDN"    # Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;Ljava/lang/String;Landroid/content/Context;)V

    .line 141
    return-void
.end method


# virtual methods
.method protected getDeviceScheduleString(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "weekday"    # I
    .param p2, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;->TAG:Ljava/lang/String;

    const-string v1, "ScheduleJSONArrayGenerator: Getting schedule string for a SENSOR device."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;

    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$SensorScheduleJSONArrayGenerator;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getSensorScheduleString(Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
