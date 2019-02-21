.class Lcom/belkin/cordova/plugin/DevicePlugin$22;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->registrationStatusAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 2760
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$22;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 2764
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$22;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getRegistrationStatus()Lorg/json/JSONObject;

    move-result-object v1

    .line 2765
    .local v1, "obj":Lorg/json/JSONObject;
    const-string v2, ""

    .line 2766
    .local v2, "resStatus":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v3, "registrationStatus"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2767
    const-string v3, "registrationStatus"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2769
    :cond_0
    const-string v3, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "registrationStatusAsync resStatus Code: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2770
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$22;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1700(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2775
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v2    # "resStatus":Ljava/lang/String;
    :goto_0
    return-void

    .line 2771
    :catch_0
    move-exception v0

    .line 2773
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
