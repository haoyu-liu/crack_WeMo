.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setBulbType(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
    .locals 0

    .prologue
    .line 1662
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1666
    const-string v0, "DeviceListManager"

    const-string v1, "setBulbType: Exception during PostControlAction: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1667
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 1668
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;->onSetBulbTypeFailed(Ljava/lang/String;)V

    .line 1670
    :cond_0
    return-void
.end method
