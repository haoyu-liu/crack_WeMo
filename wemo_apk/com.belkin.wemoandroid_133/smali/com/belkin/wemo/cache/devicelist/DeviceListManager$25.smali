.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$25;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeGroup(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 7146
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$25;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllDeviceRulesReset(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 7151
    return-void
.end method
