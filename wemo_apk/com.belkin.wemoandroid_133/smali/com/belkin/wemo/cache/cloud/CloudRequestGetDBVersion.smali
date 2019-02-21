.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;
.super Ljava/lang/Object;
.source "CloudRequestGetDBVersion.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private mac:Ljava/lang/String;

.field private modelCode:Ljava/lang/String;

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

.field private pluginID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 2
    .param p1, "pluginID"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;
    .param p3, "modelCode"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/message/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->URL:Ljava/lang/String;

    .line 12
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->TAG:Ljava/lang/String;

    .line 13
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->TIMEOUT_LIMIT:I

    .line 14
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->TIMEOUT:I

    .line 23
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->pluginID:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->mac:Ljava/lang/String;

    .line 25
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->modelCode:Ljava/lang/String;

    .line 26
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 27
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
    .line 107
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<modelCode>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->modelCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</modelCode>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<![CDATA[ <getDbVersion>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</getDbVersion> ]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "body":Ljava/lang/String;
    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOnRequestCompleteListener()Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 50
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 102
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 83
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GetDBVersion Cloud request completed. Status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 88
    :cond_0
    return-void
.end method

.method public setOnRequestCompleteListener(Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 0
    .param p1, "onRequestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 36
    return-void
.end method
