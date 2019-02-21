.class public abstract Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RMBaseUPNPResponseParser.java"


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V
    .locals 1
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->TAG:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .line 20
    return-void
.end method


# virtual methods
.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 24
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 26
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 29
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uPnP response received from device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    if-eqz p1, :cond_0

    .line 33
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    return-object v1

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Lorg/xml/sax/SAXException;
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->TAG:Ljava/lang/String;

    const-string v2, "SAXException during XML parsing: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
