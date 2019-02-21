.class Lcom/belkin/wemo/PermissionController$1;
.super Ljava/lang/Object;
.source "PermissionController.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/PermissionController;->showSettingsAlert(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/PermissionController;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/PermissionController;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/belkin/wemo/PermissionController$1;->this$0:Lcom/belkin/wemo/PermissionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 74
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "package"

    iget-object v3, p0, Lcom/belkin/wemo/PermissionController$1;->this$0:Lcom/belkin/wemo/PermissionController;

    invoke-static {v3}, Lcom/belkin/wemo/PermissionController;->access$000(Lcom/belkin/wemo/PermissionController;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 76
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 77
    iget-object v2, p0, Lcom/belkin/wemo/PermissionController$1;->this$0:Lcom/belkin/wemo/PermissionController;

    invoke-static {v2}, Lcom/belkin/wemo/PermissionController;->access$100(Lcom/belkin/wemo/PermissionController;)Landroid/app/Activity;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 78
    return-void
.end method
