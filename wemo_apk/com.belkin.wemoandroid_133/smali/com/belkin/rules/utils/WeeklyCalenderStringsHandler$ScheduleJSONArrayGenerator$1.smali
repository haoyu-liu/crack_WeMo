.class Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;
.super Ljava/lang/Object;
.source "WeeklyCalenderStringsHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

.field final synthetic val$weekDay:I


# direct methods
.method constructor <init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;I)V
    .locals 0

    .prologue
    .line 184
    iput-object p1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    iput p2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->val$weekDay:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 188
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$100(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 189
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 192
    .local v1, "schString":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$200(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    iget-object v4, v4, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->context:Landroid/content/Context;

    invoke-static {v2, v4}, Lcom/belkin/wemo/utils/WeMoUtils;->areFetchStoreAPIsSupportedInLocal(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 193
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    iget v4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->val$weekDay:I

    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v5}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$200(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->getDeviceScheduleString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 196
    :cond_0
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$300(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Schedule String for day: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->val$weekDay:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    :try_start_1
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$400(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lorg/json/JSONArray;

    move-result-object v2

    iget v4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->val$weekDay:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$600(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v2

    const/4 v4, 0x7

    if-lt v2, v4, :cond_1

    .line 205
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$700(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 206
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$700(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;

    move-result-object v2

    iget-object v4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v4}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$200(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v5}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$400(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;->onSuccess(Ljava/lang/String;Lorg/json/JSONArray;)V

    .line 209
    :cond_1
    monitor-exit v3

    .line 210
    return-void

    .line 200
    :catch_0
    move-exception v0

    .line 201
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->this$0:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    invoke-static {v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->access$500(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSONException while fetching Schedule String for day: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;->val$weekDay:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 209
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "schString":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method
