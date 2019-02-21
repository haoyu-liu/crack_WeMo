.class final Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;
.super Landroid/os/AsyncTask;
.source "ZigbeeFirmwareUpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->updateSubDeviceFirmwareRequest(Lcom/belkin/firmware/FirmwareDetails;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$firmwareDetails:Lcom/belkin/firmware/FirmwareDetails;


# direct methods
.method constructor <init>(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 0

    .prologue
    .line 237
    iput-object p1, p0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;->val$firmwareDetails:Lcom/belkin/firmware/FirmwareDetails;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 237
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 11
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 242
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->access$000()Ljava/lang/String;

    move-result-object v0

    .line 243
    .local v0, "authHeader":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;->val$firmwareDetails:Lcom/belkin/firmware/FirmwareDetails;

    invoke-static {v8}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->access$100(Lcom/belkin/firmware/FirmwareDetails;)Ljava/lang/String;

    move-result-object v5

    .line 244
    .local v5, "requestXML":Ljava/lang/String;
    sget-object v8, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "requestXML :"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->access$200()Ljava/lang/String;

    move-result-object v7

    .line 246
    .local v7, "url":Ljava/lang/String;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v4, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 248
    .local v4, "request":Lorg/apache/http/client/methods/HttpPost;
    const-string v8, "Content-Type"

    const-string v9, "application/xml"

    invoke-virtual {v4, v8, v9}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    const-string v8, "Authorization"

    invoke-virtual {v4, v8, v0}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    :try_start_0
    new-instance v8, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v8, v5}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 252
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 253
    .local v1, "client":Lorg/apache/http/client/HttpClient;
    sget-object v8, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v9, "all set to make request"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    invoke-interface {v1, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 255
    .local v6, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 256
    .local v2, "code":I
    iget-object v8, p0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;->val$firmwareDetails:Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v8}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 257
    sget-object v8, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fw Update request response:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 265
    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "code":I
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    const/4 v8, 0x0

    return-object v8

    .line 258
    :catch_0
    move-exception v3

    .line 260
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 261
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v3

    .line 263
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
