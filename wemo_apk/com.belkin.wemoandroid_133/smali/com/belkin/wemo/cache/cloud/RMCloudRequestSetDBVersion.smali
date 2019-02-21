.class public Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;
.super Ljava/lang/Object;
.source "RMCloudRequestSetDBVersion.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private dbVersion:I

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

.field private pluginIDToMacHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;ILcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 2
    .param p2, "dbVersion"    # I
    .param p3, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "pluginIDToMacHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->URL:Ljava/lang/String;

    .line 13
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->TIMEOUT_LIMIT:I

    .line 14
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->TIMEOUT:I

    .line 22
    iput p2, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->dbVersion:I

    .line 23
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->pluginIDToMacHashMap:Ljava/util/HashMap;

    .line 24
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 25
    return-void
.end method

.method private getPluginTag(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "pluginID"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<![CDATA[ <setDbVersion>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<dbVersion>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->dbVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</dbVersion>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</setDbVersion> ]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "body":Ljava/lang/String;
    return-object v0
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
    .line 123
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 5

    .prologue
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->pluginIDToMacHashMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 62
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->getPluginTag(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 65
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<plugins>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</plugins>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOnRequestCompleteListener()Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 48
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 118
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 1
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 99
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 114
    :cond_0
    return-void
.end method

.method public setOnRequestCompleteListener(Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 0
    .param p1, "onRequestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 39
    return-void
.end method
