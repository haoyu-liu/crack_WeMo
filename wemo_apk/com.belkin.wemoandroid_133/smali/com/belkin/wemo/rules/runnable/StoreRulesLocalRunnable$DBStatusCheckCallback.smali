.class Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;
.super Ljava/lang/Object;
.source "StoreRulesLocalRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DBStatusCheckCallback"
.end annotation


# instance fields
.field private currentAppDBVersion:I

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V
    .locals 2
    .param p2, "currentAppDBVersion"    # I

    .prologue
    .line 145
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->currentAppDBVersion:I

    .line 147
    invoke-static {p1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v0

    invoke-static {p1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1, p0, p0}, Lcom/belkin/wemo/rules/IWeMoRules;->fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V

    .line 148
    return-void
.end method


# virtual methods
.method public onError()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)V

    .line 155
    return-void
.end method

.method public onSuccess(Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 4
    .param p1, "pragmaUserVersion"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p3, "lowerDBVersionDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v0, "StoreRulesLocalRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules: Fetch rules completed. current App DB Version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->currentAppDBVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", latest DB Version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->currentAppDBVersion:I

    if-ge v0, p2, :cond_1

    .line 166
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v2, -0x2

    const-string v3, "Rule could not be saved. Please refresh the Rules Screen!"

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0, p2, p3}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILjava/util/ArrayList;)V

    .line 177
    :goto_0
    return-void

    .line 175
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)V

    goto :goto_0
.end method
