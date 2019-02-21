.class Lcom/belkin/activity/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/belkin/wemo/PermissionController$PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/activity/MainActivity;->onTakePicture(Lcom/belkin/controller/listener/TakePictureListener;Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/activity/MainActivity;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/belkin/activity/MainActivity;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 369
    iput-object p1, p0, Lcom/belkin/activity/MainActivity$1;->this$0:Lcom/belkin/activity/MainActivity;

    iput-object p2, p0, Lcom/belkin/activity/MainActivity$1;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public permissionResult(Z)V
    .locals 3
    .param p1, "granted"    # Z

    .prologue
    .line 372
    if-eqz p1, :cond_0

    .line 373
    iget-object v0, p0, Lcom/belkin/activity/MainActivity$1;->this$0:Lcom/belkin/activity/MainActivity;

    iget-object v1, p0, Lcom/belkin/activity/MainActivity$1;->val$intent:Landroid/content/Intent;

    const/16 v2, 0x65

    invoke-virtual {v0, v1, v2}, Lcom/belkin/activity/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 375
    :cond_0
    return-void
.end method
