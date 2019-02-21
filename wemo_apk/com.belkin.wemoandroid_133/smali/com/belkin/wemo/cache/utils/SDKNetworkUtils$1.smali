.class Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SDKNetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->bindToNetwork()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field final synthetic val$connectivityManager:Landroid/net/ConnectivityManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Landroid/net/ConnectivityManager;)V
    .locals 0

    .prologue
    .line 328
    iput-object p1, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;->this$0:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iput-object p2, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;->val$connectivityManager:Landroid/net/ConnectivityManager;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 2
    .param p1, "network"    # Landroid/net/Network;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .prologue
    .line 333
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;->val$connectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, p1}, Landroid/net/ConnectivityManager;->bindProcessToNetwork(Landroid/net/Network;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    :goto_0
    return-void

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 336
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;->this$0:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->unRegisterNetwork()V

    goto :goto_0
.end method
