.class public Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;
.super Ljava/lang/Object;
.source "CloudRequestResetFNIRules.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field public static final STEP_ONE_RESET_FNIRULES:I = 0x1

.field private static final STEP_TWO_RESET_FNIRULES:I = 0x2


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final TIMEOUT:I

.field private final TIMEOUTLIMIT:I

.field private final URLDeviceMessage:Ljava/lang/String;

.field private final URLInsightParamsMessage:Ljava/lang/String;

.field private listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

.field private mContext:Landroid/content/Context;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mFN:Ljava/lang/String;

.field private mMac:Ljava/lang/String;

.field private mModelCode:Ljava/lang/String;

.field private mPluginId:Ljava/lang/String;

.field private mStepNumber:I

.field private mUdn:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;[I)V
    .locals 1
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "pluginId"    # Ljava/lang/String;
    .param p5, "mac"    # Ljava/lang/String;
    .param p6, "friendlyName"    # Ljava/lang/String;
    .param p7, "modelCode"    # Ljava/lang/String;
    .param p8, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .param p9, "stepNumber"    # [I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/16 v0, 0x3a98

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->TIMEOUT:I

    .line 19
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->TIMEOUTLIMIT:I

    .line 20
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/message/"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->URLDeviceMessage:Ljava/lang/String;

    .line 21
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->URLInsightParamsMessage:Ljava/lang/String;

    .line 25
    const-string v0, "CloudRequestResetFNIRules"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->TAG:Ljava/lang/String;

    .line 27
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mModelCode:Ljava/lang/String;

    .line 42
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mMac:Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 44
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mContext:Landroid/content/Context;

    .line 45
    if-eqz p9, :cond_0

    .line 46
    array-length v0, p9

    if-lez v0, :cond_0

    .line 47
    const/4 v0, 0x0

    aget v0, p9, v0

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    .line 50
    :cond_0
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mUdn:Ljava/lang/String;

    .line 51
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mPluginId:Ljava/lang/String;

    .line 52
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mFN:Ljava/lang/String;

    .line 53
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mModelCode:Ljava/lang/String;

    .line 54
    iput-object p8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 55
    return-void
.end method

.method private buildBody(I)Ljava/lang/String;
    .locals 3
    .param p1, "stepNumber"    # I

    .prologue
    .line 92
    const-string v0, ""

    .line 94
    .local v0, "finalBody":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mPluginId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mMac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<modelCode>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mModelCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</modelCode>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content><![CDATA[<resetNameRulesData><plugin><macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mMac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<resetType>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</resetType>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</resetNameRulesData>]]></content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    :cond_0
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin></plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    return-object v0

    .line 104
    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content><![CDATA[<changeFriendlyName><plugin><pluginID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mPluginId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mMac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<friendlyName>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mFN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</friendlyName>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</changeFriendlyName>]]></content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private performNextStep(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 2
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 163
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 164
    .local v0, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 165
    return-void
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->buildBody(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 118
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 66
    const/16 v0, 0x3a98

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 72
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 77
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 78
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

    .line 82
    :goto_0
    return-object v0

    .line 79
    :cond_0
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 80
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/message/"

    goto :goto_0

    .line 82
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 16
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 131
    move-object/from16 v0, p0

    iget v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 132
    if-eqz p1, :cond_1

    .line 134
    const-string v3, "CloudRequestResetFNIRules"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finished reset of Name/Rules Data "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",starting friendly name work"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mUdn:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mPluginId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mMac:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mFN:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mModelCode:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    const/4 v12, 0x1

    new-array v12, v12, [I

    const/4 v14, 0x0

    const/4 v15, 0x2

    aput v15, v12, v14

    invoke-direct/range {v3 .. v12}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;[I)V

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->performNextStep(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 160
    :cond_0
    :goto_0
    return-void

    .line 137
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v3, :cond_2

    .line 138
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 140
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v4, "reset_fn_icon_rules"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mUdn:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 142
    :cond_3
    move-object/from16 v0, p0

    iget v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mStepNumber:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 143
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mUdn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v13

    .line 144
    .local v13, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v13, :cond_4

    .line 145
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mFN:Ljava/lang/String;

    invoke-virtual {v13, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 146
    const-string v3, ""

    invoke-virtual {v13, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 147
    const-string v3, ""

    invoke-virtual {v13, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 148
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 149
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 150
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v13, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArray(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 153
    :cond_4
    const-string v3, "CloudRequestResetFNIRules"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finished request to insight params request for FN update "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", sending notification."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v3, :cond_5

    .line 155
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 157
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v4, "reset_fn_icon_rules"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;->mUdn:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
