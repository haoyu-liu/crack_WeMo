.class Lcom/localytics/android/AnalyticsHandler$7;
.super Ljava/lang/Object;
.source "AnalyticsHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AnalyticsHandler;->handleMessageExtended(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AnalyticsHandler;

.field final synthetic val$dimension:I

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/AnalyticsHandler;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 366
    iput-object p1, p0, Lcom/localytics/android/AnalyticsHandler$7;->this$0:Lcom/localytics/android/AnalyticsHandler;

    iput p2, p0, Lcom/localytics/android/AnalyticsHandler$7;->val$dimension:I

    iput-object p3, p0, Lcom/localytics/android/AnalyticsHandler$7;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 370
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler$7;->this$0:Lcom/localytics/android/AnalyticsHandler;

    iget v1, p0, Lcom/localytics/android/AnalyticsHandler$7;->val$dimension:I

    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler$7;->val$value:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/localytics/android/AnalyticsHandler;->access$700(Lcom/localytics/android/AnalyticsHandler;ILjava/lang/String;)V

    .line 371
    return-void
.end method
