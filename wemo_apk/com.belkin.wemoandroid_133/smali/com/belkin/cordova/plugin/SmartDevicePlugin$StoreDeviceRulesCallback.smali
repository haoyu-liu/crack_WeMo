.class Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;
.super Ljava/lang/Object;
.source "SmartDevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/SmartDevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StoreDeviceRulesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V
    .locals 0

    .prologue
    .line 1071
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1072
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 1084
    const-string v0, "SmartDevicePlugin"

    const-string v1, "Store Device Rules Callback on Error."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1085
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 1086
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 1088
    :cond_0
    return-void
.end method

.method public onSuccess()V
    .locals 2

    .prologue
    .line 1076
    const-string v0, "SmartDevicePlugin"

    const-string v1, "Store Device Rules Callback on Success."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1077
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 1078
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 1080
    :cond_0
    return-void
.end method
