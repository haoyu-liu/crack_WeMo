.class public Lcom/belkin/upnp/parser/GetMetaDataResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetMetaDataResponse.java"


# instance fields
.field metadata:Z

.field private metadataBuffer:Ljava/lang/StringBuffer;

.field modelcode:Z

.field private parseField:I

.field serialnumber:Z

.field uniqueid:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 13
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadata:Z

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->serialnumber:Z

    .line 14
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->uniqueid:Z

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->modelcode:Z

    .line 34
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseField:I

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 51
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadata:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseField:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadataBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 55
    :cond_0
    iget v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseField:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseField:I

    .line 56
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const-string v0, "MetaInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadata:Z

    .line 65
    :cond_0
    return-void
.end method

.method public parseGetMetaDataResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/MetaDataResponseBean;
    .locals 3
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "response"    # Ljava/lang/String;

    .prologue
    .line 19
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadataBuffer:Ljava/lang/StringBuffer;

    .line 22
    :try_start_0
    invoke-static {p2, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move-object v1, p1

    .line 27
    check-cast v1, Lcom/belkin/beans/MetaDataResponseBean;

    .line 28
    .local v1, "object":Lcom/belkin/beans/MetaDataResponseBean;
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadataBuffer:Ljava/lang/StringBuffer;

    if-eqz v2, :cond_0

    .line 29
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadataBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/beans/MetaDataResponseBean;->setMetadata(Ljava/lang/String;)V

    .line 31
    :cond_0
    return-object v1

    .line 23
    .end local v1    # "object":Lcom/belkin/beans/MetaDataResponseBean;
    :catch_0
    move-exception v0

    .line 24
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
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
    .line 39
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 40
    const-string v0, "MetaInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->metadata:Z

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseField:I

    .line 45
    :cond_0
    return-void
.end method
