.class public Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "FetchDeviceRulesFetchSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;
    }
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

.field private device:Lorg/cybergarage/upnp/Device;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "callback"    # Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 80
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 81
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lorg/cybergarage/upnp/Device;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 89
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "FetchRules"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 90
    .local v1, "fetchRulesAction":Lorg/cybergarage/upnp/Action;
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 92
    .local v6, "udn":Ljava/lang/String;
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;

    invoke-direct {v4, p0, v6}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;Ljava/lang/String;)V

    .line 93
    .local v4, "actionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 99
    return-void
.end method
