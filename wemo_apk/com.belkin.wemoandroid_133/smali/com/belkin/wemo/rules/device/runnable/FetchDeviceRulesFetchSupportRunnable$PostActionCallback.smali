.class Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;
.super Ljava/lang/Object;
.source "FetchDeviceRulesFetchSupportRunnable.java"

# interfaces
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PostActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->udn:Ljava/lang/String;

    .line 107
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->udn:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 144
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x1

    .line 111
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "app_error"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 113
    new-instance v4, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 114
    .local v4, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 116
    .local v3, "fetchRulesResponseJSON":Lorg/json/JSONObject;
    const/16 v5, 0x11

    invoke-virtual {v4, v3, v5, p1}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 118
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 120
    :try_start_0
    const-string v5, "ruleDbVersion"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "dbVersion":Ljava/lang/String;
    const-string v5, "ruleDbPath"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "dbPath":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v7}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$100(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v0, v7}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    .end local v0    # "dbPath":Ljava/lang/String;
    .end local v1    # "dbVersion":Ljava/lang/String;
    .end local v3    # "fetchRulesResponseJSON":Lorg/json/JSONObject;
    .end local v4    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    :cond_0
    :goto_0
    return-void

    .line 124
    .restart local v3    # "fetchRulesResponseJSON":Lorg/json/JSONObject;
    .restart local v4    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    :catch_0
    move-exception v2

    .line 125
    .local v2, "e":Lorg/json/JSONException;
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$200(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "JSONException in Device FETCH RULES: "

    invoke-static {v5, v6, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 126
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v5

    new-instance v6, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->udn:Ljava/lang/String;

    invoke-direct {v6, v9, v7, v8}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0

    .line 129
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 130
    .local v2, "e":Ljava/lang/NumberFormatException;
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$300(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "NumberFormatException in Device FETCH RULES: "

    invoke-static {v5, v6, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 131
    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;

    invoke-static {v5}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    move-result-object v5

    new-instance v6, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-virtual {v2}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable$PostActionCallback;->udn:Ljava/lang/String;

    invoke-direct {v6, v9, v7, v8}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method
