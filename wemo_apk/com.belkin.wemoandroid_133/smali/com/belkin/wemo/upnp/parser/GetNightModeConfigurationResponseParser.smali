.class public Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetNightModeConfigurationResponseParser.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isEndTime:Z

.field private isNightMode:Z

.field private isNightModeBrightness:Z

.field private isStartTime:Z

.field private nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 13
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightModeBrightness:Z

    .line 17
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isEndTime:Z

    .line 18
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isStartTime:Z

    .line 19
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightMode:Z

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 4
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 69
    sget-object v0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "characters: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightMode:Z

    if-eqz v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setNightMode(Ljava/lang/String;)V

    .line 73
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightMode:Z

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightModeBrightness:Z

    if-eqz v0, :cond_2

    .line 75
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setNightModeBrightness(Ljava/lang/String;)V

    .line 76
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightModeBrightness:Z

    goto :goto_0

    .line 77
    :cond_2
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isStartTime:Z

    if-eqz v0, :cond_3

    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setStartTime(Ljava/lang/String;)V

    .line 79
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isStartTime:Z

    goto :goto_0

    .line 80
    :cond_3
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isEndTime:Z

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setEndTime(Ljava/lang/String;)V

    .line 82
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isEndTime:Z

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 91
    sget-object v0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endElement: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const-string v0, "nightMode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightMode:Z

    .line 102
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    const-string v0, "nightModeBrightness"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 96
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightModeBrightness:Z

    goto :goto_0

    .line 97
    :cond_2
    const-string v0, "startTime"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 98
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isStartTime:Z

    goto :goto_0

    .line 99
    :cond_3
    const-string v0, "endTime"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isEndTime:Z

    goto :goto_0
.end method

.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 31
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 32
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 33
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "parseResponse: response str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    new-instance v1, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    .line 37
    if-eqz p1, :cond_0

    .line 38
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->nightModeConfiguration:Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    return-object v1

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Lorg/xml/sax/SAXException;
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    const-string v2, "SAXException while parsing GetNightModeConfiguration Response: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 52
    sget-object v0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startElement: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const-string v0, "nightMode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightMode:Z

    .line 63
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    const-string v0, "nightModeBrightness"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isNightModeBrightness:Z

    goto :goto_0

    .line 58
    :cond_2
    const-string v0, "startTime"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 59
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isStartTime:Z

    goto :goto_0

    .line 60
    :cond_3
    const-string v0, "endTime"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->isEndTime:Z

    goto :goto_0
.end method
