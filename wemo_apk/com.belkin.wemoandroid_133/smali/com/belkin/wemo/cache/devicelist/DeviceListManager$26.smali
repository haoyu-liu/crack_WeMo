.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$26;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeGroup(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 7152
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$26;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 7156
    const-string v0, "DeviceListManager"

    const-string v1, " Error in Deleting Rule"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7158
    return-void
.end method
