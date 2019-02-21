.class Lcom/belkin/utils/GPSTracker$2;
.super Ljava/lang/Object;
.source "GPSTracker.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/GPSTracker;->showSettingsAlert()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/GPSTracker;


# direct methods
.method constructor <init>(Lcom/belkin/utils/GPSTracker;)V
    .locals 0

    .prologue
    .line 195
    iput-object p1, p0, Lcom/belkin/utils/GPSTracker$2;->this$0:Lcom/belkin/utils/GPSTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 197
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 198
    return-void
.end method
