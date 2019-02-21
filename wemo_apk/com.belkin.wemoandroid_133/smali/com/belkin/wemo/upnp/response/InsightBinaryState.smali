.class public Lcom/belkin/wemo/upnp/response/InsightBinaryState;
.super Ljava/lang/Object;
.source "InsightBinaryState.java"


# instance fields
.field private binaryState:Ljava/lang/String;

.field private brightness:Ljava/lang/String;

.field private fader:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method public getBinaryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->binaryState:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->binaryState:Ljava/lang/String;

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->binaryState:Ljava/lang/String;

    return-object v0
.end method

.method public getBrightness()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->brightness:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->brightness:Ljava/lang/String;

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->brightness:Ljava/lang/String;

    return-object v0
.end method

.method public getFader()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->fader:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->fader:Ljava/lang/String;

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->fader:Ljava/lang/String;

    return-object v0
.end method

.method public setBinaryState(Ljava/lang/String;)V
    .locals 0
    .param p1, "binaryState"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->binaryState:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setBrightness(Ljava/lang/String;)V
    .locals 0
    .param p1, "brightness"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->brightness:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setFader(Ljava/lang/String;)V
    .locals 0
    .param p1, "fader"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->fader:Ljava/lang/String;

    .line 47
    return-void
.end method
