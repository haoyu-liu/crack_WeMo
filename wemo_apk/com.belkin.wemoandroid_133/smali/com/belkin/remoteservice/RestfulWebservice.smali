.class public Lcom/belkin/remoteservice/RestfulWebservice;
.super Landroid/os/AsyncTask;
.source "RestfulWebservice.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/belkin/remoteservice/HttpResponseObject;",
        ">;"
    }
.end annotation


# static fields
.field private static objRequest:Ljava/lang/Object;


# instance fields
.field private filesToBeZipped:[Ljava/lang/String;

.field private httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

.field private mContext:Landroid/content/Context;

.field private nRequestId:I

.field private objHttpGet:Lorg/apache/http/client/methods/HttpGet;

.field private objHttpPost:Lorg/apache/http/client/methods/HttpPost;

.field private objHttpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

.field private objINetworkObserver:Lcom/belkin/remoteservice/INetworkObserver;

.field private pragmaUserVersion:Ljava/lang/String;

.field private reqParams:[Ljava/lang/String;

.field private ruleUtility:Lcom/belkin/utils/RuleUtility;

.field private strBaseURL:Ljava/lang/String;

.field private strBaseURLIcon:Ljava/lang/String;

.field private strGetDBFile:Ljava/lang/String;

.field private strSendFile:Ljava/lang/String;

.field private strZippedDBFilePath:Ljava/lang/String;

.field private uploadFileUtil:Lcom/belkin/utils/UploadFileUtil;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/remoteservice/RestfulWebservice;->objRequest:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p1, "param"    # [Ljava/lang/String;
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 53
    iput-object v1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 54
    iput-object v1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 55
    iput-object v1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->objINetworkObserver:Lcom/belkin/remoteservice/INetworkObserver;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->nRequestId:I

    .line 59
    iput-object v1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    .line 63
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/"

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strBaseURL:Ljava/lang/String;

    .line 64
    const-string v0, "https://api.xbcs.net:8443/apis/http/lswf/uploads/"

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strBaseURLIcon:Ljava/lang/String;

    .line 65
    const-string v0, "dbfile/"

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strGetDBFile:Ljava/lang/String;

    .line 66
    const-string v0, "sendfile/"

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strSendFile:Ljava/lang/String;

    .line 70
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->filesToBeZipped:[Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strZippedDBFilePath:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->pragmaUserVersion:Ljava/lang/String;

    .line 75
    new-instance v0, Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-direct {v0}, Lcom/belkin/remoteservice/HttpResponseObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    .line 79
    iput-object p2, p0, Lcom/belkin/remoteservice/RestfulWebservice;->mContext:Landroid/content/Context;

    .line 80
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    .line 81
    iput-object p1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    .line 82
    new-instance v0, Lcom/belkin/utils/UploadFileUtil;

    invoke-direct {v0}, Lcom/belkin/utils/UploadFileUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->uploadFileUtil:Lcom/belkin/utils/UploadFileUtil;

    .line 83
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v0, p2}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    .line 84
    return-void
.end method

.method private createGetDBFileRequest([Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;
    .locals 3
    .param p1, "reqParams"    # [Ljava/lang/String;

    .prologue
    .line 291
    const/4 v0, 0x0

    .line 293
    .local v0, "httpgetReqObj":Lorg/apache/http/client/methods/HttpGet;
    if-eqz p1, :cond_0

    .line 295
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    .end local v0    # "httpgetReqObj":Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strBaseURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strGetDBFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 297
    .restart local v0    # "httpgetReqObj":Lorg/apache/http/client/methods/HttpGet;
    const-string v1, "Authorization"

    const/4 v2, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    :cond_0
    return-object v0
.end method

.method private createIconSendFileRequest([Ljava/lang/String;Ljava/util/Vector;)Lorg/apache/http/client/methods/HttpPost;
    .locals 16
    .param p1, "reqParams"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<*>;)",
            "Lorg/apache/http/client/methods/HttpPost;"
        }
    .end annotation

    .prologue
    .line 356
    .local p2, "reqData":Ljava/util/Vector;, "Ljava/util/Vector<*>;"
    const/4 v4, 0x0

    .line 357
    .local v4, "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    .end local v4    # "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/remoteservice/RestfulWebservice;->strBaseURLIcon:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x4

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "?uploadType="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x5

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v4, v13}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 364
    .restart local v4    # "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    const-string v12, "--"

    .line 365
    .local v12, "twoHyphens":Ljava/lang/String;
    const-string v1, "----------------------------d27b405c366a"

    .line 366
    .local v1, "BOUNDARY":Ljava/lang/String;
    const-string v2, "\r\n"

    .line 368
    .local v2, "CRLF":Ljava/lang/String;
    const-string v13, "Authorization"

    const/4 v14, 0x1

    aget-object v14, p1, v14

    invoke-virtual {v4, v13, v14}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    const-string v13, "Accept"

    const-string v14, "application/json"

    invoke-virtual {v4, v13, v14}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    const-string v13, "Content-Type"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "multipart/form-data;boundary="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Ljava/util/Vector;->size()I

    move-result v13

    if-lez v13, :cond_0

    .line 373
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 374
    .local v5, "objData":Ljava/lang/Object;
    instance-of v13, v5, [B

    if-eqz v13, :cond_0

    .line 375
    check-cast v5, [B

    .end local v5    # "objData":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, [B

    .line 378
    .local v6, "objDataToSend":[B
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 379
    .local v7, "strPrefix1":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Content-Disposition:form-data;name="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x6

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ";filename="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x6

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x7

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 381
    .local v8, "strPrefix2":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Content-Type:image/jpeg"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 383
    .local v9, "strPrefix3":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Content-Transfer-Encoding: binary"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 385
    .local v10, "strPrefix4":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 387
    .local v11, "strPrefix5":Ljava/lang/String;
    new-instance v3, Lorg/apache/http/util/ByteArrayBuffer;

    array-length v13, v6

    invoke-direct {v3, v13}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 389
    .local v3, "byteArrBuff":Lorg/apache/http/util/ByteArrayBuffer;
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v3, v13, v14, v15}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 391
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v3, v13, v14, v15}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 393
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v3, v13, v14, v15}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 395
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v3, v13, v14, v15}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 397
    const/4 v13, 0x0

    array-length v14, v6

    invoke-virtual {v3, v6, v13, v14}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 398
    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v3, v13, v14, v15}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 401
    invoke-virtual {v3}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v6

    .end local v6    # "objDataToSend":[B
    check-cast v6, [B

    .line 403
    .restart local v6    # "objDataToSend":[B
    new-instance v13, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v13, v6}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v4, v13}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 407
    .end local v3    # "byteArrBuff":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v6    # "objDataToSend":[B
    .end local v7    # "strPrefix1":Ljava/lang/String;
    .end local v8    # "strPrefix2":Ljava/lang/String;
    .end local v9    # "strPrefix3":Ljava/lang/String;
    .end local v10    # "strPrefix4":Ljava/lang/String;
    .end local v11    # "strPrefix5":Ljava/lang/String;
    :cond_0
    return-object v4
