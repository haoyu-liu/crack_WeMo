.class Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WeeklyCalenderStringsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScheduleJSONArrayGenerator"
.end annotation


# static fields
.field public static final NUM_DAY_IN_WEEK:I = 0x7


# instance fields
.field protected context:Landroid/content/Context;

.field private deviceUDN:Ljava/lang/String;

.field private errorCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;

.field private jsonArray:Lorg/json/JSONArray;

.field private lock:Ljava/lang/Object;

.field private schStringCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;
    .param p3, "deviceUDN"    # Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 170
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->jsonArray:Lorg/json/JSONArray;

    .line 171
    iput-object p3, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->deviceUDN:Ljava/lang/String;

    .line 172
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->schStringCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 173
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->lock:Ljava/lang/Object;

    .line 174
    iput-object p2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->errorCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringErrorCallback;

    .line 175
    iput-object p1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;

    .line 176
    iput-object p4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->context:Landroid/content/Context;

    .line 177
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->deviceUDN:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->jsonArray:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->schStringCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;)Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->successCallback:Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleStringSuccessCallback;

    return-object v0
.end method


# virtual methods
.method protected getDeviceScheduleString(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "weekday"    # I
    .param p2, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->TAG:Ljava/lang/String;

    const-string v1, "ScheduleJSONArrayGenerator: Getting schedule string for a regular device."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;

    iget-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getScheduleString(Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 181
    const/4 v1, 0x0

    .line 182
    .local v1, "i":I
    :goto_0
    const/4 v3, 0x7

    if-ge v1, v3, :cond_0

    .line 183
    add-int/lit8 v1, v1, 0x1

    move v2, v1

    .line 184
    .local v2, "weekDay":I
    new-instance v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;

    invoke-direct {v0, p0, v2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator$1;-><init>(Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$ScheduleJSONArrayGenerator;I)V

    .line 213
    .local v0, "dayScheduleStringRunnable":Ljava/lang/Runnable;
    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 215
    .end local v0    # "dayScheduleStringRunnable":Ljava/lang/Runnable;
    .end local v2    # "weekDay":I
    :cond_0
    return-void
.end method
