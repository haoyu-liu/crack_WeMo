.class public Lcom/belkin/wemo/localsdk/parser/Parser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "Parser.java"


# static fields
.field public static final getDBPath:I = 0xc

.field public static uPnPActionCommands:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput v0, Lcom/belkin/wemo/localsdk/parser/Parser;->uPnPActionCommands:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V
    .locals 1
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "uPnPActionCommands"    # I
    .param p3, "response"    # Ljava/lang/String;

    .prologue
    .line 20
    packed-switch p2, :pswitch_data_0

    .line 30
    :goto_0
    return-void

    .line 23
    :pswitch_0
    new-instance v0, Lcom/belkin/wemo/localsdk/parser/GetRulesDBPathResponse;

    invoke-direct {v0}, Lcom/belkin/wemo/localsdk/parser/GetRulesDBPathResponse;-><init>()V

    .line 24
    .local v0, "rulesDBPathResponse":Lcom/belkin/wemo/localsdk/parser/GetRulesDBPathResponse;
    invoke-virtual {v0, p1, p3}, Lcom/belkin/wemo/localsdk/parser/GetRulesDBPathResponse;->parseGetRulesDBPathResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;

    goto :goto_0

    .line 20
    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
    .end packed-switch
.end method