.end method

.method private createSendFileRequest([Ljava/lang/String;Ljava/util/Vector;)Lorg/apache/http/client/methods/HttpPost;
    .locals 15
    .param p1, "reqParams"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<*>;)",
            "Lorg/apache/http/client/methods/HttpPost;"
        }
    .end annotation

    .prologue
    .line 306
    .local p2, "reqData":Ljava/util/Vector;, "Ljava/util/Vector<*>;"
    const/4 v4, 0x0

    .line 307
    .local v4, "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    .end local v4    # "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strBaseURL:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/remoteservice/RestfulWebservice;->strSendFile:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x2

    aget-object v13, p1, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v12}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 310
    .restart local v4    # "httppostReqObj":Lorg/apache/http/client/methods/HttpPost;
    const-string v11, "--"

    .line 311
    .local v11, "twoHyphens":Ljava/lang/String;
    const-string v1, "=======djfsdfjscvjsdvjsd2367213======"

    .line 312
    .local v1, "BOUNDARY":Ljava/lang/String;
    const-string v2, "\r\n"

    .line 314
    .local v2, "CRLF":Ljava/lang/String;
    const-string v12, "Authorization"

    const/4 v13, 0x1

    aget-object v13, p1, v13

    invoke-virtual {v4, v12, v13}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    const-string v12, "Content-Type"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "multipart/form-data;boundary="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v12, v13}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Ljava/util/Vector;->size()I

    move-result v12

    if-lez v12, :cond_0

    .line 320
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 321
    .local v5, "objData":Ljava/lang/Object;
    instance-of v12, v5, [B

    if-eqz v12, :cond_0

    .line 322
    check-cast v5, [B

    .end local v5    # "objData":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, [B

    .line 325
    .local v6, "objDataToSend":[B
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 326
    .local v7, "strPrefix1":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Content-Disposition:form-data;name=filedata;filename=rules.db"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 328
    .local v8, "strPrefix2":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Content-Type:application/octet-stream"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 330
    .local v9, "strPrefix3":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 333
    .local v10, "strPrefix5":Ljava/lang/String;
    new-instance v3, Lorg/apache/http/util/ByteArrayBuffer;

    array-length v12, v6

    invoke-direct {v3, v12}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 335
    .local v3, "byteArrBuff":Lorg/apache/http/util/ByteArrayBuffer;
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    invoke-virtual {v3, v12, v13, v14}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 337
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    invoke-virtual {v3, v12, v13, v14}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 339
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    invoke-virtual {v3, v12, v13, v14}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 341
    const/4 v12, 0x0

    array-length v13, v6

    invoke-virtual {v3, v6, v12, v13}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 342
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    invoke-virtual {v3, v12, v13, v14}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 345
    invoke-virtual {v3}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v6

    .end local v6    # "objDataToSend":[B
    check-cast v6, [B

    .line 347
    .restart local v6    # "objDataToSend":[B
    new-instance v12, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v12, v6}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v4, v12}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 351
    .end local v3    # "byteArrBuff":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v6    # "objDataToSend":[B
    .end local v7    # "strPrefix1":Ljava/lang/String;
    .end local v8    # "strPrefix2":Ljava/lang/String;
    .end local v9    # "strPrefix3":Ljava/lang/String;
    .end local v10    # "strPrefix5":Ljava/lang/String;
    :cond_0
    return-object v4
.end method

.method public static readData(Ljava/io/InputStream;)[B
    .locals 7
    .param p0, "ipstrmToRead"    # Ljava/io/InputStream;

    .prologue
    .line 264
    const/4 v3, 0x0

    .line 267
    .local v3, "dataToRead":[B
    move-object v5, p0

    .line 268
    .local v5, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 269
    .local v1, "bis":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v6, 0x32

    invoke-direct {v0, v6}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 270
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v2, 0x0

    .line 271
    .local v2, "current":I
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    const/4 v6, -0x1

    if-eq v2, v6, :cond_0

    .line 273
    int-to-byte v6, v2

    invoke-virtual {v0, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 281
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    :catch_0
    move-exception v4

    .line 283
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 286
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v3

    .line 275
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "current":I
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 276
    const/4 v1, 0x0

    .line 277
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v5, 0x0

    .line 279
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_1
.end method

.method private setHttpObj(Lcom/belkin/remoteservice/HttpResponseObject;)V
    .locals 0
    .param p1, "mHttpResponseObject"    # Lcom/belkin/remoteservice/HttpResponseObject;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    .line 237
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/belkin/remoteservice/HttpResponseObject;
    .locals 19
    .param p1, "parammeters"    # [Ljava/lang/Void;

    .prologue
    .line 97
    new-instance v13, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v13}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 99
    .local v13, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v15, Lorg/apache/http/conn/scheme/Scheme;

    const-string v16, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v17

    const/16 v18, 0x50

    invoke-direct/range {v15 .. v18}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v13, v15}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 103
    :try_start_0
    new-instance v15, Lorg/apache/http/conn/scheme/Scheme;

    const-string v16, "https"

    new-instance v17, Lcom/belkin/remoteservice/SSLSocketFactoryImpl;

    const/16 v18, 0x0

    invoke-direct/range {v17 .. v18}, Lcom/belkin/remoteservice/SSLSocketFactoryImpl;-><init>(Ljava/security/KeyStore;)V

    const/16 v18, 0x1bb

    invoke-direct/range {v15 .. v18}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v13, v15}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;
    :try_end_0
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/UnrecoverableKeyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_3

    .line 120
    :goto_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v8, "mSecureHeaderParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v15, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v15}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v15}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v15

    invoke-virtual {v15}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v12

    .line 123
    .local v12, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v12}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 125
    new-instance v11, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v11}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 127
    .local v11, "params":Lorg/apache/http/params/HttpParams;
    const-string v15, "http.conn-manager.max-total"

    const/16 v16, 0x1e

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v11, v15, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 129
    const-string v15, "http.conn-manager.max-per-route"

    new-instance v16, Lorg/apache/http/conn/params/ConnPerRouteBean;

    const/16 v17, 0x1e

    invoke-direct/range {v16 .. v17}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>(I)V

    move-object/from16 v0, v16

    invoke-interface {v11, v15, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 131
    const-string v15, "http.protocol.expect-continue"

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v11, v15, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 135
    const v15, 0x186a0

    invoke-static {v11, v15}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 138
    const v15, 0x186a0

    invoke-static {v11, v15}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 139
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x1390

    move/from16 v0, v16

    if-eq v15, v0, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x139f

    move/from16 v0, v16

    if-ne v15, v0, :cond_1

    .line 140
    :cond_0
    const-string v15, "UTF-8"

    invoke-static {v11, v15}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 142
    :cond_1
    sget-object v15, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v11, v15}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 144
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x1390

    move/from16 v0, v16

    if-ne v15, v0, :cond_5

    .line 145
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/remoteservice/RestfulWebservice;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    move-object/from16 v17, v0

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "pluginrules2.db"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "temppluginRules.db"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const-string v18, "false"

    invoke-virtual/range {v15 .. v18}, Lcom/belkin/utils/RuleUtility;->copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 146
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->filesToBeZipped:[Ljava/lang/String;

    const/16 v16, 0x0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "temppluginRules.db"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    .line 148
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-virtual {v15}, Lcom/belkin/utils/RuleUtility;->createLocalZippedDBFilePath()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->strZippedDBFilePath:Ljava/lang/String;

    .line 150
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->strZippedDBFilePath:Ljava/lang/String;

    invoke-static {v15}, Lcom/belkin/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v4

    .line 152
    .local v4, "dataToSend":[B
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 153
    .local v14, "vecDataToSend":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Object;>;"
    invoke-virtual {v14, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 156
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v14}, Lcom/belkin/remoteservice/RestfulWebservice;->createSendFileRequest([Ljava/lang/String;Ljava/util/Vector;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 170
    .end local v4    # "dataToSend":[B
    .end local v14    # "vecDataToSend":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Object;>;"
    :cond_2
    :goto_1
    new-instance v2, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v2, v11, v13}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 173
    .local v2, "cm":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v2, v11}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 176
    .local v1, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    const/4 v10, 0x0

    .line 177
    .local v10, "objHttpResponse":Lorg/apache/http/HttpResponse;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v15, :cond_7

    .line 179
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v1, v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 185
    :cond_3
    :goto_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x139f

    move/from16 v0, v16

    if-eq v15, v0, :cond_8

    .line 186
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    .line 187
    .local v7, "ipstrmToRead":Ljava/io/InputStream;
    invoke-static {v7}, Lcom/belkin/remoteservice/RestfulWebservice;->readData(Ljava/io/InputStream;)[B

    move-result-object v3

    .line 188
    .local v3, "dataReceived":[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x138f

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 190
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->uploadFileUtil:Lcom/belkin/utils/UploadFileUtil;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/remoteservice/RestfulWebservice;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v15, v3, v0}, Lcom/belkin/utils/UploadFileUtil;->writeFile([BLandroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->pragmaUserVersion:Ljava/lang/String;

    .line 193
    :cond_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/remoteservice/HttpResponseObject;->setResponseCode(I)V

    .line 194
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/remoteservice/RestfulWebservice;->pragmaUserVersion:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/remoteservice/HttpResponseObject;->setPragmaVersion(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    :goto_3
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 219
    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 221
    .end local v3    # "dataReceived":[B
    .end local v7    # "ipstrmToRead":Ljava/io/InputStream;
    :goto_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    return-object v15

    .line 105
    .end local v1    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v2    # "cm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v8    # "mSecureHeaderParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v10    # "objHttpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "params":Lorg/apache/http/params/HttpParams;
    .end local v12    # "policy":Landroid/os/StrictMode$ThreadPolicy;
    :catch_0
    move-exception v6

    .line 107
    .local v6, "e1":Ljava/security/KeyManagementException;
    invoke-virtual {v6}, Ljava/security/KeyManagementException;->printStackTrace()V

    goto/16 :goto_0

    .line 108
    .end local v6    # "e1":Ljava/security/KeyManagementException;
    :catch_1
    move-exception v6

    .line 110
    .local v6, "e1":Ljava/security/UnrecoverableKeyException;
    invoke-virtual {v6}, Ljava/security/UnrecoverableKeyException;->printStackTrace()V

    goto/16 :goto_0

    .line 111
    .end local v6    # "e1":Ljava/security/UnrecoverableKeyException;
    :catch_2
    move-exception v6

    .line 113
    .local v6, "e1":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v6}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto/16 :goto_0

    .line 114
    .end local v6    # "e1":Ljava/security/NoSuchAlgorithmException;
    :catch_3
    move-exception v6

    .line 116
    .local v6, "e1":Ljava/security/KeyStoreException;
    invoke-virtual {v6}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto/16 :goto_0

    .line 157
    .end local v6    # "e1":Ljava/security/KeyStoreException;
    .restart local v8    # "mSecureHeaderParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v11    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v12    # "policy":Landroid/os/StrictMode$ThreadPolicy;
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x138f

    move/from16 v0, v16

    if-ne v15, v0, :cond_6

    .line 159
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/remoteservice/RestfulWebservice;->createGetDBFileRequest([Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpGet:Lorg/apache/http/client/methods/HttpGet;

    goto/16 :goto_1

    .line 160
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    const/16 v16, 0x139f

    move/from16 v0, v16

    if-ne v15, v0, :cond_2

    .line 163
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    const/16 v16, 0x3

    aget-object v15, v15, v16

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/belkin/remoteservice/RestfulWebservice;->iconConvertion(Ljava/lang/String;)[B

    move-result-object v4

    .line 164
    .restart local v4    # "dataToSend":[B
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 165
    .restart local v14    # "vecDataToSend":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Object;>;"
    invoke-virtual {v14, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 167
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->reqParams:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v14}, Lcom/belkin/remoteservice/RestfulWebservice;->createIconSendFileRequest([Ljava/lang/String;Ljava/util/Vector;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpPost:Lorg/apache/http/client/methods/HttpPost;

    goto/16 :goto_1

    .line 181
    .end local v4    # "dataToSend":[B
    .end local v14    # "vecDataToSend":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Object;>;"
    .restart local v1    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v2    # "cm":Lorg/apache/http/conn/ClientConnectionManager;
    .restart local v10    # "objHttpResponse":Lorg/apache/http/HttpResponse;
    :cond_7
    :try_start_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v15, :cond_3

    .line 183
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->objHttpGet:Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v1, v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    goto/16 :goto_2

    .line 196
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/remoteservice/HttpResponseObject;->setResponseCode(I)V

    .line 197
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    .line 198
    .restart local v7    # "ipstrmToRead":Ljava/io/InputStream;
    invoke-static {v7}, Lcom/belkin/remoteservice/RestfulWebservice;->readData(Ljava/io/InputStream;)[B

    move-result-object v3

    .line 199
    .restart local v3    # "dataReceived":[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v15, v3}, Lcom/belkin/remoteservice/HttpResponseObject;->setDataReceived([B)V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_3

    .line 201
    .end local v3    # "dataReceived":[B
    .end local v7    # "ipstrmToRead":Ljava/io/InputStream;
    :catch_4
    move-exception v5

    .line 202
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    :try_start_3
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 203
    .local v9, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v15, "WebServiceError"

    const-string v16, "ClientProtocolException in sendSecure"

    move-object/from16 v0, v16

    invoke-interface {v9, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 218
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 219
    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto/16 :goto_4

    .line 204
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    .end local v9    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_5
    move-exception v5

    .line 205
    .local v5, "e":Ljava/io/IOException;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-virtual {v15}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->pragmaUserVersion:Ljava/lang/String;

    .line 206
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/remoteservice/RestfulWebservice;->pragmaUserVersion:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/remoteservice/HttpResponseObject;->setPragmaVersion(Ljava/lang/String;)V

    .line 207
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 208
    .restart local v9    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v15, "WebServiceError"

    const-string v16, "IOException in sendSecure "

    move-object/from16 v0, v16

    invoke-interface {v9, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 218
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 219
    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto/16 :goto_4

    .line 209
    .end local v5    # "e":Ljava/io/IOException;
    .end local v9    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_6
    move-exception v5

    .line 210
    .local v5, "e":Ljava/lang/Exception;
    :try_start_5
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 211
    .restart local v9    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v15, "WebServiceError"

    const-string v16, "ServerAdressException in sendSecure "

    move-object/from16 v0, v16

    invoke-interface {v9, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 218
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 219
    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto/16 :goto_4

    .line 218
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v9    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception v15

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 219
    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    throw v15
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 50
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/remoteservice/RestfulWebservice;->doInBackground([Ljava/lang/Void;)Lcom/belkin/remoteservice/HttpResponseObject;

    move-result-object v0

    return-object v0
.end method

.method public getHttpObj()Lcom/belkin/remoteservice/HttpResponseObject;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/belkin/remoteservice/RestfulWebservice;->httpResponseObj:Lcom/belkin/remoteservice/HttpResponseObject;

    return-object v0
.end method

.method public iconConvertion(Ljava/lang/String;)[B
    .locals 8
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 246
    const/4 v1, 0x0

    .line 247
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 248
    .local v0, "bfo":Landroid/graphics/BitmapFactory$Options;
    const/4 v5, 0x1

    iput v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 249
    const/4 v5, 0x0

    iput-boolean v5, v0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 251
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 252
    .local v2, "iconName":[Ljava/lang/String;
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aget-object v3, v2, v5

    .line 253
    .local v3, "imageName":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/storage/sdcard0/Android/data/com.belkin.wemoandroid/cache/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 254
    .local v4, "temp":Ljava/lang/String;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "PATH*******"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 255
    invoke-static {v4, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 256
    if-eqz v1, :cond_0

    .line 257
    invoke-static {v1}, Lcom/belkin/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v5

    .line 259
    :goto_0
    return-object v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method protected onPostExecute(Lcom/belkin/remoteservice/HttpResponseObject;)V
    .locals 0
    .param p1, "result"    # Lcom/belkin/remoteservice/HttpResponseObject;

    .prologue
    .line 227
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 229
    invoke-direct {p0, p1}, Lcom/belkin/remoteservice/RestfulWebservice;->setHttpObj(Lcom/belkin/remoteservice/HttpResponseObject;)V

    .line 230
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 50
    check-cast p1, Lcom/belkin/remoteservice/HttpResponseObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/remoteservice/RestfulWebservice;->onPostExecute(Lcom/belkin/remoteservice/HttpResponseObject;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 90
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 91
    return-void
.end method
