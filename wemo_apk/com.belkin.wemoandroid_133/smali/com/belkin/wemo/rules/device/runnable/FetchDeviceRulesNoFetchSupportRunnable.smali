.class public Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "FetchDeviceRulesNoFetchSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;,
        Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;,
        Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
    }
.end annotation


# static fields
.field public static final TOTAL_FETCH_RULES_CALLBACKS_COUNT:I = 0x2


# instance fields
.field private callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

.field private callbackCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private dbPathXMLStr:Ljava/lang/String;

.field private dbVersionXMLStr:Ljava/lang/String;

.field private device:Lorg/cybergarage/upnp/Device;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;Lorg/cybergarage/upnp/Device;)V
    .locals 1
    .param p1, "callback"    # Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 86
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 87
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    .line 88
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callbackCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 89
    return-void
.end method

.method static synthetic access$202(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbPathXMLStr:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callbackCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->onAllCallbacksCompleted()V

    return-void
.end method

.method static synthetic access$502(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbVersionXMLStr:Ljava/lang/String;

    return-object p1
.end method

.method private getDBPath(Lcom/belkin/upnp/parser/Parser;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "parser"    # Lcom/belkin/upnp/parser/Parser;
    .param p2, "dbPathXMLStr"    # Ljava/lang/String;

    .prologue
    .line 166
    new-instance v0, Lcom/belkin/rules/beans/RulesDBPathResponseBean;

    invoke-direct {v0}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;-><init>()V

    .line 167
    .local v0, "responseBean":Lcom/belkin/rules/beans/RulesDBPathResponseBean;
    const/16 v1, 0xc

    invoke-virtual {p1, v0, v1, p2}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 168
    invoke-virtual {v0}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->getStrRulesDBPath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getDBVersion(Lcom/belkin/upnp/parser/Parser;Ljava/lang/String;)I
    .locals 2
    .param p1, "parser"    # Lcom/belkin/upnp/parser/Parser;
    .param p2, "dbPathXMLStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 172
    new-instance v0, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;

    invoke-direct {v0}, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;-><init>()V

    .line 173
    .local v0, "responseBean":Lcom/belkin/rules/beans/RulesDBVersionResponseBean;
    const/16 v1, 0xd

    invoke-virtual {p1, v0, v1, p2}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 174
    invoke-virtual {v0}, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;->getStrRulesDBVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method private onAllCallbacksCompleted()V
    .locals 7

    .prologue
    .line 144
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "deviceUdn":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    if-eqz v3, :cond_0

    .line 147
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbVersionXMLStr:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbVersionXMLStr:Ljava/lang/String;

    const-string v4, "app_error"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbPathXMLStr:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 148
    new-instance v2, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 150
    .local v2, "parser":Lcom/belkin/upnp/parser/Parser;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbVersionXMLStr:Ljava/lang/String;

    invoke-direct {p0, v2, v4}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->getDBVersion(Lcom/belkin/upnp/parser/Parser;Ljava/lang/String;)I

    move-result v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->dbPathXMLStr:Ljava/lang/String;

    invoke-direct {p0, v2, v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->getDBPath(Lcom/belkin/upnp/parser/Parser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .end local v2    # "parser":Lcom/belkin/upnp/parser/Parser;
    :cond_0
    :goto_0
    return-void

    .line 151
    .restart local v2    # "parser":Lcom/belkin/upnp/parser/Parser;
    :catch_0
    move-exception v1

    .line 152
    .local v1, "e":Ljava/lang/NumberFormatException;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->TAG:Ljava/lang/String;

    const-string v4, "NumberFormatException in Device FETCH RULES with No Fetch Support: "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 153
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    const/4 v5, -0x1

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v0}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0

    .line 158
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "parser":Lcom/belkin/upnp/parser/Parser;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-direct {v4, v0}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    const/4 v6, 0x0

    .line 97
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v5, "GetRulesDBPath"

    invoke-virtual {v0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 98
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    if-nez v0, :cond_0

    move-object v4, v6

    .line 99
    .local v4, "getDBPathActionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
    :goto_0
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 105
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v5, "GetRulesDBVersion"

    invoke-virtual {v0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 106
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    if-nez v0, :cond_1

    move-object v9, v6

    .line 107
    .local v9, "getDBVersionActionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;
    :goto_1
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v5

    move-object v6, v1

    move v7, v2

    move v8, v3

    move-object v10, v9

    invoke-virtual/range {v5 .. v10}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 112
    return-void

    .line 98
    .end local v4    # "getDBPathActionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
    .end local v9    # "getDBVersionActionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;
    :cond_0
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;

    invoke-direct {v4, p0, v6}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;)V

    goto :goto_0

    .line 106
    .restart local v4    # "getDBPathActionCallback":Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
    :cond_1
    new-instance v9, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;

    invoke-direct {v9, p0, v6}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBVersionActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;)V

    goto :goto_1
.end method
