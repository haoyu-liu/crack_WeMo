.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;
.super Ljava/lang/Object;
.source "CloudRequestForSalesforce.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final URL:Ljava/lang/String;

.field private finalResponse:[Ljava/lang/String;

.field private formKeys:[Ljava/lang/String;

.field private formValues:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;)V
    .locals 6
    .param p1, "paramArray"    # Lorg/json/JSONArray;

    .prologue
    const/16 v4, 0x8

    const/4 v5, 0x2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v2, "SDK_CloudRequestForSalesforce"

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->TAG:Ljava/lang/String;

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/apis/http/analytic/support/reportAProblem"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->URL:Ljava/lang/String;

    .line 12
    new-array v2, v4, [Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    .line 13
    new-array v2, v4, [Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formValues:[Ljava/lang/String;

    .line 14
    new-array v2, v5, [Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->finalResponse:[Ljava/lang/String;

    .line 17
    const-string v2, "SDK_CloudRequestForSalesforce"

    const-string v3, "In CloudRequestForSalesforce: Constructor"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 20
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formValues:[Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 25
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "firstName"

    aput-object v4, v2, v3

    .line 26
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x1

    const-string v4, "lastName"

    aput-object v4, v2, v3

    .line 27
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const-string v3, "email"

    aput-object v3, v2, v5

    .line 28
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x3

    const-string v4, "phone"

    aput-object v4, v2, v3

    .line 29
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x4

    const-string v4, "product"

    aput-object v4, v2, v3

    .line 30
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x5

    const-string v4, "problemCode"

    aput-object v4, v2, v3

    .line 31
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x6

    const-string v4, "caseSubject"

    aput-object v4, v2, v3

    .line 32
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    const/4 v3, 0x7

    const-string v4, "caseNotes"

    aput-object v4, v2, v3

    .line 33
    return-void
.end method


# virtual methods
.method public getFormKeys()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formKeys:[Ljava/lang/String;

    return-object v0
.end method

.method public getFormValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->formValues:[Ljava/lang/String;

    return-object v0
.end method

.method public getRequestMethod()Z
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x1

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 3

    .prologue
    .line 50
    const-string v0, "SDK_CloudRequestForSalesforce"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " requestURL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public requestComplete(ILjava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "status"    # I
    .param p2, "response"    # Ljava/lang/String;

    .prologue
    .line 37
    const-string v0, "SDK_CloudRequestForSalesforce"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "In CloudRequestForSalesforce: requestComplete status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->finalResponse:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->finalResponse:[Ljava/lang/String;

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;->finalResponse:[Ljava/lang/String;

    return-object v0
.end method
