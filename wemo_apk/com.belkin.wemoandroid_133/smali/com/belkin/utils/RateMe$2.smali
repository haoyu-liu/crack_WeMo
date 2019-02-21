.class Lcom/belkin/utils/RateMe$2;
.super Ljava/lang/Object;
.source "RateMe.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/RateMe;->showRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/RateMe;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 215
    iput-object p1, p0, Lcom/belkin/utils/RateMe$2;->this$0:Lcom/belkin/utils/RateMe;

    iput-object p2, p0, Lcom/belkin/utils/RateMe$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 218
    :try_start_0
    iget-object v2, p0, Lcom/belkin/utils/RateMe$2;->val$ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/utils/RateMe$2;->val$ctx:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 219
    .local v1, "pkgInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, p0, Lcom/belkin/utils/RateMe$2;->val$ctx:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "market://details?id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .end local v1    # "pkgInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    invoke-static {}, Lcom/belkin/utils/RateMe;->dismiss()V

    .line 224
    iget-object v2, p0, Lcom/belkin/utils/RateMe$2;->this$0:Lcom/belkin/utils/RateMe;

    iget-object v3, p0, Lcom/belkin/utils/RateMe$2;->val$ctx:Landroid/content/Context;

    invoke-static {v2, v3}, Lcom/belkin/utils/RateMe;->access$200(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    .line 226
    iget-object v2, p0, Lcom/belkin/utils/RateMe$2;->this$0:Lcom/belkin/utils/RateMe;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/belkin/utils/RateMe;->access$300(Lcom/belkin/utils/RateMe;I)V

    .line 227
    return-void

    .line 220
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/belkin/utils/RateMe;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Exception"

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
