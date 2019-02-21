.class Lcom/localytics/android/AnalyticsHandler$16;
.super Ljava/lang/Object;
.source "AnalyticsHandler.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AnalyticsHandler;->getPushRegistrationID()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AnalyticsHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AnalyticsHandler;)V
    .locals 0

    .prologue
    .line 781
    iput-object p1, p0, Lcom/localytics/android/AnalyticsHandler$16;->this$0:Lcom/localytics/android/AnalyticsHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 781
    invoke-virtual {p0}, Lcom/localytics/android/AnalyticsHandler$16;->call()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/String;
    .locals 9

    .prologue
    .line 785
    const/4 v6, 0x0

    .line 786
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 790
    .local v7, "pushRegistrationID":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler$16;->this$0:Lcom/localytics/android/AnalyticsHandler;

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "registration_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 792
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 794
    const-string v0, "registration_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 799
    :cond_0
    if-eqz v6, :cond_1

    .line 801
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 802
    const/4 v6, 0x0

    :cond_1
    move-object v8, v7

    .line 805
    .end local v7    # "pushRegistrationID":Ljava/lang/String;
    .local v8, "pushRegistrationID":Ljava/lang/String;
    :goto_0
    return-object v8

    .line 799
    .end local v8    # "pushRegistrationID":Ljava/lang/String;
    .restart local v7    # "pushRegistrationID":Ljava/lang/String;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 801
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 802
    const/4 v6, 0x0

    :cond_2
    move-object v8, v7

    .line 805
    .end local v7    # "pushRegistrationID":Ljava/lang/String;
    .restart local v8    # "pushRegistrationID":Ljava/lang/String;
    goto :goto_0
.end method
