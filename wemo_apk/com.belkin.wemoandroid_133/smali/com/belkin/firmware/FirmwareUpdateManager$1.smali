.class final Lcom/belkin/firmware/FirmwareUpdateManager$1;
.super Ljava/lang/Object;
.source "FirmwareUpdateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/firmware/FirmwareUpdateManager;->processFirwareUpdatePayload(Lorg/json/JSONArray;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$firmwareObject:Lcom/belkin/firmware/FirmwareDetails;


# direct methods
.method constructor <init>(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareUpdateManager$1;->val$firmwareObject:Lcom/belkin/firmware/FirmwareDetails;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 81
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->access$000()Ljava/util/LinkedHashMap;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 82
    :goto_0
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->access$000()Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    const-wide/16 v2, 0x7d0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 91
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    iget-object v1, p0, Lcom/belkin/firmware/FirmwareUpdateManager$1;->val$firmwareObject:Lcom/belkin/firmware/FirmwareDetails;

    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->access$100(Lcom/belkin/firmware/FirmwareDetails;)V

    .line 92
    return-void
.end method
