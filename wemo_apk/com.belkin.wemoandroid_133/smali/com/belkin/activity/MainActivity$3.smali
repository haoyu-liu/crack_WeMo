.class Lcom/belkin/activity/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/belkin/wemo/PermissionController$PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/activity/MainActivity;->onPermissionCheck(Lcom/belkin/wemo/PermListner;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/belkin/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 552
    iput-object p1, p0, Lcom/belkin/activity/MainActivity$3;->this$0:Lcom/belkin/activity/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public permissionResult(Z)V
    .locals 1
    .param p1, "granted"    # Z

    .prologue
    .line 555
    if-eqz p1, :cond_0

    .line 556
    iget-object v0, p0, Lcom/belkin/activity/MainActivity$3;->this$0:Lcom/belkin/activity/MainActivity;

    invoke-static {v0}, Lcom/belkin/activity/MainActivity;->access$100(Lcom/belkin/activity/MainActivity;)Lcom/belkin/wemo/PermListner;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/PermListner;->onPermGranted()V

    .line 560
    :goto_0
    return-void

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/belkin/activity/MainActivity$3;->this$0:Lcom/belkin/activity/MainActivity;

    invoke-static {v0}, Lcom/belkin/activity/MainActivity;->access$100(Lcom/belkin/activity/MainActivity;)Lcom/belkin/wemo/PermListner;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/PermListner;->onPermDenied()V

    goto :goto_0
.end method
