.class Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;
.super Ljava/lang/Object;
.source "WeeklyCalenderStringsHandler.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;
.implements Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScheduleJSONObjectGenerator"
.end annotation


# instance fields
.field protected context:Landroid/content/Context;

.field private final deviceUDNsCount:I

.field private errorCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;

.field private jsonObject:Lorg/json/JSONObject;

.field private successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;

.field private udnArray:[Ljava/lang/String;

.field private udnCountAtomicInteger:Ljava/util/concurrent/atomic/AtomicInteger;

.field private udnLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;
    .param p3, "deviceUDNsArray"    # [Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->errorCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;

    .line 83
    iput-object p1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;

    .line 84
    iput-object p3, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnArray:[Ljava/lang/String;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnCountAtomicInteger:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    if-eqz p3, :cond_0

    array-length v0, p3

    :goto_0
    iput v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->deviceUDNsCount:I

    .line 87
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnLock:Ljava/lang/Object;

    .line 88
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->jsonObject:Lorg/json/JSONObject;

    .line 89
    iput-object p4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->context:Landroid/content/Context;

    .line 90
    return-void

    .line 86
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onCallbackReveived()V
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnCountAtomicInteger:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iget v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->deviceUDNsCount:I

    if-lt v0, v1, :cond_0

    .line 126
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScheduleJSONObjectGenerator: ALL UDN callbacks received."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;

    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->jsonObject:Lorg/json/JSONObject;

    invoke-interface {v0, v1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;->onSuccess(Lorg/json/JSONObject;)V

    .line 131
    :cond_0
    return-void
.end method


# virtual methods
.method protected getScheduleJSONArrayGenerator(Ljava/lang/String;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScheduleJSONObjectGenerator: Creating Runnable for ScheduleJSONArrayGenerator"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->context:Landroid/content/Context;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method

.method public onError()V
    .locals 0

    .prologue
    .line 121
    invoke-direct {p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->onCallbackReveived()V

    .line 122
    return-void
.end method

.method public onSuccess(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "jsonArray"    # Lorg/json/JSONArray;

    .prologue
    .line 108
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ScheduleJSONObjectGenerator: JSON array received for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", JSON ARRAY: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnLock:Ljava/lang/Object;

    monitor-enter v2

    .line 111
    :try_start_0
    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    :goto_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    invoke-direct {p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->onCallbackReveived()V

    .line 117
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Lorg/json/JSONException;
    :try_start_2
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "JSONException while adding JSONArray for UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", JSONArray: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 115
    .end local v0    # "e":Lorg/json/JSONException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 7

    .prologue
    .line 94
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->udnArray:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 96
    .local v3, "udn":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONObjectGenerator;->getScheduleJSONArrayGenerator(Ljava/lang/String;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    move-result-object v4

    invoke-static {v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 97
    invoke-static {}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ScheduleJSONObjectGenerator: getting JSON array for UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 99
    .end local v3    # "udn":Ljava/lang/String;
    :cond_0
    return-void
.end method
