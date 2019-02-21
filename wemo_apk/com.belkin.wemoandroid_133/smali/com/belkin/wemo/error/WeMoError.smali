.class public Lcom/belkin/wemo/error/WeMoError;
.super Ljava/lang/Object;
.source "WeMoError.java"


# static fields
.field public static final ERROR_CODE:Ljava/lang/String; = "ERROR_CODE"

.field public static final ERROR_MSG:Ljava/lang/String; = "ERROR_MSG"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected errorCode:I

.field protected errorMessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/belkin/wemo/error/WeMoError;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/error/WeMoError;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/error/WeMoError;->errorMessage:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/belkin/wemo/error/WeMoError;->errorCode:I

    .line 19
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/error/WeMoError;->setErrorMessage(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lcom/belkin/wemo/error/WeMoError;->errorCode:I

    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/belkin/wemo/error/WeMoError;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public setErrorCode(I)V
    .locals 0
    .param p1, "errorCode"    # I

    .prologue
    .line 36
    iput p1, p0, Lcom/belkin/wemo/error/WeMoError;->errorCode:I

    .line 37
    return-void
.end method

.method public setErrorMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 48
    if-nez p1, :cond_0

    .line 49
    new-instance p1, Ljava/lang/String;

    .end local p1    # "errorMessage":Ljava/lang/String;
    invoke-direct {p1}, Ljava/lang/String;-><init>()V

    .line 51
    .restart local p1    # "errorMessage":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/error/WeMoError;->errorMessage:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public toJson()Lorg/json/JSONObject;
    .locals 5

    .prologue
    .line 55
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 57
    .local v1, "errorJO":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "ERROR_CODE"

    iget v3, p0, Lcom/belkin/wemo/error/WeMoError;->errorCode:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 58
    const-string v2, "ERROR_MSG"

    iget-object v3, p0, Lcom/belkin/wemo/error/WeMoError;->errorMessage:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    sget-object v2, Lcom/belkin/wemo/error/WeMoError;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error JSON = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-object v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/wemo/error/WeMoError;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while creating JSONObject from WeMoError: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
