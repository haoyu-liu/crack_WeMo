.class public Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "StoreDeviceRulesStoreSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;
    }
.end annotation


# static fields
.field public static final DO_NOT_PROCESS_DB:Ljava/lang/String; = "0"

.field public static final PROCESS_DB_ON_DEVICE:Ljava/lang/String; = "1"


# instance fields
.field private callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

.field private dbVersionToSet:Ljava/lang/String;

.field private device:Lorg/cybergarage/upnp/Device;

.field private localZippedDBFilePath:Ljava/lang/String;

.field private processDB:I


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Lorg/cybergarage/upnp/Device;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "callback"    # Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;
    .param p3, "dbVersionToSet"    # Ljava/lang/String;
    .param p4, "localZippedDBFilePath"    # Ljava/lang/String;
    .param p5, "processDB"    # I

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 98
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 99
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->dbVersionToSet:Ljava/lang/String;

    .line 100
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->localZippedDBFilePath:Ljava/lang/String;

    .line 101
    iput p5, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->processDB:I

    .line 102
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    .line 103
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->parseControlActionResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->sendResponseViaCallbacks(Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method private getDBInBase64Encoding()Ljava/lang/String;
    .locals 6

    .prologue
    .line 173
    const-string v1, ""

    .line 176
    .local v1, "dbInBase64":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->localZippedDBFilePath:Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 178
    .local v0, "dbByteArray":[B
    if-eqz v0, :cond_0

    .line 180
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\n"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n\r"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 184
    .local v2, "encodedDB":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Store Rules: Encoded DB length"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<![CDATA["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]]>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 189
    .end local v2    # "encodedDB":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 187
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error: Unable to read DB file at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->localZippedDBFilePath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseControlActionResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 193
    new-instance v0, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 194
    .local v0, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 196
    .local v1, "responseJSON":Lorg/json/JSONObject;
    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2, p1}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 198
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Device Rules Response JSON: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    return-object v1
.end method

.method private sendResponseViaCallbacks(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 6
    .param p1, "responseJSON"    # Lorg/json/JSONObject;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x1

    .line 207
    :try_start_0
    const-string v2, "errorInfo"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 209
    .local v1, "errorInfo":Ljava/lang/String;
    const-string v2, "Storing of rules DB Successful!"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 210
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    invoke-interface {v2, p2}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onSuccess(Ljava/lang/String;)V

    .line 226
    .end local v1    # "errorInfo":Ljava/lang/String;
    :goto_0
    return-void

    .line 212
    .restart local v1    # "errorInfo":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    new-instance v3, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-direct {v3, p2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 215
    .end local v1    # "errorInfo":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->TAG:Ljava/lang/String;

    const-string v3, "JSONException in Device STORE RULES: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    new-instance v3, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v5, v4, p2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0

    .line 220
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->TAG:Ljava/lang/String;

    const-string v3, "NumberFormatException in Device STORE RULES: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 222
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    new-instance v3, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v5, v4, p2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 110
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->getDBInBase64Encoding()Ljava/lang/String;

    move-result-object v7

    .line 112
    .local v7, "dbInBase64Encoding":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    new-instance v2, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "StoreRules"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 120
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 123
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "ruleDbVersion"

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->dbVersionToSet:Ljava/lang/String;

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string v2, "processDb"

    iget v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->processDB:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    const-string v0, "0"

    :goto_1
    invoke-virtual {v6, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const-string v0, "ruleDbBody"

    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->getDBInBase64Encoding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Ljava/lang/String;)V

    .line 132
    .local v4, "callback":Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V

    goto :goto_0

    .line 126
    .end local v4    # "callback":Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;
    :cond_2
    const-string v0, "1"

    goto :goto_1
.end method
