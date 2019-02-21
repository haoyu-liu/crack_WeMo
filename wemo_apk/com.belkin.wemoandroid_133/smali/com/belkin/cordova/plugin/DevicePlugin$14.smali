.class Lcom/belkin/cordova/plugin/DevicePlugin$14;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$inParamArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1652
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$inParamArray:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 1655
    :try_start_0
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1656
    .local v4, "macAddress":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1657
    .local v7, "udn1":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1658
    .local v3, "iconVersion":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1659
    const-string v8, "-"

    invoke-virtual {v7, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 1661
    .local v6, "serialNumber":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1662
    .local v2, "iconURL":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 1664
    :cond_0
    const-string v3, "0"

    .line 1666
    :cond_1
    sget-object v8, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v8

    invoke-virtual {v8, v3, v6}, Lcom/belkin/wemo/storage/FileStorage;->getIconFileUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1667
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ACTION_GET_ICON_FROM_CLOUD macAddress: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " udn: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " iconVersion: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " iconURL: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1669
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-gtz v8, :cond_3

    .line 1671
    :cond_2
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$700(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v8

    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v8, v9}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1672
    .local v0, "authHeader":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/cloud/CloudServices;->getInstance(Landroid/content/Context;)Lcom/belkin/cloud/CloudServices;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$802(Lcom/belkin/cordova/plugin/DevicePlugin;Lcom/belkin/cloud/CloudServices;)Lcom/belkin/cloud/CloudServices;

    .line 1673
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$800(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cloud/CloudServices;

    move-result-object v8

    invoke-virtual {v8, v4, v3, v6, v0}, Lcom/belkin/cloud/CloudServices;->getDeviceIconFromCloudURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1675
    .end local v0    # "authHeader":Ljava/lang/String;
    :cond_3
    new-instance v5, Lorg/apache/cordova/PluginResult;

    sget-object v8, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v5, v8, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 1676
    .local v5, "result":Lorg/apache/cordova/PluginResult;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1677
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$14;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1681
    .end local v2    # "iconURL":Ljava/lang/String;
    .end local v3    # "iconVersion":Ljava/lang/String;
    .end local v4    # "macAddress":Ljava/lang/String;
    .end local v5    # "result":Lorg/apache/cordova/PluginResult;
    .end local v6    # "serialNumber":Ljava/lang/String;
    .end local v7    # "udn1":Ljava/lang/String;
    :goto_0
    return-void

    .line 1678
    :catch_0
    move-exception v1

    .line 1679
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
