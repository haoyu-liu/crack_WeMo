.class Lcom/localytics/android/BaseHandler$3;
.super Ljava/lang/Object;
.source "BaseHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/BaseHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/BaseHandler;

.field final synthetic val$responseString:Ljava/lang/String;

.field final synthetic val$rowsToDelete:I


# direct methods
.method constructor <init>(Lcom/localytics/android/BaseHandler;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 127
    iput-object p1, p0, Lcom/localytics/android/BaseHandler$3;->this$0:Lcom/localytics/android/BaseHandler;

    iput p2, p0, Lcom/localytics/android/BaseHandler$3;->val$rowsToDelete:I

    iput-object p3, p0, Lcom/localytics/android/BaseHandler$3;->val$responseString:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 131
    iget-object v0, p0, Lcom/localytics/android/BaseHandler$3;->this$0:Lcom/localytics/android/BaseHandler;

    iget v1, p0, Lcom/localytics/android/BaseHandler$3;->val$rowsToDelete:I

    iget-object v2, p0, Lcom/localytics/android/BaseHandler$3;->val$responseString:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/localytics/android/BaseHandler;->access$000(Lcom/localytics/android/BaseHandler;ILjava/lang/String;)V

    .line 132
    return-void
.end method
