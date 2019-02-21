.class public Lcom/belkin/wemo/upnp/parser/RMParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RMParser.java"


# static fields
.field public static final FetchRules:I = 0xb

.field public static final GetRulesDBPath:I = 0x2

.field public static final GetRulesDBVersion:I = 0x1

.field public static final StoreRules:I = 0xc

.field public static uPnPActionCommands:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput v0, Lcom/belkin/wemo/upnp/parser/RMParser;->uPnPActionCommands:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public uPnPResponseParser(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;ILjava/lang/String;)V
    .locals 1
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
    .param p2, "uPnPActionCommands"    # I
    .param p3, "response"    # Ljava/lang/String;

    .prologue
    .line 26
    const/4 v0, 0x0

    .line 28
    .local v0, "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    sparse-switch p2, :sswitch_data_0

    .line 45
    :goto_0
    invoke-virtual {v0, p3}, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .line 46
    return-void

    .line 31
    :sswitch_0
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;

    .end local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 32
    .restart local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    goto :goto_0

    .line 34
    :sswitch_1
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;

    .end local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 35
    .restart local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    goto :goto_0

    .line 37
    :sswitch_2
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;

    .end local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 38
    .restart local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    goto :goto_0

    .line 40
    :sswitch_3
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBPathResponseParser;

    .end local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBPathResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 41
    .restart local v0    # "parser":Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
    goto :goto_0

    .line 28
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_3
        0xb -> :sswitch_0
        0xc -> :sswitch_1
    .end sparse-switch
.end method
