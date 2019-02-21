.class Lcom/belkin/wemo/PermissionController$2;
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
    .line 80
    iput-object p1, p0, Lcom/belkin/wemo/PermissionController$2;->this$0:Lcom/belkin/wemo/PermissionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 82
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 83
    return-void
.end method
