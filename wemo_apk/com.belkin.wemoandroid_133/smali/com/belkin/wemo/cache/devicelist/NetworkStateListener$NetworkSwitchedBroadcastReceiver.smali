.class Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkStateListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkSwitchedBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;->this$0:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;
    .param p2, "x1"    # Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$1;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;-><init>(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 112
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connectivity change broadcast received: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;->this$0:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    invoke-static {v0, p1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->access$200(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;Landroid/content/Context;)V

    .line 114
    return-void
.end method
