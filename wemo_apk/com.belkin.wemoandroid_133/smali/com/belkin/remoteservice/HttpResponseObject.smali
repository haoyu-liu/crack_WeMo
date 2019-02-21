.class public Lcom/belkin/remoteservice/HttpResponseObject;
.super Ljava/lang/Object;
.source "HttpResponseObject.java"


# instance fields
.field private arrBasicHeader:[Lorg/apache/http/message/BasicHeader;

.field private bytearrDataReceived:[B

.field private nRequestId:I

.field private nResponseCode:I

.field private pragmaVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nRequestId:I

    .line 8
    iput v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nResponseCode:I

    .line 9
    iput-object v1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->arrBasicHeader:[Lorg/apache/http/message/BasicHeader;

    .line 10
    iput-object v1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->bytearrDataReceived:[B

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->pragmaVersion:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDataReceived()[B
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->bytearrDataReceived:[B

    return-object v0
.end method

.method public getHeaders()[Lorg/apache/http/message/BasicHeader;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->arrBasicHeader:[Lorg/apache/http/message/BasicHeader;

    return-object v0
.end method

.method public getPragmaVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->pragmaVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestId()I
    .locals 1

    .prologue
    .line 23
    iget v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nRequestId:I

    return v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nResponseCode:I

    return v0
.end method

.method public setDataReceived([B)V
    .locals 0
    .param p1, "dataReceived"    # [B

    .prologue
    .line 58
    iput-object p1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->bytearrDataReceived:[B

    .line 59
    return-void
.end method

.method public setHeaders([Lorg/apache/http/message/BasicHeader;)V
    .locals 0
    .param p1, "headers"    # [Lorg/apache/http/message/BasicHeader;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->arrBasicHeader:[Lorg/apache/http/message/BasicHeader;

    .line 49
    return-void
.end method

.method public setPragmaVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "pragmaVersion"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->pragmaVersion:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setRequestId(I)V
    .locals 0
    .param p1, "requestId"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nRequestId:I

    .line 29
    return-void
.end method

.method public setResponseCode(I)V
    .locals 0
    .param p1, "responseCode"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/belkin/remoteservice/HttpResponseObject;->nResponseCode:I

    .line 39
    return-void
.end method
