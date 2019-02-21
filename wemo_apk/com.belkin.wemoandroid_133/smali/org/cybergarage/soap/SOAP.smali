.class public Lorg/cybergarage/soap/SOAP;
.super Ljava/lang/Object;
.source "SOAP.java"


# static fields
.field public static final BODY:Ljava/lang/String; = "Body"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "text/xml; charset=\"utf-8\""

.field public static final DELIM:Ljava/lang/String; = ":"

.field public static final DETAIL:Ljava/lang/String; = "detail"

.field public static final ENCSTYLE_URL:Ljava/lang/String; = "http://schemas.xmlsoap.org/soap/encoding/"

.field public static final ENVELOPE:Ljava/lang/String; = "Envelope"

.field public static final ERROR_CODE:Ljava/lang/String; = "errorCode"

.field public static final ERROR_DESCRIPTION:Ljava/lang/String; = "errorDescription"

.field public static final FAULT:Ljava/lang/String; = "Fault"

.field public static final FAULTACTOR:Ljava/lang/String; = "faultactor"

.field public static final FAULT_CODE:Ljava/lang/String; = "faultcode"

.field public static final FAULT_STRING:Ljava/lang/String; = "faultstring"

.field public static final METHODNS:Ljava/lang/String; = "u"

.field public static final RESPONSE:Ljava/lang/String; = "Response"

.field public static final RESULTSTATUS:Ljava/lang/String; = "ResultStatus"

.field public static final UPNP_ERROR:Ljava/lang/String; = "UPnPError"

.field public static final VERSION_HEADER:Ljava/lang/String; = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

.field public static final XMLNS:Ljava/lang/String; = "s"

.field public static final XMLNS_URL:Ljava/lang/String; = "http://schemas.xmlsoap.org/soap/envelope/"

.field private static xmlParser:Lorg/cybergarage/xml/Parser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createEnvelopeBodyNode()Lorg/cybergarage/xml/Node;
    .locals 4

    .prologue
    .line 55
    new-instance v1, Lorg/cybergarage/xml/Node;

    const-string v2, "s:Envelope"

    invoke-direct {v1, v2}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 56
    .local v1, "envNode":Lorg/cybergarage/xml/Node;
    const-string v2, "xmlns:s"

    const-string v3, "http://schemas.xmlsoap.org/soap/envelope/"

    invoke-virtual {v1, v2, v3}, Lorg/cybergarage/xml/Node;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v2, "s:encodingStyle"

    const-string v3, "http://schemas.xmlsoap.org/soap/encoding/"

    invoke-virtual {v1, v2, v3}, Lorg/cybergarage/xml/Node;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    new-instance v0, Lorg/cybergarage/xml/Node;

    const-string v2, "s:Body"

    invoke-direct {v0, v2}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 61
    .local v0, "bodyNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v1, v0}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 63
    return-object v1
.end method

.method public static final getXMLParser()Lorg/cybergarage/xml/Parser;
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lorg/cybergarage/soap/SOAP;->xmlParser:Lorg/cybergarage/xml/Parser;

    return-object v0
.end method

.method public static final setXMLParser(Lorg/cybergarage/xml/Parser;)V
    .locals 0
    .param p0, "parser"    # Lorg/cybergarage/xml/Parser;

    .prologue
    .line 74
    sput-object p0, Lorg/cybergarage/soap/SOAP;->xmlParser:Lorg/cybergarage/xml/Parser;

    .line 75
    return-void
.end method
