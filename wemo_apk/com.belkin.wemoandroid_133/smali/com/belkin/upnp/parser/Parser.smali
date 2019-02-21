.class public Lcom/belkin/upnp/parser/Parser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "Parser.java"


# static fields
.field public static final fetchRules:I = 0x11

.field public static final getAPListResp:I = 0x1

.field public static final getBinaryStateResp:I = 0x8

.field public static final getCloseSetupResp:I = 0x3

.field public static final getDBPath:I = 0xc

.field public static final getDBVersion:I = 0xd

.field public static final getFirmwareVersionResp:I = 0x6

.field public static final getFriendlyNameResp:I = 0x4

.field public static final getIconURLResp:I = 0x5

.field public static final getMetaDataResp:I = 0x9

.field public static final getNetworkListResp:I = 0xf

.field public static final getNetworkStatusResp:I = 0x2

.field public static final getRemoteAccessRegistrationResp:I = 0xa

.field public static final getRemoteAccesspluginListResp:I = 0xb

.field public static final getSignalStrengthResp:I = 0xe

.field public static final getStatusResp:I = 0x7

.field public static final getValueFromSOAP:I = 0x10

.field public static final storeRules:I = 0x12

.field public static uPnPActionCommands:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    sput v0, Lcom/belkin/upnp/parser/Parser;->uPnPActionCommands:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V
    .locals 10
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "uPnPActionCommands"    # I
    .param p3, "response"    # Ljava/lang/String;

    .prologue
    .line 39
    packed-switch p2, :pswitch_data_0

    .line 85
    :goto_0
    :pswitch_0
    return-void

    .line 42
    :pswitch_1
    new-instance v2, Lcom/belkin/upnp/parser/GetFriendlyNameResponse;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetFriendlyNameResponse;-><init>()V

    .line 43
    .local v2, "friendlyNameResponse":Lcom/belkin/upnp/parser/GetFriendlyNameResponse;
    invoke-virtual {v2, p1, p3}, Lcom/belkin/upnp/parser/GetFriendlyNameResponse;->parseGetFriendlyNameResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/FriendlyNameResponseBean;

    goto :goto_0

    .line 46
    .end local v2    # "friendlyNameResponse":Lcom/belkin/upnp/parser/GetFriendlyNameResponse;
    :pswitch_2
    new-instance v0, Lcom/belkin/upnp/parser/GetAPListResponse;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/GetAPListResponse;-><init>()V

    .line 47
    .local v0, "apListResponse":Lcom/belkin/upnp/parser/GetAPListResponse;
    invoke-virtual {v0, p1, p3}, Lcom/belkin/upnp/parser/GetAPListResponse;->parseForAPList(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/APListResponseBean;

    goto :goto_0

    .line 50
    .end local v0    # "apListResponse":Lcom/belkin/upnp/parser/GetAPListResponse;
    :pswitch_3
    new-instance v5, Lcom/belkin/upnp/parser/GetAPListResponse;

    invoke-direct {v5}, Lcom/belkin/upnp/parser/GetAPListResponse;-><init>()V

    .line 51
    .local v5, "networkListResponse":Lcom/belkin/upnp/parser/GetAPListResponse;
    invoke-virtual {v5, p1, p3}, Lcom/belkin/upnp/parser/GetAPListResponse;->parseForNetworkList(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/APListResponseBean;

    goto :goto_0

    .line 54
    .end local v5    # "networkListResponse":Lcom/belkin/upnp/parser/GetAPListResponse;
    :pswitch_4
    new-instance v8, Lcom/belkin/upnp/parser/GetSignalStrengthResponse;

    invoke-direct {v8}, Lcom/belkin/upnp/parser/GetSignalStrengthResponse;-><init>()V

    .line 55
    .local v8, "signalStrengthResponse":Lcom/belkin/upnp/parser/GetSignalStrengthResponse;
    invoke-virtual {v8, p1, p3}, Lcom/belkin/upnp/parser/GetSignalStrengthResponse;->parseForSignalStrength(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/SignalStrengthResponseBean;

    goto :goto_0

    .line 58
    .end local v8    # "signalStrengthResponse":Lcom/belkin/upnp/parser/GetSignalStrengthResponse;
    :pswitch_5
    new-instance v3, Lcom/belkin/upnp/parser/GetFirmwareResponse;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/GetFirmwareResponse;-><init>()V

    .line 59
    .local v3, "getFirmwareResp":Lcom/belkin/upnp/parser/GetFirmwareResponse;
    invoke-virtual {v3, p1, p3}, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseGetFirmwareResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/FirmwareVersionResponseBean;

    goto :goto_0

    .line 62
    .end local v3    # "getFirmwareResp":Lcom/belkin/upnp/parser/GetFirmwareResponse;
    :pswitch_6
    new-instance v4, Lcom/belkin/upnp/parser/GetMetaDataResponse;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/GetMetaDataResponse;-><init>()V

    .line 63
    .local v4, "metadataResponse":Lcom/belkin/upnp/parser/GetMetaDataResponse;
    invoke-virtual {v4, p1, p3}, Lcom/belkin/upnp/parser/GetMetaDataResponse;->parseGetMetaDataResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/MetaDataResponseBean;

    goto :goto_0

    .line 66
    .end local v4    # "metadataResponse":Lcom/belkin/upnp/parser/GetMetaDataResponse;
    :pswitch_7
    new-instance v6, Lcom/belkin/upnp/parser/GetRulesDBPathResponse;

    invoke-direct {v6}, Lcom/belkin/upnp/parser/GetRulesDBPathResponse;-><init>()V

    .line 67
    .local v6, "rulesDBPathResponse":Lcom/belkin/upnp/parser/GetRulesDBPathResponse;
    invoke-virtual {v6, p1, p3}, Lcom/belkin/upnp/parser/GetRulesDBPathResponse;->parseGetRulesDBPathResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/rules/beans/RulesDBPathResponseBean;

    goto :goto_0

    .line 70
    .end local v6    # "rulesDBPathResponse":Lcom/belkin/upnp/parser/GetRulesDBPathResponse;
    :pswitch_8
    new-instance v7, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;

    invoke-direct {v7}, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;-><init>()V

    .line 71
    .local v7, "rulesDBVersionResponse":Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;
    invoke-virtual {v7, p1, p3}, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseGetRulesDBVersionResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/rules/beans/RulesDBVersionResponseBean;

    goto :goto_0

    .line 74
    .end local v7    # "rulesDBVersionResponse":Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;
    :pswitch_9
    new-instance v1, Lcom/belkin/upnp/parser/FetchRulesResponse;

    invoke-direct {v1}, Lcom/belkin/upnp/parser/FetchRulesResponse;-><init>()V

    .line 75
    .local v1, "fetchRulesResponse":Lcom/belkin/upnp/parser/FetchRulesResponse;
    invoke-virtual {v1, p1, p3}, Lcom/belkin/upnp/parser/FetchRulesResponse;->parseResponse(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 78
    .end local v1    # "fetchRulesResponse":Lcom/belkin/upnp/parser/FetchRulesResponse;
    :pswitch_a
    new-instance v9, Lcom/belkin/upnp/parser/StoreRulesResponse;

    invoke-direct {v9}, Lcom/belkin/upnp/parser/StoreRulesResponse;-><init>()V

    .line 79
    .local v9, "storeRulesResponse":Lcom/belkin/upnp/parser/StoreRulesResponse;
    invoke-virtual {v9, p1, p3}, Lcom/belkin/upnp/parser/StoreRulesResponse;->parseResponse(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 39
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public uPnPResponseParserSOAP(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "uPnPActionCommands"    # I
    .param p3, "response"    # Ljava/lang/String;
    .param p4, "attribute"    # Ljava/lang/String;

    .prologue
    .line 88
    packed-switch p2, :pswitch_data_0

    .line 99
    :goto_0
    return-void

    .line 91
    :pswitch_0
    new-instance v0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;-><init>()V

    .line 92
    .local v0, "value":Lcom/belkin/upnp/parser/GetValueFromSoapResponse;
    iput-object p4, v0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->ATTRIBUTE:Ljava/lang/String;

    .line 93
    invoke-virtual {v0, p1, p3}, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->parseGetValueFromSOAP(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/ValueFromSoapResponse;

    goto :goto_0

    .line 88
    nop

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_0
    .end packed-switch
.end method
