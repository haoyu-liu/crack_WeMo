.class Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;
.super Ljava/lang/Object;
.source "PushMessageDialogBroadcastReceiver.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->showMessage(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$notifyId:I


# direct methods
.method constructor <init>(Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;ILandroid/content/Context;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 187
    iput-object p1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->this$0:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    iput p2, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$notifyId:I

    iput-object p3, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 192
    iget v2, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$notifyId:I

    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 193
    const-string v2, "PushMessageDialogBroadcastReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Push Notification: Cancelling notification from Notification Bar: notify ID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$notifyId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    const-string v1, "notification"

    .line 195
    .local v1, "ns":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$context:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 196
    .local v0, "manager":Landroid/app/NotificationManager;
    iget v2, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$notifyId:I

    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 199
    .end local v0    # "manager":Landroid/app/NotificationManager;
    .end local v1    # "ns":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 200
    return-void
.end method
