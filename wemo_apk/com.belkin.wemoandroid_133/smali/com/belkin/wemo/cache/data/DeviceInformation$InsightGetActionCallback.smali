.class Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;
.super Ljava/lang/Object;
.source "DeviceInformation.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/data/DeviceInformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InsightGetActionCallback"
.end annotation


# instance fields
.field private actionName:Ljava/lang/String;

.field private actionObj:Lorg/cybergarage/upnp/Action;

.field final synthetic this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Action;Ljava/lang/String;)V
    .locals 0
    .param p2, "action"    # Lorg/cybergarage/upnp/Action;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 1187
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1188
    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->actionObj:Lorg/cybergarage/upnp/Action;

    .line 1189
    iput-object p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->actionName:Ljava/lang/String;

    .line 1190
    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Action;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "x1"    # Lorg/cybergarage/upnp/Action;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/belkin/wemo/cache/data/DeviceInformation$1;

    .prologue
    .line 1183
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Action;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1230
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Exception while getting insight attributes "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1231
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$402(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)Z

    .line 1232
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1194
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 1195
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "responseXMLStr - "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1196
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->actionObj:Lorg/cybergarage/upnp/Action;

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 1197
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$200(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v2

    .line 1200
    .local v2, "attributeList":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 1201
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v7

    const-string v8, "\\|"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 1202
    .local v6, "values":[Ljava/lang/String;
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_INSIGHT_PARAMS_DATA:[Ljava/lang/String;

    .line 1203
    .local v0, "actionParameters":[Ljava/lang/String;
    const/4 v5, 0x1

    .local v5, "k":I
    :goto_0
    array-length v7, v6

    if-ge v5, v7, :cond_1

    .line 1204
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 1205
    .local v3, "attributeObj":Lorg/json/JSONObject;
    const-string v7, "value"

    aget-object v8, v6, v5

    invoke-virtual {v3, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1206
    aget-object v7, v0, v5

    invoke-virtual {v2, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1203
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1209
    .end local v0    # "actionParameters":[Ljava/lang/String;
    .end local v3    # "attributeObj":Lorg/json/JSONObject;
    .end local v5    # "k":I
    .end local v6    # "values":[Ljava/lang/String;
    :cond_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->actionName:Ljava/lang/String;

    const-string v8, "GetInsightHomeSettings"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1210
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_INSIGHT_HOME_SETTINGS_DATA:[Ljava/lang/String;

    .line 1214
    .restart local v0    # "actionParameters":[Ljava/lang/String;
    :goto_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    invoke-static {v7, v2, v8, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$300(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/json/JSONObject;Ljava/util/Iterator;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 1216
    :cond_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 1217
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "INSIGHT PARAMS "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1226
    .end local v0    # "actionParameters":[Ljava/lang/String;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "attributeList":Lorg/json/JSONObject;
    :goto_2
    return-void

    .line 1212
    .restart local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .restart local v2    # "attributeList":Lorg/json/JSONObject;
    :cond_2
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_INSIGHT_EXPORT_DATA:[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0    # "actionParameters":[Ljava/lang/String;
    goto :goto_1

    .line 1218
    .end local v0    # "actionParameters":[Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 1219
    .local v4, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "Exception while getting insight attributes "

    invoke-static {v7, v8, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2

    .line 1223
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "attributeList":Lorg/json/JSONObject;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_3
    new-instance v7, Lcom/belkin/wemo/exception/InvalidActionException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION is invalid!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->actionName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/belkin/wemo/exception/InvalidActionException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;->onActionError(Ljava/lang/Exception;)V

    goto :goto_2
.end method
