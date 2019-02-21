.class Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;
.super Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
.source "FetchDeviceRulesNoFetchSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetDBVersionActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V
    .locals 1

    .prologue
    .line 134
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 1
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-static {v0, p1}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->access$502(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Ljava/lang/String;)Ljava/lang/String;

    .line 139
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;->onCallbackReveived()V

    .line 140
    return-void
.end method
