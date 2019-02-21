.class public Lcom/belkin/beans/ValueFromSoapResponse;
.super Ljava/lang/Object;
.source "ValueFromSoapResponse.java"


# instance fields
.field private mStrValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/beans/ValueFromSoapResponse;->mStrValue:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getStrValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 8
    iget-object v0, p0, Lcom/belkin/beans/ValueFromSoapResponse;->mStrValue:Ljava/lang/String;

    return-object v0
.end method

.method public setStrValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "strValue"    # Ljava/lang/String;

    .prologue
    .line 12
    iput-object p1, p0, Lcom/belkin/beans/ValueFromSoapResponse;->mStrValue:Ljava/lang/String;

    .line 13
    return-void
.end method
