.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;
.super Ljava/lang/Object;
.source "CloudRequestGetSetBlobStorage.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field public static final URL:Ljava/lang/String;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final XML_CLOSE_TAG_ATTRIBUTELIST:Ljava/lang/String;

.field private final XML_TAG_ATTRIBUTELIST_END:Ljava/lang/String;

.field private final XML_TAG_ATTRIBUTELIST_START:Ljava/lang/String;

.field private mBlobOpType:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mData:Lorg/json/JSONObject;

.field private mMac:Ljava/lang/String;

.field private mPluginId:Ljava/lang/String;

.field private mUdn:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/message"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->URL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "pluginID"    # Ljava/lang/String;
    .param p5, "mac"    # Ljava/lang/String;
    .param p6, "blobOpType"    # Ljava/lang/String;
    .param p7, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, "CloudRequestGetSetBlobStorage"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->TAG:Ljava/lang/String;

    .line 19
    const/16 v0, 0x1770

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->TIMEOUT:I

    .line 20
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->TIMEOUT_LIMIT:I

    .line 26
    const-string v0, "<attributeLists action = \""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->XML_TAG_ATTRIBUTELIST_START:Ljava/lang/String;

    .line 27
    const-string v0, "\">"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->XML_TAG_ATTRIBUTELIST_END:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->XML_CLOSE_TAG_ATTRIBUTELIST:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 32
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mContext:Landroid/content/Context;

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mPluginId:Ljava/lang/String;

    .line 35
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mMac:Ljava/lang/String;

    .line 36
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mBlobOpType:Ljava/lang/String;

    .line 37
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mData:Lorg/json/JSONObject;

    .line 38
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
    .line 200
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 10

    .prologue
    .line 66
    const-string v5, ""

    .line 67
    .local v5, "internalContent3":Ljava/lang/String;
    const-string v1, ""

    .line 68
    .local v1, "beforeContent":Ljava/lang/String;
    const-string v4, ""

    .line 69
    .local v4, "internalContent2":Ljava/lang/String;
    const-string v0, ""

    .line 70
    .local v0, "afterContent":Ljava/lang/String;
    const-string v3, ""

    .line 72
    .local v3, "internalContent1":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<plugins><plugin><recipientId>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mPluginId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</recipientId>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "<macAddress>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mMac:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</macAddress>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 81
    .local v6, "pluginXML":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<plugin><pluginID>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mPluginId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</pluginID>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "<macAddress>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mMac:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</macAddress>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 89
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mBlobOpType:Ljava/lang/String;

    const-string v8, "getBlobStorage"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 90
    const-string v1, "<content><![CDATA[<getBlobStorage>"

    .line 92
    const-string v4, "<attributeLists action = \"getBlobStorage\">"

    .line 96
    const-string v0, "</getBlobStorage>]]></content>"

    .line 109
    :goto_0
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<attribute><name>FilterType</name><value>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mData:Lorg/json/JSONObject;

    const-string v9, "FilterType"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</value>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</attribute>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</plugin>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 121
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 122
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 123
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 124
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 125
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 126
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</plugin></plugins>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 131
    const-string v7, "CloudRequestGetSetBlobStorage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Final plugin XML:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-object v6

    .line 98
    :cond_0
    const-string v1, "<content><![CDATA[<setBlobStorage>"

    .line 100
    const-string v4, "<attributeLists action = \"setBlobStorage\">"

    .line 104
    const-string v0, "</getBlobStorage>]]></content>"

    goto/16 :goto_0

    .line 117
    :catch_0
    move-exception v2

    .line 118
    .local v2, "ex":Ljava/lang/Exception;
    const-string v7, "CloudRequestGetSetBlobStorage"

    const-string v8, "Exception in getBody"

    invoke-static {v7, v8, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_1
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 49
    const/16 v0, 0x1770

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 55
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 195
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 12
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 150
    if-eqz p1, :cond_2

    .line 151
    const-string v6, ""

    .line 153
    .local v6, "resp":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v7, p3, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 154
    .end local v6    # "resp":Ljava/lang/String;
    .local v7, "resp":Ljava/lang/String;
    :try_start_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v3

    .line 155
    .local v3, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v0

    .line 156
    .local v0, "attrList":Lorg/json/JSONObject;
    const-string v8, "CloudRequestGetSetBlobStorage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/BlobStorageParser;->parseSetResponse(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 158
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/BlobStorageParser;->parseGetResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 159
    .local v1, "attributes":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 160
    .local v5, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v2, ""

    .line 162
    .local v2, "currentKey":Ljava/lang/String;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 163
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "currentKey":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 164
    .restart local v2    # "currentKey":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v0, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 178
    .end local v0    # "attrList":Lorg/json/JSONObject;
    .end local v1    # "attributes":Lorg/json/JSONObject;
    .end local v2    # "currentKey":Ljava/lang/String;
    .end local v3    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v4

    move-object v6, v7

    .line 179
    .end local v7    # "resp":Ljava/lang/String;
    .local v4, "e":Ljava/lang/Exception;
    .restart local v6    # "resp":Ljava/lang/String;
    :goto_1
    const-string v8, "CloudRequestGetSetBlobStorage"

    const-string v9, "Exception in requestComplete e:"

    invoke-static {v8, v9, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 181
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_2
    const-string v8, "CloudRequestGetSetBlobStorage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Blob storage cloud response"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .end local v6    # "resp":Ljava/lang/String;
    :goto_3
    return-void

    .line 170
    .restart local v0    # "attrList":Lorg/json/JSONObject;
    .restart local v3    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v7    # "resp":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 171
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v9, 0x0

    invoke-virtual {v8, v3, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArray(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 172
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mBlobOpType:Ljava/lang/String;

    const-string v9, "getBlobStorage"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 173
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "get_blob_storage"

    const-string v10, "true"

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    move-object v6, v7

    .line 180
    .end local v7    # "resp":Ljava/lang/String;
    .restart local v6    # "resp":Ljava/lang/String;
    goto :goto_2

    .line 175
    .end local v6    # "resp":Ljava/lang/String;
    .restart local v7    # "resp":Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "set_blob_storage"

    const-string v10, "true"

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    .line 183
    .end local v0    # "attrList":Lorg/json/JSONObject;
    .end local v3    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v7    # "resp":Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mBlobOpType:Ljava/lang/String;

    const-string v9, "getBlobStorage"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 184
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "get_blob_storage"

    const-string v10, "false"

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 186
    :cond_3
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "set_blob_storage"

    const-string v10, "false"

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;->mUdn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 178
    .restart local v6    # "resp":Ljava/lang/String;
    :catch_1
    move-exception v4

    goto :goto_1
.end method
