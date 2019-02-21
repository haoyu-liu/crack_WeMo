.class Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;
.super Ljava/util/TimerTask;
.source "MSearchRequestRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MSearchTimerTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$1;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MSearch Timer Task. run(): MSearch requested completed count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    const/4 v1, 0x2

    const/16 v2, 0xbb8

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->access$300(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;II)V

    .line 69
    return-void
.end method
